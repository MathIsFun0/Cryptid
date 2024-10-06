local supercell = {
	object_type = "Joker",
	name = "cry-supercell",
	key = "supercell",
	config = { extra = { stat1 = 15, stat2 = 2, money = 3 } },
	pos = { x = 5, y = 1 },
	rarity = "cry_epic",
	cost = 14,
	blueprint_compat = true,
	atlas = "atlasepic",
	loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.stat1, center.ability.extra.stat2, center.ability.extra.money } }
	end,
	calculate = function(self, card, context)
		if context.cardarea == G.jokers and not context.before and not context.after then
			if card.ability.extra.stat2 > 1 then --misprint deck moment
				return {
					message = localize("cry_gaming_ex"),
					chip_mod = card.ability.extra.stat1,
					mult_mod = card.ability.extra.stat1,
					Xchip_mod = card.ability.extra.stat2,
					Xmult_mod = card.ability.extra.stat2,
				}
			end
		end
	end,
	calc_dollar_bonus = function(self, card)
		if card.ability.extra.money > 0 then
			return card.ability.extra.money
		end
	end,
	add_to_deck = function(self, card, from_debuff)
		if not from_debuff then
			play_sound("cry_studiofromhelsinki")
		end
	end,
}
local membershipcardtwo = {
	object_type = "Joker",
	name = "cry-membershipcardtwo",
	key = "membershipcardtwo",
	config = { extra = { chips = 1 } },
	pos = { x = 5, y = 4 },
	rarity = "cry_epic",
	cost = 17,
	blueprint_compat = true,
	atlas = "atlasepic",
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chips, card.ability.extra.chips * GLOBAL_cry_member_count } }
	end,
	calculate = function(self, card, context)
		if
			context.cardarea == G.jokers
			and not context.before
			and not context.after
			and card.ability.extra.chips > 0
		then
			return {
				message = localize({
					type = "variable",
					key = "a_chips",
					vars = { card.ability.extra.chips * GLOBAL_cry_member_count },
				}),
				chip_mod = card.ability.extra.chips * GLOBAL_cry_member_count,
			}
		end
	end,
}
local googol_play = {
	object_type = "Joker",
	name = "cry-Googol Play Card",
	key = "googol_play",
	config = { extra = { Xmult = 1e100, odds = 8 } },
	pos = { x = 3, y = 0 },
	immune_to_chemach = true,
	rarity = "cry_epic",
	cost = 10,
	blueprint_compat = true,
	atlas = "atlasepic",
	soul_pos = { x = 10, y = 0, extra = { x = 4, y = 0 } },
	loc_vars = function(self, info_queue, center)
		return {
			vars = {
				"" .. (G.GAME and G.GAME.probabilities.normal or 1),
				center.ability.extra.odds,
				center.ability.extra.Xmult,
			},
		}
	end,
	calculate = function(self, card, context)
		if
			context.cardarea == G.jokers
			and not context.before
			and not context.after
			and pseudorandom("cry_googol_play") < G.GAME.probabilities.normal / card.ability.extra.odds
		then
			return {
				message = localize({ type = "variable", key = "a_xmult", vars = { card.ability.extra.Xmult } }),
				Xmult_mod = card.ability.extra.Xmult,
			}
		end
	end,
}
local sync_catalyst = {
	object_type = "Joker",
	name = "cry-Sync Catalyst",
	key = "sync_catalyst",
	pos = { x = 5, y = 2 },
	rarity = "cry_epic",
	cost = 12,
	blueprint_compat = true,
	atlas = "atlasepic",
	calculate = function(self, card, context)
		if context.cardarea == G.jokers and not context.before and not context.after then
			local tot = hand_chips + mult
			if not tot.array or #tot.array < 2 or tot.array[2] < 2 then --below eXeY notation
				hand_chips = mod_chips(math.floor(tot / 2))
				mult = mod_mult(math.floor(tot / 2))
			else
				if hand_chips > mult then
					tot = hand_chips
				else
					tot = mult
				end
				hand_chips = mod_chips(tot)
				mult = mod_chips(tot)
			end
			update_hand_text({ delay = 0 }, { mult = mult, chips = hand_chips })
			return {
				message = localize("k_balanced"),
				colour = { 0.8, 0.45, 0.85, 1 },
			}
		end
	end,
}
local negative = {
	object_type = "Joker",
	name = "cry-Negative Joker",
	key = "negative",
	pos = { x = 1, y = 3 },
	config = { extra = 4 },
	rarity = "cry_epic",
	cost = 10,
	atlas = "atlasepic",
	loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra } }
	end,
	add_to_deck = function(self, card, from_debuff)
		G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra
	end,
	remove_from_deck = function(self, card, from_debuff)
		G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra
	end,
}
local canvas = {
	object_type = "Joker",
	name = "cry-Canvas",
	key = "canvas",
	immune_to_chemach = true,
	pos = { x = 2, y = 1 },
	config = { num_retriggers = 0 },
	rarity = "cry_epic",
	cost = 18,
	blueprint_compat = true,
	atlas = "atlasepic",
	calculate = function(self, card, context)
		if context.retrigger_joker_check and not context.retrigger_joker then
			self.config.num_retriggers = 0
			for i = 1, #G.jokers.cards do
				if
					card.T.x + card.T.w / 2 < G.jokers.cards[i].T.x + G.jokers.cards[i].T.w / 2
					and G.jokers.cards[i].config.center.rarity ~= 1
				then
					self.config.num_retriggers = self.config.num_retriggers + 1
				end
			end
			if card.T.x + card.T.w / 2 > context.other_card.T.x + context.other_card.T.w / 2 then
				return {
					message = localize("k_again_ex"),
					repetitions = self.config.num_retriggers,
					card = card,
				}
			end
		end
	end,
}
local error_joker = {
	object_type = "Joker",
	name = "cry-Error",
	key = "error",
	pos = { x = 4, y = 2 },
	config = { extra = { sell_rounds = 0, active = false } },
	immune_to_chemach = true,
	rarity = "cry_epic",
	cost = 1,
	blueprint_compat = false,
	eternal_compat = false,
	atlas = "atlasepic",
	add_to_deck = function(self, card, from_debuff)
		if G.GAME.modifiers.cry_force_edition and not G.GAME.modifiers.cry_force_edition_from_deck then
			G.GAME.modifiers.cry_force_edition_from_deck = G.GAME.modifiers.cry_force_edition
		elseif not G.GAME.modifiers.cry_force_edition_from_deck then
			if Cryptid.enabled["Misc."] then
				G.GAME.modifiers.cry_force_edition = "cry_glitched"
			else
				G.GAME.modifiers.cry_force_edition = "foil"
			end
			G.GAME.modifiers.cry_force_edition_from_deck = "Nope!"
		end
	end,
	remove_from_deck = function(self, card, from_debuff)
		if G.GAME.modifiers.cry_force_edition_from_deck ~= "Nope!" then
			G.GAME.modifiers.cry_force_edition = G.GAME.modifiers.cry_force_edition_from_deck
		else
			G.GAME.modifiers.cry_force_edition = nil
		end
	end,
	calculate = function(self, card, context)
		if
			context.end_of_round
			and not context.blueprint
			and not context.repetition
			and not context.individual
			and not card.ability.extra.active
		then
			if card.ability.extra.sell_rounds == 0 then
				card.ability.extra.sell_rounds = math.floor(pseudorandom(pseudoseed("cry_error")) * 10 + 1)
			end
			card.ability.extra.sell_rounds = card.ability.extra.sell_rounds - 1
			if card.ability.extra.sell_rounds == 0 then
				card.ability.extra.active = true
				local eval = function(card) return not card.REMOVED end
                        	juice_card_until(card, eval, true)
			else
				return {
					message = "???",
					colour = G.C.BLACK,
				}
			end
		end
		if
			context.selling_self
			and card.ability.extra.active
			and not context.retrigger_joker
			and not context.blueprint
		then
			local eval = function(card)
				return (card and card.ability and card.ability.loyalty_remaining == 0) and not G.RESET_JIGGLES
			end
			juice_card_until(card, eval, true)
			local jokers = {}
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i].ability.name ~= "cry-Error" then
					jokers[#jokers + 1] = G.jokers.cards[i]
				end
			end
			for i = 1, #jokers do
				local card = copy_card(jokers[i])
				card:add_to_deck()
				G.jokers:emplace(card)
			end
			return nil, true
		end
	end,
}
local m = {
	object_type = "Joker",
	name = "cry-m",
	key = "m",
	pos = { x = 3, y = 1 },
	config = { extra = { extra = 13, x_mult = 1 }, jolly = { t_mult = 8, type = "Pair" } },
	rarity = "cry_epic",
	cost = 13,
	effect = "M Joker",
	perishable_compat = false,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, center)
		info_queue[#info_queue + 1] = {
			set = "Joker",
			key = "j_jolly",
			specific_vars = { self.config.jolly.t_mult, localize(self.config.jolly.type, "poker_hands") },
		}
		return { vars = { center.ability.extra.extra, center.ability.extra.x_mult } }
	end,
	atlas = "atlasepic",
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
			context.selling_card
			and (context.card.ability.name == "Jolly Joker" or (context.card.edition and context.card.edition.key == "e_cry_m"))
			and not context.blueprint
		then
			card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.extra
			if not context.retrigger_joker then
				--This doesn't display the correct amount of mult if retriggered it display the amount from the first retrigger instead of the final one
				--But I would rather have this than constant card_eval_status_text spam
				--If anyone knows a solution feel free to do a pr xd
				card_eval_status_text(
					card,
					"extra",
					nil,
					nil,
					nil,
					{ message = localize({ type = "variable", key = "a_xmult", vars = { card.ability.extra.x_mult } }) }
				)
			end
			return nil, true
		end
	end,
	post_process = function(self)
		if get_m_retriggers then
			local vc = self.calculate
			self.calculate = function(self, card, context)
				local ret, trig = vc(self, card, context)
				local reps = get_m_retriggers(self, card, context)
				if context.retrigger_joker_check and context.other_card == card and reps > 0 then
					return {
						message = localize("k_again_ex"),
						repetitions = reps + (ret and ret.repetitions or 0),
						card = card,
					}
				end
				return ret, trig
			end
		end
	end
}
local M = {
	object_type = "Joker",
	name = "cry-M",
	key = "M",
	pos = { x = 0, y = 0 },
	config = { jolly = { t_mult = 8, type = "Pair" } },
	rarity = "cry_epic",
	effect = "M Joker",
	cost = 13,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, center)
		info_queue[#info_queue + 1] = {
			set = "Joker",
			key = "j_jolly",
			specific_vars = { self.config.jolly.t_mult, localize(self.config.jolly.type, "poker_hands") },
		}
		if not center.edition or (center.edition and not center.edition.negative) then
			info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
		end
	end,
	atlas = "atlasepic",
	calculate = function(self, card, context)
		if context.setting_blind and not (context.blueprint_card or self).getting_sliced then
			local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_jolly")
			card:set_edition({
				negative = true,
			})
			card:add_to_deck()
			G.jokers:emplace(card)
			return nil, true
		end
	end,
	post_process = function(self)
		if get_m_retriggers then
			local vc = self.calculate
			self.calculate = function(self, card, context)
				local ret, trig = vc(self, card, context)
				local reps = get_m_retriggers(self, card, context)
				if context.retrigger_joker_check and context.other_card == card and reps > 0 then
					return {
						message = localize("k_again_ex"),
						repetitions = reps + (ret and ret.repetitions or 0),
						card = card,
					}
				end
				return ret, trig
			end
		end
	end
}
local boredom = {
	object_type = "Joker",
	name = "cry-Boredom",
	key = "boredom",
	pos = { x = 1, y = 0 },
	config = { extra = { odds = 2 } },
	immune_to_chemach = true,
	rarity = "cry_epic",
	cost = 14,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, center)
		return { vars = { "" .. (G.GAME and G.GAME.probabilities.normal or 1), center.ability.extra.odds } }
	end,
	atlas = "atlasepic",
	calculate = function(self, card, context)
		if context.retrigger_joker_check and not context.retrigger_joker and context.other_card ~= self then
			if pseudorandom("cry_boredom_joker") < G.GAME.probabilities.normal / card.ability.extra.odds then
				return {
					message = localize("k_again_ex"),
					repetitions = 1,
					card = card,
				}
			else
				return nil, true
			end
		end
		if
			context.repetition
			and context.cardarea == G.play
			and pseudorandom("cry_boredom_card") < G.GAME.probabilities.normal / card.ability.extra.odds
		then
			return {
				message = localize("k_again_ex"),
				repetitions = 1,
				card = card,
			}
		end
	end,
}
local number_blocks = {
	object_type = "Joker",
	name = "cry-Number Blocks",
	key = "number_blocks",
	config = { extra = { money_mod = 1, money = 1 } },
	pos = { x = 0, y = 2 },
	rarity = "cry_epic",
	cost = 14,
	atlas = "atlasepic",
	loc_vars = function(self, info_queue, center)
		return {
			vars = {
				center.ability.extra.money,
				center.ability.extra.money_mod,
				localize(G.GAME.current_round.cry_nb_card and G.GAME.current_round.cry_nb_card.rank or "Ace", "ranks"),
			},
		}
	end,
	calculate = function(self, card, context)
		if
			context.individual
			and not context.end_of_round
			and context.cardarea == G.hand
			and not context.blueprint
			and not context.before
			and not context.after
			and context.other_card:get_id() == G.GAME.current_round.cry_nb_card.id
		then
			if context.other_card.debuff then
				return {
					message = localize("k_debuffed"),
					colour = G.C.RED,
					card = card,
				}
			else
				card.ability.extra.money = card.ability.extra.money + card.ability.extra.money_mod
				card_eval_status_text(card, "extra", nil, nil, nil, { message = localize("k_upgrade_ex") })
				return nil, true
			end
		end
	end,
	calc_dollar_bonus = function(self, card)
		if card.ability.extra.money > 0 then
			return card.ability.extra.money
		end
	end,
}
local double_scale = {
	object_type = "Joker",
	name = "cry-Double Scale",
	key = "Double Scale",
	pos = { x = 0, y = 3 },
	rarity = "cry_epic",
	cost = 18,
	atlas = "atlasepic",
	--todo: support jokers that scale multiple variables
	cry_scale_mod = function(self, card, joker, orig_scale_scale, true_base, orig_scale_base, new_scale_base)
		return orig_scale_scale + true_base
	end,
}
local oldcandy = {
	object_type = "Joker",
	name = "cry_oldcandy",
	key = "oldcandy",
	pos = { x = 4, y = 1 },
	config = { extra = { hand_size = 3 } },
	loc_vars = function(self, info_queue, center)
		return { vars = { math.max(1, math.floor(center.ability.extra.hand_size)) } }
	end,
	rarity = "cry_epic",
	cost = 9,
	eternal_compat = false,
	atlas = "atlasepic",
	calculate = function(self, card, context)
		if context.selling_self and not context.blueprint then
			G.hand:change_size(math.max(1, math.floor(card.ability.extra.hand_size)))
			return nil, true
		end
	end,
}
local circus = {
	object_type = "Joker",
	name = "cry-circus",
	key = "circus",
	pos = { x = 4, y = 4 },
	config = { extra = { Xmult = 1 } },
	atlas = "atlasepic",
	loc_vars = function(self, info_queue, center)
		return {
			vars = {
				(math.max(1, center.ability.extra.Xmult) * 2),
				(math.max(1, center.ability.extra.Xmult) * 3),
				(math.max(1, center.ability.extra.Xmult) * 4),
				(math.max(1, center.ability.extra.Xmult) * 20),
			},
		}
	end,
	rarity = "cry_epic",
	cost = 16,
	blueprint_compat = true,
	calculate = function(self, card, context)
		if context.other_joker and card ~= context.other_joker then
			if context.other_joker.config.center.rarity == 3 then --Rare
				if not Talisman.config_file.disable_anims then
					G.E_MANAGER:add_event(Event({
						func = function()
							context.other_joker:juice_up(0.5, 0.5)
							return true
						end,
					}))
				end
				return {
					message = localize({
						type = "variable",
						key = "a_xmult",
						vars = { (math.max(1, card.ability.extra.Xmult) * 2) },
					}),
					Xmult_mod = (math.max(1, card.ability.extra.Xmult) * 2),
				}
			elseif context.other_joker.config.center.rarity == 4 then --Legendary
				if not Talisman.config_file.disable_anims then
					G.E_MANAGER:add_event(Event({
						func = function()
							context.other_joker:juice_up(0.5, 0.5)
							return true
						end,
					}))
				end
				return {
					message = localize({
						type = "variable",
						key = "a_xmult",
						vars = { (math.max(1, card.ability.extra.Xmult) * 4) },
					}),
					Xmult_mod = (math.max(1, card.ability.extra.Xmult) * 4),
				}
			elseif context.other_joker.config.center.rarity == "cry_epic" then --Epic
				if not Talisman.config_file.disable_anims then
					G.E_MANAGER:add_event(Event({
						func = function()
							context.other_joker:juice_up(0.5, 0.5)
							return true
						end,
					}))
				end
				return {
					message = localize({
						type = "variable",
						key = "a_xmult",
						vars = { (math.max(1, card.ability.extra.Xmult) * 3) },
					}),
					Xmult_mod = (math.max(1, card.ability.extra.Xmult) * 3),
				}
			elseif context.other_joker.config.center.rarity == "cry_exotic" then --Exotic
				if not Talisman.config_file.disable_anims then
					G.E_MANAGER:add_event(Event({
						func = function()
							context.other_joker:juice_up(0.5, 0.5)
							return true
						end,
					}))
				end
				return {
					message = localize({
						type = "variable",
						key = "a_xmult",
						vars = { (math.max(1, card.ability.extra.Xmult) * 20) },
					}),
					Xmult_mod = (math.max(1, card.ability.extra.Xmult) * 20),
				}
			end
		end
	end,
}
local caramel = {
	object_type = "Joker",
	name = "cry-caramel",
	key = "caramel",
	config = { extra = { x_mult = 1.75, rounds_remaining = 11 } },
	pos = { x = 0, y = 1 },
	rarity = "cry_epic",
	cost = 12,
	blueprint_compat = true,
	eternal_compat = false,
	atlas = "atlasepic",
	loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.x_mult, center.ability.extra.rounds_remaining } }
	end,
	calculate = function(self, card, context)
		if context.individual then
			if context.cardarea == G.play then
				return {
					x_mult = card.ability.extra.x_mult,
					colour = G.C.RED,
					card = card,
				}
			end
		end
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
--this has to be the most spaghetti code in cryptid
local curse = {
	object_type = "Joker",
	name = "cry_curse",
	key = "curse",
	pos = { x = 1, y = 1 },
	rarity = "cry_epic",
	cost = 9,
	perishable_compat = true,
	atlas = "atlasepic",
	calculate = function(self, card, context)
		if
			context.selling_self
			and #G.jokers.cards + G.GAME.joker_buffer <= G.jokers.config.card_limit
			and not context.retrigger_joker
			and not context.blueprint
		then
			local createjoker = math.min(1, G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
			G.GAME.joker_buffer = G.GAME.joker_buffer + createjoker
			local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_obelisk")
			card:add_to_deck()
			G.jokers:emplace(card)
			G.GAME.joker_buffer = 0
			return {
				card_eval_status_text(card, "extra", nil, nil, nil, {
					message = localize("cry_curse_ex"),
					colour = G.C.FILTER,
				}),
			}
		end
		if
			context.discard
			and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit
			and not context.retrigger_joker
			and not context.blueprint
		then
			local createjoker = math.min(1, G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
			G.GAME.joker_buffer = G.GAME.joker_buffer + createjoker
			local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_obelisk")
			card:add_to_deck()
			G.jokers:emplace(card)
			G.GAME.joker_buffer = 0
			return {
				card_eval_status_text(card, "extra", nil, nil, nil, {
					message = localize("cry_curse_ex"),
					colour = G.C.FILTER,
				}),
			}
		end
		if
			context.pre_discard
			and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit
			and not context.retrigger_joker
			and not context.blueprint
		then
			local createjoker = math.min(1, G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
			G.GAME.joker_buffer = G.GAME.joker_buffer + createjoker
			local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_obelisk")
			card:add_to_deck()
			G.jokers:emplace(card)
			G.GAME.joker_buffer = 0
			return {
				card_eval_status_text(card, "extra", nil, nil, nil, {
					message = localize("cry_curse_ex"),
					colour = G.C.FILTER,
				}),
			}
		end
		if
			context.reroll_shop
			and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit
			and not context.retrigger_joker
			and not context.blueprint
		then
			local createjoker = math.min(1, G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
			G.GAME.joker_buffer = G.GAME.joker_buffer + createjoker
			local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_obelisk")
			card:add_to_deck()
			G.jokers:emplace(card)
			G.GAME.joker_buffer = 0
			return {
				card_eval_status_text(card, "extra", nil, nil, nil, {
					message = localize("cry_curse_ex"),
					colour = G.C.FILTER,
				}),
			}
		end
		if
			context.open_booster
			and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit
			and not context.retrigger_joker
			and not context.blueprint
		then
			local createjoker = math.min(1, G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
			G.GAME.joker_buffer = G.GAME.joker_buffer + createjoker
			local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_obelisk")
			card:add_to_deck()
			G.jokers:emplace(card)
			G.GAME.joker_buffer = 0
			return {
				card_eval_status_text(card, "extra", nil, nil, nil, {
					message = localize("cry_curse_ex"),
					colour = G.C.FILTER,
				}),
			}
		end
		if
			context.buying_card
			and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit
			and not context.retrigger_joker
			and not context.blueprint
		then
			local createjoker = math.min(1, G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
			G.GAME.joker_buffer = G.GAME.joker_buffer + createjoker
			local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_obelisk")
			card:add_to_deck()
			G.jokers:emplace(card)
			G.GAME.joker_buffer = 0
			return {
				card_eval_status_text(card, "extra", nil, nil, nil, {
					message = localize("cry_curse_ex"),
					colour = G.C.FILTER,
				}),
			}
		end
		if
			context.skip_blind
			and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit
			and not context.retrigger_joker
			and not context.blueprint
		then
			local createjoker = math.min(1, G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
			G.GAME.joker_buffer = G.GAME.joker_buffer + createjoker
			local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_obelisk")
			card:add_to_deck()
			G.jokers:emplace(card)
			G.GAME.joker_buffer = 0
			return {
				card_eval_status_text(card, "extra", nil, nil, nil, {
					message = localize("cry_curse_ex"),
					colour = G.C.FILTER,
				}),
			}
		end
		if
			context.cardarea == G.jokers
			and context.before
			and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit
			and not context.retrigger_joker
			and not context.blueprint
		then
			local createjoker = math.min(1, G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
			G.GAME.joker_buffer = G.GAME.joker_buffer + createjoker
			local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_obelisk")
			card:add_to_deck()
			G.jokers:emplace(card)
			G.GAME.joker_buffer = 0
			return {
				card_eval_status_text(card, "extra", nil, nil, nil, {
					message = localize("cry_curse_ex"),
					colour = G.C.FILTER,
				}),
			}
		end
		if
			context.using_consumeable
			and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit
			and not context.retrigger_joker
			and not context.blueprint
		then
			local createjoker = math.min(1, G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
			G.GAME.joker_buffer = G.GAME.joker_buffer + createjoker
			local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_obelisk")
			card:add_to_deck()
			G.jokers:emplace(card)
			G.GAME.joker_buffer = 0
			return {
				card_eval_status_text(card, "extra", nil, nil, nil, {
					message = localize("cry_curse_ex"),
					colour = G.C.FILTER,
				}),
			}
		end
		if
			context.selling_card
			and context.card.ability.name ~= "Obelisk"
			and #G.jokers.cards + G.GAME.joker_buffer - (context.card.ability.set == "Joker" and 1 or 0) < G.jokers.config.card_limit
			and not context.retrigger_joker
			and not context.blueprint
		then
			local createjoker = math.min(1, G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
			G.GAME.joker_buffer = G.GAME.joker_buffer + createjoker
			local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_obelisk")
			card:add_to_deck()
			G.jokers:emplace(card)
			G.GAME.joker_buffer = 0
			return {
				card_eval_status_text(card, "extra", nil, nil, nil, {
					message = localize("cry_curse_ex"),
					colour = G.C.FILTER,
				}),
			}
		end
		if
			context.setting_blind
			and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit
			and not context.retrigger_joker
			and not context.blueprint
		then
			local createjoker = math.min(1, G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
			G.GAME.joker_buffer = G.GAME.joker_buffer + createjoker
			local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_obelisk")
			card:add_to_deck()
			G.jokers:emplace(card)
			G.GAME.joker_buffer = 0
			return {
				card_eval_status_text(card, "extra", nil, nil, nil, {
					message = localize("cry_curse_ex"),
					colour = G.C.FILTER,
				}),
			}
		end
		if
			context.skipping_booster
			and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit
			and not context.retrigger_joker
			and not context.blueprint
		then
			local createjoker = math.min(1, G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
			G.GAME.joker_buffer = G.GAME.joker_buffer + createjoker
			local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_obelisk")
			card:add_to_deck()
			G.jokers:emplace(card)
			G.GAME.joker_buffer = 0
			return {
				card_eval_status_text(card, "extra", nil, nil, nil, {
					message = localize("cry_curse_ex"),
					colour = G.C.FILTER,
				}),
			}
		end
	end,
	add_to_deck = function(self, card, from_debuff)
		local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_obelisk")
		card:set_edition("e_negative", true, nil, true)
		card:set_eternal(true)
		card:add_to_deck()
		G.jokers:emplace(card)
		return {
			card_eval_status_text(card, "extra", nil, nil, nil, {
				message = localize("cry_curse_ex"),
				colour = G.C.DARK_EDITION,
			}),
		}
	end,
}
local bonusjoker = {
	object_type = "Joker",
	name = "cry-Bonus Joker",
	key = "bonusjoker",
	pos = { x = 3, y = 2 },
	config = { extra = { odds = 8, check = 0 } },
	immune_to_chemach = true,
	rarity = "cry_epic",
	cost = 11,
	blueprint_compat = true,
	enhancement_gate = "m_bonus",
	loc_vars = function(self, info_queue, center)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_bonus
		return { vars = { "" .. (G.GAME and G.GAME.probabilities.normal or 1), center.ability.extra.odds } }
	end,
	atlas = "atlasepic",
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if context.other_card.ability.effect == "Bonus Card" then
				if
					pseudorandom("bonusjoker") < G.GAME.probabilities.normal / card.ability.extra.odds
					and card.ability.extra.check < 2
					and not context.retrigger_joker
				then
					local option = pseudorandom_element({ 1, 2 }, pseudoseed("bonusjoker"))
					if option == 1 then
						if not context.blueprint then
							card.ability.extra.check = card.ability.extra.check + 1
						end
						G.jokers.config.card_limit = G.jokers.config.card_limit + 1
					else
						if not context.blueprint then
							card.ability.extra.check = card.ability.extra.check + 1
						end
						G.consumeables.config.card_limit = G.consumeables.config.card_limit + 1
					end
					return {
						extra = { focus = card, message = localize("k_upgrade_ex") },
						card = card,
						colour = G.C.MONEY,
					}
				end
			end
		end
		if
			context.end_of_round
			and card.ability.extra.check ~= 0
			and not context.blueprint
			and not context.retrigger_joker
			and not context.individual
			and not context.repetition
		then
			card.ability.extra.check = 0
			return {
				message = localize("k_reset"),
				card = card,
			}
		end
	end,
}
local multjoker = {
	object_type = "Joker",
	name = "cry-Mult Joker",
	key = "multjoker",
	pos = { x = 2, y = 3 },
	config = { extra = { odds = 3 } },
	immune_to_chemach = true,
	rarity = "cry_epic",
	cost = 11,
	blueprint_compat = true,
	enhancement_gate = "m_mult",
	loc_vars = function(self, info_queue, center)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_mult
		info_queue[#info_queue + 1] = G.P_CENTERS.c_cryptid
		return { vars = { "" .. (G.GAME and G.GAME.probabilities.normal or 1), center.ability.extra.odds } }
	end,
	atlas = "atlasepic",
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if
				context.other_card.ability.effect == "Mult Card"
				and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit
			then
				if pseudorandom("multjoker") < G.GAME.probabilities.normal / card.ability.extra.odds then
					G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
					G.E_MANAGER:add_event(Event({
						func = function()
							local new_card =
								create_card("Spectral", G.consumeables, nil, nil, nil, nil, "c_cryptid", "multjoker")
							new_card:add_to_deck()
							G.consumeables:emplace(new_card)
							G.GAME.consumeable_buffer = 0
							return true
						end,
					}))
					card_eval_status_text(
						context.blueprint_card or card,
						"extra",
						nil,
						nil,
						nil,
						{ message = localize("cry_plus_cryptid"), colour = G.C.SECONDARY_SET.Spectral }
					)
					return nil, true
				end
			end
		end
	end,
}
local goldjoker = {
	object_type = "Joker",
	name = "cry-gold Joker",
	key = "goldjoker",
	config = { extra = { percent_mod = 2, percent = 0 } },
	pos = { x = 0, y = 4 },
	rarity = "cry_epic",
	cost = 14,
	enhancement_gate = "m_gold",
	perishable_compat = false,
	atlas = "atlasepic",
	loc_vars = function(self, info_queue, center)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_gold
		return { vars = { center.ability.extra.percent, center.ability.extra.percent_mod } }
	end,
	calculate = function(self, card, context)
		if context.cardarea == G.play and context.individual and not context.blueprint then
			if context.other_card.ability.effect == "Gold Card" then
				card.ability.extra.percent = card.ability.extra.percent + card.ability.extra.percent_mod
				return {
					extra = { focus = card, message = localize("k_upgrade_ex") },
					card = card,
					colour = G.C.MONEY,
				}
			end
		end
		if context.individual and context.cardarea == G.play then
			if context.other_card.ability.effect == "Gold Card" then
				card.ability.extra.percent = card.ability.extra.percent + card.ability.extra.percent_mod
				return {
					message = localize("k_upgrade_ex"),
					card = card,
					colour = G.C.CHIPS,
				}
			end
		end
	end,
	calc_dollar_bonus = function(self, card)
		local bonus = math.max(0, math.floor(0.01 * card.ability.extra.percent * (G.GAME.dollars or 0)))
		if bonus > 0 then
			return bonus
		end
	end,
}
local altgoogol = {
	object_type = "Joker",
	name = "cry-altgoogol",
	key = "altgoogol",
	pos = { x = 4, y = 3 },
	immune_to_chemach = true,
	rarity = "cry_epic",
	cost = 10,
	blueprint_compat = true,
	eternal_compat = false,
	atlas = "atlasepic",
	soul_pos = { x = 10, y = 0, extra = { x = 5, y = 3 } },
	calculate = function(self, card, context)
		if context.selling_self and not context.retrigger_joker then
			local spawn = {}
			if G.jokers.cards[1].ability.name ~= card.ability.name then
				spawn[#spawn + 1] = G.jokers.cards[1]
			end
			if #spawn ~= 0 then
				G.E_MANAGER:add_event(Event({
					func = function()
						for i = 1, 2 do
							local card = copy_card(pseudorandom_element(spawn, pseudoseed("cry_ngpc")), nil) --borrowed code moment
							card:add_to_deck()
							G.jokers:emplace(card)
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
					{ message = localize("k_duplicated_ex") }
				)
				return nil, true
			else
				return nil, true
			end
		end
	end,
}
local soccer = {
	object_type = "Joker",
	name = "cry-soccer",
	key = "soccer",
	pos = { x = 1, y = 4 },
	config = { extra = { holygrail = 1 } },
	immune_to_chemach = true,
	rarity = "cry_epic",
	cost = 20,
	atlas = "atlasepic",
	loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.holygrail } }
	end,
	add_to_deck = function(self, card, from_debuff) --TODO: Card in booster packs, Voucher slots
		card.ability.extra.holygrail = math.floor(card.ability.extra.holygrail)
		G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.holygrail
		G.consumeables.config.card_limit = G.consumeables.config.card_limit + card.ability.extra.holygrail
		G.hand:change_size(card.ability.extra.holygrail)
		if not G.GAME.modifiers.cry_booster_packs then
			G.GAME.modifiers.cry_booster_packs = 2
		end
		G.GAME.modifiers.cry_booster_packs = G.GAME.modifiers.cry_booster_packs + card.ability.extra.holygrail
		change_shop_size(card.ability.extra.holygrail)
	end,
	remove_from_deck = function(self, card, from_debuff)
		G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra.holygrail
		G.consumeables.config.card_limit = G.consumeables.config.card_limit - card.ability.extra.holygrail
		G.hand:change_size(-card.ability.extra.holygrail)
		if not G.GAME.modifiers.cry_booster_packs then
			G.GAME.modifiers.cry_booster_packs = 2
		end
		G.GAME.modifiers.cry_booster_packs = G.GAME.modifiers.cry_booster_packs - card.ability.extra.holygrail
		change_shop_size(card.ability.extra.holygrail * -1)
	end,
}
return {
	name = "Epic Jokers",
	init = function()
		--Error Patches
		cry_error_operators = { "+", "-", "X", "/", "^", "=", ">", "<", "m" }
		cry_error_numbers = {
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
			"10",
			"69",
			"404",
			"420",
			"-1",
			"0.5",
			"m",
			"nan",
			"inf",
			"nil",
			"pi",
			"1e9",
			"???",
		}
		cry_error_msgs = {
			{ string = "rand()", colour = G.C.RARITY["cry_exotic"] },
			{ string = "m", colour = G.C.UI.TEXT_DARK },
			{ string = "Chips", colour = G.C.CHIPS },
			{ string = "Mult", colour = G.C.MULT },
			{ string = "Jokers", colour = G.C.FILTER },
			{ string = "dollars", colour = G.C.FILTER },
			{ string = "hands", colour = G.C.FILTER },
			{ string = "slots", colour = G.C.FILTER },
			{ string = "Antes", colour = G.C.FILTER },
			{ string = "ERROR", colour = G.C.UI.TEXT_INACTIVE },
			{ string = "Tarots", colour = G.C.SECONDARY_SET.Tarot },
			{ string = "Planets", colour = G.C.SECONDARY_SET.Planet },
			{ string = "Specls", colour = G.C.SECONDARY_SET.Spectral },
			{ string = "%%ERROR", colour = G.C.CRY_ASCENDANT }, --temp string, this will be modified
		}

		function predict_pseudoseed(key)
			local M = G.GAME.pseudorandom[key] or pseudohash(key .. (G.GAME.pseudorandom.seed or ""))
			local m = math.abs(tonumber(string.format("%.13f", (2.134453429141 + M * 1.72431234) % 1)))
			return (m + (G.GAME.pseudorandom.hashed_seed or 0)) / 2
		end

		function predict_card_for_shop()
			local total_rate = G.GAME.joker_rate + G.GAME.playing_card_rate
			for _, v in ipairs(SMODS.ConsumableType.obj_buffer) do
				total_rate = total_rate + G.GAME[v:lower() .. "_rate"] or 0
			end
			local polled_rate = pseudorandom(predict_pseudoseed("cdt" .. G.GAME.round_resets.ante)) * total_rate
			local check_rate = 0
			-- need to preserve order to leave RNG unchanged
			local rates = {
				{ type = "Joker", val = G.GAME.joker_rate },
				{ type = "Tarot", val = G.GAME.tarot_rate },
				{ type = "Planet", val = G.GAME.planet_rate },
				{
					type = (G.GAME.used_vouchers["v_illusion"] and pseudorandom(predict_pseudoseed("illusion")) > 0.6)
							and "Enhanced"
						or "Base",
					val = G.GAME.playing_card_rate,
				},
				{ type = "Spectral", val = G.GAME.spectral_rate },
			}
			for _, v in ipairs(SMODS.ConsumableType.obj_buffer) do
				if not (v == "Tarot" or v == "Planet" or v == "Spectral") then
					table.insert(rates, { type = v, val = G.GAME[v:lower() .. "_rate"] })
				end
			end
			for _, v in ipairs(rates) do
				if polled_rate > check_rate and polled_rate <= check_rate + v.val then
					local c = create_card(v.type, "ERROR", nil, nil, nil, nil, nil, "sho")
					if not c.set then
						return v.type:sub(1, 1) .. c.suit:sub(1, 1) .. c.value:sub(1, 2)
					else
						for i = 1, #G.P_CENTER_POOLS[c.set] do
							if G.P_CENTER_POOLS[c.set][i].key == c.key then
								return c.set:sub(1, 1) .. i
							end
						end
					end
				end
				check_rate = check_rate + v.val
			end
		end

		cry_enable_epics = true
		--Number Blocks Patches
		local gigo = Game.init_game_object
		function Game:init_game_object()
			local g = gigo(self)
			g.current_round.cry_nb_card = { rank = "Ace" }
			return g
		end
		local rcc = reset_castle_card
		function reset_castle_card()
			rcc()
			G.GAME.current_round.cry_nb_card = { rank = "Ace" }
			local valid_castle_cards = {}
			for k, v in ipairs(G.playing_cards) do
				if v.ability.effect ~= "Stone Card" then
					valid_castle_cards[#valid_castle_cards + 1] = v
				end
			end
			if valid_castle_cards[1] then
				local castle_card =
					pseudorandom_element(valid_castle_cards, pseudoseed("cry_nb" .. G.GAME.round_resets.ante))
				if not G.GAME.current_round.cry_nb_card then
					G.GAME.current_round.cry_nb_card = {}
				end
				G.GAME.current_round.cry_nb_card.rank = castle_card.base.value
				G.GAME.current_round.cry_nb_card.id = castle_card.base.id
			end
		end

		--For Double Scale, modify Green Joker to use one variable
		SMODS.Joker:take_ownership("green_joker", {
			config = { extra = 1, mult = 0 },
			name = "cry-Green Joker", --will prevent old calculation code from working
			loc_vars = function(self, info_queue, center)
				return { vars = { center.ability.extra, center.ability.extra, center.ability.mult } }
			end,
			calculate = function(self, card, context)
				if
					context.discard
					and not context.blueprint
					and context.other_card == context.full_hand[#context.full_hand]
				then
					local prev_mult = card.ability.mult
					card.ability.mult = math.max(0, card.ability.mult - card.ability.extra)
					if card.ability.mult ~= prev_mult then
						return {
							message = localize({
								type = "variable",
								key = "a_mult_minus",
								vars = { card.ability.extra },
							}),
							colour = G.C.RED,
							card = card,
						}
					end
				end
				if context.cardarea == G.jokers and context.before and not context.blueprint then
					card.ability.mult = card.ability.mult + card.ability.extra
					return {
						card = card,
						message = localize({ type = "variable", key = "a_mult", vars = { card.ability.extra } }),
					}
				end
				if context.cardarea == G.jokers and not context.before and not context.after then
					return {
						message = localize({ type = "variable", key = "a_mult", vars = { card.ability.mult } }),
						mult_mod = card.ability.mult,
					}
				end
			end,
			loc_txt = {},
		}, true)
	end,
	order = 2000000,
	items = {
		supercell,
		membershipcardtwo,
		googol_play,
		sync_catalyst,
		negative,
		canvas,
		error_joker,
		M,
		m,
		boredom,
		double_scale,
		number_blocks,
		oldcandy,
		circus,
		caramel,
		curse,
		bonusjoker,
		multjoker,
		goldjoker,
		altgoogol,
		soccer,
	},
}
