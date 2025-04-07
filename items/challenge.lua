local sticker_sheet = {
	object_type = "Challenge",
	key = "sticker_sheet",
	order = 9,
	rules = {
		custom = {
			{ id = "all_eternal" },
			{ id = "cry_all_perishable" },
			{ id = "cry_all_rental" },
			{ id = "cry_all_pinned" },
			{ id = "cry_all_banana" },
			{ id = "cry_eternal_perishable_compat" },
			{ id = "cry_any_stickers" },
			{ id = "cry_sticker_sheet" },
		},
		modifiers = {},
	},
	restrictions = {
		banned_cards = {
			{ id = "c_cry_lock" },
		},
		banned_other = {},
	},
	deck = {
		type = "Challenge Deck",
	},
}
local sticker_sheet_plus = {
	object_type = "Challenge",
	key = "sticker_sheet_plus",
	order = 10,
	rules = {
		custom = {
			{ id = "cry_sticker_sheet_plus" },
			{ id = "cry_eternal_perishable_compat" },
		},
		modifiers = {},
	},
	restrictions = {
		banned_cards = {
			{ id = "c_cry_lock" },
		},
		banned_other = {},
	},
	deck = {
		type = "Challenge Deck",
	},
}
local ballin = {
	object_type = "Challenge",
	key = "ballin",
	order = 1,
	rules = {
		custom = {},
		modifiers = {
			{ id = "joker_slots", value = 3 },
		},
	},
	jokers = {
		{ id = "j_cry_jimball", stickers = { "cry_absolute" } },
	},
	deck = {
		type = "Challenge Deck",
		enhancement = "m_stone",
	},
	restrictions = {
		banned_cards = {
			{ id = "j_vampire" },
			{ id = "c_magician" },
			{ id = "c_empress" },
			{ id = "c_heirophant" },
			{ id = "c_lovers" },
			{ id = "c_chariot" },
			{ id = "c_justice" },
			{ id = "c_devil" },
			{ id = "c_tower" },
			{ id = "c_cry_seraph" },
			{ id = "c_familiar" },
			{ id = "c_grim" },
			{ id = "c_incantation" },
			{ id = "c_cry_eclipse" },
			{ id = "c_cry_class" },
		},
		banned_other = {},
	},
}
local rush_hour = {
	object_type = "Challenge",
	key = "rush_hour",
	order = 3,
	rules = {
		custom = {
			{ id = "cry_rush_hour" }, --this just explains the rule
		},
		modifiers = {},
	},
	deck = {
		type = "Challenge Deck",
	},
	restrictions = {
		banned_cards = {
			{ id = "j_luchador" },
			{ id = "j_chicot" },
		},
		banned_other = {},
	},
}
local rush_hour_ii = {
	object_type = "Challenge",
	key = "rush_hour_ii",
	order = 6,
	rules = {
		custom = {
			{ id = "cry_rush_hour" },
			{ id = "cry_rush_hour_ii" },
			{ id = "cry_no_tags" },
		},
		modifiers = {},
	},
	deck = {
		type = "Challenge Deck",
	},
	restrictions = {
		banned_cards = {
			{ id = "j_luchador" },
			{ id = "j_chicot" },
			{ id = "j_throwback" },
			{ id = "j_diet_cola" },
			{ id = "v_directors_cut" },
			{ id = "v_retcon" },
			{ id = "j_cry_pickle" },
			{ id = "v_cry_copies" },
			{ id = "v_cry_tag_printer" },
			{ id = "v_cry_clone_machine" },
		},
		banned_other = {},
	},
}

local rush_hour_iii = {
	object_type = "Challenge",
	key = "rush_hour_iii",
	order = 8,
	rules = {
		custom = {
			{ id = "cry_rush_hour" },
			{ id = "cry_rush_hour_ii" },
			{ id = "cry_rush_hour_iii" },
			{ id = "cry_no_tags" },
		},
		modifiers = {},
	},
	jokers = {
		{ id = "j_hit_the_road", stickers = { "cry_absolute" }, edition = "negative" },
	},
	deck = {
		type = "Challenge Deck",
		cards = {
			{ s = "D", r = "2" },
			{ s = "D", r = "3" },
			{ s = "D", r = "4" },
			{ s = "D", r = "5" },
			{ s = "D", r = "6" },
			{ s = "D", r = "7" },
			{ s = "D", r = "8" },
			{ s = "D", r = "9" },
			{ s = "D", r = "T" },
			{ s = "D", r = "J" },
			{ s = "D", r = "J" },
			{ s = "D", r = "Q" },
			{ s = "D", r = "K" },
			{ s = "D", r = "A" },
			{ s = "C", r = "2" },
			{ s = "C", r = "3" },
			{ s = "C", r = "4" },
			{ s = "C", r = "5" },
			{ s = "C", r = "6" },
			{ s = "C", r = "7" },
			{ s = "C", r = "8" },
			{ s = "C", r = "9" },
			{ s = "C", r = "T" },
			{ s = "C", r = "J" },
			{ s = "C", r = "J" },
			{ s = "C", r = "Q" },
			{ s = "C", r = "K" },
			{ s = "C", r = "A" },
			{ s = "H", r = "2" },
			{ s = "H", r = "3" },
			{ s = "H", r = "4" },
			{ s = "H", r = "5" },
			{ s = "H", r = "6" },
			{ s = "H", r = "7" },
			{ s = "H", r = "8" },
			{ s = "H", r = "9" },
			{ s = "H", r = "T" },
			{ s = "H", r = "J" },
			{ s = "H", r = "J" },
			{ s = "H", r = "Q" },
			{ s = "H", r = "K" },
			{ s = "H", r = "A" },
			{ s = "S", r = "2" },
			{ s = "S", r = "3" },
			{ s = "S", r = "4" },
			{ s = "S", r = "5" },
			{ s = "S", r = "6" },
			{ s = "S", r = "7" },
			{ s = "S", r = "8" },
			{ s = "S", r = "9" },
			{ s = "S", r = "T" },
			{ s = "S", r = "J" },
			{ s = "S", r = "J" },
			{ s = "S", r = "Q" },
			{ s = "S", r = "K" },
			{ s = "S", r = "A" },
		},
	},
	restrictions = {
		banned_cards = {
			{ id = "j_luchador" },
			{ id = "j_chicot" },
			{ id = "j_throwback" },
			{ id = "j_diet_cola" },
			{ id = "v_directors_cut" },
			{ id = "v_retcon" },
			{ id = "j_cry_pickle" },
			{ id = "v_cry_copies" },
			{ id = "v_cry_tag_printer" },
			{ id = "v_cry_clone_machine" },
		},
		banned_other = {},
	},
}
local boss_rush = {
	object_type = "Challenge",
	key = "boss_rush",
	order = 2,
	rules = {
		custom = {
			{ id = "cry_rush_hour_ii" },
			{ id = "cry_no_tags" },
		},
		modifiers = {},
	},
	jokers = {
		{ id = "j_cry_apjoker", stickers = { "cry_absolute" } },
	},
	deck = {
		type = "Challenge Deck",
	},
	restrictions = {
		banned_cards = {
			{ id = "j_luchador" },
			{ id = "j_chicot" },
			{ id = "j_throwback" },
			{ id = "j_diet_cola" },
			{ id = "v_directors_cut" },
			{ id = "v_retcon" },
			{ id = "j_cry_pickle" },
			{ id = "v_cry_copies" },
			{ id = "v_cry_tag_printer" },
			{ id = "v_cry_clone_machine" },
		},
		banned_other = {},
	},
}
local rng = {
	object_type = "Challenge",
	key = "rng",
	order = 7,
	rules = {
		custom = {
			{ id = "all_rnj" },
		},
		modifiers = {},
	},
	jokers = {},
	deck = {
		type = "Challenge Deck",
	},
	restrictions = {
		banned_tags = {
			{ id = "tag_uncommon" },
			{ id = "tag_rare" },
			{ id = "tag_top_up" },
			{ id = "tag_cry_epic" },
			{ id = "tag_cry_gourmand" },
		},
		banned_cards = {
			{ id = "c_cry_delete" },
		},
		banned_other = {},
	},
}
local dagger_war = {
	object_type = "Challenge",
	key = "dagger_war",
	order = 4,
	rules = {
		custom = {},
		modifiers = {},
	},
	restrictions = {
		banned_cards = {},
		banned_other = {},
	},
	jokers = {
		{ id = "j_cry_cryptidmoment", edition = "negative" },
		{ id = "j_cry_cryptidmoment", edition = "negative" },
		{ id = "j_gift", edition = "negative" },
		{ id = "j_gift", edition = "negative" },
		{ id = "j_ceremonial", stickers = { "cry_absolute" } },
		{ id = "j_cry_unjust_dagger", stickers = { "cry_absolute" } },
		{ id = "j_cry_monkey_dagger", stickers = { "cry_absolute" } },
		{ id = "j_cry_pirate_dagger", stickers = { "cry_absolute" } },
	},
	deck = {
		type = "Challenge Deck",
	},
}
local onlycard = {
	object_type = "Challenge",
	key = "onlycard",
	order = 5,
	rules = {
		custom = {},
		modifiers = {
			{ id = "dollars", value = 10 },
		},
	},
	restrictions = {
		banned_tags = {
			{ id = "tag_charm" },
			{ id = "tag_meteor" },
			{ id = "tag_buffoon" },
			{ id = "tag_ethereal" },
			{ id = "tag_cry_bundle" },
			{ id = "tag_cry_loss" },
			{ id = "tag_cry_gambler" },
			{ id = "tag_cry_empowered" },
			{ id = "tag_cry_console" },
		},
		banned_cards = {
			{ id = "j_marble" },
			{ id = "j_dna" },
			{ id = "j_certificate" },
			{ id = "j_cry_multjoker" },
			{ id = "c_familiar" },
			{ id = "c_grim" },
			{ id = "c_incantation" },
			{ id = "c_cryptid" },
			{ id = "c_cry_replica" },
			{
				id = "p_celestial_normal_1",
				ids = {
					"p_celestial_normal_1",
					"p_celestial_normal_2",
					"p_celestial_normal_3",
					"p_celestial_normal_4",
					"p_celestial_jumbo_1",
					"p_celestial_jumbo_2",
					"p_celestial_mega_1",
					"p_celestial_mega_2",
				},
			},
			{
				id = "p_arcana_normal_1",
				ids = {
					"p_arcana_normal_1",
					"p_arcana_normal_2",
					"p_arcana_normal_3",
					"p_arcana_normal_4",
					"p_arcana_jumbo_1",
					"p_arcana_jumbo_2",
					"p_arcana_mega_1",
					"p_arcana_mega_2",
				},
			},
			{
				id = "p_spectral_normal_1",
				ids = {
					"p_spectral_normal_1",
					"p_spectral_normal_2",
					"p_spectral_jumbo_1",
					"p_spectral_mega_1",
				},
			},
			{
				id = "p_buffoon_normal_1",
				ids = {
					"p_buffoon_normal_1",
					"p_buffoon_normal_2",
					"p_buffoon_jumbo_1",
					"p_buffoon_mega_1",
				},
			},
			{
				id = "p_cry_meme_1",
				ids = {
					"p_cry_meme_1",
					"p_cry_meme_two",
					"p_cry_meme_three",
				},
			},
			{ id = "p_cry_empowered" },
			{
				id = "p_cry_code_normal_1",
				ids = { "p_cry_code_normal_1", "p_cry_code_normal_2", "p_cry_code_jumbo_1", "p_cry_code_mega_1" },
			},
		},
		banned_other = {
			{ id = "bl_house", type = "blind" },
		},
	},
	jokers = {
		{ id = "j_popcorn" },
	},
	deck = {
		type = "Challenge Deck",
		cards = {
			{ s = "C", r = "A", g = "Blue" },
		},
	},
}
local joker_poker = {
	object_type = "Challenge",
	key = "joker_poker",
	order = 11,
	rules = {
		custom = {
			{ id = "cry_no_tags" },
			{ id = "cry_no_rerolls" },
			{ id = "cry_no_vouchers" },
			{ id = "cry_no_boosters" },
			{ id = "cry_no_consumables" },
		},
		modifiers = {
			{ id = "consumable_slots", value = 0 },
			{ id = "discards", value = 0 },
		},
	},
	deck = {
		type = "Challenge Deck",
	},
	restrictions = {
		banned_cards = {
			{ id = "j_banner" },
			{ id = "j_8_ball" },
			{ id = "j_chaos" },
			{ id = "j_delayed_grat" },
			{ id = "j_sixth_sense" },
			{ id = "j_faceless" },
			{ id = "j_superposition" },
			{ id = "j_red_card" },
			{ id = "j_seance" },
			{ id = "j_vagabond" },
			{ id = "j_mail" },
			{ id = "j_hallucination" },
			{ id = "j_fortune_teller" },
			{ id = "j_drunkard" },
			{ id = "j_trading" },
			{ id = "j_flash" },
			{ id = "j_castle" },
			{ id = "j_merry_andy" },
			{ id = "j_hit_the_road" },
			{ id = "j_satellite" },
			{ id = "j_cartomancer" },
			{ id = "j_astronomer" },
			{ id = "j_burnt" },
			{ id = "j_yorick" },
			{ id = "j_perkeo" },
			{ id = "j_constellation" },
			{ id = "j_cry_booster" },
			{ id = "j_cry_wheelhope" },
			{ id = "j_cry_hunger" },
			{ id = "j_cry_sacrifice" },
			{ id = "j_cry_doodlem" },
			{ id = "j_cry_multjoker" },
			{ id = "j_cry_stella_mortis" },
			{ id = "j_cry_crustulum" },
			{ id = "j_cry_cut" },
			{ id = "j_cry_CodeJoker" },
			{ id = "j_cry_copypaste" },
			{ id = "j_cry_blender" },
			{ id = "j_cry_python" },
		},
		banned_other = {
			{ id = "bl_hook", type = "blind" },
			{ id = "bl_arm", type = "blind" },
			{ id = "bl_water", type = "blind" },
			{ id = "bl_cry_oldmanacle", type = "blind" },
		},
	},
}
local gfcr = G.FUNCS.can_reroll
function G.FUNCS.can_reroll(e)
	if G.GAME.modifiers.cry_no_rerolls then
		e.config.colour = G.C.UI.BACKGROUND_INACTIVE
		e.config.button = nil
	else
		return gfcr(e)
	end
end
local gsr = Game.start_run
function Game:start_run(args)
	gsr(self, args)
	if G.GAME.modifiers.cry_no_consumables then
		G.GAME.joker_rate = 1e300
	end
end
--Add banned cards when specific features/mods are enabled here
--TODO other mods
if (SMODS.Mods["jen"] or {}).can_load then
	ballin.restrictions.banned_cards[#ballin.restrictions.banned_cards + 1] = { id = "c_jen_chance" }
	ballin.restrictions.banned_cards[#ballin.restrictions.banned_cards + 1] = { id = "c_jen_token_tag_cry_bundle" }
	ballin.restrictions.banned_cards[#ballin.restrictions.banned_cards + 1] = { id = "c_jen_reverse_magician" }
	ballin.restrictions.banned_cards[#ballin.restrictions.banned_cards + 1] = { id = "c_jen_reverse_empress" }
	ballin.restrictions.banned_cards[#ballin.restrictions.banned_cards + 1] = { id = "c_jen_reverse_heirophant" }
	ballin.restrictions.banned_cards[#ballin.restrictions.banned_cards + 1] = { id = "c_jen_reverse_lovers" }
	ballin.restrictions.banned_cards[#ballin.restrictions.banned_cards + 1] = { id = "c_jen_reverse_chariot" }
	ballin.restrictions.banned_cards[#ballin.restrictions.banned_cards + 1] = { id = "c_jen_reverse_justice" }
	ballin.restrictions.banned_cards[#ballin.restrictions.banned_cards + 1] = { id = "c_jen_reverse_devil" }
	ballin.restrictions.banned_cards[#ballin.restrictions.banned_cards + 1] = { id = "c_jen_reverse_tower" }
	ballin.restrictions.banned_cards[#ballin.restrictions.banned_cards + 1] = { id = "c_jen_reverse_star" }
	ballin.restrictions.banned_cards[#ballin.restrictions.banned_cards + 1] = { id = "c_jen_reverse_moon" }
	ballin.restrictions.banned_cards[#ballin.restrictions.banned_cards + 1] = { id = "c_jen_reverse_sun" }
	ballin.restrictions.banned_cards[#ballin.restrictions.banned_cards + 1] = { id = "c_jen_reverse_world" }
	rng.restrictions.banned_cards[#rng.restrictions.banned_cards + 1] = { id = "c_jen_jokerinatarot" }
	rng.restrictions.banned_cards[#rng.restrictions.banned_cards + 1] = { id = "c_jen_token_tag_uncommon" }
	rng.restrictions.banned_cards[#rng.restrictions.banned_cards + 1] = { id = "c_jen_token_tag_rare" }
	rng.restrictions.banned_cards[#rng.restrictions.banned_cards + 1] = { id = "c_jen_token_tag_top_up" }
	rng.restrictions.banned_cards[#rng.restrictions.banned_cards + 1] = { id = "c_jen_token_tag_cry_epic" }
	rng.restrictions.banned_cards[#rng.restrictions.banned_cards + 1] = { id = "c_jen_wraith_ex" }
	onlycard.restrictions.banned_cards[#onlycard.restrictions.banned_cards + 1] = { id = "j_jen_shikigami" }
	onlycard.restrictions.banned_cards[#onlycard.restrictions.banned_cards + 1] = { id = "c_jen_token_tag_charm" }
	onlycard.restrictions.banned_cards[#onlycard.restrictions.banned_cards + 1] = { id = "c_jen_token_tag_meteor" }
	onlycard.restrictions.banned_cards[#onlycard.restrictions.banned_cards + 1] = { id = "c_jen_token_tag_buffoon" }
	onlycard.restrictions.banned_cards[#onlycard.restrictions.banned_cards + 1] = { id = "c_jen_token_tag_ethereal" }
	onlycard.restrictions.banned_cards[#onlycard.restrictions.banned_cards + 1] = { id = "c_jen_token_tag_cry_bundle" }
	onlycard.restrictions.banned_cards[#onlycard.restrictions.banned_cards + 1] = { id = "c_jen_reverse_magician" }
	onlycard.restrictions.banned_cards[#onlycard.restrictions.banned_cards + 1] = { id = "c_jen_reverse_empress" }
	onlycard.restrictions.banned_cards[#onlycard.restrictions.banned_cards + 1] = { id = "c_jen_reverse_heirophant" }
	onlycard.restrictions.banned_cards[#onlycard.restrictions.banned_cards + 1] = { id = "c_jen_reverse_lovers" }
	onlycard.restrictions.banned_cards[#onlycard.restrictions.banned_cards + 1] = { id = "c_jen_reverse_chariot" }
	onlycard.restrictions.banned_cards[#onlycard.restrictions.banned_cards + 1] = { id = "c_jen_reverse_justice" }
	onlycard.restrictions.banned_cards[#onlycard.restrictions.banned_cards + 1] = { id = "c_jen_reverse_devil" }
	onlycard.restrictions.banned_cards[#onlycard.restrictions.banned_cards + 1] = { id = "c_jen_reverse_tower" }
	onlycard.restrictions.banned_cards[#onlycard.restrictions.banned_cards + 1] =
		{ id = "c_jen_reverse_high_priestess" }
	onlycard.restrictions.banned_cards[#onlycard.restrictions.banned_cards + 1] = { id = "c_jen_reverse_emperor" }
	onlycard.restrictions.banned_cards[#onlycard.restrictions.banned_cards + 1] = { id = "c_jen_reverse_death" }
	onlycard.restrictions.banned_cards[#onlycard.restrictions.banned_cards + 1] = { id = "c_jen_reverse_star" }
	onlycard.restrictions.banned_cards[#onlycard.restrictions.banned_cards + 1] = { id = "c_jen_reverse_moon" }
	onlycard.restrictions.banned_cards[#onlycard.restrictions.banned_cards + 1] = { id = "c_jen_reverse_sun" }
	onlycard.restrictions.banned_cards[#onlycard.restrictions.banned_cards + 1] = { id = "c_jen_reverse_world" }
	onlycard.restrictions.banned_cards[#onlycard.restrictions.banned_cards + 1] = { id = "c_jen_reverse_judgement" }
	onlycard.restrictions.banned_cards[#onlycard.restrictions.banned_cards + 1] = { id = "c_jen_mischief" }
	onlycard.restrictions.banned_cards[#onlycard.restrictions.banned_cards + 1] = { id = "c_jen_wonder" }
	onlycard.restrictions.banned_cards[#onlycard.restrictions.banned_cards + 1] = { id = "c_jen_familiar_ex" }
	onlycard.restrictions.banned_cards[#onlycard.restrictions.banned_cards + 1] = { id = "c_jen_grim_ex" }
	onlycard.restrictions.banned_cards[#onlycard.restrictions.banned_cards + 1] = { id = "c_jen_incantation_ex" }
	onlycard.restrictions.banned_cards[#onlycard.restrictions.banned_cards + 1] = { id = "c_jen_cryptid_ex" }
end
--end of banned cards
local challenges = {
	sticker_sheet,
	sticker_sheet_plus,
	onlycard,
	ballin,
	boss_rush,
	rng,
	dagger_war,
	rush_hour,
	rush_hour_ii,
	rush_hour_iii,
	joker_poker,
}

for k, v in pairs(G.P_CENTERS) do
	if v.set == "Joker" then
		if not v.perishable_compat or not v.eternal_compat then
			sticker_sheet.restrictions.banned_cards[#sticker_sheet.restrictions.banned_cards + 1] = { id = k }
			sticker_sheet_plus.restrictions.banned_cards[#sticker_sheet_plus.restrictions.banned_cards + 1] = { id = k }
		end
	end
end

return { name = "Challenges", items = challenges }
