local dropshot = {
    object_type = "Joker",
	name = "cry-Dropshot",
	key = "dropshot",
    	config = {extra = {Xmult_mod = 0.2, x_mult = 1}},
	pos = {x = 5, y = 0},
	loc_txt = {
        name = 'Dropshot',
        text = {
        "This Joker gains {X:mult,C:white} X#1# {} Mult for",
		"each played, {C:attention}nonscoring{} {V:1}#2#{} card,",
		"suit changes every round",
        "{C:inactive}(Currently {X:mult,C:white} X#3# {C:inactive} Mult)"
        }
    	},
	rarity = 3,
	cost = 8,
    	blueprint_compat = true,
	perishable_compat = false,
	atlas = "atlasone",
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.Xmult_mod, localize(G.GAME.current_round.cry_dropshot_card and G.GAME.current_round.cry_dropshot_card.suit or "Spades", 'suits_singular'), center.ability.extra.x_mult, colours = {G.C.SUITS[G.GAME.current_round.cry_dropshot_card and G.GAME.current_round.cry_dropshot_card.suit or "Spades"]}}}
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.before and not context.blueprint then
            cards = 0
            for k, v in ipairs(context.scoring_hand) do
                v.cry_dropshot_incompat = true
            end
            for k, v in ipairs(context.full_hand) do
                if not v.cry_dropshot_incompat and v:is_suit(G.GAME.current_round.cry_dropshot_card.suit)then
                    cards = cards + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            v:juice_up()
                            return true
                        end
                    }))
                end
            end
            for k, v in ipairs(context.scoring_hand) do
                v.cry_dropshot_incompat = nil
            end
            if cards > 0 then 
                card.ability.extra.x_mult = card.ability.extra.x_mult + cards * card.ability.extra.Xmult_mod
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize{type = 'variable', key = 'a_xmult', vars = {card.ability.extra.x_mult}}})
                return {calculated = true}
            end
        end
        if context.cardarea == G.jokers and (to_big(card.ability.extra.x_mult) > to_big(1)) and not context.before and not context.after then
            return {
                message = localize{type='variable',key='a_xmult',vars={card.ability.extra.x_mult}},
                Xmult_mod = card.ability.extra.x_mult
            }
        end
    end
}
if JokerDisplay then
    dropshot.joker_display_definition = {
        text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.ability.extra", ref_value = "x_mult" }
                }
            }
        },
        reminder_text = {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "dropshot_card_suit" },
            { text = ")" },
        },
        calc_function = function(card)
            local dropshot_suit = G.GAME and G.GAME.current_round.cry_dropshot_card and
                G.GAME.current_round.cry_dropshot_card.suit
            card.joker_display_values.dropshot_card_suit = dropshot_suit and
                localize(G.GAME.current_round.cry_dropshot_card.suit, 'suits_plural') or "-"
        end,
        style_function = function(card, text, reminder_text, extra)
            if reminder_text and reminder_text.children[2] then
                local dropshot_suit = G.GAME and G.GAME.current_round.cry_dropshot_card and
                    G.GAME.current_round.cry_dropshot_card.suit
                reminder_text.children[2].config.colour = dropshot_suit and
                    lighten(G.C.SUITS[G.GAME.current_round.cry_dropshot_card.suit], 0.35) or G.C.ORANGE
            end
            return false
        end
    }
end
local happyhouse = {
    object_type = "Joker",
    name = "cry-happyhouse",
    key = "happyhouse",
    pos = {x = 2, y = 4},
    config = {extra = {mult = 4, check = 0}},
    loc_txt = {
        name = 'Happy House',
        text = { "{X:dark_edition,C:white}^#1#{} Mult only after",
        "playing {C:attention}114{} hands{}",
	"{C:inactive}(Currently #2#/114){}",
	"{C:inactive,s:0.8}There is no place like home!{}"
	}
    },
    rarity = 2,
    cost = 2,
    blueprint_compat = true,
    atlas = "atlastwo",
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.mult, center.ability.extra.check}}
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.before and not context.blueprint and not context.retrigger_joker then
            card.ability.extra.check = card.ability.extra.check + 1
            if card.ability.extra.check == 114 and G.GAME.round_resets.ante < 8 and not (G.GAME.selected_back.effect.center.key == 'antimatter' or G.GAME.selected_back.effect.center.key == 'equilibrium') then --Yes, the cut off point is boss blind Ante 7. I'm evil >:3. 
                check_for_unlock({type = "home_realtor"})
            end
			if card.ability.extra.check < 114 then --Hardcoded, dont want misprint to mess with this hehe
				return {
                    card_eval_status_text(card, 'extra', nil, nil, nil, {
                        message = card.ability.extra.check.."/114",
                        colour = G.C.DARK_EDITION,
                    })
                }
			end
        end
	if context.cardarea == G.jokers and (to_big(card.ability.extra.mult) > to_big(1)) and card.ability.extra.check > 113 and not context.before and not context.after then
	    return {
                message = "^"..number_format(card.ability.extra.mult).." Mult",

                Emult_mod = card.ability.extra.mult,
                colour = G.C.DARK_EDITION,
                card = card
            }
        end
    end
}
if JokerDisplay then
    happyhouse.joker_display_definition = {
        text = {  
            {
                border_nodes = {
                    { text = "^" },
                    { ref_table = "card.joker_display_values", ref_value = "e_mult" }
                },
                border_colour = G.C.DARK_EDITION
            }
        },
        reminder_text = {
            { text = '('},
            { ref_table = "card.ability.extra", ref_value = "check" },
            { text = '/114)'},
        },
        calc_function = function(card)
            card.joker_display_values.e_mult = card.ability.extra.check >= 114 and card.ability.extra.mult or 1
        end
    }
end
local maximized = {
    object_type = "Joker",
	name = "cry-Maximized",
	key = "maximized",
	pos = {x = 5, y = 2},
	loc_txt = {
        name = 'Maximized',
        text = {
        "All {C:attention}face{} cards",
		"are considered {C:attention}Kings{},",
        "all {C:attention}numbered{} cards",
		"are considered {C:attention}10s{}"
        }
    },
	rarity = 3,
	cost = 11,
	atlas = "atlastwo"
}
local potofjokes = {
    object_type = "Joker",
	name = "cry-Pot of Jokes",
	key = "pot_of_jokes",
	config = {extra = {h_size = -2, h_mod = 1}},
	pos = {x = 5, y = 0},
	loc_txt = {
        name = 'Pot of Jokes',
        text = {
            "{C:attention}#1#{} hand size,",
            "increases by",
            "{C:blue}#2#{} every round"}
    	},
	rarity = 3,
	cost = 10,
	perishable_compat = false,
	atlas = 'atlastwo',
    	loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.h_size<0 and center.ability.extra.h_size or "+"..center.ability.extra.h_size,center.ability.extra.h_mod}}
    end,
    calculate = function(self, card, context)
        if context.end_of_round and not context.individual and not context.repetition and not context.blueprint then
            card.ability.extra.h_size = card.ability.extra.h_size + card.ability.extra.h_mod
            G.hand:change_size(card.ability.extra.h_mod)
            return {
                message = localize{type='variable',key='a_handsize',vars={card.ability.extra.h_mod}},
                colour = G.C.FILTER,
                card = card
            }
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        G.hand:change_size(card.ability.extra.h_size)
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-card.ability.extra.h_size)
    end
}
if JokerDisplay then
    potofjokes.joker_display_definition = {
        reminder_text = {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "h_size", colour = G.C.ORANGE },
            { text = ")" },
        },
        calc_function = function(card)
            card.joker_display_values.h_size = (card.ability.extra.h_size >= 0 and "+" or "") .. card.ability.extra.h_size
        end,
    }
end
local queensgambit = {
    object_type = "Joker",
    name = "cry-Queen's Gambit",
    key = "queens_gambit",
    pos = {x = 1, y = 0},
    loc_txt = {
        name = 'Queen\'s Gambit',
        text = {
            "If {C:attention}poker hand{} is a",
            "{C:attention}Royal Flush{}, destroy scored",
            "{C:attention}Queen{} and create a",
            "{C:dark_edition}Negative {}{C:red}Rare{}{C:attention} Joker{}"
        }
    },
    rarity = 3,
    cost = 7,
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
    end,
    atlas = "atlastwo",
    config = { extra = { type = "Straight Flush" } },
    calculate = function(self, card, context)
        if context.destroying_card and not context.blueprint then
            if G.GAME.current_round.current_hand.handname == "Royal Flush" and SMODS.Ranks[context.destroying_card.base.value].key == "Queen" then
                card_eval_status_text(card, 'extra', nil, nil, nil, { message = localize('k_plus_joker'), colour = G.C.FILTER })
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    func = function()
                        local card = create_card("Joker", G.jokers, nil, 0.99, nil, nil, nil, "cry_gambit")
                        card:set_edition({ negative = true })
                        card:add_to_deck()
                        G.jokers:emplace(card)
                        card:start_materialize()
                        return true
                    end
                }))
                return true
            end
        end
    end
}
local wee_fib = {
	object_type = "Joker",
	name = "cry-Wee Fibonacci",
	key = "wee_fib",
	config = {extra = {mult = 0, mult_mod = 3}},
	pos = {x = 1, y = 5},
	loc_txt = {
        name = 'Weebonacci',
        text = {
		"This Joker gains",
		"{C:mult}+#2#{} Mult when each played",
		"{C:attention}Ace{}, {C:attention}2{}, {C:attention}3{}, {C:attention}5{}, or {C:attention}8{}",
		"is scored",
		"{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)"}
    	},
	rarity = 3,
	cost = 9,
	blueprint_compat = true,
	perishable_compat = false,
	loc_vars = function(self, info_queue, center)
		return {vars = {center.ability.extra.mult,center.ability.extra.mult_mod}}
	end,
	calculate = function(self, card, context)
		if context.cardarea == G.play and context.individual and not context.blueprint then
			local rank = SMODS.Ranks[context.other_card.base.value].key
			if rank == "Ace" or rank == "2" or rank == "3" or rank == "5" or rank == "8" then
				card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
				
				return {
					extra = {focus = card, message = localize('k_upgrade_ex')},
					card = card,
					colour = G.C.MULT
				}
			end
		end
		if context.cardarea == G.jokers and (to_big(card.ability.extra.mult) > to_big(0)) and not context.before and not context.after then
			return {
				message = localize{type='variable',key='a_mult',vars={card.ability.extra.mult}},
				mult_mod = card.ability.extra.mult, 
				colour = G.C.MULT
			}
		end
	end,
}
if JokerDisplay then
    wee_fib.joker_display_definition = {
        text = {
            { text = "+" },
            { ref_table = "card.ability.extra", ref_value = "mult" }
        },
        text_config = { colour = G.C.MULT },
        reminder_text = {
            { ref_table = "card.joker_display_values", ref_value = "localized_text" },
        },
        calc_function = function(card)
            card.joker_display_values.localized_text = "(" .. localize("Ace", "ranks") .. ",2,3,5,8)"
        end
    }
end
local whip = {
    object_type = "Joker",
    name = "cry-The WHIP",
    key = "whip",
    pos = {x = 5, y = 3},
    config = {extra = {Xmult_mod = 0.5, x_mult = 1}},
    loc_txt = {
        name = 'The WHIP',
        text = { "This Joker gains {X:mult,C:white} X#1# {} Mult",
        "if {C:attention}played hand{} contains a",
        "{C:attention}2{} and {C:attention}7{} of different suits",
        "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)"}
    },
    rarity = 2,
    cost = 8,
    blueprint_compat = true,
    perishable_compat = false,
    atlas = "atlasone",
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.Xmult_mod, center.ability.extra.x_mult}}
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.before and not context.blueprint then
            for i = 1, #context.full_hand do
                if SMODS.Ranks[context.full_hand[i].base.value].key == "2" then
                    for j = 1, #context.full_hand do
                        if SMODS.Ranks[context.full_hand[j].base.value].key == "7" then
                            --Different suits
                            for k, v in pairs(SMODS.Suits) do
                                if context.full_hand[i]:is_suit(k, nil, true) and context.full_hand[j]:is_suit(k, nil, true) then return end
                            end
                            card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.Xmult_mod
                            card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize{type = 'variable', key = 'a_xmult', vars = {card.ability.extra.x_mult}}})
                            return {calculated = true}
                        end
                    end
                end
            end
        end
        if context.cardarea == G.jokers and (to_big(card.ability.extra.x_mult) > to_big(1)) and not context.before and not context.after then
            return {
                message = localize{type='variable',key='a_xmult',vars={card.ability.extra.x_mult}},
                Xmult_mod = card.ability.extra.x_mult
            }
        end
    end
}
if JokerDisplay then
    whip.joker_display_definition = {
        text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.ability.extra", ref_value = "x_mult" }
                }
            }
        },
        reminder_text = {
            { text = "(2,7)" },
        },
    }
end
local lucky_joker = {
    object_type = "Joker",
	name = "cry-Lucky Joker",
	key = "lucky_joker",
    config = {extra = { dollars = 5}},
	pos = {x = 4, y = 3},
	loc_txt = {
        name = 'Lucky Joker',
        text = {
            "Earn {C:money}$#1#{} every time a",
            "{C:attention}Lucky{} card {C:green}successfully{}",
            "triggers"
        }
    },
	rarity = 1,
	cost = 4,
    blueprint_compat = true,
	atlas = "atlasone",
    enhancement_gate = 'm_lucky',
    loc_vars = function(self, info_queue, center)
	info_queue[#info_queue+1] = G.P_CENTERS.m_lucky
        return {vars = {center.ability.extra.dollars}}
    end,
    calculate = function(self, card, context)
        if context.individual and context.other_card.lucky_trigger then
            G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.dollars
            G.E_MANAGER:add_event(Event({func = (function() G.GAME.dollar_buffer = 0; return true end)}))
            return {
                dollars = card.ability.extra.dollars,
                card = card
            }
        end
    end
}
if JokerDisplay then
    lucky_joker.joker_display_definition = {
        text = {
            { ref_table = "card.joker_display_values", ref_value = "count" },
            { text = "x",                              scale = 0.35 },
            { text = "$",                              colour = G.C.GOLD },
            { ref_table = "card.ability.extra",        ref_value = "dollars", colour = G.C.GOLD },
        },
        reminder_text = {
            { text = '(', },
            { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
            { text = ')', },
        },
        calc_function = function(card)
            local count = 0
            local hand = next(G.play.cards) and G.play.cards or G.hand.highlighted
            local text, _, scoring_hand = JokerDisplay.evaluate_hand(hand)
            if text ~= 'Unknown' then
                for _, scoring_card in pairs(scoring_hand) do
                    if scoring_card.ability.effect and scoring_card.ability.effect == "Lucky Card" then
                        count = count +
                            JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                    end
                end
            end
            card.joker_display_values.count = count
            card.joker_display_values.localized_text = localize { type = 'name_text', set = 'Enhanced', key = "m_lucky" }
        end
    }
end
local cursor = {
    object_type = "Joker",
	name = "cry-Cursor",
	key = "cursor",
    	config = {extra = {chips = 0, chip_mod = 5}},
	pos = {x = 4, y = 1},
	loc_txt = {
        name = 'Cursor',
        text = {
            "This Joker gains {C:chips}+#2#{} Chips",
            "for each card {C:attention}purchased{}",
            "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)"
        }
    	},
	rarity = 1,
	cost = 5,
    	blueprint_compat = true,
	perishable_compat = false,
	atlas = "atlasone",
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.chips, center.ability.extra.chip_mod}}
    end,
    calculate = function(self, card, context)
        if context.buying_card and (not context.blueprint) and not (context.card == card) then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize{type = 'variable', key = 'a_chips', vars = {card.ability.extra.chips}}, colour = G.C.CHIPS})
            return {calculated = true}
        end
        if context.cardarea == G.jokers and (to_big(card.ability.extra.chips) > to_big(0)) and not context.before and not context.after then
            return {
                message = localize{type='variable',key='a_chips',vars={card.ability.extra.chips}},
                chip_mod = card.ability.extra.chips
            }
        end
    end
}
if JokerDisplay then
    cursor.joker_display_definition = {
        text = {
            { text = "+" },
            { ref_table = "card.ability.extra", ref_value = "chips" }
        },
        text_config = { colour = G.C.CHIPS },
    }
end
local pickle = {
    object_type = "Joker",
	name = "cry-Pickle",
	key = "pickle",
    	config = {extra = {tags = 3, tags_mod = 1}},
	pos = {x = 3, y = 3},
	loc_txt = {
        name = 'Pickle',
        text = {
            "When {C:attention}Blind{} is skipped, create",
            "{C:attention}#1#{} Tags, reduced by",
            "{C:red}#2#{} when {C:attention}Blind{} is selected"
        }
    	},
	rarity = 2,
	cost = 6,
  	blueprint_compat = true,
	eternal_compat = false,
	atlas = "atlasone",
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.tags, center.ability.extra.tags_mod}}
    end,
    calculate = function(self, card, context)
        if context.skip_blind then
            for i = 1, card.ability.extra.tags do
                local tag = Tag(get_next_tag_key("cry_pickle"))
                if tag.name == 'Orbital Tag' then                 
                    local _poker_hands = {}
                    for k, v in pairs(G.GAME.hands) do
                        if v.visible then _poker_hands[#_poker_hands+1] = k end
                    end
                    tag.ability.orbital_hand = pseudorandom_element(_poker_hands, pseudoseed('cry_pickle_orbital'))
                end
                if tag.name == 'Boss Tag' then
                    i = i - 1 --skip these, as they can cause bugs with pack opening from other tags
                else
                    add_tag(tag)
                end
            end
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = "+"..card.ability.extra.tags.." Tag"..(card.ability.extra.tags>1 and "s" or ""), colour = G.C.FILTER})
            return {calculated = true}
        end
        if context.setting_blind and not context.blueprint then
            card.ability.extra.tags = card.ability.extra.tags - card.ability.extra.tags_mod
            if card.ability.extra.tags > 0 then
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = "-"..card.ability.extra.tags_mod.." Tag"..(card.ability.extra.tags_mod>1 and "s" or ""), colour = G.C.FILTER})
                return {calculated = true}
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
                                return true; end})) 
                        return true
                    end
                })) 
                return {
                    message = localize('k_eaten_ex'),
                    colour = G.C.FILTER
                }
            end
        end
    end
}
if JokerDisplay then
    pickle.joker_display_definition = {
        reminder_text = {
            { text = '(', },
            { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
            { text = ')', },
        },
        calc_function = function(card)
            card.joker_display_values.localized_text = "+" .. card.ability.extra.tags .. " " .. localize("b_tags")
        end
    }
end
local cube = {
    object_type = "Joker",
	name = "cry-Cube",
	key = "cube",
    config = {extra = {chips = 6}},
	pos = {x = 5, y = 4},
	loc_txt = {
        name = 'Cube',
        text = {
            "{C:chips}+#1#{} Chips"
        }
    	},
	rarity = 1,
	cost = -27,
    	blueprint_compat = true,
	atlas = "atlasone",
    source_gate = "sho",
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.chips}}
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and not context.before and not context.after then
            return {
                message = localize{type='variable',key='a_chips',vars={card.ability.extra.chips}},
                chip_mod = card.ability.extra.chips
            }
        end
    end
}
if JokerDisplay then
    cube.joker_display_definition = {
        text = {
            { text = "+" },
            { ref_table = "card.ability.extra", ref_value = "chips" }
        },
        text_config = { colour = G.C.CHIPS },
    }
end
local triplet_rhythm = {
    object_type = "Joker",
	name = "cry-Triplet Rhythm",
	key = "triplet_rhythm",
    config = {extra = {Xmult = 3}},
	pos = {x = 0, y = 4},
	loc_txt = {
        name = 'Triplet Rhythm',
        text = {
            "{X:mult,C:white} X#1# {} Mult if scoring hand",
            "contains {C:attention}exactly{} three {C:attention}3s"
        }
    },
	rarity = 1,
	cost = 6,
    blueprint_compat = true,
	atlas = "atlastwo",
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.Xmult}}
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
                    message = localize{type='variable',key='a_xmult',vars={card.ability.extra.Xmult}},
                    Xmult_mod = card.ability.extra.Xmult
                }
            end
        end
    end
}
if JokerDisplay then
    triplet_rhythm.joker_display_definition = {
        text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.joker_display_values", ref_value = "x_mult" }
                }
            }
        },
        calc_function = function(card)
            local count = 0
            local hand = next(G.play.cards) and G.play.cards or G.hand.highlighted
            local text, _, scoring_hand = JokerDisplay.evaluate_hand(hand)
            if text ~= 'Unknown' and #scoring_hand == 3 then
                for _, scoring_card in pairs(scoring_hand) do
                    if scoring_card:get_id() and scoring_card:get_id() == 3 then
                        count = count + 1
                    end
                end
            end
            card.joker_display_values.x_mult = count == 3 and card.ability.extra.Xmult or 1
        end,
    }
end
local booster = {
    object_type = "Joker",
	name = "cry-Booster Joker",
	key = "booster",
    config = {extra = {booster_slots = 1}},
	pos = {x = 2, y = 0},
	loc_txt = {
        name = 'Booster Joker',
        text = {
            "{C:attention}+#1#{} Booster Pack slot",
        }
    },
	rarity = 2,
	cost = 6,
    blueprint_compat = false,
	atlas = "atlastwo",
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.booster_slots}}
    end,
    add_to_deck = function(self, card, from_debuff)
        if not G.GAME.modifiers.cry_booster_packs then G.GAME.modifiers.cry_booster_packs = 2 end
        G.GAME.modifiers.cry_booster_packs = G.GAME.modifiers.cry_booster_packs + card.ability.extra.booster_slots
    end,
    remove_from_deck = function(self, card, from_debuff)
        if not G.GAME.modifiers.cry_booster_packs then G.GAME.modifiers.cry_booster_packs = 2 end
        G.GAME.modifiers.cry_booster_packs = G.GAME.modifiers.cry_booster_packs - card.ability.extra.booster_slots
    end
}
local chili_pepper = {
    object_type = "Joker",
	name = "cry-Chili Pepper",
	key = "chili_pepper",
    config = {extra = {Xmult = 1, Xmult_mod = 0.5, rounds_remaining = 8}},
	pos = {x = 0, y = 1},
	loc_txt = {
        name = 'Chili Pepper',
        text = {
            "This Joker gains {X:mult,C:white} X#2# {} Mult",
            "at end of round,",
            "{C:red,E:2}self destructs{} after {C:attention}#3#{} rounds",
	    "{C:inactive}(Currently{} {X:mult,C:white} X#1# {} {C:inactive}Mult){}"
        }
    },
	rarity = 2,
	cost = 6,
  	blueprint_compat = false,
	eternal_compat = false,
	perishable_compat = false,
	atlas = "atlastwo",
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.Xmult, center.ability.extra.Xmult_mod, center.ability.extra.rounds_remaining}}
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and not context.before and not context.after and to_big(card.ability.extra.Xmult) > to_big(1) then
            return {
                message = localize{type='variable',key='a_xmult',vars={card.ability.extra.Xmult}},
                Xmult_mod = card.ability.extra.Xmult
            }
        end
        if context.end_of_round and not context.blueprint and not context.individual and not context.repetition and not context.retrigger_joker then
            card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_mod
            card.ability.extra.rounds_remaining = card.ability.extra.rounds_remaining - 1
            if card.ability.extra.rounds_remaining > 0 then
                return {
                    message = localize{type = 'variable', key = 'a_xmult', vars = {card.ability.extra.Xmult}},
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
                                return true; end})) 
                        return true
                    end
                })) 
                return {
                    message = localize('k_eaten_ex'),
                    colour = G.C.FILTER
                }
            end
        end
    end
}
if JokerDisplay then
    chili_pepper.joker_display_definition = {
        text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.ability.extra", ref_value = "Xmult" }
                }
            }
        },
        reminder_text = {
            { ref_table = "card.joker_display_values", ref_value = "rounds_remaining" },
        },
        calc_function = function(card)
            card.joker_display_values.start_round = card.joker_display_values.start_round or
                card.ability.extra.rounds_remaining
            card.joker_display_values.rounds_remaining = "(" .. card.ability.extra.rounds_remaining ..
                "/" .. card.joker_display_values.start_round .. ")"
        end,
    }
end
local compound_interest = {
    object_type = "Joker",
	name = "cry-Compound Interest",
	key = "compound_interest",
    config = {extra = {percent_mod = 2, percent = 10}},
	pos = {x = 3, y = 2},
	loc_txt = {
        name = 'Compound Interest',
        text = {
			"Earn {C:money}#1#%{} of total money",
            "at end of round,",
            "increases by {C:money}#2#%{} per",
            "consecutive payout"
        }
    },
	rarity = 3,
	cost = 10,
	perishable_compat = false,
	atlas = "atlastwo",
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.percent, center.ability.extra.percent_mod}}
    end,
	calc_dollar_bonus = function(self, card)
		local bonus = math.max(0,math.floor(0.01*card.ability.extra.percent*G.GAME.dollars))
        card.ability.extra.percent = card.ability.extra.percent + card.ability.extra.percent_mod
        if bonus > 0 then return bonus end
	end
}
if JokerDisplay then
    compound_interest.joker_display_definition = {
        text = {
            { text = "+$" },
            { ref_table = "card.joker_display_values", ref_value = "dollars" },
        },
        text_config = { colour = G.C.GOLD },
        reminder_text = {
            { ref_table = "card.joker_display_values", ref_value = "localized_text" },
        },
        calc_function = function(card)
            local bonus = math.max(0, math.floor(0.01 * card.ability.extra.percent * G.GAME.dollars))
            card.joker_display_values.dollars = bonus and bonus > 0 and bonus or 0
            card.joker_display_values.localized_text = "(" .. localize("k_round") .. ")"
        end
    }
end
local big_cube = {
    object_type = "Joker",
	name = "cry-Big Cube",
	key = "big_cube",
    joker_gate = "cry-Cube",
    config = {extra = {x_chips = 6}},
	pos = {x = 4, y = 4},
	loc_txt = {
        name = 'Big Cube',
        text = {
            "{X:chips,C:white} X#1# {} Chips"
        }
    },
	rarity = 1,
	cost = 27,
	atlas = "atlasone",
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.x_chips}}
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and not context.before and not context.after then
            return {
                message = "X"..number_format(card.ability.extra.x_chips),
                Xchip_mod = card.ability.extra.x_chips,
                colour = G.C.CHIPS
            }
        end
    end
}
if JokerDisplay then
    big_cube.joker_display_definition = {
        text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.ability.extra", ref_value = "x_chips" }
                },
                border_colour = G.C.CHIPS
            }
        },
    }
end
local eternalflame = {
	object_type = "Joker",
	name = "cry-eternalflame",
	key = "eternalflame",
	pos = {x = 0, y = 4},
	config = {extra = {extra = 0.1, x_mult = 1}},
	loc_txt = {
        name = 'Eternal Flame',
        text = {
			"This Joker gains {X:mult,C:white} X#1# {} Mult",
			"for each card {C:attention}sold{}",
			"{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)"
		}
    },
	rarity = 3,
	cost = 9,
	perishable_compat = false,
	blueprint_compat = true,loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.extra, center.ability.extra.x_mult}}
    end,
	atlas = "atlasone",
	calculate = function(self, card, context)
        if context.cardarea == G.jokers and (to_big(card.ability.extra.x_mult) > to_big(1)) and not context.before and not context.after then
            return {
                message = localize{type='variable',key='a_xmult',vars={card.ability.extra.x_mult}},
                Xmult_mod = card.ability.extra.x_mult
            }
        end
		if context.selling_card and not context.blueprint then
			card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.extra
			card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize{type = 'variable', key = 'a_xmult', vars = {card.ability.extra.x_mult}}})
			return {calculated = true}
		end
	end
}
if JokerDisplay then
    eternalflame.joker_display_definition = {
        text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.ability.extra", ref_value = "x_mult" }
                }
            }
        },
    }
end
local nice = {
    object_type = "Joker",
	name = "cry-Nice",
	key = "nice",
    config = {extra = {chips = 420, sixcount = 0, ninecount = 0}},
	pos = {x = 2, y = 3},
	loc_txt = {
        name = 'Nice',
        text = {
            "{C:chips}+#1#{} Chips if played hand",
            "contains a {C:attention}6{} and a {C:attention}9",
	    "{C:inactive,s:0.8}Nice.{}"
        }
    },
	rarity = 3,
	cost = 6.9,
	atlas = "atlasone",
    blueprint_compat = true,loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.chips}}
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.before and not context.after then
            card.ability.extra.sixcount = 0
            card.ability.extra.ninecount = 0
            for i, v in pairs (context.full_hand) do
                if v:get_id() == 6 then
                    card.ability.extra.sixcount = card.ability.extra.sixcount + 1
                elseif v:get_id() == 9 then
                    card.ability.extra.ninecount = card.ability.extra.ninecount + 1
                end
            end
        elseif context.cardarea == G.jokers and not context.before and not context.after then
            if card.ability.extra.sixcount > 0 and card.ability.extra.ninecount > 0 then
                return {
                    message = localize{type='variable',key='a_chips',vars={card.ability.extra.chips or 0}},
                    chip_mod = card.ability.extra.chips or 0
                }
            end
        end
    end
}
if JokerDisplay then
    nice.joker_display_definition = {
        text = {
            { text = "+", },
            { ref_table = "card.joker_display_values", ref_value = "chips" },
        },
        text_config = { colour = G.C.CHIPS },
        reminder_text = {
            { text = '(6+9)', },
        },
        extra_config = { colour = G.C.GREEN, scale = 0.3 },
        calc_function = function(card)
            local six_count = 0
            local nine_count = 0
            local hand = next(G.play.cards) and G.play.cards or G.hand.highlighted
            for _, played_card in pairs(hand) do
                if played_card:get_id() then
                    if played_card:get_id() == 6 then
                        six_count = six_count + 1
                    elseif played_card:get_id() == 9 then
                        nine_count = nine_count + 1
                    end
                end
            end
            card.joker_display_values.chips = six_count > 0 and nine_count > 0 and card.ability.extra.chips or 0
        end
    }
end
local seal_the_deal = {
    object_type = "Joker",
    name = "cry-Seal The Deal",
    key = "seal_the_deal",
    config = {extra = {x_chips = 6}},
    pos = {x = 2, y = 4},
    loc_txt = {
        name = 'Seal the Deal',
        text = {
            "Add a {C:attention}random seal{} to each card",
            "scored on {C:attention}final hand{} of round"
        }
    },
    rarity = 2,
    cost = 5,
    atlas = "atlasone",
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if G.GAME.current_round.hands_left == 0 then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local seal_type = pseudorandom(pseudoseed("seal_the_deal"))
                        if seal_type > 0.75 then context.other_card:set_seal("Red", true)
                        elseif seal_type > 0.5 then context.other_card:set_seal("Blue", true)
                        elseif seal_type > 0.25 then context.other_card:set_seal("Gold", true)
                        else context.other_card:set_seal("Purple", true)
                        end
                        card:juice_up(0.3,0.4)
                        context.other_card:juice_up(0.3,0.3)
                        play_sound('gold_seal', 1.2, 0.4)
                        return true
                    end
                }))
                delay(0.5)
                return true
            end
        end
    end
}
local chad = {
	object_type = "Joker",
	name = "cry-Chad",
	key = "chad",
	pos = {x = 0, y = 3},
	config = {extra = {retriggers = 2}},
	loc_txt = {
        name = 'Chad',
        text = {
            "Retrigger {C:attention}leftmost{} Joker",
            "{C:attention}#1#{} additional time(s)"
		}
    },
	rarity = 3,
	cost = 10,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, center)
		return {vars = {center.ability.extra.retriggers}}
    end,
	atlas = "atlasone",
	calculate = function(self, card, context)
        if context.retrigger_joker_check and not context.retrigger_joker and context.other_card ~= self then
			if context.other_card == G.jokers.cards[1] then
				return {
					message = localize('k_again_ex'),
					repetitions = card.ability.extra.retriggers,
					card = card
				}
			else return {calculated = true} end
        end
	end
}
if JokerDisplay then
    chad.joker_display_definition = {
        reminder_text = {
            { text = '(', },
            { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
            { text = ')', },
        },
        calc_function = function(card)
            local leftmost_joker_key = G.jokers and G.jokers.cards[1] and G.jokers.cards[1] ~= card and
                G.jokers.cards[1].config.center.key
            card.joker_display_values.localized_text = leftmost_joker_key and
                localize { type = 'name_text', key = leftmost_joker_key, set = 'Joker' } or "-"
        end
    }
end
local jimball = {
	object_type = "Joker",
	name = "cry-Jimball",
	key = "jimball",
	pos = {x = 0, y = 0},
    config = {x_mult = 1, extra = 0.15, override_x_mult_check = true},
	loc_txt = {
        name = 'Jimball',
        text = {
            "This Joker gains {X:mult,C:white} X#1# {} Mult",
            "per {C:attention}consecutive{} hand played",
            "while playing your",
            "most played {C:attention}poker hand",
            "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)"
		}
    },
	loc_vars = function(self, info_queue, center)
		return {vars = {center.ability.extra, center.ability.x_mult}}
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
                        message = localize('k_reset')
                    }
                end
            else
                card.ability.x_mult = card.ability.x_mult + card.ability.extra
            end
        end
	end,
	atlas = "jimball",
}
if JokerDisplay then
    jimball.joker_display_definition = {
        text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.joker_display_values", ref_value = "x_mult" }
                }
            }
        },
        calc_function = function(card)
            local hand = G.hand.highlighted
            local text, _, _ = JokerDisplay.evaluate_hand(hand)
            local play_more_than = 0
            local hand_exists = text ~= 'Unknown' and G.GAME and G.GAME.hands and G.GAME.hands[text]
            if hand_exists then
                for k, v in pairs(G.GAME.hands) do
                    if text ~= k and v.played and v.played >= play_more_than and v.visible then
                        play_more_than = v.played
                    end
                end
            end
            card.joker_display_values.x_mult = (hand_exists and (G.GAME.hands[text].played < play_more_than and 1 or card.ability.x_mult + card.ability.extra) or card.ability.x_mult)
        end
    }
end
local jimball_sprite = { --left this one on it's own atlas for obvious reasons
	object_type = "Atlas",
    key = "jimball",
    path = "j_cry_jimball.png",
    px = 71,
    py = 95
}
local sus = {
	object_type = "Joker",
	name = "cry-SUS",
	key = "sus",
	pos = {x = 1, y = 3},
	loc_txt = {
        name = 'SUS',
        text = {
            "At end of round, create",
            "a {C:attention}copy{} of a random",
            "card {C:attention}held in hand{},",
            "destroy all others"
		}
    },
	rarity = 3,
	cost = 7,
	blueprint_compat = true,
	atlas = "atlasone",
	calculate = function(self, card, context)
        if context.end_of_round and not context.cardarea then
            if not card.ability.used_round or card.ability.used_round ~= G.GAME.round then
                card.ability.chosen_card = nil
            end
            local choosable_cards = {}
            for i = 1, #G.hand.cards do
                if not G.hand.cards[i].murdered_by_impostor then
                    choosable_cards[#choosable_cards+1] = G.hand.cards[i]
                end
            end
            card.ability.chosen_card = card.ability.chosen_card or pseudorandom_element(choosable_cards, pseudoseed('cry_sus'))
			if not card.ability.used_round or card.ability.used_round ~= G.GAME.round then
                card.ability.used_round = G.GAME.round
                local deletable_cards = {}
                for k, v in pairs(G.hand.cards) do
                    if not v.ability.eternal then deletable_cards[#deletable_cards + 1] = v end
                end
                local _first_dissolve = nil
                G.E_MANAGER:add_event(Event({trigger = 'before', delay = 0.75, func = function()
                    for k, v in pairs(deletable_cards) do
                        if v ~= card.ability.chosen_card then
                            v.murdered_by_impostor = true 
                            v:start_dissolve(nil, _first_dissolve)
                            _first_dissolve = true
                        end
                    end
                    return true end }))
            end
            G.E_MANAGER:add_event(Event({trigger = 'before', delay = 0.4, func = function()
                card:juice_up(0.3, 0.4)
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                local _c = copy_card(card.ability.chosen_card, nil, nil, G.playing_card)
                _c:start_materialize()
                _c:add_to_deck()
                G.deck.config.card_limit = G.deck.config.card_limit + 1
                table.insert(G.playing_cards, _c)
                G.hand:emplace(_c)
                playing_card_joker_effects({_c})
                return true end }))
            return {message = "Impostor!"}
        end
	end
}
local fspinner = {
	object_type = "Joker",
	name = "cry-fspinner",
	key = "fspinner",
	pos = {x = 4, y = 0},
        config = {extra = {chips = 0, chip_mod = 14}},
	loc_txt = {
        name = 'Fidget Spinner',
        text = {
            "This Joker gains {C:chips}+#2#{} Chips",
            "if hand played is {C:attention}not{}",
            "most played {C:attention}poker hand{}",
            "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)"
		}
    },
	loc_vars = function(self, info_queue, center)
		return {vars = {center.ability.extra.chips, center.ability.extra.chip_mod}}
    end,
	rarity = 2,
	cost = 6,
	blueprint_compat = true,
	perishable_compat = false,
	atlas = 'fspinner',
	calculate = function(self, card, context)
        if context.before and not context.blueprint then
            local play_more_than = (G.GAME.hands[context.scoring_name].played or 0)
            for k, v in pairs(G.GAME.hands) do
                if k ~= context.scoring_name and v.played >= play_more_than and v.visible then
		    card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod
		    return {
                    	message = localize('k_upgrade_ex'),
                        card = card,
			}
		end
	    end
	
        end
        if context.cardarea == G.jokers and (to_big(card.ability.extra.chips) > to_big(0)) and not context.before and not context.after then
            return {
                message = localize{type='variable',key='a_chips',vars={card.ability.extra.chips}},
                chip_mod = card.ability.extra.chips
            }
	    end
	end,
	atlas = "atlasone",
}
if JokerDisplay then
    fspinner.joker_display_definition = {
        text = {
            { text = "+" },
            { ref_table = "card.joker_display_values", ref_value = "chips" }
        },
        text_config = { colour = G.C.CHIPS },
        calc_function = function(card)
            local hand = G.hand.highlighted
            local text, _, _ = JokerDisplay.evaluate_hand(hand)
            local play_more_than = 0
            local hand_exists = text ~= 'Unknown' and G.GAME and G.GAME.hands and G.GAME.hands[text]
            if hand_exists then
                for k, v in pairs(G.GAME.hands) do
                    if v.played and v.played >= play_more_than and v.visible then
                        play_more_than = v.played
                    end
                end
            end
            card.joker_display_values.chips = (hand_exists and (G.GAME.hands[text].played < play_more_than and card.ability.extra.chips + card.ability.extra.chip_mod) or card.ability.extra.chips)
        end
    }
end
local waluigi = {
	object_type = "Joker",
	name = "cry-Waluigi",
	key = "waluigi",
	pos = {x = 0, y = 3},
    soul_pos = {x = 1, y = 3},
    config = {extra = {Xmult = 2.5}},
	loc_txt = {
        name = 'Waluigi',
        text = {
            "All Jokers give",
            "{X:mult,C:white} X#1# {} Mult"
		}
    },
	loc_vars = function(self, info_queue, center)
		return {vars = {center.ability.extra.Xmult}}
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
                    end
                })) 
            end
            return {
                message = localize{type='variable',key='a_xmult',vars={card.ability.extra.Xmult}},
                Xmult_mod = card.ability.extra.Xmult
            }
        end
	end,
	atlas = "atlastwo",
}
if JokerDisplay then
    waluigi.joker_display_definition = {
        mod_function = function(card, mod_joker)
            return { x_mult = mod_joker.ability.extra.Xmult }
        end
    }
end
local krustytheclown = {
	object_type = "Joker",
	name = "cry-krustytheclown",
	key = "krustytheclown",
	pos = {x = 3, y = 4},
	config = {extra = {extra = 0.02, x_mult = 1}},
	loc_txt = {
        name = 'Krusty the Clown',
        text = {
			"This Joker gains",
			"{X:mult,C:white} X#1# {} Mult when",
			"each played {C:attention}card{} is scored",
			"{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)"
		}
    	},
	rarity = 2,
	cost = 7,
	perishable_compat = false,
	blueprint_compat = true,loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.extra, center.ability.extra.x_mult}}
    	end,
	atlas = "atlasone",
	calculate = function(self, card, context)
        if context.cardarea == G.jokers and (to_big(card.ability.extra.x_mult) > to_big(1)) and not context.before and not context.after then
            return {
                message = localize{type='variable',key='a_xmult',vars={card.ability.extra.x_mult}},
                Xmult_mod = card.ability.extra.x_mult
            }
        end
		if context.cardarea == G.play and context.individual and not context.blueprint then
			card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.extra
			return {
					extra = {focus = card, message = localize('k_upgrade_ex')},
					card = card,
					colour = G.C.MULT
				}
		end
	end
}
if JokerDisplay then
    krustytheclown.joker_display_definition = {
        text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.ability.extra", ref_value = "x_mult" }
                }
            }
        },
    }
end
local blurred = {
	object_type = "Joker",
	name = "cry-blurred",
	key = "blurred",
	pos = {x = 4, y = 4},
	config = {extra = {hands = 1}},
	loc_txt = {
        name = 'Blurred Joker',
        text = {
			"Gain {C:blue}+#1#{} hand(s) when",
			"{C:attention}Blind{} is selected"
		}
   	},
	rarity = 1,
	cost = 4,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, center)
	return {vars = {center.ability.extra.hands}}
	end,
	atlas = "atlastwo",
	calculate = function(self, card, context)
        if context.setting_blind and not (context.blueprint_card or card).getting_sliced then
			return {
				message = localize('k_hand'), --make this actually work in the future
				ease_hands_played(card.ability.extra.hands),
				delay(0.6),
			}
		end
	end 
}
local gardenfork = {
    object_type = "Joker",
    name = "cry-gardenfork",
    key = "gardenfork",
    pos = {x = 0, y = 1},
    config = {extra = {money = 7}},
    loc_txt = {
        name = 'Garden of Forking Paths',
        text = { "Earn {C:money}$#1#{} if {C:attention}played hand{}",
        "contains an {C:attention}Ace{} and a {C:attention}7{}",
	}
    },
    rarity = 3,
    cost = 7,
    blueprint_compat = true,
    atlas = "atlasone",
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.money}}
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.before and not context.blueprint then
            for i = 1, #context.full_hand do
                if SMODS.Ranks[context.full_hand[i].base.value].key == "Ace" then
                    for j = 1, #context.full_hand do
                        if SMODS.Ranks[context.full_hand[j].base.value].key == "7" then
			    ease_dollars(card.ability.extra.money)
                            return {message = "$" .. card.ability.extra.money, colour = G.C.MONEY}
                        end
                    end
                end
            end
        end
    end
}
if JokerDisplay then
    gardenfork.joker_display_definition = {
        text = {
            { text = "+$" },
            { ref_table = "card.joker_display_values", ref_value = "dollars" },
        },
        text_config = { colour = G.C.GOLD },
        reminder_text = {
            { ref_table = "card.joker_display_values", ref_value = "localized_text" },
        },
        calc_function = function(card)
            local ace_count = 0
            local seven_count = 0
            local hand = next(G.play.cards) and G.play.cards or G.hand.highlighted
            local text, _, scoring_hand = JokerDisplay.evaluate_hand(hand)
            if text ~= 'Unknown' then
                for _, scoring_card in pairs(scoring_hand) do
                    if scoring_card:get_id() then
                        if scoring_card:get_id() == 14 then
                            ace_count = ace_count + 1
                        elseif scoring_card:get_id() == 7 then
                            seven_count = seven_count + 1
                        end
                    end
                end
            end
            card.joker_display_values.dollars = ace_count > 0 and seven_count > 0 and card.ability.extra.money or 0
            card.joker_display_values.localized_text = "(" .. localize("Ace", "ranks") .. "+7)"
        end
    }
end
local lightupthenight = {
	object_type = "Joker",
	name = "cry-lightupthenight",
	key = "lightupthenight",
	config = {extra = {xmult = 1.5}},
	pos = {x = 1, y = 1},
	atlas = 'atlasone',
	loc_txt = {
        name = 'Light Up the Night',
        text = {
		"Each played {C:attention}7{} or {C:attention}2{}",
		"gives {X:mult,C:white}X#1#{} Mult when scored",
    	}
	},
	rarity = 3,
	cost = 7,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, center)
		return {vars = {center.ability.extra.xmult}}
	end,
	calculate = function(self, card, context)
		if context.cardarea == G.play and context.individual then
			local rank = SMODS.Ranks[context.other_card.base.value].key
			if rank == "2" or rank == "7" then
				return {
                    		x_mult = card.ability.extra.xmult,
                    		colour = G.C.RED,
                    		card = card
                		}
			end
		end
	end
}
if JokerDisplay then
    lightupthenight.joker_display_definition = {
        text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.joker_display_values", ref_value = "x_mult" }
                }
            }
        },
        reminder_text = {
            { text = "(7,2)" },
        },
        calc_function = function(card)
            local count = 0
            local hand = next(G.play.cards) and G.play.cards or G.hand.highlighted
            local text, _, scoring_hand = JokerDisplay.evaluate_hand(hand)
            if text ~= 'Unknown' then
                for _, scoring_card in pairs(scoring_hand) do
                    if scoring_card:get_id() and (scoring_card:get_id() == 2 or scoring_card:get_id() == 7) then
                        count = count +
                            JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                    end
                end
            end
            card.joker_display_values.x_mult = tonumber(string.format("%.2f", (card.ability.extra.xmult ^ count)))
        end,
    }
end
local nosound = {
    object_type = "Joker",
    name = "cry-nosound",
    key = "nosound",
    config = {extra = {retriggers = 3}},
    pos = {x = 2, y = 1},
    atlas = 'atlasone',
    loc_txt = {
        name = 'No Sound, No Memory',
        text = {
            "Retrigger each played {C:attention}7{}",
            "{C:attention:}#1#{} additional time(s)",
        }
    },
    rarity = 3,
    cost = 7,
    blueprint_compat = true,
    loc_vars = function(self, info_queue, center)
        return {vars = { center.ability.extra.retriggers}}
    end,
    calculate = function(self, card, context)
        if context.repetition then
            if context.cardarea == G.play then
	    	local rank = SMODS.Ranks[context.other_card.base.value].key
		if rank == "7" then
                	return {
                    	message = localize('k_again_ex'),
                    	repetitions = card.ability.extra.retriggers,
                    	card = card
                	}
		end
            end
	end
    end
}
if JokerDisplay then
    nosound.joker_display_definition = {
        retrigger_function = function(playing_card, scoring_hand, held_in_hand, joker_card)
            if held_in_hand then return 0 end
            return playing_card:get_id() and playing_card:get_id() == 7 and joker_card.ability.extra.retriggers or 0
        end
    }
end
local antennastoheaven = {
    object_type = "Joker",
    name = "cry-antennastoheaven",
    key = "antennastoheaven",
    pos = {x = 3, y = 1},
    config = {extra = {bonus = 0.1, x_chips = 1}},
    loc_txt = {
        name = '...Like Antennas to Heaven',
        text = {
            "This Joker gains",
	    "{X:chips,C:white} X#1# {} Chips when each",
            "played {C:attention}7{} or {C:attention}4{} is scored",
            "{C:inactive}(Currently {X:chips,C:white}X#2# {C:inactive} Chips)"
        }
    },
    rarity = 3,
    cost = 7,
    perishable_compat = false,
    blueprint_compat = true,
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.bonus, center.ability.extra.x_chips}}
    end,
    atlas = "atlasone",
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and (to_big(card.ability.extra.x_chips) > to_big(1)) and not context.before and not context.after then
            return {
                message = "X"..number_format(card.ability.extra.x_chips),
                Xchip_mod = card.ability.extra.x_chips,
                colour = G.C.CHIPS
            }
	end
	if context.cardarea == G.play and context.individual and not context.blueprint then
            local rank = SMODS.Ranks[context.other_card.base.value].key
            if rank == "4" or rank == "7" then
                card.ability.extra.x_chips = card.ability.extra.x_chips + card.ability.extra.bonus
                return {
                    extra = {focus = card, message = localize('k_upgrade_ex')},
                    card = card,
                    colour = G.C.CHIPS
                }
            end
        end
    end
}
if JokerDisplay then
    antennastoheaven.joker_display_definition = {
        text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.ability.extra", ref_value = "x_chips" }
                },
                border_colour = G.C.CHIPS
            }
        },
        reminder_text = {
            { text = "(7,4)" },
        },
    }
end
local hunger = {
    	object_type = "Joker",
	name = "cry-hunger",
	key = "hunger",
    	config = {extra = {money = 3}},
	pos = {x = 3, y = 0},
	loc_txt = {
        name = 'Consume-able',
        text = {
            "Earn {C:money}$#1#{} when",
            "using a {C:attention}consumable{}",
        }
    	},
	rarity = 2,
	cost = 6,
    	blueprint_compat = true,
	atlas = "atlastwo",
    	loc_vars = function(self, info_queue, center)
	return {vars = {center.ability.extra.money}}
    end,
    calculate = function(self, card, context) --This didn't work for Jevonn for some reason but it works for me :joker:
        if context.using_consumeable then --shush
		return {
		ease_dollars(card.ability.extra.money),
		message = "$" .. card.ability.extra.money, colour = G.C.MONEY, --this isn't displaying a message for some reason ugh
		card = card
		}
        end
    end
}
local weegaming = {
    object_type = "Joker",
    name = "cry-weegaming",
    key = "weegaming",
    config = {extra = {retriggers = 2}},
    pos = {x = 3, y = 4},
    atlas = 'atlastwo',
    loc_txt = {
        name = '2D',
        text = {
            "Retrigger each played {C:attention}2{}", --wee gaming
            "{C:attention:}#1#{} additional time(s)", --wee gaming?
	    "{C:inactive,s:0.8}Wee Gaming?{}"
        }
    },
    rarity = 2,
    cost = 6,
    blueprint_compat = true,
    loc_vars = function(self, info_queue, center)
        return {vars = { center.ability.extra.retriggers}}
    end,
    calculate = function(self, card, context)
        if context.repetition then
            if context.cardarea == G.play then
	    	local rank = SMODS.Ranks[context.other_card.base.value].key
		if rank == "2" then
                	return {
                    	message = localize('k_again_ex'),
                    	repetitions = card.ability.extra.retriggers,
                    	card = card
                	}
		end
            end
	end
    end
}
if JokerDisplay then
    weegaming.joker_display_definition = {
        retrigger_function = function(playing_card, scoring_hand, held_in_hand, joker_card)
            if held_in_hand then return 0 end
            return playing_card:get_id() and playing_card:get_id() == 2 and joker_card.ability.extra.retriggers or 0
        end
    }
end
local redbloon = {
    object_type = "Joker",
    name = "cry-redbloon",
    key = "redbloon",
    config = {extra = {money = 20, rounds_remaining = 2, text = "s"}},
    pos = {x = 5, y = 1},
    loc_txt = {
        name = 'Red Bloon',
        text = {
            "Earn {C:money}$#1#{} in {C:attention}#2#{} round#3#",
            "{C:red,E:2}self destructs{}"
        }
    },
    rarity = 1,
    cost = 4,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = false,
    atlas = "atlasone",
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.money, center.ability.extra.rounds_remaining, center.ability.extra.text}}
    end,
    calculate = function(self, card, context)
        if context.end_of_round and not context.blueprint and not context.individual and not context.repetition and not context.retrigger_joker then
            card.ability.extra.rounds_remaining = card.ability.extra.rounds_remaining - 1
            if card.ability.extra.rounds_remaining > 0 then
                return {
                    message = {"-1 Round"},
                    colour = G.C.FILTER
                }
            else
                ease_dollars(card.ability.extra.money)
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
                    message = "$" .. card.ability.extra.money, colour = G.C.MONEY
                }
            end
        end
	if card.ability.extra.rounds_remaining == 1 then
		card.ability.extra.text = ""
	end
    end
}
if JokerDisplay then
    redbloon.joker_display_definition = {
        text = {
            { text = "+$" },
            { ref_table = "card.joker_display_values", ref_value = "dollars" },
        },
        text_config = { colour = G.C.GOLD },
        reminder_text = {
            { ref_table = "card.joker_display_values", ref_value = "localized_text" },
            { ref_table = "card.joker_display_values", ref_value = "rounds_remaining" },
        },
        calc_function = function(card)
            card.joker_display_values.dollars = card.ability.extra.rounds_remaining and
                card.ability.extra.rounds_remaining <= 1 and card.ability.extra.money or 0
    
            card.joker_display_values.localized_text = "(" .. localize("k_round") .. ")"
            card.joker_display_values.start_round = card.joker_display_values.start_round or
                card.ability.extra.rounds_remaining
            card.joker_display_values.rounds_remaining = " (" .. card.ability.extra.rounds_remaining ..
                "/" .. card.joker_display_values.start_round .. ")"
        end
    }
end
local apjoker = {
    object_type = "Joker",
    name = "cry-apjoker",
    key = "apjoker",
    pos = {x = 2, y = 0},
    config = {extra = {x_mult = 4}},
    loc_txt = {
        name = 'AP Joker',
        text = { "{X:mult,C:white} X#1# {} Mult against {C:attention}Boss Blinds{}"}
    },
    rarity = 2,
    cost = 6,
    blueprint_compat = true,
    perishable_compat = false,
    atlas = "atlasone",
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.x_mult}}
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and G.GAME.blind.boss and not context.before and not context.after then
            return {
                message = localize{type='variable',key='a_xmult',vars={card.ability.extra.x_mult}},
                Xmult_mod = card.ability.extra.x_mult
            }
        end
    end
}
if JokerDisplay then
    apjoker.joker_display_definition = {
        text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.joker_display_values", ref_value = "x_mult" }
                }
            }
        },
        calc_function = function(card)
            local is_boss = G.GAME and G.GAME.blind and G.GAME.blind.get_type and
                G.GAME.blind:get_type() == 'Boss'
            card.joker_display_values.x_mult = is_boss and card.ability.extra.x_mult or 1
        end,
    }
end
local maze = {
    object_type = "Joker",
    name = "cry-maze",
    key = "maze",
    pos = {x = 1, y = 1},
    loc_txt = {
        name = 'Labyrinth',
        text = {
            "All hands are considered the",
            "{C:attention}first hand{} of each round,",
            "all discards are considered the",
            "{C:attention}first discard{} of each round"
        }
    },
    rarity = 1,
    cost = 1,
    atlas = "atlastwo",
    calculate = function(self, card, context)
        if context.after and not context.blueprint and not context.retrigger_joker then
	    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                func = function()
                       G.GAME.current_round.hands_played = 0
            	       G.GAME.current_round.discards_used = 0
                return true; end})) 
            return true
        end
	if context.discard and not context.blueprint and not context.retrigger_joker then
	    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                func = function()
                       G.GAME.current_round.hands_played = 0
            	       G.GAME.current_round.discards_used = 0
                return true; end})) 
            return true
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        G.GAME.current_round.hands_played = 0
        G.GAME.current_round.discards_used = 0
    end
}
--Fixed Jank for the most part. Other modded jokers may still be jank depending on how they are implemented
--funny side effect of this fix causes trading card and dna to juice up like craaazy lol
local panopticon = {
    object_type = "Joker",
    name = "cry-panopticon",
    key = "panopticon",
    pos = {x = 1, y = 4},
	config = {
		extra = {}
	},
    loc_txt = {
        name = 'Panopticon',
        text = {
            "All hands are considered the",
            "{C:attention}last hand{} of each round" -- +$4
        }
    },
    rarity = 1,
    cost = 1,
    atlas = "atlastwo",
    calculate = function(self, card, context)
        if (context.before) and not context.blueprint and not context.retrigger_joker then
	    if not G.GAME.cry_panop_juggle then G.GAME.cry_panop_juggle = G.GAME.current_round.hands_left end
            G.GAME.current_round.hands_left = 0
        end
        if (context.after) and not context.blueprint and not context.retrigger_joker then
            if G.GAME.cry_panop_juggle then
                G.GAME.current_round.hands_left = G.GAME.cry_panop_juggle
                G.GAME.cry_panop_juggle = nil
	    end
        end

    end
}
local magnet = {
    object_type = "Joker",
    name = "cry-magnet",
    key = "magnet",
    pos = {x = 4, y = 0},
    config = {extra = {money = 2, Xmoney = 5, slots = 4}},
    loc_txt = {
        name = 'Fridge Magnet',
        text = {
            "Earn {C:money}$#1#{} at end of round",
	    "This earns {X:money,C:white} X#2# {} if there are",
	    "{C:attention}#3#{} or fewer {C:attention}Joker{} cards",
        }
    },
    rarity = 1,
    cost = 6,
    blueprint_compat = false,
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.money, center.ability.extra.Xmoney, center.ability.extra.slots}}
    end,
    atlas = "atlastwo",
    calc_dollar_bonus = function(self, card)
        if #G.jokers.cards <= card.ability.extra.slots then
            return card.ability.extra.money * card.ability.extra.Xmoney
	else
	    return card.ability.extra.money
	end
    end
}
if JokerDisplay then
    magnet.joker_display_definition = {
        text = {
            { text = "+$" },
            { ref_table = "card.joker_display_values", ref_value = "dollars" },
        },
        text_config = { colour = G.C.GOLD },
        reminder_text = {
            { ref_table = "card.joker_display_values", ref_value = "localized_text" },
        },
        calc_function = function(card)
            card.joker_display_values.dollars = G.jokers and #G.jokers.cards <= card.ability.extra.slots and
                card.ability.extra.money * card.ability.extra.Xmoney or card.ability.extra.money
    
            card.joker_display_values.localized_text = "(" .. localize("k_round") .. ")"
        end
    }
end
local unjust_dagger = {
object_type = "Joker",
name = "cry-Unjust Dagger",
key = "unjust_dagger",
pos = {x = 3, y = 0},
config = {extra = {x_mult = 1}},
loc_txt = {
name = 'Unjust Dagger',
text = {
"When {C:attention}Blind{} is selected,",
"destroy Joker to the left",
"and gain {C:attention}one-fifth{} of",
"its sell value as {X:mult,C:white} XMult {}",
"{C:inactive}(Currently {X:mult,C:white} X#1# {C:inactive} Mult)"
}
},
rarity = 2,
cost = 8,
perishable_compat = false,
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.x_mult}}
    end,
atlas = "atlasone",
calculate = function(self, card, context)
        if context.cardarea == G.jokers and (card.ability.extra.x_mult > 1) and not context.before and not context.after then
            return {
                message = localize{type='variable',key='a_xmult',vars={card.ability.extra.x_mult}},
                Xmult_mod = card.ability.extra.x_mult
            }
        end
            local my_pos = nil
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then my_pos = i; break end
end
        if context.setting_blind and not (context.blueprint_card or self).getting_sliced and my_pos and G.jokers.cards[my_pos-1] and not G.jokers.cards[my_pos-1].ability.eternal and not G.jokers.cards[my_pos-1].getting_sliced then 
            local sliced_card = G.jokers.cards[my_pos-1]
            sliced_card.getting_sliced = true
            if sliced_card.config.center.rarity == "cry_exotic" then check_for_unlock({type = "what_have_you_done"}) end
            G.GAME.joker_buffer = G.GAME.joker_buffer - 1
            G.E_MANAGER:add_event(Event({func = function()
                G.GAME.joker_buffer = 0
                card.ability.extra.x_mult = card.ability.extra.x_mult + sliced_card.sell_cost*0.2
                card:juice_up(0.8, 0.8)
                sliced_card:start_dissolve({HEX("57ecab")}, nil, 1.6)
                play_sound('slice1', 0.96+math.random()*0.08)
            return true end }))
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize{type = 'variable', key = 'a_xmult', vars = {card.ability.extra.x_mult+0.2*sliced_card.sell_cost}}, colour = G.C.RED, no_juice = true})
return {calculated = true}
        end
    end
}
if JokerDisplay then
    unjust_dagger.joker_display_definition = {
        text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.ability.extra", ref_value = "x_mult" }
                }
            }
        },
    }
end
local monkey_dagger = {
	object_type = "Joker",
	name = "cry-Monkey Dagger",
	key = "monkey_dagger",
	pos = {x = 4, y = 3},
	config = {extra = {chips = 0}},
	loc_txt = {
		name = 'Monkey Dagger',
		text = {
			"When {C:attention}Blind{} is selected,",
			"destroy Joker to the left",
			"and permanently add {C:attention}ten times{}",
			"its sell value to this {C:chips}Chips{}",
			"{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)"
		}
	},
	rarity = 2,
	cost = 6,
	perishable_compat = false,
	    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.chips}}
    end,
	atlas = "atlastwo",
		calculate = function(self, card, context)
        if context.cardarea == G.jokers and (to_big(card.ability.extra.chips) > to_big(0)) and not context.before and not context.after then
            return {
                message = localize{type='variable',key='a_chips',vars={card.ability.extra.chips}},
                chip_mod = card.ability.extra.chips
            }
        end
            local my_pos = nil
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then my_pos = i; break end
		end
        if context.setting_blind and not (context.blueprint_card or self).getting_sliced and my_pos and G.jokers.cards[my_pos-1] and not G.jokers.cards[my_pos-1].ability.eternal and not G.jokers.cards[my_pos-1].getting_sliced then 
            local sliced_card = G.jokers.cards[my_pos-1]
            sliced_card.getting_sliced = true
            if sliced_card.config.center.rarity == "cry_exotic" then check_for_unlock({type = "what_have_you_done"}) end
            G.GAME.joker_buffer = G.GAME.joker_buffer - 1
            G.E_MANAGER:add_event(Event({func = function()
                G.GAME.joker_buffer = 0
                card.ability.extra.chips = card.ability.extra.chips + sliced_card.sell_cost*10
                card:juice_up(0.8, 0.8)
                sliced_card:start_dissolve({HEX("57ecab")}, nil, 1.6)
                play_sound('slice1', 0.96+math.random()*0.08)
            return true end }))
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize{type = 'variable', key = 'a_chips', vars = {card.ability.extra.chips+10*sliced_card.sell_cost}}, colour = G.C.CHIPS, no_juice = true})
			return {calculated = true}
        end
    end
}
if JokerDisplay then
    monkey_dagger.joker_display_definition = {
        text = {
            { text = "+" },
            { ref_table = "card.ability.extra", ref_value = "chips" }
        },
        text_config = { colour = G.C.CHIPS },
    }
end
local pirate_dagger = {
	object_type = "Joker",
	name = "cry-Pirate Dagger",
	key = "pirate_dagger",
	pos = {x = 3, y = 3},
	config = {extra = {x_chips = 1}},
	loc_txt = {
		name = 'Pirate Dagger',
		text = {
			"When {C:attention}Blind{} is selected,",
			"destroy Joker to the right",
			"and gain {C:attention}one-fourth{} of",
			"its sell value as {X:chips,C:white} XChips {}",
			"{C:inactive}(Currently {X:chips,C:white} X#1# {C:inactive} Chips)"
		}
	},
	rarity = 2,
	cost = 8,
	perishable_compat = false,
	    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.x_chips}}
    end,
	atlas = "atlastwo",
		calculate = function(self, card, context)
        if context.cardarea == G.jokers and (card.ability.extra.x_chips > 1) and not context.before and not context.after then
            return {
                message = localize{type='variable',key='a_xchips',vars={card.ability.extra.x_chips}},
                Xchip_mod = card.ability.extra.x_chips
            }
        end
            local my_pos = nil
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then my_pos = i; break end
		end
        if context.setting_blind and not (context.blueprint_card or self).getting_sliced and my_pos and G.jokers.cards[my_pos+1] and not G.jokers.cards[my_pos+1].ability.eternal and not G.jokers.cards[my_pos+1].getting_sliced then 
            local sliced_card = G.jokers.cards[my_pos+1]
            sliced_card.getting_sliced = true
            if sliced_card.config.center.rarity == "cry_exotic" then check_for_unlock({type = "what_have_you_done"}) end
            G.GAME.joker_buffer = G.GAME.joker_buffer - 1
            G.E_MANAGER:add_event(Event({func = function()
                G.GAME.joker_buffer = 0
                card.ability.extra.x_chips = card.ability.extra.x_chips + sliced_card.sell_cost*0.25
                card:juice_up(0.8, 0.8)
                sliced_card:start_dissolve({HEX("57ecab")}, nil, 1.6)
                play_sound('slice1', 0.96+math.random()*0.08)
            return true end }))
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize{type = 'variable', key = 'a_xchips', vars = {card.ability.extra.x_chips+0.25*sliced_card.sell_cost}}, colour = G.C.CHIPS, no_juice = true})
			return {calculated = true}
        end
    end
}
if JokerDisplay then
    pirate_dagger.joker_display_definition = {
        text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.ability.extra", ref_value = "x_chips" }
                },
                border_colour = G.C.CHIPS
            }
        },
    }
end
local mondrian = {
    object_type = "Joker",
    name = "cry-mondrian",
    key = "mondrian",
    pos = {x = 5, y = 3},
    config = {extra = {extra = 0.25, x_mult = 1}},
    loc_txt = {
    name = 'Mondrian',
    text = {
                "This Joker gains {X:mult,C:white} X#1# {} Mult",
                "if no {C:attention}discards{} were",
		"used this round",
                "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)"
           }
    },
    rarity = 2,
    cost = 7,
    perishable_compat = false,
    blueprint_compat = true,
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.extra, center.ability.extra.x_mult}}
    end,
    atlas = "atlastwo",
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and (to_big(card.ability.extra.x_mult) > to_big(1)) and not context.before and not context.after then
            return {
                message = localize{type='variable',key='a_xmult',vars={card.ability.extra.x_mult}},
                Xmult_mod = card.ability.extra.x_mult
            }
        end
        if context.end_of_round and G.GAME.current_round.discards_used == 0 and not context.blueprint and not context.individual and not context.repetition then
            card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.extra
            return {
                    	message = localize('k_upgrade_ex'),
                        card = card,
			}
        end
    end
}
if JokerDisplay then
    mondrian.joker_display_definition = {
        text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.ability.extra", ref_value = "x_mult" }
                }
            }
        },
    }
end
local sapling = {
	object_type = "Joker",
	name = "cry-sapling",
	key = "sapling",
	pos = {x = 3, y = 2},
	config = {extra = {score = 0, req = 30}},
	loc_txt = {
        name = 'Sapling',
        text = {
			"After scoring {C:attention}#2#{} {C:inactive}[#1#]{} Enhanced",
			"cards, sell this card to",
			"create an {C:cry_epic}Epic{} {C:attention}Joker{}",
			"{C:inactive,s:0.8}Will create a {C:red,s:0.8}Rare{} {C:attention,s:0.8}Joker{}",
			"{C:inactive,s:0.8}if {C:cry_epic,s:0.8}Epic{} {C:inactive,s:0.8}Jokers are disabled{}"
		}
    	},
	rarity = 2,
	cost = 6,
	blueprint_compat = true,
	eternal_compat = false,
	loc_vars = function(self, info_queue, center)
		return {vars = {center.ability.extra.score, center.ability.extra.req}}
    	end,
	atlas = "atlasone",
	calculate = function(self, card, context)
        	if context.individual and context.cardarea == G.play and not context.blueprint and not context.retrigger_joker then
			if context.other_card.ability.effect ~= "Base" then
				card.ability.extra.score = card.ability.extra.score + 1
				if card.ability.extra.score >= card.ability.extra.req then
					local eval = function(card) return not card.REMOVED end
					juice_card_until(self, eval, true)
				end
			end
		end
		if context.selling_self and card.ability.extra.score >= card.ability.extra.req and not context.blueprint and not context.retrigger_joker then
			local card = create_card("Joker", G.jokers, nil, 1, nil, nil, nil, "cry_sapling")
                        card:add_to_deck()
                        G.jokers:emplace(card)
                        card:start_materialize()
			return {completed=true}
		end
	end
}
if JokerDisplay then
    sapling.joker_display_definition = {
        reminder_text = {
            { ref_table = "card.joker_display_values", ref_value = "localized_text" },
        },
        calc_function = function(card)
            local is_active = card.ability.extra.score >= card.ability.extra.req
            card.joker_display_values.localized_text = "(" ..
                (is_active and localize("k_active_ex") or (card.ability.extra.score .. "/" .. card.ability.extra.req)) .. ")"
        end
    }
end
local spaceglobe = {
	object_type = "Joker",
	name = "cry-spaceglobe",
	key = "spaceglobe",
	pos = {x = 1, y = 4},
	config = {extra = {x_chips = 1, Xchipmod = 0.2, type = "High Card"}},
	loc_txt = {
        name = 'Celestial Globe',
        text = {
			"This Joker gains {X:chips,C:white}X#2#{} Chips",
			"if {C:attention}poker hand{} is a {C:attention}#3#{},",
			"Hand changes after increase{}",
			"{C:inactive}(Currently{} {X:chips,C:white}X#1#{} {C:inactive}Chips){}"
		}
    	},
	rarity = 3,
	cost = 8,
	blueprint_compat = true,
	perishable_compat = false,
	loc_vars = function(self, info_queue, center)
		return {vars = {center.ability.extra.x_chips, center.ability.extra.Xchipmod, center.ability.extra.type}}
    	end,
	atlas = "atlasone",
	calculate = function(self, card, context)
        	if context.cardarea == G.jokers and context.before and not context.blueprint then
                	if context.scoring_name == card.ability.extra.type then
                    	G.E_MANAGER:add_event(Event({
                        	func = function()
                            	local _type = {}
                            	for k, v in pairs(G.GAME.hands) do
                                	if v.visible and k ~= card.ability.to_do_type then _type[#_type+1] = k end
                            	end
                            	card.ability.extra.type = pseudorandom_element(_type, pseudoseed('cry_space_globe'))
                            	return true
                        	end
                    	}))
			card.ability.extra.x_chips = card.ability.extra.x_chips + card.ability.extra.Xchipmod
                    	return {
                    	message = localize('k_upgrade_ex'),
                        card = card,
			}
                	end
		end
		if context.cardarea == G.jokers and (to_big(card.ability.extra.x_chips) > to_big(1)) and not context.before and not context.after then
            		return {
                		message = "X"..number_format(card.ability.extra.x_chips),
                		Xchip_mod = card.ability.extra.x_chips,
                		colour = G.C.CHIPS
            		}
		end
		
        end
}
if JokerDisplay then
    spaceglobe.joker_display_definition = {
        text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.ability.extra", ref_value = "x_chips" }
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
            card.joker_display_values.localized_text = localize(card.ability.extra.type, 'poker_hands')
        end
    }
end
local happy = {
    object_type = "Joker",
    name = "cry-happy",
    key = "happy",
    pos = {x = 2, y = 1},
    loc_txt = {
        name = ':D',
        text = {
            "Create a random {C:attention}Joker{}",
            "at end of round",
	    "Sell this card to",
	    "create a random {C:attention}Joker{}",
	    "{C:inactive}(Must have room){}"
        }
    },
    rarity = 1,
    cost = 2,
    blueprint_compat = true,
    eternal_compat = false,
    atlas = "atlastwo",
    calculate = function(self, card, context)
        if context.selling_self and #G.jokers.cards + G.GAME.joker_buffer <= G.jokers.config.card_limit and not context.retrigger_joker then
		local sellcreatejoker = 1
                G.GAME.joker_buffer = G.GAME.joker_buffer + sellcreatejoker
                G.E_MANAGER:add_event(Event({
                    func = function() 
                        for i = 1, sellcreatejoker do
                            local card = create_card('Joker', G.jokers, nil, nil, nil, nil, nil, 'happy')
                            card:add_to_deck()
                            G.jokers:emplace(card)
                            card:start_materialize()
                            G.GAME.joker_buffer = 0
                        end
                        return true
                    end}))   
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
                return {calculated = true}
        end
	if context.end_of_round and not context.individual and not context.repetition and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit and not context.retrigger_joker then
    			local roundcreatejoker = math.min(1, G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
   			G.GAME.joker_buffer = G.GAME.joker_buffer + roundcreatejoker 
    			G.E_MANAGER:add_event(Event({ 
        			func = function()
            			if roundcreatejoker > 0 then
                			local card = create_card('Joker', G.jokers, nil, nil, nil, nil, nil, 'happy')
                			card:add_to_deck()
                			G.jokers:emplace(card)
                			card:start_materialize()
               				G.GAME.joker_buffer = 0
            			end
            			return true
        		end}))
    			card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
                return {calculated = true}
	end
    end
}
local meteor = {
    object_type = "Joker",
    name = "cry-meteor",
    key = "meteor",
    pos = {x = 0, y = 2},
    config = {extra = {chips = 75}},
    loc_txt = {
        name = 'Meteor Shower',
        text = {
            "{C:dark_edition}Foil{} cards each",
            "give {C:chips}+#1#{} Chips"
        }
    },
    loc_vars = function(self, info_queue, center)
	info_queue[#info_queue+1] = G.P_CENTERS.e_foil
        return {vars = {center.ability.extra.chips}}
    end,
    rarity = 2,
    cost = 5,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.other_joker and context.other_joker.edition and context.other_joker.edition.foil == true then
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
        end
	if context.individual and context.cardarea == G.play then
			if context.other_card.edition and context.other_card.edition.foil == true then
				return {
                    			chips = card.ability.extra.chips,
                    			colour = G.C.CHIPS,
                    			card = card
                			}
			end
	end
	if context.individual and context.cardarea == G.hand and context.other_card.edition and context.other_card.edition.foil == true and not context.end_of_round then
            if context.other_card.debuff then
                return {
                    message = localize('k_debuffed'),
                    colour = G.C.RED,
                    card = card
                }
            else
                return {
                    	chips = card.ability.extra.chips, --this doesn't exist :pensive: if only...
                	}
            end
        end
    end,
    atlas = "atlastwo",
}
if JokerDisplay then
    meteor.joker_display_definition = {
        text = {
            { text = "+" },
            { ref_table = "card.joker_display_values", ref_value = "chips" }
        },
        text_config = { colour = G.C.CHIPS },
        reminder_text = {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.DARK_EDITION },
            { text = ")" },
        },
        calc_function = function(card)
            local chips = 0
            local hand = next(G.play.cards) and G.play.cards or G.hand.highlighted
            local text, _, scoring_hand = JokerDisplay.evaluate_hand(hand)
            if text ~= 'Unknown' then
                for _, scoring_card in pairs(scoring_hand) do
                    if scoring_card.edition and scoring_card.edition.foil == true then
                        chips = chips +
                            card.ability.extra.chips *
                            JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                    end
                end
            end
            card.joker_display_values.chips = chips
            card.joker_display_values.localized_text = localize { type = 'name_text', set = 'Edition', key = "e_foil" }
        end
    }
end
local exoplanet = {
	object_type = "Joker",
	name = "cry-exoplanet",
	key = "exoplanet",
	pos = {x = 1, y = 2},
        config = {extra = {mult = 15}},
	loc_txt = {
        name = 'Exoplanet',
        text = {
            "{C:dark_edition}Holographic{} cards",
            "each give {C:mult}+#1#{} Mult"
		}
    	},
	loc_vars = function(self, info_queue, center)
		info_queue[#info_queue+1] = G.P_CENTERS.e_holo
		return {vars = {center.ability.extra.mult}}
    	end,
	rarity = 2,
	cost = 5,
	blueprint_compat = true,
	calculate = function(self, card, context)
        if context.other_joker and context.other_joker.edition and context.other_joker.edition.holo == true then
            if not Talisman.config_file.disable_anims then 
                G.E_MANAGER:add_event(Event({
                    func = function()
                        context.other_joker:juice_up(0.5, 0.5)
                        return true
                    end
                })) 
            end
            return {
                message = localize{type='variable',key='a_mult',vars={card.ability.extra.mult}},
		mult_mod = card.ability.extra.mult, 
            }
        end
	if context.individual and context.cardarea == G.play then
			if context.other_card.edition and context.other_card.edition.holo == true then
            			return {
                    			mult = card.ability.extra.mult,
                    			colour = G.C.MULT,
                    			card = card
                			}
			end
	end
	if context.individual and context.cardarea == G.hand and context.other_card.edition and context.other_card.edition.holo == true and not context.end_of_round then
            if context.other_card.debuff then
                return {
                    message = localize('k_debuffed'),
                    colour = G.C.RED,
                    card = card
                }
            else
                return {
                    	h_mult = card.ability.extra.mult,
                	}
            end
        end
	end,
	atlas = "atlastwo",
}
if JokerDisplay then
    exoplanet.joker_display_definition = {
        text = {
            { text = "+" },
            { ref_table = "card.joker_display_values", ref_value = "mult" }
        },
        text_config = { colour = G.C.MULT },
        reminder_text = {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.DARK_EDITION },
            { text = ")" },
        },
        calc_function = function(card)
            local mult = 0
            local hand = next(G.play.cards) and G.play.cards or G.hand.highlighted
            local text, _, scoring_hand = JokerDisplay.evaluate_hand(hand)
            if text ~= 'Unknown' then
                for _, scoring_card in pairs(scoring_hand) do
                    if scoring_card.edition and scoring_card.edition.holo == true then
                        mult = mult +
                            card.ability.extra.mult *
                            JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                    end
                end
            end
            card.joker_display_values.mult = mult
            card.joker_display_values.localized_text = localize { type = 'name_text', set = 'Edition', key = "e_holo" }
        end
    }
end
local stardust = {
	object_type = "Joker",
	name = "cry-stardust",
	key = "stardust",
	pos = {x = 2, y = 2},
        config = {extra = {xmult = 2}},
	loc_txt = {
        name = 'Stardust',
        text = {
            "{C:dark_edition}Polychrome{} cards",
            "each give {X:mult,C:white}X#1#{} Mult"
		}
    	},
	loc_vars = function(self, info_queue, center)
		info_queue[#info_queue+1] = G.P_CENTERS.e_polychrome
		return {vars = {center.ability.extra.xmult}}
    	end,
	rarity = 2,
	cost = 6,
	blueprint_compat = true,
	calculate = function(self, card, context)
        if context.other_joker and context.other_joker.edition and context.other_joker.edition.polychrome == true then
            if not Talisman.config_file.disable_anims then 
                G.E_MANAGER:add_event(Event({
                    func = function()
                        context.other_joker:juice_up(0.5, 0.5)
                        return true
                    end
                })) 
            end
            return {
                message = localize{type='variable',key='a_xmult',vars={card.ability.extra.xmult}},
                Xmult_mod = card.ability.extra.xmult
            }
        end
	if context.individual and context.cardarea == G.play then
			if context.other_card.edition and context.other_card.edition.polychrome == true then
            			return {
                    			x_mult = card.ability.extra.xmult,
                    			colour = G.C.MULT,
                    			card = card
                			}
			end
	end
	if context.individual and context.cardarea == G.hand and context.other_card.edition and context.other_card.edition.polychrome == true and not context.end_of_round then
            if context.other_card.debuff then
                return {
                    message = localize('k_debuffed'),
                    colour = G.C.RED,
                    card = card
                }
            else
                return {
                    	x_mult = card.ability.extra.xmult,
                	}
            end
        end
	end,
	atlas = "atlastwo",
}
if JokerDisplay then
    stardust.joker_display_definition = {
        text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.joker_display_values", ref_value = "x_mult" }
                }
            }
        },
        reminder_text = {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.DARK_EDITION },
            { text = ")" },
        },
        calc_function = function(card)
            local count = 0
            local hand = next(G.play.cards) and G.play.cards or G.hand.highlighted
            local text, _, scoring_hand = JokerDisplay.evaluate_hand(hand)
            if text ~= 'Unknown' then
                for _, scoring_card in pairs(scoring_hand) do
                    if scoring_card.edition and scoring_card.edition.polychrome == true then
                        count = count + JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                    end
                end
            end
            card.joker_display_values.x_mult = tonumber(string.format("%.2f", (card.ability.extra.xmult ^ count)))
            card.joker_display_values.localized_text = localize { type = 'name_text', set = 'Edition', key = "e_polychrome" }
        end
    }
end

local rnj_loc_txts = {
    stats = {
        plus_mult = {"{C:red}+#2#{} Mult"},
        plus_chips = {"{C:blue}+#2#{} Chips"},
        x_mult = {"{X:red,C:white} X#2#{} Mult"},
        x_chips = {"{X:blue,C:white} X#2#{} Chips"},
        h_size = {"{C:attention}+#2#{} Hand Size"},
        money = {"{C:money}+$#2#{} at payout"}
    },
    stats_inactive = {
        plus_mult = {"{C:inactive}(Currently {C:red}+#1#{C:inactive} Mult)"},
        plus_chips = {"{C:inactive}(Currently {C:blue}+#1#{C:inactive} Chips)"},
        x_mult = {"{C:inactive}(Currently {X:red,C:white} X#1# {C:inactive} Mult)"},
        x_chips = {"{C:inactive}(Currently {X:blue,C:white} X#1# {C:inactive} Chips)"},
        h_size = {"{C:inactive}(Currently {C:attention}+#1#{C:inactive} Hand Size)"},
        money = {"{C:inactive}(Currently {C:money}+$#1#{C:inactive})"},
    },
    actions = {
        make_joker = {"Create {C:attention}#2# Joker{}"},
        make_tarot = {"Create {C:attention}#2#{C:tarot} Tarot{} card"},
        make_planet = {"Create {C:attention}#2#{C:planet} Planet{} card"},
        make_spectral = {"Create {C:attention}#2#{C:spectral} Spectral{} card"},
        add_dollars = {"Earn {C:money}$#2#{}"}
    },
    contexts = {
        open_booster = {"when a {C:attention}Booster{} is opened"},
        buying_card = {"when a card is bought"},
        selling_self = {"when this card is sold"},
        selling_card = {"when a card is sold"},
        reroll_shop = {"on reroll"},
        ending_shop = {"at the end of the {C:attention}shop{}"},
        skip_blind = {"when a {C:attention}blind{} is skipped"},
        skipping_booster = {"when any {C:attention}Booster Pack{} is skipped"},
        playing_card_added = {"every time a {C:attention}playing card{} is added to your deck"},
        first_hand_drawn = {"when round begins"},
        setting_blind = {"when {C:attention}Blind{} is selected"},
        remove_playing_cards = {"when a card is destroyed"},
        using_consumeable = {"when a {C:attention}consumable{} card is used"},
        debuffed_hand = {"if played {C:attention}hand{} is not allowed"},
        pre_discard = {"before each discard"},
        discard = {"for each discarded card"},
        end_of_round = {"at end of {C:attention}round{}"},
        individual_play = {"for each card scored"},
        individual_hand_score = {"for each card held in hand during scoring"},
        individual_hand_end = {"for each card held in hand at end of {C:attention}round{}"},
        repetition_play = {"Retrigger played cards"},
        repetition_hand = {"Retrigger held in hand cards"},
        other_joker = {"per {C:attention}Joker{}"},
        before = {"before each {C:attention}hand{}"},
        after = {"after each {C:attention}hand{}"},
        joker_main = {},
    },
    conds = {
        buy_common = {"if it is a {C:blue}Common{} {C:attention}Joker{}"},
        buy_uncommon = {"if it is a {C:green}Uncommon{} {C:attention}Joker{}"},
        tarot = {"if card is a {C:tarot}Tarot{} card"},
        planet = {"if card is a {C:planet}Planet{} card"},
        spectral = {"if card is a {C:spectral}Spectral{} card"},
        joker = {"if card is a {C:attention}Joker{}"},
        heart = {"if card is a {C:hearts}Heart{}"},
        diamond = {"if card is a {C:diamonds}Diamond{}"},
        spade = {"if card is a {C:spades}Spade{}"},
        club = {"if card is a {C:clubs}Club{}"},
        face = {"if card is a {C:attention}face{} card"},
        boss = {"if {C:attention}blind{} is a {C:attention}Boss {C:attention}Blind{}"},
        non_boss = {"if {C:attention}blind{} is a {C:attention}Non-Boss {C:attention}Blind{}"},
        small = {"if {C:attention}blind{} is a {C:attention}Small {C:attention}Blind{}"},
        big = {"if {C:attention}blind{} is a {C:attention}Big {C:attention}Blind{}"},
        first = {"if it's the {C:attention}first {C:attention}hand{}"},
        last = {"if it's the {C:attention}last {C:attention}hand{}"},
        common = {"if it is a {C:blue}Common{} {C:attention}Joker{}"},
        uncommon = {"if it is an {C:green}Uncommon{} {C:attention}Joker{}"},
        rare = {"if it is a {C:red}Rare{} {C:attention}Joker{}"},
        poker_hand = {"if hand is a {C:attention}#3#{}"},
        or_more = {"if hand contains {C:attention}#3#{} or more cards"},
        or_less = {"if hand contains {C:attention}#3#{} or less cards"},
        hands_left = {"if #3# {C:blue}hands{} remaining at end of round"},
        discards_left = {"if #3# {C:red}discards{} remaining at end of round"},
        first_discard = {"if it's the {C:attention}first {C:attention}discard{}"},
        last_discard = {"if it's the {C:attention}last {C:attention}discard{}"},
        odds = {"with a {C:green}#4# {C:green}in {C:green}#3#{} chance"}
    }
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
        "joker_main"
    }
    local stats = {
        plus_mult = 2 + pseudorandom('rnj_mult1') * 28,
        plus_chips = 4 + pseudorandom('rnj_chips1') * 196,
        x_mult = 1 + pseudorandom('rnj_mult2') * 3,
        x_chips = 1 + pseudorandom('rnj_chips2') * 3,
        h_size = 1 + math.floor(pseudorandom('rnj_h_size') * 3),
        money = 1 + math.floor(pseudorandom('rnj_money') * 5)
    }
    local actions = {
        make_joker = 1,
        make_tarot = 1 + math.min(2, math.floor(pseudorandom('rnj_tarot') * 2)),
        make_planet = 1 + math.min(2, math.floor(pseudorandom('rnj_planet') * 2)),
        make_spectral = 1,
        add_dollars = 1 + math.min(4, math.floor(pseudorandom('rnj_dollars') * 5))
    }
    local context = pseudorandom_element(contexts, pseudoseed('rnj_context'))
    values.context = context
    if context == "other_joker" or context == "joker_main" then
        stats.h_size = nil
        stats.money = nil
    end
    local stat_val, stat = pseudorandom_element(stats, pseudoseed('rnj_stat'))
    local act_val, act = pseudorandom_element(actions, pseudoseed('rnj_stat'))
    local scale = (pseudorandom('rnj_scale') > 0.5)
    local is_stat = (pseudorandom('rnj_stat') > 0.5)
    if context == "other_joker" or context == "joker_main" then
        is_stat = true
        scale = false
    end
    if ((stat == "h_size") or (stat == "money")) and (context == "individual_play" or context == "individual_hand_score" or context == "individual_hand_end") and is_stat then
        scale = true
    end
    if context == "selling_self" then
        is_stat = false
        scale = false
    end
    if is_stat then
        values.value = stat_val or 0
        values.stat = stat
        if scale or ((context ~= "joker_main") and (context ~= "other_joker") and (context ~= "individual_play") and (context ~= "individual_hand_score")) then
            values.value = ((stat == "x_mult") or (stat == "x_chips")) and 1 or 0
            scale = true
            if stat == "plus_mult" then
                values.scale_value = pseudorandom('rnj_scaling') * 5
            elseif stat == "plus_chips" then
                values.scale_value = pseudorandom('rnj_scaling') * 25
            elseif stat == "h_size" then
                values.scale_value = 1
            elseif stat == "money" then
                values.scale_value = pseudorandom('rnj_scaling') * 4
            else
                values.scale_value = pseudorandom('rnj_scaling')
            end
        end
    else
        scale = false
        values.value = act_val
        values.act = act
    end
    if (pseudorandom('rnj_stat') < 0.8) then
        local conds = {}
        if context == "buying_card" then
            conds = {
                "buy_common",
                "buy_uncommon",
                "tarot",
                "planet",
                "spectral",
                "odds"
            }
        elseif context == "selling_card" then
            conds = {
                "tarot",
                "planet",
                "spectral",
                "joker",
                "odds"
            }
        elseif context == "playing_card_added" then
            conds = {
                "heart",
                "spade",
                "club",
                "diamond",
                "face",
                "odds"
            }
        elseif context == "setting_blind" then
            conds = {
                "boss",
                "non_boss",
                "small",
                "big",
                "odds"
            }
        elseif context == "remove_playing_cards" then
            conds = {
                "heart",
                "spade",
                "club",
                "diamond",
                "face",
                "odds"
            }
        elseif context == "using_consumeable" then
            conds = {
                "tarot",
                "planet",
                "spectral",
                "odds"
            }
        elseif context == "pre_discard" then
            conds = {
                "first_discard",
                "last_discard",
                "odds"
            }
        elseif context == "discard" then
            conds = {
                "heart",
                "spade",
                "club",
                "diamond",
                "face",
                "odds"
            }
        elseif context == "individual_play" then
            conds = {
                "heart",
                "spade",
                "club",
                "diamond",
                "face",
                "odds"
            }
        elseif context == "individual_hand_score" then
            conds = {
                "heart",
                "spade",
                "club",
                "diamond",
                "face",
                "odds"
            }
        elseif context == "individual_hand_end" then
            conds = {
                "heart",
                "spade",
                "club",
                "diamond",
                "face",
                "odds"
            }
        elseif context == "repetition_play" then
            conds = {
                "heart",
                "spade",
                "club",
                "diamond",
                "face",
                "odds"
            }
        elseif context == "repetition_hand" then
            conds = {
                "heart",
                "spade",
                "club",
                "diamond",
                "face",
                "odds"
            }
        elseif context == "other_joker" then
            conds = {
                "uncommon",
                "rare",
                "odds"
            }
        elseif context == "before" then
            conds = {
                "first",
                "last",
                "poker_hand",
                "odds"
            }
        elseif context == "after" then
            conds = {
                "first",
                "last",
                "poker_hand",
                "odds"
            }
        elseif context == "joker_main" then
            conds = {
                "first",
                "last",
                "poker_hand",
                "or_more",
                "or_less",
                "odds"
            }
        elseif context == "cry_payout" then
            conds = {
                "hands_left",
                "discards_left"
            }
        end
        if #conds > 0 then
            local cond = pseudorandom_element(conds, pseudoseed('rnj_stat'))
            values.cond = cond
            if cond == "poker_hand" then
                local none, key = pseudorandom_element(G.GAME.hands, pseudoseed('rnj_poker-hand'))
                values.cond_value = localize(key, 'poker_hands')
                values.poker_hand = key
            end
            if (cond == "or_more") or (cond == "or_less") then
                values.cond_value = math.min(5, math.floor(pseudorandom('rnj_cards') * 6))
            end
            if (cond == "hands_left") or (cond == "discards_left") then
                values.cond_value = math.min(3, math.floor(pseudorandom('rnj_cards') * 4))
            end
            if (cond == "odds") then
                values.cond_value = 2 + math.min(3, math.floor(pseudorandom('rnj_cards') * 4))
            end
        end
    end
    local loc_txt = ""
    local extra_lines = {""}
    if (context ~= "repetition_play") and (context ~= "repetition_hand") then
        if values.stat then
            for i, j in ipairs(rnj_loc_txts.stats[values.stat]) do
                if scale and (i == 1)then
                    loc_txt = loc_txt .. "Gains "
                end
                loc_txt = loc_txt .. j
            end
        end
        if values.act then
            for i, j in ipairs(rnj_loc_txts.actions[values.act]) do
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
        for i, j in ipairs(rnj_loc_txts.contexts[values.context]) do
            loc_txt = loc_txt .. j
        end
    end
    if values.context ~= "joker_main" then
        loc_txt = loc_txt .. " "
    end
    if values.cond then
        for i, j in ipairs(rnj_loc_txts.conds[values.cond]) do
            loc_txt = loc_txt .. j
        end
    end
    if scale then
        for i, j in ipairs(rnj_loc_txts.stats_inactive[values.stat]) do
            table.insert(extra_lines, j)
        end
    end
    if values.act and (values.act ~= "add_dollars") then
        table.insert(extra_lines, "{C:inactive}(Must have room){}")
    end
    local accum = 0
    local lines = {"Randomize abilities each {C:attention}Ante{}"}
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
    local text_parsed = {}
    for _, line in ipairs(values.loc_txt) do
        text_parsed[#text_parsed+1] = loc_parse_string(line)
    end
    values.text_parsed = text_parsed
    card.ability.abilities = {values}
end
function localalize_with_direct(loc_target, args, misc_cat)
    if loc_target then 
        for _, lines in ipairs(args.type == 'unlocks' and loc_target.unlock_parsed or args.type == 'name' and loc_target.name_parsed or (args.type == 'text' or args.type == 'tutorial' or args.type == 'quips') and loc_target or loc_target.text_parsed) do
          local final_line = {}
          for _, part in ipairs(lines) do
            local assembled_string = ''
            for _, subpart in ipairs(part.strings) do
              assembled_string = assembled_string..(type(subpart) == 'string' and subpart or format_ui_value(args.vars[tonumber(subpart[1])]) or 'ERROR')
            end
            local desc_scale = G.LANG.font.DESCSCALE
            if G.F_MOBILE_UI then desc_scale = desc_scale*1.5 end
            if args.type == 'name' then
              final_line[#final_line+1] = {n=G.UIT.O, config={
                object = DynaText({string = {assembled_string},
                  colours = {(part.control.V and args.vars.colours[tonumber(part.control.V)]) or (part.control.C and loc_colour(part.control.C)) or G.C.UI.TEXT_LIGHT},
                  bump = true,
                  silent = true,
                  pop_in = 0,
                  pop_in_rate = 4,
                  maxw = 5,
                  shadow = true,
                  y_offset = -0.6,
                  spacing = math.max(0, 0.32*(17 - #assembled_string)),
                  scale =  (0.55 - 0.004*#assembled_string)*(part.control.s and tonumber(part.control.s) or 1)
                })
              }}
            elseif part.control.E then
              local _float, _silent, _pop_in, _bump, _spacing = nil, true, nil, nil, nil
              if part.control.E == '1' then
                _float = true; _silent = true; _pop_in = 0
              elseif part.control.E == '2' then
                _bump = true; _spacing = 1
              end
              final_line[#final_line+1] = {n=G.UIT.O, config={
                object = DynaText({string = {assembled_string}, colours = {part.control.V and args.vars.colours[tonumber(part.control.V)] or loc_colour(part.control.C or nil)},
                float = _float,
                silent = _silent,
                pop_in = _pop_in,
                bump = _bump,
                spacing = _spacing,
                scale = 0.32*(part.control.s and tonumber(part.control.s) or 1)*desc_scale})
              }}
            elseif part.control.X then
              final_line[#final_line+1] = {n=G.UIT.C, config={align = "m", colour = loc_colour(part.control.X), r = 0.05, padding = 0.03, res = 0.15}, nodes={
                  {n=G.UIT.T, config={
                    text = assembled_string,
                    colour = loc_colour(part.control.C or nil),
                    scale = 0.32*(part.control.s and tonumber(part.control.s) or 1)*desc_scale}},
              }}
            else
              final_line[#final_line+1] = {n=G.UIT.T, config={
              detailed_tooltip = part.control.T and (G.P_CENTERS[part.control.T] or G.P_TAGS[part.control.T]) or nil,
              text = assembled_string,
              shadow = args.shadow,
              colour = part.control.V and args.vars.colours[tonumber(part.control.V)] or loc_colour(part.control.C or nil, args.default_col),
              scale = 0.32*(part.control.s and tonumber(part.control.s) or 1)*desc_scale},}
            end
          end
            if args.type == 'name' or args.type == 'text' then return final_line end
            args.nodes[#args.nodes+1] = final_line
        end
    end
end
local rnjoker = {
	object_type = "Joker",
	name = "cry-rnjoker",
	key = "rnjoker",
	pos = {x = 5, y = 4},
    config = {},
	loc_txt = {
        name = 'RNJoker',
        text = {
            "Randomize abilities each {C:attention}Ante{}"
		}
    },
	loc_vars = function(self, info_queue, card)
        return {vars = {
            (card.ability.extra and card.ability.extra.value_mod and card.ability.extra.value) or 0,
            (card.ability.extra and card.ability.extra.value and card.ability.extra.value_mod) or (card.ability.extra and card.ability.extra.value) or 0,
            card.ability.extra and card.ability.extra.cond_value or 0,
            G.GAME and G.GAME.probabilities.normal or 1
        }}
    end,
	rarity = 3,
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
                    if (j_context == "individual_play") and context.individual and not context.repetition and (context.cardarea == G.play) then
                        valid_context = true
                        indiv = true
                    end
                    if (j_context == "individual_hand_score") and context.individual and not context.repetition and (context.cardarea == G.hand) and not context.end_of_round then
                        valid_context = true
                        indiv = true
                    end
                    if (j_context == "individual_hand_end") and context.individual and not context.repetition and (context.cardarea == G.hand and context.end_of_round) then
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
                                if context.card and context.card.ability and (context.card.ability.set == "Joker") and (context.card.config.center.rarity == 1) then
                                    cond_passed = true
                                end
                            elseif j.cond == "buy_uncommon" then
                                if context.card and context.card.ability and (context.card.ability.set == "Joker") and (context.card.config.center.rarity == 2) then
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
                            elseif j.cond == "heart" then
                                times_passed = 0
                                local cards = context.cards
                                if cards == nil then
                                    cards = context.removed
                                end
                                if cards == nil then
                                    cards = {context.other_card}
                                end
                                for i2, j2 in ipairs(cards) do
                                    if j2:is_suit("Hearts") then
                                        cond_passed = true
                                        times_passed = times_passed + 1
                                    end
                                end
                            elseif j.cond == "diamond" then
                                times_passed = 0
                                local cards = context.cards
                                if cards == nil then
                                    cards = context.removed
                                end
                                if cards == nil then
                                    cards = {context.other_card}
                                end
                                for i2, j2 in ipairs(cards) do
                                    if j2:is_suit("Diamonds") then
                                        cond_passed = true
                                        times_passed = times_passed + 1
                                    end
                                end
                            elseif j.cond == "spade" then
                                times_passed = 0
                                local cards = context.cards
                                if cards == nil then
                                    cards = context.removed
                                end
                                if cards == nil then
                                    cards = {context.other_card}
                                end
                                for i2, j2 in ipairs(cards) do
                                    if j2:is_suit("Spades") then
                                        cond_passed = true
                                        times_passed = times_passed + 1
                                    end
                                end
                            elseif j.cond == "club" then
                                times_passed = 0
                                local cards = context.cards
                                if cards == nil then
                                    cards = context.removed
                                end
                                if cards == nil then
                                    cards = {context.other_card}
                                end
                                for i2, j2 in ipairs(cards) do
                                    if j2:is_suit("Clubs") then
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
                                    cards = {context.other_card}
                                end
                                for i2, j2 in ipairs(cards) do
                                    if j2:is_face() then
                                        cond_passed = true
                                        times_passed = times_passed + 1
                                    end
                                end
                            elseif j.cond == "boss" then
                                if context.blind.boss and not (context.blind.config and  context.blind.config.bonus) then
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
                                if (next(context.poker_hands[j.poker_hand])) then
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
                                if pseudorandom("rnj") < ((G.GAME and G.GAME.probabilities.normal or 1)/card.ability.extra.cond_value) then
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
                                table.message = localize{type='variable',key=stats[j.stat],vars={card.ability.extra.value}}
                                table[mods[j.stat]] = card.ability.extra.value
                                table.card = card
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        context.other_joker:juice_up(0.5, 0.5)
                                        return true
                                    end
                                })) 
                                return table
                            elseif (j.context == "repetition_play") or (j.context == "repetition_hand") then
                                return {
                                    message = localize('k_again_ex'),
                                    repetitions = 1,
                                    card = card
                                }
                            elseif j.scale_value then
                                card.ability.extra.value = card.ability.extra.value + (card.ability.extra.value_mod * times_passed)
                                card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_upgrade_ex')})
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
                                if j.context == "selling_self" and (card.ability.consumeable) then
                                    c_mod = 1
                                end
                                if j.context == "selling_card" and (card.ability.consumeable) then
                                    c_mod = 1
                                end
                                if j.act == "make_joker" then
                                    local amount = card.ability.extra.value * times_passed
                                    if (G.jokers.config.card_limit + j_mod - #G.jokers.cards - G.GAME.joker_buffer) < amount then
                                        amount = G.jokers.config.card_limit + j_mod - #G.jokers.cards - G.GAME.joker_buffer
                                    end
                                    if amount > 0 then
                                        G.GAME.joker_buffer = G.GAME.joker_buffer + amount
                                        G.E_MANAGER:add_event(Event({
                                            trigger = 'before',
                                            delay = 0.0,
                                            func = (function()
                                                for i = 1, amount do
                                                    if G.jokers.config.card_limit + j_mod > #G.jokers.cards then
                                                        local card = create_card('Joker',G.jokers, nil, nil, nil, nil, nil, 'rnj')
                                                        card:add_to_deck()
                                                        G.jokers:emplace(card)
                                                    else
                                                        break
                                                    end
                                                end
                                                G.GAME.joker_buffer = 0
                                            return true
                                        end)}))
                                    end
                                elseif j.act == "make_tarot" then
                                    local amount = card.ability.extra.value * times_passed
                                    if (G.consumeables.config.card_limit + c_mod - #G.consumeables.cards - G.GAME.consumeable_buffer) < amount then
                                        amount = G.consumeables.config.card_limit + c_mod - #G.consumeables.cards - G.GAME.consumeable_buffer
                                    end
                                    if amount > 0 then
                                        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + amount
                                        G.E_MANAGER:add_event(Event({
                                            trigger = 'before',
                                            delay = 0.0,
                                            func = (function()
                                                for i = 1, amount do
                                                    if G.consumeables.config.card_limit + c_mod > #G.consumeables.cards then
                                                        local card = create_card('Tarot',G.consumeables, nil, nil, nil, nil, nil, 'rnj')
                                                        card:add_to_deck()
                                                        G.consumeables:emplace(card)
                                                    else
                                                        break
                                                    end
                                                end
                                                G.GAME.consumeable_buffer = 0
                                            return true
                                        end)}))
                                    end
                                elseif j.act == "make_planet" then
                                    local amount = card.ability.extra.value * times_passed
                                    if (G.consumeables.config.card_limit + c_mod - #G.consumeables.cards - G.GAME.consumeable_buffer) < amount then
                                        amount = G.consumeables.config.card_limit + c_mod - #G.consumeables.cards - G.GAME.consumeable_buffer
                                    end
                                    if amount > 0 then
                                        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + amount
                                        G.E_MANAGER:add_event(Event({
                                            trigger = 'before',
                                            delay = 0.0,
                                            func = (function()
                                                for i = 1, amount do
                                                    if G.consumeables.config.card_limit + c_mod > #G.consumeables.cards then
                                                        local card = create_card('Planet',G.consumeables, nil, nil, nil, nil, nil, 'rnj')
                                                        card:add_to_deck()
                                                        G.consumeables:emplace(card)
                                                    else
                                                        break
                                                    end
                                                end
                                                G.GAME.consumeable_buffer = 0
                                            return true
                                        end)}))
                                    end
                                elseif j.act == "make_spectral" then
                                    local amount = card.ability.extra.value * times_passed
                                    if (G.consumeables.config.card_limit + c_mod - #G.consumeables.cards - G.GAME.consumeable_buffer) < amount then
                                        amount = G.consumeables.config.card_limit + c_mod - #G.consumeables.cards - G.GAME.consumeable_buffer
                                    end
                                    if amount > 0 then
                                        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + amount
                                        G.E_MANAGER:add_event(Event({
                                            trigger = 'before',
                                            delay = 0.0,
                                            func = (function()
                                                for i = 1, amount do
                                                    if G.consumeables.config.card_limit + c_mod > #G.consumeables.cards then
                                                        local card = create_card('Spectral',G.consumeables, nil, nil, nil, nil, nil, 'rnj')
                                                        card:add_to_deck()
                                                        G.consumeables:emplace(card)
                                                    else
                                                        break
                                                    end
                                                end
                                                G.GAME.consumeable_buffer = 0
                                            return true
                                        end)}))
                                    end
                                elseif j.act == "add_dollars" then
                                    ease_dollars(card.ability.extra.value)
                                    return {
                                        message = localize('$')..card.ability.extra.value,
                                        colour = G.C.MONEY,
                                        card = card
                                    }
                                end
                            end
                        end
                    end
                    if j.stat and context.individual and indiv then
                        local cond_passed = false
                        if j.cond == "heart" then
                            if context.other_card:is_suit("Hearts") then
                                cond_passed = true
                            end
                        elseif j.cond == "diamond" then
                            if context.other_card:is_suit("Diamonds") then
                                cond_passed = true
                            end
                        elseif j.cond == "spade" then
                            if context.other_card:is_suit("Spades") then
                                cond_passed = true
                            end
                        elseif j.cond == "club" then
                            if context.other_card:is_suit("Clubs") then
                                cond_passed = true
                            end
                        elseif j.cond == "face" then
                            if context.other_card:is_face() then
                                cond_passed = true
                            end
                        elseif j.cond == "odds" then
                            if pseudorandom("rnj") < ((G.GAME and G.GAME.probabilities.normal or 1)/card.ability.extra.cond_value) then
                                cond_passed = true
                            end
                        end
                        if not j.cond then
                            cond_passed = true
                        end
                        if cond_passed then
                            if (context.cardarea == G.hand) and context.other_card.debuff then
                                return {
                                    message = localize('k_debuffed'),
                                    colour = G.C.RED,
                                    card = card,
                                }
                            end
                            if j.scale_value then
                                card.ability.extra.value = card.ability.extra.value + card.ability.extra.value_mod
                                card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_upgrade_ex')})
                                if j.stat == "h_size" then
                                    G.hand:change_size(card.ability.extra.value_mod)
                                end
                            else
                                local stats = {
                                    plus_mult = "mult",
                                    plus_chips = "chips",
                                }
                                if (context.cardarea == G.hand) then
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
                                local table =  {
                                    card = card
                                }
                                table.colour = colors[j.stat]
                                table[stat] = card.ability.extra.value
                                return table
                            end
                        end
                    end
                    if context.joker_main and j.stat and (j.stat ~= "h_size") and (j.stat ~= "money") then
                        local cond_passed = false
                        if (j_context ~= "joker_main") then
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
                            if (next(context.poker_hands[j.poker_hand])) then
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
                            if pseudorandom("rnj") < ((G.GAME and G.GAME.probabilities.normal or 1)/card.ability.extra.cond_value) then
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
                            table.message = localize{type='variable',key=stats[j.stat],vars={card.ability.extra.value}}
                            table[mods[j.stat]] = card.ability.extra.value
                            return table
                        end
                    end
                end
            end
        end
        if not context.individual and not context.repetition and not card.debuff and context.end_of_round and not context.blueprint and G.GAME.blind.boss and not (G.GAME.blind.config and  G.GAME.blind.config.bonus) then
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
                message = localize('k_reset'),
                colour = G.C.RED
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
        local len = (card.ability and card.ability.abilities and card.ability.abilities[1].loc_txt and #card.ability.abilities[1].loc_txt) or 0
        local target = {
            type = 'descriptions',
            key = self.key,
            set = self.set,
            nodes = desc_nodes,
            vars =
                specific_vars or {}
        }
        if self.loc_vars and type(self.loc_vars) == 'function' then
            res = self:loc_vars(info_queue, card) or {}
            target.vars = res.vars or target.vars
            target.key = res.key or target.key
        end
        local new_loc = { text = {}}
        if (card.ability and card.ability.abilities and card.ability.abilities[1].loc_txt and #card.ability.abilities[1].loc_txt) then
            for i, j in ipairs(card.ability.abilities[1].loc_txt) do
                table.insert(new_loc.text, j)
            end
            new_loc.text_parsed = card.ability.abilities[1].text_parsed
        end
        if not full_UI_table.name then
            full_UI_table.name = localize { type = 'name', set = self.set, key = target.key or self.key, nodes = full_UI_table.name }
        end
        if specific_vars and specific_vars.debuffed then
            target = { type = 'other', key = 'debuffed_' ..
            (specific_vars.playing_card and 'playing_card' or 'default'), nodes = desc_nodes }
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
    atlas = "atlastwo"
}
local hand_xmult_jd = {
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.joker_display_values", ref_value = "x_mult" }
            }
        }
    },
    reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
        { text = ")" },
    },
    calc_function = function(card)
        local x_mult = 1
        local _, poker_hands, _ = JokerDisplay.evaluate_hand()
        if poker_hands[card.ability.type] and next(poker_hands[card.ability.type]) then
            x_mult = card.ability.x_mult
        end
        card.joker_display_values.x_mult = x_mult
        card.joker_display_values.localized_text = localize(card.ability.type, 'poker_hands')
    end
}
local duos = {
    object_type = "Joker",
	name = "cry-duos",
	key = "duos",
	pos = {x = 0, y = 0},
    config = {Xmult = 2.5, type = 'Two Pair'},
	loc_txt = {
        name = 'The Duos',
        text = {
            "{X:mult,C:white} X#1# {} Mult if played",
            "hand contains",
            "a {C:attention}#2#"
		}
    },
	loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.x_mult, localize(card.ability.type, 'poker_hands')}}
    end,
    atlas = "atlasthree",
	rarity = 3,
	cost = 8,
	blueprint_compat = true,
    calaculate = function(self, card, context)
        if context.cardarea == G.jokers and (to_big(card.ability.x_mult) > to_big(1)) and not context.before and not context.after then
            if (next(context.poker_hands['Two Pair']) or next(context.poker_hands['Full House'])) then
                return {
                    message = localize{type='variable',key='a_xmult',vars={card.ability.x_mult}},
                    colour = G.C.RED,
                    Xmult_mod = card.ability.x_mult
                }
            end
        end
    end
}
local home = {
    object_type = "Joker",
	name = "cry-home",
	key = "home",
	pos = {x = 2, y = 0},
    config = {Xmult = 3.5, type = 'Full House'},
	loc_txt = {
        name = 'The Home',
        text = {
            "{X:mult,C:white} X#1# {} Mult if played",
            "hand contains",
            "a {C:attention}#2#"
		}
    },
	loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.x_mult, localize(card.ability.type, 'poker_hands')}}
    end,
    atlas = "atlasthree",
	rarity = 3,
	cost = 8,
	blueprint_compat = true,
    calaculate = function(self, card, context)
        if context.cardarea == G.jokers and (to_big(card.ability.x_mult) > to_big(1)) and not context.before and not context.after then
            if next(context.poker_hands['Full House']) then
                return {
                    message = localize{type='variable',key='a_xmult',vars={card.ability.x_mult}},
                    colour = G.C.RED,
                    Xmult_mod = card.ability.x_mult
                }
            end
        end
    end
}
local nuts = {
    object_type = "Joker",
	name = "cry-nuts",
	key = "nuts",
	pos = {x = 1, y = 0},
    config = {Xmult = 5, type = 'Straight Flush'},
	loc_txt = {
        name = 'The Nuts',
        text = {
            "{X:mult,C:white} X#1# {} Mult if played",
            "hand contains",
            "a {C:attention}#2#"
		}
    },
	loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.x_mult, localize(card.ability.type, 'poker_hands')}}
    end,
    atlas = "atlasthree",
	rarity = 3,
	cost = 8,
	blueprint_compat = true,
    calaculate = function(self, card, context)
        if context.cardarea == G.jokers and (to_big(card.ability.x_mult) > to_big(1)) and not context.before and not context.after then
            if next(context.poker_hands['Straight Flush']) then
                return {
                    message = localize{type='variable',key='a_xmult',vars={card.ability.x_mult}},
                    colour = G.C.RED,
                    Xmult_mod = card.ability.x_mult
                }
            end
        end
    end
}
local quintet = {
    object_type = "Joker",
	name = "cry-quintet",
	key = "quintet",
	pos = {x = 3, y = 0},
    config = {Xmult = 5, type = 'Five of a Kind'},
	loc_txt = {
        name = 'The Quintet',
        text = {
            "{X:mult,C:white} X#1# {} Mult if played",
            "hand contains",
            "a {C:attention}#2#"
		}
    },
	loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.x_mult, localize(card.ability.type, 'poker_hands')}}
    end,
    atlas = "atlasthree",
	rarity = 3,
	cost = 8,
	blueprint_compat = true,
    calaculate = function(self, card, context)
        if context.cardarea == G.jokers and (to_big(card.ability.x_mult) > to_big(1)) and not context.before and not context.after then
            if next(context.poker_hands['Five of a Kind']) then
                return {
                    message = localize{type='variable',key='a_xmult',vars={card.ability.x_mult}},
                    colour = G.C.RED,
                    Xmult_mod = card.ability.x_mult
                }
            end
        end
    end,
    in_pool = function(self)
        if G.GAME.hands["Five of a Kind"].played > 0 then
            return true
        end
        return false
    end
}
local unity = {
    object_type = "Joker",
	name = "cry-unity",
	key = "unity",
	pos = {x = 4, y = 0},
    config = {Xmult = 7, type = 'Flush House'},
	loc_txt = {
        name = 'The Unity',
        text = {
            "{X:mult,C:white} X#1# {} Mult if played",
            "hand contains",
            "a {C:attention}#2#"
		}
    },
	loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.x_mult, localize(card.ability.type, 'poker_hands')}}
    end,
    atlas = "atlasthree",
	rarity = 3,
	cost = 8,
	blueprint_compat = true,
    calaculate = function(self, card, context)
        if context.cardarea == G.jokers and (to_big(card.ability.x_mult) > to_big(1)) and not context.before and not context.after then
            if next(context.poker_hands['Flush House']) then
                return {
                    message = localize{type='variable',key='a_xmult',vars={card.ability.x_mult}},
                    colour = G.C.RED,
                    Xmult_mod = card.ability.x_mult
                }
            end
        end
    end,
    in_pool = function(self)
        if G.GAME.hands["Flush House"].played > 0 then
            return true
        end
        return false
    end
}
local swarm = {
    object_type = "Joker",
	name = "cry-swarm",
	key = "swarm",
	pos = {x = 5, y = 0},
    config = {Xmult = 9, type = 'Flush Five'},
	loc_txt = {
        name = 'The Swarm',
        text = {
            "{X:mult,C:white} X#1# {} Mult if played",
            "hand contains",
            "a {C:attention}#2#"
		}
    },
	loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.x_mult, localize(card.ability.type, 'poker_hands')}}
    end,
    atlas = "atlasthree",
	rarity = 3,
	cost = 8,
	blueprint_compat = true,
    calaculate = function(self, card, context)
        if context.cardarea == G.jokers and (to_big(card.ability.x_mult) > to_big(1)) and not context.before and not context.after then
            if next(context.poker_hands['Flush Five']) then
                return {
                    message = localize{type='variable',key='a_xmult',vars={card.ability.x_mult}},
                    colour = G.C.RED,
                    Xmult_mod = card.ability.x_mult
                }
            end
        end
    end,
    in_pool = function(self)
        if G.GAME.hands["Flush Five"].played > 0 then
            return true
        end
        return false
    end
}
local filler = {
    object_type = "Joker",
	name = "cry-filler",
	key = "filler",
	pos = {x = 0, y = 1},
    config = {Xmult = 1.000000001, type = 'High Card'},
	loc_txt = {
        name = 'The Filler',
        text = {
            "{X:mult,C:white} X#1# {} Mult if played",
            "hand contains",
            "a {C:attention}#2#"
		}
    },
	loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.x_mult, localize(card.ability.type, 'poker_hands')}}
    end,
    atlas = "atlasthree",
	rarity = 3,
	cost = 1,
	blueprint_compat = true,
    calaculate = function(self, card, context)
        if context.cardarea == G.jokers and not context.before and not context.after then
            return {
                message = localize{type='variable',key='a_xmult',vars={card.ability.x_mult}},
                colour = G.C.RED,
                Xmult_mod = card.ability.x_mult
            }
        end
    end
}
if JokerDisplay then
    duos.joker_display_definition = hand_xmult_jd
    home.joker_display_definition = hand_xmult_jd
    nuts.joker_display_definition = hand_xmult_jd
    quintet.joker_display_definition = hand_xmult_jd
    unity.joker_display_definition = hand_xmult_jd
    swarm.joker_display_definition = hand_xmult_jd
    filler.joker_display_definition = hand_xmult_jd
end
local coin = {
	object_type = "Joker",
	name = "cry-coin",
	key = "coin",
	pos = {x = 0, y = 2},
	config = {extra = {money = 1}},
	loc_txt = {
        name = 'Crypto Coin',
        text = {
			"Earn between",
			"{C:money}$#1#{} and {C:money}$#2#{} for",
			"each Joker {C:attention}sold{}",
		}
    },
	rarity = 1,
	cost = 5,
	blueprint_compat = true,loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.money, center.ability.extra.money*10}}
    end,
	atlas = "atlasthree",
	calculate = function(self, card, context)
		if context.selling_card and context.card.ability.set == 'Joker' then
			local option = pseudorandom(pseudoseed('coin'),card.ability.extra.money,card.ability.extra.money*10)
			ease_dollars(option)
			card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = localize('$')..self.ability.extra.money,colour = G.C.MONEY, delay = 0.45})
            return {calculated = true}, true --yep, I'm preparing in advance for the retrigger API merge
		end
	end
}
local wheelhope = {
	object_type = "Joker",
	name = "cry-wheelhope",
	key = "wheelhope",
	pos = {x = 1, y = 1},
	config = {extra = {extra = 0.5, x_mult = 1}},
	loc_txt = {
        name = 'Wheel of Hope',
        text = {
			"This Joker gains",
			"{X:mult,C:white} X#1# {} Mult when using",
			"{C:attention}The Wheel of Fortune{}",
			"{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)"
		}
    	},
	rarity = 3,
	cost = 7,
	perishable_compat = false,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, center)
		info_queue[#info_queue+1] = G.P_CENTERS.c_wheel_of_fortune
        	return {vars = {center.ability.extra.extra, center.ability.extra.x_mult}}
    	end,
	atlas = "atlasthree",
	calculate = function(self, card, context)
        if context.cardarea == G.jokers and (card.ability.extra.x_mult > 1) and not context.before and not context.after then
            return {
                message = localize{type='variable',key='a_xmult',vars={card.ability.extra.x_mult}},
                Xmult_mod = card.ability.extra.x_mult
            }
        end
		if context.using_consumeable and context.consumeable.ability.name == 'The Wheel of Fortune' and not context.blueprint then
			card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.extra
			card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize{type = 'variable', key = 'a_xmult', vars = {card.ability.extra.x_mult}}})
			return {calculated = true}
		end
	end
}
if JokerDisplay then
    wheelhope.joker_display_definition = {
        text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.ability.extra", ref_value = "x_mult" }
                }
            }
        },
    }
end
local oldblueprint = { --unfinished, needs more work done later
    object_type = "Joker",
    name = "cry-oldblueprint",
    key = "oldblueprint",
    pos = {x = 2, y = 1},
    config = {extra = {odds = 4}},
    loc_txt = {
        name = 'Old Blueprint',
        text = {
            "Copies ability of",
            "{C:attention}Joker{} to the right",
            "{C:green}#1# in #2#{} chance this",
            "card is destroyed",
            "at end of round"
        }
    },
    rarity = 1,
    cost = 5,
    loc_vars = function(self, info_queue, center)
        return {vars = {''..(G.GAME and G.GAME.probabilities.normal or 1), center.ability.extra.odds}}
    end,
    blueprint_compat = true,
    eternal_compat = false,
    atlas = "atlasthree",
    calculate = function(self, card, context)
	if context.end_of_round and not context.individual and not context.repetition and not context.blueprint and not context.retrigger_joker then
		if pseudorandom('oldblueprint') < G.GAME.probabilities.normal/card.ability.extra.odds then 
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
                	return {
                    		message = {"Extinct!"},
                    		colour = G.C.FILTER
                	}
		else
			return {
                    		message = {"Safe!"},
                    		colour = G.C.FILTER
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
        
        if context.blueprint > #G.jokers.cards + 1 then return end
        
        local other_joker_ret = other_joker:calculate_joker(context)
        if other_joker_ret then
            other_joker_ret.card = context.blueprint_card or card
            other_joker_ret.colour = G.C.BLUE
            return other_joker_ret
        end
    end
    end
}
if JokerDisplay then
    oldblueprint.joker_display_definition = {
        reminder_text = {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "blueprint_compat", colour = G.C.RED },
            { text = ")" }
        },
        extra = {
            {
				{ text = "(" },
				{ ref_table = "G.GAME.probabilities", ref_value = "normal" }, --the usual thing doesn't work for some reason
				{ text = " in " },
				{ ref_table = "card.ability.extra",        ref_value = "odds" },
				{ text = ")" },
			}
        },
        extra_config = { colour = G.C.GREEN, scale = 0.3 },
        calc_function = function(card)
            card.ability.name = "Blueprint" --funny workaround
            local copied_joker, copied_debuff = JokerDisplay.calculate_blueprint_copy(card)
            card.ability.name = "cry-oldblueprint"
            card.joker_display_values.blueprint_compat = localize('k_incompatible')
            JokerDisplay.copy_display(card, copied_joker, copied_debuff)
        end
    }
end
local night = {
    object_type = "Joker",
    name = "cry-night",
    key = "night",
    config = {extra = {mult = 3, check = false}},
    pos = {x = 3, y = 1},
    loc_txt = {
        name = 'Night',
        text = {
            "{X:dark_edition,C:white}^#1#{} Mult on final",
            "hand of round",
            "{E:2,C:red}self destructs{} on",
            "final hand of round"
        }
    },
    rarity = 3,
    cost = 6,
    eternal_compat = false,
    atlas = "atlasthree",
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.mult}}
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and not context.before and not context.after and G.GAME.current_round.hands_left == 0 then
            card.ability.extra.check = true
            if card.ability.extra.mult > 1 then
                return {
                    message = "^"..card.ability.extra.mult.." Mult",
                    Emult_mod = card.ability.extra.mult,
                    colour = G.C.DARK_EDITION
                }
            end
        end
        if context.cardarea == G.jokers and context.after and card.ability.extra.check then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound('tarot1')
                    card.T.r = -0.2
                    card:juice_up(0.3, 0.4)
                    card.states.drag.is = true
                    card.children.center.pinch.x = true
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.3,
                        blockable = false,
                        func = function()
                            G.jokers:remove_card(card)
                            card:remove()
                            card = nil
                            return true
                        end
                    }))
                    return true
                end
            }))
            return {
                message = localize('k_extinct_ex'),
                colour = G.C.FILTER
            }
        end
    end
}
if JokerDisplay then
    night.joker_display_definition = {
        text = {  
            {
                border_nodes = {
                    { text = "^" },
                    { ref_table = "card.joker_display_values", ref_value = "e_mult" }
                },
                border_colour = G.C.DARK_EDITION
            }
        },
        reminder_text = {
            { ref_table = "card.joker_display_values", ref_value = "localized_text" },
        },
        calc_function = function(card)
            card.joker_display_values.e_mult = (G.GAME and G.GAME.current_round.hands_left <= 1) and card.ability.extra.mult or 1
	    card.joker_display_values.localized_text = "(" ..
                ((G.GAME and G.GAME.current_round.hands_left <= 1) and localize("k_active_ex") or "Inactive") .. ")"
        end
    }
end
local busdriver = {
    object_type = "Joker",
    name = "cry-busdriver",
    key = "busdriver",
    config = {extra = {mult = 50, odds = 4}},
    pos = {x = 5, y = 1},
    loc_txt = {
        name = 'Bus Driver',
        text = {
            "{C:green}#1# in #3#{} chance",
	    "for {C:mult}+#2#{} Mult",
	    "{C:green}1 in 4{} chance",
	    "for {C:mult}-#2#{} Mult"
        }
    },
    rarity = 3,
    cost = 7,
    atlas = "atlasthree",
    blueprint_compat = true,
    loc_vars = function(self, info_queue, center)
        return {vars = {''..((G.GAME and G.GAME.probabilities.normal or 1) * 3), center.ability.extra.mult, center.ability.extra.odds}}
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and (card.ability.extra.mult > 0) and not context.before and not context.after then
	    if pseudorandom('busdriver') < G.GAME.probabilities.normal/card.ability.extra.odds * 3 then
            	return {
                	message = localize{type='variable',key='a_mult',vars={card.ability.extra.mult}},
                	mult_mod = card.ability.extra.mult, 
                	colour = G.C.MULT
            	}
	    else
		return {
                	message = localize{type='variable',key='a_mult',vars={card.ability.extra.mult * -1}},
                	mult_mod = (card.ability.extra.mult * -1), 
                	colour = G.C.MULT
            	}
	    end
        end
    end
}
if JokerDisplay then
    busdriver.joker_display_definition = {
        text = {
			{ text = "+",                       colour = G.C.MULT },
			{ ref_table = "card.ability.extra", ref_value = "mult", colour = G.C.MULT },
			{ text = " or -",                      colour = G.C.MULT },
			{ ref_table = "card.ability.extra", ref_value = "mult", colour = G.C.MULT },
		},
    }
end
return {name = "Misc. Jokers", 
        init = function()
            --Dropshot Patches
            local gigo = Game.init_game_object;
            function Game:init_game_object()
                local g = gigo(self)
                g.current_round.cry_dropshot_card = {suit = 'Spades'}
                return g
            end
            local rcc = reset_castle_card;
            function reset_castle_card()
                rcc()
                if not G.GAME.current_round.cry_dropshot_card then G.GAME.current_round.cry_dropshot_card = {} end
                G.GAME.current_round.cry_dropshot_card.suit = 'Spades'
                local valid_castle_cards = {}
                for k, v in ipairs(G.playing_cards) do
                    if v.ability.effect ~= 'Stone Card' then
                        valid_castle_cards[#valid_castle_cards+1] = v
                    end
                end
                if valid_castle_cards[1] then 
                    local castle_card = pseudorandom_element(valid_castle_cards, pseudoseed('cry_dro'..G.GAME.round_resets.ante))
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
                if (next(find_joker("cry-Maximized")) and not override_maximized) then
                    if (id >= 2 and id <= 10) then id = 10 end
                    if (id >= 11 and id <= 13 or next(find_joker("Pareidolia"))) then id = 13 end
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
                    self.cost = -25
                end
                if self.ability.name == "cry-Big Cube" then
                    self.cost = 27
                end
            end

            --Jimball Patches
            local upd = Game.update
            cry_jimball_dt = 0
            function Game:update(dt)
                upd(self,dt)
                cry_jimball_dt = cry_jimball_dt + dt
                if G.P_CENTERS and G.P_CENTERS.j_cry_jimball and cry_jimball_dt > 0.1 then
                    cry_jimball_dt = 0
                    local obj = G.P_CENTERS.j_cry_jimball
                    if (obj.pos.x == 5 and obj.pos.y == 6) then
                        obj.pos.x = 0
                        obj.pos.y = 0
                    elseif (obj.pos.x < 8) then obj.pos.x = obj.pos.x + 1
                    elseif (obj.pos.y < 6) then
                        obj.pos.x = 0
                        obj.pos.y = obj.pos.y + 1
                    end
                end
            end

        end,
        items = {jimball_sprite, dropshot, happyhouse, maximized, potofjokes, queensgambit, wee_fib, compound_interest, whip, pickle, triplet_rhythm, booster, chili_pepper, lucky_joker, cursor, cube, big_cube, nice, sus, chad, jimball, waluigi, eternalflame, seal_the_deal, fspinner, krustytheclown, blurred, gardenfork, lightupthenight, nosound, antennastoheaven, hunger, weegaming, redbloon, apjoker, maze, panopticon, magnet, unjust_dagger, monkey_dagger, pirate_dagger, mondrian, sapling, spaceglobe, happy, meteor, exoplanet, stardust, rnjoker, filler, duos, home, nuts, quintet, unity, swarm, coin, wheelhope, night, busdriver, oldblueprint}}
