local supercell = {
	object_type = "Joker",
	name = "cry-supercell",
	key = "supercell",
	config = { extra = { stat1 = 15, stat2 = 2, money = 3 } },
	pos = { x = 5, y = 1 },
	rarity = "cry_epic",
	cost = 14,
	order = 64,
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
	cry_credits = {
		idea = {
			"Jevonn"
		},
		art = {
			"Jevonn"
		},
		code = {
			"Jevonn"
		}
	},
}
local membershipcardtwo = {
	object_type = "Joker",
	name = "cry-membershipcardtwo",
	key = "membershipcardtwo",
	config = { extra = { chips = 1 } },
	pos = { x = 5, y = 4 },
	rarity = "cry_epic",
	cost = 17,
	order = 50,
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
	cry_credits = {
		idea = {
			"Jevonn"
		},
		art = {
			"Linus Goof Balls"
		},
		code = {
			"Jevonn"
		}
	},
}
local googol_play = {
	object_type = "Joker",
	name = "cry-Googol Play Card",
	key = "googol_play",
	config = { extra = { Xmult = 1e100, odds = 8 } },
	pos = { x = 3, y = 0 },
	rarity = "cry_epic",
	cost = 10,
	order = 14,
	blueprint_compat = true,
	atlas = "atlasepic",
	soul_pos = { x = 10, y = 0, extra = { x = 4, y = 0 } },
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				cry_prob(card.ability.cry_prob, card.ability.extra.odds, card.ability.cry_rigged),
				card.ability.extra.odds,
				card.ability.extra.Xmult,
			},
		}
	end,
	calculate = function(self, card, context)
		if
			context.cardarea == G.jokers
			and not context.before
			and not context.after
			and pseudorandom("cry_googol_play") < cry_prob(card.ability.cry_prob, card.ability.extra.odds, card.ability.cry_rigged) / card.ability.extra.odds
		then
			return {
				message = localize({ type = "variable", key = "a_xmult", vars = { card.ability.extra.Xmult } }),
				Xmult_mod = card.ability.extra.Xmult,
			}
		end
	end,
	cry_credits = {
		idea = {
			".asdom"
		},
		art = {
			"Linus Goof Balls"
		},
		code = {
			"Math"
		}
	},
	unlocked = false,
	check_for_unlock = function(self, args)
		if args.type == 'chip_score' and to_big(args.chips) >= to_big(1e100) then
 			unlock_card(self)
		end
		if args.type == 'cry_lock_all' then
			lock_card(self)
		end
		if args.type == 'cry_unlock_all' then
			unlock_card(self)
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
	order = 54,
	blueprint_compat = true,
	immutable = true,
	atlas = "atlasepic",
	calculate = function(self, card, context)
		if context.cardarea == G.jokers and not context.before
		 and not context.after and not context.debuffed_hand
		  and hand_chips and mult then
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
	cry_credits = {
		idea = {
			"Project666"
		},
		art = {
			"Ein13"
		},
		code = {
			"Math"
		}
	},
}
local negative = {
	object_type = "Joker",
	name = "cry-Negative Joker",
	key = "negative",
	pos = { x = 1, y = 3 },
	config = { extra = 4 },
	rarity = "cry_epic",
	cost = 10,
	order = 70,
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
	cry_credits = {
		idea = {
			"Xero01"
		},
		art = {
			"Linus Goof Balls"
		},
		code = {
			"Math"
		}
	},
}
local canvas = {
	object_type = "Joker",
	name = "cry-Canvas",
	key = "canvas",
	immutable = true,
	order = 4,
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
	cry_credits = {
		idea = {
			"Mystic Misclick"
		},
		art = {
			"Mystic Misclick"
		},
		code = {
			"Math"
		}
	},
}
local error_joker = {
	object_type = "Joker",
	name = "cry-Error",
	key = "error",
	pos = { x = 4, y = 2 },
	config = { extra = { sell_rounds = 0, active = false } },
	immutable = true,
	rarity = "cry_epic",
	cost = 1,
	order = 72,
	blueprint_compat = false,
	eternal_compat = false,
	atlas = "atlasepic",
	loc_vars = function(self, info_queue, center)
		if G.GAME and G.GAME.pseudorandom and G.STAGE == G.STAGES.RUN then
        		cry_error_msgs[#cry_error_msgs].string = "%%" .. predict_card_for_shop()
    		else
        		cry_error_msgs[#cry_error_msgs].string = "%%J6"
   		end
		return {  
			main_start = {
        			{n=G.UIT.O, config={object = DynaText({string = cry_error_operators, colours = {G.C.DARK_EDITION,},pop_in_rate = 9999999, silent = true, random_element = true, pop_delay = 0.30, scale = 0.32, min_cycle_time = 0})}},
        			{n=G.UIT.O, config={object = DynaText({string = cry_error_numbers, colours = {G.C.DARK_EDITION,},pop_in_rate = 9999999, silent = true, random_element = true, pop_delay = 0.33, scale = 0.32, min_cycle_time = 0})}},
       				{n=G.UIT.O, config={object = DynaText({string = cry_error_msgs,
        			colours = {G.C.UI.TEXT_DARK},pop_in_rate = 9999999, silent = true, random_element = true, pop_delay = 0.4011, scale = 0.32, min_cycle_time = 0})}},
			}
		} 
	end,
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
	cry_credits = {
		idea = {
			"Coronacht", "Fetch"
		},
		art = {
			"Mystic Misclick"
		},
		code = {
			"Math"
		}
	},
}
local m = {
	object_type = "Joker",
	discovered = true,
	name = "cry-m",
	key = "m",
	pos = { x = 3, y = 1 },
	config = { extra = { extra = 13, x_mult = 1 }, jolly = { t_mult = 8, type = "Pair" } },
    pools = {["Meme"] = true},
	rarity = "cry_epic",
	order = 1,
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
			and context.card:is_jolly()
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
				if context.retrigger_joker_check and context.other_card == card then
					local reps = get_m_retriggers(self, card, context)
					if reps > 0 then
						return {
							message = localize("k_again_ex"),
							repetitions = reps + (ret and ret.repetitions or 0),
							card = card,
						}
					end
				end
				return ret, trig
			end
		end
	end,
	cry_credits = {
		idea = {
			"Jevonn"
		},
		art = {
			"Jevonn"
		},
		code = {
			"Math"
		}
	},
}
local M = {
	object_type = "Joker",
	name = "cry-M",
	key = "M",
	pos = { x = 0, y = 0 },
	order = 250,
	config = { jolly = { t_mult = 8, type = "Pair" } },
	rarity = "cry_epic",
	effect = "M Joker",
	cost = 13,
	immutable = true,
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
				if context.retrigger_joker_check and context.other_card == card then
					local reps = get_m_retriggers(self, card, context)
					if reps > 0 then
						return {
							message = localize("k_again_ex"),
							repetitions = reps + (ret and ret.repetitions or 0),
							card = card,
						}
					end
				end
				return ret, trig
			end
		end
	end,
	cry_credits = {
		idea = {
			"Jevonn"
		},
		art = {
			"Jevonn"
		},
		code = {
			"Math"
		}
	},
}
local boredom = {
	object_type = "Joker",
	name = "cry-Boredom",
	key = "boredom",
	pos = { x = 1, y = 0 },
	config = { extra = { odds = 2 } },
    pools = {["Meme"] = true},
	rarity = "cry_epic",
	order = 32,
	cost = 14,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { cry_prob(card.ability.cry_prob, card.ability.extra.odds, card.ability.cry_rigged), card.ability.extra.odds } }
	end,
	atlas = "atlasepic",
	calculate = function(self, card, context)
		if context.retrigger_joker_check and not context.retrigger_joker and context.other_card ~= self then
			if pseudorandom("cry_boredom_joker") < cry_prob(card.ability.cry_prob, card.ability.extra.odds, card.ability.cry_rigged) / card.ability.extra.odds then
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
			and pseudorandom("cry_boredom_card") < cry_prob(card.ability.cry_prob, card.ability.extra.odds, card.ability.cry_rigged) / card.ability.extra.odds
		then
			return {
				message = localize("k_again_ex"),
				repetitions = 1,
				card = card,
			}
		end
	end,
	cry_credits = {
		idea = {
			"Math"
		},
		art = {
			"Saturn"
		},
		code = {
			"Math"
		}
	},
}
local number_blocks = {
	object_type = "Joker",
	name = "cry-Number Blocks",
	key = "number_blocks",
	config = { extra = { money_mod = 1, money = 1 } },
	pos = { x = 0, y = 2 },
	rarity = "cry_epic",
	cost = 14,
	order = 12,
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
	cry_credits = {
		idea = {
			"Jevonn"
		},
		art = {
			"Jevonn"
		},
		code = {
			"Math"
		}
	},
}
local double_scale = {
	object_type = "Joker",
	name = "cry-Double Scale",
	key = "Double Scale",
	pos = { x = 0, y = 3 },
	order = 6,
	rarity = "cry_epic",
	cost = 18,
	immutable = true,
	atlas = "atlasepic",
	--todo: support jokers that scale multiple variables
	cry_scale_mod = function(self, card, joker, orig_scale_scale, true_base, orig_scale_base, new_scale_base)
		return orig_scale_scale + true_base
	end,
	cry_credits = {
		idea = {
			"Mystic Misclick"
		},
		art = {
			"AlezZGreat"
		},
		code = {
			"Math", "Mathguy"
		}
	},
}
local oldcandy = {
	object_type = "Joker",
	name = "cry_oldcandy",
	key = "oldcandy",
	pos = { x = 4, y = 1 },
	order = 43,
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
	cry_credits = {
		idea = {
			"Jevonn"
		},
		art = {
			"Jevonn"
		},
		code = {
			"Jevonn"
		}
	},
}
local circus = {
	object_type = "Joker",
	name = "cry-circus",
	key = "circus",
	pos = { x = 4, y = 4 },
	config = { extra = { Xmult = 1 } },
	atlas = "atlasepic",
	order = 33,
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
	cry_credits = {
		idea = {
			"Ein13"
		},
		art = {
			"Ein13"
		},
		code = {
			"Jevonn"
		}
	},
	unlocked = false,
	check_for_unlock = function(self, args)
		if G and G.jokers and G.GAME and G.GAME.round_resets and G.GAME.round_resets.ante and G.GAME.round_resets.ante < 9 then
			local rarities = {

			}
			for i = 1, #G.jokers.cards do
				local card = G.jokers.cards[i]
				rarities[card.config.center.rarity .. '_rarity'] = true
			end
			if rarities['3_rarity'] and rarities['4_rarity'] and rarities['cry_epic_rarity'] then
 				unlock_card(self)
			end
		end
		if args.type == 'cry_lock_all' then
			lock_card(self)
		end
		if args.type == 'cry_unlock_all' then
			unlock_card(self)
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
	order = 106,
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
	cry_credits = {
		idea = {
			"Jevonn"
		},
		art = {
			"Jevonn"
		},
		code = {
			"Jevonn"
		}
	},
}
--this has to be the most spaghetti code in cryptid
local curse_sob = {
	object_type = "Joker",
	name = "cry_curse_sob",
	key = "curse_sob",
	pos = { x = 1, y = 1 },
    pools = {["Meme"] = true},
	rarity = "cry_epic",
	cost = 9,
	order = 82,
	immutable = true,
	perishable_compat = true,
	atlas = "atlasepic",
	calculate = function(self, card, context)
		if 
			context.selling_card
			and context.card.ability.name == "Obelisk"
			and not context.retrigger_joker
			and not context.blueprint
		then
			return {}
		elseif
			(-- Compacting all the elseifs into one block for space and readability also maintablity
				context.selling_self 
				or context.discard 
				or context.pre_discard -- We want 2 obilisks per discard? dunno just copying what was there
				or context.reroll_shop --Yes
				or context.buying_card 
				or context.skip_blind 
				or context.using_consumeable
				or context.selling_card 
				or context.setting_blind 
				or context.skipping_booster 
				or context.open_booster 
			)
			and #G.jokers.cards + G.GAME.joker_buffer < (context.selling_self and (G.jokers.config.card_limit + 1) or G.jokers.config.card_limit)
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
		if not from_debuff then
			local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_obelisk")
			card:set_edition("e_negative", true, nil, true)
			card.ability.cry_absolute = true
			card:add_to_deck()
			G.jokers:emplace(card)
			return {
				card_eval_status_text(card, "extra", nil, nil, nil, {
					message = localize("cry_curse_ex"),
					colour = G.C.DARK_EDITION,
				}),
			}
		end
	end,
	cry_credits = {
		idea = {
			"Jevonn"
		},
		art = {
			"Jevonn"
		},
		code = {
			"Jevonn"
		}
	},
	unlocked = false,
	check_for_unlock = function(self, args)
		if G and G.jokers then
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i].config.center.key == 'j_obelisk' and G.jokers.cards[i].ability.eternal then
					unlock_card(self)
				end
			end
		end
		if args.type == 'cry_lock_all' then
			lock_card(self)
		end
		if args.type == 'cry_unlock_all' then
			unlock_card(self)
		end
	end,
}
local bonusjoker = {
	object_type = "Joker",
	name = "cry-Bonus Joker",
	key = "bonusjoker",
	pos = { x = 3, y = 2 },
	config = { extra = { odds = 8, check = 0, add = 1 } },
	rarity = "cry_epic",
	cost = 11,
	order = 75,
	blueprint_compat = true,
	enhancement_gate = "m_bonus",
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_bonus
		return { vars = { cry_prob(card.ability.cry_prob, card.ability.extra.odds, card.ability.cry_rigged), card.ability.extra.odds, card.ability.extra.add } }
	end,
	atlas = "atlasepic",
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if context.other_card.ability.effect == "Bonus Card" then
				if
					pseudorandom("bonusjoker") < cry_prob(card.ability.cry_prob, card.ability.extra.odds, card.ability.cry_rigged) / card.ability.extra.odds
					and card.ability.extra.check < 2
					and not context.retrigger_joker
				then
					local option = pseudorandom_element({ 1, 2 }, pseudoseed("bonusjoker"))
					if option == 1 then
						if not context.blueprint then
							card.ability.extra.check = card.ability.extra.check + 1
						end
						G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.add
					else
						if not context.blueprint then
							card.ability.extra.check = card.ability.extra.check + 1
						end
						G.consumeables.config.card_limit = G.consumeables.config.card_limit + card.ability.extra.add
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
	cry_credits = {
		idea = {
			"Jevonn"
		},
		art = {
			"Jevonn"
		},
		code = {
			"Jevonn"
		}
	},
}
local multjoker = {
	object_type = "Joker",
	name = "cry-Mult Joker",
	key = "multjoker",
	pos = { x = 2, y = 3 },
	config = { extra = { odds = 3 } },
	rarity = "cry_epic",
	order = 99,
	cost = 11,
	blueprint_compat = true,
	enhancement_gate = "m_mult",
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_mult
		info_queue[#info_queue + 1] = G.P_CENTERS.c_cryptid
		return { vars = { cry_prob(card.ability.cry_prob, card.ability.extra.odds, card.ability.cry_rigged), card.ability.extra.odds } }
	end,
	atlas = "atlasepic",
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if
				context.other_card.ability.effect == "Mult Card"
				and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit
			then
				if pseudorandom("multjoker") < cry_prob(card.ability.cry_prob, card.ability.extra.odds, card.ability.cry_rigged) / card.ability.extra.odds then
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
	cry_credits = {
		idea = {
			"Jevonn"
		},
		art = {
			"Jevonn"
		},
		code = {
			"Jevonn"
		}
	},
}
local goldjoker = {
	object_type = "Joker",
	name = "cry-gold Joker",
	key = "goldjoker",
	config = { extra = { percent_mod = 2, percent = 0 } },
	pos = { x = 0, y = 4 },
	rarity = "cry_epic",
	cost = 14,
	order = 81,
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
			if G.GAME.dollars > 1e10 then
				return 1
			else
				return bonus
			end
		end
	end,
	cry_credits = {
		idea = {
			"Jevonn"
		},
		art = {
			"Jevonn"
		},
		code = {
			"Jevonn"
		}
	},
}
local altgoogol = {
	object_type = "Joker",
	name = "cry-altgoogol",
	key = "altgoogol",
	config = { extra = { jokers = 2 } },
	pos = { x = 4, y = 3 },
	rarity = "cry_epic",
	cost = 10,
	order = 60,
	blueprint_compat = true,
	eternal_compat = false,
	atlas = "atlasepic",
	soul_pos = { x = 10, y = 0, extra = { x = 5, y = 3 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { math.floor(math.min(20, card.ability.extra.jokers)) } }
	end,
	calculate = function(self, card, context)
		if context.selling_self and not context.retrigger_joker then
			local jokers = {}
                	for i=1, #G.jokers.cards do 
                    		if G.jokers.cards[i] ~= card then
                        		jokers[#jokers+1] = G.jokers.cards[i]
                    		end
                	end
                	if #jokers > 0 then
				if G.jokers.cards[1].ability.name ~= "cry-altgoogol" then
					local spawn = {G.jokers.cards[1]}
					G.E_MANAGER:add_event(Event({
						func = function()
							for i = 1, math.floor(math.min(20, card.ability.extra.jokers)) do
								local card = copy_card(pseudorandom_element(spawn, pseudoseed("cry_ngpc")), nil)
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
						{ 
						message = localize("k_duplicated_ex"),
						colour = G.C.RARITY.cry_epic,
						}
					)
					return nil, true
				else
					card_eval_status_text(
						context.blueprint_card or card,
						"extra",
						nil,
						nil,
						nil,
						{ 
						message = localize("k_nope_ex"),
						colour = G.C.RARITY.cry_epic,
						}
					)
					return nil, true
				end
			else
				card_eval_status_text(
						context.blueprint_card or card,
						"extra",
						nil,
						nil,
						nil,
						{ 
						message = localize("k_no_other_jokers"),
						colour = G.C.RARITY.cry_epic,
						}
				)
				return nil, true
			end
		end
	end,
	cry_credits = {
		idea = {
			"Jevonn"
		},
		art = {
			"Jevonn"
		},
		code = {
			"Jevonn"
		}
	},
}
local soccer = {
	object_type = "Joker",
	name = "cry-soccer",
	key = "soccer",
	pos = { x = 1, y = 4 },
	config = { extra = { holygrail = 1 } },
	rarity = "cry_epic",
	order = 58,
	cost = 20,
	atlas = "atlasepic",
	loc_vars = function(self, info_queue, center)
		return { vars = { math.floor(math.min(15, center.ability.extra.holygrail)) } }
	end,
	add_to_deck = function(self, card, from_debuff) --TODO: Card in booster packs, Voucher slots
		local holy = math.floor(math.min(15, card.ability.extra.holygrail))
		G.jokers.config.card_limit = G.jokers.config.card_limit + holy
		G.consumeables.config.card_limit = G.consumeables.config.card_limit + holy
		G.hand:change_size(holy)
		if not G.GAME.modifiers.cry_booster_packs then
			G.GAME.modifiers.cry_booster_packs = 2
		end
		G.GAME.modifiers.cry_booster_packs = G.GAME.modifiers.cry_booster_packs + holy
		change_shop_size(holy)
		cry_bonusvouchermod(holy)
	end,
	remove_from_deck = function(self, card, from_debuff)
		local holy = math.floor(math.min(15, card.ability.extra.holygrail))
		G.jokers.config.card_limit = G.jokers.config.card_limit - holy
		G.consumeables.config.card_limit = G.consumeables.config.card_limit - holy
		G.hand:change_size(-holy)
		if not G.GAME.modifiers.cry_booster_packs then
			G.GAME.modifiers.cry_booster_packs = 2
		end
		G.GAME.modifiers.cry_booster_packs = G.GAME.modifiers.cry_booster_packs - holy
		change_shop_size(holy * -1)
		cry_bonusvouchermod(-1*holy)
	end,
	cry_credits = {
		idea = {
			"Mjiojio"
		},
		art = {
			"HexaCryonic"
		},
		code = {
			"Jevonn"
		}
	},
	unlocked = false,
	check_for_unlock = function(self, args)
		if args.type == 'win' then

			for k,v in pairs(G.GAME.hands) do
				if k ~= 'High Card' and G.GAME.hands[k].played ~= 0 then
					return
				end
			end
			return true
		end
		if args.type == 'cry_lock_all' then
			lock_card(self)
		end
		if args.type == 'cry_unlock_all' then
			unlock_card(self)
		end
	end,
}
local fleshpanopticon = {
	object_type = "Joker",
	name = "cry-fleshpanopticon",
	key = "fleshpanopticon",
	pos = { x = 0, y = 5 },
	config = { extra = { boss_size = 20 } },
	rarity = "cry_epic",
	cost = 15,
	order = 146,
	atlas = "atlasepic",
	loc_vars = function(self, info_queue, center)
		if Cryptid.enabled["Exotic Jokers"] then
			info_queue[#info_queue + 1] = { set = "Spectral", key = "c_cry_gateway" }
		end
		if not center.edition or (center.edition and not center.edition.negative) then
			info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
		end
		return { vars = { center.ability.extra.boss_size } }
	end,
  calculate = function(self, card, context)
    if context.setting_blind and not context.blueprint and context.blind.boss and not card.getting_sliced then
      local eval = function(card) return not card.REMOVED and not G.RESET_JIGGLES end
      juice_card_until(card, eval, true)
      card.gone = false
      G.GAME.blind.chips = G.GAME.blind.chips * card.ability.extra.boss_size
      G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
      G.HUD_blind:recalculate(true)
      G.E_MANAGER:add_event(Event({func = function()
        G.E_MANAGER:add_event(Event({func = function()
          play_sound('timpani')
          delay(0.4)
          return true end }))
        card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize("cry_good_luck_ex")})
      return true end }))
    end
    if context.end_of_round and not context.individual and not context.repetition and not context.blueprint and G.GAME.blind.boss and not card.gone then
      G.E_MANAGER:add_event(Event({
        trigger = 'before',
        delay = 0.0,
        func = (function()
            local card = create_card(nil,G.consumeables, nil, nil, nil, nil, Cryptid.enabled["Exotic Jokers"] and 'c_cry_gateway' or 'c_soul', 'sup')
            card:set_edition({negative = true}, true)
            card:add_to_deck()
            G.consumeables:emplace(card)
          return true
        end)}))
      if not card.ability.eternal then
        G.E_MANAGER:add_event(Event({
          func = function()
            play_sound('tarot1')
            card.T.r = -0.2
            card:juice_up(0.3, 0.4)
            card.states.drag.is = true
            card.children.center.pinch.x = true
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
              func = function()
                G.jokers:remove_card(card)
                card:remove()
                card = nil
              return true; end})) 
            return true
          end
        })) 
      end
      card.gone = true
    end
  end,
	cry_credits = {
		idea = {
			"notmario"
		},
		art = {
			"notmario"
		},
		code = {
			"notmario"
		}
	},
}
local spectrogram = {
	object_type = "Joker",
	name = "cry-Spectrogram",
	key = "spectrogram",
	pos = { x = 1, y = 5 },
	config = { extra = {} },
	rarity = "cry_epic",
	cost = 9,
	order = 133,
	atlas = "atlasepic",
	loc_vars = function(self, info_queue, center)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_cry_echo

		return { vars = {} }
	end,
    calculate = function(self, card, context)
		if context.retrigger_joker_check and not context.retrigger_joker and context.other_card ~= self then
			if context.other_context.scoring_hand then
				if context.other_card == G.jokers.cards[#G.jokers.cards] then
					local echonum = 0
					for i, v in pairs (context.other_context.scoring_hand) do
						if v.config.center_key == 'm_cry_echo' then
							echonum = echonum + 1
						end
					end
					if echonum > 0 then
						return {
							message = localize("k_again_ex"),
							repetitions = echonum,
							card = card,
						}
					end
				end
			end
		end
    end,
	cry_credits = {
		idea = {
			"AlexZGreat"
		},
		art = {
			"SMG9000"
		},
		code = {
			"AlexZGreat"
		}
	},
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
			"114",
			"leet",
			"666",
			"eee6",
			"21",
			"365",
			"2024",
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
			{ string = "Codes", colour = G.C.SECONDARY_SET.Code },
			{ string = "Specls", colour = G.C.SECONDARY_SET.Spectral },
			{ string = "Jolly", colour = G.C.CRY_JOLLY },
			{ string = "Tags", colour = G.C.RED },
			{ string = "Cryptids", colour = G.C.SECONDARY_SET.Spectral },
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
				total_rate = total_rate + (G.GAME[v:lower() .. "_rate"] or 0)
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
		curse_sob,
		bonusjoker,
		multjoker,
		goldjoker,
		altgoogol,
		soccer,
		fleshpanopticon,
		spectrogram,
	},
}
