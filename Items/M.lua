cry_minvasion = false
if not Cryptid then Cryptid = {} end
Cryptid.M_jokers = {
    j_cry_m = true,
    j_cry_M = true,
}   -- Global table for M Jokers

local jollysus = {
    object_type = "Joker",
    name = "cry-jollysus",
    key = "jollysus",
    pos = {x = 3, y = 1},
    config = {extra = {spawn = true, active = "Active!"}},
    loc_txt = {
        name = 'Jolly Joker?',
        text = {
            "Create a {C:dark_edition}Jolly{} Joker",
            "when a Joker is {C:attention}sold{}",
            "{C:red}Works once per round{}",
            "{C:inactive}#1#{}",
	    "{C:inactive,s:0.8}Seems legit...{}"
        }
    },
    rarity = 1,
    cost = 4,
    blueprint_compat = true,
    eternal_compat = false,
    loc_vars = function(self, info_queue, center)
	--Add Jolly Edition to infoqueue later
        return {vars = {center.ability.extra.active}}
    end,
    atlas = "atlastwo",
    calculate = function(self, card, context)
        if context.end_of_round and not context.retrigger_joker and not context.blueprint then
            if not card.ability.extra.spawn then
                card.ability.extra.active = "Active!"
                card.ability.extra.spawn = true
                return {
                    	message = localize('k_reset'),
                        card = card,
			}
            end
        end
        if context.selling_card and card.ability.extra.spawn and not context.retrigger_joker then
            if context.card.ability.set == 'Joker' then
                if not context.blueprint and not context.retrigger_joker then
                    card.ability.extra.active = "No triggers left!"
                    card.ability.extra.spawn = false
                end
                local card = create_card("Joker", G.jokers, nil, nil, nil, nil, nil, "jollysus")
		card:set_edition({cry_m = true})
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
	elseif context.selling_self and card.ability.extra.spawn and not context.retrigger_joker then
                if not context.blueprint and not context.retrigger_joker then
                    card.ability.extra.active = "No triggers left!"
                    card.ability.extra.spawn = false
                end
                local card = create_card("Joker", G.jokers, nil, nil, nil, nil, nil, "jollysus")
		card:set_edition({cry_m = true})
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
if JokerDisplay then
    jollysus.joker_display_definition = {
        reminder_text = {
            { text = "(" },
            { ref_table = "card.ability.extra", ref_value = "active" },
            { text = ")" },
        },
    }
end
--TODO
--Fix Incompatiblity with Brainstorm (the joker not the mod)
--Make Blueprints create copies when this is sold to the right of Blueprint
local kidnap = {
	object_type = "Joker",
	name = "cry-kidnap",
	key = "kidnap",
	pos = {x = 1, y = 2},
	config = {extra = {money = 40}, jolly = {t_mult = 8, type = 'Pair'}, zany = {t_mult = 12, type = 'Three of a Kind'}, mad = {t_mult = 10, type = 'Two Pair'}, crazy = {t_mult = 12, type = 'Straight'}, droll = {t_mult = 10, type = 'Flush'}},
	loc_txt = {
        name = 'Kidnapping',
        text = {
			"Earn {C:money}$#1#{} and Create a {C:attention}Jolly{}",
			"{C:attention}Joker{} when {C:attention}Zany Joker{},",
			"{C:attention}Mad Joker{}, {C:attention}Crazy Joker{},",
			"or {C:attention}Droll Joker{} is {C:attention}sold{}"
		}
    	},
	rarity = 1,
	cost = 1,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, center)
		info_queue[#info_queue+1] = { set = 'Joker', key = 'j_jolly', specific_vars = {self.config.jolly.t_mult, localize(self.config.jolly.type, 'poker_hands')} }
		info_queue[#info_queue+1] = { set = 'Joker', key = 'j_zany', specific_vars = {self.config.zany.t_mult, localize(self.config.zany.type, 'poker_hands')} }
		info_queue[#info_queue+1] = { set = 'Joker', key = 'j_mad', specific_vars = {self.config.mad.t_mult, localize(self.config.mad.type, 'poker_hands')} }
		info_queue[#info_queue+1] = { set = 'Joker', key = 'j_crazy', specific_vars = {self.config.crazy.t_mult, localize(self.config.crazy.type, 'poker_hands')} }
		info_queue[#info_queue+1] = { set = 'Joker', key = 'j_droll', specific_vars = {self.config.droll.t_mult, localize(self.config.droll.type, 'poker_hands')} }
		return {vars = {center.ability.extra.money}}
    	end,
	atlas = "atlasone",
	calculate = function(self, card, context) --I'm sure there is a more elegant way to do this but oh well
		if context.selling_card and (context.card.ability.name == "Crazy Joker" or context.card.ability.name == "Zany Joker" or context.card.ability.name == "Mad Joker" or context.card.ability.name == "Droll Joker") then
			ease_dollars(card.ability.extra.money)
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
if JokerDisplay then
    kidnap.joker_display_definition = {
        text = {
            { text = "+$" },
            { ref_table = "card.ability.extra", ref_value = "money" },
        },
        text_config = { colour = G.C.GOLD },
    }
end
local bubblem = {
    object_type = "Joker",
    name = "cry-bubblem",
    key = "bubblem",
    pos = {x = 0, y = 0},
    config = {extra = {spawn = false, type = "Three of a Kind"}, jolly = {t_mult = 8, type = 'Pair'}},
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
        info_queue[#info_queue+1] = { set = 'Joker', key = 'j_jolly', specific_vars = {self.config.jolly.t_mult, localize(self.config.jolly.type, 'poker_hands')} }
	info_queue[#info_queue+1] = G.P_CENTERS.e_foil
    return {vars = {localize(center.ability.extra.type, 'poker_hands')}}
    end,
    atlas = "atlasone",
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.before and next(context.poker_hands[card.ability.extra.type]) and not context.blueprint and not context.retrigger_joker then
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
if JokerDisplay then
    bubblem.joker_display_definition = {
        reminder_text = {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
            { text = ")" },
        },
        reminder_text_config = { scale = 0.35 },
        calc_function = function(card)
            card.joker_display_values.localized_text = localize(card.ability.extra.type, 'poker_hands')
        end
    }
end
local foodm = {
    object_type = "Joker",
    name = "cry-foodm",
    key = "foodm",
    config = {extra = {mult = 40, rounds_remaining = 2, text = "s", round_inc = 1}, jolly = {t_mult = 8, type = 'Pair'}},
    pos = {x = 4, y = 2},
    loc_txt = {
        name = 'Fast Food M',
        text = {
            "{C:mult}+#1#{} Mult",
            "{C:red,E:2}self destructs{} in {C:attention}#2#{} round#3#",
            "Increases by {C:attention}#4#{} round when",
            "{C:attention}Jolly Joker{} is {C:attention}sold{}",
            "{C:inactive,s:0.8}2 McDoubles, 2 McChickens{}",
            "{C:inactive,s:0.8}Large Fries, 20 Piece & Large Cake{}"
        }
    },
    rarity = 1,
    cost = 5,
    atlas = "atlasone",
    blueprint_compat = true,
    eternal_compat = false,
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = { set = 'Joker', key = 'j_jolly', specific_vars = {self.config.jolly.t_mult, localize(self.config.jolly.type, 'poker_hands')} }
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
        if context.selling_card and not context.blueprint and not context.retrigger_joker
	and (context.card.ability.name == "Jolly Joker" or (context.card.edition and context.card.edition.key == "e_cry_m")) then
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
if JokerDisplay then
    foodm.joker_display_definition = {
        text = {
            { text = "+" },
            { ref_table = "card.ability.extra", ref_value = "mult", retrigger_type = "mult" }
        },
        text_config = { colour = G.C.MULT },
        reminder_text = {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "rounds_remaining" },
            { text = ")" },
        },
        calc_function = function(card)
            card.joker_display_values.rounds_remaining = localize { type = 'variable', key = 'loyalty_inactive', vars = { card.ability.extra.rounds_remaining or 2 } }
        end,
    }
end
local mstack = {
    object_type = "Joker",
    name = "cry-mstack",
    key = "mstack",
    config = {extra = {sell = 0, sell_req = 3, retriggers = 1, check = false}, jolly = {t_mult = 8, type = 'Pair'}},
    pos = {x = 2, y = 3},
    atlas = 'atlastwo',
    loc_txt = {
        name = 'M Stack',
        text = {
            "Retrigger all cards played",
            "once for every",
            "{C:attention}#2#{} {C:inactive}[#3#]{} {C:attention}Jolly Jokers{} sold",
            "{C:inactive}(Currently{}{C:attention:} #1#{}{C:inactive} retriggers){}",
        }
    },
    rarity = 3,
    cost = 7,
    blueprint_compat = true,
    perishable_compat = false,
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = { set = 'Joker', key = 'j_jolly', specific_vars = {self.config.jolly.t_mult, localize(self.config.jolly.type, 'poker_hands')} }
        return {vars = {center.ability.extra.retriggers, center.ability.extra.sell_req, center.ability.extra.sell}}
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
        
        if context.selling_card and (context.card.ability.name == "Jolly Joker" or (context.card.edition and context.card.edition.key == "e_cry_m"))
	and not context.blueprint and not context.retrigger_joker then
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
	card.ability.extra.retriggers = math.floor(card.ability.extra.retriggers)
	if card.ability.extra.retriggers < 1 and not card.ability.extra.check then card.ability.extra.retriggers = 1 end
    end
}
if JokerDisplay then
    mstack.joker_display_definition = {
        reminder_text = {
            { text = "(" },
            { ref_table = "card.ability.extra", ref_value = "retriggers", colour = G.C.ORANGE, retrigger_type = "mult" },
            { text = ")" },
        },
        retrigger_function = function(playing_card, scoring_hand, held_in_hand, joker_card)
            if held_in_hand then return 0 end
            return (joker_card.ability.extra.retriggers * JokerDisplay.calculate_joker_triggers(joker_card)) or 0
        end
    }
end
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
            "Increase payout by",
	    "{C:money}$#1#{} for each {C:attention}Jolly Joker{}",
	    "at end of round",
	    "{C:inactive}(Minimum increase of{} {C:money}$1{}{C:inactive}){}",
        }
    },
    rarity = 2,
    cost = 7,
    perishable_compat = false,
    blueprint_compat = false,
    loc_vars = function(self, info_queue, center)
	info_queue[#info_queue+1] = { set = 'Joker', key = 'j_jolly', specific_vars = {self.config.jolly.t_mult, localize(self.config.jolly.type, 'poker_hands')} }
        return {vars = {center.ability.extra.bonus, center.ability.extra.money}}
    end,
    atlas = "atlastwo",
    calculate = function(self, card, context)
        if context.end_of_round and not context.blueprint and not context.individual and not context.repetition then
            local jollycount = 0
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i].ability.name == 'Jolly Joker'
		or G.jokers.cards[i].edition and G.jokers.cards[i].edition.key == "e_cry_m"
		then jollycount = jollycount + 1 end
            end
		if (card.ability.extra.bonus * jollycount) > 1 then
            		card.ability.extra.money = card.ability.extra.money + card.ability.extra.bonus * jollycount
			return {message = "M!"}
		else 
			card.ability.extra.money = card.ability.extra.money + math.max(1, card.ability.extra.bonus)
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
if JokerDisplay then
    mneon.joker_display_definition = {
        text = {
            { text = "+$" },
            { ref_table = "card.ability.extra", ref_value = "money" },
        },
        text_config = { colour = G.C.GOLD },
        reminder_text = {
            { ref_table = "card.joker_display_values", ref_value = "localized_text" },
        },
        calc_function = function(card)
            card.joker_display_values.localized_text = "(" .. localize("k_round") .. ")"
        end
    }
end
local notebook = {
    object_type = "Joker",
    name = "cry-notebook",
    key = "notebook",
    pos = {x = 1, y = 0},
    config = {extra = {odds = 7, slot = 0, jollies = 4, check = true, active = "Active", inactive = ""}, jolly = {t_mult = 8, type = 'Pair'}},
	immune_to_chemach = true,
    loc_txt = {
    name = 'Notebook',
    text = {
    	"{C:green} #1# in #2#{} chance to gain {C:dark_edition}+1{} Joker",
	"slot per {C:attention}reroll{} in the shop",
	"{C:green}Always triggers{} if there are",
	"{C:attention}#5#{} or more {C:attention}Jolly Jokers{}",
	"{C:red}Works once per round{}",
	"{C:inactive}(Currently {C:dark_edition}+#3#{}{C:inactive} and #4#){}"
    	}
    },
    rarity = 3,
    cost = 9,
    perishable_compat = false,
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = { set = 'Joker', key = 'j_jolly', specific_vars = {self.config.jolly.t_mult, localize(self.config.jolly.type, 'poker_hands')} }
	return {vars = {''..(G.GAME and G.GAME.probabilities.normal or 1), center.ability.extra.odds, center.ability.extra.slot, center.ability.extra.active, center.ability.extra.jollies}}
    end,
    atlas = "atlasone",
    calculate = function(self, card, context)
    	    if context.reroll_shop and card.ability.extra.check and not context.blueprint and not context.retrigger_joker then
			local jollycount = 0
            		for i = 1, #G.jokers.cards do
                		if G.jokers.cards[i].ability.name == 'Jolly Joker'
				or G.jokers.cards[i].edition and G.jokers.cards[i].edition.key == "e_cry_m"
				then jollycount = jollycount + 1 end
            		end
				if jollycount >= card.ability.extra.jollies then --if there are 5 or more jolly jokers
						card.ability.extra.slot = card.ability.extra.slot + 1
						G.jokers.config.card_limit = G.jokers.config.card_limit + 1
						card.ability.extra.check = false
						card.ability.extra.active = "Inactive"
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
						card.ability.extra.active = "Inactive"
						return {
                    					card_eval_status_text(card, 'extra', nil, nil, nil, {
                        				message = "Upgrade!",
                        				colour = G.C.DARK_EDITION,
                    				})
                				}
					else return nil, true end
				end
	    end
	    if context.end_of_round and not context.retrigger_joker and not context.blueprint then
            	if not card.ability.extra.check then
                	card.ability.extra.check = true
			card.ability.extra.active = "Active"
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
if JokerDisplay then
    notebook.joker_display_definition = {
        reminder_text = {
            { text = "(" },
            { ref_table = "card.ability.extra",        ref_value = "slot" },
            { text = ") " },
            { ref_table = "card.joker_display_values", ref_value = "localized_text" },
        },
        extra = {
            {
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "odds" },
                { text = " in " },
                { ref_table = "card.ability.extra",        ref_value = "odds" },
                { text = ")" },
            }
        },
        extra_config = { colour = G.C.GREEN, scale = 0.3 },
        calc_function = function(card)
            card.joker_display_values.localized_text = "(" ..
                (card.ability.extra.check and localize("k_active_ex") or "Inactive") .. ")"
            card.joker_display_values.odds = G.GAME and G.GAME.probabilities.normal or 1
        end
    }
end
local bonk = {
	object_type = "Joker",
	name = "cry-bonk",
	key = "bonk",
	pos = {x = 2, y = 2},
	config = {extra = {chips = 6, bonus = 1, xchips = 3, type = "Pair"}, jolly = {t_mult = 8, type = 'Pair'}},
	loc_txt = {
		name = 'Bonk',
		text = {
			"Each {C:attention}Joker{} gives {C:chips}+#1#{} Chips",
			"Increase amount by {C:chips}+#2#{} if",
			"{C:attention} poker hand{} is a {C:attention}#3#{}",
			"{C:inactive,s:0.8}Jolly Jokers give{} {C:chips,s:0.8}+#4#{} {C:inactive,s:0.8}Chips instead{}"
		}
	},
    pools = {["Meme"] = true},
	loc_vars = function(self, info_queue, center)
		info_queue[#info_queue+1] = { set = 'Joker', key = 'j_jolly', specific_vars = {self.config.jolly.t_mult, localize(self.config.jolly.type, 'poker_hands')} }
		return {vars = {center.ability.extra.chips, center.ability.extra.bonus, localize(center.ability.extra.type, 'poker_hands'), (center.ability.extra.chips * center.ability.extra.xchips)}}
	end,
	rarity = 2,
	cost = 5,
	blueprint_compat = true,
	atlas = "atlasone",
	perishable_compat = false,
	calculate = function(self, card, context)
		if context.cardarea == G.jokers and context.before and not context.blueprint then
			if context.scoring_name == card.ability.extra.type then
				card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.bonus
				card_eval_status_text(card, 'extra', nil, nil, nil, {
					message = localize('k_upgrade_ex'),
					colour = G.C.CHIPS
				})
                return nil, true
			end
		end
		if context.other_joker and context.other_joker.ability.set == "Joker" then
			if (context.other_joker.ability.name == "Jolly Joker" or (context.other_joker.edition and context.other_joker.edition.key == "e_cry_m")) then
				if not Talisman.config_file.disable_anims then 
					G.E_MANAGER:add_event(Event({
						func = function()
							context.other_joker:juice_up(0.5, 0.5)
							return true
						end
					})) 
				end
				return {
					message = localize{type='variable',key='a_chips',vars={card.ability.extra.chips * card.ability.extra.xchips}},
					chip_mod = card.ability.extra.chips * card.ability.extra.xchips,
				}
			else
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
					chip_mod = card.ability.extra.chips,
				}
			end
		end
	end,
	add_to_deck = function(self, card, from_debuff)
		card.ability.extra.xchips = math.floor(card.ability.extra.xchips + 0.5) --lua moment
    	end
}
if JokerDisplay then
    bonk.joker_display_definition = {
        mod_function = function(card, mod_joker)
            local chips_mod = mod_joker.ability.extra.chips
            if card.ability.name == "Jolly Joker"
	    or (card.edition and card.edition.key == "e_cry_m") then
                chips_mod = chips_mod * mod_joker.ability.extra.xchips
            end
            return { chips = chips_mod * JokerDisplay.calculate_joker_triggers(mod_joker) or nil }
        end
    }
end
local loopy = { --this may or may not need further balancing
    object_type = "Joker",
    name = "cry-loopy",
    key = "loopy",
    config = {extra = {retrigger = 0, text = "s"}, jolly = {t_mult = 8, type = 'Pair'}},
    pos = {x = 4, y = 1},
    atlas = 'atlastwo',
	immune_to_chemach = true,
    loc_txt = {
        name = 'Loopy',
        text = {
            "{C:attention}Retrigger{} all Jokers",
            "once for each {C:attention}Jolly{}",
	    "{C:attention}Joker{} sold this round",
            "{C:inactive}(Currently{}{C:attention:} #1#{}{C:inactive} Retrigger#2#){}",
	    "{C:inactive,s:0.8}There wasn't enough room...{}"
        }
    },
    rarity = 1,
    cost = 4,
    joker_gate = "Jolly Joker",
    blueprint_compat = true,
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = { set = 'Joker', key = 'j_jolly', specific_vars = {self.config.jolly.t_mult, localize(self.config.jolly.type, 'poker_hands')} }
        return {vars = {center.ability.extra.retrigger, center.ability.extra.text}}
    end,
    calculate = function(self, card, context)
        if context.selling_card and (context.card.ability.name == "Jolly Joker" or (context.card.edition and context.card.edition.key == "e_cry_m"))
	and not context.blueprint and not context.retrigger_joker then
                card.ability.extra.retrigger = card.ability.extra.retrigger + 1
		if card.ability.extra.retrigger == 1 then 
			card.ability.extra.text = ""
		else card.ability.extra.text = "s" end
                return {
                    card_eval_status_text(card, 'extra', nil, nil, nil, {
                        message = "M!",
                        colour = G.C.GREEN,
                    })
                }
        end
	if context.end_of_round and card.ability.extra.retrigger ~= 0 and not context.blueprint and not context.retrigger_joker and not context.individual and not context.repetition then
			card.ability.extra.retrigger = 0
			card.ability.extra.text = "s"
            		return {
                    		card_eval_status_text(card, 'extra', nil, nil, nil, {
                        		message = localize('k_reset'),
                        		colour = G.C.GREEN,
                    		})
                		}
	end
	if context.retrigger_joker_check and not context.retrigger_joker and context.other_card ~= self and card.ability.extra.retrigger ~= 0 then
		return {
			message = localize('k_again_ex'),
			colour = G.C.GREEN,
			repetitions = card.ability.extra.retrigger,
			card = card
		}
        end
    end
}
if JokerDisplay then
	loopy.joker_display_definition = {
		text = {
			{ text = "x" },
			{ ref_table = "card.ability.extra", ref_value = "retrigger" },
		},
		retrigger_joker_function = function (card, retrigger_joker)
			return retrigger_joker.ability.extra.retrigger or 0
		end
	}
end
local scrabble = {
	object_type = "Joker",
	name = "cry-scrabble",
	key = "scrabble",
	config = {extra = {odds = 4}},
	pos = {x = 0, y = 2},
	immune_to_chemach = true,
	loc_txt = {
        name = 'Scrabble Tile',
        text = {
			"{C:green}#1# in #2#{} chance to create",
			"a {C:dark_edition}Jolly {C:green}Uncommon{} Joker",
			"when hand is played"
		}
    },
	rarity = 2,
	cost = 8,
	blueprint_compat = true,
	atlas = "atlasone",
	loc_vars = function(self, info_queue, center)
		--Add Jolly Edition to infoqueue later
		return {vars = {''..(G.GAME and G.GAME.probabilities.normal or 1), center.ability.extra.odds}}
	end,
	calculate = function(self, card, context)
		if context.cardarea == G.jokers and context.before and not context.retrigger_joker then
			local check = false
			--if pseudorandom('scrabble') < G.GAME.probabilities.normal/card.ability.extra.odds then
				--check = true
				--local card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_jolly')
            			--card:add_to_deck()
            			--G.jokers:emplace(card)
			--end
			if pseudorandom('scrabbleother') < G.GAME.probabilities.normal/card.ability.extra.odds then
				check = true
				local card = create_card("Joker", G.jokers, nil, 0.9, nil, nil, nil, "scrabbletile")
				card:set_edition({cry_m = true})
            			card:add_to_deck()
            			G.jokers:emplace(card)
			end
			if check then 
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = "M!", colour = G.C.DARK_EDITION})
                return nil, true 
            end
		end
	end,
}
if JokerDisplay then
	scrabble.joker_display_definition = {
        extra = {
			{
				{ text = "(" },
				{ ref_table = "card.joker_display_values", ref_value = "odds" },
				{ text = " in " },
				{ ref_table = "card.ability.extra",        ref_value = "odds" },
				{ text = ")" },
			}
		},
		extra_config = { colour = G.C.GREEN, scale = 0.3 },
		calc_function = function(card)
			card.joker_display_values.odds = G.GAME and G.GAME.probabilities.normal or 1
		end
	}
end
local sacrifice = {
	object_type = "Joker",
	name = "cry-sacrifice",
	key = "sacrifice",
	config = {extra = {text = "Active!", spawn = true}, jolly = {t_mult = 8, type = 'Pair'}},
	pos = {x = 5, y = 2},
	immune_to_chemach = true,
	loc_txt = {
        name = 'Sacrifice',
        text = {
			"Create an {C:green}Uncommon{} Joker",
			"and 3 {C:attention}Jolly Jokers{} when",
			"a {C:spectral}Spectral{} card is used",
			"{C:red}Works once per round{}",
			"{C:inactive}#1#{}"
		}
    },
	rarity = 1,
	cost = 4,
	blueprint_compat = true,
	atlas = "atlasone",
	loc_vars = function(self, info_queue, center)
		info_queue[#info_queue+1] = { set = 'Joker', key = 'j_jolly', specific_vars = {self.config.jolly.t_mult, localize(self.config.jolly.type, 'poker_hands')} }
		return {vars = {center.ability.extra.text}}
	end,
	calculate = function(self, card, context)
		if context.using_consumeable and card.ability.extra.spawn and not context.retrigger_joker then
            if context.consumeable.ability.set == "Spectral" then
				if not context.blueprint then card.ability.extra.spawn = false end
				if not card.ability.extra.spawn then card.ability.extra.text = "No triggers left!" end
				for i = 1, 3 do
					local jolly = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_jolly')
					jolly:add_to_deck()
					G.jokers:emplace(jolly)
				end
				local card = create_card("Joker", G.jokers, nil, 0.9, nil, nil, nil, "sacrifice")
                        	card:add_to_deck()
	                        G.jokers:emplace(card)
                        	card:start_materialize()
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
if JokerDisplay then
    sacrifice.joker_display_definition = {
        reminder_text = {
            { text = "(" },
            { ref_table = "card.ability.extra", ref_value = "text" },
            { text = ")" },
        },
    }
end
--TODO: Fix Brainstorm incompatibility (the joker not the mod)
local reverse = {
	object_type = "Joker",
	name = "cry-reverse",
	key = "reverse",
	config = {extra = {type = "Pair", spawn = 0}, jolly = {t_mult = 8, type = 'Pair'}},
	pos = {x = 0, y = 0},
	loc_txt = {
        name = 'Reverse Card',
        text = {
			"Fill all empty Joker slots {C:inactive}(Max 100){}",
			"with {C:dark_edition}Holographic{} {C:attention}Jolly Jokers{} if",
			"{C:attention}discarded poker hand{} is a {C:attention}#1#{}",
			"{C:red,E:2}self destructs{}",
			"{C:inactive,s:0.8}The ULTIMATE comeback{}"
		}
    	},
    pools = {["Meme"] = true},
	rarity = 2,
	cost = 4,
	eternal_compat = false,
	atlas = "atlastwo",
	loc_vars = function(self, info_queue, center)
		info_queue[#info_queue+1] = { set = 'Joker', key = 'j_jolly', specific_vars = {self.config.jolly.t_mult, localize(self.config.jolly.type, 'poker_hands')} }
		info_queue[#info_queue+1] = G.P_CENTERS.e_holographic
		return {vars = {localize(center.ability.extra.type, 'poker_hands')}}
	end,
	calculate = function(self, card, context)
		if context.pre_discard and not context.retrigger_joker and not context.blueprint then
			if G.FUNCS.get_poker_hand_info(G.hand.highlighted) == card.ability.extra.type and #G.jokers.cards + G.GAME.joker_buffer <= G.jokers.config.card_limit then
				G.E_MANAGER:add_event(Event({ --self destruct
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
				local spawnamount = math.min(100, G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer)) + 1 -- +1 to account for reverse card self destruct
				G.GAME.joker_buffer = G.GAME.joker_buffer + spawnamount
				G.E_MANAGER:add_event(Event({
                    			func = function() 
                        			for i = 1, spawnamount do
                            				local card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_jolly')
            						card:set_edition({
                						holo = true --certified Thunk moment, this literally took ten minutes to figure out why is it set up like this
            						})
            						card:add_to_deck()
            						G.jokers:emplace(card)
							G.GAME.joker_buffer = 0
                        			end
                        			return true
                    			end})) 
					card_eval_status_text(card, 'extra', nil, nil, nil, {message = "M!", colour = G.C.DARK_EDITION})
			end
                end
	end,
}
if JokerDisplay then
    reverse.joker_display_definition = {
        reminder_text = {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
            { text = ")" },
        },
        reminder_text_config = { scale = 0.35 },
        calc_function = function(card)
            card.joker_display_values.localized_text = localize(card.ability.extra.type, 'poker_hands')
        end
    }
end
local doodlem = {
    object_type = "Joker",
    name = "cry-doodlem",
    key = "doodlem",
    atlas = "atlasepic",
    config = {jolly = {t_mult = 8, type = 'Pair'}},
    pos = {x = 2, y = 0},
	immune_to_chemach = true,
    loc_txt = {
        name = 'Doodle M',
        text = {
            "Create 2 {C:dark_edition}Negative{} {C:attention}consumables{}",
            "when {C:attention}Blind{} is selected",
	    "Create 1 more {C:attention}consumable",
	    "for each {C:attention}Jolly Joker{}"
        }
    },
    rarity = "cry_epic",
    cost = 13,
    blueprint_compat = true,
    loc_vars = function(self, info_queue, center)
	info_queue[#info_queue+1] = { set = 'Joker', key = 'j_jolly', specific_vars = {self.config.jolly.t_mult, localize(self.config.jolly.type, 'poker_hands')} }
	--TODO: Replace the negative infoqueue with the one used for consumables
	info_queue[#info_queue+1] = G.P_CENTERS.e_negative
    end,
    calculate = function(self, card, context)
    if context.setting_blind and not (context.blueprint_card or self).getting_sliced then
        local jollycount = 2
        for i = 1, #G.jokers.cards do
                if G.jokers.cards[i].ability.name == 'Jolly Joker'
		or G.jokers.cards[i].edition and G.jokers.cards[i].edition.key == "e_cry_m"
		then jollycount = jollycount + 1 end
        end
	if jollycount > 50 then jollycount = 50 end --reduce excessive consumeable spam (Lag)
        for i = 1, jollycount do
            local card = create_card('Consumeables', G.consumeables, nil, nil, nil, nil, nil, 'cry_doodlem')
            card:set_edition({negative = true})
            card:add_to_deck()
            G.consumeables:emplace(card)
        end
        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "M!", colour = G.C.DARK_EDITION})
        return true
    end
end
}
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
			"if {C:attention}poker hand{} contains a {C:attention}#2#{}",
			"Sell this card to create a",
			"{C:dark_edition}Polychrome{} {C:attention}Jolly Joker{} for",
			"every {C:money}$4{} of {C:attention}sell value{} {C:inactive}(Min 1){}",
		}
    },
	rarity = "cry_epic",
	cost = 8,
	eternal_compat = false,
	loc_vars = function(self, info_queue, center)
		info_queue[#info_queue+1] = { set = 'Joker', key = 'j_jolly', specific_vars = {self.config.jolly.t_mult, localize(self.config.jolly.type, 'poker_hands')} }
		if not center.edition or (center.edition and not center.edition.polychrome) then
            		info_queue[#info_queue+1] = G.P_CENTERS.e_polychrome
        	end
	return {vars = {center.ability.extra.bonus, localize(center.ability.extra.type, 'poker_hands')}}
    	end,
	atlas = "atlasepic",
	calculate = function(self, card, context)
        	if context.cardarea == G.jokers and context.before and next(context.poker_hands['Pair']) and not context.blueprint then
                        card.ability.extra_value = card.ability.extra_value + card.ability.extra.bonus --this doesn't seem to work with retrigger jokers. Intentional?
                        card:set_cost()
                        card_eval_status_text(card, 'extra', nil, nil, nil, {
                        message = localize('k_upgrade_ex'),
                        colour = G.C.MONEY
                        })
		end
		if context.selling_self and not context.blueprint and not context.retrigger_joker then
			G.E_MANAGER:add_event(Event({
			func = (function()
				G.E_MANAGER:add_event(Event({
					func = function()
						local summon = math.floor((card.ability.extra_value)/4)
						if summon < 1 then summon = 1 end --precautionary measure, just in case
						print(summon)
						for i = 1, math.min(200, summon) do --another precautionary measure
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
			return nil, true
		end
	end
	
}
if JokerDisplay then
    virgo.joker_display_definition = {
        reminder_text = {
            { text = "(" },
            { text = "$",                              colour = G.C.GOLD },
            { ref_table = "card",                      ref_value = "sell_cost",      colour = G.C.GOLD },
            { text = ") (" },
            { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
            { text = ")" },
        },
        reminder_text_config = { scale = 0.35 },
        calc_function = function(card)
            card.joker_display_values.localized_text = localize(card.ability.extra.type, 'poker_hands')
        end
    }
end
local smallestm = {
    	object_type = "Joker",
	name = "cry-smallestm",
	key = "smallestm",
    	config = {extra = {x_chips = 9, type = "Pair", check = false, text = "Inactive"}},
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
        return {vars = {center.ability.extra.x_chips, localize(center.ability.extra.type, 'poker_hands'), center.ability.extra.text}}
    	end,
    	calculate = function(self, card, context)
        	if context.cardarea == G.jokers and card.ability.extra.check and not context.before and not context.after then
            	return {
                	message = "X"..number_format(card.ability.extra.x_chips),
                	Xchip_mod = card.ability.extra.x_chips,
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
if JokerDisplay then
    smallestm.joker_display_definition = {
        text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.joker_display_values", ref_value = "x_chips", retrigger_type = "exp" }
                },
                border_colour = G.C.CHIPS
            }
        },
        reminder_text = {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
            { text = ")" },
        },
        calc_function = function(card)
            card.joker_display_values.x_chips = card.ability.extra.check and card.ability.extra.x_chips or 1
            card.joker_display_values.localized_text = localize(card.ability.extra.type, 'poker_hands')
        end
    }
end

local biggestm = {
    object_type = "Joker",
name = "cry-biggestm",
key = "biggestm",
    config = {extra = {x_mult = 7, type = "Pair", check = false, text = "Inactive"}},
pos = {x = 3, y = 3},
loc_txt = {
    name = 'Huge',
    text = {
        "{X:mult,C:white} X#1# {} Mult until end",
    "of round if {C:attention}poker hand{}",
    "is a {C:attention}#2#{}",
    "{C:inactive}(Currently {C:attention}#3#{}{C:inactive}){}",
    "{C:inactive,s:0.8}not fat, just big boned."
    }
    },
rarity = "cry_epic",
cost = 12,
blueprint_compat = true,
atlas = "atlasepic",
    loc_vars = function(self, info_queue, center)
    return {vars = {center.ability.extra.x_mult, localize(center.ability.extra.type, 'poker_hands'), center.ability.extra.text}}
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and card.ability.extra.check and not context.before and not context.after then
            return {
                message = "X"..number_format(card.ability.extra.x_mult).." Mult",	-- why is it like this?
                Xmult_mod = card.ability.extra.x_mult,
                colour = G.C.MULT
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
if JokerDisplay then
biggestm.joker_display_definition = {
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.joker_display_values", ref_value = "x_mult", retrigger_type = "exp" }
            },
        }
    },
    reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
        { text = ")" },
    },
    calc_function = function(card)
        card.joker_display_values.x_mult = card.ability.extra.check and card.ability.extra.x_mult or 1
        card.joker_display_values.localized_text = localize(card.ability.extra.type, 'poker_hands')
    end
}
end
local mprime = {
	object_type = "Joker",
	name = "cry-mprime",
	key = "mprime",
	pos = {x = 0, y = 5},
	soul_pos = {x = 2, y = 5, extra = {x = 1, y = 5}},
	config = {extra = {mult = 1.05, bonus = 0.04, check = true}, jolly = {t_mult = 8, type = 'Pair'}},
	loc_txt = {
		name = 'Tredecim',
		text = {
            "Create up to 4 {C:attention}Jolly Jokers{} when obtained",
			"Each {C:attention}Jolly Joker{} gives {X:dark_edition,C:white}^#1#{} Mult",
			"Increase amount by {X:dark_edition,C:white}^#2#{} and",
			"create an {C:legendary}M Joker{} {C:red}once per round",
			"when a {C:attention}Jolly Joker{} is {C:attention}sold",
            "{C:inactive,s:0.8}(Tredecim excluded)"
		}
	},
	loc_vars = function(self, info_queue, center)
		info_queue[#info_queue+1] = { set = 'Joker', key = 'j_jolly', specific_vars = {self.config.jolly.t_mult, localize(self.config.jolly.type, 'poker_hands')} }
		return {vars = {center.ability.extra.mult, center.ability.extra.bonus}}
	end,
	rarity = "cry_exotic",
	cost = 50,
	blueprint_compat = true,
	atlas = "atlasexotic",
	perishable_compat = false,
	calculate = function(self, card, context)
		if context.selling_card and (context.card.ability.name == "Jolly Joker" or (context.card.edition and context.card.edition.key == "e_cry_m")) then
			if not context.blueprint then card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.bonus end
			if card.ability.extra.check and not context.blueprint and not context.retrigger_joker then
				card.ability.extra.check = false
				local loyalservants = {}
                for k, _ in pairs(Cryptid.M_jokers) do
                    if G.P_CENTERS[k] then
                        loyalservants[#loyalservants+1] = k
                    end
                end
        	    local _card = create_card('Joker', G.jokers, nil, nil, nil, nil, pseudorandom_element(loyalservants,pseudoseed("cry_biggestm")))
        		_card:add_to_deck()
				_card:start_materialize()
        		G.jokers:emplace(_card)
			end
			card_eval_status_text(card, 'extra', nil, nil, nil, {message = "M!", colour = G.C.DARK_EDITION})
		end
		if context.other_joker then
			if context.other_joker and (context.other_joker.ability.name == "Jolly Joker" or (context.other_joker.edition and context.other_joker.edition.key == "e_cry_m")) then
				if not Talisman.config_file.disable_anims then 
					G.E_MANAGER:add_event(Event({
						func = function()
							context.other_joker:juice_up(0.5, 0.5)
							return true
						end
					})) 
				end
				return {
                			message = "^"..number_format(card.ability.extra.mult).." Mult",
                			Emult_mod = card.ability.extra.mult,
                			colour = G.C.DARK_EDITION,
                			card = card
            			}
			end
		end
		if context.end_of_round and not card.ability.extra.check and not context.blueprint and not context.retrigger_joker then
		card.ability.extra.check = true end
	end,
	add_to_deck = function(self, card, from_debuff)
		local jollycount = 4 --Create up to 4 jollies if there are none to help start off fresh from the gateway
		for i = 1, #G.jokers.cards do
                	if G.jokers.cards[i].ability.name == 'Jolly Joker' then jollycount = jollycount - 1 end
            	end
		for i = 1, math.max(0, jollycount) do
			local card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_jolly')
				card:add_to_deck()
				G.jokers:emplace(card)
		end
	end,
}
if JokerDisplay then --needs to be tweaked later
    mprime.joker_display_definition = {
        --todo: show if active
        mod_function = function(card, mod_joker)
            if (card.ability.name ~= "Jolly Joker" or (card.edition and card.edition.key ~= "e_cry_m")) then return {} end
            local e_mult = mod_joker.ability.extra.mult
            local triggers = JokerDisplay.calculate_joker_triggers(mod_joker)
            if triggers == 0 then return {} end
            for i=1, triggers-1 do
                e_mult = e_mult ^ mod_joker.ability.extra.mult
            end
            return { e_mult = e_mult }
        end
    }
end
local macabre = {
    object_type = "Joker",
	name = "cry-macabre",
	key = "macabre",
    pos = {x = 1, y = 2},
	config = {jolly = {t_mult = 8, type = 'Pair'}},
	loc_txt = {
		name = 'Macabre Joker',
		text = {
            "When {C:attention}Blind{} is selected,",
            "destroys each {C:attention}Joker{} except",
	    "{C:legendary}M-Jokers{} and {C:attention}Jolly Jokers{}",
            "and create 1 {C:attention}Jolly Joker{}",
            "for each destroyed card",
		}
	},
	loc_vars = function(self, info_queue, center)
		info_queue[#info_queue+1] = { set = 'Joker', key = 'j_jolly', specific_vars = {self.config.jolly.t_mult, localize(self.config.jolly.type, 'poker_hands')} }
	end,
	rarity = 1,
	cost = 5,
	atlas = "atlasthree",
	calculate = function(self, card, context)
		if context.setting_blind and not (context.blueprint or context.retrigger_joker) and not card.getting_sliced then
            G.E_MANAGER:add_event(Event({func = function()
                local triggered = false
                local destroyed_jokers = {}
                for _, v in pairs(G.jokers.cards) do
                    if v ~= card
                    and v.config.center.key ~= "j_jolly"
		    and v.config.center.key ~= "j_cry_mprime"
                    and not (v.ability.eternal or (v.edition and v.edition.key == "e_cry_m")
		    or v.getting_sliced or Cryptid.M_jokers[v.config.center.key]) then
                        destroyed_jokers[#destroyed_jokers+1] = v
                    end
                end
                for _, v in pairs(destroyed_jokers) do
                    triggered = true
                    v.getting_sliced = true
                    v:start_dissolve({HEX("57ecab")}, nil, 1.6)
                    local jolly_card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_jolly')
                    jolly_card:add_to_deck()
                    G.jokers:emplace(jolly_card)
                end
                if triggered then
                    card:juice_up(0.8, 0.8)
                    play_sound('slice1', 0.96+math.random()*0.08)
                end
                return true
            end}))
        end
	end,
}
local megg = {
    object_type = "Joker",
    name = "cry-megg",
    key = "Megg",
    pos = {x = 0, y = 4},
	config = {extra = {amount = 0, amount_mod = 1}, jolly = {t_mult = 8, type = 'Pair'}},
	loc_txt = {
        name = 'Megg',
        text = {
            "Sell this card to create",
            "{C:attention}#2#{} Jolly #3#, increase",
            "by {C:attention}#1#{} at end of round",
        }
    },
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = { set = 'Joker', key = 'j_jolly', specific_vars = {self.config.jolly.t_mult, localize(self.config.jolly.type, 'poker_hands')} }
        return {vars = {math.max(1, center.ability.extra.amount_mod), math.min(200, math.floor(center.ability.extra.amount)), (center.ability.extra.amount > 1 and "Jokers") or "Joker"}}
    end,
    rarity = 1,
    cost = 4,
    atlas = "atlasthree",
    calculate = function(self, card, context)
        if context.end_of_round and card.ability.extra.amount < 200 and not (context.individual or context.repetition or context.blueprint) then
            card.ability.extra.amount = card.ability.extra.amount + math.max(1, card.ability.extra.amount_mod)
	    if card.ability.extra.amount > 200 then card.ability.extra.amount = 200 end
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = {"Jolly Up!"}, colour = G.C.FILTER})
            return nil, true
        end
        if context.selling_self and not (context.blueprint or context.retrigger_joker_check or context.retrigger_joker) and card.ability.extra.amount > 0 then
            for i = 1, math.min(200, math.floor(card.ability.extra.amount)) do
                local jolly_card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_jolly')
                jolly_card:add_to_deck()
                G.jokers:emplace(jolly_card)
            end
        end
    end,
}
if JokerDisplay then
	megg.joker_display_definition = {
		text = {
			{ text = "+" },
			{ ref_table = "card.ability.extra", ref_value = "amount" },
		},
		text_config = { colour = G.C.ORANGE },
		reminder_text = {
            		{ ref_table = "card.joker_display_values", ref_value = "localized_text" },
        	},
		calc_function = function(card)
            		card.joker_display_values.localized_text = "(" .. localize("k_round") .. ")"
        	end
	}
end	
local ret_items = {jollysus,kidnap,bubblem,foodm,mstack,mneon,notebook,bonk,loopy,scrabble,sacrifice,reverse,macabre,megg}
for _, v in pairs(ret_items) do
    Cryptid.M_jokers["j_cry_" .. v.key] = true
end
return {name = "M Jokers", 
        init = function()
	cry_minvasion = true
	    --Make Kidnapping always cost 1$ regardless of edition
	    local sc = Card.set_cost
            function Card:set_cost()
                sc(self)
                if self.ability.name == "cry-kidnap" then
                    self.cost = 1
                end
            end
            if cry_enable_epics then
                for _, jkr in pairs({doodlem, virgo, smallestm, biggestm}) do
                    Cryptid.M_jokers["j_cry_" .. jkr.key] = true
                    ret_items[#ret_items+1] = jkr
                end
            end
            if cry_enable_exotics then
                for _, jkr in pairs({mprime}) do
                    ret_items[#ret_items+1] = jkr
                end
            end
        end,
        items = ret_items}
