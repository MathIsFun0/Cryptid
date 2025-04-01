local timantti = {
	cry_credits = {
		idea = {
			"Jevonn",
		},
		art = {
			"jenwalter666",
		},
		code = {
			"Math",
		},
	},
	dependencies = {
		items = {
			"set_cry_planet",
		},
	},
	object_type = "Consumable",
	set = "Planet",
	name = "cry-Timantti",
	key = "Timantti",
	pos = { x = 0, y = 2 },
	config = { hand_types = { "High Card", "Pair", "Two Pair" } },
	cost = 4,
	aurinko = true,
	atlas = "atlasnotjokers",
	order = 8,
	can_use = function(self, card)
		return true
	end,
	loc_vars = function(self, info_queue, center)
		return {
			vars = {
				localize("High Card", "poker_hands"),
				localize("Pair", "poker_hands"),
				localize("Two Pair", "poker_hands"),
				number_format(G.GAME.hands["High Card"].level),
				number_format(G.GAME.hands["Pair"].level),
				number_format(G.GAME.hands["Two Pair"].level),
				colours = {
					(
						to_big(G.GAME.hands["High Card"].level) == to_big(1) and G.C.UI.TEXT_DARK
						or G.C.HAND_LEVELS[to_big(math.min(7, G.GAME.hands["High Card"].level)):to_number()]
					),
					(to_big(G.GAME.hands["Pair"].level) == to_big(1) and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[to_big(
						math.min(7, G.GAME.hands["Pair"].level)
					):to_number()]),
					(
						to_big(G.GAME.hands["Two Pair"].level) == to_big(1) and G.C.UI.TEXT_DARK
						or G.C.HAND_LEVELS[to_big(math.min(7, G.GAME.hands["Two Pair"].level)):to_number()]
					),
				},
			},
		}
	end,
	use = function(self, card, area, copier)
		Cryptid.suit_level_up(card, copier, 1, card.config.center.config.hand_types)
	end,
	bulk_use = function(self, card, area, copier, number)
		Cryptid.suit_level_up(card, copier, number, card.config.center.config.hand_types)
	end,
	calculate = function(self, card, context)
		if
			G.GAME.used_vouchers.v_observatory
			and context.joker_main
			and (
				context.scoring_name == "High Card"
				or context.scoring_name == "Pair"
				or context.scoring_name == "Two Pair"
			)
		then
			local value = G.P_CENTERS.v_observatory.config.extra
			return {
				message = localize({ type = "variable", key = "a_xmult", vars = { value } }),
				Xmult_mod = value,
			}
		end
	end,
}
local klubi = {
	cry_credits = {
		idea = {
			"Jevonn",
		},
		art = {
			"jenwalter666",
		},
		code = {
			"Math",
		},
	},
	dependencies = {
		items = {
			"set_cry_planet",
		},
	},
	object_type = "Consumable",
	set = "Planet",
	name = "cry-Klubi",
	key = "Klubi",
	pos = { x = 1, y = 2 },
	config = { hand_types = { "Three of a Kind", "Straight", "Flush" } },
	cost = 4,
	aurinko = true,
	atlas = "atlasnotjokers",
	order = 9,
	can_use = function(self, card)
		return true
	end,
	loc_vars = function(self, info_queue, center)
		return {
			vars = {
				localize("Three of a Kind", "poker_hands"),
				localize("Straight", "poker_hands"),
				localize("Flush", "poker_hands"),
				number_format(G.GAME.hands["Three of a Kind"].level),
				number_format(G.GAME.hands["Straight"].level),
				number_format(G.GAME.hands["Flush"].level),
				colours = {
					(
						to_big(G.GAME.hands["Three of a Kind"].level) == to_big(1) and G.C.UI.TEXT_DARK
						or G.C.HAND_LEVELS[to_big(math.min(7, G.GAME.hands["Three of a Kind"].level)):to_number()]
					),
					(
						to_big(G.GAME.hands["Straight"].level) == to_big(1) and G.C.UI.TEXT_DARK
						or G.C.HAND_LEVELS[to_big(math.min(7, G.GAME.hands["Straight"].level)):to_number()]
					),
					(to_big(G.GAME.hands["Flush"].level) == to_big(1) and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[to_big(
						math.min(7, G.GAME.hands["Flush"].level)
					):to_number()]),
				},
			},
		}
	end,
	use = function(self, card, area, copier)
		Cryptid.suit_level_up(card, copier, 1, card.config.center.config.hand_types)
	end,
	bulk_use = function(self, card, area, copier, number)
		Cryptid.suit_level_up(card, copier, number, card.config.center.config.hand_types)
	end,
	calculate = function(self, card, context)
		if
			G.GAME.used_vouchers.v_observatory
			and context.joker_main
			and (
				context.scoring_name == "Three of a Kind"
				or context.scoring_name == "Straight"
				or context.scoring_name == "Flush"
			)
		then
			local value = G.P_CENTERS.v_observatory.config.extra
			return {
				message = localize({ type = "variable", key = "a_xmult", vars = { value } }),
				Xmult_mod = value,
			}
		end
	end,
}
local sydan = {
	cry_credits = {
		idea = {
			"Jevonn",
		},
		art = {
			"jenwalter666",
		},
		code = {
			"Math",
		},
	},
	dependencies = {
		items = {
			"set_cry_planet",
		},
	},
	object_type = "Consumable",
	set = "Planet",
	name = "cry-Sydan",
	key = "Sydan",
	pos = { x = 2, y = 2 },
	config = { hand_types = { "Full House", "Four of a Kind", "Straight Flush" } },
	cost = 4,
	aurinko = true,
	atlas = "atlasnotjokers",
	order = 10,
	can_use = function(self, card)
		return true
	end,
	loc_vars = function(self, info_queue, center)
		return {
			vars = {
				localize("Full House", "poker_hands"),
				localize("Four of a Kind", "poker_hands"),
				localize("Straight Flush", "poker_hands"),
				number_format(G.GAME.hands["Full House"].level),
				number_format(G.GAME.hands["Four of a Kind"].level),
				number_format(G.GAME.hands["Straight Flush"].level),
				colours = {
					(
						to_big(G.GAME.hands["Full House"].level) == to_big(1) and G.C.UI.TEXT_DARK
						or G.C.HAND_LEVELS[to_big(math.min(7, G.GAME.hands["Full House"].level)):to_number()]
					),
					(
						to_big(G.GAME.hands["Four of a Kind"].level) == to_big(1) and G.C.UI.TEXT_DARK
						or G.C.HAND_LEVELS[to_big(math.min(7, G.GAME.hands["Four of a Kind"].level)):to_number()]
					),
					(
						to_big(G.GAME.hands["Straight Flush"].level) == to_big(1) and G.C.UI.TEXT_DARK
						or G.C.HAND_LEVELS[to_big(math.min(7, G.GAME.hands["Straight Flush"].level)):to_number()]
					),
				},
			},
		}
	end,
	use = function(self, card, area, copier)
		Cryptid.suit_level_up(card, copier, 1, card.config.center.config.hand_types)
	end,
	bulk_use = function(self, card, area, copier, number)
		Cryptid.suit_level_up(card, copier, number, card.config.center.config.hand_types)
	end,
	calculate = function(self, card, context)
		if
			G.GAME.used_vouchers.v_observatory
			and context.joker_main
			and (
				context.scoring_name == "Full House"
				or context.scoring_name == "Four of a Kind"
				or context.scoring_name == "Straight Flush"
			)
		then
			local value = G.P_CENTERS.v_observatory.config.extra
			return {
				message = localize({ type = "variable", key = "a_xmult", vars = { value } }),
				Xmult_mod = value,
			}
		end
	end,
}
local lapio = {
	cry_credits = {
		idea = {
			"Jevonn",
		},
		art = {
			"jenwalter666",
		},
		code = {
			"Math",
		},
	},
	dependencies = {
		items = {
			"set_cry_planet",
		},
	},
	object_type = "Consumable",
	set = "Planet",
	name = "cry-Lapio",
	key = "Lapio",
	pos = { x = 3, y = 2 },
	config = { hand_types = { "Five of a Kind", "Flush House", "Flush Five" }, softlock = true },
	cost = 4,
	aurinko = true,
	atlas = "atlasnotjokers",
	order = 11,
	can_use = function(self, card)
		return true
	end,
	loc_vars = function(self, info_queue, center)
		return {
			vars = {
				localize("Five of a Kind", "poker_hands"),
				localize("Flush House", "poker_hands"),
				localize("Flush Five", "poker_hands"),
				number_format(G.GAME.hands["Five of a Kind"].level),
				number_format(G.GAME.hands["Flush House"].level),
				number_format(G.GAME.hands["Flush Five"].level),
				colours = {
					(
						to_big(G.GAME.hands["Five of a Kind"].level) == to_big(1) and G.C.UI.TEXT_DARK
						or G.C.HAND_LEVELS[to_big(math.min(7, G.GAME.hands["Five of a Kind"].level)):to_number()]
					),
					(
						to_big(G.GAME.hands["Flush House"].level) == to_big(1) and G.C.UI.TEXT_DARK
						or G.C.HAND_LEVELS[to_big(math.min(7, G.GAME.hands["Flush House"].level)):to_number()]
					),
					(
						to_big(G.GAME.hands["Flush Five"].level) == to_big(1) and G.C.UI.TEXT_DARK
						or G.C.HAND_LEVELS[to_big(math.min(7, G.GAME.hands["Flush Five"].level)):to_number()]
					),
				},
			},
		}
	end,
	use = function(self, card, area, copier)
		Cryptid.suit_level_up(card, copier, 1, card.config.center.config.hand_types)
	end,
	bulk_use = function(self, card, area, copier, number)
		Cryptid.suit_level_up(card, copier, number, card.config.center.config.hand_types)
	end,
	calculate = function(self, card, context)
		if
			G.GAME.used_vouchers.v_observatory
			and context.joker_main
			and (
				context.scoring_name == "Five of a Kind"
				or context.scoring_name == "Flush House"
				or context.scoring_name == "Flush Five"
			)
		then
			local value = G.P_CENTERS.v_observatory.config.extra
			return {
				message = localize({ type = "variable", key = "a_xmult", vars = { value } }),
				Xmult_mod = value,
			}
		end
	end,
}
local kaikki = {
	cry_credits = {
		idea = {
			"HexaCryonic",
		},
		art = {
			"HexaCryonic",
		},
		code = {
			"HexaCryonic",
		},
	},
	dependencies = {
		items = {
			"set_cry_planet",
			"set_cry_poker_hand_stuff",
		},
	},
	object_type = "Consumable",
	set = "Planet",
	name = "cry-Kaikki",
	key = "Kaikki",
	pos = { x = 3, y = 5 },
	config = { hand_types = { "cry_Bulwark", "cry_Clusterfuck", "cry_UltPair" }, softlock = true },
	cost = 4,
	aurinko = true,
	atlas = "atlasnotjokers",
	order = 12,
	can_use = function(self, card)
		return true
	end,
	loc_vars = function(self, info_queue, center)
		local levelone = G.GAME.hands["cry_Bulwark"].level or 1
		local leveltwo = G.GAME.hands["cry_Clusterfuck"].level or 1
		local levelthree = G.GAME.hands["cry_UltPair"].level or 1
		local planetcolourone = G.C.HAND_LEVELS[math.min(levelone, 7)]
		local planetcolourtwo = G.C.HAND_LEVELS[math.min(leveltwo, 7)]
		local planetcolourthree = G.C.HAND_LEVELS[math.min(levelthree, 7)]

		return {
			vars = {
				localize("cry_Bulwark", "poker_hands"),
				localize("cry_Clusterfuck", "poker_hands"),
				localize("cry_UltPair", "poker_hands"),
				G.GAME.hands["cry_Bulwark"].level,
				G.GAME.hands["cry_Clusterfuck"].level,
				G.GAME.hands["cry_UltPair"].level,
				colours = {
					(
						to_big(G.GAME.hands["cry_Bulwark"].level) == to_big(1) and G.C.UI.TEXT_DARK
						or G.C.HAND_LEVELS[to_big(math.min(7, G.GAME.hands["cry_Bulwark"].level)):to_number()]
					),
					(
						to_big(G.GAME.hands["cry_Clusterfuck"].level) == to_big(1) and G.C.UI.TEXT_DARK
						or G.C.HAND_LEVELS[to_big(math.min(7, G.GAME.hands["cry_Clusterfuck"].level)):to_number()]
					),
					(
						to_big(G.GAME.hands["cry_UltPair"].level) == to_big(1) and G.C.UI.TEXT_DARK
						or G.C.HAND_LEVELS[to_big(math.min(7, G.GAME.hands["cry_UltPair"].level)):to_number()]
					),
				},
			},
		}
	end,
	use = function(self, card, area, copier)
		Cryptid.suit_level_up(card, copier, 1, card.config.center.config.hand_types)
	end,
	bulk_use = function(self, card, area, copier, number)
		Cryptid.suit_level_up(card, copier, number, card.config.center.config.hand_types)
	end,
	calculate = function(self, card, context)
		if
			G.GAME.used_vouchers.v_observatory
			and context.joker_main
			and (
				context.scoring_name == "cry_Bulwark"
				or context.scoring_name == "cry_Clusterfuck"
				or context.scoring_name == "cry_UltPair"
			)
		then
			local value = G.P_CENTERS.v_observatory.config.extra
			return {
				message = localize({ type = "variable", key = "a_xmult", vars = { value } }),
				Xmult_mod = value,
			}
		end
	end,
}
local planetlua = {
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
	dependencies = {
		items = {
			"set_cry_planet",
		},
	},
	object_type = "Consumable",
	set = "Planet",
	name = "cry-planetlua",
	key = "planetlua",
	config = { extra = { odds = 5 } },
	pos = { x = 4, y = 2 },
	cost = 4,
	aurinko = true,
	atlas = "atlasnotjokers",
	order = 1,
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card and cry_prob(card.ability.cry_prob, card.ability.extra.odds, card.ability.cry_rigged) or 1,
				card and card.ability.extra.odds or self.config.extra.odds,
			},
		}
	end,
	can_use = function(self, card)
		return true
	end,
	use = function(self, card, area, copier)
		local used_consumable = copier or card
		if
			pseudorandom("planetlua")
			< cry_prob(card.ability.cry_prob, card.ability.extra.odds, card.ability.cry_rigged)
				/ card.ability.extra.odds
		then --Code "borrowed" from black hole
			update_hand_text(
				{ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 },
				{ handname = localize("k_all_hands"), chips = "...", mult = "...", level = "" }
			)
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.2,
				func = function()
					play_sound("tarot1")
					used_consumable:juice_up(0.8, 0.5)
					G.TAROT_INTERRUPT_PULSE = true
					return true
				end,
			}))
			update_hand_text({ delay = 0 }, { mult = "+", StatusText = true })
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.9,
				func = function()
					play_sound("tarot1")
					used_consumable:juice_up(0.8, 0.5)
					return true
				end,
			}))
			update_hand_text({ delay = 0 }, { chips = "+", StatusText = true })
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.9,
				func = function()
					play_sound("tarot1")
					used_consumable:juice_up(0.8, 0.5)
					G.TAROT_INTERRUPT_PULSE = nil
					return true
				end,
			}))
			update_hand_text({ sound = "button", volume = 0.7, pitch = 0.9, delay = 0 }, { level = "+1" })
			delay(1.3)
			for k, v in pairs(G.GAME.hands) do
				level_up_hand(used_consumable, k, true)
			end
			update_hand_text(
				{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
				{ mult = 0, chips = 0, handname = "", level = "" }
			)
		else
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.4,
				func = function() --"borrowed" from Wheel Of Fortune
					attention_text({
						text = localize("k_nope_ex"),
						scale = 1.3,
						hold = 1.4,
						major = used_consumable,
						backdrop_colour = G.C.SECONDARY_SET.Planet,
						align = (
							G.STATE == G.STATES.TAROT_PACK
							or G.STATE == G.STATES.SPECTRAL_PACK
							or G.STATE == G.STATES.SMODS_BOOSTER_OPENED
						)
								and "tm"
							or "cm",
						offset = {
							x = 0,
							y = (
								G.STATE == G.STATES.TAROT_PACK
								or G.STATE == G.STATES.SPECTRAL_PACK
								or G.STATE == G.STATES.SMODS_BOOSTER_OPENED
							)
									and -0.2
								or 0,
						},
						silent = true,
					})
					G.E_MANAGER:add_event(Event({
						trigger = "after",
						delay = 0.06 * G.SETTINGS.GAMESPEED,
						blockable = false,
						blocking = false,
						func = function()
							play_sound("tarot2", 0.76, 0.4)
							return true
						end,
					}))
					play_sound("tarot2", 1, 0.4)
					used_consumable:juice_up(0.3, 0.5)
					return true
				end,
			}))
		end
	end,
	bulk_use = function(self, card, area, copier, number)
		local used_consumable = copier or card
		local quota = 0
		if card.ability.cry_rigged then
			update_hand_text(
				{ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 },
				{ handname = localize("k_all_hands"), chips = "...", mult = "...", level = "" }
			)
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.2,
				func = function()
					play_sound("tarot1")
					used_consumable:juice_up(0.8, 0.5)
					G.TAROT_INTERRUPT_PULSE = true
					return true
				end,
			}))
			update_hand_text({ delay = 0 }, { mult = "+", StatusText = true })
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.9,
				func = function()
					play_sound("tarot1")
					used_consumable:juice_up(0.8, 0.5)
					return true
				end,
			}))
			update_hand_text({ delay = 0 }, { chips = "+", StatusText = true })
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.9,
				func = function()
					play_sound("tarot1")
					used_consumable:juice_up(0.8, 0.5)
					G.TAROT_INTERRUPT_PULSE = nil
					return true
				end,
			}))
			update_hand_text({ sound = "button", volume = 0.7, pitch = 0.9, delay = 0 }, { level = "+" .. number })
			delay(1.3)
			for k, v in pairs(G.GAME.hands) do
				level_up_hand(card, k, true, number)
			end
			update_hand_text(
				{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
				{ mult = 0, chips = 0, handname = "", level = "" }
			)
		else
			for i = 1, number do
				quota = quota
					+ (
						pseudorandom("planetlua")
								< cry_prob(card.ability.cry_prob, card.ability.extra.odds, card.ability.cry_rigged) / card.ability.extra.odds
							and 1
						or 0
					)
			end
			if quota > 0 then
				update_hand_text(
					{ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 },
					{ handname = localize("k_all_hands"), chips = "...", mult = "...", level = "" }
				)
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0.2,
					func = function()
						play_sound("tarot1")
						used_consumable:juice_up(0.8, 0.5)
						G.TAROT_INTERRUPT_PULSE = true
						return true
					end,
				}))
				update_hand_text({ delay = 0 }, { mult = "+", StatusText = true })
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0.9,
					func = function()
						play_sound("tarot1")
						used_consumable:juice_up(0.8, 0.5)
						return true
					end,
				}))
				update_hand_text({ delay = 0 }, { chips = "+", StatusText = true })
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0.9,
					func = function()
						play_sound("tarot1")
						used_consumable:juice_up(0.8, 0.5)
						G.TAROT_INTERRUPT_PULSE = nil
						return true
					end,
				}))
				update_hand_text({ sound = "button", volume = 0.7, pitch = 0.9, delay = 0 }, { level = "+" .. quota })
				delay(1.3)
				for k, v in pairs(G.GAME.hands) do
					level_up_hand(card, k, true, quota)
				end
				update_hand_text(
					{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
					{ mult = 0, chips = 0, handname = "", level = "" }
				)
			else
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0.4,
					func = function()
						attention_text({
							text = localize("k_nope_ex"),
							scale = 1.3,
							hold = 1.4,
							major = used_consumable,
							backdrop_colour = G.C.SECONDARY_SET.Planet,
							align = (
								G.STATE == G.STATES.TAROT_PACK
								or G.STATE == G.STATES.SPECTRAL_PACK
								or G.STATE == G.STATES.SMODS_BOOSTER_OPENED
							)
									and "tm"
								or "cm",
							offset = {
								x = 0,
								y = (
									G.STATE == G.STATES.TAROT_PACK
									or G.STATE == G.STATES.SPECTRAL_PACK
									or G.STATE == G.STATES.SMODS_BOOSTER_OPENED
								)
										and -0.2
									or 0,
							},
							silent = true,
						})
						G.E_MANAGER:add_event(Event({
							trigger = "after",
							delay = 0.06 * G.SETTINGS.GAMESPEED,
							blockable = false,
							blocking = false,
							func = function()
								play_sound("tarot2", 0.76, 0.4)
								return true
							end,
						}))
						play_sound("tarot2", 1, 0.4)
						used_consumable:juice_up(0.3, 0.5)
						return true
					end,
				}))
			end
		end
	end,
	calculate = function(self, card, context) --Observatory effect: (G.GAME.probabilities.normal) in (odds) chance for (G.P_CENTERS.v_observatory.config.extra) Mult
		if
			G.GAME.used_vouchers.v_observatory
			and context.joker_main
			and (
				pseudorandom("nstar")
				< cry_prob(card.ability.cry_prob, card.ability.extra.odds, card.ability.cry_rigged)
					/ card.ability.extra.odds
			)
		then
			local value = G.P_CENTERS.v_observatory.config.extra
			return {
				message = localize({ type = "variable", key = "a_xmult", vars = { value } }),
				Xmult_mod = value,
			}
		end
	end,
}
local nstar = {
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
	dependencies = {
		items = {
			"set_cry_planet",
		},
	},
	object_type = "Consumable",
	set = "Planet",
	name = "cry-nstar",
	key = "nstar",
	pos = { x = 4, y = 1 },
	cost = 4,
	aurinko = true,
	atlas = "atlasnotjokers",
	order = 6,
	set_card_type_badge = function(self, card, badges)
		badges[1] = create_badge(localize("k_planet_q"), get_type_colour(self or card.config, card), nil, 1.2)
	end,
	can_use = function(self, card)
		return true
	end,
	loc_vars = function(self, info_queue, center)
		return { vars = { (G.GAME and G.GAME.neutronstarsusedinthisrun or 0) } }
	end,
	use = function(self, card, area, copier)
		local used_consumable = copier or card
		--Get amount of Neutron stars use this run or set to 0 if nil
		G.GAME.neutronstarsusedinthisrun = G.GAME.neutronstarsusedinthisrun or 0

		--Add +1 to amount of neutron stars used this run
		G.GAME.neutronstarsusedinthisrun = G.GAME.neutronstarsusedinthisrun + 1
		local neutronhand = Cryptid.get_random_hand(nil, "nstar" .. G.GAME.round_resets.ante) --Random poker hand
		update_hand_text({ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 }, {
			handname = localize(neutronhand, "poker_hands"),
			chips = G.GAME.hands[neutronhand].chips,
			mult = G.GAME.hands[neutronhand].mult,
			level = G.GAME.hands[neutronhand].level,
		})
		--level up once for each neutron star used this run
		level_up_hand(used_consumable, neutronhand, nil, G.GAME.neutronstarsusedinthisrun)
		update_hand_text(
			{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
			{ mult = 0, chips = 0, handname = "", level = "" }
		)
	end,
	bulk_use = function(self, card, area, copier, number)
		local used_consumable = copier or card
		G.GAME.neutronstarsusedinthisrun = G.GAME.neutronstarsusedinthisrun or 0

		local handstolv = {}
		local neutronhand = "n/a"
		for i = 1, number do
			G.GAME.neutronstarsusedinthisrun = G.GAME.neutronstarsusedinthisrun + 1
			neutronhand = Cryptid.get_random_hand()
			handstolv[neutronhand] = (handstolv[neutronhand] or 0) + G.GAME.neutronstarsusedinthisrun
		end
		for k, v in pairs(handstolv) do
			update_hand_text({ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 }, {
				handname = localize(k, "poker_hands"),
				chips = G.GAME.hands[k].chips,
				mult = G.GAME.hands[k].mult,
				level = G.GAME.hands[k].level,
			})
			card_eval_status_text(
				used_consumable,
				"extra",
				nil,
				nil,
				nil,
				{ message = "+" .. tostring(v), colour = G.C.BLUE }
			)
			level_up_hand(used_consumable, k, nil, v)
		end
		update_hand_text(
			{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
			{ mult = 0, chips = 0, handname = "", level = "" }
		)
		G.E_MANAGER:add_event(Event({
			trigger = "after",
			func = function()
				handstolv = nil
				return true
			end,
		}))
	end,
	calculate = function(self, card, context) --Observatory effect: X0.1 mult for each neutron star used this run
		if G.GAME.used_vouchers.v_observatory and G.GAME.neutronstarsusedinthisrun ~= nil and context.joker_main then
			return {
				message = localize({
					type = "variable",
					key = "a_xmult",
					vars = { 1 + (0.10 * G.GAME.neutronstarsusedinthisrun) },
				}),
				Xmult_mod = 1 + (0.10 * G.GAME.neutronstarsusedinthisrun),
			}
		end
	end,
	init = function(self)
		function Cryptid.get_random_hand(ignore, seed, allowhidden)
			--From JenLib's get_random_hand
			local chosen_hand
			ignore = ignore or {}
			seed = seed or "randomhand"
			if type(ignore) ~= "table" then
				ignore = { ignore }
			end
			while true do
				chosen_hand = pseudorandom_element(G.handlist, pseudoseed(seed))
				if G.GAME.hands[chosen_hand].visible or allowhidden then
					local safe = true
					for _, v in pairs(ignore) do
						if v == chosen_hand then
							safe = false
						end
					end
					if safe then
						break
					end
				end
			end
			return chosen_hand
		end
	end,
}
local sunplanet = {
	cry_credits = {
		idea = {
			"HexaCryonic",
		},
		art = {
			"HexaCryonic",
		},
		code = {
			"Jevonn",
			"Toneblock",
		},
	},
	--TODO: disable ascendant hands if this is disabled
	dependencies = {
		items = {
			"set_cry_planet",
			"set_cry_poker_hand_stuff",
		},
	},
	object_type = "Consumable",
	set = "Planet",
	name = "cry-sunplanet",
	key = "sunplanet",
	pos = { x = 5, y = 2 },
	cost = 4,
	aurinko = true,
	atlas = "atlasnotjokers",
	order = 7,
	config = {
		extra = 0.05,
	},
	set_card_type_badge = function(self, card, badges)
		badges[1] = create_badge(localize("cry_p_star"), get_type_colour(self or card.config, card), nil, 1.2)
	end,
	can_use = function(self, card)
		return true
	end,
	use = function(self, card, area, copier)
		local used_consumable = copier or card
		local sunlevel = (G.GAME.sunlevel and G.GAME.sunlevel or 0) + 1
		G.GAME.sunlevel = (G.GAME.sunlevel or 0) + 1
		delay(0.4)
		update_hand_text(
			{ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 },
			{ handname = localize("cry_asc_hands"), chips = "...", mult = "...", level = to_big(sunlevel) }
		)
		delay(1.0)
		G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 0.2,
			func = function()
				play_sound("tarot1")
				ease_colour(G.C.UI_CHIPS, copy_table(G.C.GOLD), 0.1)
				ease_colour(G.C.UI_MULT, copy_table(G.C.GOLD), 0.1)
				Cryptid.pulse_flame(0.01, sunlevel)
				used_consumable:juice_up(0.8, 0.5)
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					blockable = false,
					blocking = false,
					delay = 1.2,
					func = function()
						ease_colour(G.C.UI_CHIPS, G.C.BLUE, 1)
						ease_colour(G.C.UI_MULT, G.C.RED, 1)
						return true
					end,
				}))
				return true
			end,
		}))
		update_hand_text({ sound = "button", volume = 0.7, pitch = 0.9, delay = 0 }, { level = to_big(sunlevel + 1) })
		delay(2.6)
		G.GAME.sunnumber = G.GAME.sunnumber ~= nil and G.GAME.sunnumber + card.ability.extra or card.ability.extra
		update_hand_text(
			{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
			{ mult = 0, chips = 0, handname = "", level = "" }
		)
	end,
	bulk_use = function(self, card, area, copier, number)
		local used_consumable = copier or card
		local sunlevel = (G.GAME.sunlevel and G.GAME.sunlevel or 0) + 1
		G.GAME.sunlevel = (G.GAME.sunlevel or 0) + 1
		delay(0.4)
		update_hand_text(
			{ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 },
			{ handname = localize("cry_asc_hands"), chips = "...", mult = "...", level = to_big(sunlevel) }
		)
		delay(1.0)
		G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 0.2,
			func = function()
				play_sound("tarot1")
				ease_colour(G.C.UI_CHIPS, copy_table(G.C.GOLD), 0.1)
				ease_colour(G.C.UI_MULT, copy_table(G.C.GOLD), 0.1)
				Cryptid.pulse_flame(0.01, (sunlevel - 1) + number)
				used_consumable:juice_up(0.8, 0.5)
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					blockable = false,
					blocking = false,
					delay = 1.2,
					func = function()
						ease_colour(G.C.UI_CHIPS, G.C.BLUE, 1)
						ease_colour(G.C.UI_MULT, G.C.RED, 1)
						return true
					end,
				}))
				return true
			end,
		}))
		update_hand_text(
			{ sound = "button", volume = 0.7, pitch = 0.9, delay = 0 },
			{ level = to_big(sunlevel + number) }
		)
		delay(2.6)
		G.GAME.sunnumber = G.GAME.sunnumber ~= nil and G.GAME.sunnumber + number * card.ability.extra
			or number * card.ability.extra
		update_hand_text(
			{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
			{ mult = 0, chips = 0, handname = "", level = "" }
		)
	end,
	calculate = function(self, card, context) --Observatory effect: X1.5 mult if hand is an ascended hand
		if
			G.GAME.used_vouchers.v_observatory
			and G.GAME.current_round.current_hand.cry_asc_num ~= 0
			and context.joker_main
		then
			local value = G.P_CENTERS.v_observatory.config.extra
			return {
				message = localize({ type = "variable", key = "a_xmult", vars = { value } }),
				Xmult_mod = value,
			}
		end
	end,
	loc_vars = function(self, info_queue, center)
		local levelone = (G.GAME.sunlevel and G.GAME.sunlevel or 0) + 1
		local planetcolourone = G.C.HAND_LEVELS[math.min(levelone, 7)]
		if levelone == 1 then
			planetcolourone = G.C.UI.TEXT_DARK
		end
		return {
			vars = {
				(G.GAME.sunlevel or 0) + 1,
				center.ability.extra or 0.05,
				(G.GAME.sunnumber and G.GAME.sunnumber or 0) + 1.25,
				colours = { planetcolourone },
			},
		}
	end,
	in_pool = function(self)
		if G.GAME.cry_asc_played and G.GAME.cry_asc_played > 0 then
			return true
		end
		return false
	end,
}
local abelt = {
	cry_credits = {
		idea = {
			"HexaCryonic",
		},
		art = {
			"HexaCryonic",
		},
		code = {
			"HexaCryonic",
		},
	},
	dependencies = {
		items = {
			"set_cry_poker_hand_stuff",
		},
	},
	object_type = "Consumable",
	set = "Planet",
	key = "asteroidbelt",
	config = { hand_type = "cry_Bulwark", softlock = true },
	pos = { x = 1, y = 5 },
	order = 2,
	atlas = "atlasnotjokers",
	aurinko = true,
	set_card_type_badge = function(self, card, badges)
		badges[1] = create_badge(localize("k_planet_disc"), get_type_colour(self or card.config, card), nil, 1.2)
	end,
	loc_vars = function(self, info_queue, center)
		return {
			vars = {
				localize("cry_hand_bulwark"),
				G.GAME.hands["cry_Bulwark"].level,
				G.GAME.hands["cry_Bulwark"].l_mult,
				G.GAME.hands["cry_Bulwark"].l_chips,
				colours = {
					(
						to_big(G.GAME.hands["cry_Bulwark"].level) == to_big(1) and G.C.UI.TEXT_DARK
						or G.C.HAND_LEVELS[to_big(math.min(7, G.GAME.hands["cry_Bulwark"].level)):to_number()]
					),
				},
			},
		}
	end,
	generate_ui = 0,
}
local void = {
	cry_credits = {
		idea = {
			"HexaCryonic",
		},
		art = {
			"HexaCryonic",
		},
		code = {
			"HexaCryonic",
		},
	},
	dependencies = {
		items = {
			"set_cry_poker_hand_stuff",
		},
	},
	object_type = "Consumable",
	set = "Planet",
	key = "void",
	order = 3,
	config = { hand_type = "cry_Clusterfuck", softlock = true },
	pos = { x = 0, y = 5 },
	atlas = "atlasnotjokers",
	aurinko = true,
	set_card_type_badge = function(self, card, badges)
		badges[1] = create_badge("", get_type_colour(self or card.config, card), nil, 1.2)
	end,
	loc_vars = function(self, info_queue, center)
		return {
			vars = {
				localize("cry_Clusterfuck"),
				G.GAME.hands["cry_Clusterfuck"].level,
				G.GAME.hands["cry_Clusterfuck"].l_mult,
				G.GAME.hands["cry_Clusterfuck"].l_chips,
				colours = {
					(
						to_big(G.GAME.hands["cry_Clusterfuck"].level) == to_big(1) and G.C.UI.TEXT_DARK
						or G.C.HAND_LEVELS[to_big(math.min(7, G.GAME.hands["cry_Clusterfuck"].level)):to_number()]
					),
				},
			},
		}
	end,
	generate_ui = 0,
}
local marsmoons = {
	cry_credits = {
		idea = {
			"HexaCryonic",
		},
		art = {
			"HexaCryonic",
		},
		code = {
			"HexaCryonic",
		},
	},
	dependencies = {
		items = {
			"set_cry_poker_hand_stuff",
		},
	},
	object_type = "Consumable",
	set = "Planet",
	key = "marsmoons",
	order = 4,
	config = { hand_type = "cry_UltPair", softlock = true },
	pos = { x = 2, y = 5 },
	atlas = "atlasnotjokers",
	aurinko = true,
	set_card_type_badge = function(self, card, badges)
		badges[1] = create_badge(localize("k_planet_satellite"), get_type_colour(self or card.config, card), nil, 1.2)
	end,
	loc_vars = function(self, info_queue, center)
		local levelone = G.GAME.hands["cry_UltPair"].level or 1
		local planetcolourone = G.C.HAND_LEVELS[math.min(levelone, 7)]
		if levelone == 1 then
			planetcolourone = G.C.UI.TEXT_DARK
		end
		return {
			vars = {
				localize("cry_UltPair"),
				G.GAME.hands["cry_UltPair"].level,
				G.GAME.hands["cry_UltPair"].l_mult,
				G.GAME.hands["cry_UltPair"].l_chips,
				colours = {
					(
						to_big(G.GAME.hands["cry_UltPair"].level) == to_big(1) and G.C.UI.TEXT_DARK
						or G.C.HAND_LEVELS[to_big(math.min(7, G.GAME.hands["cry_UltPair"].level)):to_number()]
					),
				},
			},
		}
	end,
	generate_ui = 0,
}
local universe = {
	cry_credits = {
		idea = {
			"HexaCryonic",
		},
		art = {
			"HexaCryonic",
		},
		code = {
			"HexaCryonic",
		},
	},
	dependencies = {
		items = {
			"set_cry_poker_hand_stuff",
		},
	},
	object_type = "Consumable",
	set = "Planet",
	key = "universe",
	config = { hand_type = "cry_WholeDeck", softlock = true },
	pos = { x = 4, y = 5 },
	order = 5,
	atlas = "atlasnotjokers",
	aurinko = true,
	set_card_type_badge = function(self, card, badges)
		badges[1] = create_badge(localize("k_planet_universe"), get_type_colour(self or card.config, card), nil, 1.2)
	end,
	loc_vars = function(self, info_queue, center)
		return {
			vars = {
				localize("cry_UltPair"),
				G.GAME.hands["cry_WholeDeck"].level,
				G.GAME.hands["cry_WholeDeck"].l_mult,
				G.GAME.hands["cry_WholeDeck"].l_chips,
				colours = {
					(
						to_big(G.GAME.hands["cry_Bulwark"].level) == to_big(1) and G.C.UI.TEXT_DARK
						or G.C.HAND_LEVELS[to_big(math.min(7, G.GAME.hands["cry_WholeDeck"].level)):to_number()]
					),
				},
			},
		}
	end,
	generate_ui = 0,
}
function Cryptid.suit_level_up(card, copier, number, poker_hands, message)
	local used_consumable = copier or card
	if not number then
		number = 1
	end
	if not poker_hands then
		poker_hands = { "Two Pair", "Straight Flush" }
	end
	if message then
		card_eval_status_text(
			card,
			"extra",
			nil,
			nil,
			nil,
			{ message = localize("k_level_up_ex"), colour = G.C.FILTER }
		)
	end
	for _, v in pairs(poker_hands) do
		update_hand_text({ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 }, {
			handname = localize(v, "poker_hands"),
			chips = G.GAME.hands[v].chips,
			mult = G.GAME.hands[v].mult,
			level = G.GAME.hands[v].level,
		})
		level_up_hand(used_consumable, v, nil, number)
	end
	update_hand_text(
		{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
		{ mult = 0, chips = 0, handname = "", level = "" }
	)
end
local planet_cards =
	{ planetlua, nstar, timantti, klubi, sydan, lapio, sunplanet, kaikki, abelt, void, marsmoons, universe }
return { name = "Planets", init = function() end, items = planet_cards }
