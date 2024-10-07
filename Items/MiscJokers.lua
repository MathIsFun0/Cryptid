local dropshot = {
	object_type = "Joker",
	name = "cry-Dropshot",
	key = "dropshot",
	config = { extra = { Xmult_mod = 0.2, x_mult = 1 } },
	pos = { x = 5, y = 0 },
	rarity = 3,
	cost = 8,
	blueprint_compat = true,
	perishable_compat = false,
	atlas = "atlasone",
	loc_vars = function(self, info_queue, center)
		return {
			vars = {
				center.ability.extra.Xmult_mod,
				localize(
					G.GAME.current_round.cry_dropshot_card and G.GAME.current_round.cry_dropshot_card.suit or "Spades",
					"suits_singular"
				),
				center.ability.extra.x_mult,
				colours = {
					G.C.SUITS[G.GAME.current_round.cry_dropshot_card and G.GAME.current_round.cry_dropshot_card.suit or "Spades"],
				},
			},
		}
	end,
	calculate = function(self, card, context)
		if context.cardarea == G.jokers and context.before and not context.blueprint then
			cards = 0
			for k, v in ipairs(context.scoring_hand) do
				v.cry_dropshot_incompat = true
			end
			for k, v in ipairs(context.full_hand) do
				if not v.cry_dropshot_incompat and v:is_suit(G.GAME.current_round.cry_dropshot_card.suit) then
					cards = cards + 1
					G.E_MANAGER:add_event(Event({
						func = function()
							v:juice_up()
							return true
						end,
					}))
				end
			end
			for k, v in ipairs(context.scoring_hand) do
				v.cry_dropshot_incompat = nil
			end
			if cards > 0 then
				card.ability.extra.x_mult = card.ability.extra.x_mult + cards * card.ability.extra.Xmult_mod
				card_eval_status_text(
					card,
					"extra",
					nil,
					nil,
					nil,
					{ message = localize({ type = "variable", key = "a_xmult", vars = { card.ability.extra.x_mult } }) }
				)
				return nil, true
			end
		end
		if
			context.cardarea == G.jokers
			and (to_big(card.ability.extra.x_mult) > to_big(1))
			and not context.before
			and not context.after
		then
			return {
				message = localize({ type = "variable", key = "a_xmult", vars = { card.ability.extra.x_mult } }),
				Xmult_mod = card.ability.extra.x_mult,
			}
		end
	end,
}
local happyhouse = {
	object_type = "Joker",
	name = "cry-happyhouse",
	key = "happyhouse",
	pos = { x = 2, y = 4 },
	config = { extra = { mult = 4, check = 0 } },
	immune_to_chemach = true,
	rarity = 2,
	cost = 2,
	blueprint_compat = true,
	atlas = "atlastwo",
	loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.mult, center.ability.extra.check } }
	end,
	calculate = function(self, card, context)
		if
			context.cardarea == G.jokers
			and context.before
			and not context.blueprint
			and not context.retrigger_joker
		then
			card.ability.extra.check = card.ability.extra.check + 1
			if
				card.ability.extra.check == 114
				and G.GAME.round_resets.ante < 8
				and not (
					G.GAME.selected_back.effect.center.key == "antimatter"
					or G.GAME.selected_back.effect.center.key == "equilibrium"
				)
			then --Yes, the cut off point is boss blind Ante 7. I'm evil >:3.
				check_for_unlock({ type = "home_realtor" })
			end
			if card.ability.extra.check < 114 then --Hardcoded, dont want misprint to mess with this hehe
				return {
					card_eval_status_text(card, "extra", nil, nil, nil, {
						message = card.ability.extra.check .. "/114",
						colour = G.C.DARK_EDITION,
					}),
				}
			end
		end
		if
			context.cardarea == G.jokers
			and (to_big(card.ability.extra.mult) > to_big(1))
			and card.ability.extra.check > 113
			and not context.before
			and not context.after
		then
			return {
				message = localize{type='variable',key='a_powmult',vars={card.ability.extra.mult}},
				Emult_mod = card.ability.extra.mult,
				colour = G.C.DARK_EDITION,
				card = card,
			}
		end
	end,
}
local maximized = {
	object_type = "Joker",
	name = "cry-Maximized",
	key = "maximized",
	pos = { x = 5, y = 2 },
	rarity = 3,
	cost = 11,
	atlas = "atlastwo",
}
local potofjokes = {
	object_type = "Joker",
	unlocked = false,
	name = "cry-Pot of Jokes",
	key = "pot_of_jokes",
	config = { extra = { h_size = -2, h_mod = 1 } },
	pos = { x = 5, y = 0 },
	immune_to_chemach = true,
	rarity = 3,
	cost = 10,
	perishable_compat = false,
	atlas = "atlastwo",
	loc_vars = function(self, info_queue, center)
		return {
			vars = {
				center.ability.extra.h_size < 0 and center.ability.extra.h_size or "+" .. center.ability.extra.h_size,
				center.ability.extra.h_mod,
			},
		}
	end,
	calculate = function(self, card, context)
		if context.end_of_round and not context.individual and not context.repetition and not context.blueprint then
			card.ability.extra.h_size = card.ability.extra.h_size + card.ability.extra.h_mod
			G.hand:change_size(card.ability.extra.h_mod)
			return {
				message = localize({ type = "variable", key = "a_handsize", vars = { card.ability.extra.h_mod } }),
				colour = G.C.FILTER,
				card = card,
			}
		end
	end,
	add_to_deck = function(self, card, from_debuff)
		G.hand:change_size(card.ability.extra.h_size)
	end,
	remove_from_deck = function(self, card, from_debuff)
		G.hand:change_size(-card.ability.extra.h_size)
	end,
	check_for_unlock = function(self, args)
        	if G and G.hand and G.hand.config.card_limit > 10 then
			unlock_card(self)
		end
    	end,
}
local queensgambit = {
	object_type = "Joker",
	name = "cry-Queen's Gambit",
	key = "queens_gambit",
	pos = { x = 1, y = 0 },
	rarity = 1,
	cost = 7,
	loc_vars = function(self, info_queue, center)
		if not center.edition or (center.edition and not center.edition.negative) then
			info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
		end
	end,
	atlas = "atlastwo",
	config = { extra = { type = "Straight Flush" } },
	calculate = function(self, card, context)
		if context.destroying_card and not context.blueprint then
			if
				G.GAME.current_round.current_hand.handname == "Royal Flush"
				and SMODS.Ranks[context.destroying_card.base.value].key == "Queen"
			then
				card_eval_status_text(
					card,
					"extra",
					nil,
					nil,
					nil,
					{ message = localize("k_plus_joker"), colour = G.C.FILTER }
				)
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					func = function()
						local card = create_card("Joker", G.jokers, nil, 0.99, nil, nil, nil, "cry_gambit")
						card:set_edition({ negative = true })
						card:add_to_deck()
						G.jokers:emplace(card)
						card:start_materialize()
						return true
					end,
				}))
				return nil, true
			end
		end
	end,
}
local wee_fib = {
	object_type = "Joker",
	name = "cry-Wee Fibonacci",
	key = "wee_fib",
	config = { extra = { mult = 0, mult_mod = 3 } },
	pos = { x = 1, y = 5 },
	rarity = 3,
	cost = 9,
	blueprint_compat = true,
	perishable_compat = false,
	loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.mult, center.ability.extra.mult_mod } }
	end,
	calculate = function(self, card, context)
		if context.cardarea == G.play and context.individual and not context.blueprint then
			local rank = SMODS.Ranks[context.other_card.base.value].key
			if rank == "Ace" or rank == "2" or rank == "3" or rank == "5" or rank == "8" then
				card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod

				return {
					extra = { focus = card, message = localize("k_upgrade_ex") },
					card = card,
					colour = G.C.MULT,
				}
			end
		end
		if
			context.cardarea == G.jokers
			and (to_big(card.ability.extra.mult) > to_big(0))
			and not context.before
			and not context.after
		then
			return {
				message = localize({ type = "variable", key = "a_mult", vars = { card.ability.extra.mult } }),
				mult_mod = card.ability.extra.mult,
				colour = G.C.MULT,
			}
		end
	end,
}
local whip = {
	object_type = "Joker",
	name = "cry-The WHIP",
	key = "whip",
	pos = { x = 5, y = 3 },
	config = { extra = { Xmult_mod = 0.5, x_mult = 1 } },
	rarity = 2,
	cost = 8,
	blueprint_compat = true,
	perishable_compat = false,
	atlas = "atlasone",
	loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.Xmult_mod, center.ability.extra.x_mult } }
	end,
	calculate = function(self, card, context)
		if context.cardarea == G.jokers and context.before and not context.blueprint then
			for i = 1, #context.full_hand do
				if SMODS.Ranks[context.full_hand[i].base.value].key == "2" then
					for j = 1, #context.full_hand do
						if SMODS.Ranks[context.full_hand[j].base.value].key == "7" then
							--Different suits
							for k, v in pairs(SMODS.Suits) do
								if
									context.full_hand[i]:is_suit(k, nil, true)
									and context.full_hand[j]:is_suit(k, nil, true)
								then
									return
								end
							end
							card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.Xmult_mod
							card_eval_status_text(
								card,
								"extra",
								nil,
								nil,
								nil,
								{
									message = localize({
										type = "variable",
										key = "a_xmult",
										vars = { card.ability.extra.x_mult },
									}),
								}
							)
							return nil, true
						end
					end
				end
			end
		end
		if
			context.cardarea == G.jokers
			and (to_big(card.ability.extra.x_mult) > to_big(1))
			and not context.before
			and not context.after
		then
			return {
				message = localize({ type = "variable", key = "a_xmult", vars = { card.ability.extra.x_mult } }),
				Xmult_mod = card.ability.extra.x_mult,
			}
		end
	end,
}
local lucky_joker = {
	object_type = "Joker",
	name = "cry-Lucky Joker",
	key = "lucky_joker",
	config = { extra = { dollars = 5 } },
	pos = { x = 4, y = 3 },
	rarity = 1,
	cost = 4,
	blueprint_compat = true,
	atlas = "atlasone",
	enhancement_gate = "m_lucky",
	loc_vars = function(self, info_queue, center)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_lucky
		return { vars = { center.ability.extra.dollars } }
	end,
	calculate = function(self, card, context)
		if context.individual and context.other_card.lucky_trigger then
			G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.dollars
			G.E_MANAGER:add_event(Event({ func = function()
				G.GAME.dollar_buffer = 0
				return true
			end }))
			return {
				dollars = card.ability.extra.dollars,
				card = card,
			}
		end
	end,
}
local cursor = {
	object_type = "Joker",
	name = "cry-Cursor",
	key = "cursor",
	config = { extra = { chips = 0, chip_mod = 8 } },
	pos = { x = 4, y = 1 },
	rarity = 1,
	cost = 5,
	blueprint_compat = true,
	perishable_compat = false,
	atlas = "atlasone",
	loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.chips, center.ability.extra.chip_mod } }
	end,
	calculate = function(self, card, context)
		if context.buying_card and not context.blueprint and not (context.card == card) then
			card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod
			card_eval_status_text(
				card,
				"extra",
				nil,
				nil,
				nil,
				{
					message = localize({ type = "variable", key = "a_chips", vars = { card.ability.extra.chips } }),
					colour = G.C.CHIPS,
				}
			)
			return nil, true
		end
		if
			context.cardarea == G.jokers
			and (to_big(card.ability.extra.chips) > to_big(0))
			and not context.before
			and not context.after
		then
			return {
				message = localize({ type = "variable", key = "a_chips", vars = { card.ability.extra.chips } }),
				chip_mod = card.ability.extra.chips,
			}
		end
	end,
}
local pickle = {
	object_type = "Joker",
	name = "cry-Pickle",
	key = "pickle",
	config = { extra = { tags = 3, tags_mod = 1 } },
	pos = { x = 3, y = 3 },
	immune_to_chemach = true,
	rarity = 2,
	cost = 6,
	blueprint_compat = true,
	eternal_compat = false,
	atlas = "atlasone",
	loc_vars = function(self, info_queue, center)
		return { vars = { math.min(20, center.ability.extra.tags), center.ability.extra.tags_mod } }
	end,
	calculate = function(self, card, context)
		if context.skip_blind then
			for i = 1, math.min(20, card.ability.extra.tags) do
				local tag = Tag(get_next_tag_key("cry_pickle"))
				if tag.name == "Orbital Tag" then
					local _poker_hands = {}
					for k, v in pairs(G.GAME.hands) do
						if v.visible then
							_poker_hands[#_poker_hands + 1] = k
						end
					end
					tag.ability.orbital_hand = pseudorandom_element(_poker_hands, pseudoseed("cry_pickle_orbital"))
				end
				if tag.name == "Boss Tag" then
					i = i - 1 --skip these, as they can cause bugs with pack opening from other tags
				else
					add_tag(tag)
				end
			end
			card_eval_status_text(
				card,
				"extra",
				nil,
				nil,
				nil,
				{
					message = "+"..localize({ type = "variable", key = "a_tag" .. (card.ability.extra.tags > 1 and "s" or ""), vars = { card.ability.extra.tags } })[1],
					colour = G.C.FILTER,
				}
			)
			return nil, true
		end
		if context.setting_blind and not context.blueprint then
			card.ability.extra.tags = card.ability.extra.tags - card.ability.extra.tags_mod
			if to_big(card.ability.extra.tags) > to_big(0) then
				card_eval_status_text(
					card,
					"extra",
					nil,
					nil,
					nil,
					{
						message = "-"..localize({ type = "variable", key = "a_tag" .. (card.ability.extra.tags > 1 and "s" or ""), vars = { card.ability.extra.tags } })[1],
						colour = G.C.FILTER,
					}
				)
				return nil, true
			else
				G.E_MANAGER:add_event(Event({
					func = function()
						play_sound("tarot1")
						card.T.r = -0.2
						card:juice_up(0.3, 0.4)
						card.states.drag.is = true
						card.children.center.pinch.x = true
						G.E_MANAGER:add_event(Event({
							trigger = "after",
							delay = 0.3,
							blockable = false,
							func = function()
								G.jokers:remove_card(card)
								card:remove()
								card = nil
								return true
							end,
						}))
						return true
					end,
				}))
				return {
					message = localize("k_eaten_ex"),
					colour = G.C.FILTER,
				}
			end
		end
	end,
}
local cube = {
	object_type = "Joker",
	name = "cry-Cube",
	key = "cube",
	config = { extra = { chips = 6 } },
	pos = { x = 5, y = 4 },
	rarity = 1,
	cost = -27,
	blueprint_compat = true,
	atlas = "atlasone",
	source_gate = "sho",
	loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.chips } }
	end,
	calculate = function(self, card, context)
		if context.cardarea == G.jokers and not context.before and not context.after then
			return {
				message = localize({ type = "variable", key = "a_chips", vars = { card.ability.extra.chips } }),
				chip_mod = card.ability.extra.chips,
			}
		end
	end,
}
local triplet_rhythm = {
	object_type = "Joker",
	name = "cry-Triplet Rhythm",
	key = "triplet_rhythm",
	config = { extra = { Xmult = 3 } },
	pos = { x = 0, y = 4 },
	rarity = 1,
	cost = 6,
	blueprint_compat = true,
	atlas = "atlastwo",
	loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.Xmult } }
	end,
	calculate = function(self, card, context)
		if context.cardarea == G.jokers and not context.before and not context.after and context.scoring_hand then
			local threes = 0
			for i = 1, #context.scoring_hand do
				if SMODS.Ranks[context.scoring_hand[i].base.value].key == "3" then
					threes = threes + 1
				end
			end
			if threes == 3 then
				return {
					message = localize({ type = "variable", key = "a_xmult", vars = { card.ability.extra.Xmult } }),
					Xmult_mod = card.ability.extra.Xmult,
				}
			end
		end
	end,
}
local booster = {
	object_type = "Joker",
	name = "cry-Booster Joker",
	key = "booster",
	config = { extra = { booster_slots = 1 } },
	pos = { x = 2, y = 0 },
	immune_to_chemach = true,
	rarity = 2,
	cost = 6,
	blueprint_compat = false,
	atlas = "atlastwo",
	loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.booster_slots } }
	end,
	add_to_deck = function(self, card, from_debuff)
		if not G.GAME.modifiers.cry_booster_packs then
			G.GAME.modifiers.cry_booster_packs = 2
		end
		G.GAME.modifiers.cry_booster_packs = G.GAME.modifiers.cry_booster_packs + card.ability.extra.booster_slots
	end,
	remove_from_deck = function(self, card, from_debuff)
		if not G.GAME.modifiers.cry_booster_packs then
			G.GAME.modifiers.cry_booster_packs = 2
		end
		G.GAME.modifiers.cry_booster_packs = G.GAME.modifiers.cry_booster_packs - card.ability.extra.booster_slots
	end,
}
local chili_pepper = {
	object_type = "Joker",
	name = "cry-Chili Pepper",
	key = "chili_pepper",
	config = { extra = { Xmult = 1, Xmult_mod = 0.5, rounds_remaining = 8 } },
	pos = { x = 0, y = 1 },
	rarity = 2,
	cost = 6,
	blueprint_compat = true,
	eternal_compat = false,
	perishable_compat = false,
	atlas = "atlastwo",
	loc_vars = function(self, info_queue, center)
		return {
			vars = { center.ability.extra.Xmult, center.ability.extra.Xmult_mod, center.ability.extra.rounds_remaining },
		}
	end,
	calculate = function(self, card, context)
		if
			context.cardarea == G.jokers
			and not context.before
			and not context.after
			and to_big(card.ability.extra.Xmult) > to_big(1)
		then
			return {
				message = localize({ type = "variable", key = "a_xmult", vars = { card.ability.extra.Xmult } }),
				Xmult_mod = card.ability.extra.Xmult,
			}
		end
		if
			context.end_of_round
			and not context.blueprint
			and not context.individual
			and not context.repetition
			and not context.retrigger_joker
		then
			card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_mod
			card.ability.extra.rounds_remaining = card.ability.extra.rounds_remaining - 1
			if card.ability.extra.rounds_remaining > 0 then
				return {
					message = localize({ type = "variable", key = "a_xmult", vars = { card.ability.extra.Xmult } }),
					colour = G.C.FILTER,
				}
			else
				G.E_MANAGER:add_event(Event({
					func = function()
						play_sound("tarot1")
						card.T.r = -0.2
						card:juice_up(0.3, 0.4)
						card.states.drag.is = true
						card.children.center.pinch.x = true
						G.E_MANAGER:add_event(Event({
							trigger = "after",
							delay = 0.3,
							blockable = false,
							func = function()
								G.jokers:remove_card(card)
								card:remove()
								card = nil
								return true
							end,
						}))
						return true
					end,
				}))
				return {
					message = localize("k_eaten_ex"),
					colour = G.C.FILTER,
				}
			end
		end
	end,
}
local compound_interest = {
	object_type = "Joker",
	name = "cry-Compound Interest",
	key = "compound_interest",
	config = { extra = { percent_mod = 3, percent = 12 } },
	pos = { x = 3, y = 2 },
	rarity = 3,
	cost = 10,
	perishable_compat = false,
	atlas = "atlastwo",
	loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.percent, center.ability.extra.percent_mod } }
	end,
	calc_dollar_bonus = function(self, card)
		local bonus = math.max(0, math.floor(0.01 * card.ability.extra.percent * (G.GAME.dollars or 1)))
		local old = card.ability.extra.percent
		card.ability.extra.percent = card.ability.extra.percent + card.ability.extra.percent_mod
		compound_interest_scale_mod(card, card.ability.extra.percent_mod, old, card.ability.extra.percent)
		if bonus > 0 then
			return bonus
		end
	end,
}
local big_cube = {
	object_type = "Joker",
	name = "cry-Big Cube",
	key = "big_cube",
	joker_gate = "cry-Cube",
	config = { extra = { x_chips = 6 } },
	pos = { x = 4, y = 4 },
	rarity = 1,
	cost = 27,
	blueprint_compat = true,
	atlas = "atlasone",
	loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.x_chips } }
	end,
	calculate = function(self, card, context)
		if context.cardarea == G.jokers and not context.before and not context.after then
			return {
				message = localize({ type = "variable", key = "a_xchips", vars = { card.ability.extra.x_chips } }),
				Xchip_mod = card.ability.extra.x_chips,
				colour = G.C.CHIPS,
			}
		end
	end,
}
local eternalflame = {
	object_type = "Joker",
	name = "cry-eternalflame",
	key = "eternalflame",
	pos = { x = 0, y = 4 },
	config = { extra = { extra = 0.1, x_mult = 1 } },
	rarity = 3,
	cost = 9,
	perishable_compat = false,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.extra, center.ability.extra.x_mult } }
	end,
	atlas = "atlasone",
	calculate = function(self, card, context)
		if
			context.cardarea == G.jokers
			and (to_big(card.ability.extra.x_mult) > to_big(1))
			and not context.before
			and not context.after
		then
			return {
				message = localize({ type = "variable", key = "a_xmult", vars = { card.ability.extra.x_mult } }),
				Xmult_mod = card.ability.extra.x_mult,
			}
		end
		if context.selling_card and not context.blueprint then
			card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.extra
			card_eval_status_text(
				card,
				"extra",
				nil,
				nil,
				nil,
				{ message = localize({ type = "variable", key = "a_xmult", vars = { card.ability.extra.x_mult } }) }
			)
			return nil, true
		end
	end,
}
local nice = {
	object_type = "Joker",
	name = "cry-Nice",
	key = "nice",
	config = { extra = { chips = 420, sixcount = 0, ninecount = 0 } },
	pos = { x = 2, y = 3 },
	rarity = 3,
	cost = 6.9,
	atlas = "atlasone",
	blueprint_compat = true,
	loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.chips } }
	end,
	calculate = function(self, card, context)
		if context.cardarea == G.jokers and context.before and not context.after then
			card.ability.extra.sixcount = 0
			card.ability.extra.ninecount = 0
			for i, v in pairs(context.full_hand) do
				if v:get_id() == 6 then
					card.ability.extra.sixcount = card.ability.extra.sixcount + 1
				elseif v:get_id() == 9 then
					card.ability.extra.ninecount = card.ability.extra.ninecount + 1
				end
			end
		elseif context.cardarea == G.jokers and not context.before and not context.after then
			if card.ability.extra.sixcount > 0 and card.ability.extra.ninecount > 0 then
				return {
					message = localize({ type = "variable", key = "a_chips", vars = { card.ability.extra.chips or 0 } }),
					chip_mod = card.ability.extra.chips or 0,
				}
			end
		end
	end,
}
local seal_the_deal = {
	object_type = "Joker",
	name = "cry-Seal The Deal",
	key = "seal_the_deal",
	config = { extra = { x_chips = 6 } },
	pos = { x = 2, y = 4 },
	rarity = 2,
	cost = 5,
	atlas = "atlasone",
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if G.GAME.current_round.hands_left == 0 then
				G.E_MANAGER:add_event(Event({
					func = function()
						local seal_type = pseudorandom(pseudoseed("seal_the_deal"))
						if seal_type > 0.75 then
							context.other_card:set_seal("Red", true)
						elseif seal_type > 0.5 then
							context.other_card:set_seal("Blue", true)
						elseif seal_type > 0.25 then
							context.other_card:set_seal("Gold", true)
						else
							context.other_card:set_seal("Purple", true)
						end
						card:juice_up(0.3, 0.4)
						context.other_card:juice_up(0.3, 0.3)
						play_sound("gold_seal", 1.2, 0.4)
						return true
					end,
				}))
				delay(0.5)
				return nil, true
			end
		end
	end,
}
local chad = {
	object_type = "Joker",
	name = "cry-Chad",
	key = "chad",
	pos = { x = 0, y = 3 },
	config = { extra = { retriggers = 2 } },
	immune_to_chemach = true,
	rarity = 3,
	cost = 10,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.retriggers } }
	end,
	atlas = "atlasone",
	calculate = function(self, card, context)
		if context.retrigger_joker_check and not context.retrigger_joker and context.other_card ~= self then
			if context.other_card == G.jokers.cards[1] then
				return {
					message = localize("k_again_ex"),
					repetitions = card.ability.extra.retriggers,
					card = card,
				}
			else
				return nil, true
			end
		end
	end,
}
local jimball = {
	object_type = "Joker",
	name = "cry-Jimball",
	key = "jimball",
	pos = { x = 0, y = 0 },
	config = { x_mult = 1, extra = 0.15, override_x_mult_check = true },
	loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra, center.ability.x_mult } }
	end,
	rarity = 3,
	cost = 9,
	blueprint_compat = true,
	perishable_compat = false,
	calculate = function(self, card, context)
		if context.before and not context.blueprint then
			local reset = false
			local play_more_than = (G.GAME.hands[context.scoring_name].played or 0)
			for k, v in pairs(G.GAME.hands) do
				if k ~= context.scoring_name and v.played >= play_more_than and v.visible then
					reset = true
				end
			end
			if reset then
				if to_big(card.ability.x_mult) > to_big(1) then
					card.ability.x_mult = 1
					return {
						card = self,
						message = localize("k_reset"),
					}
				end
			else
				card.ability.x_mult = card.ability.x_mult + card.ability.extra
				return nil, true
			end
		end
	end,
	atlas = "jimball",
}
local jimball_sprite = { --left this one on it's own atlas for obvious reasons
	object_type = "Atlas",
	key = "jimball",
	path = "j_cry_jimball.png",
	px = 71,
	py = 95,
}
local sus = {
	object_type = "Joker",
	name = "cry-SUS",
	key = "sus",
	pos = { x = 1, y = 3 },
	rarity = 3,
	cost = 7,
	blueprint_compat = true,
	atlas = "atlasone",
	calculate = function(self, card, context)
		local function is_impostor(card)
			return SMODS.Ranks[card.base.value].key == "King" and card:is_suit("Hearts")
		end
		if context.end_of_round and not context.cardarea then
			if not card.ability.used_round or card.ability.used_round ~= G.GAME.round then
				card.ability.chosen_card = nil
			end
			local choosable_cards = {}
			local has_impostor = false
			for i = 1, #G.hand.cards do
				if not G.hand.cards[i].murdered_by_impostor then
					choosable_cards[#choosable_cards + 1] = G.hand.cards[i]
					if is_impostor(G.hand.cards[i]) then
						has_impostor = true
					end
				end
			end
			if has_impostor then
				choosable_cards = {}
				for i = 1, #G.hand.cards do
					if not G.hand.cards[i].murdered_by_impostor and is_impostor(G.hand.cards[i]) then
						choosable_cards[#choosable_cards + 1] = G.hand.cards[i]
					end
				end
			end
			card.ability.chosen_card = card.ability.chosen_card
				or pseudorandom_element(choosable_cards, pseudoseed("cry_sus"))
			if not card.ability.used_round or card.ability.used_round ~= G.GAME.round then
				card.ability.used_round = G.GAME.round
				local deletable_cards = {}
				for k, v in pairs(G.hand.cards) do
					if not v.ability.eternal and not is_impostor(v) then
						deletable_cards[#deletable_cards + 1] = v
					end
				end
				if #deletable_cards ~= 0 then
					local _first_dissolve = nil
					for j=1, #G.jokers.cards do
						eval_card(G.jokers.cards[j], {cardarea = G.jokers, remove_playing_cards = true, removed = deletable_cards})
					end
					G.E_MANAGER:add_event(Event({
						trigger = "before",
						delay = 0.75,
						func = function()
							for k, v in pairs(deletable_cards) do
								if v ~= card.ability.chosen_card then
									v.murdered_by_impostor = true
									v:start_dissolve(nil, _first_dissolve)
									_first_dissolve = true
								end
							end
							return true
						end,
					}))
					
				end
			end
			if card.ability.chosen_card ~= nil then
				G.E_MANAGER:add_event(Event({
					trigger = "before",
					delay = 0.4,
					func = function()
						card:juice_up(0.3, 0.4)
						G.playing_card = (G.playing_card and G.playing_card + 1) or 1
						local _c = copy_card(card.ability.chosen_card, nil, nil, G.playing_card)
						_c:start_materialize()
						_c:add_to_deck()
						G.deck.config.card_limit = G.deck.config.card_limit + 1
						table.insert(G.playing_cards, _c)
						G.hand:emplace(_c)
						playing_card_joker_effects({ _c })
						return true
					end,
				}))
				return { message = localize("cry_sus_ex") }
			end
		end
	end,
}
local fspinner = {
	object_type = "Joker",
	name = "cry-fspinner",
	key = "fspinner",
	pos = { x = 4, y = 0 },
	config = { extra = { chips = 0, chip_mod = 6 } },
	loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.chips, center.ability.extra.chip_mod } }
	end,
	rarity = 1,
	cost = 6,
	blueprint_compat = true,
	perishable_compat = false,
	atlas = "fspinner",
	calculate = function(self, card, context)
		if context.before and not context.blueprint then
			local play_more_than = (G.GAME.hands[context.scoring_name].played or 0)
			for k, v in pairs(G.GAME.hands) do
				if k ~= context.scoring_name and v.played >= play_more_than and v.visible then
					card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod
					return {
						message = localize("k_upgrade_ex"),
						card = card,
					}
				end
			end
		end
		if
			context.cardarea == G.jokers
			and (to_big(card.ability.extra.chips) > to_big(0))
			and not context.before
			and not context.after
		then
			return {
				message = localize({ type = "variable", key = "a_chips", vars = { card.ability.extra.chips } }),
				chip_mod = card.ability.extra.chips,
			}
		end
	end,
	atlas = "atlasone",
}
local luigi = {
	object_type = "Joker",
	name = "cry-luigi",
	key = "luigi",
	pos = { x = 0, y = 3 },
	soul_pos = { x = 1, y = 3 },
	config = { extra = { x_chips = 3 } },
	loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.x_chips } }
	end,
	rarity = 4,
	cost = 20,
	blueprint_compat = true,
	calculate = function(self, card, context)
		if context.other_joker and context.other_joker.ability.set == "Joker" then
			if not Talisman.config_file.disable_anims then
				G.E_MANAGER:add_event(Event({
					func = function()
						context.other_joker:juice_up(0.5, 0.5)
						return true
					end,
				}))
			end
			return {
				message = localize({ type = "variable", key = "a_xchips", vars = { card.ability.extra.x_chips } }),
				colour = G.C.CHIPS,
				Xchip_mod = card.ability.extra.x_chips,
			}
		end
	end,
	atlas = "atlasthree",
}
local waluigi = {
	object_type = "Joker",
	name = "cry-Waluigi",
	key = "waluigi",
	pos = { x = 0, y = 3 },
	soul_pos = { x = 1, y = 3 },
	config = { extra = { Xmult = 2.5 } },
	loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.Xmult } }
	end,
	rarity = 4,
	cost = 20,
	blueprint_compat = true,
	calculate = function(self, card, context)
		if context.other_joker and context.other_joker.ability.set == "Joker" then
			if not Talisman.config_file.disable_anims then
				G.E_MANAGER:add_event(Event({
					func = function()
						context.other_joker:juice_up(0.5, 0.5)
						return true
					end,
				}))
			end
			return {
				message = localize({ type = "variable", key = "a_xmult", vars = { card.ability.extra.Xmult } }),
				Xmult_mod = card.ability.extra.Xmult,
			}
		end
	end,
	atlas = "atlastwo",
}
local mario = {
	object_type = "Joker",
	name = "cry-mario",
	key = "mario",
	config = { extra = { retriggers = 2 } },
	pos = { x = 4, y = 3 },
	soul_pos = { x = 5, y = 3 },
	rarity = 4,
	cost = 20,
	blueprint_compat = true,
	immune_to_chemach = true,
	loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.retriggers } }
	end,
	atlas = "atlasthree",
	calculate = function(self, card, context)
		if context.retrigger_joker_check and not context.retrigger_joker and context.other_card ~= self then
			return {
				message = localize("k_again_ex"),
				repetitions = card.ability.extra.retriggers,
				card = card,
			}
		end
	end,
}
local wario = {
	object_type = "Joker",
	name = "cry-wario",
	key = "wario",
	pos = { x = 2, y = 3 },
	soul_pos = { x = 3, y = 3 },
	config = { extra = { money = 3 } },
	loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.money } }
	end,
	calculate = function(self, card, context)
		if context.post_trigger then
			ease_dollars(card.ability.extra.money)
			G.E_MANAGER:add_event(Event({
				func = function()
					(context.blueprint_card or card):juice_up(0.5, 0.5)
					return true
				end,
			}))
			card_eval_status_text(
				context.other_context.blueprint_card or context.other_joker,
				"extra",
				nil,
				nil,
				nil,
				{ message = localize("$") .. card.ability.extra.money, colour = G.C.MONEY }
			)
			return nil, true
		end
	end,

	rarity = 4,
	cost = 20,
	blueprint_compat = true,
	atlas = "atlasthree",
}
local krustytheclown = {
	object_type = "Joker",
	name = "cry-krustytheclown",
	key = "krustytheclown",
	pos = { x = 3, y = 4 },
	config = { extra = { extra = 0.02, x_mult = 1 } },
	rarity = 2,
	cost = 7,
	perishable_compat = false,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.extra, center.ability.extra.x_mult } }
	end,
	atlas = "atlasone",
	calculate = function(self, card, context)
		if
			context.cardarea == G.jokers
			and (to_big(card.ability.extra.x_mult) > to_big(1))
			and not context.before
			and not context.after
		then
			return {
				message = localize({ type = "variable", key = "a_xmult", vars = { card.ability.extra.x_mult } }),
				Xmult_mod = card.ability.extra.x_mult,
			}
		end
		if context.cardarea == G.play and context.individual and not context.blueprint then
			card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.extra
			return {
				extra = { focus = card, message = localize("k_upgrade_ex") },
				card = card,
				colour = G.C.MULT,
			}
		end
	end,
}
local blurred = {
	object_type = "Joker",
	name = "cry-blurred Joker",
	key = "blurred",
	pos = { x = 4, y = 4 },
	config = { extra = { hands = 1 } },
	rarity = 1,
	cost = 4,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.hands } }
	end,
	atlas = "atlastwo",
	calculate = function(self, card, context)
		if context.setting_blind and not (context.blueprint_card or card).getting_sliced then
			return {
				message = localize("k_hand"), --make this actually work in the future
				ease_hands_played(card.ability.extra.hands),
				delay(0.6),
			}
		end
	end,
}
local gardenfork = {
	object_type = "Joker",
	name = "cry-gardenfork",
	key = "gardenfork",
	pos = { x = 0, y = 1 },
	config = { extra = { money = 7 } },
	rarity = 3,
	cost = 7,
	blueprint_compat = true,
	atlas = "atlasone",
	loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.money } }
	end,
	calculate = function(self, card, context)
		if context.cardarea == G.jokers and context.before and not context.blueprint then
			for i = 1, #context.full_hand do
				if SMODS.Ranks[context.full_hand[i].base.value].key == "Ace" then
					for j = 1, #context.full_hand do
						if SMODS.Ranks[context.full_hand[j].base.value].key == "7" then
							ease_dollars(card.ability.extra.money)
							return { message = "$" .. card.ability.extra.money, colour = G.C.MONEY }
						end
					end
				end
			end
		end
	end,
}
local lightupthenight = {
	object_type = "Joker",
	name = "cry-lightupthenight",
	key = "lightupthenight",
	config = { extra = { xmult = 1.5 } },
	pos = { x = 1, y = 1 },
	atlas = "atlasone",
	rarity = 3,
	cost = 7,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.xmult } }
	end,
	calculate = function(self, card, context)
		if context.cardarea == G.play and context.individual then
			local rank = SMODS.Ranks[context.other_card.base.value].key
			if rank == "2" or rank == "7" then
				return {
					x_mult = card.ability.extra.xmult,
					colour = G.C.RED,
					card = card,
				}
			end
		end
	end,
}
local nosound = {
	object_type = "Joker",
	name = "cry-nosound",
	key = "nosound",
	config = { extra = { retriggers = 3 } },
	pos = { x = 2, y = 1 },
	atlas = "atlasone",
	rarity = 3,
	cost = 7,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.retriggers } }
	end,
	calculate = function(self, card, context)
		if context.repetition then
			if context.cardarea == G.play then
				local rank = SMODS.Ranks[context.other_card.base.value].key
				if rank == "7" then
					return {
						message = localize("k_again_ex"),
						repetitions = card.ability.extra.retriggers,
						card = card,
					}
				end
			end
		end
	end,
}
local antennastoheaven = {
	object_type = "Joker",
	name = "cry-antennastoheaven",
	key = "antennastoheaven",
	pos = { x = 3, y = 1 },
	config = { extra = { bonus = 0.1, x_chips = 1 } },
	rarity = 3,
	cost = 7,
	perishable_compat = false,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.bonus, center.ability.extra.x_chips } }
	end,
	atlas = "atlasone",
	calculate = function(self, card, context)
		if
			context.cardarea == G.jokers
			and (to_big(card.ability.extra.x_chips) > to_big(1))
			and not context.before
			and not context.after
		then
			return {
				message = localize({ type = "variable", key = "a_xchips", vars = { number_format(card.ability.extra.x_chips) } }),
				Xchip_mod = card.ability.extra.x_chips,
				colour = G.C.CHIPS,
			}
		end
		if context.cardarea == G.play and context.individual and not context.blueprint then
			local rank = SMODS.Ranks[context.other_card.base.value].key
			if rank == "4" or rank == "7" then
				card.ability.extra.x_chips = card.ability.extra.x_chips + card.ability.extra.bonus
				return {
					extra = { focus = card, message = localize("k_upgrade_ex") },
					card = card,
					colour = G.C.CHIPS,
				}
			end
		end
	end,
}
local hunger = {
	object_type = "Joker",
	name = "cry-hunger",
	key = "hunger",
	config = { extra = { money = 3 } },
	pos = { x = 3, y = 0 },
	rarity = 2,
	cost = 6,
	blueprint_compat = true,
	atlas = "atlastwo",
	loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.money } }
	end,
	calculate = function(self, card, context) --This didn't work for Jevonn for some reason but it works for me :joker:
		if context.using_consumeable then --shush
			return {
				ease_dollars(card.ability.extra.money),
				message = "$" .. card.ability.extra.money,
				colour = G.C.MONEY, --this isn't displaying a message for some reason ugh
				card = card,
			}
		end
	end,
}
local weegaming = {
	object_type = "Joker",
	name = "cry-weegaming",
	key = "weegaming",
	config = { extra = { retriggers = 2 } },
	pos = { x = 3, y = 4 },
	atlas = "atlastwo",
	rarity = 1,
	cost = 5,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.retriggers } }
	end,
	calculate = function(self, card, context)
		if context.repetition then
			if context.cardarea == G.play then
				local rank = SMODS.Ranks[context.other_card.base.value].key
				if rank == "2" then
					return {
						message = localize("k_again_ex"),
						repetitions = card.ability.extra.retriggers,
						card = card,
					}
				end
			end
		end
	end,
}
local redbloon = {
	object_type = "Joker",
	name = "cry-redbloon",
	key = "redbloon",
	config = { extra = { money = 20, rounds_remaining = 2, text = "s" } },
	pos = { x = 5, y = 1 },
	immune_to_chemach = true,
	rarity = 1,
	cost = 4,
	blueprint_compat = false,
	eternal_compat = false,
	perishable_compat = false,
	atlas = "atlasone",
	loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.money, center.ability.extra.rounds_remaining, center.ability.extra.text } }
	end,
	calculate = function(self, card, context)
		if
			context.end_of_round
			and not context.blueprint
			and not context.individual
			and not context.repetition
			and not context.retrigger_joker
		then
			card.ability.extra.rounds_remaining = card.ability.extra.rounds_remaining - 1
			if card.ability.extra.rounds_remaining > 0 then
				return {
					message = { localize("cry_minus_round") },
					colour = G.C.FILTER,
				}
			else
				ease_dollars(card.ability.extra.money)
				G.E_MANAGER:add_event(Event({
					func = function()
						play_sound("tarot1")
						card.T.r = -0.2
						card:juice_up(0.3, 0.4)
						card.states.drag.is = true
						card.children.center.pinch.x = true
						G.E_MANAGER:add_event(Event({
							trigger = "after",
							delay = 0.3,
							blockable = false,
							func = function()
								G.jokers:remove_card(card)
								card:remove()
								card = nil
								return true
							end,
						}))
						return true
					end,
				}))
				return {
					message = "$" .. card.ability.extra.money,
					colour = G.C.MONEY,
				}
			end
		end
		if card.ability.extra.rounds_remaining == 1 then
			card.ability.extra.text = ""
		end
	end,
}
local apjoker = {
	object_type = "Joker",
	name = "cry-AP Joker",
	key = "apjoker",
	pos = { x = 2, y = 0 },
	config = { extra = { x_mult = 4 } },
	rarity = 2,
	cost = 6,
	blueprint_compat = true,
	perishable_compat = false,
	atlas = "atlasone",
	loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.x_mult } }
	end,
	calculate = function(self, card, context)
		if context.cardarea == G.jokers and G.GAME.blind.boss and not context.before and not context.after then
			return {
				message = localize({ type = "variable", key = "a_xmult", vars = { card.ability.extra.x_mult } }),
				Xmult_mod = card.ability.extra.x_mult,
			}
		end
	end,
}
local maze = {
	object_type = "Joker",
	name = "cry-maze",
	key = "maze",
	pos = { x = 1, y = 1 },
	rarity = 1,
	cost = 1,
	atlas = "atlastwo",
	calculate = function(self, card, context)
		if context.after and not context.blueprint and not context.retrigger_joker then
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.3,
				blockable = false,
				func = function()
					G.GAME.current_round.hands_played = 0
					G.GAME.current_round.discards_used = 0
					return true
				end,
			}))
			return true
		end
		if context.discard and not context.blueprint and not context.retrigger_joker then
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.3,
				blockable = false,
				func = function()
					G.GAME.current_round.hands_played = 0
					G.GAME.current_round.discards_used = 0
					return true
				end,
			}))
			return true
		end
	end,
	add_to_deck = function(self, card, from_debuff)
		G.GAME.current_round.hands_played = 0
		G.GAME.current_round.discards_used = 0
	end,
}
--Fixed Jank for the most part. Other modded jokers may still be jank depending on how they are implemented
--funny side effect of this fix causes trading card and dna to juice up like craaazy lol
local panopticon = {
	object_type = "Joker",
	name = "cry-panopticon",
	key = "panopticon",
	pos = { x = 1, y = 4 },
	config = {
		extra = {},
	},
	rarity = 1,
	cost = 1,
	atlas = "atlastwo",
	calculate = function(self, card, context)
		if context.before and not context.blueprint and not context.retrigger_joker then
			if not G.GAME.cry_panop_juggle then
				G.GAME.cry_panop_juggle = G.GAME.current_round.hands_left
			end
			G.GAME.current_round.hands_left = 0
		end
		if context.after and not context.blueprint and not context.retrigger_joker then
			if G.GAME.cry_panop_juggle then
				G.GAME.current_round.hands_left = G.GAME.cry_panop_juggle
				G.GAME.cry_panop_juggle = nil
			end
		end
	end,
}
local magnet = {
	object_type = "Joker",
	name = "cry-magnet",
	key = "magnet",
	pos = { x = 4, y = 0 },
	config = { extra = { money = 2, Xmoney = 5, slots = 4 } },
	rarity = 1,
	cost = 6,
	blueprint_compat = false,
	loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.money, center.ability.extra.Xmoney, center.ability.extra.slots } }
	end,
	atlas = "atlastwo",
	calc_dollar_bonus = function(self, card)
		if #G.jokers.cards <= card.ability.extra.slots then
			return card.ability.extra.money * card.ability.extra.Xmoney
		else
			return card.ability.extra.money
		end
	end,
}
local unjust_dagger = {
	object_type = "Joker",
	name = "cry-Unjust Dagger",
	key = "unjust_dagger",
	pos = { x = 3, y = 0 },
	config = { extra = { x_mult = 1 } },
	rarity = 2,
	cost = 8,
	perishable_compat = false,
	loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.x_mult } }
	end,
	atlas = "atlasone",
	blueprint_compat = true,
	calculate = function(self, card, context)
		if
			context.cardarea == G.jokers
			and (card.ability.extra.x_mult > 1)
			and not context.before
			and not context.after
		then
			return {
				message = localize({ type = "variable", key = "a_xmult", vars = { card.ability.extra.x_mult } }),
				Xmult_mod = card.ability.extra.x_mult,
			}
		end
		local my_pos = nil
		for i = 1, #G.jokers.cards do
			if G.jokers.cards[i] == card then
				my_pos = i
				break
			end
		end
		if
			context.setting_blind
			and not (context.blueprint_card or self).getting_sliced
			and my_pos
			and G.jokers.cards[my_pos - 1]
			and not G.jokers.cards[my_pos - 1].ability.eternal
			and not G.jokers.cards[my_pos - 1].getting_sliced
		then
			local sliced_card = G.jokers.cards[my_pos - 1]
			sliced_card.getting_sliced = true
			if sliced_card.config.center.rarity == "cry_exotic" then
				check_for_unlock({ type = "what_have_you_done" })
			end
			G.GAME.joker_buffer = G.GAME.joker_buffer - 1
			G.E_MANAGER:add_event(Event({
				func = function()
					G.GAME.joker_buffer = 0
					card.ability.extra.x_mult = card.ability.extra.x_mult + sliced_card.sell_cost * 0.2
					card:juice_up(0.8, 0.8)
					sliced_card:start_dissolve({ HEX("57ecab") }, nil, 1.6)
					play_sound("slice1", 0.96 + math.random() * 0.08)
					return true
				end,
			}))
			card_eval_status_text(
				card,
				"extra",
				nil,
				nil,
				nil,
				{
					message = localize({
						type = "variable",
						key = "a_xmult",
						vars = { card.ability.extra.x_mult + 0.2 * sliced_card.sell_cost },
					}),
					colour = G.C.RED,
					no_juice = true,
				}
			)
			return nil, true
		end
	end,
}
local monkey_dagger = {
	object_type = "Joker",
	name = "cry-Monkey Dagger",
	key = "monkey_dagger",
	pos = { x = 4, y = 3 },
	config = { extra = { chips = 0 } },
	rarity = 2,
	cost = 6,
	perishable_compat = false,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.chips } }
	end,
	atlas = "atlastwo",
	calculate = function(self, card, context)
		if
			context.cardarea == G.jokers
			and (to_big(card.ability.extra.chips) > to_big(0))
			and not context.before
			and not context.after
		then
			return {
				message = localize({ type = "variable", key = "a_chips", vars = { card.ability.extra.chips } }),
				chip_mod = card.ability.extra.chips,
			}
		end
		local my_pos = nil
		for i = 1, #G.jokers.cards do
			if G.jokers.cards[i] == card then
				my_pos = i
				break
			end
		end
		if
			context.setting_blind
			and not (context.blueprint_card or self).getting_sliced
			and my_pos
			and G.jokers.cards[my_pos - 1]
			and not G.jokers.cards[my_pos - 1].ability.eternal
			and not G.jokers.cards[my_pos - 1].getting_sliced
		then
			local sliced_card = G.jokers.cards[my_pos - 1]
			sliced_card.getting_sliced = true
			if sliced_card.config.center.rarity == "cry_exotic" then
				check_for_unlock({ type = "what_have_you_done" })
			end
			G.GAME.joker_buffer = G.GAME.joker_buffer - 1
			G.E_MANAGER:add_event(Event({
				func = function()
					G.GAME.joker_buffer = 0
					card.ability.extra.chips = card.ability.extra.chips + sliced_card.sell_cost * 10
					card:juice_up(0.8, 0.8)
					sliced_card:start_dissolve({ HEX("57ecab") }, nil, 1.6)
					play_sound("slice1", 0.96 + math.random() * 0.08)
					return true
				end,
			}))
			card_eval_status_text(
				card,
				"extra",
				nil,
				nil,
				nil,
				{
					message = localize({
						type = "variable",
						key = "a_chips",
						vars = { card.ability.extra.chips + 10 * sliced_card.sell_cost },
					}),
					colour = G.C.CHIPS,
					no_juice = true,
				}
			)
			return nil, true
		end
	end,
}
local pirate_dagger = {
	object_type = "Joker",
	name = "cry-Pirate Dagger",
	key = "pirate_dagger",
	pos = { x = 3, y = 3 },
	config = { extra = { x_chips = 1 } },
	rarity = 2,
	cost = 8,
	perishable_compat = false,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.x_chips } }
	end,
	atlas = "atlastwo",
	calculate = function(self, card, context)
		if
			context.cardarea == G.jokers
			and (card.ability.extra.x_chips > 1)
			and not context.before
			and not context.after
		then
			return {
				message = localize({ type = "variable", key = "a_xchips", vars = { card.ability.extra.x_chips } }),
				Xchip_mod = card.ability.extra.x_chips,
			}
		end
		local my_pos = nil
		for i = 1, #G.jokers.cards do
			if G.jokers.cards[i] == card then
				my_pos = i
				break
			end
		end
		if
			context.setting_blind
			and not (context.blueprint_card or self).getting_sliced
			and my_pos
			and G.jokers.cards[my_pos + 1]
			and not G.jokers.cards[my_pos + 1].ability.eternal
			and not G.jokers.cards[my_pos + 1].getting_sliced
		then
			local sliced_card = G.jokers.cards[my_pos + 1]
			sliced_card.getting_sliced = true
			if sliced_card.config.center.rarity == "cry_exotic" then
				check_for_unlock({ type = "what_have_you_done" })
			end
			G.GAME.joker_buffer = G.GAME.joker_buffer - 1
			G.E_MANAGER:add_event(Event({
				func = function()
					G.GAME.joker_buffer = 0
					card.ability.extra.x_chips = card.ability.extra.x_chips + sliced_card.sell_cost * 0.25
					card:juice_up(0.8, 0.8)
					sliced_card:start_dissolve({ HEX("57ecab") }, nil, 1.6)
					play_sound("slice1", 0.96 + math.random() * 0.08)
					return true
				end,
			}))
			card_eval_status_text(
				card,
				"extra",
				nil,
				nil,
				nil,
				{
					message = localize({
						type = "variable",
						key = "a_xchips",
						vars = { card.ability.extra.x_chips + 0.25 * sliced_card.sell_cost },
					}),
					colour = G.C.CHIPS,
					no_juice = true,
				}
			)
			return nil, true
		end
	end,
}
local mondrian = {
	object_type = "Joker",
	name = "cry-mondrian",
	key = "mondrian",
	pos = { x = 5, y = 3 },
	config = { extra = { extra = 0.25, x_mult = 1 } },
	rarity = 2,
	cost = 7,
	perishable_compat = false,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.extra, center.ability.extra.x_mult } }
	end,
	atlas = "atlastwo",
	calculate = function(self, card, context)
		if
			context.cardarea == G.jokers
			and (to_big(card.ability.extra.x_mult) > to_big(1))
			and not context.before
			and not context.after
		then
			return {
				message = localize({ type = "variable", key = "a_xmult", vars = { card.ability.extra.x_mult } }),
				Xmult_mod = card.ability.extra.x_mult,
			}
		end
		if
			context.end_of_round
			and G.GAME.current_round.discards_used == 0
			and not context.blueprint
			and not context.individual
			and not context.repetition
		then
			card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.extra
			return {
				message = localize("k_upgrade_ex"),
				card = card,
			}
		end
	end,
}
local sapling = {
	object_type = "Joker",
	name = "cry-sapling",
	key = "sapling",
	pos = { x = 3, y = 2 },
	config = { extra = { score = 0, req = 18, check = nil } },
	immune_to_chemach = true,
	rarity = 2,
	cost = 6,
	blueprint_compat = false,
	eternal_compat = false,
	loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.score, center.ability.extra.req } }
	end,
	atlas = "atlasone",
	calculate = function(self, card, context)
		if
			context.individual
			and context.cardarea == G.play
			and not context.blueprint
			and not context.retrigger_joker
		then
			if context.other_card.ability.effect ~= "Base" then
				card.ability.extra.score = card.ability.extra.score + 1
				if card.ability.extra.score >= card.ability.extra.req and not card.ability.extra.check then 
					card.ability.extra.check = true --Prevents violent juice up spam when playing enchanced cards while already active
                        		local eval = function(card) return not card.REMOVED end
                        		juice_card_until(card, eval, true)
                    		end
			end
		elseif
			context.selling_self
			and not context.blueprint
			and not context.retrigger_joker
		then
			if card.ability.extra.score >= card.ability.extra.req then
				card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.RARITY["cry_epic"]})
				local card = create_card("Joker", G.jokers, nil, 1, nil, nil, nil, "cry_sapling")
				card:add_to_deck()
				G.jokers:emplace(card)
				card:start_materialize()
				return nil, true
			else
				card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize("k_nope_ex"), colour = G.C.RARITY["cry_epic"]})
			end
		end
	end,
}
local spaceglobe = {
	object_type = "Joker",
	name = "cry-spaceglobe",
	key = "spaceglobe",
	pos = { x = 1, y = 4 },
	config = { extra = { x_chips = 1, Xchipmod = 0.2, type = "High Card" } },
	rarity = 3,
	cost = 8,
	blueprint_compat = true,
	perishable_compat = false,
	loc_vars = function(self, info_queue, center)
		return {
			vars = {
				center.ability.extra.x_chips,
				center.ability.extra.Xchipmod,
				localize(center.ability.extra.type, "poker_hands"),
			},
		}
	end,
	atlas = "atlasone",
	set_ability = function(self, card, initial, delay_sprites)
		local _poker_hands = {}
        	for k, v in pairs(G.GAME.hands) do
            		if v.visible then _poker_hands[#_poker_hands+1] = k end
	        end
		card.ability.extra.type = pseudorandom_element(_poker_hands, pseudoseed('cry_space_globe'))
	end,
	calculate = function(self, card, context)
		if context.cardarea == G.jokers and context.before and not context.blueprint then
			if context.scoring_name == card.ability.extra.type then
				G.E_MANAGER:add_event(Event({
					func = function()
						local _type = {}
						for k, v in pairs(G.GAME.hands) do
							if v.visible and k ~= card.ability.to_do_type then
								_type[#_type + 1] = k
							end
						end
						card.ability.extra.type = pseudorandom_element(_type, pseudoseed("cry_space_globe"))
						return true
					end,
				}))
				card.ability.extra.x_chips = card.ability.extra.x_chips + card.ability.extra.Xchipmod
				return {
					message = localize("k_upgrade_ex"),
					card = card,
					colour = G.C.CHIPS,
				}
			end
		end
		if
			context.cardarea == G.jokers
			and (to_big(card.ability.extra.x_chips) > to_big(1))
			and not context.before
			and not context.after
		then
			return {
				message = localize({ type = "variable", key = "a_xchips", vars = { number_format(card.ability.extra.x_chips) } }),
				Xchip_mod = card.ability.extra.x_chips,
				colour = G.C.CHIPS,
			}
		end
	end,
}
local happy = {
	object_type = "Joker",
	name = "cry-happy",
	key = "happy",
	pos = { x = 2, y = 1 },
	rarity = 1,
	cost = 2,
	blueprint_compat = true,
	eternal_compat = false,
	atlas = "atlastwo",
	calculate = function(self, card, context)
		if
			context.selling_self
			and #G.jokers.cards + G.GAME.joker_buffer <= G.jokers.config.card_limit
			and not context.retrigger_joker
		then
			local sellcreatejoker = 1
			G.GAME.joker_buffer = G.GAME.joker_buffer + sellcreatejoker
			G.E_MANAGER:add_event(Event({
				func = function()
					for i = 1, sellcreatejoker do
						local card = create_card("Joker", G.jokers, nil, nil, nil, nil, nil, "happy")
						card:add_to_deck()
						G.jokers:emplace(card)
						card:start_materialize()
						G.GAME.joker_buffer = 0
					end
					return true
				end,
			}))
			card_eval_status_text(
				context.blueprint_card or card,
				"extra",
				nil,
				nil,
				nil,
				{ message = localize("k_plus_joker"), colour = G.C.BLUE }
			)
			return nil, true
		end
		if
			context.end_of_round
			and not context.individual
			and not context.repetition
			and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit
			and not context.retrigger_joker
		then
			local roundcreatejoker = math.min(1, G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
			G.GAME.joker_buffer = G.GAME.joker_buffer + roundcreatejoker
			G.E_MANAGER:add_event(Event({
				func = function()
					if roundcreatejoker > 0 then
						local card = create_card("Joker", G.jokers, nil, nil, nil, nil, nil, "happy")
						card:add_to_deck()
						G.jokers:emplace(card)
						card:start_materialize()
						G.GAME.joker_buffer = 0
					end
					return true
				end,
			}))
			card_eval_status_text(
				context.blueprint_card or card,
				"extra",
				nil,
				nil,
				nil,
				{ message = localize("k_plus_joker"), colour = G.C.BLUE }
			)
			return nil, true
		end
	end,
}
local meteor = {
	object_type = "Joker",
	name = "cry-meteor",
	key = "meteor",
	pos = { x = 0, y = 2 },
	config = { extra = { chips = 75 } },
	loc_vars = function(self, info_queue, center)
		if not center.edition or (center.edition and not center.edition.foil) then
			info_queue[#info_queue + 1] = G.P_CENTERS.e_foil
		end
		return { vars = { center.ability.extra.chips } }
	end,
	rarity = 1,
	cost = 4,
	blueprint_compat = true,
	calculate = function(self, card, context)
		if
			context.other_joker
			and context.other_joker.edition
			and context.other_joker.edition.foil == true
			and card ~= context.other_joker
		then
			if not Talisman.config_file.disable_anims then
				G.E_MANAGER:add_event(Event({
					func = function()
						context.other_joker:juice_up(0.5, 0.5)
						return true
					end,
				}))
			end
			return {
				message = localize({ type = "variable", key = "a_chips", vars = { card.ability.extra.chips } }),
				chip_mod = card.ability.extra.chips,
			}
		end
		if context.individual and context.cardarea == G.play then
			if context.other_card.edition and context.other_card.edition.foil == true then
				return {
					chips = card.ability.extra.chips,
					colour = G.C.CHIPS,
					card = card,
				}
			end
		end
		if
			context.individual
			and context.cardarea == G.hand
			and context.other_card.edition
			and context.other_card.edition.foil == true
			and not context.end_of_round
		then
			if context.other_card.debuff then
				return {
					message = localize("k_debuffed"),
					colour = G.C.RED,
					card = card,
				}
			else
				return {
					chips = card.ability.extra.chips, --this doesn't exist yet :pensive: if only...
					card = card
				}
			end
		end
	end,
	atlas = "atlastwo",
}
local exoplanet = {
	object_type = "Joker",
	name = "cry-exoplanet",
	key = "exoplanet",
	pos = { x = 1, y = 2 },
	config = { extra = { mult = 15 } },
	loc_vars = function(self, info_queue, center)
		if not center.edition or (center.edition and not center.edition.holo) then
			info_queue[#info_queue + 1] = G.P_CENTERS.e_holo
		end
		return { vars = { center.ability.extra.mult } }
	end,
	rarity = 1,
	cost = 3,
	blueprint_compat = true,
	calculate = function(self, card, context)
		if
			context.other_joker
			and context.other_joker.edition
			and context.other_joker.edition.holo == true
			and card ~= context.other_joker
		then
			if not Talisman.config_file.disable_anims then
				G.E_MANAGER:add_event(Event({
					func = function()
						context.other_joker:juice_up(0.5, 0.5)
						return true
					end,
				}))
			end
			return {
				message = localize({ type = "variable", key = "a_mult", vars = { card.ability.extra.mult } }),
				mult_mod = card.ability.extra.mult,
			}
		end
		if context.individual and context.cardarea == G.play then
			if context.other_card.edition and context.other_card.edition.holo == true then
				return {
					mult = card.ability.extra.mult,
					colour = G.C.MULT,
					card = card,
				}
			end
		end
		if
			context.individual
			and context.cardarea == G.hand
			and context.other_card.edition
			and context.other_card.edition.holo == true
			and not context.end_of_round
		then
			if context.other_card.debuff then
				return {
					message = localize("k_debuffed"),
					colour = G.C.RED,
					card = card,
				}
			else
				return {
					h_mult = card.ability.extra.mult,
					card = card
				}
			end
		end
	end,
	atlas = "atlastwo",
}
local stardust = {
	object_type = "Joker",
	name = "cry-stardust",
	key = "stardust",
	pos = { x = 2, y = 2 },
	config = { extra = { xmult = 2 } },
	loc_vars = function(self, info_queue, center)
		if not center.edition or (center.edition and not center.edition.polychrome) then
			info_queue[#info_queue + 1] = G.P_CENTERS.e_polychrome
		end
		return { vars = { center.ability.extra.xmult } }
	end,
	rarity = 1,
	cost = 2,
	blueprint_compat = true,
	calculate = function(self, card, context)
		if
			context.other_joker
			and context.other_joker.edition
			and context.other_joker.edition.polychrome == true
			and card ~= context.other_joker
		then
			if not Talisman.config_file.disable_anims then
				G.E_MANAGER:add_event(Event({
					func = function()
						context.other_joker:juice_up(0.5, 0.5)
						return true
					end,
				}))
			end
			return {
				message = localize({ type = "variable", key = "a_xmult", vars = { card.ability.extra.xmult } }),
				Xmult_mod = card.ability.extra.xmult,
			}
		end
		if context.individual and context.cardarea == G.play then
			if context.other_card.edition and context.other_card.edition.polychrome == true then
				return {
					x_mult = card.ability.extra.xmult,
					colour = G.C.MULT,
					card = card,
				}
			end
		end
		if
			context.individual
			and context.cardarea == G.hand
			and context.other_card.edition
			and context.other_card.edition.polychrome == true
			and not context.end_of_round
		then
			if context.other_card.debuff then
				return {
					message = localize("k_debuffed"),
					colour = G.C.RED,
					card = card,
				}
			else
				return {
					x_mult = card.ability.extra.xmult,
					card = card
				}
			end
		end
	end,
	atlas = "atlastwo",
}
function rnjoker_randomize(card)
	card.ability.abilities = {}
	card.ability.extra = {}
	card.ability.extra.value = {}
	card.ability.extra.value_mod = {}
	card.ability.extra.cond_value = {}
	local values = {}
	local contexts = {
		"open_booster",
		"buying_card",
		"selling_self",
		"selling_card",
		"reroll_shop",
		"ending_shop",
		"skip_blind",
		"skipping_booster",
		"playing_card_added",
		"first_hand_drawn",
		"setting_blind",
		"remove_playing_cards",
		"using_consumeable",
		"debuffed_hand",
		"pre_discard",
		"discard",
		"end_of_round",
		"individual_play",
		"individual_hand_score",
		"individual_hand_end",
		"repetition_play",
		"repetition_hand",
		"other_joker",
		"before",
		"after",
		"joker_main",
	}
	local stats = {
		plus_mult = 2 + pseudorandom("rnj_mult1") * 28,
		plus_chips = 4 + pseudorandom("rnj_chips1") * 196,
		x_mult = 1 + pseudorandom("rnj_mult2") * 3,
		x_chips = 1 + pseudorandom("rnj_chips2") * 3,
		h_size = 1 + math.floor(pseudorandom("rnj_h_size") * 3),
		money = 1 + math.floor(pseudorandom("rnj_money") * 5),
	}
	local actions = {
		make_joker = 1,
		make_tarot = 1 + math.min(2, math.floor(pseudorandom("rnj_tarot") * 2)),
		make_planet = 1 + math.min(2, math.floor(pseudorandom("rnj_planet") * 2)),
		make_spectral = 1,
		add_dollars = 1 + math.min(4, math.floor(pseudorandom("rnj_dollars") * 5)),
	}
	local context = pseudorandom_element(contexts, pseudoseed("rnj_context"))
	values.context = context
	if context == "other_joker" or context == "joker_main" then
		stats.h_size = nil
		stats.money = nil
	end
	local stat_val, stat = pseudorandom_element(stats, pseudoseed("rnj_stat"))
	local act_val, act = pseudorandom_element(actions, pseudoseed("rnj_stat"))
	local scale = (pseudorandom("rnj_scale") > 0.5)
	local is_stat = (pseudorandom("rnj_stat") > 0.5)
	if context == "other_joker" or context == "joker_main" then
		is_stat = true
		scale = false
	end
	if
		((stat == "h_size") or (stat == "money"))
		and (context == "individual_play" or context == "individual_hand_score" or context == "individual_hand_end")
		and is_stat
	then
		scale = true
	end
	if context == "selling_self" then
		is_stat = false
		scale = false
	end
	if is_stat then
		values.value = stat_val or 0
		values.stat = stat
		if
			scale
			or (
				(context ~= "joker_main")
				and (context ~= "other_joker")
				and (context ~= "individual_play")
				and (context ~= "individual_hand_score")
			)
		then
			values.value = ((stat == "x_mult") or (stat == "x_chips")) and 1 or 0
			scale = true
			if stat == "plus_mult" then
				values.scale_value = pseudorandom("rnj_scaling") * 10
			elseif stat == "plus_chips" then
				values.scale_value = pseudorandom("rnj_scaling") * 50
			elseif stat == "h_size" then
				values.scale_value = 1
			elseif stat == "money" then
				values.scale_value = pseudorandom("rnj_scaling") * 4
			else
				values.scale_value = pseudorandom("rnj_scaling")
			end
		end
	else
		scale = false
		values.value = act_val
		values.act = act
	end
	if pseudorandom("rnj_stat") < 0.8 then
		local conds = {}
		if context == "buying_card" then
			conds = {
				"buy_common",
				"buy_uncommon",
				"tarot",
				"planet",
				"spectral",
				"odds",
			}
		elseif context == "selling_card" then
			conds = {
				"tarot",
				"planet",
				"spectral",
				"joker",
				"odds",
			}
		elseif context == "playing_card_added" then
			conds = {
				"suit",
				"rank",
				"face",
				"odds",
			}
		elseif context == "setting_blind" then
			conds = {
				"boss",
				"non_boss",
				"small",
				"big",
				"odds",
			}
		elseif context == "remove_playing_cards" then
			conds = {
				"suit",
				"rank",
				"face",
				"odds",
			}
		elseif context == "using_consumeable" then
			conds = {
				"tarot",
				"planet",
				"spectral",
				"odds",
			}
		elseif context == "pre_discard" then
			conds = {
				"first_discard",
				"last_discard",
				"odds",
			}
		elseif context == "discard" then
			conds = {
				"suit",
				"rank",
				"face",
				"odds",
			}
		elseif context == "individual_play" then
			conds = {
				"suit",
				"rank",
				"face",
				"odds",
			}
		elseif context == "individual_hand_score" then
			conds = {
				"suit",
				"rank",
				"face",
				"odds",
			}
		elseif context == "individual_hand_end" then
			conds = {
				"suit",
				"rank",
				"face",
				"odds",
			}
		elseif context == "repetition_play" then
			conds = {
				"suit",
				"rank",
				"face",
				"odds",
			}
		elseif context == "repetition_hand" then
			conds = {
				"suit",
				"rank",
				"face",
				"odds",
			}
		elseif context == "other_joker" then
			conds = {
				"uncommon",
				"rare",
				"odds",
			}
		elseif context == "before" then
			conds = {
				"first",
				"last",
				"poker_hand",
				"odds",
			}
		elseif context == "after" then
			conds = {
				"first",
				"last",
				"poker_hand",
				"odds",
			}
		elseif context == "joker_main" then
			conds = {
				"first",
				"last",
				"poker_hand",
				"or_more",
				"or_less",
				"odds",
			}
		elseif context == "cry_payout" then
			conds = {
				"hands_left",
				"discards_left",
			}
		end
		if #conds > 0 then
			local cond = pseudorandom_element(conds, pseudoseed("rnj_stat"))
			values.cond = cond
			if cond == "poker_hand" then
				local none, key = pseudorandom_element(G.GAME.hands, pseudoseed("rnj_poker-hand"))
				values.cond_value = localize(key, "poker_hands")
				values.poker_hand = key
			end
			if cond == "suit" then
				local suit = pseudorandom_element(SMODS.Suits, pseudoseed("rnj_suit"))
				values.cond_value = localize(suit.key, "suits_singular")
				values.suit = suit.key
				values.color = G.C.SUITS[suit.key]
				if values.color == nil then
					values.color = G.C.IMPORTANT
				end
			end
			if cond == "rank" then
				local rank = pseudorandom_element(SMODS.Ranks, pseudoseed("rnj_rank"))
				values.cond_value = localize(rank.key, "ranks")
				values.rank = rank.id
			end
			if (cond == "or_more") or (cond == "or_less") then
				values.cond_value = math.min(5, math.floor(pseudorandom("rnj_cards") * 6))
			end
			if (cond == "hands_left") or (cond == "discards_left") then
				values.cond_value = math.min(3, math.floor(pseudorandom("rnj_cards") * 4))
			end
			if cond == "odds" then
				values.cond_value = 2 + math.min(3, math.floor(pseudorandom("rnj_cards") * 4))
			end
		end
	end
	local loc_txt = ""
	local extra_lines = { "" }
	if (context ~= "repetition_play") and (context ~= "repetition_hand") then
		if values.stat then
			for i, j in ipairs(G.localization.misc.rnj_loc_txts.stats[values.stat]) do
				if scale and (i == 1) then
					loc_txt = loc_txt .. "Gains "
				end
				loc_txt = loc_txt .. j
			end
		end
		if values.act then
			for i, j in ipairs(G.localization.misc.rnj_loc_txts.actions[values.act]) do
				loc_txt = loc_txt .. j
			end
		end
	else
		scale = false
		values.stat = nil
		values.act = nil
		values.value = nil
		values.scale_value = nil
	end
	loc_txt = loc_txt .. " "
	if values.context then
		for i, j in ipairs(G.localization.misc.rnj_loc_txts.contexts[values.context]) do
			loc_txt = loc_txt .. j
		end
	end
	if values.context ~= "joker_main" then
		loc_txt = loc_txt .. " "
	end
	if values.cond then
		for i, j in ipairs(G.localization.misc.rnj_loc_txts.conds[values.cond]) do
			loc_txt = loc_txt .. j
		end
	end
	if scale then
		for i, j in ipairs(G.localization.misc.rnj_loc_txts.stats_inactive[values.stat]) do
			table.insert(extra_lines, j)
		end
	end
	if values.act and (values.act ~= "add_dollars") then
		table.insert(extra_lines, "{C:inactive}(Must have room){}")
	end
	local accum = 0
	local lines = { "Randomize abilities each {C:attention}Ante{}" }
	local in_brace = false
	local cuur_str = ""
	for i = 1, string.len(loc_txt) do
		local char = string.sub(loc_txt, i, i)
		if char == "{" then
			in_brace = true
			cuur_str = cuur_str .. char
		elseif char == "}" then
			in_brace = false
			cuur_str = cuur_str .. char
		elseif char == " " and (accum >= 25) then
			table.insert(lines, cuur_str)
			cuur_str = ""
			accum = 0
		else
			if not in_brace then
				accum = accum + 1
			end
			cuur_str = cuur_str .. char
		end
	end
	if string.len(cuur_str) > 0 then
		table.insert(lines, cuur_str)
	end
	if #extra_lines > 0 then
		for i, j in ipairs(extra_lines) do
			table.insert(lines, j)
		end
	end
	values.loc_txt = lines
	card.ability.extra = {}
	if values.value then
		values.value = math.floor(values.value * 100) / 100
		card.ability.extra.value = values.value
	end
	if values.scale_value then
		values.scale_value = math.floor(values.scale_value * 100) / 100
		card.ability.extra.value_mod = values.scale_value
	end
	if values.cond_value then
		card.ability.extra.cond_value = values.cond_value
	end
	if values.color then
		card.ability.extra.color = values.color
	end
	local text_parsed = {}
	for _, line in ipairs(values.loc_txt) do
		text_parsed[#text_parsed + 1] = loc_parse_string(line)
	end
	values.text_parsed = text_parsed
	card.ability.abilities = { values }
end
function localalize_with_direct(loc_target, args, misc_cat)
	if loc_target then
		for _, lines in
			ipairs(
				args.type == "unlocks" and loc_target.unlock_parsed
					or args.type == "name" and loc_target.name_parsed
					or (args.type == "text" or args.type == "tutorial" or args.type == "quips") and loc_target
					or loc_target.text_parsed
			)
		do
			local final_line = {}
			for _, part in ipairs(lines) do
				local assembled_string = ""
				for _, subpart in ipairs(part.strings) do
					assembled_string = assembled_string
						.. (
							type(subpart) == "string" and subpart
							or format_ui_value(args.vars[tonumber(subpart[1])])
							or "ERROR"
						)
				end
				local desc_scale = G.LANG.font.DESCSCALE
				if G.F_MOBILE_UI then
					desc_scale = desc_scale * 1.5
				end
				if args.type == "name" then
					final_line[#final_line + 1] = {
						n = G.UIT.O,
						config = {
							object = DynaText({
								string = { assembled_string },
								colours = {
									(part.control.V and args.vars.colours[tonumber(part.control.V)])
										or (part.control.C and loc_colour(part.control.C))
										or G.C.UI.TEXT_LIGHT,
								},
								bump = true,
								silent = true,
								pop_in = 0,
								pop_in_rate = 4,
								maxw = 5,
								shadow = true,
								y_offset = -0.6,
								spacing = math.max(0, 0.32 * (17 - #assembled_string)),
								scale = (0.55 - 0.004 * #assembled_string)
									* (part.control.s and tonumber(part.control.s) or 1),
							}),
						},
					}
				elseif part.control.E then
					local _float, _silent, _pop_in, _bump, _spacing = nil, true, nil, nil, nil
					if part.control.E == "1" then
						_float = true
						_silent = true
						_pop_in = 0
					elseif part.control.E == "2" then
						_bump = true
						_spacing = 1
					end
					final_line[#final_line + 1] = {
						n = G.UIT.O,
						config = {
							object = DynaText({
								string = { assembled_string },
								colours = {
									part.control.V and args.vars.colours[tonumber(part.control.V)]
										or loc_colour(part.control.C or nil),
								},
								float = _float,
								silent = _silent,
								pop_in = _pop_in,
								bump = _bump,
								spacing = _spacing,
								scale = 0.32 * (part.control.s and tonumber(part.control.s) or 1) * desc_scale,
							}),
						},
					}
				elseif part.control.X then
					final_line[#final_line + 1] = {
						n = G.UIT.C,
						config = {
							align = "m",
							colour = loc_colour(part.control.X),
							r = 0.05,
							padding = 0.03,
							res = 0.15,
						},
						nodes = {
							{
								n = G.UIT.T,
								config = {
									text = assembled_string,
									colour = loc_colour(part.control.C or nil),
									scale = 0.32 * (part.control.s and tonumber(part.control.s) or 1) * desc_scale,
								},
							},
						},
					}
				else
					final_line[#final_line + 1] = {
						n = G.UIT.T,
						config = {
							detailed_tooltip = part.control.T
									and (G.P_CENTERS[part.control.T] or G.P_TAGS[part.control.T])
								or nil,
							text = assembled_string,
							shadow = args.shadow,
							colour = part.control.V and args.vars.colours[tonumber(part.control.V)]
								or loc_colour(part.control.C or nil, args.default_col),
							scale = 0.32 * (part.control.s and tonumber(part.control.s) or 1) * desc_scale,
						},
					}
				end
			end
			if args.type == "name" or args.type == "text" then
				return final_line
			end
			args.nodes[#args.nodes + 1] = final_line
		end
	end
end
local rnjoker = {
	object_type = "Joker",
	name = "cry-rnjoker Joker", --:balatrojoker:
	key = "rnjoker",
	pos = { x = 5, y = 4 },
	config = {},
	loc_vars = function(self, info_queue, card)
		local vars = {
			vars = {
				(card.ability.extra and card.ability.extra.value_mod and card.ability.extra.value) or 0,
				(card.ability.extra and card.ability.extra.value and card.ability.extra.value_mod)
					or (card.ability.extra and card.ability.extra.value)
					or 0,
				card.ability.extra and card.ability.extra.cond_value or 0,
				G.GAME and G.GAME.probabilities.normal or 1,
			},
		}
		if card.ability.extra and card.ability.extra.color then
			vars.vars.colours = { card.ability.extra.color }
		end
		return vars
	end,
	rarity = 2,
	cost = 6,
	blueprint_compat = true,
	set_ability = function(self, card, initial, delay_sprites)
		card.ability.abilities = {}
		rnjoker_randomize(card)
	end,
	calculate = function(self, card, context)
		if card.ability and card.ability.abilities then
			for i, j in ipairs(card.ability.abilities) do
				local j_context = j.context
				local indiv = false
				if j_context ~= "cry_payout" then
					local valid_context = not not context[j.context]
					if j.scale_value and context.blueprint then
						valid_context = false
					end
					if (j_context == "playing_card_added") and card.getting_sliced then
						valid_context = false
					end
					if (j_context == "setting_blind") and card.getting_sliced then
						valid_context = false
					end
					if (j_context == "setting_blind") and card.getting_sliced then
						valid_context = false
					end
					if (j_context == "before") and (card.area ~= G.jokers) then
						valid_context = false
					end
					if (j_context == "after") and (card.area ~= G.jokers) then
						valid_context = false
					end
					if (j_context == "joker_main") and (card.area ~= G.jokers) then
						valid_context = false
					end
					if (j_context == "end_of_round") and (context.repetition or context.individual) then
						valid_context = false
					end
					if
						(j_context == "individual_play")
						and context.individual
						and not context.repetition
						and (context.cardarea == G.play)
					then
						valid_context = true
						indiv = true
					end
					if
						(j_context == "individual_hand_score")
						and context.individual
						and not context.repetition
						and (context.cardarea == G.hand)
						and not context.end_of_round
					then
						valid_context = true
						indiv = true
					end
					if
						(j_context == "individual_hand_end")
						and context.individual
						and not context.repetition
						and (context.cardarea == G.hand and context.end_of_round)
					then
						valid_context = true
						indiv = true
					end
					if (j_context == "repetition_play") and context.repetition and (context.cardarea == G.play) then
						valid_context = true
					end
					if (j_context == "repetition_hand") and context.repetition and (context.cardarea == G.hand) then
						valid_context = true
					end
					if valid_context then
						local cond_passed = false
						local times_passed = 1
						if j.cond then
							if j.cond == "buy_common" then
								if
									context.card
									and context.card.ability
									and (context.card.ability.set == "Joker")
									and (context.card.config.center.rarity == 1)
								then
									cond_passed = true
								end
							elseif j.cond == "buy_uncommon" then
								if
									context.card
									and context.card.ability
									and (context.card.ability.set == "Joker")
									and (context.card.config.center.rarity == 2)
								then
									cond_passed = true
								end
							elseif j.cond == "tarot" then
								local card = context.card or context.consumeable
								if card and card.ability and (card.ability.set == "Tarot") then
									cond_passed = true
								end
							elseif j.cond == "planet" then
								local card = context.card or context.consumeable
								if card and card.ability and (card.ability.set == "Planet") then
									cond_passed = true
								end
							elseif j.cond == "spectral" then
								local card = context.card or context.consumeable
								if card and card.ability and (card.ability.set == "Spectral") then
									cond_passed = true
								end
							elseif j.cond == "joker" then
								if context.card and context.card.ability and (context.card.ability.set == "Joker") then
									cond_passed = true
								end
							elseif j.cond == "suit" then
								times_passed = 0
								local cards = context.cards
								if cards == nil then
									cards = context.removed
								end
								if cards == nil then
									cards = { context.other_card }
								end
								for i2, j2 in ipairs(cards) do
									if j2:is_suit(j.suit) then
										cond_passed = true
										times_passed = times_passed + 1
									end
								end
							elseif j.cond == "rank" then
								times_passed = 0
								local cards = context.cards
								if cards == nil then
									cards = context.removed
								end
								if cards == nil then
									cards = { context.other_card }
								end
								for i2, j2 in ipairs(cards) do
									if j2:get_id() == j.rank then
										cond_passed = true
										times_passed = times_passed + 1
									end
								end
							elseif j.cond == "face" then
								times_passed = 0
								local cards = context.cards
								if cards == nil then
									cards = context.removed
								end
								if cards == nil then
									cards = { context.other_card }
								end
								for i2, j2 in ipairs(cards) do
									if j2:is_face() then
										cond_passed = true
										times_passed = times_passed + 1
									end
								end
							elseif j.cond == "boss" then
								if context.blind.boss and not (context.blind.config and context.blind.config.bonus) then
									cond_passed = true
								end
							elseif j.cond == "non_boss" then
								if context.blind and not G.GAME.blind.boss then
									cond_passed = true
								end
							elseif j.cond == "small" then
								if context.blind == G.P_BLINDS.bl_small then
									cond_passed = true
								end
							elseif j.cond == "big" then
								if context.blind == G.P_BLINDS.bl_big then
									cond_passed = true
								end
							elseif j.cond == "first" then
								if G.GAME.current_round.hands_played == 0 then
									cond_passed = true
								end
							elseif j.cond == "last" then
								if G.GAME.current_round.hands_left == 0 then
									cond_passed = true
								end
							elseif j.cond == "common" then
								if context.other_joker.config.center.rarity == 1 then
									cond_passed = true
								end
							elseif j.cond == "uncommon" then
								if context.other_joker.config.center.rarity == 2 then
									cond_passed = true
								end
							elseif j.cond == "rare" then
								if context.other_joker.config.center.rarity == 3 then
									cond_passed = true
								end
							elseif j.cond == "poker_hand" then
								if context.poker_hands~= nil and next(context.poker_hands[j.poker_hand]) then
									cond_passed = true
								end
							elseif j.cond == "or_more" then
								if #context.full_hand >= j.cond_value then
									cond_passed = true
								end
							elseif j.cond == "or_less" then
								if #context.full_hand <= j.cond_value then
									cond_passed = true
								end
							elseif j.cond == "hands_left" then
								if G.GAME.current_round.hands_left == j.cond_value then
									cond_passed = true
								end
							elseif j.cond == "discards_left" then
								if G.GAME.current_round.discards_left == j.cond_value then
									cond_passed = true
								end
							elseif j.cond == "first_discard" then
								if G.GAME.current_round.discards_used <= 0 then
									cond_passed = true
								end
							elseif j.cond == "last_discard" then
								if G.GAME.current_round.discards_left <= 1 then
									cond_passed = true
								end
							elseif j.cond == "odds" then
								if
									pseudorandom("rnj")
									< ((G.GAME and G.GAME.probabilities.normal or 1) / card.ability.extra.cond_value)
								then
									cond_passed = true
								end
							end
						else
							cond_passed = true
						end
						if cond_passed then
							if j.context == "other_joker" then
								local stats = {
									plus_mult = "a_mult",
									plus_chips = "a_chips",
									x_mult = "a_xmult",
									x_chips = "a_xchips",
								}
								local mods = {
									plus_chips = "chip_mod",
									plus_mult = "mult_mod",
									x_mult = "Xmult_mod",
									x_chips = "Xchip_mod",
								}
								local table = {}
								table.message =
									localize({ type = "variable", key = stats[j.stat], vars = {
										card.ability.extra.value,
									} })
								table[mods[j.stat]] = card.ability.extra.value
								table.card = card
								G.E_MANAGER:add_event(Event({
									func = function()
										context.other_joker:juice_up(0.5, 0.5)
										return true
									end,
								}))
								return table
							elseif (j.context == "repetition_play") or (j.context == "repetition_hand") then
								return {
									message = localize("k_again_ex"),
									repetitions = 1,
									card = card,
								}
							elseif j.scale_value then
								card.ability.extra.value = card.ability.extra.value
									+ (card.ability.extra.value_mod * times_passed)
								card_eval_status_text(
									card,
									"extra",
									nil,
									nil,
									nil,
									{ message = localize("k_upgrade_ex") }
								)
								if j.stat == "h_size" then
									G.hand:change_size(card.ability.extra.value_mod)
								end
							elseif j.act then
								local j_mod = 0
								if j.context == "selling_self" and (card.ability.set == "Joker") then
									j_mod = 1
								end
								if j.context == "selling_card" and (context.card.ability.set == "Joker") then
									j_mod = 1
								end
								local c_mod = 0
								if j.context == "selling_self" and card.ability.consumeable then
									c_mod = 1
								end
								if j.context == "selling_card" and card.ability.consumeable then
									c_mod = 1
								end
								if j.act == "make_joker" then
									local amount = card.ability.extra.value * times_passed
									if
										(G.jokers.config.card_limit + j_mod - #G.jokers.cards - G.GAME.joker_buffer)
										< amount
									then
										amount = G.jokers.config.card_limit
											+ j_mod
											- #G.jokers.cards
											- G.GAME.joker_buffer
									end
									if amount > 0 then
										G.GAME.joker_buffer = G.GAME.joker_buffer + amount
										G.E_MANAGER:add_event(Event({
											trigger = "before",
											delay = 0.0,
											func = function()
												for i = 1, amount do
													if G.jokers.config.card_limit + j_mod > #G.jokers.cards then
														local card = create_card(
															"Joker",
															G.jokers,
															nil,
															nil,
															nil,
															nil,
															nil,
															"rnj"
														)
														card:add_to_deck()
														G.jokers:emplace(card)
													else
														break
													end
												end
												G.GAME.joker_buffer = 0
												return true
											end,
										}))
									end
								elseif j.act == "make_tarot" then
									local amount = card.ability.extra.value * times_passed
									if
										(
											G.consumeables.config.card_limit
											+ c_mod
											- #G.consumeables.cards
											- G.GAME.consumeable_buffer
										) < amount
									then
										amount = G.consumeables.config.card_limit
											+ c_mod
											- #G.consumeables.cards
											- G.GAME.consumeable_buffer
									end
									if amount > 0 then
										G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + amount
										G.E_MANAGER:add_event(Event({
											trigger = "before",
											delay = 0.0,
											func = function()
												for i = 1, amount do
													if
														G.consumeables.config.card_limit + c_mod > #G.consumeables.cards
													then
														local card = create_card(
															"Tarot",
															G.consumeables,
															nil,
															nil,
															nil,
															nil,
															nil,
															"rnj"
														)
														card:add_to_deck()
														G.consumeables:emplace(card)
													else
														break
													end
												end
												G.GAME.consumeable_buffer = 0
												return true
											end,
										}))
									end
								elseif j.act == "make_planet" then
									local amount = card.ability.extra.value * times_passed
									if
										(
											G.consumeables.config.card_limit
											+ c_mod
											- #G.consumeables.cards
											- G.GAME.consumeable_buffer
										) < amount
									then
										amount = G.consumeables.config.card_limit
											+ c_mod
											- #G.consumeables.cards
											- G.GAME.consumeable_buffer
									end
									if amount > 0 then
										G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + amount
										G.E_MANAGER:add_event(Event({
											trigger = "before",
											delay = 0.0,
											func = function()
												for i = 1, amount do
													if
														G.consumeables.config.card_limit + c_mod > #G.consumeables.cards
													then
														local card = create_card(
															"Planet",
															G.consumeables,
															nil,
															nil,
															nil,
															nil,
															nil,
															"rnj"
														)
														card:add_to_deck()
														G.consumeables:emplace(card)
													else
														break
													end
												end
												G.GAME.consumeable_buffer = 0
												return true
											end,
										}))
									end
								elseif j.act == "make_spectral" then
									local amount = card.ability.extra.value * times_passed
									if
										(
											G.consumeables.config.card_limit
											+ c_mod
											- #G.consumeables.cards
											- G.GAME.consumeable_buffer
										) < amount
									then
										amount = G.consumeables.config.card_limit
											+ c_mod
											- #G.consumeables.cards
											- G.GAME.consumeable_buffer
									end
									if amount > 0 then
										G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + amount
										G.E_MANAGER:add_event(Event({
											trigger = "before",
											delay = 0.0,
											func = function()
												for i = 1, amount do
													if
														G.consumeables.config.card_limit + c_mod > #G.consumeables.cards
													then
														local card = create_card(
															"Spectral",
															G.consumeables,
															nil,
															nil,
															nil,
															nil,
															nil,
															"rnj"
														)
														card:add_to_deck()
														G.consumeables:emplace(card)
													else
														break
													end
												end
												G.GAME.consumeable_buffer = 0
												return true
											end,
										}))
									end
								elseif j.act == "add_dollars" then
									ease_dollars(card.ability.extra.value)
									return {
										message = localize("$") .. card.ability.extra.value,
										colour = G.C.MONEY,
										card = card,
									}
								end
							end
						end
					end
					if j.stat and context.individual and indiv then
						local cond_passed = false
						if j.cond == "suit" then
							if context.other_card:is_suit(j.suit) then
								cond_passed = true
							end
						elseif j.cond == "rank" then
							if context.other_card:get_id() == j.rank then
								cond_passed = true
							end
						elseif j.cond == "face" then
							if context.other_card:is_face() then
								cond_passed = true
							end
						elseif j.cond == "odds" then
							if
								pseudorandom("rnj")
								< ((G.GAME and G.GAME.probabilities.normal or 1) / card.ability.extra.cond_value)
							then
								cond_passed = true
							end
						end
						if not j.cond then
							cond_passed = true
						end
						if cond_passed then
							if (context.cardarea == G.hand) and context.other_card.debuff then
								return {
									message = localize("k_debuffed"),
									colour = G.C.RED,
									card = card,
								}
							end
							if j.scale_value then
								card.ability.extra.value = card.ability.extra.value + card.ability.extra.value_mod
								card_eval_status_text(
									card,
									"extra",
									nil,
									nil,
									nil,
									{ message = localize("k_upgrade_ex") }
								)
								if j.stat == "h_size" then
									G.hand:change_size(card.ability.extra.value_mod)
								end
							else
								local stats = {
									plus_mult = "mult",
									plus_chips = "chips",
								}
								if context.cardarea == G.hand then
									local stats = {
										plus_mult = "h_mult",
										plus_chips = "h_chips",
									}
								end
								local stat = stats[j.stat] or j.stat
								local colors = {
									plus_mult = G.C.RED,
									plus_chips = G.C.BLUE,
									x_mult = G.C.RED,
									x_chips = G.C.BLUE,
								}
								local table = {
									card = card,
								}
								table.colour = colors[j.stat]
								table[stat] = card.ability.extra.value
								return table
							end
						end
					end
					if context.joker_main and j.stat and (j.stat ~= "h_size") and (j.stat ~= "money") then
						local cond_passed = false
						if j_context ~= "joker_main" then
							cond_passed = true
						end
						if j.cond == "first" then
							if G.GAME.current_round.hands_played == 0 then
								cond_passed = true
							end
						elseif j.cond == "last" then
							if G.GAME.current_round.hands_left == 0 then
								cond_passed = true
							end
						elseif j.cond == "poker_hand" then
							if context.poker_hands~= nil and next(context.poker_hands[j.poker_hand]) then
								cond_passed = true
							end
						elseif j.cond == "or_more" then
							if #context.full_hand >= j.cond_value then
								cond_passed = true
							end
						elseif j.cond == "or_less" then
							if #context.full_hand <= j.cond_value then
								cond_passed = true
							end
						elseif j.cond == "odds" then
							if
								pseudorandom("rnj")
								< ((G.GAME and G.GAME.probabilities.normal or 1) / card.ability.extra.cond_value)
							then
								cond_passed = true
							end
						end
						if not j.cond then
							cond_passed = true
						end
						if cond_passed then
							local stats = {
								plus_mult = "a_mult",
								plus_chips = "a_chips",
								x_mult = "a_xmult",
								x_chips = "a_xchips",
							}
							local mods = {
								plus_mult = "mult_mod",
								plus_chips = "chip_mod",
								x_mult = "Xmult_mod",
								x_chips = "Xchip_mod",
							}
							local table = {}
							table.message = localize({
								type = "variable",
								key = stats[j.stat],
								vars = { card.ability.extra.value },
							})
							table[mods[j.stat]] = card.ability.extra.value
							return table
						end
					end
				end
			end
		end
		if
			not context.individual
			and not context.repetition
			and not card.debuff
			and context.end_of_round
			and not context.blueprint
			and G.GAME.blind.boss
			and not (G.GAME.blind.config and G.GAME.blind.config.bonus)
		then
			local hand_size = 0
			if card.ability and card.ability.abilities then
				for i, j in ipairs(card.ability.abilities) do
					if j.stat == "h_size" then
						hand_size = hand_size + card.ability.extra.value
					end
				end
			end
			G.hand:change_size(-hand_size)
			rnjoker_randomize(card)
			return {
				message = localize("k_reset"),
				colour = G.C.RED,
			}
		end
	end,
	add_to_deck = function(self, card, from_debuff)
		local hand_size = 0
		if card.ability and card.ability.abilities then
			for i, j in ipairs(card.ability.abilities) do
				if j.stat == "h_size" then
					hand_size = hand_size + card.ability.extra.value
				end
			end
		end
		G.hand:change_size(hand_size)
	end,
	remove_from_deck = function(self, card, from_debuff)
		local hand_size = 0
		if card.ability and card.ability.abilities then
			for i, j in ipairs(card.ability.abilities) do
				if j.stat == "h_size" then
					hand_size = hand_size + card.ability.extra.value
				end
			end
		end
		G.hand:change_size(-hand_size)
	end,
	generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
		local len = (
			card.ability
			and card.ability.abilities
			and card.ability.abilities[1].loc_txt
			and #card.ability.abilities[1].loc_txt
		) or 0
		local target = {
			type = "descriptions",
			key = self.key,
			set = self.set,
			nodes = desc_nodes,
			vars = specific_vars or {},
		}
		if self.loc_vars and type(self.loc_vars) == "function" then
			res = self:loc_vars(info_queue, card) or {}
			target.vars = res.vars or target.vars
			target.key = res.key or target.key
		end
		local new_loc = { text = {} }
		if
			card.ability
			and card.ability.abilities
			and card.ability.abilities[1].loc_txt
			and #card.ability.abilities[1].loc_txt
		then
			for i, j in ipairs(card.ability.abilities[1].loc_txt) do
				table.insert(new_loc.text, j)
			end
			new_loc.text_parsed = card.ability.abilities[1].text_parsed
		end
		if not full_UI_table.name then
			full_UI_table.name =
				localize({ type = "name", set = self.set, key = target.key or self.key, nodes = full_UI_table.name })
		end
		if specific_vars and specific_vars.debuffed then
			target = {
				type = "other",
				key = "debuffed_" .. (specific_vars.playing_card and "playing_card" or "default"),
				nodes = desc_nodes,
			}
			localize(target)
		else
			localalize_with_direct(new_loc, target)
		end
	end,
	calc_dollar_bonus = function(self, card)
		if card.ability and card.ability.abilities then
			for i, j in ipairs(card.ability.abilities) do
				if j.stat == "money" then
					if card.ability.extra.value > 0 then
						return card.ability.extra.value
					end
				end
			end
		end
	end,
	atlas = "atlastwo",
}
local duos = {
	object_type = "Joker",
	name = "cry-duos",
	key = "duos",
	pos = { x = 0, y = 0 },
	config = { Xmult = 2.5, type = "Two Pair" },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.x_mult, localize(card.ability.type, "poker_hands") } }
	end,
	atlas = "atlasthree",
	rarity = 3,
	cost = 8,
	blueprint_compat = true,
	calculate = function(self, card, context)
		if
			context.cardarea == G.jokers
			and (to_big(card.ability.x_mult) > to_big(1))
			and not context.before
			and not context.after
		then
			if context.poker_hands~= nil and next(context.poker_hands["Two Pair"]) or context.poker_hands~= nil and next(context.poker_hands["Full House"]) then
				return {
					message = localize({ type = "variable", key = "a_xmult", vars = { card.ability.x_mult } }),
					colour = G.C.RED,
					Xmult_mod = card.ability.x_mult,
				}
			end
		end
	end,
}
local home = {
	object_type = "Joker",
	name = "cry-home",
	key = "home",
	pos = { x = 2, y = 0 },
	config = { Xmult = 3.5, type = "Full House" },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.x_mult, localize(card.ability.type, "poker_hands") } }
	end,
	atlas = "atlasthree",
	rarity = 3,
	cost = 8,
	blueprint_compat = true,
	calculate = function(self, card, context)
		if
			context.cardarea == G.jokers
			and (to_big(card.ability.x_mult) > to_big(1))
			and not context.before
			and not context.after
		then
			if context.poker_hands~= nil and next(context.poker_hands["Full House"]) then
				return {
					message = localize({ type = "variable", key = "a_xmult", vars = { card.ability.x_mult } }),
					colour = G.C.RED,
					Xmult_mod = card.ability.x_mult,
				}
			end
		end
	end,
}
local nuts = {
	object_type = "Joker",
	name = "cry-nuts",
	key = "nuts",
	pos = { x = 1, y = 0 },
	config = { Xmult = 5, type = "Straight Flush" },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.x_mult, localize(card.ability.type, "poker_hands") } }
	end,
	atlas = "atlasthree",
	rarity = 3,
	cost = 8,
	blueprint_compat = true,
	calculate = function(self, card, context)
		if
			context.cardarea == G.jokers
			and (to_big(card.ability.x_mult) > to_big(1))
			and not context.before
			and not context.after
		then
			if context.poker_hands ~= nil and  next(context.poker_hands["Straight Flush"]) then
				return {
					message = localize({ type = "variable", key = "a_xmult", vars = { card.ability.x_mult } }),
					colour = G.C.RED,
					Xmult_mod = card.ability.x_mult,
				}
			end
		end
	end,
}
local quintet = {
	object_type = "Joker",
	name = "cry-quintet",
	key = "quintet",
	pos = { x = 3, y = 0 },
	config = { Xmult = 5, type = "Five of a Kind" },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.x_mult, localize(card.ability.type, "poker_hands") } }
	end,
	atlas = "atlasthree",
	rarity = 3,
	cost = 8,
	blueprint_compat = true,
	calculate = function(self, card, context)
		if
			context.cardarea == G.jokers
			and (to_big(card.ability.x_mult) > to_big(1))
			and not context.before
			and not context.after
		then
			if context.poker_hands~= nil and next(context.poker_hands["Five of a Kind"]) then
				return {
					message = localize({ type = "variable", key = "a_xmult", vars = { card.ability.x_mult } }),
					colour = G.C.RED,
					Xmult_mod = card.ability.x_mult,
				}
			end
		end
	end,
	in_pool = function(self)
		if G.GAME.hands["Five of a Kind"].played > 0 then
			return true
		end
		return false
	end,
}
local unity = {
	object_type = "Joker",
	name = "cry-unity",
	key = "unity",
	pos = { x = 4, y = 0 },
	config = { Xmult = 7, type = "Flush House" },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.x_mult, localize(card.ability.type, "poker_hands") } }
	end,
	atlas = "atlasthree",
	rarity = 3,
	cost = 8,
	blueprint_compat = true,
	calculate = function(self, card, context)
		if
			context.cardarea == G.jokers
			and (to_big(card.ability.x_mult) > to_big(1))
			and not context.before
			and not context.after
		then
			if context.poker_hands~= nil and next(context.poker_hands["Flush House"]) then
				return {
					message = localize({ type = "variable", key = "a_xmult", vars = { card.ability.x_mult } }),
					colour = G.C.RED,
					Xmult_mod = card.ability.x_mult,
				}
			end
		end
	end,
	in_pool = function(self)
		if G.GAME.hands["Flush House"].played > 0 then
			return true
		end
		return false
	end,
}
local swarm = {
	object_type = "Joker",
	name = "cry-swarm",
	key = "swarm",
	pos = { x = 5, y = 0 },
	config = { Xmult = 9, type = "Flush Five" },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.x_mult, localize(card.ability.type, "poker_hands") } }
	end,
	atlas = "atlasthree",
	rarity = 3,
	cost = 8,
	blueprint_compat = true,
	calculate = function(self, card, context)
		if
			context.cardarea == G.jokers
			and (to_big(card.ability.x_mult) > to_big(1))
			and not context.before
			and not context.after
		then
			if context.poker_hands~= nil and next(context.poker_hands["Flush Five"]) then
				return {
					message = localize({ type = "variable", key = "a_xmult", vars = { card.ability.x_mult } }),
					colour = G.C.RED,
					Xmult_mod = card.ability.x_mult,
				}
			end
		end
	end,
	in_pool = function(self)
		if G.GAME.hands["Flush Five"].played > 0 then
			return true
		end
		return false
	end,
}
local filler = {
	object_type = "Joker",
	name = "cry-filler",
	key = "filler",
	pos = { x = 0, y = 1 },
	config = { Xmult = 1.5, type = "High Card" },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.x_mult, localize(card.ability.type, "poker_hands") } }
	end,
	atlas = "atlasthree",
	rarity = 3,
	cost = 1,
	blueprint_compat = true,
	calculate = function(self, card, context)
		if context.cardarea == G.jokers and not context.before and not context.after and context.poker_hands and next(context.poker_hands["High Card"]) then
			return {
				message = localize({ type = "variable", key = "a_xmult", vars = { card.ability.x_mult } }),
				colour = G.C.RED,
				Xmult_mod = card.ability.x_mult,
			}
		end
	end,
}
local giggly = {
	object_type = "Joker",
	name = "cry-Giggly Joker",
	key = "giggly",
	effect = "Cry Type Mult",
	pos = { x = 0, y = 5 },
	config = { t_mult = 3, type = "High Card" },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.t_mult, localize(card.ability.type, "poker_hands") } }
	end,
	atlas = "atlasthree",
	rarity = 1,
	cost = 1,
	blueprint_compat = true,
	calculate = function(self, card, context)
		if context.cardarea == G.jokers and not context.before and not context.after and context.poker_hands and next(context.poker_hands["High Card"]) then
			return {
				message = localize({ type = "variable", key = "a_mult", vars = { card.ability.t_mult } }),
				colour = G.C.RED,
				mult_mod = card.ability.t_mult,
			}
		end
	end,
}
local nutty = {
	object_type = "Joker",
	name = "cry-Nutty Joker",
	key = "nutty",
	effect = "Cry Type Mult",
	pos = { x = 1, y = 5 },
	config = { t_mult = 19, type = "Four of a Kind" },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.t_mult, localize(card.ability.type, "poker_hands") } }
	end,
	atlas = "atlasthree",
	rarity = 1,
	cost = 4,
	blueprint_compat = true,
	calculate = function(self, card, context)
		if context.cardarea == G.jokers and not context.before and not context.after and context.poker_hands and next(context.poker_hands["Four of a Kind"]) then
			return {
				message = localize({ type = "variable", key = "a_mult", vars = { card.ability.t_mult } }),
				colour = G.C.RED,
				mult_mod = card.ability.t_mult,
			}
		end
	end,
}
local manic = {
	object_type = "Joker",
	name = "cry-Manic Joker",
	key = "manic",
	effect = "Cry Type Mult",
	pos = { x = 2, y = 5 },
	config = { t_mult = 22, type = "Straight Flush" },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.t_mult, localize(card.ability.type, "poker_hands") } }
	end,
	atlas = "atlasthree",
	rarity = 1,
	cost = 4,
	blueprint_compat = true,
	calculate = function(self, card, context)
		if context.cardarea == G.jokers and not context.before and not context.after and context.poker_hands and next(context.poker_hands["Straight Flush"]) then
			return {
				message = localize({ type = "variable", key = "a_mult", vars = { card.ability.t_mult } }),
				colour = G.C.RED,
				mult_mod = card.ability.t_mult,
			}
		end
	end,
}
local silly = {
	object_type = "Joker",
	name = "cry-Silly Joker",
	key = "silly",
	pos = { x = 3, y = 5 },
	effect = "Cry Type Mult",
	config = { t_mult = 16, type = "Full House" },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.t_mult, localize(card.ability.type, "poker_hands") } }
	end,
	atlas = "atlasthree",
	rarity = 1,
	cost = 4,
	blueprint_compat = true,
	calculate = function(self, card, context)
		if context.cardarea == G.jokers and not context.before and not context.after and context.poker_hands and next(context.poker_hands["Full House"]) then
			return {
				message = localize({ type = "variable", key = "a_mult", vars = { card.ability.t_mult } }),
				colour = G.C.RED,
				mult_mod = card.ability.t_mult,
			}
		end
	end,
}
local delirious = {
	object_type = "Joker",
	name = "cry-Delirious Joker",
	key = "delirious",
	effect = "Cry Type Mult",
	pos = { x = 4, y = 5 },
	config = { t_mult = 22, type = "Five of a Kind" },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.t_mult, localize(card.ability.type, "poker_hands") } }
	end,
	atlas = "atlasthree",
	rarity = 1,
	cost = 4,
	blueprint_compat = true,
	calculate = function(self, card, context)
		if context.cardarea == G.jokers and not context.before and not context.after and context.poker_hands and next(context.poker_hands["Five of a Kind"]) then
			return {
				message = localize({ type = "variable", key = "a_mult", vars = { card.ability.t_mult } }),
				colour = G.C.RED,
				mult_mod = card.ability.t_mult,
			}
		end
	end,
	in_pool = function(self)
		if G.GAME.hands["Five of a Kind"].played > 0 then
			return true
		end
		return false
	end,
}
local wacky = {
	object_type = "Joker",
	name = "cry-Wacky Joker",
	key = "wacky",
	pos = { x = 5, y = 5 },
	config = { t_mult = 25, type = "Flush House" },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.t_mult, localize(card.ability.type, "poker_hands") } }
	end,
	atlas = "atlasthree",
	rarity = 1,
	cost = 4,
	effect = "Cry Type Mult",
	blueprint_compat = true,
	calculate = function(self, card, context)
		if context.cardarea == G.jokers and not context.before and not context.after and context.poker_hands and next(context.poker_hands["Flush House"]) then
			return {
				message = localize({ type = "variable", key = "a_mult", vars = { card.ability.t_mult } }),
				colour = G.C.RED,
				mult_mod = card.ability.t_mult,
			}
		end
	end,
	in_pool = function(self)
		if G.GAME.hands["Flush House"].played > 0 then
			return true
		end
		return false
	end,
}
local kooky = {
	object_type = "Joker",
	name = "cry-Kooky Joker",
	key = "kooky",
	pos = { x = 6, y = 5 },
	config = { t_mult = 30, type = "Flush Five" },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.t_mult, localize(card.ability.type, "poker_hands") } }
	end,
	atlas = "atlasthree",
	rarity = 1,
	effect = "Cry Type Mult",
	cost = 4,
	blueprint_compat = true,
	calculate = function(self, card, context)
		if context.cardarea == G.jokers and not context.before and not context.after and context.poker_hands and next(context.poker_hands["Flush Five"]) then
			return {
				message = localize({ type = "variable", key = "a_mult", vars = { card.ability.t_mult } }),
				colour = G.C.RED,
				mult_mod = card.ability.t_mult,
			}
		end
	end,
	in_pool = function(self)
		if G.GAME.hands["Flush Five"].played > 0 then
			return true
		end
		return false
	end,
}
local dubious = {
	object_type = "Joker",
	name = "cry-Dubious Joker",
	key = "dubious",
	pos = { x = 0, y = 6 },
	config = { t_chips = 20, type = "High Card" },
	effect = "Cry Type Chips",
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.t_chips, localize(card.ability.type, "poker_hands") } }
	end,
	atlas = "atlasthree",
	rarity = 1,
	cost = 1,
	blueprint_compat = true,
	calculate = function(self, card, context)
		if context.cardarea == G.jokers and not context.before and not context.after and context.poker_hands and next(context.poker_hands["High Card"]) then
			return {
				message = localize({ type = "variable", key = "a_chips", vars = { card.ability.t_chips } }),
				colour = G.C.BLUE,
				chip_mod = card.ability.t_chips,
			}
		end
	end,
}
local shrewd = {
	object_type = "Joker",
	name = "cry-Shrewd Joker",
	key = "shrewd",
	pos = { x = 1, y = 6 },
	effect = "Cry Type Chips",
	config = { t_chips = 150, type = "Four of a Kind" },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.t_chips, localize(card.ability.type, "poker_hands") } }
	end,
	atlas = "atlasthree",
	rarity = 1,
	cost = 4,
	blueprint_compat = true,
	calculate = function(self, card, context)
		if context.cardarea == G.jokers and not context.before and not context.after and context.poker_hands and next(context.poker_hands["Four of a Kind"]) then
			return {
				message = localize({ type = "variable", key = "a_chips", vars = { card.ability.t_chips } }),
				colour = G.C.BLUE,
				chip_mod = card.ability.t_chips,
			}
		end
	end,
}
local tricksy = {
	object_type = "Joker",
	name = "cry-Tricksy Joker",
	key = "tricksy",
	effect = "Cry Type Chips",
	pos = { x = 2, y = 6 },
	config = { t_chips = 170, type = "Straight Flush" },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.t_chips, localize(card.ability.type, "poker_hands") } }
	end,
	atlas = "atlasthree",
	rarity = 1,
	cost = 4,
	blueprint_compat = true,
	calculate = function(self, card, context)
		if context.cardarea == G.jokers and not context.before and not context.after and context.poker_hands and next(context.poker_hands["Straight Flush"]) then
			return {
				message = localize({ type = "variable", key = "a_chips", vars = { card.ability.t_chips } }),
				colour = G.C.BLUE,
				chip_mod = card.ability.t_chips,
			}
		end
	end,
}
local foxy = {
	object_type = "Joker",
	name = "cry-Foxy Joker",
	key = "foxy",
	pos = { x = 3, y = 6 },
	effect = "Cry Type Chips",
	config = { t_chips = 130, type = "Full House" },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.t_chips, localize(card.ability.type, "poker_hands") } }
	end,
	atlas = "atlasthree",
	rarity = 1,
	cost = 4,
	blueprint_compat = true,
	calculate = function(self, card, context)
		if context.cardarea == G.jokers and not context.before and not context.after and context.poker_hands and next(context.poker_hands["Full House"]) then
			return {
				message = localize({ type = "variable", key = "a_chips", vars = { card.ability.t_chips } }),
				colour = G.C.BLUE,
				chip_mod = card.ability.t_chips,
			}
		end
	end,
}
local savvy = {
	object_type = "Joker",
	name = "cry-Savvy Joker",
	key = "savvy",
	pos = { x = 4, y = 6 },
	effect = "Cry Type Chips",
	config = { t_chips = 170, type = "Five of a Kind" },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.t_chips, localize(card.ability.type, "poker_hands") } }
	end,
	atlas = "atlasthree",
	rarity = 1,
	cost = 4,
	blueprint_compat = true,
	calculate = function(self, card, context)
		if context.cardarea == G.jokers and not context.before and not context.after and context.poker_hands and next(context.poker_hands["Five of a Kind"]) then
			return {
				message = localize({ type = "variable", key = "a_chips", vars = { card.ability.t_chips } }),
				colour = G.C.BLUE,
				chip_mod = card.ability.t_chips,
			}
		end
	end,
	in_pool = function(self)
		if G.GAME.hands["Five of a Kind"].played > 0 then
			return true
		end
		return false
	end,
}
local subtle = {
	object_type = "Joker",
	name = "cry-Subtle Joker",
	key = "subtle",
	pos = { x = 5, y = 6 },
	effect = "Cry Type Chips",
	config = { t_chips = 200, type = "Flush House" },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.t_chips, localize(card.ability.type, "poker_hands") } }
	end,
	atlas = "atlasthree",
	rarity = 1,
	cost = 4,
	blueprint_compat = true,
	calculate = function(self, card, context)
		if context.cardarea == G.jokers and not context.before and not context.after and context.poker_hands and next(context.poker_hands["Flush House"]) then
			return {
				message = localize({ type = "variable", key = "a_chips", vars = { card.ability.t_chips } }),
				colour = G.C.BLUE,
				chip_mod = card.ability.t_chips,
			}
		end
	end,
	in_pool = function(self)
		if G.GAME.hands["Flush House"].played > 0 then
			return true
		end
		return false
	end,
}
local discreet = {
	object_type = "Joker",
	name = "cry-Discreet Joker",
	key = "discreet",
	pos = { x = 6, y = 6 },
	effect = "Cry Type Chips",
	config = { t_chips = 240, type = "Flush Five" },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.t_chips, localize(card.ability.type, "poker_hands") } }
	end,
	atlas = "atlasthree",
	rarity = 1,
	cost = 4,
	blueprint_compat = true,
	calculate = function(self, card, context)
		if context.cardarea == G.jokers and not context.before and not context.after and context.poker_hands and next(context.poker_hands["Flush Five"]) then
			return {
				message = localize({ type = "variable", key = "a_chips", vars = { card.ability.t_chips } }),
				colour = G.C.BLUE,
				chip_mod = card.ability.t_chips,
			}
		end
	end,
	in_pool = function(self)
		if G.GAME.hands["Flush Five"].played > 0 then
			return true
		end
		return false
	end,
}
local coin = {
	object_type = "Joker",
	name = "cry-coin",
	key = "coin",
	pos = { x = 0, y = 2 },
	config = { extra = { money = 1 } },
	rarity = 1,
	cost = 5,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.money, center.ability.extra.money * 10 } }
	end,
	atlas = "atlasthree",
	calculate = function(self, card, context)
		if context.selling_card and context.card.ability.set == "Joker" then
			local option = pseudorandom(pseudoseed("coin"), card.ability.extra.money, card.ability.extra.money * 10)
			ease_dollars(option)
			card_eval_status_text(
				context.blueprint_card or card,
				"extra",
				nil,
				nil,
				nil,
				{ message = localize("$") .. option, colour = G.C.MONEY, delay = 0.45 }
			)
			return nil, true
		end
	end,
}
local wheelhope = {
	object_type = "Joker",
	name = "cry-wheelhope",
	key = "wheelhope",
	pos = { x = 1, y = 1 },
	config = { extra = { extra = 0.5, x_mult = 1 } },
	rarity = 2,
	cost = 5,
	perishable_compat = false,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, center)
		info_queue[#info_queue + 1] = G.P_CENTERS.c_wheel_of_fortune
		return { vars = { center.ability.extra.extra, center.ability.extra.x_mult } }
	end,
	atlas = "atlasthree",
	calculate = function(self, card, context)
		if
			context.cardarea == G.jokers
			and (card.ability.extra.x_mult > 1)
			and not context.before
			and not context.after
		then
			return {
				message = localize({ type = "variable", key = "a_xmult", vars = { card.ability.extra.x_mult } }),
				Xmult_mod = card.ability.extra.x_mult,
			}
		end
		if context.consumeable then
			if
				context.consumeable.ability.name == "The Wheel of Fortune"
				and not context.consumeable.cry_wheel_success
			then
				card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.extra
				card_eval_status_text(
					card,
					"extra",
					nil,
					nil,
					nil,
					{ message = localize({ type = "variable", key = "a_xmult", vars = { card.ability.extra.x_mult } }) }
				)
				return nil, true
			end
		end
	end,
}
local oldblueprint = {
	object_type = "Joker",
	name = "cry-oldblueprint",
	key = "oldblueprint",
	pos = { x = 2, y = 1 },
	config = { extra = { odds = 4 } },
	rarity = 1,
	cost = 5,
	loc_vars = function(self, info_queue, center)
		return { vars = { "" .. (G.GAME and G.GAME.probabilities.normal or 1), center.ability.extra.odds } }
	end,
	blueprint_compat = true,
	eternal_compat = false,
	atlas = "atlasthree",
	calculate = function(self, card, context)
		if
			context.end_of_round
			and not context.individual
			and not context.repetition
			and not context.blueprint
			and not context.retrigger_joker
		then
			if pseudorandom("oldblueprint") < G.GAME.probabilities.normal / card.ability.extra.odds then
				G.E_MANAGER:add_event(Event({
					func = function()
						play_sound("tarot1")
						card.T.r = -0.2
						card:juice_up(0.3, 0.4)
						card.states.drag.is = true
						card.children.center.pinch.x = true
						G.E_MANAGER:add_event(Event({
							trigger = "after",
							delay = 0.3,
							blockable = false,
							func = function()
								G.jokers:remove_card(card)
								card:remove()
								card = nil
								return true
							end,
						}))
						return true
					end,
				}))
				return {
					message = { localize("k_extinct_ex") },
					colour = G.C.FILTER,
				}
			else
				return {
					message = { localize("k_safe_ex") },
					colour = G.C.FILTER,
				}
			end
		end
		local other_joker = nil
		for i = 1, #G.jokers.cards do
			if G.jokers.cards[i] == card then
				other_joker = G.jokers.cards[i + 1]
			end
		end
		if other_joker and other_joker ~= self then
			context.blueprint = (context.blueprint and (context.blueprint + 1)) or 1
			context.blueprint_card = context.blueprint_card or card

			if context.blueprint > #G.jokers.cards + 1 then
				return
			end

			local other_joker_ret, trig = other_joker:calculate_joker(context)
			if other_joker_ret or trig then
				if not other_joker_ret then
					other_joker_ret = {}
				end
				other_joker_ret.card = context.blueprint_card or card
				other_joker_ret.colour = G.C.BLUE
				other_joker_ret.no_callback = true
				return other_joker_ret
			end
		end
	end,
}
local night = {
	object_type = "Joker",
	name = "cry-night",
	key = "night",
	config = { extra = { mult = 3 } },
	pos = { x = 3, y = 1 },
	rarity = 3,
	cost = 6,
	eternal_compat = false,
	blueprint_compat = true,
	atlas = "atlasthree",
	loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.mult } }
	end,
	calculate = function(self, card, context)
		if
			context.cardarea == G.jokers
			and not context.before
			and not context.after
			and G.GAME.current_round.hands_left == 0
		then
			if card.ability.extra.mult > 1 then
				return {
					message = localize{type='variable',key='a_powmult',vars={card.ability.extra.mult}},
					Emult_mod = card.ability.extra.mult,
					colour = G.C.DARK_EDITION,
				}
			end
		elseif context.cardarea == G.jokers and context.after and not context.blueprint and not context.retrigger_joker then
			if G.GAME.current_round.hands_left <= 0 then
				G.E_MANAGER:add_event(Event({
					func = function()
						play_sound("tarot1")
						card.T.r = -0.2
						card:juice_up(0.3, 0.4)
						card.states.drag.is = true
						card.children.center.pinch.x = true
						G.E_MANAGER:add_event(Event({
							trigger = "after",
							delay = 0.3,
							blockable = false,
							func = function()
								G.jokers:remove_card(card)
								card:remove()
								card = nil
								return true
							end,
						}))
						return true
					end,
				}))
				return {
					message = localize("k_extinct_ex"),
					colour = G.C.FILTER,
				}
			elseif G.GAME.current_round.hands_left <= 1 then
				local eval = function(card) return G.GAME.current_round.hands_left <= 1 and not G.RESET_JIGGLES end
                        	juice_card_until(card, eval, true)
			end
		elseif context.first_hand_drawn and not context.blueprint and not context.retrigger_joker then
			if next(find_joker('cry-panopticon')) then
				local eval = function(card) return G.GAME.current_round.hands_played == 0 and not G.RESET_JIGGLES end
                        	juice_card_until(card, eval, true)
			end
		end
	end,
}
local busdriver = {
	object_type = "Joker",
	name = "cry-busdriver",
	key = "busdriver",
	config = { extra = { mult = 50, odds = 4 } },
	pos = { x = 5, y = 1 },
	immune_to_chemach = true,
	rarity = 2,
	cost = 7,
	atlas = "atlasthree",
	blueprint_compat = true,
	loc_vars = function(self, info_queue, center)
		return {
			vars = {
				"" .. ((G.GAME and G.GAME.probabilities.normal or 1) * 3),
				center.ability.extra.mult,
				center.ability.extra.odds,
			},
		}
	end,
	calculate = function(self, card, context)
		if
			context.cardarea == G.jokers
			and (card.ability.extra.mult > 0)
			and not context.before
			and not context.after
		then
			if pseudorandom("busdriver") < G.GAME.probabilities.normal / card.ability.extra.odds * 3 then
				return {
					message = localize({ type = "variable", key = "a_mult", vars = { card.ability.extra.mult } }),
					mult_mod = card.ability.extra.mult,
					colour = G.C.MULT,
				}
			else
				return {
					message = localize({ type = "variable", key = "a_mult_minus", vars = { card.ability.extra.mult } }),
					mult_mod = (card.ability.extra.mult * -1),
					colour = G.C.MULT,
				}
			end
		end
	end,
}
local translucent = {
	object_type = "Joker",
	name = "cry-translucent Joker",
	key = "translucent",
	pos = { x = 5, y = 2 },
	rarity = 1,
	cost = 4,
	eternal_compat = false,
	atlas = "atlasthree",
	calculate = function(self, card, context)
		if context.selling_self and not (context.retrigger_joker or context.blueprint) then
			local jokers = {}
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] ~= card and not G.jokers.cards[i].debuff then
					jokers[#jokers + 1] = G.jokers.cards[i]
				end
			end
			if #jokers > 0 then
				if #G.jokers.cards <= G.jokers.config.card_limit then
					card_eval_status_text(card, "extra", nil, nil, nil, { message = localize("k_duplicated_ex") })
					local chosen_joker = pseudorandom_element(jokers, pseudoseed("trans"))
					local _card =
						copy_card(chosen_joker, nil, nil, nil, chosen_joker.edition and chosen_joker.edition.negative)
					_card:add_to_deck()
					_card:set_banana(true)
					_card.ability.perishable = true -- Done manually to bypass perish compat
					_card.ability.perish_tally = G.GAME.perishable_rounds
					G.jokers:emplace(_card)
					return nil, true
				else
					card_eval_status_text(card, "extra", nil, nil, nil, { message = localize("k_no_room_ex") })
				end
			else
				card_eval_status_text(card, "extra", nil, nil, nil, { message = localize("k_no_other_jokers") })
			end
		end
	end,
}
local morse = {
	object_type = "Joker",
	name = "cry-morse",
	key = "morse",
	pos = { x = 5, y = 1 },
	config = { extra = { bonus = 2, money = 1 } },
	rarity = 1,
	cost = 5,
	perishable_compat = false,
	blueprint_compat = false,
	loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.bonus, center.ability.extra.money } }
	end,
	atlas = "atlastwo",
	calculate = function(self, card, context)
		if context.selling_card and context.card.edition and not context.blueprint then
			card.ability.extra.money = card.ability.extra.money + card.ability.extra.bonus
			return {
				card_eval_status_text(card, "extra", nil, nil, nil, {
					message = localize("k_upgrade_ex"),
					colour = G.C.MONEY,
				}),
			}
		end
	end,
	calc_dollar_bonus = function(self, card)
		if card.ability.extra.money > 0 then
			return card.ability.extra.money
		end
	end,
}
local membershipcard = {
	object_type = "Joker",
	name = "cry-membershipcard",
	key = "membershipcard",
	config = { extra = { Xmult_mod = 0.1 } },
	pos = { x = 6, y = 2 },
	soul_pos = { x = 6, y = 1 },
	rarity = 4,
	cost = 20,
	blueprint_compat = true,
	atlas = "atlasthree",
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.Xmult_mod, card.ability.extra.Xmult_mod * GLOBAL_cry_member_count } }
	end,
	calculate = function(self, card, context)
		if
			context.cardarea == G.jokers
			and not context.before
			and not context.after
			and card.ability.extra.Xmult_mod * GLOBAL_cry_member_count > 1
		then
			return {
				message = localize({
					type = "variable",
					key = "a_xmult",
					vars = { card.ability.extra.Xmult_mod * GLOBAL_cry_member_count },
				}),
				Xmult_mod = card.ability.extra.Xmult_mod * GLOBAL_cry_member_count,
			}
		end
	end,
}
local kscope = {
	object_type = "Joker",
	name = "cry-kscope",
	key = "kscope",
	pos = { x = 3, y = 4 },
	rarity = 3,
	cost = 7,
	atlas = "atlasthree",
	calculate = function(self, card, context)
		if context.end_of_round and G.GAME.blind.boss and not context.individual and not context.repetition then
			local eligiblejokers = {}
			for k, v in pairs(G.jokers.cards) do
				if v.ability.set == "Joker" and not v.edition and v ~= card then
					table.insert(eligiblejokers, v)
				end
			end
			if #eligiblejokers > 0 then
				--you just lost the game
				local eligible_card =
					pseudorandom_element(eligiblejokers, pseudoseed("nevergonnagiveyouupnevergonnaletyoudown"))
				local edition = { polychrome = true }
				eligible_card:set_edition(edition, true)
				check_for_unlock({ type = "have_edition" })
			end
		end
	end,
}
local cryptidmoment = {
	object_type = "Joker",
	name = "cry_cryptidmoment",
	key = "cryptidmoment",
	pos = { x = 6, y = 0 },
	config = { extra = { money = 1 } },
	loc_vars = function(self, info_queue, center)
		return { vars = { math.max(1, math.floor(center.ability.extra.money)) } }
	end,
	rarity = 1,
	cost = 4,
	eternal_compat = false,
	atlas = "atlasthree",
	calculate = function(self, card, context)
		if context.selling_self and not context.blueprint then
			for k, v in ipairs(G.jokers.cards) do
				if v.set_cost then
					v.ability.extra_value = (v.ability.extra_value or 0)
						+ math.max(1, math.floor(card.ability.extra.money))
					v:set_cost()
				end
			end
			card_eval_status_text(card, "extra", nil, nil, nil, { message = localize("k_val_up"), colour = G.C.MONEY })
		end
	end,
}
local flipside = {
	object_type = "Joker",
	name = "cry-Flip Side",
	key = "flip_side",
	pos = { x = 1, y = 0 },
	rarity = 2,
	cost = 7,
	atlas = "placeholders",
	no_dbl = true,
	loc_vars = function(self, info_queue)
		info_queue[#info_queue + 1] = G.P_CENTERS.e_cry_double_sided
	end,
	add_to_deck = function(self, card, from_debuff)
		for i = 1, #G.jokers.cards do
			if G.jokers.cards[i].edition and G.jokers.cards[i].edition.cry_double_sided then
				G.jokers.cards[i]:init_dbl_side()
				G.jokers.cards[i]:remove_from_deck(true)
				G.jokers.cards[i].dbl_side:add_to_deck(true)
			end
		end
	end,
	remove_from_deck = function(self, card, from_debuff)
		for i = 1, #G.jokers.cards do
			if G.jokers.cards[i].edition and G.jokers.cards[i].edition.cry_double_sided then
				G.jokers.cards[i]:init_dbl_side()
				G.jokers.cards[i]:add_to_deck(true)
				G.jokers.cards[i].dbl_side:remove_from_deck(true)
			end
		end
	end,
	cry_credits = {
		colour = G.C.CRY_JOLLY,
		text = {
			"Jolly Open Winner",
			"Axolotolus",
		},
	},
	calculate = function(self, card, context)
		if context.retrigger_joker_check and not context.retrigger_joker and context.other_card ~= self then
			if context.other_context.dbl_side then
				return {
					message = localize("k_again_ex"),
					repetitions = 1,
					card = card,
				}
			else
				return nil, true
			end
		end
	end,

}
local oldinvisible = {
	object_type = "Joker",
	name = "cry-Old Invisible Joker",
	key = "oldinvisible",
	pos = { x = 4, y = 4 },
	config = { extra = 0 },
	rarity = 4,
	cost = 20,
	atlas = "atlasthree",
	loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra } }
	end,
	calculate = function(self, card, context)
		if context.selling_card and context.card.ability.set == "Joker"
		and not context.blueprint and not context.retrigger_joker then
			if card.ability.extra == 3 then
				card.ability.extra = 0
				local eligibleJokers = {}
				for i = 1, #G.jokers.cards do
					if G.jokers.cards[i].ability.name ~= card.ability.name and G.jokers.cards[i] ~= context.card then
						eligibleJokers[#eligibleJokers + 1] = G.jokers.cards[i]
					end
				end
				if #eligibleJokers > 0 then
					G.E_MANAGER:add_event(Event({
						func = function()
							local card = copy_card(pseudorandom_element(eligibleJokers, pseudoseed("cry_oldinvis")), nil)
							card:add_to_deck()
							G.jokers:emplace(card)
							return true
						end,
					}))
					card_eval_status_text(
						context.blueprint_card or card,
						"extra",
						nil,
						nil,
						nil,
						{ message = localize("k_duplicated_ex") }
					)
					return nil, true
				else
                    			card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_no_other_jokers')})
                		end
				return
			else
				card.ability.extra = card.ability.extra + 1
				if card.ability.extra == 3 then
					local eval = function(card) return (card.ability.extra == 3) end
                                	juice_card_until(card, eval, true)
				end
				return {
					card_eval_status_text(card, "extra", nil, nil, nil, {
						message = card.ability.extra .. "/4",
						colour = G.C.FILTER,
					}),
				}
			end
		end
	end,
}
local fractal = {
	object_type = "Joker",
	name = "cry-FractalFingers",
	key = "fractal",
	pos = { x = 6, y = 4 },
	config = { extra = 2 },
	rarity = 3,
	cost = 7,
	atlas = "atlasthree",
	loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra } }
	end,
	add_to_deck = function(self, card, from_debuff)
		card.ability.extra = math.floor(card.ability.extra)
		G.hand.config.highlighted_limit = G.hand.config.highlighted_limit + card.ability.extra
	end,
	remove_from_deck = function(self, card, from_debuff)
		G.hand.config.highlighted_limit = G.hand.config.highlighted_limit - card.ability.extra
		if G.hand.config.highlighted_limit < 5 then G.hand.config.highlighted_limit = 5 end
		G.hand:unhighlight_all()
	end,
}
local kidnap = {
	object_type = "Joker",
	name = "cry-kidnap",
	key = "kidnap",
	pos = { x = 1, y = 2 },
	config = {
		extra = { money = 0, money_mod = 3 },
		jolly = { t_mult = 8, type = "Pair" },
		zany = { t_mult = 12, type = "Three of a Kind" },
		mad = { t_mult = 10, type = "Two Pair" },
		crazy = { t_mult = 12, type = "Straight" },
		droll = { t_mult = 10, type = "Flush" },
	},
	rarity = 1,
	cost = 4,
	blueprint_compat = false,
	loc_vars = function(self, info_queue, center)
		info_queue[#info_queue + 1] = {
			set = "Joker",
			key = "j_jolly",
			specific_vars = { self.config.jolly.t_mult, localize(self.config.jolly.type, "poker_hands") },
		}
		info_queue[#info_queue + 1] = {
			set = "Joker",
			key = "j_zany",
			specific_vars = { self.config.zany.t_mult, localize(self.config.zany.type, "poker_hands") },
		}
		info_queue[#info_queue + 1] = {
			set = "Joker",
			key = "j_mad",
			specific_vars = { self.config.mad.t_mult, localize(self.config.mad.type, "poker_hands") },
		}
		info_queue[#info_queue + 1] = {
			set = "Joker",
			key = "j_crazy",
			specific_vars = { self.config.crazy.t_mult, localize(self.config.crazy.type, "poker_hands") },
		}
		info_queue[#info_queue + 1] = {
			set = "Joker",
			key = "j_droll",
			specific_vars = { self.config.droll.t_mult, localize(self.config.droll.type, "poker_hands") },
		} 
		return { vars = { center.ability.extra.money_mod, center.ability.extra.money } }
	end,
	atlas = "atlasone",
	calculate = function(self, card, context) 
		if
			context.selling_card
			and (
				(
					context.card.ability.name == "Sly Joker"
					or context.card.ability.name == "Wily Joker"
					or context.card.ability.name == "Clever Joker"
					or context.card.ability.name == "Devious Joker"
					or context.card.ability.name == "Crafty Joker"
				)
				or context.card.ability.effect == "Type Mult"
				or context.card.ability.effect == "Cry Type Mult"
				or context.card.ability.effect == "Cry Type Chips"
				--[[
				Other developers can add effect == "Boost Kidnapping"
                to their joker config if they want it to boost kidnapping when sold
				]]--
				or context.card.ability.effect == "Boost Kidnapping"
			)
			and not context.blueprint
		then
			card.ability.extra.money = card.ability.extra.money + card.ability.extra.money_mod
			return {
				card_eval_status_text(card, "extra", nil, nil, nil, {
					message = localize("k_upgrade_ex"),
					colour = G.C.MONEY,
				}),
			}
		end
	end,
	calc_dollar_bonus = function(self, card)
		if card.ability.extra.money > 0 then
			return card.ability.extra.money
		end
	end,
}

local miscitems =  {
	jimball_sprite,
	dropshot,
	happyhouse,
	maximized,
	potofjokes,
	queensgambit,
	wee_fib,
	compound_interest,
	whip,
	pickle,
	triplet_rhythm,
	booster,
	chili_pepper,
	lucky_joker,
	cursor,
	cube,
	big_cube,
	nice,
	sus,
	chad,
	jimball,
	luigi,
	waluigi,
	mario,
	wario,
	eternalflame,
	seal_the_deal,
	fspinner,
	krustytheclown,
	blurred,
	gardenfork,
	lightupthenight,
	nosound,
	antennastoheaven,
	hunger,
	weegaming,
	redbloon,
	apjoker,
	maze,
	panopticon,
	magnet,
	unjust_dagger,
	monkey_dagger,
	pirate_dagger,
	mondrian,
	sapling,
	spaceglobe,
	happy,
	meteor,
	exoplanet,
	stardust,
	rnjoker,
	filler,
	duos,
	home,
	nuts,
	quintet,
	unity,
	swarm,
	coin,
	wheelhope,
	night,
	busdriver,
	oldblueprint,
	morse,
	translucent,
	membershipcard,
	kscope,
	cryptidmoment,
	oldinvisible,
	fractal,
	giggly,
	nutty,
	manic,
	silly,
	delirious,
	wacky,
	kooky,
	dubious,
	shrewd,
	tricksy,
	foxy,
	savvy,
	subtle,
	discreet,
	kidnap,
}
if Cryptid.enabled["Misc."] then
	miscitems[#miscitems+1] = flipside
end
return {
	name = "Misc. Jokers",
	init = function()
		cry_enable_jokers = true
		--Dropshot Patches
		local gigo = Game.init_game_object
		function Game:init_game_object()
			local g = gigo(self)
			g.current_round.cry_dropshot_card = { suit = "Spades" }
			return g
		end
		local rcc = reset_castle_card
		function reset_castle_card()
			rcc()
			if not G.GAME.current_round.cry_dropshot_card then
				G.GAME.current_round.cry_dropshot_card = {}
			end
			G.GAME.current_round.cry_dropshot_card.suit = "Spades"
			local valid_castle_cards = {}
			for k, v in ipairs(G.playing_cards) do
				if v.ability.effect ~= "Stone Card" then
					valid_castle_cards[#valid_castle_cards + 1] = v
				end
			end
			if valid_castle_cards[1] then
				local castle_card =
					pseudorandom_element(valid_castle_cards, pseudoseed("cry_dro" .. G.GAME.round_resets.ante))
				if not G.GAME.current_round.cry_dropshot_card then
					G.GAME.current_round.cry_dropshot_card = {}
				end
				G.GAME.current_round.cry_dropshot_card.suit = castle_card.base.suit
			end
		end

		--Maximized Patches
		local cgi_ref = Card.get_id
		override_maximized = false
		function Card:get_id()
			local id = cgi_ref(self)
			if id == nil then
				id = 10
			end
			if next(find_joker("cry-Maximized")) and not override_maximized then
				if id >= 2 and id <= 10 then
					id = 10
				end
				if id >= 11 and id <= 13 or next(find_joker("Pareidolia")) then
					id = 13
				end
			end
			return id
		end
		--Fix issues with View Deck and Maximized
		local gui_vd = G.UIDEF.view_deck
		function G.UIDEF.view_deck(unplayed_only)
			override_maximized = true
			local ret_value = gui_vd(unplayed_only)
			override_maximized = false
			return ret_value
		end

		--Cube Patches
		local sc = Card.set_cost
		function Card:set_cost()
			sc(self)
			if self.ability.name == "cry-Cube" then
				self.cost = -27
			end
			if self.ability.name == "cry-Big Cube" then
				self.cost = 27
			end
		end
		--Jimball Patches
		local upd = Game.update
		cry_jimball_dt = 0
		function Game:update(dt)
			upd(self, dt)
			cry_jimball_dt = cry_jimball_dt + dt
			if G.P_CENTERS and G.P_CENTERS.j_cry_jimball and cry_jimball_dt > 0.1 then
				cry_jimball_dt = 0
				local obj = G.P_CENTERS.j_cry_jimball
				if obj.pos.x == 5 and obj.pos.y == 6 then
					obj.pos.x = 0
					obj.pos.y = 0
				elseif obj.pos.x < 8 then
					obj.pos.x = obj.pos.x + 1
				elseif obj.pos.y < 6 then
					obj.pos.x = 0
					obj.pos.y = obj.pos.y + 1
				end
			end
		end
	end,
	items = miscitems,
}
