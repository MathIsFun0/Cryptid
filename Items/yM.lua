
local jollysus = {
    object_type = "Joker",
    name = "cry-jollysus",
    key = "jollysus",
    pos = {x = 3, y = 1},
    config = {extra = {spawn = true, active = "Active!", inactive = ""}, jolly = {t_mult = 8, type = 'Pair'}},
    loc_txt = {
        name = 'Jolly Joker?',
        text = {
            "Create a {C:attention}Jolly Joker{}",
            "when a joker is {C:attention}sold{}",
            "{C:red}Works once per round{}",
            "{C:inactive}#1##2#{}"
        }
    },
    rarity = 1,
    cost = 5,
    blueprint_compat = true,
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = { set = 'Joker', key = 'j_jolly', specific_vars = {self.config.jolly.t_mult, self.config.jolly.type} }
        return {vars = {center.ability.extra.active, center.ability.extra.inactive}}
    end,
    atlas = "atlastwo",
    calculate = function(self, card, context)
        if context.end_of_round and not context.retrigger_joker and not context.blueprint then
            if not card.ability.extra.spawn then
                card.ability.extra.active = "Active!"
                card.ability.extra.inactive = ""
                card.ability.extra.spawn = true
                return {
                    	message = localize('k_reset'),
                        card = card,
			}
            end
        end
        if ((context.selling_card and context.card.ability.name == "cry-jollysus") or context.selling_self) and card.ability.extra.spawn and not context.retrigger_joker then     --add support for selling itself (Blueprint compatible)
            if not context.blueprint and not context.retrigger_joker then      --ok tested this and making it sell itself next to blueprints doesn't make the blueprints create jokers, but it creates copies correctly when selling itself or blueprint so good enough for me
                card.ability.extra.active = "" --also this doesn't work with brainstorm either (what is this jank????)
                card.ability.extra.inactive = "No triggers left!"
                card.ability.extra.spawn = false
            end
            local card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_jolly')
            card:add_to_deck()
            G.jokers:emplace(card) --man, now that I think about it this is probably the most complicated joker i've done so far
            return {
                card_eval_status_text(card, 'extra', nil, nil, nil, {
                    message = "M!",
                    colour = G.C.FILTER,
                })
            }
        end
        if context.selling_card and card.ability.extra.spawn and not context.retrigger_joker then
            if context.card.ability.set == 'Joker' then
                if not context.blueprint and not context.retrigger_joker then
                    card.ability.extra.active = ""
                    card.ability.extra.inactive = "No triggers left!"
                    card.ability.extra.spawn = false
                end
                local card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_jolly')
                card:add_to_deck()
                G.jokers:emplace(card)
                return {
                    card_eval_status_text(card, 'extra', nil, nil, nil, {
                        message = "M!",
                        colour = G.C.FILTER,
			card = card
                    })
                }
            end
        end
    end
}

local kidnap = {
	object_type = "Joker",
	name = "cry-kidnap",
	key = "kidnap",
	pos = {x = 1, y = 2},
	config = {jolly = {t_mult = 8, type = 'Pair'}, zany = {t_mult = 12, type = 'Three of a Kind'}, mad = {t_mult = 10, type = 'Two Pair'}, crazy = {t_mult = 12, type = 'Straight'}, droll = {t_mult = 10, type = 'Flush'}, sly = {t_chips = 50, type = 'Pair'}},
	loc_txt = {
        name = 'Kidnapping',
        text = {
			"Create a {C:attention}Jolly Joker{} when",
			"{C:attention}Zany Joker{}, {C:attention}Mad Joker{},",
			"{C:attention}Crazy Joker{}, {C:attention}Droll Joker{},",
			"or {C:attention}Sly Joker{} is {C:attention}sold{}"
		}
    	},
	rarity = 1,
	cost = 1,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, center)
		info_queue[#info_queue+1] = { set = 'Joker', key = 'j_jolly', specific_vars = {self.config.jolly.t_mult, self.config.jolly.type} }
		info_queue[#info_queue+1] = { set = 'Joker', key = 'j_zany', specific_vars = {self.config.zany.t_mult, self.config.zany.type} }
		info_queue[#info_queue+1] = { set = 'Joker', key = 'j_mad', specific_vars = {self.config.mad.t_mult, self.config.mad.type} }
		info_queue[#info_queue+1] = { set = 'Joker', key = 'j_crazy', specific_vars = {self.config.crazy.t_mult, self.config.crazy.type} }
		info_queue[#info_queue+1] = { set = 'Joker', key = 'j_droll', specific_vars = {self.config.droll.t_mult, self.config.droll.type} }
		info_queue[#info_queue+1] = { set = 'Joker', key = 'j_sly', specific_vars = {self.config.sly.t_chips, self.config.sly.type} }
    	end,
	atlas = "atlasone",
	calculate = function(self, card, context) --I'm sure there is a more elegant way to do this but oh well
		if context.selling_card and context.card.ability.name == "Crazy Joker" and not context.blueprint then
				local card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_jolly')
                		card:add_to_deck()
                		G.jokers:emplace(card)
                		return {
                    		card_eval_status_text(card, 'extra', nil, nil, nil, {
                        		message = "M!",
                        		colour = G.C.FILTER,
					card = card
                    		})
                		}
		elseif context.selling_card and context.card.ability.name == "Zany Joker" and not context.blueprint then
				local card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_jolly')
                		card:add_to_deck()
                		G.jokers:emplace(card)
                		return {
                    		card_eval_status_text(card, 'extra', nil, nil, nil, {
                        		message = "M!",
                        		colour = G.C.FILTER,
					card = card
                    		})
                		}
		elseif context.selling_card and context.card.ability.name == "Droll Joker" and not context.blueprint then
				local card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_jolly')
                		card:add_to_deck()
                		G.jokers:emplace(card)
                		return {
                    		card_eval_status_text(card, 'extra', nil, nil, nil, {
                        		message = "M!",
                        		colour = G.C.FILTER,
					card = card
                    		})
                		}
		elseif context.selling_card and context.card.ability.name == "Mad Joker" and not context.blueprint then
				local card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_jolly')
                		card:add_to_deck()
                		G.jokers:emplace(card)
                		return {
                    		card_eval_status_text(card, 'extra', nil, nil, nil, {
                        		message = "M!",
                        		colour = G.C.FILTER,
					card = card
                    		})
                		}
		elseif context.selling_card and context.card.ability.name == "Sly Joker" and not context.blueprint then
				local card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_jolly')
                		card:add_to_deck()
                		G.jokers:emplace(card)
                		return {
                    		card_eval_status_text(card, 'extra', nil, nil, nil, {
                        		message = "M!",
                        		colour = G.C.FILTER,
					card = card
                    		})
                		}
		end
	end
}

local bubblem = {
    object_type = "Joker",
    name = "cry-bubblem",
    key = "bubblem",
    pos = {x = 0, y = 0},
    config = {extra = {spawn = false, type = "Three of a Kind"}, jolly = {t_mult = 8, type = 'Pair'}}, --Kind is capitalized (see The Trio) so don't change this back pls and ty
    loc_txt = {
    name = 'Bubble M',
    text = {
    	"Create a {C:dark_edition}Foil {C:attention}Jolly Joker{}",
    	"if played hand contains",
    	"a {C:attention}#1#{}",
    	"{C:red,E:2}self destructs{}",
    	}
    },
    rarity = 1,
    cost = 2,
    eternal_compat = false,
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = { set = 'Joker', key = 'j_jolly', specific_vars = {self.config.jolly.t_mult, self.config.jolly.type} }
	info_queue[#info_queue+1] = G.P_CENTERS.e_foil
    return {vars = {center.ability.extra.type}}
    end,
    atlas = "atlasone",
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.before and next(context.poker_hands['Three of a Kind']) and not context.blueprint and not context.retrigger_joker then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound('tarot1')
                    card.T.r = -0.2
                    card:juice_up(0.3, 0.4)
                    card.states.drag.is = true
                    card.children.center.pinch.x = true
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after', delay = 0.3, blockable = false,
                        func = function()
                            G.jokers:remove_card(self)
                            card:remove()
                            card = nil
                            return true
                        end
                    }))
                    return true
                end
            }))
            local card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_jolly')
            card:set_edition({
                foil = true
            })
            card:add_to_deck()
            G.jokers:emplace(card)
            return {
                card_eval_status_text(card, 'extra', nil, nil, nil, {
                    message = "M!",
                    colour = G.C.FILTER,
                })
            }
        end 
    end
}

local foodm = {
    object_type = "Joker",
    name = "cry-foodm",
    key = "foodm",
    config = {extra = {mult = 50, rounds_remaining = 2, text = "s", round_inc = 1}, jolly = {t_mult = 8, type = 'Pair'}},
    pos = {x = 4, y = 2},
    loc_txt = {
        name = 'Fast Food M',
        text = {
            "{C:mult}+#1#{} Mult",
            "{C:red,E:2}self destructs{} in {C:attention}#2#{} round#3#",
            "Increases by {C:attention}#4#{} round when",
            "{C:attention}Jolly Joker{} is {C:attention}sold{}",
            "{C:inactive,s:0.8}2 McDoubles, 2 McChickens{}",
            "{C:inactive,s:0.8}Large Fries, 20 Piece{}",
            "{C:inactive,s:0.8}& Large Cake{}"
        }
    },
    rarity = 1,
    cost = 5,
    atlas = "atlasone",
    blueprint_compat = true,
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = { set = 'Joker', key = 'j_jolly', specific_vars = {self.config.jolly.t_mult, self.config.jolly.type} }
        return {vars = {center.ability.extra.mult, center.ability.extra.rounds_remaining, center.ability.extra.text, center.ability.extra.round_inc}}
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and (card.ability.extra.mult > 0) and not context.before and not context.after then
            return {
                message = localize{type='variable',key='a_mult',vars={card.ability.extra.mult}},
                mult_mod = card.ability.extra.mult, 
                colour = G.C.MULT
            }
        end
        if context.end_of_round and not context.blueprint and not context.individual and not context.repetition and not context.retrigger_joker then
            card.ability.extra.rounds_remaining = card.ability.extra.rounds_remaining - 1
            if card.ability.extra.rounds_remaining > 0 then
		return {
                    message = {"-1 Round"},
                    colour = G.C.FILTER
                }
            else
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
                                return true;
                            end
                        }))
                        return true
                    end
                }))
                return {
                    message = "M!"
                }
            end
        end
        if context.selling_card and context.card.ability.name == "Jolly Joker" and not context.blueprint and not context.retrigger_joker then
            card.ability.extra.rounds_remaining = card.ability.extra.rounds_remaining + card.ability.extra.round_inc
	    return {
            	    card_eval_status_text(card, 'extra', nil, nil, nil, {
                    message = "+"..card.ability.extra.round_inc.." Round",
                    colour = G.C.FILTER,
                })
            }
        end
        if card.ability.extra.rounds_remaining == 1 then --For text display
            card.ability.extra.text = ""
	else
	    card.ability.extra.text = "s"
	end
    end
}

local mstack = {
    object_type = "Joker",
    name = "cry-mstack",
    key = "mstack",
    config = {extra = {sell = 0, sell_req = 2, retriggers = 1, check = false}, jolly = {t_mult = 8, type = 'Pair'}},
    pos = {x = 2, y = 3},
    atlas = 'atlastwo',
    loc_txt = {
        name = 'M Stack',
        text = {
            "Retrigger all cards played",
            "once for every",
            "{C:attention}#2# Jolly Jokers{} sold",
            "{C:inactive}(Currently{}{C:attention:} #1#{}{C:inactive} retriggers){}",
        }
    },
    rarity = 3,
    cost = 7,
    blueprint_compat = true,
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = { set = 'Joker', key = 'j_jolly', specific_vars = {self.config.jolly.t_mult, self.config.jolly.type} }
        return {vars = {center.ability.extra.retriggers, center.ability.extra.sell_req}}
    end,
    calculate = function(self, card, context) --note: hardcoded like this intentionally
        if context.repetition then
            if context.cardarea == G.play then
                return {
                    message = localize('k_again_ex'),
                    repetitions = card.ability.extra.retriggers,
                    card = card
                }
            end
        end
        
        if context.selling_card and context.card.ability.name == "Jolly Joker" and not context.blueprint and not context.retrigger_joker then
	    card.ability.extra.check = true
            if card.ability.extra.sell + 1 >= card.ability.extra.sell_req then
                if not context.blueprint or context.retrigger_joker then
                    card.ability.extra.retriggers = card.ability.extra.retriggers + 1
                end
                card.ability.extra.sell = 0
                return {
                    card_eval_status_text(card, 'extra', nil, nil, nil, {
                        message = "Upgrade!",
                        colour = G.C.FILTER,
                    })
                }
            else
                card.ability.extra.sell = card.ability.extra.sell + 1
                return {
                    card_eval_status_text(card, 'extra', nil, nil, nil, {
                        message = card.ability.extra.sell.."/"..card.ability.extra.sell_req,
                        colour = G.C.FILTER,
                    })
                }
            end
        end
    end,
    add_to_deck = function(self, card, from_debuff) --Force retriggers to be 1 when bought/obtained on misprint deck (no 0.43 retriggers that do nothing)
	if card.ability.extra.retriggers ~= 1 and not card.ability.extra.check then card.ability.extra.retriggers = 1 end
    end
}

local mneon = {
    object_type = "Joker",
    name = "cry-mneon",
    key = "mneon",
    pos = {x = 4, y = 2},
    config = {extra = {bonus = 1, money = 0}, jolly = {t_mult = 8, type = 'Pair'}},
    loc_txt = {
        name = 'Neon M',
        text = {
            "Earn {C:money}$#2#{} at end of round",
            "Permanently increase payout by",
	    "{C:money}$#1#{} for each {C:attention}Jolly Joker{}",
	    "at end of round",
	    "{C:inactive}(Minimum of{} {C:money}$1{}{C:inactive}){}",
        }
    },
    rarity = 2,
    cost = 7,
    perishable_compat = false,
    blueprint_compat = false,
    loc_vars = function(self, info_queue, center)
	info_queue[#info_queue+1] = { set = 'Joker', key = 'j_jolly', specific_vars = {self.config.jolly.t_mult, self.config.jolly.type} }
        return {vars = {center.ability.extra.bonus, center.ability.extra.money}}
    end,
    atlas = "atlastwo",
    calculate = function(self, card, context)
        if context.end_of_round and not context.blueprint and not context.individual and not context.repetition then
            local jollycount = 0
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i].ability.name == 'Jolly Joker' then jollycount = jollycount + 1 end
            end
		if jollycount ~= 0 then
            		card.ability.extra.money = card.ability.extra.money + card.ability.extra.bonus * jollycount
			return {message = "M!"}
		else 
			card.ability.extra.money = card.ability.extra.money + 1
			return {message = "Upgrade!"}
		end
        end
    end,
    calc_dollar_bonus = function(self, card)
        if card.ability.extra.money > 0 then
            return card.ability.extra.money
        end
    end
}

local notebook = {
    object_type = "Joker",
    name = "cry-notebook",
    key = "notebook",
    pos = {x = 1, y = 0},
    config = {extra = {odds = 7, slot = 0, jollies = 5, check = true, active = "Active", inactive = ""}, jolly = {t_mult = 8, type = 'Pair'}},
    loc_txt = {
    name = 'Notebook',
    text = {
    	"{C:green} #1# in #2#{} chance to gain {C:dark_edition}+1{} Joker",
	"slot per {C:attention}reroll{} in the shop",
	"{C:green}Always triggers{} if there are",
	"{C:attention}#6#{} or more {C:attention}Jolly Jokers{}",
	"{C:red}Works once per round{}",
	"{C:inactive}(Currently {C:dark_edition}+#3#{}{C:inactive} and #4##5#){}"
    	}
    },
    rarity = 3,
    cost = 7,
    perishable_compat = false,
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = { set = 'Joker', key = 'j_jolly', specific_vars = {self.config.jolly.t_mult, self.config.jolly.type} }
	return {vars = {''..(G.GAME and G.GAME.probabilities.normal or 1), center.ability.extra.odds, center.ability.extra.slot, center.ability.extra.active, center.ability.extra.inactive, center.ability.extra.jollies}}
    end,
    atlas = "atlasone",
    calculate = function(self, card, context) --from testing this is sometimes giving me/displaying xmult when it shouldn't. maybe this is just an issue on my side? I'm not quite sure but this is very strange
    	    if context.reroll_shop and card.ability.extra.check and not context.blueprint and not context.retrigger_joker then
			local jollycount = 0
            		for i = 1, #G.jokers.cards do
                		if G.jokers.cards[i].ability.name == 'Jolly Joker' then jollycount = jollycount + 1 end
            		end
				if jollycount >= card.ability.extra.jollies then --if there are 5 or more jolly jokers
						card.ability.extra.slot = card.ability.extra.slot + 1
						G.jokers.config.card_limit = G.jokers.config.card_limit + 1
						card.ability.extra.check = false
						card.ability.extra.active = ""
						card.ability.extra.inactive = "Inactive"
						return {
                    					card_eval_status_text(card, 'extra', nil, nil, nil, {
                        				message = "Upgrade!",
                        				colour = G.C.DARK_EDITION,
                    				})
                				}
				else --default
					if pseudorandom('cry_notebook') < G.GAME.probabilities.normal/card.ability.extra.odds then
						card.ability.extra.slot = card.ability.extra.slot + 1
						G.jokers.config.card_limit = G.jokers.config.card_limit + 1
						card.ability.extra.check = false
						card.ability.extra.active = ""
						card.ability.extra.inactive = "Inactive"
						return {
                    					card_eval_status_text(card, 'extra', nil, nil, nil, {
                        				message = "Upgrade!",
                        				colour = G.C.DARK_EDITION,
                    				})
                				}
					else return {calculated = true} end
				end
	    end
	    if context.end_of_round and not context.retrigger_joker and not context.blueprint then
            	if not card.ability.extra.check then
                	card.ability.extra.check = true
			card.ability.extra.active = "Active"
			card.ability.extra.inactive = ""
                    	return {
                    	message = localize('k_reset'),
                        card = card,
			}
            	end
            end
    end,
    add_to_deck = function(self, card, from_debuff)
		G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.slot
    end,
    remove_from_deck = function(self, card, from_debuff)
		G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra.slot
    end
}

local bonk = {
	object_type = "Joker",
	name = "cry-bonk",
	key = "bonk",
	pos = {x = 2, y = 2},
    	config = {extra = {chips = 6, bonus = 1, xchips = 3, type = "Pair", chipstext = 18}, jolly = {t_mult = 8, type = 'Pair'}},
	loc_txt = {
        name = 'Bonk',
        text = {
            "Each {C:attention}Joker{} gives {C:chips}+#1#{} Chips",
	    "Increase amount by {C:chips}+#2#{} if",
	    "{C:attention} poker hand{} is a {C:attention}#4#{}",
	    "{C:attention}Jolly Jokers{} give {C:chips}+#3#{} Chips"
		}
    	},
	loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = { set = 'Joker', key = 'j_jolly', specific_vars = {self.config.jolly.t_mult, self.config.jolly.type} }
		return {vars = {center.ability.extra.chips, center.ability.extra.bonus, center.ability.extra.chipstext, center.ability.extra.type}}
    	end,
	rarity = 1,
	cost = 5,
	blueprint_compat = true,
	perishable_compat = false,
	calculate = function(self, card, context)
	if context.cardarea == G.jokers and context.before and not context.blueprint then
				if context.scoring_name == card.ability.extra.type then
                            			card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.bonus
						card.ability.extra.chipstext = card.ability.extra.chips*card.ability.extra.xchips --value used for display
                            			card_eval_status_text(card, 'extra', nil, nil, nil, {
                               			message = localize('k_upgrade_ex'),
                                		colour = G.C.CHIPS
                            			})
				end
	end
        if context.other_joker and context.other_joker.ability.set == "Joker" and context.other_joker.ability.name ~= "Jolly Joker" then
            if not Talisman.config_file.disable_anims then 
                G.E_MANAGER:add_event(Event({
                    func = function()
                        context.other_joker:juice_up(0.5, 0.5)
                        return true
                    end
                })) 
            end
            return {
                message = localize{type='variable',key='a_chips',vars={card.ability.extra.chips}},
                chip_mod = card.ability.extra.chips
            }
	elseif context.other_joker and context.other_joker.ability.name == "Jolly Joker" then
            if not Talisman.config_file.disable_anims then 
                G.E_MANAGER:add_event(Event({
                    func = function()
                        context.other_joker:juice_up(0.5, 0.5)
                        return true
                    end
                })) 
            end
            return {
                message = localize{type='variable',key='a_chips',vars={card.ability.extra.chipstext}},
                chip_mod = card.ability.extra.chips*card.ability.extra.xchips
            }
        end
	end,
	atlas = "atlasone",
}

local morse = {
    object_type = "Joker",
    name = "cry-morse",
    key = "morse",
    pos = {x = 5, y = 1},
    config = {extra = {bonus = 2, money = 1, Xmoney = 2}, jolly = {t_mult = 8, type = 'Pair'}},
    loc_txt = {
        name = 'Morse Code',
        text = {
            "Earn {C:money}$#2#{} at end of round",
            "Increase payout by {C:money}$#1#{} when a",
	    "Joker with an {C:attention}Edition{} is {C:attention}sold{}",
	    "Gain {X:money,C:white} X#3# {} if {C:attention}sold{} Joker",
	    "was {C:attention}Jolly Joker"
        }
    },
    rarity = 3,
    cost = 8,
    perishable_compat = false,
    blueprint_compat = false,
    loc_vars = function(self, info_queue, center)
	info_queue[#info_queue+1] = { set = 'Joker', key = 'j_jolly', specific_vars = {self.config.jolly.t_mult, self.config.jolly.type} }
        return {vars = {center.ability.extra.bonus, center.ability.extra.money, center.ability.extra.Xmoney}}
    end,
    atlas = "atlastwo",
    calculate = function(self, card, context)
        if context.selling_card and context.card.edition and context.card.ability.name == "Jolly Joker" and not context.blueprint then
            card.ability.extra.money = card.ability.extra.money + card.ability.extra.Xmoney*card.ability.extra.bonus
	    return {
                    card_eval_status_text(card, 'extra', nil, nil, nil, {
                    message = "M!",
                    colour = G.C.MONEY,
                    })
            }
	elseif context.selling_card and context.card.ability.set == 'Joker' and context.card.edition and not context.blueprint then
	    card.ability.extra.money = card.ability.extra.money + card.ability.extra.bonus
	    return {
                    card_eval_status_text(card, 'extra', nil, nil, nil, {
                    message = "Upgrade!",
                    colour = G.C.MONEY,
                    })
            }
        end
    end,
    calc_dollar_bonus = function(self, card)
        if card.ability.extra.money > 0 then
            return card.ability.extra.money
        end
    end
}

local loopy = {
    object_type = "Joker",
    name = "cry-loopy",
    key = "loopy",
    config = {extra = {handsize = 0, handsize_mod = 3}, jolly = {t_mult = 8, type = 'Pair'}},
    pos = {x = 4, y = 1},
    atlas = 'atlastwo',
    loc_txt = {
        name = 'Loopy',
        text = {
            "{C:attention}+#2#{} hand size until end of round",
            "when {C:attention}Jolly Joker{} is sold",
            "{C:inactive}(Currently{}{C:attention:} +#1#{}{C:inactive}){}",
	    "{C:inactive,s:0.8}There wasn't enough room...{}"
        }
    },
    rarity = 1,
    cost = 4,
    joker_gate = "Jolly Joker",
    blueprint_compat = true,
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = { set = 'Joker', key = 'j_jolly', specific_vars = {self.config.jolly.t_mult, self.config.jolly.type} }
        return {vars = {center.ability.extra.handsize, center.ability.extra.handsize_mod}}
    end,
    calculate = function(self, card, context) --note: hardcoded like this intentionally
        if context.selling_card and context.card.ability.name == "Jolly Joker" and not context.blueprint and not context.retrigger_joker then
                card.ability.extra.handsize = card.ability.extra.handsize + card.ability.extra.handsize_mod
		G.hand:change_size(card.ability.extra.handsize_mod)
                return {
                    card_eval_status_text(card, 'extra', nil, nil, nil, {
                        message = "Upgrade!",
                        colour = G.C.FILTER,
                    })
                }
        end
	if context.end_of_round and card.ability.extra.handsize ~= 0 and not context.blueprint and not context.retrigger_joker and not context.individual and not context.repetition then
			G.hand:change_size(-card.ability.extra.handsize)
			card.ability.extra.handsize = 0
            		return {
                    	message = localize('k_reset'),
                        card = card,
			}
	end
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-card.ability.extra.handsize or 0)
    end
}
local scrabble = {
	object_type = "Joker",
	name = "cry-scrabble",
	key = "scrabble",
	config = {extra = {odds = 4}, jolly = {t_mult = 8, type = 'Pair'}},
	pos = {x = 0, y = 2},
	loc_txt = {
        name = 'Scrabble Tile',
        text = {
			"{C:green}#1# in #2#{} chance to",
			"create a {C:attention}Jolly Joker{}",
			"when hand is played"
		}
    },
	rarity = 2,
	cost = 6,
	blueprint_compat = true,
	atlas = "atlasone",
	loc_vars = function(self, info_queue, center)
		info_queue[#info_queue+1] = { set = 'Joker', key = 'j_jolly', specific_vars = {self.config.jolly.t_mult, self.config.jolly.type} }
		return {vars = {''..(G.GAME and G.GAME.probabilities.normal or 1), center.ability.extra.odds}}
	end,
	calculate = function(self, card, context)
		if context.cardarea == G.jokers and context.before and not context.retrigger_joker then
			if pseudorandom('scrabble') < G.GAME.probabilities.normal/card.ability.extra.odds then
				local card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_jolly')
            			card:add_to_deck()
            			G.jokers:emplace(card)
            			return {
                    		message = ("M!"),
                        	card = card,
				}
			else return {calculated = true} end
		end
	end,
}
local sacrifice = {
	object_type = "Joker",
	name = "cry-sacrifice",
	key = "sacrifice",
	config = {extra = {text = "Active!", spawn = true}, jolly = {t_mult = 8, type = 'Pair'}},
	pos = {x = 5, y = 2},
	loc_txt = {
        name = 'Sacrifice',
        text = {
			"Create 4 {C:attention}Jolly Jokers{}",
			"when a {C:spectral}Spectral{} card is used",
			"{C:red}Works once per round{}",
			"{C:inactive}#1#{}"
		}
    },
	rarity = 1,
	cost = 4,
	blueprint_compat = true,
	atlas = "atlasone",
	loc_vars = function(self, info_queue, center)
		info_queue[#info_queue+1] = { set = 'Joker', key = 'j_jolly', specific_vars = {self.config.jolly.t_mult, self.config.jolly.type} }
		return {vars = {center.ability.extra.text}}
	end,
	calculate = function(self, card, context)
		if context.using_consumeable and card.ability.extra.spawn and not context.retrigger_joker then
            if context.consumeable.ability.set == "Spectral" then
				if not context.blueprint then card.ability.extra.spawn = false end
				if not card.ability.extra.spawn then card.ability.extra.text = "No triggers left!" end
				for i = 1, 4 do
					local jolly = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_jolly')
					jolly:add_to_deck()
					G.jokers:emplace(jolly)
				end
				card_eval_status_text(card, 'extra', nil, nil, nil, {message = "M!", colour = G.C.SPECTRAL})
				return true
			end
		end
		if context.end_of_round and not context.retrigger_joker and not context.blueprint then
			if not card.ability.extra.spawn then
				card.ability.extra.spawn = true
				card.ability.extra.text = "Active!"
				return {
					message = localize('k_reset'),
					card = card,
				}
			end
		end
	end,
}
local reverse = {
	object_type = "Joker",
	name = "cry-reverse",
	key = "reverse",
	config = {extra = {type = "Pair", spawn = 0}, jolly = {t_mult = 8, type = 'Pair'}},
	pos = {x = 0, y = 0},
	loc_txt = {
        name = 'Reverse Card',
        text = {
			"Create a {C:dark_edition}Holographic{} {C:attention}Jolly{}",
			"{C:attention}Joker{} if {C:attention}discarded{} poker",
			"hand is a {C:attention}#1#{}",
			"{C:red,E:2}self destructs{}"
		}
    	},
	rarity = 2,
	cost = 4,
	atlas = "atlastwo",
	loc_vars = function(self, info_queue, center)
		info_queue[#info_queue+1] = { set = 'Joker', key = 'j_jolly', specific_vars = {self.config.jolly.t_mult, self.config.jolly.type} }
		info_queue[#info_queue+1] = G.P_CENTERS.e_holographic
		return {vars = {center.ability.extra.type}}
	end,
	calculate = function(self, card, context)
		if context.pre_discard and not context.retrigger_joker and not context.blueprint then
			if G.FUNCS.get_poker_hand_info(G.hand.highlighted) == "Pair" then
				G.E_MANAGER:add_event(Event({
                			func = function()
                    			play_sound('tarot1')
                    			card.T.r = -0.2
                    			card:juice_up(0.3, 0.4)
                    			card.states.drag.is = true
                   			card.children.center.pinch.x = true
                    			G.E_MANAGER:add_event(Event({
                        			trigger = 'after', delay = 0.3, blockable = false,
                        			func = function()
			                            G.jokers:remove_card(self)
                            			card:remove()
                            			card = nil
                            			return true
                        			end
                    			}))
                    			return true
                			end
            			}))
                        	local card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_jolly')
            				card:set_edition({
                				holo = true --certified Thunk moment, this literally took ten minutes to figure out why is it set up like this
            				})
            				card:add_to_deck()
            				G.jokers:emplace(card)
            				return {
                				card_eval_status_text(card, 'extra', nil, nil, nil, {
                    				message = "M!",
                    				colour = G.C.FILTER,
                				})
            				}
			end
                end
	end,
}

local doodlem = {
    object_type = "Joker",
    name = "cry-doodlem",
    key = "doodlem",
    atlas = "atlasepic",
    config = {jolly = {t_mult = 8, type = 'Pair'}},
    pos = {x = 2, y = 0},
    loc_txt = {
        name = 'Doodle M',
        text = {
            "Create a {C:dark_edition}Negative{} {C:attention}consumable{}",
            "for each {C:attention}Jolly Joker{}",
            "when {C:attention}Blind{} is selected",
	    "{C:inactive}(Minimum of 2){}"
        }
    },
    rarity = "cry_epic",
    joker_gate = "Jolly Joker",
    cost = 13,
    blueprint_compat = true,
    loc_vars = function(self, info_queue, center)
	info_queue[#info_queue+1] = { set = 'Joker', key = 'j_jolly', specific_vars = {self.config.jolly.t_mult, self.config.jolly.type} }
	info_queue[#info_queue+1] = G.P_CENTERS.e_negative --replace this with the consumable one later
    end,
    calculate = function(self, card, context)
        if context.setting_blind and not (context.blueprint_card or self).getting_sliced then
	    local jollycount = 0
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i].ability.name == 'Jolly Joker' then jollycount = jollycount + 1 end
            end
			if jollycount < 2 then jollycount = 2 end
		for i = 1, jollycount do
                        	local card = create_card('Consumeables', G.consumeables, nil, nil, nil, nil, nil, 'cry_doodlem')
                        	card:set_edition({negative = true})
                        	card:add_to_deck()
                        	G.consumeables:emplace(card)
				card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+1 Consumeable", colour = G.C.PURPLE})
		end
		return true
        end
    end
}
--Notes: I've had visual issues when playing with this joker. Dunno what's up with that
local virgo = {
	object_type = "Joker",
	name = "cry-virgo",
	key = "virgo",
	pos = {x = 1, y = 2},
	soul_pos = {x = 10, y = 0, extra = {x = 2, y = 2}},
	config = {extra = {bonus = 4, type = "Pair"}, jolly = {t_mult = 8, type = 'Pair'}},
	loc_txt = {
        name = 'Virgo',
        text = {
			"This Joker gains {C:money}$#1#{} of {C:attention}sell value{}",
			"if {C:attention}poker hand{} is a {C:attention}#2#{}",
			"Sell this card to create a",
			"{C:dark_edition}Polychrome{} {C:attention}Jolly Joker{} for",
			"every {C:money}$4{} of {C:attention}sell value{}",
			"{C:inactive}(Minimum of 1){}"
		}
    },
	rarity = "cry_epic",
	cost = 8,
	eternal_compat = false,
	loc_vars = function(self, info_queue, center)
		info_queue[#info_queue+1] = { set = 'Joker', key = 'j_jolly', specific_vars = {self.config.jolly.t_mult, self.config.jolly.type} }
		info_queue[#info_queue+1] = G.P_CENTERS.e_polychrome
	return {vars = {center.ability.extra.bonus, center.ability.extra.type}}
    	end,
	atlas = "atlasepic",
	calculate = function(self, card, context)
        	if context.cardarea == G.jokers and context.before and not context.blueprint then
				if context.scoring_name == card.ability.extra.type then
                            			card.ability.extra_value = card.ability.extra_value + card.ability.extra.bonus --this doesn't seem to work with retrigger jokers. Intentional?
                            			card:set_cost()
                            			card_eval_status_text(card, 'extra', nil, nil, nil, {
                               			message = localize('k_upgrade_ex'),
                                		colour = G.C.MONEY
                            			})
				end
		end
		if context.selling_self and not context.blueprint and not context.retrigger_joker then
			G.E_MANAGER:add_event(Event({
			func = (function()
				G.E_MANAGER:add_event(Event({
					func = function()
						local summon = math.floor((card.ability.extra_value + 4)*0.25) -- +4 to account for default sell value (certified no source code moment)
						if summon < 1 then summon = 1 end --precautionary measure, just in case
						print(summon)
						for i = 1, summon do
							local card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_jolly')
							card:set_edition({
								polychrome = true
							})
							card:add_to_deck()
							G.jokers:emplace(card)
						end
						return true					
					end})) 
					card_eval_status_text(card, 'extra', nil, nil, nil, {message = "M!", colour = G.C.DARK_EDITION})
				return true
			end)}))
			return {completed=true}
		end
	end
	
}
local smallestm = {
    	object_type = "Joker",
	name = "cry-smallestm",
	key = "smallestm",
    	config = {extra = {Xchips = 9, type = "Pair", check = false, text = "Inactive"}},
	pos = {x = 5, y = 0},
	loc_txt = {
        name = 'Tiny',
        text = {
            "{X:chips,C:white} X#1# {} Chips until end",
	    "of round if {C:attention}poker hand{}",
	    "is a {C:attention}#2#{}",
	    "{C:inactive}(Currently {C:attention}#3#{}{C:inactive}){}",
	    "{C:inactive,s:0.8}ok so basically i'm very smol"
        }
    	},
	rarity = "cry_epic",
	cost = 8,
	blueprint_compat = true,
	atlas = "atlasepic",
    	loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.Xchips, center.ability.extra.type, center.ability.extra.text}}
    	end,
    	calculate = function(self, card, context)
        	if context.cardarea == G.jokers and card.ability.extra.check and not context.before and not context.after then
            	return {
                	message = "X"..card.ability.extra.Xchips,
                	Xchip_mod = card.ability.extra.Xchips,
                	colour = G.C.CHIPS
            	}
        	end
		if context.cardarea == G.jokers and context.before and not context.blueprint then
			if context.scoring_name == card.ability.extra.type and not card.ability.extra.check then
				card.ability.extra.check = true
				card_eval_status_text(card, 'extra', nil, nil, nil, {
                        	message = localize('k_active_ex'),
                        	colour = G.C.FILTER
                        	})
				card.ability.extra.text = "Active"
			end
		end
		if context.end_of_round and card.ability.extra.check and not context.blueprint and not context.retrigger_joker and not context.individual and not context.repetition then
			card.ability.extra.check = false
			card.ability.extra.text = "Inactive"
            		return {
                    	message = localize('k_reset'),
                        card = card,
			}
		end
    	end
}
local ret_items = {jollysus,kidnap,bubblem,foodm,mstack,mneon,notebook,bonk,morse,loopy,scrabble,sacrifice,reverse}
if cry_enable_epics then
    for _, jkr in pairs({doodlem, virgo, smallestm}) do
        ret_items[#ret_items+1] = jkr
        G.P_JOKER_RARITY_POOLS.cry_epic[#G.P_JOKER_RARITY_POOLS.cry_epic+1] = jkr
    end
end
return {name = "M Jokers", 
        init = function()
            
        end,
        items = ret_items}
