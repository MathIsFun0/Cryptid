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
		if string.len(k) > 4 and string.sub(k, 1, 4) == "CRY_" then
			G.ARGS.LOC_COLOURS[string.lower(k)] = v
		end
	end
	return lc(_c, _default)
end

-- More advanced version of find joker for things that need to find very specific things
function advanced_find_joker(name, rarity, edition, ability, non_debuff)
	local jokers = {}
	if not G.jokers or not G.jokers.cards then return {} end
	local filter = 0
	if name then filter = filter + 1 end
	if edition then filter = filter + 1 end
	if type(rarity) ~= "table" then
		if type(rarity) == "string" then 
			rarity = { rarity }
		else
			rarity = nil
		end
	end
	if rarity then filter = filter + 1 end
	if type(ability) ~= "table" then
		if type(ability) == "string" then 
			ability = { ability }
		else
			ability = nil
		end
	end
	if ability then filter = filter + 1 end
	-- return nothing if function is called with no useful arguments
	if filter == 0 then return {} end
	for k, v in pairs(G.jokers.cards) do
		if v and type(v) == 'table' and (non_debuff or not v.debuff) then
			local check = 0
			if name and v.ability.name == name then check = check + 1 end
			if edition and (v.edition and v.edition.key == edition) --[[ make this use safe_get later? if it's possible anyways]] then check = check + 1 end
			if rarity then
				--Passes as valid if rarity matches ANY of the values in the rarity table
				for _, a in ipairs(rarity) do
					if v.config.center.rarity == a then
						check = check + 1
						break
					end
				end
			end
			if ability then
				--Only passes if the joker has everything in the ability table
				local abilitycheck = true
				for _, b in ipairs(ability) do
					if not v.ability[b] then
						abilitycheck = false
						break
					end
				end
				if abilitycheck then check = check + 1 end
			end
			if check == filter then table.insert(jokers, v) end
		end
	end
	for k, v in pairs(G.consumeables.cards) do
		if v and type(v) == 'table' and (non_debuff or not v.debuff) then
			local check = 0
			if name and v.ability.name == name then check = check + 1 end
			if edition and (v.edition and v.edition.key == edition) --[[ make this use safe_get later? if it's possible anyways]] then check = check + 1 end
			if ability then
				--Only passes if the joker has everything in the ability table
				local abilitycheck = true
				for _, b in ipairs(ability) do
					if not v.ability[b] then
						abilitycheck = false
						break
					end
				end
				if abilitycheck then check = check + 1 end
			end
			--Consumables don't have a rarity, so this should ignore it in that case (untested lmfao)
			if check == filter then table.insert(jokers, v) end
		end
	end
	return jokers
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
function get_random_consumable(seed, excluded_flags, banned_card, pool, no_undiscovered)
	-- set up excluded flags - these are the kinds of consumables we DON'T want to have generating
	excluded_flags = excluded_flags or { "hidden", "no_doe", "no_grc" }
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
		if selection.discovered or not no_undiscovered then
			for k, v in pairs(excluded_flags) do
				if not center_no(selection, v, key, true) then
					--Makes the consumable invalid if it's a specific card unless it's set to
					--I use this so cards don't create copies of themselves (eg potential inf Blessing chain, Hammerspace from Hammerspace...)
					if not banned_card or (banned_card and banned_card ~= key) then
						passes = passes + 1
					end
				end
			end
		end
		-- use it if it's valid or we've run out of attempts
		if passes >= #excluded_flags or tries <= 0 then
			if tries <= 0 and no_undiscovered then
				return G.P_CENTERS["c_strength"]
			else
				return selection
			end
		end
	end
end

-- checks for Jolly Jokers or cards that are supposed to be treated as jolly jokers
function Card:is_jolly()
	if self.ability.name == "Jolly Joker" then
		return true
	end
	if self.edition and self.edition.key == "e_cry_m" then
		return true
	end
	return false
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
				if
					G.P_CENTERS[self.infinifusion[i].key][m]
					or (G.GAME and G.GAME[m] and G.GAME[m][self.infinifusion[i].key])
				then
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
	return Card.no(self, "no_" .. m, true)
end

function center_no(center, m, key, no_no)
	if no_no then
		return center[m] or (G.GAME and G.GAME[m] and G.GAME[m][key]) or false
	end
	return center_no(center, "no_" .. m, key, true)
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
		local newcard = create_card("Spectral", G.title_top, nil, nil, nil, nil, "c_cryptid", "elial1")
		-- recenter the title
		G.title_top.T.w = G.title_top.T.w * 1.7675
		G.title_top.T.x = G.title_top.T.x - 0.8
		G.title_top:emplace(newcard)
		-- make the card look the same way as the title screen Ace of Spades
		newcard.T.w = newcard.T.w * 1.1 * 1.2
		newcard.T.h = newcard.T.h * 1.1 * 1.2
		newcard.no_ui = true

		-- make the title screen use different background colors
		G.SPLASH_BACK:define_draw_steps({
			{
				shader = "splash",
				send = {
					{ name = "time", ref_table = G.TIMERS, ref_value = "REAL_SHADER" },
					{ name = "vort_speed", val = 0.4 },
					{ name = "colour_1", ref_table = G.C, ref_value = "CRY_EXOTIC" },
					{ name = "colour_2", ref_table = G.C, ref_value = "DARK_EDITION" },
				},
			},
		})
		return ret
	end
end

-- blatant copypasting from old Cryptid.lua's food joker handling
local jokers = {
	"j_gros_michel",
	"j_egg",
	"j_ice_cream",
	"j_cavendish",
	"j_turtle_bean",
	"j_diet_cola",
	"j_popcorn",
	"j_ramen",
	"j_selzer",
}

food = {}

-- these may not be effective, as configs aren't done yet, to my knowledge
-- however, from some minor testing, they still get added, therefore, are OK to be left for when it *eventually* gets added
if Cryptid.enabled["Misc. Jokers"] then
	jokers[#jokers + 1] = "j_cry_pickle"
	jokers[#jokers + 1] = "j_cry_chili_pepper"
end
if Cryptid.enabled["Epic Jokers"] then
	jokers[#jokers + 1] = "j_cry_oldcandy"
	jokers[#jokers + 1] = "j_cry_caramel"
end
if Cryptid.enabled["M Jokers"] then
	jokers[#jokers + 1] = "j_cry_foodm"
end
if Cryptid.enabled["Spooky"] then
	jokers[#jokers + 1] = "j_cry_cotton_candy"
	jokers[#jokers + 1] = "j_cry_wrapped"
	jokers[#jokers + 1] = "j_cry_candy_cane"
	jokers[#jokers + 1] = "j_cry_candy_buttons"
	jokers[#jokers + 1] = "j_cry_jawbreaker"
	jokers[#jokers + 1] = "j_cry_mellowcreme"
	jokers[#jokers + 1] = "j_cry_brittle"
end

for i = 1, #jokers do
	food[#food+1] = jokers[i]
end

function Cryptid.get_food(seed)
	local food_keys = {}

	for k, v in pairs(food) do
		if not G.GAME.banned_keys[v] and G.P_CENTERS[v] then
			table.insert(food_keys, v)
		end
	end

	if #food_keys <= 0 then
		return "j_gros_michel" -- in honor of Nova
	else
		return pseudorandom_element(food_keys, pseudoseed(seed))
	end
end

-- just dumping this garbage here
-- this just ensures that extra voucher slots work as expected
function cry_bonusvouchermod(mod)
	if not G.GAME.shop then return end
	G.GAME.cry_bonusvouchercount = G.GAME.cry_bonusvouchercount + mod
	if G.shop_jokers and G.shop_jokers.cards then
		G.shop:recalculate()
		if mod > 0 then		-- not doing minus mod because it'd be janky and who really cares
			for i = 1, G.GAME.cry_bonusvouchercount+1 - #G.shop_vouchers.cards do
				local curr_bonus = G.GAME.current_round.cry_bonusvouchers
				curr_bonus[#curr_bonus+1] = get_next_voucher_key()
				
				
				-- this could be a function but it's done like what... 3 times? it doesn't matter rn
				
				local card = Card(G.shop_vouchers.T.x + G.shop_vouchers.T.w/2,
					G.shop_vouchers.T.y, G.CARD_W, G.CARD_H, G.P_CARDS.empty, G.P_CENTERS[curr_bonus[#curr_bonus]],{bypass_discovery_center = true, bypass_discovery_ui = true})
				card.shop_cry_bonusvoucher = #curr_bonus
				cry_misprintize(card)
				if G.GAME.events.ev_cry_choco2 then
					card.misprint_cost_fac = (card.misprint_cost_fac or 1) * 2
					card:set_cost()
				end
				if G.GAME.modifiers.cry_enable_flipped_in_shop and pseudorandom('cry_flip_vouch'..G.GAME.round_resets.ante) > 0.7 then
					card.cry_flipped = true
				end
				create_shop_card_ui(card, 'Voucher', G.shop_vouchers)
				card:start_materialize()
				if G.GAME.current_round.cry_voucher_edition then
					card:set_edition(G.GAME.current_round.cry_voucher_edition, true, true)
				end
				G.shop_vouchers.config.card_limit = G.shop_vouchers.config.card_limit + 1
				G.shop_vouchers:emplace(card)
			end
		end
	end
end

Cryptid.big_num_whitelist = {
	j_ride_the_bus = true,
	j_egg = true,
	j_runner = true,
	j_ice_cream = true,
	j_constellation = true,
	j_green_joker = true,
	j_red_card = true,
	j_madness = true,
	j_square = true,
	j_vampire = true,
	j_hologram = true,
	j_obelisk = true,
	j_turtle_bean = true,
	j_lucky_cat = true,
	j_flash = true,
	j_popcorn = true,
	j_trousers = true,
	j_ramen = true,
	j_castle = true,
	j_campfire = true,
	j_throwback = true,
	j_glass = true,
	j_wee = true,
	j_hit_the_road = true,
	j_caino = true,
	j_yorick = true,
	-- Once all Cryptid Jokers get support for this, these can be removed
	j_cry_dropshot = true,
	j_cry_wee_fib = true,
	j_cry_whip = true,
	j_cry_pickle = true,
	j_cry_chili_pepper = true,
	j_cry_cursor = true,
	j_cry_jimball = true,
	j_cry_eternalflame = true,
	j_cry_fspinner = true,
	j_cry_krustytheclown = true,
	j_cry_antennastoheaven = true,
	j_cry_mondrian = true,
	j_cry_spaceglobe = true,
	j_cry_m = true,
	j_cry_exponentia = true,
	j_cry_crustulum = true,
	j_cry_primus = true,
	j_cry_stella_mortis = true,
	j_cry_hugem = true,
	j_cry_mprime = true,
}

function is_card_big(joker)
	local center = joker.config and joker.config.center
	if not center then return false end
	return Cryptid.big_num_whitelist[center.key or "Nope!"] --[[or
	       (center.mod and center.mod.id == "Cryptid" and not center.no_break_infinity) or center.break_infinity--]]
end

--Utility function to check things without erroring
function safe_get(t, ...)
	local current = t
	for _, k in ipairs({...}) do
		if current[k] == nil then
		return false
		end
		current = current[k]
	end
	return current
end
--Functions used by boss blinds
function Blind:cry_ante_base_mod(dt)
	if not self.disabled then
		local obj = self.config.blind
		if obj.cry_ante_base_mod and type(obj.cry_ante_base_mod) == "function" then
			return obj:cry_ante_base_mod(dt)
		end
	end
	return 0
end
function Blind:cry_round_base_mod(dt)
	if not self.disabled then
		local obj = self.config.blind
		if obj.cry_round_base_mod and type(obj.cry_round_base_mod) == "function" then
			return obj:cry_round_base_mod(dt)
		end
	end
	return 1
end
function Blind:cry_cap_score(score)
	if not self.disabled then
		local obj = self.config.blind
		if obj.cry_cap_score and type(obj.cry_cap_score) == "function" then
			return obj:cry_cap_score(score)
		end
	end
	return score
end
function Blind:cry_after_play()
	if not self.disabled then
		local obj = self.config.blind
		if obj.cry_after_play and type(obj.cry_after_play) == "function" then
			return obj:cry_after_play()
		end
	end
end
function Blind:cry_before_play()
	if not self.disabled then
		local obj = self.config.blind
		if obj.cry_before_play and type(obj.cry_before_play) == "function" then
			return obj:cry_before_play()
		end
	end
end
function Blind:cry_calc_ante_gain()
	if G.GAME.modifiers.cry_spooky then --here is the best place to check when spooky should apply
		local card
		if pseudorandom(pseudoseed("cry_spooky_curse")) < G.GAME.modifiers.cry_curse_rate then
			card = create_card("Joker", G.jokers, nil, "cry_cursed", nil, nil, nil, "cry_spooky")
		else
			card = create_card("Joker", G.jokers, nil, "cry_candy", nil, nil, nil, "cry_spooky")
		end
		card:add_to_deck()
		card:start_materialize()
		G.jokers:emplace(card)
	end
	if not self.disabled then
		local obj = self.config.blind
		if obj.cry_calc_ante_gain and type(obj.cry_calc_ante_gain) == "function" then
			return obj:cry_calc_ante_gain()
		end
	end
	return 1
end
