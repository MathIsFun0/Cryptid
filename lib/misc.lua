--Localization colors
local lc = loc_colour
function loc_colour(_c, _default)
	if not G.ARGS.LOC_COLOURS then
		lc()
	end
	G.ARGS.LOC_COLOURS.cry_code = G.C.SET.Code
	G.ARGS.LOC_COLOURS.heart = G.C.SUITS.Hearts
	G.ARGS.LOC_COLOURS.diamond = G.C.SUITS.Diamonds
	G.ARGS.LOC_COLOURS.spade = G.C.SUITS.Spades
	G.ARGS.LOC_COLOURS.club = G.C.SUITS.Clubs
	for k, v in pairs(G.C) do
		if string.len(k) > 4 and string.sub(k, 1, 4) == 'CRY_' then
			G.ARGS.LOC_COLOURS[string.lower(k)] = v
		end
	end
	return lc(_c, _default)
end

-- Midground sprites - used for Exotic Jokers and Gateway
-- don't really feel like explaining this deeply, it's based on code for The Soul and Legendary Jokers
local set_spritesref = Card.set_sprites
function Card:set_sprites(_center, _front)
	set_spritesref(self, _center, _front)
	if _center and _center.name == "cry-Gateway" then
		self.children.floating_sprite = Sprite(
			self.T.x,
			self.T.y,
			self.T.w,
			self.T.h,
			G.ASSET_ATLAS[_center.atlas or _center.set],
			{ x = 2, y = 0 }
		)
		self.children.floating_sprite.role.draw_major = self
		self.children.floating_sprite.states.hover.can = false
		self.children.floating_sprite.states.click.can = false
		self.children.floating_sprite2 = Sprite(
			self.T.x,
			self.T.y,
			self.T.w,
			self.T.h,
			G.ASSET_ATLAS[_center.atlas or _center.set],
			{ x = 1, y = 0 }
		)
		self.children.floating_sprite2.role.draw_major = self
		self.children.floating_sprite2.states.hover.can = false
		self.children.floating_sprite2.states.click.can = false
	end
	if _center and _center.soul_pos and _center.soul_pos.extra then
		self.children.floating_sprite2 = Sprite(
			self.T.x,
			self.T.y,
			self.T.w,
			self.T.h,
			G.ASSET_ATLAS[_center.atlas or _center.set],
			_center.soul_pos.extra
		)
		self.children.floating_sprite2.role.draw_major = self
		self.children.floating_sprite2.states.hover.can = false
		self.children.floating_sprite2.states.click.can = false
	end
end

function cry_edition_to_table(edition) -- look mom i figured it out (this does NOT need to be a function)
	if edition then
		return { [edition] = true }
	end
end

-- check if Director's Cut or Retcon offers a cheaper reroll price
function cry_cheapest_boss_reroll()
	local dcut = G.GAME.cry_voucher_centers["v_directors_cut"].config.extra or 1e308
	local retc = G.GAME.cry_voucher_centers["v_retcon"].config.extra or 1e308
	if dcut < retc then
		return dcut
	else
		return retc
	end
end

-- generate a random edition (e.g. Antimatter Deck)
function cry_poll_random_edition()
	local random_edition = pseudorandom_element(G.P_CENTER_POOLS.Edition, pseudoseed("cry_ant_edition"))
	while random_edition.key == "e_base" do
		random_edition = pseudorandom_element(G.P_CENTER_POOLS.Edition, pseudoseed("cry_ant_edition"))
	end
	ed_table = { [random_edition.key:sub(3)] = true }
	return ed_table
end

-- gets a random, valid consumeable (used for Hammerspace, CCD Deck, Blessing, etc.)
function get_random_consumable(seed, excluded_flags, unbalanced, pool)
	-- set up excluded flags - these are the kinds of consumables we DON'T want to have generating
	excluded_flags = excluded_flags or unbalanced and { "no_doe", "no_grc" } or { "hidden", "no_doe", "no_grc" }
	local selection = "n/a"
	local passes = 0
	local tries = 500
	while true do
		tries = tries - 1
		passes = 0
		-- create a random consumable naively
		local key = pseudorandom_element(pool or G.P_CENTER_POOLS.Consumeables, pseudoseed(seed or "grc")).key
		selection = G.P_CENTERS[key]
		-- check if it is valid
		for k, v in pairs(excluded_flags) do
			if not center_no(selection, v, key, true) then
				passes = passes + 1
			end
		end
		-- use it if it's valid or we've run out of attempts
		if passes >= #excluded_flags or tries <= 0 then
			return selection
		end
	end
end

function Card:is_jolly()
	local check = false
	if self.ability.name == "Jolly Joker" then
		check = true
	end
	if self.edition and self.edition.key == "e_cry_m" then
		check = true
	end

	--[[
	Some scenarios/ examples I used for testing this (These DO work as intended if not commented out)
	if next(find_joker("cry-mneon")) then
		check = true
	end
	if G.GAME.blind.boss then
		check = true
	end
	]]
	--
	return check
end

function cry_with_deck_effects(card, func)
	if not card.added_to_deck then
		return func(card)
	else
		card:remove_from_deck(true)
		local ret = func(card)
		card:add_to_deck(true)
		return ret
	end
end

function cry_deep_copy(obj, seen)
	if type(obj) ~= "table" then
		return obj
	end
	if seen and seen[obj] then
		return seen[obj]
	end
	local s = seen or {}
	local res = setmetatable({}, getmetatable(obj))
	s[obj] = res
	for k, v in pairs(obj) do
		res[cry_deep_copy(k, s)] = cry_deep_copy(v, s)
	end
	return res
end

function SMODS.current_mod.reset_game_globals(run_start)
	G.GAME.cry_ach_conditions = G.GAME.cry_ach_conditions or {}
end

--Used for m vouchers, perhaps this can have more applications in the future
function get_m_jokers()
	local mcount = 0
	if G.jokers then
		for i = 1, #G.jokers.cards do
			if G.jokers.cards[i].ability.effect == "M Joker" then
				mcount = mcount + 1
			end
			if G.jokers.cards[i].ability.name == "cry-mprime" then
				mcount = mcount + 1
			end
		end
	end
	return mcount
end

-- Check G.GAME as well as joker info for banned keys
function Card:no(m, no_no)
	if no_no then
		-- Infinifusion Compat
		if self.infinifusion then
			for i = 1, #self.infinifusion do
				if G.P_CENTERS[self.infinifusion[i].key][m] or (G.GAME and G.GAME[m] and G.GAME[m][self.infinifusion[i].key]) then
					return true
				end
			end
			return false
		end
		if not self.config then
			--assume this is from one component of infinifusion
			return G.P_CENTERS[self.key][m] or (G.GAME and G.GAME[m] and G.GAME[m][self.key])
		end

		return self.config.center[m] or (G.GAME and G.GAME[m] and G.GAME[m][self.config.center_key]) or false
	end
	return Card.no(self, "no_"..m, true)
end

function center_no(center, m, key, no_no)
	if no_no then
		return center[m] or (G.GAME and G.GAME[m] and G.GAME[m][key]) or false
	end
	return center_no(center, "no_"..m, key, true)
end


--todo: move to respective stake file
--[from pre-refactor] make this always active to prevent crashes
function cry_apply_ante_tax()
	if G.GAME.modifiers.cry_ante_tax then
		local tax = math.max(
			0,
			math.min(G.GAME.modifiers.cry_ante_tax_max, math.floor(G.GAME.modifiers.cry_ante_tax * G.GAME.dollars))
		)
		ease_dollars(-1 * tax)
		return true
	end
	return false
end

--Changes main menu colors and stuff
--has to be modified with new enabling system
if true then --Cryptid.enabled["Menu"] then
	local oldfunc = Game.main_menu
	Game.main_menu = function(change_context)
		local ret = oldfunc(change_context)
        -- adds a Cryptid spectral to the main menu
		local newcard = create_card('Spectral',G.title_top, nil, nil, nil, nil, 'c_cryptid', 'elial1')
		-- recenter the title
        G.title_top.T.w = G.title_top.T.w*1.7675
		G.title_top.T.x = G.title_top.T.x - 0.8
		G.title_top:emplace(newcard)
        -- make the card look the same way as the title screen Ace of Spades
		newcard.T.w = newcard.T.w * 1.1*1.2
		newcard.T.h = newcard.T.h *1.1*1.2
		newcard.no_ui = true

        -- make the title screen use different background colors
		G.SPLASH_BACK:define_draw_steps({{
			shader = 'splash',
			send = {
				{name = 'time', ref_table = G.TIMERS, ref_value = 'REAL_SHADER'},
				{name = 'vort_speed', val = 0.4},
				{name = 'colour_1', ref_table = G.C, ref_value = 'CRY_EXOTIC'},
				{name = 'colour_2', ref_table = G.C, ref_value = 'DARK_EDITION'},
			}}})
		return ret
	end
end
function Cryptid.get_food(seed)
    local food_keys = {}  
    for k, v in pairs(Cryptid.food) do  
        if G.GAME.banned_keys[v] then
            table.insert(food_keys, v)  
        end
    end
    if #food_keys <= 0 then
		return "j_reserved_parking"
    else
    	return pseudorandom_element(food_keys, pseudoseed(seed)) 
    end
end