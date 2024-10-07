--- STEAMODDED HEADER
--- MOD_NAME: Cryptid
--- MOD_ID: Cryptid
--- PREFIX: cry
--- MOD_AUTHOR: [MathIsFun_, Cryptid and Balatro Discords]
--- MOD_DESCRIPTION: Adds unbalanced ideas to Balatro.
--- BADGE_COLOUR: 708b91
--- DEPENDENCIES: [Talisman>=2.0.0-beta8, Steamodded>=1.0.0~ALPHA-0917a]
--- VERSION: 0.5.2~1005a
--- PRIORITY: 99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999

----------------------------------------------
------------MOD CODE -------------------------

--Cryptid.debug = true

local mod_path = "" .. SMODS.current_mod.path
-- Load Options
Cryptid_config = SMODS.current_mod.config
Cryptid.enabled = copy_table(Cryptid_config)
--backwards compat moment
cry_enable_jokers = Cryptid.enabled["Misc. Jokers"]
cry_enable_epics = Cryptid.enabled["Epic Jokers"]
cry_enable_exotics = Cryptid.enabled["Exotic Jokers"]
cry_minvasion = Cryptid.enabled["M Jokers"]

-- Custom Rarity setup (based on Relic-Jokers)
Game:set_globals()
G.C.RARITY["cry_exotic"] = HEX("708b91")
G.C.RARITY["cry_epic"] = HEX("571d91")
local ip = SMODS.insert_pool
function SMODS.insert_pool(pool, center, replace)
	if pool == nil then
		pool = {}
	end
	ip(pool, center, replace)
end
local get_badge_colourref = get_badge_colour
function get_badge_colour(key)
	local fromRef = get_badge_colourref(key)
	if key == "cry_exotic" then
		return G.C.RARITY["cry_exotic"]
	end
	if key == "cry_epic" then
		return G.C.RARITY["cry_epic"]
	end
	return fromRef
end

--Changes main menu colors and stuff
if Cryptid.enabled["Menu"] then
	local oldfunc = Game.main_menu
	Game.main_menu = function(change_context)
		local ret = oldfunc(change_context)
		local newcard = create_card('Spectral',G.title_top, nil, nil, nil, nil, 'c_cryptid', 'elial1')
		G.title_top.T.w = G.title_top.T.w*1.7675
		G.title_top.T.x = G.title_top.T.x - 0.8
		G.title_top:emplace(newcard)
		newcard.T.w = newcard.T.w * 1.1*1.2
		newcard.T.h = newcard.T.h *1.1*1.2
		newcard.no_ui = true

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

--Localization colors
local lc = loc_colour
function loc_colour(_c, _default)
	if not G.ARGS.LOC_COLOURS then
		lc()
	end
	G.ARGS.LOC_COLOURS.cry_exotic = G.C.RARITY["cry_exotic"]
	G.ARGS.LOC_COLOURS.cry_epic = G.C.RARITY["cry_epic"]
	G.ARGS.LOC_COLOURS.cry_azure = HEX("1d4fd7")
	G.ARGS.LOC_COLOURS.cry_code = G.C.SET.Code
	G.ARGS.LOC_COLOURS.heart = G.C.SUITS.Hearts
	G.ARGS.LOC_COLOURS.diamond = G.C.SUITS.Diamonds
	G.ARGS.LOC_COLOURS.spade = G.C.SUITS.Spades
	G.ARGS.LOC_COLOURS.club = G.C.SUITS.Clubs
	G.ARGS.LOC_COLOURS.cry_ascendant = G.C.CRY_ASCENDANT
	G.ARGS.LOC_COLOURS.cry_jolly = G.C.CRY_JOLLY
	return lc(_c, _default)
end

-- Midground sprites
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

function cry_debuff_voucher(center) -- sorry for all the mess here...
	local new_center = G.GAME.cry_voucher_centers[center]
	local center_table = {
		name = new_center and new_center.name,
		extra = new_center and new_center.config.extra,
	}
	if center_table.name == "Overstock" or center_table.name == "Overstock Plus" then
		G.E_MANAGER:add_event(Event({
			func = function()
				change_shop_size(-center_table.extra)
				return true
			end,
		}))
	end
	if center_table.name == "Tarot Merchant" or center_table.name == "Tarot Tycoon" then
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.tarot_rate = G.GAME.tarot_rate / center_table.extra
				return true
			end,
		}))
	end
	if center_table.name == "Planet Merchant" or center_table.name == "Planet Tycoon" then
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.planet_rate = G.GAME.planet_rate / center_table.extra
				return true
			end,
		}))
	end
	if center_table.name == "Hone" or center_table.name == "Glow Up" then
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.edition_rate = G.GAME.edition_rate / center_table.extra
				return true
			end,
		}))
	end
	if center_table.name == "Magic Trick" then
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.playing_card_rate = 0
				return true
			end,
		}))
	end
	if center_table.name == "Crystal Ball" then
		G.E_MANAGER:add_event(Event({
			func = function()
				G.consumeables.config.card_limit = G.consumeables.config.card_limit - center_table.extra
				return true
			end,
		}))
	end
	if center_table.name == "Clearance Sale" then
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.discount_percent = 0
				for k, v in pairs(G.I.CARD) do
					if v.set_cost then
						v:set_cost()
					end
				end
				return true
			end,
		}))
	end
	if center_table.name == "Liquidation" then
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.discount_percent = 25
				for k, v in pairs(G.I.CARD) do
					if v.set_cost then
						v:set_cost()
					end
				end
				return true
			end,
		}))
	end
	if center_table.name == "Reroll Surplus" or center_table.name == "Reroll Glut" then
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.round_resets.reroll_cost = G.GAME.round_resets.reroll_cost + center_table.extra
				G.GAME.current_round.reroll_cost = math.max(0, G.GAME.current_round.reroll_cost + center_table.extra)
				return true
			end,
		}))
	end
	if center_table.name == "Seed Money" then
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.interest_cap = 25 --note: does not account for potential deck effects
				return true
			end,
		}))
	end
	if center_table.name == "Money Tree" then
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.interest_cap = G.P_CENTERS.v_seed_money.extra
				return true
			end,
		}))
	end
	if center_table.name == "Grabber" or center_table.name == "Nacho Tong" then
		G.GAME.round_resets.hands = G.GAME.round_resets.hands - center_table.extra
		ease_hands_played(-center_table.extra)
	end
	if center_table.name == "Paint Brush" or center_table.name == "Palette" then
		G.hand:change_size(-center_table.extra)
	end
	if center_table.name == "Wasteful" or center_table.name == "Recyclomancy" then
		G.GAME.round_resets.discards = G.GAME.round_resets.discards - center_table.extra
		ease_discard(-center_table.extra)
	end
	if center_table.name == "Antimatter" then
		G.E_MANAGER:add_event(Event({
			func = function()
				if G.jokers then
					G.jokers.config.card_limit = G.jokers.config.card_limit - center_table.extra
				end
				return true
			end,
		}))
	end
	if center_table.name == "Hieroglyph" or center_table.name == "Petroglyph" then
		ease_ante(center_table.extra)
		G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante
		G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante + center_table.extra

		if center_table.name == "Hieroglyph" then
			G.GAME.round_resets.hands = G.GAME.round_resets.hands + center_table.extra
			ease_hands_played(center_table.extra)
		end
		if center_table.name == "Petroglyph" then
			G.GAME.round_resets.discards = G.GAME.round_resets.discards + center_table.extra
			ease_discard(center_table.extra)
		end
	end
end

function cry_edition_to_table(edition) -- look mom i figured it out (this does NOT need to be a function)
	if edition then
		return { [edition] = true }
	end
end

function cry_cheapest_boss_reroll()
	local dcut = G.GAME.cry_voucher_centers["v_directors_cut"].config.extra or 1e308
	local retc = G.GAME.cry_voucher_centers["v_retcon"].config.extra or 1e308
	if dcut < retc then
		return dcut
	else
		return retc
	end
end

function cry_poll_random_edition()
	local random_edition = pseudorandom_element(G.P_CENTER_POOLS.Edition, pseudoseed("cry_ant_edition"))
	while random_edition.key == "e_base" do
		random_edition = pseudorandom_element(G.P_CENTER_POOLS.Edition, pseudoseed("cry_ant_edition"))
	end
	ed_table = { [random_edition.key:sub(3)] = true }
	return ed_table
end

function cry_voucher_debuffed(name) -- simple function but idk
	if G.GAME.voucher_sticker_index and G.GAME.voucher_sticker_index.perishable[name] then
		if G.GAME.voucher_sticker_index.perishable[name] == 0 then
			return true
		end
	end
	return false
end

function cry_voucher_pinned(name)
	if G.GAME.voucher_sticker_index then
		if G.GAME.voucher_sticker_index.pinned[name] then
			return true
		end
	end
	return false
end

function get_random_consumable(seed, excluded_flags, unbalanced)
	excluded_flags = excluded_flags or unbalanced and { "no_doe", "no_grc" } or { "hidden", "no_doe", "no_grc" }
	local selection = "n/a"
	local passes = 0
	local tries = 500
	while true do
		tries = tries - 1
		passes = 0
		local key = pseudorandom_element(G.P_CENTER_POOLS.Consumeables, pseudoseed(seed or "grc")).key
		selection = G.P_CENTERS[key]
		for k, v in pairs(excluded_flags) do
			if not center_no(selection, v, key, true) then
				passes = passes + 1
			end
		end
		if passes >= #excluded_flags or tries <= 0 then
			return selection
		end
	end
end

function cry_get_next_voucher_edition() -- currently only for editions + sticker decks, can be modified if voucher stickering/editioning becomes more important
	if G.GAME.modifiers.cry_force_edition then
		return cry_edition_to_table(G.GAME.modifiers.cry_force_edition)
	elseif G.GAME.modifiers.cry_force_random_edition then
		return cry_poll_random_edition()
	end
end
function cry_get_next_voucher_stickers()
	local eternal_perishable_poll = pseudorandom("cry_vet" .. (key_append or "") .. G.GAME.round_resets.ante)
	local ret = { eternal = false, perishable = false, rental = false, pinned = false, banana = false }
	if
		(G.GAME.modifiers.cry_force_sticker == "eternal")
		or G.GAME.modifiers.cry_sticker_sheet_plus
		or (
			G.GAME.modifiers.cry_any_stickers
			and (G.GAME.modifiers.enable_eternals_in_shop and eternal_perishable_poll > 0.8)
		)
	then
		ret.eternal = true
	end
	if G.GAME.modifiers.enable_perishables_in_shop and G.GAME.modifiers.cry_any_stickers then -- bloated as shit
		if
			not G.GAME.modifiers.cry_eternal_perishable_compat
			and ((eternal_perishable_poll > 0.4) and (eternal_perishable_poll <= 0.7))
		then
			ret.perishable = true
		end
		if
			G.GAME.modifiers.cry_eternal_perishable_compat
			and pseudorandom("cry_vper" .. (key_append or "") .. G.GAME.round_resets.ante) > 0.7
		then
			ret.perishable = true
		end
	end
	if (G.GAME.modifiers.cry_force_sticker == "perishable") or G.GAME.modifiers.cry_sticker_sheet_plus then
		ret.perishable = true
	end
	if
		G.GAME.modifiers.cry_force_sticker == "rental"
		or G.GAME.modifiers.cry_sticker_sheet_plus
		or (
			G.GAME.modifiers.cry_any_stickers
			and (
				G.GAME.modifiers.enable_rentals_in_shop
				and pseudorandom("cry_vssjr" .. (key_append or "") .. G.GAME.round_resets.ante) > 0.7
			)
		)
	then
		ret.rental = true
	end
	if
		G.GAME.modifiers.cry_force_sticker == "pinned"
		or G.GAME.modifiers.cry_sticker_sheet_plus
		or (
			G.GAME.modifiers.cry_any_stickers
			and (
				G.GAME.modifiers.cry_enable_pinned_in_shop
				and pseudorandom("cry_vpin" .. (key_append or "") .. G.GAME.round_resets.ante) > 0.7
			)
		)
	then
		ret.pinned = true
	end
	if G.GAME.modifiers.cry_force_sticker == "banana" or G.GAME.modifiers.cry_sticker_sheet_plus then
		ret.banana = true
	end
	if
		not G.GAME.modifiers.cry_eternal_perishable_compat
		and G.GAME.modifiers.enable_banana
		and G.GAME.modifiers.cry_any_stickers
		and (pseudorandom("cry_bpbanana" .. (key_append or "") .. G.GAME.round_resets.ante) > 0.7)
		and (eternal_perishable_poll <= 0.7)
	then
		ret.banana = true
	end
	if
		G.GAME.modifiers.cry_eternal_perishable_compat
		and G.GAME.modifiers.enable_banana
		and G.GAME.modifiers.cry_any_stickers
		and (pseudorandom("cry_bpbanana" .. (key_append or "") .. G.GAME.round_resets.ante) > 0.7)
	then
		ret.banana = true
	end
	return ret
end

function Card:cry_calculate_consumeable_rental()
	if self.ability.rental then
		ease_dollars(-G.GAME.cry_consumeable_rental_rate)
		card_eval_status_text(self, "dollars", -G.GAME.cry_consumeable_rental_rate)
	end
end

function Card:cry_calculate_consumeable_perishable()
	if not self.ability.perish_tally then
		self.ability.perish_tally = 1
	end
	if self.ability.perishable and self.ability.perish_tally > 0 then
		self.ability.perish_tally = 0
		card_eval_status_text(
			self,
			"extra",
			nil,
			nil,
			nil,
			{ message = localize("k_disabled_ex"), colour = G.C.FILTER, delay = 0.45 }
		)
		self:set_debuff()
	end
end

function update_cry_member_count()
	if Cryptid.enabled["HTTPS Module"] == true then
		if not GLOBAL_cry_member_update_thread then
			local file_data = assert(NFS.newFileData(mod_path .. "https/thread.lua"))
			GLOBAL_cry_member_update_thread = love.thread.newThread(file_data)
			GLOBAL_cry_member_update_thread:start()
		end
		local old = GLOBAL_cry_member_count or 3961
		local ret = love.thread.getChannel("member_count"):pop()
		if ret then
			GLOBAL_cry_member_count = string.match(ret, '"approximate_member_count"%s*:%s*(%d+)') -- string matching a json is odd but should be fine?
		end
		if not GLOBAL_cry_member_count then
			GLOBAL_cry_member_count = old
			local error = love.thread.getChannel("member_error"):pop()
			if error then
				sendDebugMessage(error)
			end
		end
	else
		GLOBAL_cry_member_count = 3961
	end
end

local ec = eval_card
function eval_card(card, context)
	if card.will_shatter then
		return
	end
	local ggpn = G.GAME.probabilities.normal
	if card.ability.cry_rigged then
		G.GAME.probabilities.normal = 1e9
	end
	local ret = ec(card, context)
	if card.ability.cry_rigged then
		G.GAME.probabilities.normal = ggpn
	end
	return ret
end
local uc = Card.use_consumeable
function Card:use_consumeable(area, copier)
	local ggpn = G.GAME.probabilities.normal
	if self.ability.cry_rigged then
		G.GAME.probabilities.normal = 1e9
	end
	local ret = uc(self, area, copier)
	if self.ability.cry_rigged then
		G.GAME.probabilities.normal = ggpn
	end
	return ret
end

--some functions to minimize the load on calculate_joker itself
function Card:cry_copy_ability()
	local orig_ability = {}
	if self.ability then
		for i, j in pairs(self.ability) do
			if (type(j) == "table") and is_number(j) then
				orig_ability[i] = to_big(j)
			elseif type(j) == "table" then
				orig_ability[i] = {}
				for i2, j2 in pairs(j) do
					orig_ability[i][i2] = j2
				end
			else
				orig_ability[i] = j
			end
		end
	end
	return orig_ability
end
local cj = Card.calculate_joker

function Card:cry_double_scale_calc(orig_ability, in_context_scaling)
	if
		self.ability.name ~= "cry-happyhouse"
		and self.ability.name ~= "cry-sapling"
		and self.ability.name ~= "cry-mstack"
		and self.ability.name ~= "cry-notebook"
		and self.ability.name ~= "Invisible Joker"
	then
		local jkr = self
		if jkr.ability and type(jkr.ability) == "table" then
			if not G.GAME.cry_double_scale[jkr.sort_id] or not G.GAME.cry_double_scale[jkr.sort_id].ability then
				if not G.GAME.cry_double_scale[jkr.sort_id] then
					G.GAME.cry_double_scale[jkr.sort_id] = { ability = { double_scale = true } }
				end
				for k, v in pairs(jkr.ability) do
					if type(jkr.ability[k]) ~= "table" then
						G.GAME.cry_double_scale[jkr.sort_id].ability[k] = v
					else
						G.GAME.cry_double_scale[jkr.sort_id].ability[k] = {}
						for _k, _v in pairs(jkr.ability[k]) do
							G.GAME.cry_double_scale[jkr.sort_id].ability[k][_k] = _v
						end
					end
				end
			end
			if G.GAME.cry_double_scale[jkr.sort_id] and not G.GAME.cry_double_scale[jkr.sort_id].scaler then
				local dbl_info = G.GAME.cry_double_scale[jkr.sort_id]
				if jkr.ability.name == "cry-Number Blocks" then
					dbl_info.base = { "extra", "money" }
					dbl_info.scaler = { "extra", "money_mod" }
					dbl_info.scaler_base = jkr.ability.extra.money_mod
					dbl_info.offset = 1
				end
				if jkr.ability.name == "cry-Exponentia" then
					dbl_info.base = { "extra", "Emult" }
					dbl_info.scaler = { "extra", "Emult_mod" }
					dbl_info.scaler_base = jkr.ability.extra.Emult_mod
					dbl_info.offset = 1
				end
				if jkr.ability.name == "cry-Redeo" then
					dbl_info.base = { "extra", "money_req" }
					dbl_info.scaler = { "extra", "money_mod" }
					dbl_info.scaler_base = jkr.ability.extra.money_mod
					dbl_info.offset = 1
				end
				if jkr.ability.name == "cry-Chili Pepper" then
					dbl_info.base = { "extra", "Xmult" }
					dbl_info.scaler = { "extra", "Xmult_mod" }
					dbl_info.scaler_base = jkr.ability.extra.Xmult_mod
					dbl_info.offset = 1
				end
				if jkr.ability.name == "cry-Scalae" then
					dbl_info.base = { "extra", "shadow_scale" }
					dbl_info.scaler = { "extra", "shadow_scale_mod" }
					dbl_info.scaler_base = jkr.ability.extra.scale_mod
					dbl_info.offset = 1
				end
				if jkr.ability.name == "cry-mprime" then
					dbl_info.base = { "extra", "mult" }
					dbl_info.scaler = { "extra", "bonus" }
					dbl_info.scaler_base = jkr.ability.extra.bonus
					dbl_info.offset = 1
				end
				if jkr.ability.name == "Yorick" then
					dbl_info.base = { "x_mult" }
					dbl_info.scaler = { "extra", "xmult" } --not kidding
					dbl_info.scaler_base = 1
					dbl_info.offset = 1
				end
				if jkr.ability.name == "Hologram" then
					dbl_info.base = { "x_mult" }
					dbl_info.scaler = { "extra" }
					dbl_info.scaler_base = jkr.ability.extra
					dbl_info.offset = 1
				end
				if jkr.ability.name == "Gift Card" then
					dbl_info.base = { "extra_value" }
					dbl_info.scaler = { "extra" }
					dbl_info.scaler_base = jkr.ability.extra
					dbl_info.offset = 1
				end
				if jkr.ability.name == "Throwback" then
					dbl_info.base = { "x_mult" }
					dbl_info.scaler = { "extra" }
					dbl_info.scaler_base = jkr.ability.x_mult or 1
					dbl_info.offset = 1
				end
				if jkr.ability.name == "Egg" then
					dbl_info.base = { "extra_value" }
					dbl_info.scaler = { "extra" }
					dbl_info.scaler_base = jkr.ability.extra
					dbl_info.offset = 1
				end
				local default_modifiers = {
					mult = 0,
					h_mult = 0,
					h_x_mult = 0,
					h_dollars = 0,
					p_dollars = 0,
					t_mult = 0,
					t_chips = 0,
					x_mult = 1,
					h_size = 0,
					d_size = 0,
				}
				for k, v in pairs(jkr.ability) do
					--extra_value is ignored because it can be scaled by Gift Card
					if
						k ~= "extra_value"
						and dbl_info.ability[k] ~= v
						and is_number(v)
						and is_number(dbl_info.ability[k])
					then
						dbl_info.base = { k }
						local predicted_mod = math.abs(to_number(to_big(v)) - to_number(to_big(dbl_info.ability[k])))
						local best_key = { "" }
						local best_coeff = 10 ^ 100
						for l, u in pairs(jkr.ability) do
							if not (default_modifiers[l] and default_modifiers[l] == u) then
								if l ~= k and is_number(u) then
									if
										to_number(to_big(predicted_mod / u)) >= 0.999
										and to_number(to_big(predicted_mod / u)) < to_number(to_big(best_coeff))
									then
										best_coeff = to_number(to_big(predicted_mod / u))
										best_key = { l }
									end
								end
								if type(jkr.ability[l]) == "table" then
									for _l, _u in pairs(jkr.ability[l]) do
										if
											is_number(_u)
											and to_number(to_big(predicted_mod / _u)) >= 0.999
											and to_number(to_big(predicted_mod / _u))
												< to_number(to_big(best_coeff))
										then
											best_coeff = to_number(to_big(predicted_mod / _u))
											best_key = { l, _l }
										end
									end
								end
							end
						end
						dbl_info.scaler = best_key
					end
					if
						type(jkr.ability[k]) == "table"
						and type(dbl_info.ability) == "table"
						and type(dbl_info.ability[k]) == "table"
					then
						for _k, _v in pairs(jkr.ability[k]) do
							if
								dbl_info.ability[k][_k] ~= _v
								and is_number(_v)
								and is_number(dbl_info.ability[k][_k])
							then
								dbl_info.base = { k, _k }
								local predicted_mod = math.abs(_v - dbl_info.ability[k][_k])
								local best_key = { "" }
								local best_coeff = 10 ^ 100
								for l, u in pairs(jkr.ability) do
									if is_number(u) and to_number(to_big(predicted_mod / u)) >= 0.999 then
										if to_number(to_big(predicted_mod / u)) < to_number(to_big(best_coeff)) then
											best_coeff = to_number(to_big(predicted_mod / u))
											best_key = { l }
										end
									end
									if type(jkr.ability[l]) == "table" then
										for _l, _u in pairs(jkr.ability[l]) do
											if
												(l ~= k or _l ~= _k)
												and is_number(_u)
												and to_number(to_big(predicted_mod / _u)) >= 0.999
											then
												if
													to_number(to_big(predicted_mod / _u))
													< to_number(to_big(best_coeff))
												then
													best_coeff = to_number(to_big(predicted_mod / _u))
													best_key = { l, _l }
												end
											end
										end
									end
								end
								dbl_info.scaler = best_key
							end
						end
					end
				end
				if dbl_info.scaler then
					dbl_info.scaler_base = #dbl_info.scaler == 2
							and orig_ability[dbl_info.scaler[1]][dbl_info.scaler[2]]
						or orig_ability[dbl_info.scaler[1]]
					dbl_info.offset = 1
				end
			end
		end
	end
	local orig_scale_base = nil
	local orig_scale_scale = nil
	if G.GAME.cry_double_scale[self.sort_id] and G.GAME.cry_double_scale[self.sort_id].scaler then
		local jkr = self
		local dbl_info = G.GAME.cry_double_scale[self.sort_id]
		if #dbl_info.base == 2 then
			if
				not (
					type(jkr.ability) ~= "table"
					or not orig_ability[dbl_info.base[1]]
					or type(orig_ability[dbl_info.base[1]]) ~= "table"
					or not orig_ability[dbl_info.base[1]][dbl_info.base[2]]
				)
			then
				orig_scale_base = orig_ability[dbl_info.base[1]][dbl_info.base[2]]
			end
		else
			if jkr.ability[dbl_info.base[1]] then
				orig_scale_base = orig_ability[dbl_info.base[1]]
			end
		end
		if #dbl_info.scaler == 2 then
			if
				not (not orig_ability[dbl_info.scaler[1]] or not orig_ability[dbl_info.scaler[1]][dbl_info.scaler[2]])
			then
				orig_scale_scale = orig_ability[dbl_info.scaler[1]][dbl_info.scaler[2]]
			end
		else
			if orig_ability[dbl_info.scaler[1]] then
				orig_scale_scale = orig_ability[dbl_info.scaler[1]]
			end
		end
	end

	if orig_scale_base and orig_scale_scale then
		local new_scale_base = nil
		local true_base = nil
		local jkr = self
		local dbl_info = G.GAME.cry_double_scale[self.sort_id]
		if #dbl_info.base == 2 then
			if
				not (
					type(jkr.ability) ~= "table"
					or not jkr.ability[dbl_info.base[1]]
					or type(jkr.ability[dbl_info.base[1]]) ~= "table"
					or not jkr.ability[dbl_info.base[1]][dbl_info.base[2]]
				)
			then
				new_scale_base = jkr.ability[dbl_info.base[1]][dbl_info.base[2]]
			end
		else
			if jkr.ability[dbl_info.base[1]] then
				new_scale_base = jkr.ability[dbl_info.base[1]]
			end
		end
		true_base = dbl_info.scaler_base
		if
			new_scale_base and ((to_big(math.abs(new_scale_base - orig_scale_base)) > to_big(0)) or in_context_scaling)
		then
			for i = 1, #G.jokers.cards do
				local obj = G.jokers.cards[i].config.center
				if obj.cry_scale_mod and type(obj.cry_scale_mod) == "function" then
					local ggpn = G.GAME.probabilities.normal
					if G.jokers.cards[i].ability.cry_rigged then
						G.GAME.probabilities.normal = 1e9
					end
					local o = obj:cry_scale_mod(
						G.jokers.cards[i],
						jkr,
						orig_scale_scale,
						true_base,
						orig_scale_base,
						new_scale_base
					)
					if G.jokers.cards[i].ability.cry_rigged then
						G.GAME.probabilities.normal = ggpn
					end
					if o then
						if #dbl_info.scaler == 2 then
							if
								not (
									not jkr.ability[dbl_info.scaler[1]]
									or not jkr.ability[dbl_info.scaler[1]][dbl_info.scaler[2]]
								)
							then
								jkr.ability[dbl_info.scaler[1]][dbl_info.scaler[2]] = o
								orig_scale_scale = o
							end
						else
							if jkr.ability[dbl_info.scaler[1]] then
								jkr.ability[dbl_info.scaler[1]] = o
								orig_scale_scale = o
							end
						end
						card_eval_status_text(
							G.jokers.cards[i],
							"extra",
							nil,
							nil,
							nil,
							{ message = localize("k_upgrade_ex") }
						)
					end
					local reps = {}
					for i2 = 1, #G.jokers.cards do
						local _card = G.jokers.cards[i2]
						local ggpn = G.GAME.probabilities.normal
						if _card.ability.cry_rigged then
							G.GAME.probabilities.normal = 1e9
						end
						local check =
							cj(G.jokers.cards[i2], { retrigger_joker_check = true, other_card = G.jokers.cards[i] })
						if _card.ability.cry_rigged then
							G.GAME.probabilities.normal = ggpn
						end
						if type(check) == "table" then
							reps[i2] = check and check.repetitions and check or 0
						else
							reps[i2] = 0
						end
						if
							G.jokers.cards[i2] == G.jokers.cards[i]
							and G.jokers.cards[i].edition
							and G.jokers.cards[i].edition.retriggers
						then
							local old_repetitions = reps[i] ~= 0 and reps[i].repetitions or 0
							local check = false --G.jokers.cards[i]:calculate_retriggers()
							if check and check.repetitions then
								check.repetitions = check.repetitions + old_repetitions
								reps[i] = check
							end
						end
					end
					for i0, j in ipairs(reps) do
						if (type(j) == "table") and j.repetitions and (j.repetitions > 0) then
							for r = 1, j.repetitions do
								card_eval_status_text(j.card, "jokers", nil, nil, nil, j)
								local ggpn = G.GAME.probabilities.normal
								if G.jokers.cards[i].ability.cry_rigged then
									G.GAME.probabilities.normal = 1e9
								end
								local o = obj:cry_scale_mod(
									G.jokers.cards[i],
									jkr,
									orig_scale_scale,
									true_base,
									orig_scale_base,
									new_scale_base
								)
								if G.jokers.cards[i].ability.cry_rigged then
									G.GAME.probabilities.normal = ggpn
								end
								if o then
									if #dbl_info.scaler == 2 then
										if
											not (
												not jkr.ability[dbl_info.scaler[1]]
												or not jkr.ability[dbl_info.scaler[1]][dbl_info.scaler[2]]
											)
										then
											jkr.ability[dbl_info.scaler[1]][dbl_info.scaler[2]] = o
											orig_scale_scale = o
										end
									else
										if jkr.ability[dbl_info.scaler[1]] then
											jkr.ability[dbl_info.scaler[1]] = o
											orig_scale_scale = o
										end
									end
									card_eval_status_text(
										G.jokers.cards[i],
										"extra",
										nil,
										nil,
										nil,
										{ message = localize("k_upgrade_ex") }
									)
								end
							end
						end
					end
				end
			end
		end
	end
end

function Card:calculate_joker(context)
	local active_side = self
	if next(find_joker("cry-Flip Side")) and not context.dbl_side and self.edition and self.edition.cry_double_sided then
		self:init_dbl_side()
		active_side = self.dbl_side
		if context.callback then
			local m = context.callback
			context.callback = function(card,a,b)
				m(self,a,b)
			end
			context.dbl_side = true
		end
	end
	if active_side.will_shatter then
		return
	end
	local ggpn = G.GAME.probabilities.normal
	if not G.GAME.cry_double_scale then
		G.GAME.cry_double_scale = { double_scale = true } --doesn't really matter what's in here as long as there's something
	end
	if active_side.ability.cry_rigged then
		G.GAME.probabilities.normal = 1e9
	end
	local orig_ability = active_side:cry_copy_ability()
	local in_context_scaling = false
	local ret, trig = cj(active_side, context)
	if not context.blueprint and (active_side.ability.set == "Joker") and not active_side.debuff then
		if ret or trig then
			in_context_scaling = true
		end
	end
	if active_side.ability.cry_rigged then
		G.GAME.probabilities.normal = ggpn
	end
	active_side:cry_double_scale_calc(orig_ability, in_context_scaling)
	return ret, trig
end

function exponentia_scale_mod(self, orig_scale_scale, orig_scale_base, new_scale_base)
	local jkr = self
	local dbl_info = G.GAME.cry_double_scale[jkr.sort_id]
	if jkr.ability and type(jkr.ability) == "table" then
		if not G.GAME.cry_double_scale[jkr.sort_id] or not G.GAME.cry_double_scale[jkr.sort_id].ability then
			if not G.GAME.cry_double_scale[jkr.sort_id] then
				G.GAME.cry_double_scale[jkr.sort_id] = { ability = { double_scale = true } }
			end
			for k, v in pairs(jkr.ability) do
				if type(jkr.ability[k]) ~= "table" then
					G.GAME.cry_double_scale[jkr.sort_id].ability[k] = v
				else
					G.GAME.cry_double_scale[jkr.sort_id].ability[k] = {}
					for _k, _v in pairs(jkr.ability[k]) do
						G.GAME.cry_double_scale[jkr.sort_id].ability[k][_k] = _v
					end
				end
			end
		end
		if G.GAME.cry_double_scale[jkr.sort_id] and not G.GAME.cry_double_scale[jkr.sort_id].scaler then
			dbl_info.base = { "extra", "Emult" }
			dbl_info.scaler = { "extra", "Emult_mod" }
			dbl_info.scaler_base = jkr.ability.extra.Emult_mod
			dbl_info.offset = 1
		end
	end
	local true_base = dbl_info.scaler_base
	if true_base then
		for i = 1, #G.jokers.cards do
			local obj = G.jokers.cards[i].config.center
			if obj.cry_scale_mod and type(obj.cry_scale_mod) == "function" then
				local ggpn = G.GAME.probabilities.normal
				if G.jokers.cards[i].ability.cry_rigged then
					G.GAME.probabilities.normal = 1e9
				end
				local o = obj:cry_scale_mod(
					G.jokers.cards[i],
					jkr,
					orig_scale_scale,
					true_base,
					orig_scale_base,
					new_scale_base
				)
				if G.jokers.cards[i].ability.cry_rigged then
					G.GAME.probabilities.normal = ggpn
				end
				if o then
					if #dbl_info.scaler == 2 then
						if
							not (
								not jkr.ability[dbl_info.scaler[1]]
								or not jkr.ability[dbl_info.scaler[1]][dbl_info.scaler[2]]
							)
						then
							jkr.ability[dbl_info.scaler[1]][dbl_info.scaler[2]] = o
							orig_scale_scale = o
						end
					else
						if jkr.ability[dbl_info.scaler[1]] then
							jkr.ability[dbl_info.scaler[1]] = o
							orig_scale_scale = o
						end
					end
					card_eval_status_text(
						G.jokers.cards[i],
						"extra",
						nil,
						nil,
						nil,
						{ message = localize("k_upgrade_ex") }
					)
				end
				local reps = {}
				for i2 = 1, #G.jokers.cards do
					local _card = G.jokers.cards[i2]
					local ggpn = G.GAME.probabilities.normal
					if _card.ability.cry_rigged then
						G.GAME.probabilities.normal = 1e9
					end
					local check =
						cj(G.jokers.cards[i2], { retrigger_joker_check = true, other_card = G.jokers.cards[i] })
					if _card.ability.cry_rigged then
						G.GAME.probabilities.normal = ggpn
					end
					if type(check) == "table" then
						reps[i2] = check and check.repetitions and check or 0
					else
						reps[i2] = 0
					end
					if
						G.jokers.cards[i2] == G.jokers.cards[i]
						and G.jokers.cards[i].edition
						and G.jokers.cards[i].edition.retriggers
					then
						local old_repetitions = reps[i] ~= 0 and reps[i].repetitions or 0
						local check = false --G.jokers.cards[i]:calculate_retriggers()
						if check and check.repetitions then
							check.repetitions = check.repetitions + old_repetitions
							reps[i] = check
						end
					end
				end
				for i0, j in ipairs(reps) do
					if (type(j) == "table") and j.repetitions and (j.repetitions > 0) then
						for r = 1, j.repetitions do
							card_eval_status_text(j.card, "jokers", nil, nil, nil, j)
							local ggpn = G.GAME.probabilities.normal
							if G.jokers.cards[i].ability.cry_rigged then
								G.GAME.probabilities.normal = 1e9
							end
							local o = obj:cry_scale_mod(
								G.jokers.cards[i],
								jkr,
								orig_scale_scale,
								true_base,
								orig_scale_base,
								new_scale_base
							)
							if G.jokers.cards[i].ability.cry_rigged then
								G.GAME.probabilities.normal = ggpn
							end
							if o then
								if #dbl_info.scaler == 2 then
									if
										not (
											not jkr.ability[dbl_info.scaler[1]]
											or not jkr.ability[dbl_info.scaler[1]][dbl_info.scaler[2]]
										)
									then
										jkr.ability[dbl_info.scaler[1]][dbl_info.scaler[2]] = o
										orig_scale_scale = o
									end
								else
									if jkr.ability[dbl_info.scaler[1]] then
										jkr.ability[dbl_info.scaler[1]] = o
										orig_scale_scale = o
									end
								end
								card_eval_status_text(
									G.jokers.cards[i],
									"extra",
									nil,
									nil,
									nil,
									{ message = localize("k_upgrade_ex") }
								)
							end
						end
					end
				end
			end
		end
	end
end

function compound_interest_scale_mod(self, orig_scale_scale, orig_scale_base, new_scale_base)
	local jkr = self
	local dbl_info = G.GAME.cry_double_scale[jkr.sort_id]
	if jkr.ability and type(jkr.ability) == "table" then
		if not G.GAME.cry_double_scale[jkr.sort_id] or not G.GAME.cry_double_scale[jkr.sort_id].ability then
			if not G.GAME.cry_double_scale[jkr.sort_id] then
				G.GAME.cry_double_scale[jkr.sort_id] = { ability = { double_scale = true } }
			end
			for k, v in pairs(jkr.ability) do
				if type(jkr.ability[k]) ~= "table" then
					G.GAME.cry_double_scale[jkr.sort_id].ability[k] = v
				else
					G.GAME.cry_double_scale[jkr.sort_id].ability[k] = {}
					for _k, _v in pairs(jkr.ability[k]) do
						G.GAME.cry_double_scale[jkr.sort_id].ability[k][_k] = _v
					end
				end
			end
		end
		if G.GAME.cry_double_scale[jkr.sort_id] and not G.GAME.cry_double_scale[jkr.sort_id].scaler then
			dbl_info.base = { "extra", "percent" }
			dbl_info.scaler = { "extra", "percent_mod" }
			dbl_info.scaler_base = jkr.ability.extra.percent_mod
			dbl_info.offset = 1
		end
	end
	local true_base = dbl_info.scaler_base
	if true_base then
		for i = 1, #G.jokers.cards do
			local obj = G.jokers.cards[i].config.center
			if obj.cry_scale_mod and type(obj.cry_scale_mod) == "function" then
				local ggpn = G.GAME.probabilities.normal
				if G.jokers.cards[i].ability.cry_rigged then
					G.GAME.probabilities.normal = 1e9
				end
				local o = obj:cry_scale_mod(
					G.jokers.cards[i],
					jkr,
					orig_scale_scale,
					true_base,
					orig_scale_base,
					new_scale_base
				)
				if G.jokers.cards[i].ability.cry_rigged then
					G.GAME.probabilities.normal = ggpn
				end
				if o then
					if #dbl_info.scaler == 2 then
						if
							not (
								not jkr.ability[dbl_info.scaler[1]]
								or not jkr.ability[dbl_info.scaler[1]][dbl_info.scaler[2]]
							)
						then
							jkr.ability[dbl_info.scaler[1]][dbl_info.scaler[2]] = o
							orig_scale_scale = o
						end
					else
						if jkr.ability[dbl_info.scaler[1]] then
							jkr.ability[dbl_info.scaler[1]] = o
							orig_scale_scale = o
						end
					end
					card_eval_status_text(
						G.jokers.cards[i],
						"extra",
						nil,
						nil,
						nil,
						{ message = localize("k_upgrade_ex") }
					)
				end
				local reps = {}
				for i2 = 1, #G.jokers.cards do
					local _card = G.jokers.cards[i2]
					local ggpn = G.GAME.probabilities.normal
					if _card.ability.cry_rigged then
						G.GAME.probabilities.normal = 1e9
					end
					local check =
						cj(G.jokers.cards[i2], { retrigger_joker_check = true, other_card = G.jokers.cards[i] })
					if _card.ability.cry_rigged then
						G.GAME.probabilities.normal = ggpn
					end
					if type(check) == "table" then
						reps[i2] = check and check.repetitions and check or 0
					else
						reps[i2] = 0
					end
					if
						G.jokers.cards[i2] == G.jokers.cards[i]
						and G.jokers.cards[i].edition
						and G.jokers.cards[i].edition.retriggers
					then
						local old_repetitions = reps[i] ~= 0 and reps[i].repetitions or 0
						local check = false --G.jokers.cards[i]:calculate_retriggers()
						if check and check.repetitions then
							check.repetitions = check.repetitions + old_repetitions
							reps[i] = check
						end
					end
				end
				for i0, j in ipairs(reps) do
					if (type(j) == "table") and j.repetitions and (j.repetitions > 0) then
						for r = 1, j.repetitions do
							card_eval_status_text(j.card, "jokers", nil, nil, nil, j)
							local ggpn = G.GAME.probabilities.normal
							if G.jokers.cards[i].ability.cry_rigged then
								G.GAME.probabilities.normal = 1e9
							end
							local o = obj:cry_scale_mod(
								G.jokers.cards[i],
								jkr,
								orig_scale_scale,
								true_base,
								orig_scale_base,
								new_scale_base
							)
							if G.jokers.cards[i].ability.cry_rigged then
								G.GAME.probabilities.normal = ggpn
							end
							if o then
								if #dbl_info.scaler == 2 then
									if
										not (
											not jkr.ability[dbl_info.scaler[1]]
											or not jkr.ability[dbl_info.scaler[1]][dbl_info.scaler[2]]
										)
									then
										jkr.ability[dbl_info.scaler[1]][dbl_info.scaler[2]] = o
										orig_scale_scale = o
									end
								else
									if jkr.ability[dbl_info.scaler[1]] then
										jkr.ability[dbl_info.scaler[1]] = o
										orig_scale_scale = o
									end
								end
								card_eval_status_text(
									G.jokers.cards[i],
									"extra",
									nil,
									nil,
									nil,
									{ message = localize("k_upgrade_ex") }
								)
							end
						end
					end
				end
			end
		end
	end
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

G.C.CRY_JOLLY = { 0, 0, 0, 0 }

-- File loading based on Relic-Jokers
local files = NFS.getDirectoryItems(mod_path .. "Items")
Cryptid.obj_buffer = {}
for _, file in ipairs(files) do
	print("Loading file " .. file)
	local f, err = SMODS.load_file("Items/" .. file)
	if err then
		print("Error loading file: " .. err)
	else
		local curr_obj = f()
		if curr_obj.name == "HTTPS Module" and Cryptid_config[curr_obj.name] == nil then
			Cryptid_config[curr_obj.name] = false
		end
		if Cryptid_config[curr_obj.name] == nil then
			Cryptid_config[curr_obj.name] = true
			Cryptid.enabled[curr_obj.name] = true
		end
		if Cryptid_config[curr_obj.name] then
			if curr_obj.init then
				curr_obj:init()
			end
			if not curr_obj.items then
				print("Warning: " .. file .. " has no items")
			else
				for _, item in ipairs(curr_obj.items) do
					if not item.order then
						item.order = 0
					end
					if curr_obj.order then
						item.order = item.order + curr_obj.order
					end
					if SMODS[item.object_type] then
						if not Cryptid.obj_buffer[item.object_type] then
							Cryptid.obj_buffer[item.object_type] = {}
						end
						Cryptid.obj_buffer[item.object_type][#Cryptid.obj_buffer[item.object_type] + 1] = item
					else
						print("Error loading item " .. item.key .. " of unknown type " .. item.object_type)
					end
				end
			end
		end
	end
end
for set, objs in pairs(Cryptid.obj_buffer) do
	table.sort(objs, function(a, b)
		return a.order < b.order
	end)
	for i = 1, #objs do
		if objs[i].post_process and type(objs[i].post_process) == "function" then
			objs[i]:post_process()
		end
		SMODS[set](objs[i])
	end
end
local cryptidTabs = function() return {
	{
		label = localize("cry_set_features"),
		chosen = true,
		tab_definition_function = function()
			cry_nodes = {
				{
					n = G.UIT.R,
					config = { align = "cm" },
					nodes = {
						{
							n = G.UIT.O,
							config = {
								object = DynaText({
									string = localize("cry_set_enable_features"),
									colours = { G.C.WHITE },
									shadow = true,
									scale = 0.4,
								}),
							},
						},
					},
				},
			}
			left_settings = { n = G.UIT.C, config = { align = "tl", padding = 0.05 }, nodes = {} }
			right_settings = { n = G.UIT.C, config = { align = "tl", padding = 0.05 }, nodes = {} }
			--todo: completely redesign this, make it possible to enable/disable individual items
			local ordered_config = {}
			for k, _ in pairs(Cryptid_config) do
				if localize("cry_feat_"..string.lower(k)) ~= "ERROR" and k ~= "JokerDisplay" then
					ordered_config[#ordered_config+1] = k
				end
			end
			table.sort(ordered_config)
			for _, k in ipairs(ordered_config) do
				if #right_settings.nodes < #left_settings.nodes then
					right_settings.nodes[#right_settings.nodes + 1] =
						create_toggle({ label = localize("cry_feat_"..string.lower(k)), ref_table = Cryptid_config, ref_value = k })
				else
					left_settings.nodes[#left_settings.nodes + 1] =
						create_toggle({ label = localize("cry_feat_"..string.lower(k)), ref_table = Cryptid_config, ref_value = k })
				end
			end
			config = { n = G.UIT.R, config = { align = "tm", padding = 0 }, nodes = { left_settings, right_settings } }
			cry_nodes[#cry_nodes + 1] = config
			return {
				n = G.UIT.ROOT,
				config = {
					emboss = 0.05,
					minh = 6,
					r = 0.1,
					minw = 10,
					align = "cm",
					padding = 0.2,
					colour = G.C.BLACK,
				},
				nodes = cry_nodes,
			}
		end,
	},
	{
		label = localize("cry_set_music"),
		tab_definition_function = function()
			-- TODO: Add a button here to reset all Cryptid achievements.
			-- If you want to do that now, add this to the SMODS.InjectItems in Steamodded/loader/loader.lua
			--[[fetch_achievements()
            for k, v in pairs(SMODS.Achievements) do
                G.SETTINGS.ACHIEVEMENTS_EARNED[k] = nil
                G.ACHIEVEMENTS[k].earned = nil
            end
            fetch_achievements()]]
			cry_nodes = {
				{
					n = G.UIT.R,
					config = { align = "cm" },
					nodes = {
						--{n=G.UIT.O, config={object = DynaText({string = "", colours = {G.C.WHITE}, shadow = true, scale = 0.4})}},
					},
				},
			}
			settings = { n = G.UIT.C, config = { align = "tl", padding = 0.05 }, nodes = {} }
			settings.nodes[#settings.nodes + 1] = create_toggle({
				label = localize("cry_mus_jimball"),
				ref_table = Cryptid_config.Cryptid,
				ref_value = "jimball_music",
			})
			settings.nodes[#settings.nodes + 1] = create_toggle({
				label = localize("cry_mus_code"),
				ref_table = Cryptid_config.Cryptid,
				ref_value = "code_music",
			})
			settings.nodes[#settings.nodes + 1] = create_toggle({
				label = localize("cry_mus_exotic"),
				ref_table = Cryptid_config.Cryptid,
				ref_value = "exotic_music",
			})
			settings.nodes[#settings.nodes + 1] = create_toggle({
				label = localize("cry_mus_high_score"),
				ref_table = Cryptid_config.Cryptid,
				ref_value = "big_music",
			})
			config = { n = G.UIT.R, config = { align = "tm", padding = 0 }, nodes = { settings } }
			cry_nodes[#cry_nodes + 1] = config
			return {
				n = G.UIT.ROOT,
				config = {
					emboss = 0.05,
					minh = 6,
					r = 0.1,
					minw = 10,
					align = "cm",
					padding = 0.2,
					colour = G.C.BLACK,
				},
				nodes = cry_nodes,
			}
		end,
	},
} end
G.FUNCS.cryptidMenu = function(e)
	local tabs = create_tabs({
		snap_to_nav = true,
		tabs = cryptidTabs(),
	})
	G.FUNCS.overlay_menu({
		definition = create_UIBox_generic_options({
			back_func = "options",
			contents = { tabs },
		}),
		config = { offset = { x = 0, y = 10 } },
	})
end

--[[SMODS.current_mod.config_tab = function()
    return {
        n = G.UIT.ROOT,
        config = {
            emboss = 0.05,
            minh = 6,
            r = 0.1,
            minw = 10,
            align = "cm",
            padding = 0.2,
            colour = G.C.BLACK
        },
        nodes = {UIBox_button{ label = {"Open Cryptid Config"}, button = "cryptidMenu", colour = G.C.DARK_EDITION, minw = 5, minh = 0.7, scale = 0.6}}
    }
end--]]
SMODS.current_mod.extra_tabs = cryptidTabs

-- Modify to display badges for credits
local smcmb = SMODS.create_mod_badges
function SMODS.create_mod_badges(obj, badges)
	smcmb(obj, badges)
	if obj and obj.cry_credits then
		local function calc_scale_fac(text)
			local size = 0.9
			local font = G.LANG.font
			local max_text_width = 2 - 2 * 0.05 - 4 * 0.03 * size - 2 * 0.03
			local calced_text_width = 0
			-- Math reproduced from DynaText:update_text
			for _, c in utf8.chars(text) do
				local tx = font.FONT:getWidth(c) * (0.33 * size) * G.TILESCALE * font.FONTSCALE
					+ 2.7 * 1 * G.TILESCALE * font.FONTSCALE
				calced_text_width = calced_text_width + tx / (G.TILESIZE * G.TILESCALE)
			end
			local scale_fac = calced_text_width > max_text_width and max_text_width / calced_text_width or 1
			return scale_fac
		end
		local scale_fac = {}
		if obj.cry_credits and obj.cry_credits.text then
			for i = 1, #obj.cry_credits.text do
				scale_fac[i] = calc_scale_fac(obj.cry_credits.text[i])
			end
		end
		local ct = {}
		for i = 1, #obj.cry_credits.text do
			ct[i] = {
				string = obj.cry_credits.text[i],
				scale = scale_fac[i],
				spacing = scale_fac[i],
			}
		end
		badges[#badges + 1] = {
			n = G.UIT.R,
			config = { align = "cm" },
			nodes = {
				{
					n = G.UIT.R,
					config = {
						align = "cm",
						colour = obj.cry_credits and obj.cry_credits.colour or G.C.RED,
						r = 0.1,
						minw = 2,
						minh = 0.36,
						emboss = 0.05,
						padding = 0.03 * 0.9,
					},
					nodes = {
						{ n = G.UIT.B, config = { h = 0.1, w = 0.03 } },
						{
							n = G.UIT.O,
							config = {
								object = DynaText({
									string = ct or "ERROR",
									colours = { G.C.WHITE },
									silent = true,
									float = true,
									shadow = true,
									offset_y = -0.03,
									spacing = 1,
									scale = 0.33 * 0.9,
								}),
							},
						},
						{ n = G.UIT.B, config = { h = 0.1, w = 0.03 } },
					},
				},
			},
		}
	end
end

-- This is short enough that I'm fine overriding it
function calculate_reroll_cost(skip_increment)
	if next(find_joker("cry-crustulum")) then
		G.GAME.current_round.reroll_cost = 0
		return
	end
	if G.GAME.used_vouchers.v_cry_rerollexchange then
		G.GAME.current_round.reroll_cost = 2
		return
	end
	if G.GAME.current_round.free_rerolls < 0 then
		G.GAME.current_round.free_rerolls = 0
	end
	if G.GAME.current_round.free_rerolls > 0 then
		G.GAME.current_round.reroll_cost = 0
		return
	end
	G.GAME.current_round.reroll_cost_increase = G.GAME.current_round.reroll_cost_increase or 0
	if not skip_increment then
		G.GAME.current_round.reroll_cost_increase = G.GAME.current_round.reroll_cost_increase
			+ (G.GAME.modifiers.cry_reroll_scaling or 1)
	end
	G.GAME.current_round.reroll_cost = (G.GAME.round_resets.temp_reroll_cost or G.GAME.round_resets.reroll_cost)
		+ G.GAME.current_round.reroll_cost_increase
end

--Top Gear from The World End with Jimbo has several conflicts with Cryptid items
--Namely, It overrides the edition that edition jokers spawn with, and doesn't work correctly with edition decks
--I'm taking ownership of this, overiding it, and making an implementaion that is compatible with Cryptid

--Unrelated but kind of related side note: this prevents top gear from showing up in collection, not sure what's up with that
--Is it due to how TWEWJ is Coded? Is it an issue with Steamodded itself? Might be worth looking into, just sayin

if (SMODS.Mods["TWEWY"] or {}).can_load then
	SMODS.Joker:take_ownership('twewy_topGear', {
		name = "Cry-topGear",
		--Stop Top Gear's Old code from working by overriding these
		add_to_deck = function(self, card, from_debuff)
		end,
		remove_from_deck = function(self, card, from_debuff)
		end,
		rarity = 3,
		loc_txt = {
        		name = 'Top Gear',
        		text = { 
				"All {C:blue}Common{C:attention} Jokers{}",
        			"are {C:dark_edition}Polychrome{}",
			}
    		},
	})
end

-- We're modifying so much of this for Brown and Yellow Stake, Equilibrium Deck, etc. that it's fine to override...
function create_card(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
	local area = area or G.jokers
	local pseudo = function(x)
		return pseudorandom(pseudoseed(x))
	end
	local ps = pseudoseed
	if area == "ERROR" then
		pseudo = function(x)
			return pseudorandom(predict_pseudoseed(x))
		end
		ps = predict_pseudoseed
	end
	local center = G.P_CENTERS.b_red
	if (_type == "Joker") and not forced_key and G.GAME and G.GAME.modifiers and G.GAME.modifiers.all_rnj then
		forced_key = "j_cry_rnjoker"
	end
	local function aeqviable(center)
		return not center_no(center, "doe") and not center_no(center, "aeq") and not (center.rarity == 6 or center.rarity == "cry_exotic")
	end
	if _type == "Joker" and not _rarity then
		if not G.GAME.aequilibriumkey then G.GAME.aequilibriumkey = 1 end
		local aeqactive = nil
		if next(find_joker('Ace Aequilibrium')) and not forced_key then
			while not aeqactive or not aeqviable(G.P_CENTER_POOLS.Joker[aeqactive]) do
				if math.ceil(G.GAME.aequilibriumkey) > #G.P_CENTER_POOLS["Joker"] then
					G.GAME.aequilibriumkey = 1
				end
				aeqactive = math.ceil(G.GAME.aequilibriumkey)
				G.GAME.aequilibriumkey = math.ceil(G.GAME.aequilibriumkey + 1)
			end
		end
		if aeqactive then
			forced_key = G.P_CENTER_POOLS["Joker"][aeqactive].key
		end
	end
	--should pool be skipped with a forced key
	if not forced_key and soulable and not G.GAME.banned_keys["c_soul"] then
		for _, v in ipairs(SMODS.Consumable.legendaries) do
			if
				(_type == v.type.key or _type == v.soul_set)
				and not (G.GAME.used_jokers[v.key] and not next(find_joker("Showman")) and not v.can_repeat_soul)
			then
				if pseudo("soul_" .. v.key .. _type .. G.GAME.round_resets.ante) > (1 - v.soul_rate) then
					forced_key = v.key
				end
			end
		end
		if
			(_type == "Tarot" or _type == "Spectral" or _type == "Tarot_Planet")
			and not (G.GAME.used_jokers["c_soul"] and not next(find_joker("Showman")))
		then
			if pseudo("soul_" .. _type .. G.GAME.round_resets.ante) > 0.997 then
				forced_key = "c_soul"
			end
		end
		if
			(_type == "Planet" or _type == "Spectral")
			and not (G.GAME.used_jokers["c_black_hole"] and not next(find_joker("Showman")))
		then
			if pseudo("soul_" .. _type .. G.GAME.round_resets.ante) > 0.997 then
				forced_key = "c_black_hole"
			end
		end
	end

	if _type == "Base" then
		forced_key = "c_base"
	end

	if forced_key then --vanilla behavior change, mainly for M Joker reasons
		center = G.P_CENTERS[forced_key]
		_type = (center.set ~= "Default" and center.set or _type)
	else
		--Reimplement Door Hanger From Bunco
                if next(find_joker('Doorhanger')) then
                    	if _rarity == nil or _rarity < 0.9 then
        
                        	_rarity = 0.9

				--Minor Changes from Bunco's implementation
				local rng = pseudorandom('doorhanger'..G.SEED)
                        	if rng > 0.97 then
					--Rare Jokers
                            		_rarity = 0.993
                        	end
				if rng > 0.99 then
					--Epic Jokers (If enabled, otherwise rare jokers)
                            		_rarity = 1
                        	end
                    	end
                end
		gcparea = area
		local _pool, _pool_key = get_current_pool(_type, _rarity, legendary, key_append)
		gcparea = nil
		center = pseudorandom_element(_pool, ps(_pool_key))
		local it = 1
		while center == "UNAVAILABLE" do
			it = it + 1
			center = pseudorandom_element(_pool, ps(_pool_key .. "_resample" .. it))
		end

		center = G.P_CENTERS[center]
	end

	local front = (
		(_type == "Base" or _type == "Enhanced")
		and pseudorandom_element(G.P_CARDS, ps("front" .. (key_append or "") .. G.GAME.round_resets.ante))
	) or nil

	if area == "ERROR" then
		local ret = (front or center)
		if not ret.config then
			ret.config = {}
		end
		if not ret.config.center then
			ret.config.center = {}
		end
		if not ret.config.center.key then
			ret.config.center.key = ""
		end
		if not ret.ability then ret.ability = {} end
		return ret --the config.center.key stuff prevents a crash with Jen's Almanac hook
	end

	local card = Card(
		area and (area.T.x + area.T.w / 2) or 0,
		area and area.T.y or 0,
		G.CARD_W * (center and center.set == "Booster" and 1.27 or 1),
		G.CARD_H * (center and center.set == "Booster" and 1.27 or 1),
		front,
		center,
		{
			bypass_discovery_center = area == G.shop_jokers
				or area == G.pack_cards
				or area == G.shop_vouchers
				or (G.shop_demo and area == G.shop_demo)
				or area == G.jokers
				or area == G.consumeables,
			bypass_discovery_ui = area == G.shop_jokers
				or area == G.pack_cards
				or area == G.shop_vouchers
				or (G.shop_demo and area == G.shop_demo),
			discover = area == G.jokers or area == G.consumeables,
			bypass_back = G.GAME.selected_back.pos,
		}
	)
	if front and G.GAME.modifiers.cry_force_suit then
		card:change_suit(G.GAME.modifiers.cry_force_suit)
	end
	if front and G.GAME.modifiers.cry_force_enhancement then
		card:set_ability(G.P_CENTERS[G.GAME.modifiers.cry_force_enhancement])
	end
	if front and G.GAME.modifiers.cry_force_edition then
		card:set_edition({ [G.GAME.modifiers.cry_force_edition] = true }, true, true)
	end
	if front and G.GAME.modifiers.cry_force_seal then
		card:set_seal(G.GAME.modifiers.cry_force_seal)
	end
	if card.ability.consumeable and not skip_materialize then
		card:start_materialize()
	end
	for k, v in ipairs(SMODS.Sticker.obj_buffer) do
		local sticker = SMODS.Stickers[v]
		if
			sticker.should_apply
			and type(sticker.should_apply) == "function"
			and sticker:should_apply(card, center, area)
		then
			sticker:apply(card, true)
		end
	end
	if
		G.GAME.modifiers.cry_force_sticker == "eternal"
		or (
			G.GAME.modifiers.cry_sticker_sheet_plus
			and not (
				(_type == "Base" or _type == "Enhanced") and not ((area == G.shop_jokers) or (area == G.pack_cards))
			)
		)
	then -- wow that is long
		card:set_eternal(true)
		card.ability.eternal = true
	end
	if
		G.GAME.modifiers.cry_force_sticker == "perishable"
		or (
			G.GAME.modifiers.cry_sticker_sheet_plus
			and not (
				(_type == "Base" or _type == "Enhanced") and not ((area == G.shop_jokers) or (area == G.pack_cards))
			)
		)
	then
		card:set_perishable(true)
		card.ability.perish_tally = G.GAME.perishable_rounds -- set_perishable should be doing this? whatever
		card.ability.perishable = true
	end
	if
		G.GAME.modifiers.cry_force_sticker == "rental"
		or (
			G.GAME.modifiers.cry_sticker_sheet_plus
			and not (
				(_type == "Base" or _type == "Enhanced") and not ((area == G.shop_jokers) or (area == G.pack_cards))
			)
		)
	then
		card:set_rental(true)
		card.ability.rental = true
	end
	if
		G.GAME.modifiers.cry_force_sticker == "pinned"
		or (
			G.GAME.modifiers.cry_sticker_sheet_plus
			and not (
				(_type == "Base" or _type == "Enhanced") and not ((area == G.shop_jokers) or (area == G.pack_cards))
			)
		)
	then
		card.pinned = true
	end
	if
		G.GAME.modifiers.cry_force_sticker == "banana"
		or (
			G.GAME.modifiers.cry_sticker_sheet_plus
			and not (
				(_type == "Base" or _type == "Enhanced") and not ((area == G.shop_jokers) or (area == G.pack_cards))
			)
		)
	then
		card.ability.banana = true
	end
	if G.GAME.modifiers.cry_sticker_sheet_plus and not (_type == "Base" or _type == "Enhanced") then
		for k, v in pairs(SMODS.Stickers) do
			if v.apply and not v.no_sticker_sheet then
				v:apply(card, true)
			end
		end
	end

	if card.ability.name == "cry-Cube" then
		card:set_eternal(true)
	end
	if _type == "Joker" or (G.GAME.modifiers.cry_any_stickers and not G.GAME.modifiers.cry_sticker_sheet) then
		if G.GAME.modifiers.all_eternal then
			card:set_eternal(true)
		end
		if G.GAME.modifiers.cry_all_perishable then
			card:set_perishable(true)
		end
		if G.GAME.modifiers.cry_all_rental then
			card:set_rental(true)
		end
		if G.GAME.modifiers.cry_all_pinned then
			card.pinned = true
		end
		if G.GAME.modifiers.cry_all_banana then
			card.ability.banana = true
		end
		if (area == G.shop_jokers) or (area == G.pack_cards) then
			local eternal_perishable_poll = pseudorandom("cry_et" .. (key_append or "") .. G.GAME.round_resets.ante)
			if G.GAME.modifiers.enable_eternals_in_shop and eternal_perishable_poll > 0.7 then
				card:set_eternal(true)
			end
			if G.GAME.modifiers.enable_perishables_in_shop then
				if
					not G.GAME.modifiers.cry_eternal_perishable_compat
					and ((eternal_perishable_poll > 0.4) and (eternal_perishable_poll <= 0.7))
				then
					card:set_perishable(true)
				end
				if
					G.GAME.modifiers.cry_eternal_perishable_compat
					and pseudorandom("cry_per" .. (key_append or "") .. G.GAME.round_resets.ante) > 0.7
				then
					card:set_perishable(true)
				end
			end
			if
				G.GAME.modifiers.enable_rentals_in_shop
				and pseudorandom("cry_ssjr" .. (key_append or "") .. G.GAME.round_resets.ante) > 0.7
			then
				card:set_rental(true)
			end
			if
				G.GAME.modifiers.cry_enable_pinned_in_shop
				and pseudorandom("cry_pin" .. (key_append or "") .. G.GAME.round_resets.ante) > 0.7
			then
				card.pinned = true
			end
			if
				not G.GAME.modifiers.cry_eternal_perishable_compat
				and G.GAME.modifiers.enable_banana
				and (pseudorandom("cry_banana" .. (key_append or "") .. G.GAME.round_resets.ante) > 0.7)
				and (eternal_perishable_poll <= 0.7)
			then
				card.ability.banana = true
			end
			if
				G.GAME.modifiers.cry_eternal_perishable_compat
				and G.GAME.modifiers.enable_banana
				and (pseudorandom("cry_banana" .. (key_append or "") .. G.GAME.round_resets.ante) > 0.7)
			then
				card.ability.banana = true
			end
			if G.GAME.modifiers.cry_sticker_sheet then
				for k, v in pairs(SMODS.Stickers) do
					if v.apply and not v.no_sticker_sheet then
						v:apply(card, true)
					end
				end
			end
			if
				G.GAME.modifiers.cry_enable_flipped_in_shop
				and pseudorandom("cry_flip" .. (key_append or "") .. G.GAME.round_resets.ante) > 0.7
			then
				card.cry_flipped = true
			end
		end
		if _type == "Joker" and not G.GAME.modifiers.cry_force_edition then
			local edition = poll_edition("edi" .. (key_append or "") .. G.GAME.round_resets.ante)
			card:set_edition(edition)
			check_for_unlock({ type = "have_edition" })
		end
	end
	if
		(card.ability.set == "Code")
		and G.GAME.used_vouchers.v_cry_quantum_computing
		and pseudorandom("cry_quantum_computing") > 0.7
	then
		card:set_edition({ negative = true })
	end
	if
		G.GAME.modifiers.cry_force_edition
		and not G.GAME.modifiers.cry_force_random_edition
		and area ~= G.pack_cards
	then
		card:set_edition(nil, true)
	end
	if G.GAME.modifiers.cry_force_random_edition and area ~= G.pack_cards then
		local edition = cry_poll_random_edition()
		card:set_edition(edition, true)
	end
	if not (card.edition and (card.edition.cry_oversat or card.edition.cry_glitched)) then
		cry_misprintize(card)
	end
	if card.ability.consumeable and card.pinned then -- counterpart is in Sticker.toml
		G.GAME.cry_pinned_consumeables = G.GAME.cry_pinned_consumeables + 1
	end
	if next(find_joker("Cry-topGear")) and card.config.center.rarity == 1 then
		if card.ability.name ~= "cry-meteor"
		and card.ability.name ~= "cry-exoplanet"
		and card.ability.name ~= "cry-stardust" then
			card:set_edition("e_polychrome", true, nil, true)
		end
	end
	if card.ability.name == "cry-meteor" then
		card:set_edition("e_foil", true, nil, true)
	end
	if card.ability.name == "cry-exoplanet" then
		card:set_edition("e_holo", true, nil, true)
	end
	if card.ability.name == "cry-stardust" then
		card:set_edition("e_polychrome", true, nil, true)
	end
	-- Certain jokers such as Steel Joker and Driver's License depend on values set 
	-- during the update function. Cryptid can create jokers mid-scoring, meaning
	-- those values will be unset during scoring unless update() is manually called.
	card:update(0.016) -- dt is unused in the base game, but we're providing a realistic value anyway
	return card
end

-- Make tags fit if there's more than 13 of them
local at = add_tag
function add_tag(tag)
	at(tag)
	if #G.HUD_tags > 13 then
		for i = 2, #G.HUD_tags do
			G.HUD_tags[i].config.offset.y = 0.9 - 0.9 * 13 / #G.HUD_tags
		end
	end
end

--add calculation context and callback to tag function
local at2 = add_tag
function add_tag(tag, from_skip, no_copy)
	if no_copy then
		at2(tag)
		return
	end
	local added_tags = 1
	for i = 1, #G.jokers.cards do
		local ret = G.jokers.cards[i]:calculate_joker({ cry_add_tag = true })
		if ret and ret.tags then
			added_tags = added_tags + ret.tags
		end
	end
	if added_tags >= 1 then
		at2(tag)
	end
	for i = 2, added_tags do
		at2(Tag(tag.key))
	end
end

local tr = Tag.remove
function Tag:remove()
	tr(self)
	if #G.HUD_tags >= 13 then
		for i = 2, #G.HUD_tags do
			G.HUD_tags[i].config.offset.y = 0.9 - 0.9 * 13 / #G.HUD_tags
		end
	end
end

local nr = new_round
function new_round()
	G.hand:change_size(0)
	nr()
end

local gfcfbs = G.FUNCS.check_for_buy_space
G.FUNCS.check_for_buy_space = function(card)
  if (card.ability.name == "cry-Negative Joker" and card.ability.extra >= 1) or
	(card.ability.name == "cry-soccer" and card.ability.extra.holygrail >= 1) or 
	(card.ability.name == "cry-Tenebris" and card.ability.extra.slots >= 1) then
    return true
  end
  return gfcfbs(card)
end

local gfcsc = G.FUNCS.can_select_card
G.FUNCS.can_select_card = function(e)
  if (e.config.ref_table.ability.name == "cry-Negative Joker" and e.config.ref_table.ability.extra >= 1) or
	(e.config.ref_table.ability.name == "cry-soccer" and e.config.ref_table.ability.extra.holygrail >= 1) or 
	(e.config.ref_table.ability.name == "cry-Tenebris" and e.config.ref_table.ability.extra.slots >= 1) then 
    e.config.colour = G.C.GREEN
    e.config.button = 'use_card'
  else
    gfcsc(e)
  end
end

--Redefine these here because they're always used
Cryptid.base_values = {}
function cry_misprintize_tbl(name, ref_tbl, ref_value, clear, override, stack)
	if name and ref_tbl and ref_value then
		tbl = cry_deep_copy(ref_tbl[ref_value])
		for k, v in pairs(tbl) do
			if (type(tbl[k]) ~= "table") or is_number(tbl[k]) then
				if
					is_number(tbl[k])
					and not (k == "id")
					and not (k == "colour")
					and not (k == "suit_nominal")
					and not (k == "base_nominal")
					and not (k == "face_nominal")
					and not (k == "qty")
					and not (k == "x_mult" and v == 1 and not tbl.override_x_mult_check)
					and not (k == "selected_d6_face")
				then --Temp fix, even if I did clamp the number to values that wouldn't crash the game, the fact that it did get randomized means that there's a higher chance for 1 or 6 than other values
					if not Cryptid.base_values[name] then
						Cryptid.base_values[name] = {}
					end
					if not Cryptid.base_values[name][k] then
						Cryptid.base_values[name][k] = tbl[k]
					end
					tbl[k] = cry_sanity_check(
						clear and Cryptid.base_values[name][k]
							or cry_format(
								(stack and tbl[k] or Cryptid.base_values[name][k])
									* cry_log_random(
										pseudoseed("cry_misprint" .. G.GAME.round_resets.ante),
										override and override.min or G.GAME.modifiers.cry_misprint_min,
										override and override.max or G.GAME.modifiers.cry_misprint_max
									),
								"%.2g"
							)
					)
				end
			else
				for _k, _v in pairs(tbl[k]) do
					if
						is_number(tbl[k][_k])
						and not (_k == "id")
						and not (k == "colour")
						and not (_k == "suit_nominal")
						and not (_k == "base_nominal")
						and not (_k == "face_nominal")
						and not (_k == "qty")
						and not (k == "x_mult" and v == 1 and not tbl[k].override_x_mult_check)
						and not (_k == "selected_d6_face")
					then --Refer to above
						if not Cryptid.base_values[name] then
							Cryptid.base_values[name] = {}
						end
						if not Cryptid.base_values[name][k] then
							Cryptid.base_values[name][k] = {}
						end
						if not Cryptid.base_values[name][k][_k] then
							Cryptid.base_values[name][k][_k] = tbl[k][_k]
						end
						tbl[k][_k] = cry_sanity_check(
							clear and Cryptid.base_values[name][k][_k]
								or cry_format(
									(stack and tbl[k][_k] or Cryptid.base_values[name][k][_k])
										* cry_log_random(
											pseudoseed("cry_misprint" .. G.GAME.round_resets.ante),
											override and override.min or G.GAME.modifiers.cry_misprint_min,
											override and override.max or G.GAME.modifiers.cry_misprint_max
										),
									"%.2g"
								)
						)
					end
				end
			end
		end
		ref_tbl[ref_value] = tbl
	end
end
function cry_misprintize_val(val, override)
	if is_number(val) then
		val = cry_sanity_check(
			cry_format(
				val
					* cry_log_random(
						pseudoseed("cry_misprint" .. G.GAME.round_resets.ante),
						override and override.min or G.GAME.modifiers.cry_misprint_min,
						override and override.max or G.GAME.modifiers.cry_misprint_max
					),
				"%.2g"
			)
		)
	end
	return val
end
function cry_sanity_check(val)
	if not val or type(val) == "number" and (val ~= val or val > 1e300 or val < -1e300) then
		return 1e300
	end
	return val
end
function cry_misprintize(card, override, force_reset, stack)
	--infinifusion compat
	if card.infinifusion then
		if card.config.center == card.infinifusion_center or card.config.center.key == 'j_infus_fused' then
			calculate_infinifusion(card, nil, function(i)
				cry_misprintize(card, override, force_reset, stack)
			end)
		end
	end
	if
		(not force_reset or G.GAME.modifiers.cry_jkr_misprint_mod)
		and (G.GAME.modifiers.cry_misprint_min or override or card.ability.set == "Joker")
		and not stack or (not Card.no(card, "immune_to_chemach", true) and not Card.no(card, "immutable", true))
	then
		if card.ability.name == "Ace Aequilibrium" then return end
		if G.GAME.modifiers.cry_jkr_misprint_mod and card.ability.set == "Joker" then
			if not override then
				override = {}
			end
			override.min = override.min or G.GAME.modifiers.cry_misprint_min or 1
			override.max = override.max or G.GAME.modifiers.cry_misprint_max or 1
			override.min = override.min * G.GAME.modifiers.cry_jkr_misprint_mod
			override.max = override.max * G.GAME.modifiers.cry_jkr_misprint_mod
		end
		if G.GAME.modifiers.cry_misprint_min or override and override.min then
			cry_misprintize_tbl(card.config.center_key, card, "ability", nil, override, stack)
			if card.base then
				cry_misprintize_tbl(card.config.card_key, card, "base", nil, override, stack)
			end
		end
		if G.GAME.modifiers.cry_misprint_min then
			--card.cost = cry_format(card.cost / cry_log_random(pseudoseed('cry_misprint'..G.GAME.round_resets.ante),override and override.min or G.GAME.modifiers.cry_misprint_min,override and override.max or G.GAME.modifiers.cry_misprint_max),"%.2f")
			card.misprint_cost_fac = 1
				/ cry_log_random(
					pseudoseed("cry_misprint" .. G.GAME.round_resets.ante),
					override and override.min or G.GAME.modifiers.cry_misprint_min,
					override and override.max or G.GAME.modifiers.cry_misprint_max
				)
			card:set_cost()
		end
	else
		cry_misprintize_tbl(card.config.center_key, card, "ability", true)
	end
	if card.ability.consumeable then
		for k, v in pairs(card.ability.consumeable) do
			card.ability.consumeable[k] = cry_deep_copy(card.ability[k])
		end
	end
end
function cry_log_random(seed, min, max)
	math.randomseed(seed)
	local lmin = math.log(min, 2.718281828459045)
	local lmax = math.log(max, 2.718281828459045)
	local poll = math.random() * (lmax - lmin) + lmin
	return math.exp(poll)
end
function cry_format(number, str)
	if math.abs(to_big(number)) >= to_big(1e300) then
		return number
	end
	return tonumber(str:format((Big and to_number(to_big(number)) or number)))
end
--use ID to work with glitched/misprint
function Card:get_nominal(mod)
	local mult = 1
	local rank_mult = 1
	if mod == "suit" then
		mult = 1000000
	end
	if self.ability.effect == "Stone Card" or (self.config.center.no_suit and self.config.center.no_rank) then
		mult = -10000
	elseif self.config.center.no_suit then
		mult = 0
	elseif self.config.center.no_rank then
		rank_mult = 0
	end
	return 10 * (self.base.id or 0.1) * rank_mult
		+ self.base.suit_nominal * mult
		+ (self.base.suit_nominal_original or 0) * 0.0001 * mult
		+ 10 * self.base.face_nominal * rank_mult
		+ 0.000001 * self.unique_val
end

--Cryptid (THE MOD) localization
local function parse_loc_txt(center)
	center.text_parsed = {}
	if not center.text then else
		for _, line in ipairs(center.text) do
			center.text_parsed[#center.text_parsed+1] = loc_parse_string(line)
		end
		center.name_parsed = {}
		for _, line in ipairs(type(center.name) == 'table' and center.name or {center.name}) do
			center.name_parsed[#center.name_parsed+1] = loc_parse_string(line)
		end
		if center.unlock then
			center.unlock_parsed = {}
			for _, line in ipairs(center.unlock) do
				center.unlock_parsed[#center.unlock_parsed+1] = loc_parse_string(line)
			end
		end
	end
end
local il = init_localization
function init_localization()
	il()
	if G.SETTINGS.language == "en-us" then
		G.localization.descriptions.Spectral.c_cryptid.text[2] = "{C:attention}#2#{} selected card"
		G.localization.descriptions.Spectral.c_talisman.text[2] = "to {C:attention}#1#{} selected"
		G.localization.descriptions.Spectral.c_trance.text[2] = "to {C:attention}#1#{} selected"
		G.localization.descriptions.Spectral.c_medium.text[2] = "to {C:attention}#1#{} selected"
		G.localization.descriptions.Spectral.c_deja_vu.text[2] = "to {C:attention}#1#{} selected"
		G.localization.descriptions.Spectral.c_deja_vu.text[2] = "to {C:attention}#1#{} selected"
		G.localization.descriptions.Spectral.c_deja_vu.text[2] = "to {C:attention}#1#{} selected"
		G.localization.descriptions.Voucher.v_antimatter.text[1] = "{C:dark_edition}+#1#{} Joker Slot"
		G.localization.descriptions.Voucher.v_overstock_norm.text[1] = "{C:attention}+#1#{} card slot"
		G.localization.descriptions.Voucher.v_overstock_plus.text[1] = "{C:attention}+#1#{} card slot"
		G.localization.descriptions.Voucher.v_crystal_ball.text[1] = "{C:attention}+#1#{} consumable slot"
		G.localization.descriptions.Joker.j_seance.text[1] = "If {C:attention}played hand{} contains a" -- damnit seance
	end
	if Cryptid.obj_buffer.Stake then
		for i = 1, #Cryptid.obj_buffer.Stake do
			local key = Cryptid.obj_buffer.Stake[i].key
			local color = G.localization.descriptions.Stake[key] and G.localization.descriptions.Stake[key].colour
			if color then
				local sticker_key = key:sub(7).."_sticker"
				if not G.localization.descriptions.Other[sticker_key] then
					G.localization.descriptions.Other[sticker_key] = {
						name = localize{type='variable',key='cry_sticker_name',vars={color}}[1],
						text = localize{type='variable',key='cry_sticker_desc',vars={color,"{C:attention}","{}"}},
					}
					parse_loc_txt(G.localization.descriptions.Other[sticker_key])
				end
			end
		end
	end
end

function SMODS.current_mod.reset_game_globals(run_start)
	G.GAME.cry_ach_conditions = G.GAME.cry_ach_conditions or {}
end

--Fix a corrupted game state
function Controller:queue_L_cursor_press(x, y)
	if self.locks.frame then
		return
	end
	if G.STATE == G.STATES.SPLASH then
		if not G.HUD then
			self:key_press("escape")
		else
			G.STATE = G.STATES.BLIND_SELECT
		end
	end
	self.L_cursor_queue = { x = x, y = y }
end

--Used to check to play the exotic music
function cry_has_exotic()
	if G.jokers then
		for i = 1, #G.jokers.cards do
			if G.jokers.cards[i].config.center.rarity == "cry_exotic" then
				return true
			end
		end
	end
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

-- Fix a CCD-related crash
local cuc = Card.can_use_consumeable
function Card:can_use_consumeable(any_state, skip_check)
	if not self.ability.consumeable then
		return false
	end
	return cuc(self, any_state, skip_check)
end

--make this always active to prevent crashes
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

--Stickers and modifiers used by Challenges+Stakes
SMODS.Atlas({
	key = "sticker",
	path = "sticker_cry.png",
	px = 71,
	py = 95,
	inject = function(self)
		local file_path = type(self.path) == "table"
				and (self.path[G.SETTINGS.language] or self.path["default"] or self.path["en-us"])
			or self.path
		if file_path == "DEFAULT" then
			return
		end
		-- language specific sprites override fully defined sprites only if that language is set
		if self.language and not (G.SETTINGS.language == self.language) then
			return
		end
		if not self.language and self.obj_table[("%s_%s"):format(self.key, G.SETTINGS.language)] then
			return
		end
		self.full_path = (self.mod and self.mod.path or SMODS.path)
			.. "assets/"
			.. G.SETTINGS.GRAPHICS.texture_scaling
			.. "x/"
			.. file_path
		local file_data =
			assert(NFS.newFileData(self.full_path), ("Failed to collect file data for Atlas %s"):format(self.key))
		self.image_data = assert(
			love.image.newImageData(file_data),
			("Failed to initialize image data for Atlas %s"):format(self.key)
		)
		self.image =
			love.graphics.newImage(self.image_data, { mipmaps = true, dpiscale = G.SETTINGS.GRAPHICS.texture_scaling })
		G[self.atlas_table][self.key_noloc or self.key] = self
		G.shared_sticker_banana =
			Sprite(0, 0, G.CARD_W, G.CARD_H, G[self.atlas_table][self.key_noloc or self.key], { x = 5, y = 2 })
		G.shared_sticker_pinned =
			Sprite(0, 0, G.CARD_W, G.CARD_H, G[self.atlas_table][self.key_noloc or self.key], { x = 5, y = 0 })
	end,
})
function Card:set_perishable(_perishable)
	self.ability.perishable = nil
	if
		(self.config.center.perishable_compat or G.GAME.modifiers.cry_any_stickers)
		and (not self.ability.eternal or G.GAME.modifiers.cry_eternal_perishable_compat)
	then
		self.ability.perishable = true
		self.ability.perish_tally = G.GAME.perishable_rounds or 5
	end
end
function Card:set_eternal(_eternal)
	self.ability.eternal = nil
	if
		(self.config.center.eternal_compat or G.GAME.modifiers.cry_any_stickers)
		and (not self.ability.perishable or G.GAME.modifiers.cry_eternal_perishable_compat)
	then
		self.ability.eternal = _eternal
	end
end
function Card:calculate_banana()
	if not self.ability.extinct then
		if self.ability.banana and (pseudorandom("banana") < G.GAME.probabilities.normal / 10) then
			self.ability.extinct = true
			G.E_MANAGER:add_event(Event({
				func = function()
					play_sound("tarot1")
					self.T.r = -0.2
					self:juice_up(0.3, 0.4)
					self.states.drag.is = true
					self.children.center.pinch.x = true
					G.E_MANAGER:add_event(Event({
						trigger = "after",
						delay = 0.3,
						blockable = false,
						func = function()
							if self.area then
								self.area:remove_card(self)
							end
							self:remove()
							self = nil
							return true
						end,
					}))
					return true
				end,
			}))
			card_eval_status_text(self, "jokers", nil, nil, nil, { message = localize("k_extinct_ex"), delay = 0.1 })
			return true
		elseif self.ability.banana then
			card_eval_status_text(self, "jokers", nil, nil, nil, { message = localize("k_safe_ex"), delay = 0.1 })
			return false
		end
	end
	return false
end
function Card:set_banana(_banana)
	self.ability.banana = _banana
end
function Card:set_pinned(_pinned)
	self.pinned = _pinned
end
--Register custom rarity pools
local is = SMODS.injectItems
function SMODS.injectItems()
	local m = is()
	G.P_JOKER_RARITY_POOLS.cry_epic = {}
	G.P_JOKER_RARITY_POOLS.cry_exotic = {}
	for k, v in pairs(G.P_CENTERS) do
		v.key = k
		if v.rarity and (v.rarity == "cry_epic" or v.rarity == "cry_exotic") and v.set == "Joker" and not v.demo then
			table.insert(G.P_JOKER_RARITY_POOLS[v.rarity], v)
		end
	end
	return m
end

--Gradients based on Balatrostuck code
local upd = Game.update
Cryptid.C = {
	EXOTIC = { HEX("708b91"), HEX("1e9eba") },
	TWILIGHT = { HEX("0800ff"), HEX("aa00ff") },
	VERDANT = { HEX("00ff22"), HEX("f4ff57") },
	EMBER = { HEX("ff0000"), HEX("ffae00") },
	DAWN = { HEX("00aaff"), HEX("ff00e3") },
	HORIZON = { HEX("c8fd09"), HEX("1ee7d9") },
	BLOSSOM = { HEX("ff09da"), HEX("ffd121") },
	AZURE = { HEX("0409ff"), HEX("63dcff") },
	ASCENDANT = { HEX("2e00f5"), HEX("e5001d") },
	JOLLY = { HEX("6ec1f5"), HEX("456b84") },
}
function Game:update(dt)
	upd(self, dt)
	local anim_timer = self.TIMERS.REAL * 1.5
	local p = 0.5 * (math.sin(anim_timer) + 1)
	for k, c in pairs(Cryptid.C) do
		if not G.C["CRY_" .. k] then
			G.C["CRY_" .. k] = { 0, 0, 0, 0 }
		end
		for i = 1, 4 do
			G.C["CRY_" .. k][i] = c[1][i] * p + c[2][i] * (1 - p)
		end
	end
	G.C.RARITY["cry_exotic"] = G.C.CRY_EXOTIC
	if Incantation and not CryptidIncanCompat then
		AllowStacking("Code")
		AllowDividing("Code")
		CryptidIncanCompat = true
	end
end

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
for i = 1, #jokers do
	Cryptid.food[#Cryptid.food+1] = jokers[i]
end

SMODS.Sound({
	key = "meow1",
	path = "meow1.ogg",
})
SMODS.Sound({
	key = "meow2",
	path = "meow2.ogg",
})
SMODS.Sound({
	key = "meow3",
	path = "meow3.ogg",
})
SMODS.Sound({
	key = "meow4",
	path = "meow4.ogg",
})
SMODS.Sound({
	key = "e_mosaic",
	path = "e_mosaic.ogg",
})
SMODS.Sound({
	key = "e_glitched",
	path = "e_glitched.ogg",
})
SMODS.Sound({
	key = "e_oversaturated",
	path = "e_oversaturated.ogg",
})
SMODS.Sound({
	key = "e_blur",
	path = "e_blur.ogg",
})
SMODS.Sound({
	key = "e_double_sided",
	path = "e_double_sided.ogg",
})
SMODS.Sound({
	key = "e_jolly",
	path = "e_jolly.ogg",
})
SMODS.Sound({
	key = "e_noisy",
	path = "e_noisy.ogg",
})
SMODS.Sound({
	key = "e_fragile",
	path = "e_fragile.ogg",
})
SMODS.Sound({
	key = "e_golden",
	path = "e_golden.ogg",
})
SMODS.Sound({
	key = "studiofromhelsinki",
	path = "studiofromhelsinki.ogg",
})
SMODS.Sound({
	key = "music_jimball",
	path = "music_jimball.ogg",
	sync = false,
	pitch = 1,
	select_music_track = function()
		return next(find_joker("cry-Jimball")) and Cryptid_config.Cryptid.jimball_music and 1.57e308
	end,
})
SMODS.Sound({
	key = "music_code",
	path = "music_code.ogg",
	select_music_track = function()
		return Cryptid_config.Cryptid.code_music
			and (
				(
					G.pack_cards
					and G.pack_cards.cards
					and G.pack_cards.cards[1]
					and G.pack_cards.cards[1].ability.set == "Code"
				) or (G.GAME and G.GAME.USING_CODE)
			)
	end,
})
SMODS.Sound({
	key = "music_big",
	path = "music_big.ogg",
	select_music_track = function()
		return Cryptid_config.Cryptid.big_music and to_big(G.GAME.round_scores["hand"].amt) > to_big(10) ^ 1000000
	end,
})
SMODS.Sound({
	key = "music_exotic",
	path = "music_exotic.ogg",
	volume = 0.4,
	select_music_track = function()
		return Cryptid_config.Cryptid.exotic_music and cry_has_exotic()
	end,
})
SMODS.Atlas({
	key = "modicon",
	path = "cry_icon.png",
	px = 32,
	py = 32,
}):register()
SMODS.Atlas({
	key = "placeholders",
	path = "placeholders.png",
	px = 71,
	py = 95,
}):register()
SMODS.Atlas({
	key = "atlasepic",
	path = "atlasepic.png",
	px = 71,
	py = 95,
}):register()
SMODS.Atlas({
	key = "atlasone",
	path = "atlasone.png",
	px = 71,
	py = 95,
}):register()
SMODS.Atlas({
	key = "atlastwo",
	path = "atlastwo.png",
	px = 71,
	py = 95,
}):register()
SMODS.Atlas({
	key = "atlasthree",
	path = "atlasthree.png",
	px = 71,
	py = 95,
}):register()
SMODS.Atlas({
	key = "atlasexotic",
	path = "atlasexotic.png",
	px = 71,
	py = 95,
}):register()
SMODS.Atlas({
	key = "atlasnotjokers", --this is easier to spell then consumables
	path = "atlasnotjokers.png",
	px = 71,
	py = 95,
}):register()
SMODS.Atlas({
	key = "tag_cry",
	path = "tag_cry.png",
	px = 34,
	py = 34,
}):register()
SMODS.Sticker:take_ownership("perishable", {
	atlas = "sticker",
	pos = { x = 4, y = 4 },
	prefix_config = { key = false },
	loc_vars = function(self, info_queue, card)
		if card.ability.consumeable then
			return { key = "cry_perishable_consumeable" }
		elseif card.ability.set == "Voucher" then
			return {
				key = "cry_perishable_voucher",
				vars = {
					G.GAME.cry_voucher_perishable_rounds or 1,
					card.ability.perish_tally or G.GAME.cry_voucher_perishable_rounds,
				},
			}
		elseif card.ability.set == "Booster" then
			return { key = "cry_perishable_booster" }
		else
			return { vars = { G.GAME.perishable_rounds or 1, card.ability.perish_tally or G.GAME.perishable_rounds } }
		end
	end,
})
SMODS.Sticker:take_ownership("pinned", {
	atlas = "sticker",
	pos = { x = 5, y = 0 },
	prefix_config = { key = false },
	loc_vars = function(self, info_queue, card)
		if card.ability.consumeable then
			return { key = "cry_pinned_consumeable" } -- this doesn't work. i want this to work :(
		elseif card.ability.set == "Voucher" then
			return { key = "cry_pinned_voucher" }
		elseif card.ability.set == "Booster" then
			return { key = "cry_pinned_booster" }
		end
	end,
})
SMODS.Sticker:take_ownership("eternal", {
	loc_vars = function(self, info_queue, card)
		if card.ability.set == "Voucher" then
			return { key = "cry_eternal_voucher" }
		elseif card.ability.set == "Booster" then
			return { key = "cry_eternal_booster" }
		end
	end,
})
SMODS.Sticker:take_ownership("rental", {
	loc_vars = function(self, info_queue, card)
		if card.ability.consumeable then
			return { key = "cry_rental_consumeable", vars = { G.GAME.cry_consumeable_rental_rate or 1 } }
		elseif card.ability.set == "Voucher" then
			return { key = "cry_rental_voucher", vars = { G.GAME.cry_voucher_rental_rate or 1 } }
		elseif card.ability.set == "Booster" then
			return { key = "cry_rental_booster" }
		else
			return { vars = { G.GAME.rental_rate or 1 } }
		end
	end,
})
----------------------------------------------
------------MOD CODE END----------------------
