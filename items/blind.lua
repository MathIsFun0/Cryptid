local oldox = {
	object_type = "Blind",
	dependencies = {
		items = {
			"set_cry_blind",
		},
	},
	name = "cry-oldox",
	key = "oldox",
	pos = { x = 0, y = 0 },
	boss = {
		min = 2,
		max = 10,
	},
	atlas = "nostalgia",
	order = 4,
	boss_colour = HEX("4f6367"),
	modify_hand = function(self, cards, poker_hands, text, mult, hand_chips)
		if to_big(hand_chips) ~= to_big(0) then
			G.GAME.blind.triggered = true
			return mult, to_big(0), true
		end
		return mult, to_big(0), false
	end,
}
local oldhouse = {
	object_type = "Blind",
	dependencies = {
		items = {
			"set_cry_blind",
		},
	},
	name = "cry-oldhouse",
	key = "oldhouse",
	pos = { x = 0, y = 2 },
	boss = {
		min = 3,
		max = 10,
	},
	atlas = "nostalgia",
	order = 5,
	boss_colour = HEX("4f6367"),
	debuff_hand = function(self, cards, hand, handname, check)
		if handname == "Full House" and not G.GAME.blind.disabled then
			G.GAME.blind.triggered = true
			return true
		end
		return false
	end,
	get_loc_debuff_text = function(self)
		return localize("cry_debuff_oldhouse")
	end,
}
local oldarm = {
	dependencies = {
		items = {
			"set_cry_blind",
		},
	},
	object_type = "Blind",
	name = "cry-oldarm",
	key = "oldarm",
	pos = { x = 0, y = 3 },
	boss = {
		min = 3,
		max = 10,
	},
	atlas = "nostalgia",
	order = 6,
	boss_colour = HEX("4f6367"),
	debuff_hand = function(self, cards, hand, handname, check)
		if #cards > 4 and not G.GAME.blind.disabled then
			G.GAME.blind.triggered = true
			return true
		end
		return false
	end,
	get_loc_debuff_text = function(self)
		return localize("cry_debuff_oldarm")
	end,
}
local oldfish = {
	dependencies = {
		items = {
			"set_cry_blind",
		},
	},
	object_type = "Blind",
	name = "cry-oldfish",
	key = "oldfish",
	pos = { x = 0, y = 4 },
	boss = {
		min = 2,
		max = 10,
	},
	atlas = "nostalgia",
	order = 7,
	boss_colour = HEX("4f6367"),
	modify_hand = function(self, cards, poker_hands, text, mult, hand_chips)
		if to_big(mult) ~= to_big(1) then
			G.GAME.blind.triggered = true
			return to_big(1), hand_chips, true
		end
		return to_big(1), hand_chips, false
	end,
}
local oldmanacle = {
	dependencies = {
		items = {
			"set_cry_blind",
		},
	},
	object_type = "Blind",
	name = "cry-oldmanacle",
	key = "oldmanacle",
	pos = { x = 0, y = 5 },
	boss = {
		min = 1,
		max = 10,
	},
	atlas = "nostalgia",
	order = 8,
	boss_colour = HEX("4f6367"),
	modify_hand = function(self, cards, poker_hands, text, mult, hand_chips)
		if G.GAME.current_round.discards_left > 1 then
			G.GAME.blind.triggered = true
			return math.floor(mult / G.GAME.current_round.discards_left), hand_chips, true
		end
		return mult, hand_chips, false
	end,
}
local oldserpent = {
	dependencies = {
		items = {
			"set_cry_blind",
		},
	},
	object_type = "Blind",
	name = "cry-oldserpent",
	key = "oldserpent",
	pos = { x = 0, y = 6 },
	boss = {
		min = 5,
		max = 10,
	},
	atlas = "nostalgia",
	order = 9,
	boss_colour = HEX("4f6367"),
	modify_hand = function(self, cards, poker_hands, text, mult, hand_chips)
		if G.GAME.hands[text].level > to_big(1) then
			G.GAME.blind.triggered = true
			return math.floor(mult / G.GAME.hands[text].level), hand_chips, true
		end
		return mult, hand_chips, false
	end,
}
local oldpillar = {
	dependencies = {
		items = {
			"set_cry_blind",
		},
	},
	object_type = "Blind",
	name = "cry-oldpillar",
	key = "oldpillar",
	pos = { x = 0, y = 7 },
	boss = {
		min = 3,
		max = 10,
	},
	atlas = "nostalgia",
	order = 10,
	boss_colour = HEX("4f6367"),
	debuff_hand = function(self, cards, hand, handname, check)
		if handname == "Straight" and not G.GAME.blind.disabled then
			G.GAME.blind.triggered = true
			return true
		end
		return false
	end,
	get_loc_debuff_text = function(self)
		return localize("cry_debuff_oldpillar")
	end,
}
local oldflint = {
	dependencies = {
		items = {
			"set_cry_blind",
		},
	},
	object_type = "Blind",
	name = "cry-oldflint",
	key = "oldflint",
	pos = { x = 0, y = 8 },
	boss = {
		min = 3,
		max = 10,
	},
	atlas = "nostalgia",
	order = 11,
	boss_colour = HEX("4f6367"),
	debuff_hand = function(self, cards, hand, handname, check)
		if handname == "Flush" and not G.GAME.blind.disabled then
			G.GAME.blind.triggered = true
			return true
		end
		return false
	end,
	get_loc_debuff_text = function(self)
		return localize("cry_debuff_oldflint")
	end,
}
local oldmark = {
	dependencies = {
		items = {
			"set_cry_blind",
		},
	},
	object_type = "Blind",
	name = "cry-oldmark",
	key = "oldmark",
	pos = { x = 0, y = 1 },
	boss = {
		min = 4,
		max = 10,
	},
	atlas = "nostalgia",
	order = 12,
	boss_colour = HEX("4f6367"),
	debuff_hand = function(self, cards, hand, handname, check)
		if next(hand["Pair"]) then
			G.GAME.blind.triggered = true
			return true
		end
		return false
	end,
	get_loc_debuff_text = function(self)
		return localize("cry_debuff_oldmark")
	end,
}
local tax = {
	dependencies = {
		items = {
			"set_cry_blind",
		},
	},
	object_type = "Blind",
	name = "cry-Tax",
	key = "tax",
	pos = { x = 0, y = 0 },
	boss = {
		min = 1,
		max = 10,
	},
	atlas = "blinds",
	order = 2,
	boss_colour = HEX("40ff40"),
	loc_vars = function(self, info_queue, card)
		return { vars = { 0.4 * get_blind_amount(G.GAME.round_resets.ante) * 2 * G.GAME.starting_params.ante_scaling } } -- no bignum?
	end,
	collection_loc_vars = function(self)
		return { vars = { localize("cry_tax_placeholder") } }
	end,
	cry_cap_score = function(self, score)
		return math.floor(math.min(0.4 * G.GAME.blind.chips, score) + 0.5)
	end,
	in_pool = function()
		return G.GAME.round_resets.hands >= 3
	end,
}
local box = {
	dependencies = {
		items = {
			"set_cry_blind",
		},
	},
	object_type = "Blind",
	name = "cry-box",
	key = "box",
	pos = { x = 0, y = 8 },
	boss = {
		min = 1,
		max = 10,
	},
	atlas = "blinds",
	order = 13,
	boss_colour = HEX("883a3b"),
	recalc_debuff = function(self, card, from_blind)
		if (card.area == G.jokers) and not G.GAME.blind.disabled and card.config.center.rarity == 1 then
			return true
		end
		return false
	end,
}
local clock = {
	dependencies = {
		items = {
			"set_cry_blind",
			"set_cry_timer",
		},
	},
	object_type = "Blind",
	name = "cry-Clock",
	key = "clock",
	pos = { x = 0, y = 1 },
	mult = 0,
	boss = {
		min = 1,
		max = 10,
	},
	config = {
		tw_bl = {
			ignore = true,
		},
	},
	atlas = "blinds",
	order = 3,
	boss_colour = HEX("853455"),
	defeat = function(self, silent)
		G.P_BLINDS.bl_cry_clock.mult = 0
	end,
	disable = function(self, silent)
		G.GAME.blind.chips = get_blind_amount(G.GAME.round_resets.ante) * G.GAME.starting_params.ante_scaling * 2
		G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
	end,
	cry_ante_base_mod = function(self, dt)
		if G.SETTINGS.paused then
			return 0
		else
			return 0.1 * (dt * G.SETTINGS.GAMESPEED / 4) / 3
		end
	end,
}
local trick = {
	dependencies = {
		items = {
			"set_cry_blind",
		},
	},
	object_type = "Blind",
	name = "cry-Trick",
	key = "trick",
	pos = { x = 0, y = 3 },
	boss = {
		min = 1,
		max = 10,
	},
	atlas = "blinds",
	order = 14,
	boss_colour = HEX("babd24"),
	cry_after_play = function(self)
		--flip and shuffle all cards held in hand
		for k, v in ipairs(G.hand.cards) do
			if v.facing == "front" then
				v:flip()
			end
		end
		--[[if #G.hand.cards > 1 then
            G.E_MANAGER:add_event(Event({ trigger = 'after', delay = 0.2, func = function()
                G.E_MANAGER:add_event(Event({ func = function() G.hand:shuffle('cry_trick'); play_sound('cardSlide1', 0.85);return true end }))
                delay(0.15)
                G.E_MANAGER:add_event(Event({ func = function() G.hand:shuffle('cry_trick'); play_sound('cardSlide1', 1.15);return true end }))
                delay(0.15)
                G.E_MANAGER:add_event(Event({ func = function() G.hand:shuffle('cry_trick'); play_sound('cardSlide1', 1);return true end }))
                delay(0.5)
            return true end }))
        end--]]
	end,
}
local joke = {
	dependencies = {
		items = {
			"set_cry_blind",
		},
	},
	object_type = "Blind",
	name = "cry-Joke",
	key = "joke",
	pos = { x = 0, y = 4 },
	boss = {
		min = 1,
		max = 10,
	},
	atlas = "blinds",
	order = 15,
	boss_colour = HEX("00ffaa"),
	loc_vars = function(self)
		return {
			vars = {
				G.GAME.win_ante or 8,
				(G.GAME.win_ante and G.GAME.round_resets.ante) and math.floor(
					G.GAME.round_resets.ante + (G.GAME.win_ante - G.GAME.round_resets.ante % G.GAME.win_ante)
				) or 8,
			},
		}
	end,
	collection_loc_vars = function(self)
		return { vars = { "8", localize("cry_joke_placeholder") } }
	end,
	cry_calc_ante_gain = function(self)
		if to_big(G.GAME.chips) > to_big(G.GAME.blind.chips) * 2 then
			if G.GAME.round_resets.ante == 1 then
				G.GAME.cry_ach_conditions.the_jokes_on_you_triggered = true
			end
			return G.GAME.win_ante - G.GAME.round_resets.ante % G.GAME.win_ante
		end
		return 1
	end,
}
local hammer = {
	dependencies = {
		items = {
			"set_cry_blind",
		},
	},
	object_type = "Blind",
	name = "cry-hammer",
	key = "hammer",
	pos = { x = 0, y = 9 },
	boss = {
		min = 2,
		max = 10,
	},
	atlas = "blinds",
	order = 19,
	boss_colour = HEX("ffabd6"),
	recalc_debuff = function(self, card, from_blind)
		if card.area ~= G.jokers and not G.GAME.blind.disabled then
			if
				not SMODS.has_no_rank(card)
				and (
					card.base.value == "3"
					or card.base.value == "5"
					or card.base.value == "7"
					or card.base.value == "9"
					or card.base.value == "Ace"
				)
			then
				return true
			end
			return false
		end
	end,
}
local magic = {
	dependencies = {
		items = {
			"set_cry_blind",
		},
	},
	object_type = "Blind",
	name = "cry-magic",
	key = "magic",
	pos = { x = 0, y = 12 },
	boss = {
		min = 2,
		max = 10,
	},
	atlas = "blinds",
	order = 20,
	boss_colour = HEX("009eff"),
	recalc_debuff = function(self, card, from_blind)
		if card.area ~= G.jokers and not G.GAME.blind.disabled then
			if
				not SMODS.has_no_rank(card)
				and (
					card.base.value == "2"
					or card.base.value == "4"
					or card.base.value == "6"
					or card.base.value == "8"
					or card.base.value == "10"
				)
			then
				return true
			end
			return false
		end
	end,
}
local windmill = {
	dependencies = {
		items = {
			"set_cry_blind",
		},
	},
	object_type = "Blind",
	name = "cry-windmill",
	key = "windmill",
	pos = { x = 0, y = 10 },
	boss = {
		min = 4,
		max = 10,
	},
	atlas = "blinds",
	order = 16,
	boss_colour = HEX("f70000"),
	recalc_debuff = function(self, card, from_blind)
		if (card.area == G.jokers) and not G.GAME.blind.disabled and card.config.center.rarity == 2 then
			return true
		end
		return false
	end,
}
local striker = {
	dependencies = {
		items = {
			"set_cry_blind",
		},
	},
	object_type = "Blind",
	name = "cry-striker",
	key = "striker",
	pos = { x = 0, y = 13 },
	boss = {
		min = 4,
		max = 10,
	},
	atlas = "blinds",
	order = 1,
	boss_colour = HEX("505e5c"),
	recalc_debuff = function(self, card, from_blind)
		if (card.area == G.jokers) and not G.GAME.blind.disabled and card.config.center.rarity == 3 then
			return true
		end
		return false
	end,
}
local shackle = {
	dependencies = {
		items = {
			"set_cry_blind",
		},
	},
	object_type = "Blind",
	name = "cry-shackle",
	key = "shackle",
	pos = { x = 0, y = 15 },
	boss = {
		min = 1,
		max = 10,
	},
	atlas = "blinds",
	order = 18,
	boss_colour = HEX("010466"),
	in_pool = function()
		if G.GAME.modifiers.cry_force_edition and G.GAME.modifiers.cry_force_edition == "negative" then
			return false
		end
		return #Cryptid.advanced_find_joker(nil, nil, "e_negative", nil, true) ~= 0
	end,
	recalc_debuff = function(self, card, from_blind)
		if
			(card.area == G.jokers)
			and not G.GAME.blind.disabled
			and Cryptid.safe_get(card, "edition", "negative") == true
		then
			return true
		end
		return false
	end,
}
local pin = {
	dependencies = {
		items = {
			"set_cry_blind",
		},
	},
	object_type = "Blind",
	name = "cry-pin",
	key = "pin",
	pos = { x = 0, y = 14 },
	boss = {
		min = 4,
		max = 10,
	},
	atlas = "blinds",
	order = 17,
	boss_colour = HEX("452703"),
	--Todo: whitelist candy jokers
	in_pool = function()
		if not G.jokers or not G.jokers.cards then
			return false
		end
		return #Cryptid.advanced_find_joker(nil, { 1, 2, 3 }, nil, nil, true) < #G.jokers.cards
	end,
	recalc_debuff = function(self, card, from_blind)
		if
			(card.area == G.jokers)
			and not G.GAME.blind.disabled
			and (
				card.config.center.rarity ~= 3
				and card.config.center.rarity ~= 2
				and card.config.center.rarity ~= 1
				and card.config.center.rarity ~= 5
			)
		then
			return true
		end
		return false
	end,
}
--It seems Showdown blind order is seperate from normal blind collection order? convenient for me at least
--Nvm they changed it
local lavender_loop = {
	dependencies = {
		items = {
			"set_cry_blind",
			"set_cry_timer",
		},
	},
	object_type = "Blind",
	name = "cry-Lavender Loop",
	key = "lavender_loop",
	pos = { x = 0, y = 2 },
	mult = 1,
	dollars = 8,
	boss = {
		min = 3,
		max = 10,
		showdown = true,
	},
	atlas = "blinds",
	order = 91,
	boss_colour = HEX("ae00ff"),
	set_blind = function(self, reset, silent)
		G.GAME.cry_ach_conditions.patience_virtue_timer = 120
	end,
	disable = function(self, silent)
		G.GAME.blind.chips = get_blind_amount(G.GAME.round_resets.ante) * G.GAME.starting_params.ante_scaling * 2
		G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
		G.GAME.cry_ach_conditions.patience_virtue_earnable = false
		G.GAME.cry_ach_conditions.patience_virtue_earnable = nil
	end,
	cry_round_base_mod = function(self, dt)
		if
			G.GAME.cry_ach_conditions.patience_virtue_timer > 0
			and G.GAME.cry_ach_conditions.patience_virtue_earnable ~= true
		then
			G.GAME.cry_ach_conditions.patience_virtue_timer = G.GAME.cry_ach_conditions.patience_virtue_timer
				- dt
					* (G.GAME.modifiers.cry_rush_hour_iii and 0.5 or 1)
					* (G.SETTINGS.paused and 0 or 1)
					* G.SETTINGS.GAMESPEED
		elseif G.GAME.current_round.hands_played == 0 then
			G.GAME.cry_ach_conditions.patience_virtue_earnable = true
		end
		if G.SETTINGS.paused or G.STATE == G.STATES.HAND_PLAYED then
			return 1
		else
			return 1.25 ^ (dt / (1.5 / G.SETTINGS.GAMESPEED * 4))
		end
	end,
}
local tornado = {
	dependencies = {
		items = {
			"set_cry_blind",
		},
	},
	object_type = "Blind",
	name = "cry-tornado",
	key = "tornado",
	pos = { x = 0, y = 16 },
	mult = 0.8,
	dollars = 8,
	boss = {
		min = 3,
		max = 10,
		showdown = true,
	},
	atlas = "blinds",
	order = 94,
	boss_colour = HEX("3dd9ca"),
	loc_vars = function(self)
		return { vars = { "" .. ((Cryptid.safe_get(G.GAME, "probabilities", "normal") or 1) * 2), 3 } }
	end,
	set_blind = function(self, reset, silent)
		if not reset then
			G.GAME.blind.tornado_guarantee = pseudorandom(pseudoseed("tornado"), 1, G.GAME.round_resets.hands)
		end
	end,
	in_pool = function()
		return #Cryptid.advanced_find_joker("Oops! All 6s", nil, nil, { "eternal" }, nil) == 0
	end,
	collection_loc_vars = function(self)
		return { vars = { "" .. ((Cryptid.safe_get(G.GAME, "probabilities", "normal") or 1) * 2), 3 } }
	end,
	debuff_hand = function(self, cards, hand, handname, check)
		if
			not check
			and (pseudorandom(pseudoseed("tornado")) < ((G.GAME.probabilities.normal * 2) / 3))
			and not G.GAME.blind.disabled
		then
			--check for guarantee
			if
				G.GAME.probabilities.normal <= 1
				and G.GAME.current_round.hands_left + 1 == G.GAME.blind.tornado_guarantee
			then
				return false
			end

			G.GAME.blind.triggered = true
			return true
		end
		return false
	end,
}
--todo: disable get_local_debuff_text for this
local vermillion_virus = {
	dependencies = {
		items = {
			"set_cry_blind",
		},
	},
	object_type = "Blind",
	name = "cry-Vermillion Virus",
	key = "vermillion_virus",
	pos = { x = 0, y = 5 },
	dollars = 8,
	boss = {
		min = 3,
		max = 10,
		showdown = true,
	},
	atlas = "blinds",
	order = 90,
	boss_colour = HEX("f65d34"),
	cry_before_play = function(self)
		if G.jokers.cards[1] then
			local idx = pseudorandom(pseudoseed("cry_vermillion_virus"), 1, #G.jokers.cards)
			if G.jokers.cards[idx] then
				if G.jokers.cards[idx].config.center.immune_to_vermillion then
					card_eval_status_text(
						G.jokers.cards[idx],
						"extra",
						nil,
						nil,
						nil,
						{ message = localize("k_nope_ex"), colour = G.C.JOKER_GREY }
					)
				else
					_card = create_card("Joker", G.jokers, nil, nil, nil, nil, nil, "cry_vermillion_virus_gen")
					G.jokers.cards[idx]:remove_from_deck()
					_card:add_to_deck()
					_card:start_materialize()
					G.jokers.cards[idx] = _card
					_card:set_card_area(G.jokers)
					G.jokers:set_ranks()
					G.jokers:align_cards()
				end
			end
		end
	end,
}
local sapphire_stamp = {
	dependencies = {
		items = {
			"set_cry_blind",
		},
	},
	object_type = "Blind",
	name = "cry-Sapphire Stamp",
	key = "sapphire_stamp",
	pos = { x = 0, y = 6 },
	dollars = 8,
	boss = {
		min = 3,
		max = 10,
		showdown = true,
	},
	atlas = "blinds",
	order = 92,
	boss_colour = HEX("4057d6"),
	cry_before_play = function(self)
		local idx = pseudorandom(pseudoseed("cry_sapphire_stamp"), 1, #G.hand.highlighted)
		G.hand:remove_from_highlighted(G.hand.highlighted[idx])
	end,
	set_blind = function(self, reset, silent)
		if not reset then
			G.GAME.stamp_mod = true
			G.hand.config.highlighted_limit = G.hand.config.highlighted_limit + 1
		end
	end,
	defeat = function(self, silent)
		if G.GAME.stamp_mod then
			G.GAME.stamp_mod = nil
		end
		if not G.GAME.blind.disabled then
			G.hand.config.highlighted_limit = G.hand.config.highlighted_limit - 1
		end
	end,
	disable = function(self, silent)
		if G.GAME.stamp_mod then
			G.GAME.stamp_mod = nil
		end
		if not G.GAME.blind.disabled then
			G.hand.config.highlighted_limit = G.hand.config.highlighted_limit - 1
		end
	end,
}
local obsidian_orb = {
	dependencies = {
		items = {
			"set_cry_blind",
		},
	},
	object_type = "Blind",
	name = "cry-Obsidian Orb",
	key = "obsidian_orb",
	pos = { x = 0, y = 7 },
	dollars = 8,
	boss = {
		min = 3,
		max = 10,
		showdown = true,
	},
	atlas = "blinds",
	order = 93,
	boss_colour = HEX("290759"),
	set_blind = function(self, reset, silent)
		for k, _ in pairs(G.GAME.defeated_blinds) do
			s = G.P_BLINDS[k]
			if s.set_blind then
				s:set_blind(reset, silent)
			end
			if s.name == "The Eye" and not reset then
				G.GAME.blind.hands = {
					["Flush Five"] = false,
					["Flush House"] = false,
					["Five of a Kind"] = false,
					["Straight Flush"] = false,
					["Four of a Kind"] = false,
					["Full House"] = false,
					["Flush"] = false,
					["Straight"] = false,
					["Three of a Kind"] = false,
					["Two Pair"] = false,
					["Pair"] = false,
					["High Card"] = false,
				}
			end
			if s.name == "The Mouth" and not reset then
				G.GAME.blind.only_hand = false
			end
			if s.name == "The Fish" and not reset then
				G.GAME.blind.prepped = nil
			end
			if s.name == "The Water" and not reset then
				G.GAME.blind.discards_sub = G.GAME.current_round.discards_left
				ease_discard(-G.GAME.blind.discards_sub)
			end
			if s.name == "The Needle" and not reset then
				G.GAME.blind.hands_sub = G.GAME.round_resets.hands - 1
				ease_hands_played(-G.GAME.blind.hands_sub)
			end
			if s.name == "The Manacle" and not reset then
				G.hand:change_size(-1)
			end
			if s.name == "Amber Acorn" and not reset and #G.jokers.cards > 0 then
				G.jokers:unhighlight_all()
				for k, v in ipairs(G.jokers.cards) do
					v:flip()
				end
				if #G.jokers.cards > 1 then
					G.E_MANAGER:add_event(Event({
						trigger = "after",
						delay = 0.2,
						func = function()
							G.E_MANAGER:add_event(Event({
								func = function()
									G.jokers:shuffle("aajk")
									play_sound("cardSlide1", 0.85)
									return true
								end,
							}))
							delay(0.15)
							G.E_MANAGER:add_event(Event({
								func = function()
									G.jokers:shuffle("aajk")
									play_sound("cardSlide1", 1.15)
									return true
								end,
							}))
							delay(0.15)
							G.E_MANAGER:add_event(Event({
								func = function()
									G.jokers:shuffle("aajk")
									play_sound("cardSlide1", 1)
									return true
								end,
							}))
							delay(0.5)
							return true
						end,
					}))
				end
			end

			--add new debuffs
			for _, v in ipairs(G.playing_cards) do
				self:debuff_card(v)
			end
			for _, v in ipairs(G.jokers.cards) do
				if not reset then
					self:debuff_card(v, true)
				end
			end
		end
	end,
	defeat = function(self, silent)
		for k, _ in pairs(G.GAME.defeated_blinds) do
			if G.P_BLINDS[k].defeat then
				G.P_BLINDS[k]:defeat(silent)
			end
			if G.P_BLINDS[k].name == "The Manacle" and not self.disabled then
				G.hand:change_size(1)
			end
		end
	end,
	disable = function(self, silent)
		for k, _ in pairs(G.GAME.defeated_blinds) do
			s = G.P_BLINDS[k]
			if s.disable then
				s:disable(silent)
			end
			if s.name == "The Water" then
				ease_discard(G.GAME.blind.discards_sub)
			end
			if s.name == "The Wheel" or s.name == "The House" or s.name == "The Mark" or s.name == "The Fish" then
				for i = 1, #G.hand.cards do
					if G.hand.cards[i].facing == "back" then
						G.hand.cards[i]:flip()
					end
				end
				for k, v in pairs(G.playing_cards) do
					v.ability.wheel_flipped = nil
				end
			end
			if s.name == "The Needle" then
				ease_hands_played(G.GAME.blind.hands_sub)
			end
			if s.name == "The Wall" then
				G.GAME.blind.chips = G.GAME.blind.chips / 2
				G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
			end
			if s.name == "Cerulean Bell" then
				for k, v in ipairs(G.playing_cards) do
					v.ability.forced_selection = nil
				end
			end
			if s.name == "The Manacle" then
				G.hand:change_size(1)

				G.FUNCS.draw_from_deck_to_hand(1)
			end
			if s.name == "Violet Vessel" then
				G.GAME.blind.chips = G.GAME.blind.chips / 3
				G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
			end
		end
	end,
	press_play = function(self)
		for k, _ in pairs(G.GAME.defeated_blinds) do
			s = G.P_BLINDS[k]
			if s.press_play then
				s:press_play()
			end
			if s.name == "The Hook" then
				G.E_MANAGER:add_event(Event({
					func = function()
						local any_selected = nil
						local _cards = {}
						for k, v in ipairs(G.hand.cards) do
							_cards[#_cards + 1] = v
						end
						for i = 1, 2 do
							if G.hand.cards[i] then
								local selected_card, card_key = pseudorandom_element(_cards, pseudoseed("ObsidianOrb"))
								G.hand:add_to_highlighted(selected_card, true)
								table.remove(_cards, card_key)
								any_selected = true
								play_sound("card1", 1)
							end
						end
						if any_selected then
							G.FUNCS.discard_cards_from_highlighted(nil, true)
						end
						return true
					end,
				}))
				G.GAME.blind.triggered = true
				delay(0.7)
			end
			if s.name == "Crimson Heart" then
				if G.jokers.cards[1] then
					G.GAME.blind.triggered = true
					G.GAME.blind.prepped = true
				end
			end
			if s.name == "The Fish" then
				G.GAME.blind.prepped = true
			end
			if s.name == "The Tooth" then
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0.2,
					func = function()
						for i = 1, #G.play.cards do
							G.E_MANAGER:add_event(Event({
								func = function()
									G.play.cards[i]:juice_up()
									return true
								end,
							}))
							ease_dollars(-1)
							delay(0.23)
						end
						return true
					end,
				}))
				G.GAME.blind.triggered = true
			end
		end
	end,
	modify_hand = function(self, cards, poker_hands, text, mult, hand_chips)
		local new_mult = mult
		local new_chips = hand_chips
		local trigger = false
		for k, _ in pairs(G.GAME.defeated_blinds) do
			s = G.P_BLINDS[k]
			if s.modify_hand then
				local this_trigger = false
				new_mult, new_chips, this_trigger = s:modify_hand(cards, poker_hands, text, new_mult, new_chips)
				trigger = trigger or this_trigger
			end
			if s.name == "The Flint" then
				G.GAME.blind.triggered = true
				new_mult = math.max(math.floor(new_mult * 0.5 + 0.5), 1)
				new_chips = math.max(math.floor(new_chips * 0.5 + 0.5), 0)
				trigger = true
			end
		end
		return new_mult or mult, new_chips or hand_chips, trigger
	end,
	debuff_hand = function(self, cards, hand, handname, check)
		G.GAME.blind.debuff_boss = nil
		for k, _ in pairs(G.GAME.defeated_blinds) do
			s = G.P_BLINDS[k]
			if s.debuff_hand and s:debuff_hand(cards, hand, handname, check) then
				G.GAME.blind.debuff_boss = s
				return true
			end
			if s.debuff then
				G.GAME.blind.triggered = false
				if s.debuff.hand and next(hand[s.debuff.hand]) then
					G.GAME.blind.triggered = true
					G.GAME.blind.debuff_boss = s
					return true
				end
				if s.debuff.h_size_ge and #cards < s.debuff.h_size_ge then
					G.GAME.blind.triggered = true
					G.GAME.blind.debuff_boss = s
					return true
				end
				if s.debuff.h_size_le and #cards > s.debuff.h_size_le then
					G.GAME.blind.triggered = true
					G.GAME.blind.debuff_boss = s
					return true
				end
				if s.name == "The Eye" then
					if G.GAME.blind.hands[handname] then
						G.GAME.blind.triggered = true
						G.GAME.blind.debuff_boss = s
						return true
					end
					if not check then
						G.GAME.blind.hands[handname] = true
					end
				end
				if s.name == "The Mouth" then
					if s.only_hand and s.only_hand ~= handname then
						G.GAME.blind.triggered = true
						G.GAME.blind.debuff_boss = s
						return true
					end
					if not check then
						s.only_hand = handname
					end
				end
			end
			if s.name == "The Arm" then
				G.GAME.blind.triggered = false
				if to_big(G.GAME.hands[handname].level) > to_big(1) then
					G.GAME.blind.triggered = true
					if not check then
						level_up_hand(G.GAME.blind.children.animatedSprite, handname, nil, -1)
						G.GAME.blind:wiggle()
					end
				end
			end
			if s.name == "The Ox" then
				G.GAME.blind.triggered = false
				if handname == G.GAME.current_round.most_played_poker_hand then
					G.GAME.blind.triggered = true
					if not check then
						ease_dollars(-G.GAME.dollars, true)
						G.GAME.blind:wiggle()
					end
				end
			end
		end
		return false
	end,
	drawn_to_hand = function(self)
		for k, _ in pairs(G.GAME.defeated_blinds) do
			s = G.P_BLINDS[k]
			if s.drawn_to_hand then
				s:drawn_to_hand()
			end
			if s.name == "Cerulean Bell" then
				local any_forced = nil
				for k, v in ipairs(G.hand.cards) do
					if v.ability.forced_selection then
						any_forced = true
					end
				end
				if not any_forced then
					G.hand:unhighlight_all()
					local forced_card = pseudorandom_element(G.hand.cards, pseudoseed("ObsidianOrb"))
					forced_card.ability.forced_selection = true
					G.hand:add_to_highlighted(forced_card)
				end
			end
			if s.name == "Crimson Heart" and G.GAME.blind.prepped and G.jokers.cards[1] then
				local jokers = {}
				for i = 1, #G.jokers.cards do
					if not G.jokers.cards[i].debuff or #G.jokers.cards < 2 then
						jokers[#jokers + 1] = G.jokers.cards[i]
					end
					G.jokers.cards[i]:set_debuff(false)
				end
				local _card = pseudorandom_element(jokers, pseudoseed("ObsidianOrb"))
				if _card then
					_card:set_debuff(true)
					_card:juice_up()
					G.GAME.blind:wiggle()
				end
			end
		end
	end,
	stay_flipped = function(self, area, card)
		for k, _ in pairs(G.GAME.defeated_blinds) do
			s = G.P_BLINDS[k]
			if s.stay_flipped and s:stay_flipped(area, card) then
				return true
			end
			if area == G.hand then
				if
					s.name == "The Wheel"
					and pseudorandom(pseudoseed("ObsidianOrb")) < G.GAME.probabilities.normal / 7
				then
					return true
				end
				if
					s.name == "The House"
					and G.GAME.current_round.hands_played == 0
					and G.GAME.current_round.discards_used == 0
				then
					return true
				end
				if s.name == "The Mark" and card:is_face(true) then
					return true
				end
				if s.name == "The Fish" and G.GAME.blind.prepped then
					return true
				end
			end
		end
	end,
	debuff_card = function(self, card, from_blind)
		if card and type(card) == "table" and card.area then
			for k, _ in pairs(G.GAME.defeated_blinds) do
				s = G.P_BLINDS[k]
				if s.debuff_card then
					s:debuff_card(card, from_blind)
				end
				if s.debuff and not G.GAME.blind.disabled and card.area ~= G.jokers then
					--this part is buggy for some reason
					if s.debuff.suit and Card.is_suit(card, s.debuff.suit, true) then
						card:set_debuff(true)
						return
					end
					if s.debuff.is_face == "face" and Card.is_face(card, true) then
						card:set_debuff(true)
						return
					end
					if s.name == "The Pillar" and card.ability.played_this_ante then
						card:set_debuff(true)
						return
					end
					if s.debuff.value and s.debuff.value == card.base.value then
						card:set_debuff(true)
						return
					end
					if s.debuff.nominal and s.debuff.nominal == card.base.nominal then
						card:set_debuff(true)
						return
					end
				end
				if s.name == "Crimson Heart" and not G.GAME.blind.disabled and card.area == G.jokers then
					return
				end
				if s.name == "Verdant Leaf" and not G.GAME.blind.disabled and card.area ~= G.jokers then
					card:set_debuff(true)
					return
				end
			end
		end
	end,
	cry_ante_base_mod = function(self, dt)
		local mod = 0
		for k, _ in pairs(G.GAME.defeated_blinds) do
			s = G.P_BLINDS[k]
			if s.cry_ante_base_mod then
				mod = mod + s:cry_ante_base_mod(dt)
			end
		end
		return mod
	end,
	cry_round_base_mod = function(self, dt)
		local mod = 1
		for k, _ in pairs(G.GAME.defeated_blinds) do
			s = G.P_BLINDS[k]
			if s.cry_round_base_mod then
				mod = mod * s:cry_round_base_mod(dt)
			end
		end
		return mod
	end,
	cry_cap_score = function(self, score)
		for k, _ in pairs(G.GAME.defeated_blinds) do
			s = G.P_BLINDS[k]
			if s.cry_cap_score then
				score = s:cry_cap_score(score)
			end
		end
		return score
	end,
	cry_calc_ante_gain = function(self)
		local ante = 1
		for k, _ in pairs(G.GAME.defeated_blinds) do
			s = G.P_BLINDS[k]
			if s.cry_calc_ante_gain then
				ante = math.max(ante, s:cry_calc_ante_gain())
			end
		end
		return ante
	end,
	cry_before_play = function(self)
		for k, _ in pairs(G.GAME.defeated_blinds) do
			s = G.P_BLINDS[k]
			if s.cry_before_play then
				s:cry_before_play()
			end
		end
	end,
	cry_after_play = function(self)
		for k, _ in pairs(G.GAME.defeated_blinds) do
			s = G.P_BLINDS[k]
			if s.cry_after_play then
				s:cry_after_play()
			end
		end
	end,
	get_loc_debuff_text = function(self)
		if not G.GAME.blind.debuff_boss then
			return localize("cry_debuff_obsidian_orb")
		end
		local loc_vars = nil
		if G.GAME.blind.debuff_boss.name == "The Ox" then
			loc_vars = { localize(G.GAME.current_round.most_played_poker_hand, "poker_hands") }
		end
		local loc_target =
			localize({ type = "raw_descriptions", key = G.GAME.blind.debuff_boss.key, set = "Blind", vars = loc_vars })
		local loc_debuff_text = ""
		for k, v in ipairs(loc_target) do
			loc_debuff_text = loc_debuff_text .. v .. (k <= #loc_target and " " or "")
		end
		local disp_text = (G.GAME.blind.debuff_boss.name == "The Wheel" and G.GAME.probabilities.normal or "")
			.. loc_debuff_text
		if (G.GAME.blind.debuff_boss.name == "The Mouth") and G.GAME.blind.only_hand then
			disp_text = disp_text .. " [" .. localize(G.GAME.blind.only_hand, "poker_hands") .. "]"
		end
		return disp_text
	end,
}
local trophy = {
	dependencies = {
		items = {
			"set_cry_blind",
		},
	},
	mult = 1,
	object_type = "Blind",
	name = "cry-Lemon Trophy",
	key = "trophy",
	pos = { x = 0, y = 17 },
	dollars = 8,
	boss = {
		min = 3,
		max = 10,
		showdown = true,
	},
	atlas = "blinds",
	order = 95,
	boss_colour = HEX("bbdb44"),
	set_blind = function(self, reset, silent)
		if not reset then
			G.GAME.trophymod = true
		end
	end,
	defeat = function(self, silent)
		if G.GAME.trophymod then
			G.GAME.trophymod = nil
		end
	end,
	disable = function(self, silent)
		if G.GAME.trophymod then
			G.GAME.trophymod = nil
		end
	end,
}
local items_togo = {
	oldox,
	oldhouse,
	oldarm,
	oldfish,
	oldmanacle,
	oldserpent,
	oldpillar,
	oldflint,
	oldmark,
	tax,
	trick,
	joke,
	hammer,
	magic,
	box,
	windmill,
	striker,
	shackle,
	pin,
	vermillion_virus,
	tornado,
	sapphire_stamp,
	obsidian_orb,
	clock,
	lavender_loop,
	trophy,
}
return { name = "Blinds", items = items_togo }
