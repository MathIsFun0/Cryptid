--This pool is used for Cryptid's Meme Packs, and other mods can add to it (hence it is already loaded)
Cryptid.memepack[#Cryptid.memepack + 1] = "j_jolly"
Cryptid.memepack[#Cryptid.memepack + 1] = "j_obelisk"
Cryptid.memepack[#Cryptid.memepack + 1] = "j_space" --Nobody takes this thing seriously so i'm putting it here
Cryptid.memepack[#Cryptid.memepack + 1] = "j_mr_bones" --sans undertale

if Cryptid.enabled["Misc. Jokers"] then
	Cryptid.memepack[#Cryptid.memepack + 1] = "j_cry_cube"
	Cryptid.memepack[#Cryptid.memepack + 1] = "j_cry_cryptidmoment"
	Cryptid.memepack[#Cryptid.memepack + 1] = "j_cry_happyhouse"
	Cryptid.memepack[#Cryptid.memepack + 1] = "j_cry_nice"
	Cryptid.memepack[#Cryptid.memepack + 1] = "j_cry_sus"
	Cryptid.memepack[#Cryptid.memepack + 1] = "j_cry_chad"
	Cryptid.memepack[#Cryptid.memepack + 1] = "j_cry_jimball"
	Cryptid.memepack[#Cryptid.memepack + 1] = "j_cry_krustytheclown"
	Cryptid.memepack[#Cryptid.memepack + 1] = "j_cry_blurred"
	Cryptid.memepack[#Cryptid.memepack + 1] = "j_cry_filler"
end
if Cryptid.enabled["M Jokers"] then
	Cryptid.memepack[#Cryptid.memepack + 1] = "j_cry_reverse"
	Cryptid.memepack[#Cryptid.memepack + 1] = "j_cry_bonk"
end
if Cryptid.enabled["Epic Jokers"] then
	Cryptid.memepack[#Cryptid.memepack + 1] = "j_cry_boredom"
	Cryptid.memepack[#Cryptid.memepack + 1] = "j_cry_curse"
	Cryptid.memepack[#Cryptid.memepack + 1] = "j_cry_m"
end

function memepackpool(_type, _rarity, legendary, key_append)
	G.ARGS.TEMP_POOL = EMPTY(G.ARGS.TEMP_POOL)
	local _pool, _starting_pool, _pool_key, _pool_size = G.ARGS.TEMP_POOL, {}, "meme", 0

	for k, v in pairs(Cryptid.memepack) do
		if v then
			_starting_pool[#_starting_pool + 1] = G.P_CENTERS[v]
		end
	end

	for k, v in ipairs(_starting_pool) do
		local add = true

		if G.GAME.used_jokers[v.key] and not next(find_joker("Showman")) then
			add = false
		end

		if add and not G.GAME.banned_keys[v.key] then
			_pool[#_pool + 1] = v.key
			_pool_size = _pool_size + 1
		end

		if _pool_size == 0 then
			_pool = EMPTY(G.ARGS.TEMP_POOL)
			_pool[#_pool + 1] = "j_mr_bones"
		end
	end

	return _pool, _pool_key .. G.GAME.round_resets.ante
end

local memepackgetcurrentpool = get_current_pool
function get_current_pool(_type, _rarity, _legendary, _append)
	if _type == "meme" then
		return memepackpool(_type, _rarity, _legendary, _append)
	end
	return memepackgetcurrentpool(_type, _rarity, _legendary, _append)
end

local memepack_atlas = {
	object_type = "Atlas",
	key = "memepack",
	path = "pack_cry.png",
	px = 71,
	py = 95,
}
local meme1 = {
	object_type = "Booster",
	key = "meme_1",
	kind = "meme",
	atlas = "memepack",
	pos = { x = 0, y = 1 },
	order = 5,
	config = { extra = 5, choose = 2 },
	cost = 14,
	weight = 0.18 / 3, --0.18 base ÷ 3 since there are 3 identical packs
	create_card = function(self, card)
		return create_card("meme", G.pack_cards, nil, nil, true, true, nil, "cry_meme")
	end,
	ease_background_colour = function(self)
		ease_colour(G.C.DYN_UI.MAIN, G.C.CRY_ASCENDANT)
		ease_background_colour({ new_colour = G.C.CRY_ASCENDANT, special_colour = G.C.BLACK, contrast = 2 })
	end,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.config.center.config.choose, card.ability.extra } }
	end, --For some reason, I need to keep the loc_txt or else it crashes
	loc_txt = {
		name = "Meme Pack",
		text = {
			"Choose {C:attention}#1#{} of",
			"up to {C:attention}#2# Meme Jokers{}",
		},
	},
	update_pack = function(self, dt)
		ease_colour(G.C.DYN_UI.MAIN, G.C.CRY_ASCENDANT)
		ease_background_colour({ new_colour = G.C.CRY_ASCENDANT, special_colour = G.C.BLACK, contrast = 2 })
		SMODS.Booster.update_pack(self, dt)
	end,
	group_key = "k_cry_meme_pack",
}
local meme2 = {
	object_type = "Booster",
	key = "meme_two",
	kind = "meme",
	atlas = "memepack",
	pos = { x = 1, y = 1 },
	order = 6,
	config = { extra = 5, choose = 2 },
	cost = 14,
	weight = 0.18 / 3, --0.18 base ÷ 3 since there are 3 identical packs
	create_card = function(self, card)
		return create_card("meme", G.pack_cards, nil, nil, true, true, nil, "cry_memetwo")
	end,
	ease_background_colour = function(self)
		ease_colour(G.C.DYN_UI.MAIN, G.C.CRY_ASCENDANT)
		ease_background_colour({ new_colour = G.C.CRY_ASCENDANT, special_colour = G.C.BLACK, contrast = 2 })
	end,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.config.center.config.choose, card.ability.extra } }
	end,
	loc_txt = {
		name = "Meme Pack",
		text = {
			"Choose {C:attention}#1#{} of",
			"up to {C:attention}#2# Meme Jokers{}",
		},
	},
	update_pack = function(self, dt)
		ease_colour(G.C.DYN_UI.MAIN, G.C.CRY_ASCENDANT)
		ease_background_colour({ new_colour = G.C.CRY_ASCENDANT, special_colour = G.C.BLACK, contrast = 2 })
		SMODS.Booster.update_pack(self, dt)
	end,
	group_key = "k_cry_meme_pack",
}
local meme3 = {
	object_type = "Booster",
	key = "meme_three",
	kind = "meme",
	atlas = "memepack",
	pos = { x = 2, y = 1 },
	order = 7,
	config = { extra = 5, choose = 2 },
	cost = 14,
	weight = 0.18 / 3, --0.18 base ÷ 3 since there are 3 identical packs
	create_card = function(self, card)
		return create_card("meme", G.pack_cards, nil, nil, true, true, nil, "cry_memethree")
	end,
	ease_background_colour = function(self)
		ease_colour(G.C.DYN_UI.MAIN, G.C.CRY_ASCENDANT)
		ease_background_colour({ new_colour = G.C.CRY_ASCENDANT, special_colour = G.C.BLACK, contrast = 2 })
	end,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.config.center.config.choose, card.ability.extra } }
	end,
	loc_txt = {
		name = "Meme Pack",
		text = {
			"Choose {C:attention}#1#{} of",
			"up to {C:attention}#2# Meme Jokers{}",
		},
	},
	update_pack = function(self, dt)
		ease_colour(G.C.DYN_UI.MAIN, G.C.CRY_ASCENDANT)
		ease_background_colour({ new_colour = G.C.CRY_ASCENDANT, special_colour = G.C.BLACK, contrast = 2 })
		SMODS.Booster.update_pack(self, dt)
	end,
	group_key = "k_cry_meme_pack",
}

if not AurinkoAddons then
	AurinkoAddons = {}
end

--Edition code based on Bunco's Glitter Edition

local mosaic_shader = {
	object_type = "Shader",
	key = "mosaic",
	path = "mosaic.fs",
}
local mosaic = {
	object_type = "Edition",
	key = "mosaic",
	order = 2,
	weight = 0.8, --slightly rarer than Polychrome
	shader = "mosaic",
	in_shop = true,
	extra_cost = 6,
	config = { x_chips = 2.5 },
	sound = {
		sound = "cry_e_mosaic",
		per = 1,
		vol = 0.2,
	},
	get_weight = function(self)
		return G.GAME.edition_rate * self.weight
	end,
	loc_vars = function(self, info_queue)
		return { vars = { self.config.x_chips } }
	end,
}
local oversat_shader = {
	object_type = "Shader",
	key = "oversat",
	path = "oversat.fs",
}
local oversat = {
	object_type = "Edition",
	key = "oversat",
	order = 3,
	weight = 3,
	shader = "oversat",
	in_shop = true,
	extra_cost = 5,
	sound = {
		sound = "cry_e_oversaturated",
		per = 1,
		vol = 0.25,
	},
	get_weight = function(self)
		return G.GAME.edition_rate * self.weight
	end,
	on_apply = function(card)
		cry_with_deck_effects(card, function(card)
			cry_misprintize(card, nil, true)
			cry_misprintize(card, {
				min = 2 * (G.GAME.modifiers.cry_misprint_min or 1),
				max = 2 * (G.GAME.modifiers.cry_misprint_max or 1),
			})
		end)
		if card.config.center.apply_oversat then
			card.config.center:apply_oversat(card, 	function(val)
				return cry_misprintize_val(val, {
					min = 2 * (G.GAME.modifiers.cry_misprint_min or 1),
					max = 2 * (G.GAME.modifiers.cry_misprint_max or 1),
				})
			end)
		end
	end,
	on_remove = function(card)
		cry_with_deck_effects(card, function(card)
			cry_misprintize(card, nil, true)
			cry_misprintize(card)
		end)
	end,
}

AurinkoAddons.cry_oversat = function(card, hand, instant, amount)
	G.GAME.hands[hand].chips = math.max(G.GAME.hands[hand].chips + (G.GAME.hands[hand].l_chips * amount), 0)
	G.GAME.hands[hand].mult = math.max(G.GAME.hands[hand].mult + (G.GAME.hands[hand].l_mult * amount), 1)
	if not instant then
		G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 0.3,
			func = function()
				play_sound("chips1")
				card:juice_up(0.8, 0.5)
				return true
			end,
		}))
		update_hand_text({ delay = 1.3 }, { chips = G.GAME.hands[hand].chips, StatusText = true })
		G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 0.3,
			func = function()
				play_sound("multhit1")
				card:juice_up(0.8, 0.5)
				return true
			end,
		}))
		update_hand_text({ delay = 1.3 }, { mult = G.GAME.hands[hand].mult, StatusText = true })
	elseif hand == G.handlist[#G.handlist] then
		G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 0.2,
			func = function()
				play_sound("chips1")
				card:juice_up(0.8, 0.5)
				return true
			end,
		}))
		update_hand_text({ delay = 1.3 }, { chips = (amount > 0 and "++" or "--"), StatusText = true })
		G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 0.2,
			func = function()
				play_sound("multhit1")
				card:juice_up(0.8, 0.5)
				return true
			end,
		}))
		update_hand_text({ delay = 1.3 }, { mult = (amount > 0 and "++" or "--"), StatusText = true })
	end
end

local glitched_shader = {
	object_type = "Shader",
	key = "glitched",
	path = "glitched.fs",
}
local glitched = {
	object_type = "Edition",
	key = "glitched",
	order = 1,
	weight = 15,
	shader = "glitched",
	in_shop = true,
	extra_cost = 3,
	sound = {
		sound = "cry_e_glitched",
		per = 1,
		vol = 0.25,
	},
	get_weight = function(self)
		return G.GAME.edition_rate * self.weight
	end,
	on_apply = function(card)
		cry_with_deck_effects(card, function(card)
			cry_misprintize(card, nil, true)
			cry_misprintize(card, {
				min = 0.1 * (G.GAME.modifiers.cry_misprint_min or 1),
				max = 10 * (G.GAME.modifiers.cry_misprint_max or 1),
			})
		end)
		if card.config.center.apply_glitched then
			card.config.center:apply_glitched(card, function(val)
				return cry_misprintize_val(val, {
					min = 0.1 * (G.GAME.modifiers.cry_misprint_min or 1),
					max = 10 * (G.GAME.modifiers.cry_misprint_max or 1),
				})
			end)
		end
	end,
	on_remove = function(card)
		cry_with_deck_effects(card, function(card)
			cry_misprintize(card, nil, true)
			cry_misprintize(card)
		end)
	end,
}

local randtext = {
	"A",
	"B",
	"C",
	"D",
	"E",
	"F",
	"G",
	"H",
	"I",
	"J",
	"K",
	"L",
	"M",
	"N",
	"O",
	"P",
	"Q",
	"R",
	"S",
	"T",
	"U",
	"V",
	"W",
	"X",
	"Y",
	"Z",
	" ",
	"a",
	"b",
	"c",
	"d",
	"e",
	"f",
	"g",
	"h",
	"i",
	"j",
	"k",
	"l",
	"m",
	"n",
	"o",
	"p",
	"q",
	"r",
	"s",
	"t",
	"u",
	"v",
	"w",
	"x",
	"y",
	"z",
	"0",
	"1",
	"2",
	"3",
	"4",
	"5",
	"6",
	"7",
	"8",
	"9",
	"+",
	"-",
	"?",
	"!",
	"$",
	"%",
	"[",
	"]",
	"(",
	")",
}

local function obfuscatedtext(length)
	local str = ""
	for i = 1, length do
		str = str .. randtext[math.random(#randtext)]
	end
	return str
end

AurinkoAddons.cry_glitched = function(card, hand, instant, amount)
	local modc = G.GAME.hands[hand].l_chips
		* cry_log_random(
			pseudoseed("cry_aurinko_chips_misprint" .. G.GAME.round_resets.ante),
			(G.GAME.modifiers.cry_misprint_min or 1) / 10,
			(G.GAME.modifiers.cry_misprint_max or 1) * 10
		)
		* amount
	local modm = G.GAME.hands[hand].l_mult
		* cry_log_random(
			pseudoseed("cry_aurinko_mult_misprint" .. G.GAME.round_resets.ante),
			(G.GAME.modifiers.cry_misprint_min or 1) / 10,
			(G.GAME.modifiers.cry_misprint_max or 1) * 10
		)
		* amount
	G.GAME.hands[hand].chips = math.max(G.GAME.hands[hand].chips + modc, 1)
	G.GAME.hands[hand].mult = math.max(G.GAME.hands[hand].mult + modm, 1)
	if not instant then
		for i = 1, math.random(6, 10) do
			update_hand_text(
				{ sound = "button", volume = 0.4, pitch = 1.1, delay = 0.2 },
				{ chips = obfuscatedtext(3) }
			)
		end
		G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 0,
			func = function()
				play_sound("chips1")
				card:juice_up(0.8, 0.5)
				return true
			end,
		}))
		update_hand_text(
			{ delay = 0 },
			{ chips = (amount > 0 and "+" or "-") .. number_format(math.abs(modc)), StatusText = true }
		)
		update_hand_text({ delay = 1.3 }, { chips = G.GAME.hands[hand].chips })
		for i = 1, math.random(6, 10) do
			update_hand_text({ sound = "button", volume = 0.4, pitch = 1.1, delay = 0.2 }, { mult = obfuscatedtext(3) })
		end
		G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 0,
			func = function()
				play_sound("multhit1")
				card:juice_up(0.8, 0.5)
				return true
			end,
		}))
		update_hand_text(
			{ delay = 0 },
			{ mult = (amount > 0 and "+" or "-") .. number_format(math.abs(modm)), StatusText = true }
		)
		update_hand_text({ delay = 1.3 }, { mult = G.GAME.hands[hand].mult })
	elseif hand == G.handlist[#G.handlist] then
		G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 0.2,
			func = function()
				play_sound("chips1")
				card:juice_up(0.8, 0.5)
				return true
			end,
		}))
		update_hand_text({ delay = 1.3 }, { chips = (amount > 0 and "+" or "-") .. "???", StatusText = true })
		G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 0.2,
			func = function()
				play_sound("multhit1")
				card:juice_up(0.8, 0.5)
				return true
			end,
		}))
		update_hand_text({ delay = 1.3 }, { mult = (amount > 0 and "+" or "-") .. "???", StatusText = true })
	end
end

local astral_shader = {
	object_type = "Shader",
	key = "astral",
	path = "astral.fs",
}
local astral = {
	object_type = "Edition",
	key = "astral",
	order = 30,
	weight = 0.3, --very rare
	shader = "astral",
	in_shop = true,
	extra_cost = 3,
	sound = {
		sound = "talisman_emult",
		per = 1,
		vol = 0.5,
	},
	get_weight = function(self)
		return G.GAME.edition_rate * self.weight
	end,
	config = { e_mult = 1.1 },
	loc_vars = function(self, info_queue)
		return { vars = { self.config.e_mult } }
	end,
}
local blurred_shader = {
	object_type = "Shader",
	key = "blur",
	path = "blur.fs",
}
local blurred = {
	object_type = "Edition",
	key = "blur",
	order = 6,
	weight = 0.5, --very rare
	shader = "blur",
	in_shop = true,
	extra_cost = 3,
	sound = {
		sound = "cry_e_blur",
		per = 1,
		vol = 0.5,
	},
	get_weight = function(self)
		return G.GAME.edition_rate * self.weight
	end,
	config = { retrigger_chance = 2, retriggers = 1, extra_retriggers = 1 },
	loc_vars = function(self, info_queue, center)
		local chance = center and center.edition.retrigger_chance or self.config.retrigger_chance
		local retriggers = center and center.edition.retriggers or self.config.retriggers

		return { vars = { G.GAME.probabilities.normal, chance, retriggers } }
	end,
	calculate = function(self, card, context)
		if context.retrigger_edition_check then
			if pseudorandom("cry_blurred") <= G.GAME.probabilities.normal / self.config.retrigger_chance then
				return {
					message = localize("cry_again_q"),
					repetitions = self.config.extra_retriggers,
					card = card,
				}
			end
		end
	end,
}
local noisy_shader = {
	object_type = "Shader",
	key = "noisy",
	path = "noisy.fs",
}
local noisy = {
	object_type = "Edition",
	key = "noisy",
	order = 7,
	weight = 3,
	shader = "noisy",
	in_shop = true,
	extra_cost = 4,
	config = { min_mult = 0, max_mult = 30, min_chips = 0, max_chips = 150 },
	sound = {
		sound = "cry_e_noisy",
		per = 1,
		vol = 0.25,
	},
	calculate = function(self, card, context)
		if context.edition_main and context.edition_val then
			context.edition_val.mult_mod = pseudorandom("cry_noisy_mult", self.config.min_mult, self.config.max_mult)
			context.edition_val.chip_mod = pseudorandom("cry_noisy_chips", self.config.min_chips, self.config.max_chips)
		end
	end,
	generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
		if not full_UI_table.name then
			full_UI_table.name = localize({ type = "name", set = self.set, key = self.key, nodes = full_UI_table.name })
		end
		local r_mults = {}
		for i = self.config.min_mult, self.config.max_mult do
			r_mults[#r_mults + 1] = tostring(i)
		end
		local loc_mult = " " .. (localize("k_mult")) .. " "
		local r_chips = {}
		for i = self.config.min_chips, self.config.max_chips do
			r_chips[#r_chips + 1] = tostring(i)
		end
		local loc_chips = " Chips "
		mult_ui = {
			{ n = G.UIT.T, config = { text = "  +", colour = G.C.MULT, scale = 0.32 } },
			{
				n = G.UIT.O,
				config = {
					object = DynaText({
						string = r_mults,
						colours = { G.C.MULT },
						pop_in_rate = 9999999,
						silent = true,
						random_element = true,
						pop_delay = 0.5,
						scale = 0.32,
						min_cycle_time = 0,
					}),
				},
			},
			{
				n = G.UIT.O,
				config = {
					object = DynaText({
						string = {
							{ string = "rand()", colour = G.C.JOKER_GREY },
							{
								string = "#@"
									.. (G.deck and G.deck.cards[1] and G.deck.cards[#G.deck.cards].base.id or 11)
									.. (
										G.deck
											and G.deck.cards[1]
											and G.deck.cards[#G.deck.cards].base.suit:sub(1, 1)
										or "D"
									),
								colour = G.C.RED,
							},
							loc_mult,
							loc_mult,
							loc_mult,
							loc_mult,
							loc_mult,
							loc_mult,
							loc_mult,
							loc_mult,
							loc_mult,
							loc_mult,
							loc_mult,
							loc_mult,
							loc_mult,
						},
						colours = { G.C.UI.TEXT_DARK },
						pop_in_rate = 9999999,
						silent = true,
						random_element = true,
						pop_delay = 0.2011,
						scale = 0.32,
						min_cycle_time = 0,
					}),
				},
			},
		}
		chip_ui = {
			{ n = G.UIT.T, config = { text = "  +", colour = G.C.CHIPS, scale = 0.32 } },
			{
				n = G.UIT.O,
				config = {
					object = DynaText({
						string = r_chips,
						colours = { G.C.CHIPS },
						pop_in_rate = 9999999,
						silent = true,
						random_element = true,
						pop_delay = 0.5,
						scale = 0.32,
						min_cycle_time = 0,
					}),
				},
			},
			{
				n = G.UIT.O,
				config = {
					object = DynaText({
						string = {
							{ string = "rand()", colour = G.C.JOKER_GREY },
							{
								string = "@#"
									.. (G.deck and G.deck.cards[1] and G.deck.cards[1].base.suit and G.deck.cards[1].base.suit:sub(2, 2) or "m")
									.. (G.deck and G.deck.cards[1] and G.deck.cards[1].base.id or 7),
								colour = G.C.BLUE,
							},
							loc_chips,
							loc_chips,
							loc_chips,
							loc_chips,
							loc_chips,
							loc_chips,
							loc_chips,
							loc_chips,
							loc_chips,
							loc_chips,
							loc_chips,
							loc_chips,
							loc_chips,
						},
						colours = { G.C.UI.TEXT_DARK },
						pop_in_rate = 9999999,
						silent = true,
						random_element = true,
						pop_delay = 0.2011,
						scale = 0.32,
						min_cycle_time = 0,
					}),
				},
			},
		}
		desc_nodes[#desc_nodes + 1] = mult_ui
		desc_nodes[#desc_nodes + 1] = chip_ui
	end,
}
local jollyeditionshader = {
	object_type = "Shader",
	key = "m",
	path = "m.fs",
}
local jollyedition = {
	object_type = "Edition",
	in_shop = false,
	order = 31,
	weight = 0,
	pos = {x = 2, y = 0},
	name = "cry-jollyedition",
	sound = {
		sound = "cry_e_jolly",
		per = 1,
		vol = 0.3,
	},
	extra_cost = 0,
	config = { mult = 8 },
	apply_to_float = true,
	key = "m",
	shader = "m",
	disable_base_shader = true,
	disable_shadow = true,
	loc_vars = function(self, info_queue)
		return { vars = { self.config.mult } }
	end,
}

local glass_shader = {
	object_type = "Shader",
	key = "glass",
	path = "glass.fs",
	send_vars = function(sprite, card)
		return {
			lines_offset = card and card.edition and card.edition.cry_glass_seed or 0,
		}
	end,
}
local glass_edition = {
	object_type = "Edition",
	key = "glass",
	order = 4,
	shader = "glass",
	in_shop = true,
	disable_base_shader = true,
	disable_shadow = true,
	on_apply = function(card)
		-- Randomize offset to -1..1
		card.edition.cry_glass_seed = pseudorandom("e_cry_glass") * 2 - 1
	end,
	sound = {
		sound = "cry_e_fragile",
		per = 1,
		vol = 0.3,
	},
	weight = 7,
	extra_cost = 2,
	config = { x_mult = 3, shatter_chance = 8 },
	loc_vars = function(self, info_queue)
		return {
			vars = {
				(G.GAME.probabilities.normal or 1) * (self.config.shatter_chance - 1),
				self.config.shatter_chance,
				self.config.x_mult,
			},
		}
	end,
	calculate = function(self, card, context)
		if
			context.joker_triggered
			or (
				context.from_playing_card
				and context.cardarea
				and context.cardarea == G.play
				and not context.repetition
			)
		then
			if
				pseudorandom("cry_fragile")
				> G.GAME.probabilities.normal * (self.config.shatter_chance - 1) / self.config.shatter_chance
				and not card.ability.eternal
			then
				card.will_shatter = true
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					func = function()
						if not card.shattered then
							card:shatter()
						end
						return true
					end,
				}))
			end
		end
	end,
}

local gold_shader = {
	object_type = "Shader",
	key = "gold",
	path = "gold.fs",
	send_vars = function(sprite, card)
		return {
			lines_offset = card and card.edition and card.edition.cry_gold_seed or 0,
		}
	end,
}
local gold_edition = {
	object_type = "Edition",
	key = "gold",
	order = 5,
	shader = "gold",
	weight = 7,
	extra_cost = 2,
	in_shop = true,
	config = { dollars = 2 },
	loc_vars = function(self, info_queue)
		return { vars = { self.config.dollars } }
	end,
	sound = {
		sound = "cry_e_golden",
		per = 1,
		vol = 0.3,
	},
	on_apply = function(card)
		-- Randomize offset to -1..1
		card.edition.cry_gold_seed = pseudorandom("e_cry_gold") * 2 - 1
	end,
	calculate = function(self, card, context)
		if
			context.joker_triggered
			or context.from_consumable
			or (
				context.from_playing_card
				and context.cardarea
				and context.cardarea == G.play
				and not context.repetition
			)
		then
			ease_dollars(self.config.dollars)
			card_eval_status_text(
				card,
				"extra",
				nil,
				nil,
				nil,
				{ message = localize("$") .. self.config.dollars, colour = G.C.MONEY }
			)
		end
	end,
}

local double_sided = {
	object_type = "Edition",
	key = "double_sided",
	shader = false,
	order = 32,
	weight = 10,
	extra_cost = 0,
	in_shop = true,
	sound = {
		sound = "cry_e_double_sided",
		per = 1,
		vol = 0.3,
	},
	cry_credits = {
		colour = G.C.CRY_JOLLY,
		text = {
			"Jolly Open Winner",
			"Axolotolus",
		},
	},
	get_weight = function(self)
		return G.GAME.edition_rate * self.weight * (G.GAME.used_vouchers.v_cry_double_vision and 4 or 1)
	end,
}
local echo_atlas = {
	object_type = "Atlas",
	key = "echo_atlas",
	path = "m_cry_echo.png",
	px = 71,
	py = 95,
}
local echo = {
	object_type = "Enhancement",
	key = "echo",
	atlas = "echo_atlas",
	config = { retriggers = 2, extra = 2 },
	loc_vars = function(self, info_queue)
		return { vars = { self.config.retriggers, G.GAME.probabilities.normal, self.config.extra } }
	end,
}
local eclipse = {
	object_type = "Consumable",
	set = "Tarot",
	name = "cry-Eclipse",
	key = "eclipse",
	order = 1,
	pos = { x = 1, y = 0 },
	config = { mod_conv = "m_cry_echo", max_highlighted = 1 },
	atlas = "atlasnotjokers",
	loc_vars = function(self, info_queue)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_cry_echo

		return { vars = { self.config.max_highlighted } }
	end,
}
local blessing = {
	object_type = "Consumable",
	set = "Tarot",
	name = "cry-theblessing",
	key = "theblessing",
	order = 6,
	pos = { x = 2, y = 3 },
	cost = 3,
	atlas = "atlasnotjokers",
	can_use = function(self, card)
		return #G.consumeables.cards < G.consumeables.config.card_limit or card.area == G.consumeables
	end,
	can_bulk_use = true,
	use = function(self, card, area, copier)
		local used_consumable = copier or card
		G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 0.4,
			func = function()
				if G.consumeables.config.card_limit > #G.consumeables.cards then
					play_sound("timpani")
					local forced_key = get_random_consumable("blessing")
					local _card = create_card("Consumeables", G.consumables, nil, nil, nil, nil, forced_key.config.center_key, "blessing")
					_card:add_to_deck()
					G.consumeables:emplace(_card)
					used_consumable:juice_up(0.3, 0.5)
				end
				return true
			end,
		}))
		delay(0.6)
	end,
}
--note: seal colors are also used in lovely.toml for spectral descriptions
-- and must be modified in both places
local azure_seal = {
	object_type = "Seal",
	name = "cry-Azure-Seal",
	key = "azure",
	badge_colour = HEX("1d4fd7"),
	config = { planets_amount = 3 },
	loc_vars = function(self, info_queue)
		return { vars = { self.config.planets_amount } }
	end,
	atlas = "azure_atlas",
	pos = { x = 0, y = 0 },

	-- Requires latest Steamodded version (as of 7/9/24)
	calculate = function(self, card, context)
		if context.destroying_card then
			G.E_MANAGER:add_event(Event({
				trigger = "before",
				delay = 0.0,
				func = function()
					local card_type = "Planet"
					local _planet = nil
					if G.GAME.last_hand_played then
						for k, v in pairs(G.P_CENTER_POOLS.Planet) do
							if v.config.hand_type == G.GAME.last_hand_played then
								_planet = v.key
								break
							end
						end
					end

					for i = 1, self.config.planets_amount do
						local card = create_card(card_type, G.consumeables, nil, nil, nil, nil, _planet, "cry_azure")

						card:set_edition({ negative = true }, true)
						card:add_to_deck()
						G.consumeables:emplace(card)
					end
					return true
				end,
			}))

			return true
		end
	end,
}

local azure_seal_sprite = {
	object_type = "Atlas",
	key = "azure_atlas",
	path = "s_cry_azure_seal.png",
	px = 71,
	py = 95,
}

local typhoon = {
	object_type = "Consumable",
	set = "Spectral",
	name = "cry-Typhoon",
	key = "typhoon",
	order = 8,
	config = {
		-- This will add a tooltip.
		mod_conv = "cry_azure_seal",
		-- Tooltip args
		seal = { planets_amount = 3 },
		max_highlighted = 1,
	},
	loc_vars = function(self, info_queue, center)
		-- Handle creating a tooltip with set args.
		info_queue[#info_queue + 1] =
			{ set = "Other", key = "cry_azure_seal", specific_vars = { self.config.seal.planets_amount } }
		return { vars = { center.ability.max_highlighted } }
	end,
	cost = 4,
	atlas = "atlasnotjokers",
	pos = { x = 0, y = 4 },
	use = function(self, card, area, copier) --Good enough
		local used_consumable = copier or card
		for i = 1, #G.hand.highlighted do
			local highlighted = G.hand.highlighted[i]
			G.E_MANAGER:add_event(Event({
				func = function()
					play_sound("tarot1")
					highlighted:juice_up(0.3, 0.5)
					return true
				end,
			}))
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.1,
				func = function()
					if highlighted then
						highlighted:set_seal("cry_azure")
					end
					return true
				end,
			}))
			delay(0.5)
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.2,
				func = function()
					G.hand:unhighlight_all()
					return true
				end,
			}))
		end
	end,
}

local meld = {
	object_type = "Consumable",
	set = "Tarot",
	name = "cry-Meld",
	key = "meld",
	order = 3,
	pos = { x = 4, y = 4 },
	config = { extra = 4 },
	cost = 4,
	atlas = "atlasnotjokers",
	can_use = function(self, card)
		if #G.jokers.highlighted
				+ #G.hand.highlighted
				- (G.hand.highlighted[1] and G.hand.highlighted[1] == self and 1 or 0)
			== 1 then
			if #G.jokers.highlighted == 1 and Card.no(G.jokers.highlighted[1], "dbl") then return false end
			return true
		end
	end,
	cry_credits = {
		colour = G.C.CRY_JOLLY,
		text = {
			"Jolly Open Winner",
			"Axolotolus",
		},
	},
	loc_vars = function(self, info_queue)
		info_queue[#info_queue + 1] = G.P_CENTERS.e_cry_double_sided
	end,
	use = function(self, card, area, copier)
		if #G.jokers.highlighted == 1 then
			G.jokers.highlighted[1]:remove_from_deck(true)
			G.jokers.highlighted[1]:set_edition({ cry_double_sided = true })
			G.jokers.highlighted[1]:add_to_deck(true)
			G.jokers:remove_from_highlighted(G.jokers.highlighted[1])
		else
			G.hand.highlighted[1]:set_edition({ cry_double_sided = true })
			G.hand:remove_from_highlighted(G.hand.highlighted[1])
		end
	end,
	in_pool = function()
		return G.GAME.used_vouchers.v_cry_double_slit
	end
}

local miscitems = {
	memepack_atlas,
	meme1,
	meme2,
	meme3,
	mosaic_shader,
	oversat_shader,
	glitched_shader,
	astral_shader,
	blurred_shader,
	glass_shader,
	gold_shader,
	noisy_shader,
	glass_edition,
	gold_edition,
	glitched,
	noisy,
	mosaic,
	oversat,
	blurred,
	astral,
	echo_atlas,
	echo,
	eclipse,
	blessing,
	azure_seal_sprite,
	typhoon,
	azure_seal,
	double_sided,
	meld
}
if Cryptid.enabled["M Jokers"] then
	miscitems[#miscitems + 1] = jollyeditionshader
	miscitems[#miscitems + 1] = jollyedition
end
return {
	name = "Misc.",
	init = function()
		--echo card
		cs = Card.calculate_seal
		function Card:calculate_seal(context)
			local ret = cs(self, context)
			if context.repetition then
				local total_repetitions = ret and ret.repetitions or 0

				if self.config.center == G.P_CENTERS.m_cry_echo then
					if pseudorandom("echo") < G.GAME.probabilities.normal / (self.ability.extra or 2) then --hacky crash fix
						total_repetitions = total_repetitions + self.ability.retriggers
					end
				end

				if total_repetitions > 0 then
					return {
						message = localize("k_again_ex"),
						repetitions = total_repetitions,
						card = self,
					}
				end
			end
			return ret
		end
		--Change name of cards with Jolly edition
		local gcui = generate_card_ui
		function generate_card_ui(
			_c,
			full_UI_table,
			specific_vars,
			card_type,
			badges,
			hide_desc,
			main_start,
			main_end,
			card
		)
			local full_UI_table =
				gcui(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end, card)
			if
				card
				and card.edition
				and card.edition.cry_m
				and (not card.ability or card.ability.set ~= "Edition")
				and full_UI_table
				and full_UI_table.name
				and type(full_UI_table.name) == "table"
				and full_UI_table.name[1]
				and full_UI_table.name[1].config
				and full_UI_table.name[1].config.object
				and full_UI_table.name[1].config.object.config
			then
				local conf = full_UI_table.name[1].config.object.config
				if conf.string and #conf.string > 0 then
					local function m_ify_word(text)
						-- Define a pattern for vowels
						local vowels = "AEIOUaeiou"

						-- Use gsub to replace the first consonant of each word with 'M'
						local result = text:gsub("(%a)(%w*)", function(first, rest)
							if vowels:find(first) then
								-- If the first character is a vowel, add an M
								if (not rest[1]) or (rest:lower()[1] == rest[1]) then --this check doesn't work properly
									return "M" .. first:lower() .. rest
								else
									return "M" .. first:upper() .. rest
								end
							elseif first:lower() == "m" then
								-- If the word already starts with 'M', keep it unchanged
								return first .. rest
							else
								-- Replace the first consonant with 'M'
								return "M" .. rest
							end
						end)

						return result
					end
					function m_ify(text)
						-- Use gsub to apply the m_ify_word function to each word
						local result = text:gsub("(%S+)", function(word)
							return m_ify_word(word)
						end)

						return result
					end
					conf.string[1] = m_ify(conf.string[1])
					full_UI_table.name[1].config.object:remove()
					full_UI_table.name[1].config.object = DynaText(conf)
				end
			end
			return full_UI_table
		end

		-- Double-Sided - create FLIP button
		-- kinda based on Fusion Jokers
		local card_focus_ui = G.UIDEF.card_focus_ui
		function G.FUNCS.can_flip_card(e)
			e.config.colour = G.C.DARK_EDITION
			e.config.button = "flip"
		end
		function G.FUNCS.can_flip_merge_card(e)
			local area = e.config.ref_table.area
			local mergable = 0
			for i = 1, #area.highlighted do
				if area.highlighted[i].edition and area.highlighted[i].edition.cry_double_sided then
					mergable = mergable + 1
					mergedcard = area.highlighted[i]
				end
			end
			if mergable == 1 then
				e.config.colour = G.C.DARK_EDITION
				e.config.button = "flip_merge"
			else
				e.config.colour = G.C.UI.BACKGROUND_INACTIVE
				e.config.button = nil
			end
		end
		function G.FUNCS.flip(e)
			e.config.ref_table:flip()
			e.config.ref_table.area:remove_from_highlighted(e.config.ref_table)
		end
		function G.FUNCS.flip_merge(e)
			e.config.ref_table:flip()
			e.config.ref_table.area:remove_from_highlighted(e.config.ref_table)
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 1,
				func = function()
					local area = e.config.ref_table.area
					area:remove_card(e.config.ref_table)
					mergedcard:init_dbl_side()
					copy_dbl_card(e.config.ref_table, mergedcard.dbl_side)
					e.config.ref_table:remove()
					e.config.ref_table = nil
					return true
				end,
			}))
		end
		local use_and_sell_buttonsref = G.UIDEF.use_and_sell_buttons
		function G.UIDEF.use_and_sell_buttons(card)
			local retval = use_and_sell_buttonsref(card)
			if
				card.area
				and card.edition
				and (card.area == G.jokers or card.area == G.consumeables or card.area == G.hand)
				and card.edition.cry_double_sided
				and not Card.no(card, "dbl")
			then
				local use = {
					n = G.UIT.C,
					config = { align = "cr" },
					nodes = {
						{
							n = G.UIT.C,
							config = {
								ref_table = card,
								align = "cr",
								maxw = 1.25,
								padding = 0.1,
								r = 0.08,
								hover = true,
								shadow = true,
								colour = G.C.UI.BACKGROUND_INACTIVE,
								one_press = true,
								button = "flip",
								func = "can_flip_card",
							},
							nodes = {
								{ n = G.UIT.B, config = { w = 0.1, h = 0.3 } },
								{
									n = G.UIT.T,
									config = {
										text = localize("b_flip"),
										colour = G.C.UI.TEXT_LIGHT,
										scale = 0.3,
										shadow = true,
									},
								},
							},
						},
					},
				}
				local m = retval.nodes[1]
				if not card.added_to_deck then
					use.nodes[1].nodes = { use.nodes[1].nodes[2] }
					if card.ability.consumeable then
						m = retval
					end
				end
				m.nodes = m.nodes or {}
				table.insert(m.nodes, { n = G.UIT.R, config = { align = "cl" }, nodes = {
					use,
				} })
				return retval
			end
			if
				card.area
				and (card.area == G.jokers or card.area == G.consumeables or card.area == G.hand)
				and (not card.edition or not card.edition.cry_double_sided)
				and not card.ability.eternal
				and not Card.no(card, "dbl")
			then
				for i = 1, #card.area.cards do
					if card.area.cards[i].edition and card.area.cards[i].edition.cry_double_sided then
						local use = {
							n = G.UIT.C,
							config = { align = "cr" },
							nodes = {
								{
									n = G.UIT.C,
									config = {
										ref_table = card,
										align = "cr",
										maxw = 1.25,
										padding = 0.1,
										r = 0.08,
										hover = true,
										shadow = true,
										colour = G.C.UI.BACKGROUND_INACTIVE,
										one_press = true,
										button = "flip_merge",
										func = "can_flip_merge_card",
									},
									nodes = {
										{ n = G.UIT.B, config = { w = 0.1, h = 0.3 } },
										{
											n = G.UIT.T,
											config = {
												text = localize("b_merge"),
												colour = G.C.UI.TEXT_LIGHT,
												scale = 0.3,
												shadow = true,
											},
										},
									},
								},
							},
						}
						local m = retval.nodes[1]
						if not card.added_to_deck then
							use.nodes[1].nodes = { use.nodes[1].nodes[2] }
							if card.ability.consumeable then
								m = retval
							end
						end
						m.nodes = m.nodes or {}
						table.insert(m.nodes, { n = G.UIT.R, config = { align = "cl" }, nodes = {
							use,
						} })
						return retval
					end
				end
			end
			return retval
		end
		local cupd = Card.update
		function Card:update(dt)
			cupd(self, dt)
			if self.area then
				if self.area.config.type == "discard" or self.area.config.type == "deck" then
					return --prevent lagging event queues with unneeded flips
				end
			end
			if self.sprite_facing == "back" and self.edition and self.edition.cry_double_sided then
				self.sprite_facing = "front"
				self.facing = "front"
				if self.flipping == "f2b" then
					self.flipping = "b2f"
				end
				self:dbl_side_flip()
			end
		end
		function copy_dbl_card(C, c, deck_effects)
			if not deck_effects then
				Cdeck = C.added_to_deck
				cdeck = c.added_to_deck
				C.added_to_deck = true
				c.added_to_deck = false
			end
			copy_card(C, c)
			c.config.center_key = C.config.center_key
		end
		function Card:init_dbl_side()
			if Card.no(self, "dbl") then
				self:set_edition(nil, true)
			end
			if not self.dbl_side then
				self.dbl_side = cry_deep_copy(self)
				self.dbl_side:set_ability(G.P_CENTERS.c_base)
				self.dbl_side:set_base(G.P_CARDS.empty)
				if self.area == G.hand then
					self.dbl_side.config.center = cry_deep_copy(self.dbl_side.config.center)
					self.dbl_side.config.center.no_rank = true
				end
				self.dbl_side.added_to_deck = false
				return true
			end
		end
		function Card:dbl_side_flip()
			local init_dbl_side = self:init_dbl_side()
			local tmp_side = cry_deep_copy(self.dbl_side)
			self.children.center.scale = { x = self.children.center.atlas.px, y = self.children.center.atlas.py }
			self.T.w, self.T.h = G.CARD_W, G.CARD_H
			local active_side = self
			if next(find_joker("cry-Flip Side")) and self.dbl_side then
				active_side = self.dbl_side
			end
			if not init_dbl_side then 
				active_side:remove_from_deck(true) 
			end
			copy_dbl_card(self, self.dbl_side, false)
			copy_dbl_card(tmp_side, self, false)
			active_side:add_to_deck(true)
			self.children.center:set_sprite_pos(G.P_CENTERS[self.config.center.key].pos)
			if self.base then
				--Note: this causes a one-frame stutter
				for k, v in pairs(G.P_CARDS) do
					if self.base.suit == v.suit and self.base.value == v.value then
						self.config.card_key = k
					end
				end
				self:set_sprites(nil, self.config.card)
				if self.children and self.children.front and self.config.card_key then self.children.front:set_sprite_pos(G.P_CARDS[self.config.card_key].pos) end
			end
			if (not self.base or not self.base.name) and self.children.front then
				self.children.front:remove()
				self.children.front = nil
			end
			self:set_edition({cry_double_sided = true},true,true)
		end
		local cgcb = Card.get_chip_bonus
		function Card:get_chip_bonus()
			if self.ability.set == "Joker" then return 0 end
			return cgcb(self)
		end
		local csave = Card.save
		function Card:save()
			local cardTable = csave(self)
			if self.dbl_side then
				cardTable.dbl_side = csave(self.dbl_side)
			end
			return cardTable
		end
		local cload = Card.load
		function Card:load(cardTable, other_card)
			cload(self, cardTable, other_card)
			if self.ability.set == "Default" then
				self:set_ability(G.P_CENTERS.c_base, true)
			end
			if not self.base.name then
				self:set_base(G.P_CARDS.empty, true)
				if self.children.front then
					self.children.front:remove()
					self.children.front = nil
				end
			end
			if cardTable.dbl_side then
				self.dbl_side = cry_deep_copy(self)
				cload(self.dbl_side, cardTable.dbl_side)
				if self.dbl_side.ability.set == "Default" and self.ability.set ~= "Default" then
					self.dbl_side:set_ability(G.P_CENTERS.c_base, true)
				end
				if not self.dbl_side.base.name then
					self.dbl_side:set_base(G.P_CARDS.empty, true)
				end
			end
		end
		local rma = remove_all
		function remove_all(t)
			if t then
				rma(t)
			end
		end
		--prevent chaos the clown's ability from being applied on debuff
		local catd = Card.add_to_deck
		local crfd = Card.remove_from_deck
		function Card:add_to_deck(debuff)
			if debuff and self.ability.name == 'Chaos the Clown' then
				return
			end
			return catd(self, debuff)
		end
		function Card:remove_from_deck(debuff)
			if debuff and self.ability.name == 'Chaos the Clown' then
				return
			end
			return crfd(self, debuff)
		end
		local cae = CardArea.emplace
		function CardArea:emplace(card,m1,m2)
			if not (card.will_shatter or card.destroyed or card.shattered) then
				cae(self,card,m1,m2)
			else
				if card.area then
					card.area:remove_card(card)
				end
				card:remove()
				card = nil
			end
		end
		local sjw = set_joker_win
		function set_joker_win()
			sjw()
			for k, v in pairs(G.jokers.cards) do
			  if v.dbl_side and v.dbl_side.config.center_key and v.dbl_side.ability.set == 'Joker' then
				G.PROFILES[G.SETTINGS.profile].joker_usage[v.dbl_side.config.center_key] = G.PROFILES[G.SETTINGS.profile].joker_usage[v.dbl_side.config.center_key] or {count = 1, order = v.dbl_side.config.center.order, wins = {}, losses = {}, wins_by_key = {}, losses_by_key = {}}
				if G.PROFILES[G.SETTINGS.profile].joker_usage[v.dbl_side.config.center_key] then
				  G.PROFILES[G.SETTINGS.profile].joker_usage[v.dbl_side.config.center_key].wins = G.PROFILES[G.SETTINGS.profile].joker_usage[v.dbl_side.config.center_key].wins or {}
				  G.PROFILES[G.SETTINGS.profile].joker_usage[v.dbl_side.config.center_key].wins[G.GAME.stake] = (G.PROFILES[G.SETTINGS.profile].joker_usage[v.dbl_side.config.center_key].wins[G.GAME.stake] or 0) + 1
				end
			  end
			end
			G:save_settings()
		end
	end,
	items = miscitems,
}
