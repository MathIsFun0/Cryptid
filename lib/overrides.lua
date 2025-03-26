-- overrides.lua - Adds hooks and overrides used by multiple features.

-- get_currrent_pool hook for Deck of Equilibrium and Copies
local gcp = get_current_pool
function get_current_pool(_type, _rarity, _legendary, _append, override_equilibrium_effect)
	if type == "Tag" then
		for i = 1, #pool do
			-- Copies: Turn Double tags into Triple Tags
			if pool[i] == "tag_double" and G.GAME.used_vouchers.v_cry_copies then
				pool[i] = "tag_cry_triple"
			end
			-- Tag Printer: Turn Double tags and Triple Tags into Quadruple Tags
			if (pool[i] == "tag_double" or pool[i] == "tag_cry_triple") and G.GAME.used_vouchers.v_cry_tag_printer then
				pool[i] = "tag_cry_quadruple"
			end
			-- Clone Machine: Turn Double tags and Triple Tags as well as Quadruple Tags into Quintuple Tags
			if
				(pool[i] == "tag_double" or pool[i] == "tag_cry_triple" or pool[i] == "tag_cry_quadruple")
				and G.GAME.used_vouchers.v_cry_clone_machine
			then
				pool[i] = "tag_cry_quintuple"
			end
		end
	-- Deck of Equilibrium stuff
	elseif
		G.GAME.modifiers.cry_equilibrium
		and not override_equilibrium_effect
		and (_append == "sho" or _type == "Voucher" or _type == "Booster")
	then
		if
			_type ~= "Enhanced"
			and _type ~= "Edition"
			and _type ~= "Back"
			and _type ~= "Tag"
			and _type ~= "Seal"
			and _type ~= "Stake"
		then
			-- we're regenerating the pool every time because of banned keys but it's fine tbh
			P_CRY_ITEMS = {}
			local valid_pools = { "Joker", "Consumeables", "Voucher", "Booster" }
			for _, id in ipairs(valid_pools) do
				for k, v in pairs(G.P_CENTER_POOLS[id]) do
					if
						v.unlocked == true
						and not Cryptid.no(v, "doe", k)
						and not (G.GAME.banned_keys[v.key] or G.GAME.cry_banished_keys[v.key])
					then
						P_CRY_ITEMS[#P_CRY_ITEMS + 1] = v.key
					end
				end
			end
			if #P_CRY_ITEMS <= 0 then
				P_CRY_ITEMS[#P_CRY_ITEMS + 1] = "v_blank"
			end
			return P_CRY_ITEMS, "cry_equilibrium" .. G.GAME.round_resets.ante
		end
	end
	return gcp(_type, _rarity, _legendary, _append)
end
local gnb = get_new_boss
function get_new_boss()
	--Fix an issue with adding bosses mid-run
	for k, v in pairs(G.P_BLINDS) do
		if not G.GAME.bosses_used[k] then
			G.GAME.bosses_used[k] = 0
		end
	end
	--This is how nostalgic deck replaces the boss blinds with Nostalgic versions
	local bl = gnb()
	if G.GAME.modifiers.cry_beta then
		local bl_key = string.sub(bl, 4)
		local nostalgicblinds = {
			arm = (Cryptid.enabled("bl_cry_oldarm") == true),
			fish = (Cryptid.enabled("bl_cry_oldfish") == true),
			flint = (Cryptid.enabled("bl_cry_oldflint") == true),
			house = (Cryptid.enabled("bl_cry_oldhouse") == true),
			manacle = (Cryptid.enabled("bl_cry_oldmanacle") == true),
			mark = (Cryptid.enabled("bl_cry_oldmark") == true),
			ox = (Cryptid.enabled("bl_cry_oldox") == true),
			pillar = (Cryptid.enabled("bl_cry_oldpillar") == true),
			serpent = (Cryptid.enabled("bl_cry_oldserpent") == true),
		}
		if nostalgicblinds[bl_key] then
			return "bl_cry_old" .. bl_key
		end
	end
	return bl
end

--Add context for after cards are played
local gfep = G.FUNCS.evaluate_play
function G.FUNCS.evaluate_play(e)
	gfep(e)
	G.GAME.blind:cry_after_play()
end

--Add context for Just before cards are played
local pcfh = G.FUNCS.play_cards_from_highlighted
function G.FUNCS.play_cards_from_highlighted(e)
	G.GAME.before_play_buffer = true
	G.GAME.blind:cry_before_play()
	pcfh(e)
	G.GAME.before_play_buffer = nil
end

--Track defeated blinds for Obsidian Orb
local dft = Blind.defeat
function Blind:defeat(s)
	dft(self, s)
	local obj = self.config.blind
	-- Ignore blinds with loc_vars because orb does not properly work with them yet
	if obj.boss and (obj.boss.no_orb or obj.boss.epic or obj.loc_vars) then
		return
	end
	if
		self.name ~= "cry-Obsidian Orb"
		--Stop impossible blind combinations from happening
		and self.name ~= "The Sink"
		and (self.name ~= "cry-oldarm" or not G.GAME.defeated_blinds["bl_psychic"])
		and (self.name ~= "The Psychic" or not G.GAME.defeated_blinds["bl_cry_oldarm"])
		and (self.name ~= "The Eye" or not G.GAME.defeated_blinds["bl_mouth"])
		and (self.name ~= "The Mouth" or not G.GAME.defeated_blinds["bl_eye"])
		and (self.name ~= "cry-Lavender Loop" or not G.GAME.defeated_blinds["bl_cry_tax"])
		and (self.name ~= "cry-Tax" or not G.GAME.defeated_blinds["bl_cry_lavender_loop"])
		and (self.name ~= "The Needle" or not G.GAME.defeated_blinds["bl_cry_tax"])
		and (self.name ~= "cry-Tax" or not G.GAME.defeated_blinds["bl_needle"])
	then
		G.GAME.defeated_blinds[self.config.blind.key] = true
	end
end

local sr = Game.start_run
function Game:start_run(args)
	sr(self, args)
	if G.P_BLINDS.bl_cry_clock then
		G.P_BLINDS.bl_cry_clock.mult = 0
	end
	if not G.GAME.defeated_blinds then
		G.GAME.defeated_blinds = {}
	end
end

--patch for multiple Clocks to tick separately and load separately
local bsb = Blind.set_blind
function Blind:set_blind(blind, y, z)
	local c = "Boss"
	if string.sub(G.GAME.subhash or "", -1) == "S" then
		c = "Small"
	end
	if string.sub(G.GAME.subhash or "", -1) == "B" then
		c = "Big"
	end
	if G.GAME.CRY_BLINDS and G.GAME.CRY_BLINDS[c] and not y and blind and blind.mult and blind.cry_ante_base_mod then
		blind.mult = G.GAME.CRY_BLINDS[c]
	end
	bsb(self, blind, y, z)
end

local rb = reset_blinds
function reset_blinds()
	if G.GAME.round_resets.blind_states.Boss == "Defeated" then
		G.GAME.CRY_BLINDS = {}
		if G.P_BLINDS.bl_cry_clock then
			G.P_BLINDS.bl_cry_clock.mult = 0
		end
	end
	rb()
end
--Init stuff at the start of the game
local gigo = Game.init_game_object
function Game:init_game_object()
	local g = gigo(self)
	-- Add initial dropshot and number blocks card
	g.current_round.cry_nb_card = { rank = "Ace" }
	g.current_round.cry_dropshot_card = { suit = "Spades" }
	g.monstermult = 1
	-- Create G.GAME.events when starting a run, so there's no errors
	g.events = {}
	g.jokers_sold = {}
	return g
end

-- reset_castle_card hook for things like Dropshot and Number Blocks
local rcc = reset_castle_card
function reset_castle_card()
	rcc()
	G.GAME.current_round.cry_nb_card = { rank = "Ace" }
	if not G.GAME.current_round.cry_dropshot_card then
		G.GAME.current_round.cry_dropshot_card = {}
	end
	G.GAME.current_round.cry_dropshot_card.suit = "Spades"
	local valid_castle_cards = {}
	for k, v in ipairs(G.playing_cards) do
		if not SMODS.has_no_suit(v) then
			valid_castle_cards[#valid_castle_cards + 1] = v
		end
	end
	if valid_castle_cards[1] then
		--Dropshot
		local castle_card = pseudorandom_element(valid_castle_cards, pseudoseed("cry_dro" .. G.GAME.round_resets.ante))
		if not G.GAME.current_round.cry_dropshot_card then
			G.GAME.current_round.cry_dropshot_card = {}
		end
		G.GAME.current_round.cry_dropshot_card.suit = castle_card.base.suit
		--Number Blocks
		local castle_card_two =
			pseudorandom_element(valid_castle_cards, pseudoseed("cry_nb" .. G.GAME.round_resets.ante))
		if not G.GAME.current_round.cry_nb_card then
			G.GAME.current_round.cry_nb_card = {}
		end
		G.GAME.current_round.cry_nb_card.rank = castle_card_two.base.value
		G.GAME.current_round.cry_nb_card.id = castle_card_two.base.id
	end
end

-- Back.apply_to_run Hook for decks
local Backapply_to_runRef = Back.apply_to_run
function Back.apply_to_run(self)
	Backapply_to_runRef(self)
	if self.effect.config.cry_no_edition_price then
		G.GAME.modifiers.cry_no_edition_price = true
	end
end

--Game:update hook
local upd = Game.update

--init colors so they have references
G.C.CRY_TWILIGHT = { 0, 0, 0, 0 }
G.C.CRY_VERDANT = { 0, 0, 0, 0 }
G.C.CRY_EMBER = { 0, 0, 0, 0 }
G.C.CRY_DAWN = { 0, 0, 0, 0 }
G.C.CRY_HORIZON = { 0, 0, 0, 0 }
G.C.CRY_BLOSSOM = { 0, 0, 0, 0 }
G.C.CRY_AZURE = { 0, 0, 0, 0 }
G.C.CRY_ASCENDANT = { 0, 0, 0, 0 }
G.C.CRY_JOLLY = { 0, 0, 0, 0 }
G.C.CRY_GREENGRADIENT = { 0, 0, 0, 0 }
G.C.CRY_ALTGREENGRADIENT = { 0, 0, 0, 0 }
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
	SELECTED = { HEX("e38039"), HEX("ccdd1b") },
	GREENGRADIENT = { HEX("51e099"), HEX("1e523a") },
	ALTGREENGRADIENT = { HEX("6bb565"), HEX("bd28bf") },
}
cry_pointer_dt = 0
cry_jimball_dt = 0
cry_glowing_dt = 0
function Game:update(dt)
	upd(self, dt)

	--Gradients based on Balatrostuck code
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
	G.C.SECONDARY_SET["Content Set"] = G.C.CRY_ASCENDANT
	-- Idk what this is for
	if Incantation and not CryptidIncanCompat then
		AllowStacking("Code")
		AllowDividing("Code")
		CryptidIncanCompat = true
	end
	if Cryptid.enabled("set_cry_timer") == true then
		cry_pointer_dt = cry_pointer_dt + dt
		cry_jimball_dt = cry_jimball_dt + dt
		cry_glowing_dt = cry_glowing_dt + dt
	end
	--Update sprite positions each frame on certain cards to give the illusion of an animated card
	if G.P_CENTERS and G.P_CENTERS.c_cry_pointer and cry_pointer_dt > 0.5 then
		cry_pointer_dt = 0
		local pointerobj = G.P_CENTERS.c_cry_pointer
		pointerobj.pos.x = (pointerobj.pos.x == 11) and 12 or 11
	end
	if G.P_CENTERS and G.P_CENTERS.j_cry_jimball and cry_jimball_dt > 0.1 then
		cry_jimball_dt = 0
		local jimballobj = G.P_CENTERS.j_cry_jimball
		if jimballobj.pos.x == 5 and jimballobj.pos.y == 6 then
			jimballobj.pos.x = 0
			jimballobj.pos.y = 0
		elseif jimballobj.pos.x < 8 then
			jimballobj.pos.x = jimballobj.pos.x + 1
		elseif jimballobj.pos.y < 6 then
			jimballobj.pos.x = 0
			jimballobj.pos.y = jimballobj.pos.y + 1
		end
	end
	if G.P_CENTERS and G.P_CENTERS.b_cry_glowing and cry_glowing_dt > 0.1 then
		cry_glowing_dt = 0
		local glowingobj = G.P_CENTERS.b_cry_glowing
		if glowingobj.pos.x == 1 and glowingobj.pos.y == 4 then
			glowingobj.pos.x = 0
			glowingobj.pos.y = 0
		elseif glowingobj.pos.x < 4 then
			glowingobj.pos.x = glowingobj.pos.x + 1
		elseif glowingobj.pos.y < 6 then
			glowingobj.pos.x = 0
			glowingobj.pos.y = glowingobj.pos.y + 1
		end
	end
	for k, v in pairs(G.I.CARD) do
		if v.children.back and v.children.back.atlas.name == "cry_glowing" then
			v.children.back:set_sprite_pos(G.P_CENTERS.b_cry_glowing.pos or G.P_CENTERS["b_red"].pos)
		end
	end
	if not G.OVERLAY_MENU and not G.CHOOSE_CARD and G.GAME.USING_POINTER then
		G.CHOOSE_CARD = UIBox({
			definition = create_UIBox_pointer(card),
			config = {
				align = "cm",
				offset = { x = 0, y = 10 },
				major = G.ROOM_ATTACH,
				bond = "Weak",
				instance_type = "POPUP",
			},
		})
		G.CHOOSE_CARD.alignment.offset.y = 0
		G.ROOM.jiggle = G.ROOM.jiggle + 1
		G.CHOOSE_CARD:align_to_major()
	end

	--Increase the blind size for The Clock and Lavender Loop
	local choices = { "Small", "Big", "Boss" }
	G.GAME.CRY_BLINDS = G.GAME.CRY_BLINDS or {}
	for _, c in pairs(choices) do
		if
			G.GAME
			and G.GAME.round_resets
			and G.GAME.round_resets.blind_choices
			and G.GAME.round_resets.blind_choices[c]
			and G.P_BLINDS[G.GAME.round_resets.blind_choices[c]].cry_ante_base_mod
		then
			if
				G.P_BLINDS[G.GAME.round_resets.blind_choices[c]].mult ~= 0
				and G.P_BLINDS[G.GAME.round_resets.blind_choices[c]].mult_ante ~= G.GAME.round_resets.ante
			then
				if G.P_BLINDS[G.GAME.round_resets.blind_choices[c]].name == "cry-Obsidian Orb" then
					for i = 1, #G.GAME.defeated_blinds do
						G.P_BLINDS[G.GAME.round_resets.blind_choices[c]].mult = G.P_BLINDS[G.GAME.round_resets.blind_choices[c]].mult
							* G.P_BLINDS[G.GAME.defeated_blinds[i]]
							/ 2
					end
				else
					G.P_BLINDS[G.GAME.round_resets.blind_choices[c]].mult = 0
				end
				G.P_BLINDS[G.GAME.round_resets.blind_choices[c]].mult_ante = G.GAME.round_resets.ante
			end
			if
				G.GAME.round_resets.blind_states[c] ~= "Current"
				and G.GAME.round_resets.blind_states[c] ~= "Defeated"
			then
				G.GAME.CRY_BLINDS[c] = (G.GAME.CRY_BLINDS[c] or G.P_BLINDS[G.GAME.round_resets.blind_choices[c]].mult)
					+ (
						G.P_BLINDS[G.GAME.round_resets.blind_choices[c]].cry_ante_base_mod
							and G.P_BLINDS[G.GAME.round_resets.blind_choices[c]]:cry_ante_base_mod(
								dt * (G.GAME.modifiers.cry_rush_hour_iii and 2 or 1)
							)
						or 0
					)
				--Update UI
				--todo: in blinds screen, too
				if G.blind_select_opts then
					if (SMODS.Mods["StrangeLib"] or {}).can_load then
						StrangeLib.dynablind.blind_choice_scores[c] = get_blind_amount(G.GAME.round_resets.blind_ante)
							* G.GAME.starting_params.ante_scaling
							* G.GAME.CRY_BLINDS[c]
						StrangeLib.dynablind.blind_choice_score_texts[c] =
							number_format(StrangeLib.dynablind.blind_choice_scores[c])
					else
						local blind_UI =
							G.blind_select_opts[string.lower(c)].definition.nodes[1].nodes[1].nodes[1].nodes[1]
						local chip_text_node = blind_UI.nodes[1].nodes[3].nodes[1].nodes[2].nodes[2].nodes[3]
						if chip_text_node then
							chip_text_node.config.text = number_format(
								get_blind_amount(G.GAME.round_resets.blind_ante)
									* G.GAME.starting_params.ante_scaling
									* G.GAME.CRY_BLINDS[c]
							)
							chip_text_node.config.scale = score_number_scale(
								0.9,
								get_blind_amount(G.GAME.round_resets.blind_ante)
									* G.GAME.starting_params.ante_scaling
									* G.GAME.CRY_BLINDS[c]
							)
						end
						G.blind_select_opts[string.lower(c)]:recalculate()
					end
				end
			elseif
				G.GAME.round_resets.blind_states[c] ~= "Defeated"
				and not G.GAME.blind.disabled
				and to_big(G.GAME.chips) < to_big(G.GAME.blind.chips)
			then
				G.GAME.blind.chips = G.GAME.blind.chips
					+ G.GAME.blind:cry_ante_base_mod(dt * (G.GAME.modifiers.cry_rush_hour_iii and 2 or 1))
						* get_blind_amount(G.GAME.round_resets.ante)
						* G.GAME.starting_params.ante_scaling
				G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
			end
		end
		if
			G.GAME.round_resets.blind_states[c] == "Current"
			and G.GAME
			and G.GAME.blind
			and not G.GAME.blind.disabled
			and to_big(G.GAME.chips) < to_big(G.GAME.blind.chips)
		then
			G.GAME.blind.chips = G.GAME.blind.chips
				* (
					G.GAME.blind.cry_round_base_mod
						and G.GAME.blind:cry_round_base_mod(dt * (G.GAME.modifiers.cry_rush_hour_iii and 2 or 1))
					or 1
				)
			G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
		end
	end
end

-- All the scattered set_cost hooks from all the pre refactor files moved into one hook
local sc = Card.set_cost
function Card:set_cost()
	-- Makes the edition cost increase usually present not apply if this variable is true
	-- Used for some of the Jen's almanac edition decks because having the price increase apply was "unfun"
	if self.edition and G.GAME.modifiers.cry_no_edition_price then
		local m = Cryptid.deep_copy(self.edition)
		self.edition = nil
		sc(self)
		self.edition = m
	else
		sc(self)
	end
	--Makes cube and Big Cube always cost a set amount
	if self.ability.name == "cry-Cube" then
		if Card.get_gameset(self) ~= "modest" then
			self.cost = -27
		else
			self.cost = -12
		end
	end
	if self.ability.name == "cry-Big Cube" then
		self.cost = 27
	end

	--Multiplies voucher cost by G.GAME.modifiers.cry_voucher_price_hike
	--Used by bronze stake to make vouchers %50 more expensive
	if self.ability.set == "Voucher" and G.GAME.modifiers.cry_voucher_price_hike then
		self.cost = math.floor(self.cost * G.GAME.modifiers.cry_voucher_price_hike)
		--Update related costs
		self.sell_cost = math.max(1, math.floor(self.cost / 2)) + (self.ability.extra_value or 0)
		if self.area and self.ability.couponed and (self.area == G.shop_jokers or self.area == G.shop_booster) then
			self.cost = 0
		end
		self.sell_cost_label = self.facing == "back" and "?" or self.sell_cost
	end

	--Makes Cursed Jokers always sell for $0
	if self.config and self.config.center and self.config.center.rarity == "cry_cursed" then
		self.sell_cost = 0
		self.sell_cost_label = 0
	end
end
local sell_card_stuff = Card.sell_card
function Card:sell_card()
	if self.config.center.set == "Joker" then
		if self.config.center.key ~= "j_cry_necromancer" then
			local contained = false
			for _, v in ipairs(G.GAME.jokers_sold) do
				if v == self.config.center.key then
					contained = true
					break
				end
			end
			if not contained then
				table.insert(G.GAME.jokers_sold, self.config.center.key)
			end
		end
		-- Add Jolly Joker to the pool if card was treated as Jolly Joker
		if self:is_jolly() then
			local contained = false
			for _, v in ipairs(G.GAME.jokers_sold) do
				if v == "j_jolly" then
					contained = true
					break
				end
			end
			if not contained then
				table.insert(G.GAME.jokers_sold, "j_jolly")
			end
		end
	end
	--G.P_CENTERS.j_jolly
	sell_card_stuff(self)
end

-- Modify to display badges for credits and some gameset badges
-- todo: make this optional
local smcmb = SMODS.create_mod_badges
function SMODS.create_mod_badges(obj, badges)
	smcmb(obj, badges)
	if not SMODS.config.no_mod_badges and obj and obj.cry_credits then
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
		if obj.cry_credits.art or obj.cry_credits.code or obj.cry_credits.idea then
			local scale_fac = {}
			local min_scale_fac = 1
			local strings = { "Cryptid" }
			for _, v in ipairs({ "idea", "art", "code" }) do
				if obj.cry_credits[v] then
					for i = 1, #obj.cry_credits[v] do
						strings[#strings + 1] =
							localize({ type = "variable", key = "cry_" .. v, vars = { obj.cry_credits[v][i] } })[1]
					end
				end
			end
			for i = 1, #strings do
				scale_fac[i] = calc_scale_fac(strings[i])
				min_scale_fac = math.min(min_scale_fac, scale_fac[i])
			end
			local ct = {}
			for i = 1, #strings do
				ct[i] = {
					string = strings[i],
				}
			end
			local cry_badge = {
				n = G.UIT.R,
				config = { align = "cm" },
				nodes = {
					{
						n = G.UIT.R,
						config = {
							align = "cm",
							colour = G.C.CRY_EXOTIC,
							r = 0.1,
							minw = 2 / min_scale_fac,
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
										colours = { obj.cry_credits and obj.cry_credits.text_colour or G.C.WHITE },
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
			local function eq_col(x, y)
				for i = 1, 4 do
					if x[1] ~= y[1] then
						return false
					end
				end
				return true
			end
			for i = 1, #badges do
				if eq_col(badges[i].nodes[1].config.colour, HEX("708b91")) then
					badges[i].nodes[1].nodes[2].config.object:remove()
					badges[i] = cry_badge
					break
				end
			end
		end
		if obj.cry_credits.jolly then
			local scale_fac = {}
			local min_scale_fac = 1
			for i = 1, #obj.cry_credits.jolly do
				scale_fac[i] = calc_scale_fac(obj.cry_credits.jolly[i])
				min_scale_fac = math.min(min_scale_fac, scale_fac[i])
			end
			local ct = {}
			for i = 1, #obj.cry_credits.jolly do
				ct[i] = {
					string = obj.cry_credits.jolly[i],
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
							colour = G.C.CRY_JOLLY,
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
										colours = { obj.cry_credits and obj.cry_credits.text_colour_jolly or G.C.WHITE },
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
	if Cryptid.safe_get(G, "ACTIVE_MOD_UI", "id") == "Cryptid" and obj and not obj.force_gameset then
		local set = Cryptid.gameset(obj)
		if set == "disabled" or obj.set == "Content Set" then
			return
		end
		local card_type = localize("cry_gameset_" .. Cryptid.gameset(obj))
		if card_type == "ERROR" then
			card_type = localize("cry_gameset_custom")
		end
		badges[#badges + 1] = create_badge(
			card_type,
			set == "modest" and G.C.GREEN
				or set == "mainline" and G.C.RED
				or set == "madness" and G.C.CRY_EXOTIC
				or G.C.CRY_ASCENDANT
		)
	end
end

-- This is short enough that I'm fine overriding it
function calculate_reroll_cost(skip_increment)
	if not G.GAME.current_round.free_rerolls or G.GAME.current_round.free_rerolls < 0 then
		G.GAME.current_round.free_rerolls = 0
	end
	if next(find_joker("cry-crustulum")) or G.GAME.current_round.free_rerolls > 0 then
		G.GAME.current_round.reroll_cost = 0
		return
	end
	if next(find_joker("cry-candybuttons")) then
		G.GAME.current_round.reroll_cost = 1
		return
	end
	if G.GAME.used_vouchers.v_cry_rerollexchange then
		G.GAME.current_round.reroll_cost = 2
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

-- We're modifying so much of this for Brown and Yellow Stake, Equilibrium Deck, etc. that it's fine to override...
function create_card(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
	local area = area or G.jokers
	local pseudo = function(x)
		return pseudorandom(pseudoseed(x))
	end
	local ps = pseudoseed
	if area == "ERROR" then
		pseudo = function(x)
			return pseudorandom(Cryptid.predict_pseudoseed(x))
		end
		ps = Cryptid.predict_pseudoseed
	end
	local center = G.P_CENTERS.b_red
	if (_type == "Joker" or _type == "Meme") and G.GAME and G.GAME.modifiers and G.GAME.modifiers.all_rnj then
		forced_key = "j_cry_rnjoker"
	end
	local function aeqviable(center)
		return center.unlocked and not Cryptid.no(center, "doe") and not (center.rarity == "cry_exotic")
	end
	if _type == "Joker" and not _rarity and not legendary then
		if not G.GAME.aequilibriumkey then
			G.GAME.aequilibriumkey = 1
		end
		local aeqactive = nil
		if next(find_joker("Ace Aequilibrium")) and not forced_key then
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
		if not ret.ability then
			ret.ability = {}
		end
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
				not card.ability.eternal
				and G.GAME.modifiers.cry_enable_flipped_in_shop
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
		local edition = Cryptid.poll_random_edition()
		card:set_edition(edition, true)
	end
	if not (card.edition and (card.edition.cry_oversat or card.edition.cry_glitched)) then
		Cryptid.misprintize(card)
	end
	if card.ability.set == "Joker" and G.GAME.modifiers.cry_common_value_quad then
		if card.config.center.rarity == 1 then
			Cryptid.misprintize(card, { min = 4, max = 4 }, nil, true)
		end
	end
	if card.ability.set == "Joker" and G.GAME.modifiers.cry_uncommon_value_quad then
		if card.config.center.rarity == 2 then
			Cryptid.misprintize(card, { min = 4, max = 4 }, nil, true)
		end
	end
	if card.ability.consumeable and card.pinned then -- counterpart is in Sticker.toml
		G.GAME.cry_pinned_consumeables = G.GAME.cry_pinned_consumeables + 0
	end
	if next(find_joker("Cry-topGear")) and card.config.center.rarity == 1 then
		if
			card.ability.name ~= "cry-meteor"
			and card.ability.name ~= "cry-exoplanet"
			and card.ability.name ~= "cry-stardust"
			and card.ability.name ~= "cry-universe"
		then
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
	if card.ability.name == "cry-universe" then
		card:set_edition("e_cry_astral", true, nil, true)
	end
	-- Certain jokers such as Steel Joker and Driver's License depend on values set
	-- during the update function. Cryptid can create jokers mid-scoring, meaning
	-- those values will be unset during scoring unless update() is manually called.
	card:update(0.016) -- dt is unused in the base game, but we're providing a realistic value anyway

	--Debuff jokers if certain boss blinds are active
	if _type == "Joker" and G.GAME and G.GAME.blind and not G.GAME.blind.disabled then
		if
			G.GAME.blind.name == "cry-box"
			or (G.GAME.blind.name == "cry-Obsidian Orb" and G.GAME.defeated_blinds["bl_cry_box"] == true)
		then
			if card.config.center.rarity == 1 and not card.debuff then
				card.debuff = true
				card.debuffed_by_blind = true
			end
		end
		if
			G.GAME.blind.name == "cry-windmill"
			or (G.GAME.blind.name == "cry-Obsidian Orb" and G.GAME.defeated_blinds["bl_cry_windmill"] == true)
		then
			if card.config.center.rarity == 2 and not card.debuff then
				card.debuff = true
				card.debuffed_by_blind = true
			end
		end
		if
			G.GAME.blind.name == "cry-striker"
			or (G.GAME.blind.name == "cry-Obsidian Orb" and G.GAME.defeated_blinds["bl_cry_striker"] == true)
		then
			if card.config.center.rarity == 3 and not card.debuff then
				card.debuff = true
				card.debuffed_by_blind = true
			end
		end
		if
			G.GAME.blind.name == "cry-shackle"
			or (G.GAME.blind.name == "cry-Obsidian Orb" and G.GAME.defeated_blinds["bl_cry_shackle"] == true)
		then
			if (card.edition and card.edition.negative == true) and not card.debuff then
				card.debuff = true
				card.debuffed_by_blind = true
			end
		end
		if
			G.GAME.blind.name == "cry-pin"
			or (G.GAME.blind.name == "cry-Obsidian Orb" and G.GAME.defeated_blinds["bl_cry_pin"] == true)
		then
			if
				card.config.center.rarity ~= 3
				and card.config.center.rarity ~= 2
				and card.config.center.rarity ~= 1
				and card.config.center.rarity ~= 5
			then
				card.debuff = true
				card.debuffed_by_blind = true
			end
		end
	end
	return card
end

-- Make tags fit if there's more than 13 of them
-- These two overrides modify the offset to squeeze in more tags when needed
local at = add_tag
function add_tag(tag)
	at(tag)
	if #G.HUD_tags > 13 then
		for i = 2, #G.HUD_tags do
			G.HUD_tags[i].config.offset.y = 0.9 - 0.9 * 13 / #G.HUD_tags
		end
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

--add calculation context and callback to tag function
--used for Energia, etc.
local at2 = add_tag
function add_tag(tag, from_skip, no_copy)
	if no_copy then
		at2(tag)
		return
	end
	local added_tags = 1
	local ret = {}
	SMODS.calculate_context({ cry_add_tag = true }, ret)
	for i = 1, #ret do
		if ret[i].jokers then
			added_tags = added_tags + (ret[i].jokers.tags or 0)
		end
	end
	if added_tags >= 1 then
		at2(tag)
	end
	for i = 2, added_tags do
		local ab = copy_table(G.GAME.tags[#G.GAME.tags].ability)
		local new_tag = Tag(tag.key)
		at2(new_tag)
		new_tag.ability = ab
	end
end

-- I don't remember exactly what this patch was for, perhaps issues with syncing hand size with jokers like Effarcire?
local nr = new_round
function new_round()
	G.hand:change_size(0)
	nr()
end

-- These allow jokers that add joker slots to be obtained even without room, like with Negative Jokers in vanilla
local gfcfbs = G.FUNCS.check_for_buy_space
G.FUNCS.check_for_buy_space = function(card)
	if
		(card.ability.name == "cry-Negative Joker" and card.ability.extra >= 1)
		or (card.ability.name == "cry-soccer" and card.ability.extra.holygrail >= 1)
		or (card.ability.name == "cry-Tenebris" and card.ability.extra.slots >= 1)
	then
		return true
	end
	return gfcfbs(card)
end

local gfcsc = G.FUNCS.can_select_card
G.FUNCS.can_select_card = function(e)
	if
		(e.config.ref_table.ability.name == "cry-Negative Joker" and e.config.ref_table.ability.extra >= 1)
		or (e.config.ref_table.ability.name == "cry-soccer" and e.config.ref_table.ability.extra.holygrail >= 1)
		or (e.config.ref_table.ability.name == "cry-Tenebris" and e.config.ref_table.ability.extra.slots >= 1)
	then
		e.config.colour = G.C.GREEN
		e.config.button = "use_card"
	else
		gfcsc(e)
	end
end

--Cryptid (THE MOD) localization
local function parse_loc_txt(center)
	center.text_parsed = {}
	if center.text then
		for _, line in ipairs(center.text) do
			center.text_parsed[#center.text_parsed + 1] = loc_parse_string(line)
		end
		center.name_parsed = {}
		for _, line in ipairs(type(center.name) == "table" and center.name or { center.name }) do
			center.name_parsed[#center.name_parsed + 1] = loc_parse_string(line)
		end
		if center.unlock then
			center.unlock_parsed = {}
			for _, line in ipairs(center.unlock) do
				center.unlock_parsed[#center.unlock_parsed + 1] = loc_parse_string(line)
			end
		end
	end
end
local il = init_localization
function init_localization()
	if G.SETTINGS.language == "en-us" then
		G.localization.descriptions.Spectral.c_cryptid.text[2] = "{C:attention}#2#{} selected card"
		G.localization.descriptions.Spectral.c_talisman.text[2] = "to {C:attention}#1#{} selected"
		G.localization.descriptions.Spectral.c_trance.text[2] = "to {C:attention}#1#{} selected"
		G.localization.descriptions.Spectral.c_medium.text[2] = "to {C:attention}#1#{} selected"
		G.localization.descriptions.Spectral.c_deja_vu.text[2] = "to {C:attention}#1#{} selected"
		G.localization.descriptions.Spectral.c_deja_vu.text[2] = "to {C:attention}#1#{} selected"
		G.localization.descriptions.Spectral.c_deja_vu.text[2] = "to {C:attention}#1#{} selected" -- why is this done THREE times???
		G.localization.descriptions.Voucher.v_antimatter.text[1] = "{C:dark_edition}+#1#{} Joker Slot"
		G.localization.descriptions.Voucher.v_overstock_norm.text[1] = "{C:attention}+#1#{} card slot"
		G.localization.descriptions.Voucher.v_overstock_plus.text[1] = "{C:attention}+#1#{} card slot"
		G.localization.descriptions.Voucher.v_crystal_ball.text[1] = "{C:attention}+#1#{} consumable slot"
		G.localization.descriptions.Joker.j_seance.text[1] = "If {C:attention}played hand{} contains a" -- damnit seance
	end
	il()
	if Cryptid.object_buffer and Cryptid.object_buffer.Stake then
		for i = 1, #Cryptid.object_buffer.Stake do
			local key = Cryptid.object_buffer.Stake[i].key
			local color = G.localization.descriptions.Stake[key] and G.localization.descriptions.Stake[key].colour
			if color then
				local sticker_key = key:sub(7) .. "_sticker"
				if not G.localization.descriptions.Other[sticker_key] then
					G.localization.descriptions.Other[sticker_key] = {
						name = localize({ type = "variable", key = "cry_sticker_name", vars = { color } })[1],
						text = localize({
							type = "variable",
							key = "cry_sticker_desc",
							vars = {
								color,
								"{C:attention}",
								"{}",
							},
						}),
					}
					parse_loc_txt(G.localization.descriptions.Other[sticker_key])
				end
			end
		end
	end
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
-- Lemon Trophy's effect
local trophy_mod_mult = mod_mult
function mod_mult(_mult)
	hand_chips = hand_chips or 0
	if G.GAME.trophymod then
		_mult = math.min(_mult, math.max(hand_chips, 0))
	end
	return trophy_mod_mult(_mult)
end
-- Fix a CCD-related crash
local cuc = Card.can_use_consumeable
function Card:can_use_consumeable(any_state, skip_check)
	if not self.ability.consumeable then
		return false
	end
	return cuc(self, any_state, skip_check)
end

-- add second back button to create_UIBox_generic_options
local cuigo = create_UIBox_generic_options
function create_UIBox_generic_options(args)
	local ret = cuigo(args)
	if args.back2 then
		local mainUI = ret.nodes[1].nodes[1].nodes
		mainUI[#mainUI + 1] = {
			n = G.UIT.R,
			config = {
				id = args.back2_id or "overlay_menu_back2_button",
				align = "cm",
				minw = 2.5,
				button_delay = args.back2_delay,
				padding = 0.1,
				r = 0.1,
				hover = true,
				colour = args.back2_colour or G.C.ORANGE,
				button = args.back2_func or "exit_overlay_menu",
				shadow = true,
				focus_args = { nav = "wide", button = "b", snap_to = args.snap_back2 },
			},
			nodes = {
				{
					n = G.UIT.R,
					config = { align = "cm", padding = 0, no_fill = true },
					nodes = {
						{
							n = G.UIT.T,
							config = {
								id = args.back2_id or nil,
								text = args.back2_label or localize("b_back"),
								scale = 0.5,
								colour = G.C.UI.TEXT_LIGHT,
								shadow = true,
								func = not args.no_pip and "set_button_pip" or nil,
								focus_args = not args.no_pip and { button = args.back2_button or "b" } or nil,
							},
						},
					},
				},
			},
		}
	end
	return ret
end
