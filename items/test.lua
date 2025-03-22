local test = {
	object_type = "Joker",
	key = "test",
	discovered = true,
	gameset_config = {
		modest = {
			extra = { chips = 1 },
			center = { rarity = 1, blueprint_compat = false, immutable = true, no_dbl = false },
		},
		mainline = { center = { rarity = 2, blueprint_compat = true, immutable = true, no_dbl = true } },
		madness = { extra = { chips = 100 }, center = { rarity = 3 } },
		cryptid_in_2025 = { extra = { chips = 1e308 }, center = { rarity = "cry_exotic" } },
	},
	extra_gamesets = { "cryptid_in_2025" },
	dependencies = {
		items = {
			"j_cry_happy",
			"set_cry_m",
		},
	},
	config = { extra = { chips = 10 } },
	pos = { x = 1, y = 0 },
	rarity = 2,
	order = 11,
	cost = 1,
	blueprint_compat = true,
	atlas = "atlasone",
	loc_vars = function(self, info_queue, center)
		local gameset = Card.get_gameset(center)
		if gameset == "disabled" then
			gameset = "mainline"
		end --still show description
		return {
			vars = { center.ability.extra.chips },
			key = "j_cry_test_" .. gameset,
		}
	end,
	calculate = function(self, card, context)
		local gameset = Card.get_gameset(card)
		if context.joker_main then
			return {
				message = localize({ type = "variable", key = "a_chips", vars = { card.ability.extra.chips } }),
				chip_mod = card.ability.extra.chips,
			}
		elseif context.first_hand_drawn and gameset ~= "modest" then
			ease_dollars(gameset ~= "mainline" and 44444 or 44)
		end
	end,
	cry_credits = {
		idea = {
			"m",
		},
		art = {
			"m",
		},
		code = {
			"Jevonn",
		},
	},
}
local test2 = {
	object_type = "Joker",
	name = "ABC",
	key = "abc",
	loc_txt = {
		name = "ABC",
		text = {},
	},
	pos = { x = 0, y = 0 },
	cost = 1,
	rarity = 1,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	calculate = function(self, card, context)
		if context.retrigger_joker_check and not context.retrigger_joker then
			if card.T.x + card.T.w / 2 > context.other_card.T.x + context.other_card.T.w / 2 then
				return {
					message = localize("k_again_ex"),
					repetitions = 1,
					card = card,
				}
			end
		elseif context.other_joker and card ~= context.other_joker then
			if card.T.x + card.T.w / 2 < context.other_joker.T.x + context.other_joker.T.w / 2 then
				if not Talisman.config_file.disable_anims then
					G.E_MANAGER:add_event(Event({
						func = function()
							context.other_joker:juice_up(0.5, 0.5)
							return true
						end,
					}))
				end
				return {
					message = localize({ type = "variable", key = "a_xmult", vars = { 3 } }),
					Xmult_mod = 3,
				}
			end
		end
	end,
}
local test3 = {
	object_type = "Joker",
	name = "cry-test3",
	key = "test3",
	pos = { x = 2, y = 1 },
	rarity = 1,
	cost = 2,
	blueprint_compat = true,
	discovered = true,
	atlas = "atlastwo",
	loc_txt = {
		name = "function dump man B)",
		text = {
			"{C:attention}What does the fox say?",
		},
	},
	cry_credits = {
		idea = {
			"Jevonn",
		},
		art = {
			"Jevonn",
		},
		code = {
			"Jevonn",
		},
	},
	calculate = function(self, card, context)
		if context.end_of_round and not context.individual and not context.repetition then
			Cryptid.suit_level_up(context.blueprint_card or card, nil, 1, {
				"High Card",
				"Pair",
				"Two Pair",
				"Three of a Kind",
				"Straight",
				"Flush",
				"Full House",
				"Four of a Kind",
				"Straight Flush",
			}, true)
		elseif context.pre_discard and not context.hook then
			local text, loc_disp_text, poker_hands, scoring_hand, disp_text =
				G.FUNCS.get_poker_hand_info(G.hand.highlighted)
			if disp_text == "cry-Cluster Bulwark" then
				card_eval_status_text(
					context.blueprint_card or card,
					"extra",
					nil,
					nil,
					nil,
					{ message = localize("k_upgrade_ex") }
				)
				update_hand_text({ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 }, {
					handname = localize(text, "poker_hands"),
					chips = G.GAME.hands[text].chips,
					mult = G.GAME.hands[text].mult,
					level = G.GAME.hands[text].level,
				})
				level_up_hand(context.blueprint_card or card, text, nil, 6)
				update_hand_text(
					{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
					{ mult = 0, chips = 0, handname = "", level = "" }
				)
			end
		end
	end,
}
local test4 = {
	object_type = "Joker",
	name = "skfjadfjk;ldsjfkerjiopghtwueihvefjhgrwjh",
	key = "weuqyreuiyroiusdafgdbflhfiuowyqoiwufhjklfhioqhfh8393824774893fhjdhfkj",
	pos = { x = 0, y = 0 },
	rarity = 1,
	cost = 404,
	atlas = "atlasone",
	config = { extra = { center = nil } },
	loc_txt = {
		name = "Allmighty Center Checker",
		text = {
			"{C:attention}#1#",
			"{C:green}#2#",
			"{C:inactive}1st joker slot btw",
		},
	},
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				(card.ability.blueprint_compat ~= nil and card.ability.blueprint_compat or "uh oh"),
				card.ability.extra.center,
			},
		}
	end,
	update = function(self, card, front)
		if G.STAGE == G.STAGES.RUN then
			other_joker = G.jokers.cards[1]
			if other_joker then
				if G.GAME.current_round.discards_used % 3 == 0 then
					card.ability.extra.center = "blueprint_compat"
					if other_joker and other_joker ~= card and other_joker.config.center.blueprint_compat then
						card.ability.blueprint_compat = "yes"
					else
						card.ability.blueprint_compat = "nah"
					end
				elseif G.GAME.current_round.discards_used % 3 == 1 then
					card.ability.extra.center = "immutable"
					if other_joker and other_joker ~= card and (Card.no(other_joker, "immutable", true)) then
						card.ability.blueprint_compat = "yes"
					else
						card.ability.blueprint_compat = "nah"
					end
				else
					card.ability.extra.center = "no_dbl"
					if other_joker and other_joker ~= card and (Card.no(other_joker, "no_dbl", true)) then
						card.ability.blueprint_compat = "yes"
					else
						card.ability.blueprint_compat = "nah"
					end
				end
			end
		end
	end,
}
local kidnap2 = {
	object_type = "Joker",
	name = "cry-kidnap2",
	key = "kidnap2",
	pos = { x = 1, y = 2 },
	config = {
		extra = 1,
	},
	rarity = 1,
	cost = 4,
	loc_txt = {
		name = "asd",
		text = {
			"Earn {C:money}$#1#{} at end of round",
			"per unique {C:attention}Type Mult{} or",
			"{C:attention}Type Chips{} Joker sold this run",
			"{C:inactive}(Currently {C:money}$#2#{C:inactive})",
		},
	},
	blueprint_compat = false,
	loc_vars = function(self, info_queue, center)
		local value = 0
		if G.GAME and G.GAME.jokers_sold then
			for _, v in ipairs(G.GAME.jokers_sold) do
				if
					G.P_CENTERS[v].effect == "Type Mult"
					or G.P_CENTERS[v].effect == "Cry Type Mult"
					or G.P_CENTERS[v].effect == "Cry Type Chips"
					or G.P_CENTERS[v].effect == "Boost Kidnapping"
					or (
						G.P_CENTERS[v].name == "Sly Joker"
						or G.P_CENTERS[v].name == "Wily Joker"
						or G.P_CENTERS[v].name == "Clever Joker"
						or G.P_CENTERS[v].name == "Devious Joker"
						or G.P_CENTERS[v].name == "Crafty Joker"
					)
				then
					value = value + 1
				end
			end
		end
		return { vars = { center.ability.extra, center.ability.extra * value } }
	end,
	atlas = "atlasone",
	calc_dollar_bonus = function(self, card)
		local value = 0
		for _, v in ipairs(G.GAME.jokers_sold) do
			if
				G.P_CENTERS[v].effect == "Type Mult"
				or G.P_CENTERS[v].effect == "Cry Type Mult"
				or G.P_CENTERS[v].effect == "Cry Type Chips"
				or G.P_CENTERS[v].effect == "Boost Kidnapping"
				or (
					G.P_CENTERS[v].name == "Sly Joker"
					or G.P_CENTERS[v].name == "Wily Joker"
					or G.P_CENTERS[v].name == "Clever Joker"
					or G.P_CENTERS[v].name == "Devious Joker"
					or G.P_CENTERS[v].name == "Crafty Joker"
				)
			then
				value = value + 1
			end
		end
		if value == 0 then
			return
		end
		return card.ability.extra * value
	end,
	cry_credits = {
		idea = {
			"Jevonn",
		},
		art = {
			"Jevonn",
		},
		code = {
			"Jevonn",
		},
	},
}
return { items = { test, test2, test3, test4, kidnap2 }, disabled = true }
