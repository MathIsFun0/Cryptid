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
        if context.cardarea == G.jokers and (card.ability.extra.x_mult > 1) and not context.before and not context.after then
            return {
                message = localize{type='variable',key='a_xmult',vars={card.ability.extra.x_mult}},
                Xmult_mod = card.ability.extra.x_mult
            }
        end
    end
}
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
	cost = 10,
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
        name = 'Wee Fibonacci',
        text = {
		"This Joker gains",
		"{C:mult}+#2#{} Mult when each played",
		"{C:attention}Ace{}, {C:attention}2{}, {C:attention}3{}, {C:attention}5{}, or {C:attention}8{}",
		"is scored",
		"{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)"}
    	},
	rarity = 3,
	cost = 12,
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
		if context.cardarea == G.jokers and (card.ability.extra.mult > 0) and not context.before and not context.after then
			return {
				message = localize{type='variable',key='a_mult',vars={card.ability.extra.mult}},
				mult_mod = card.ability.extra.mult, 
				colour = G.C.MULT
			}
		end
	end,
}
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
    cost = 6,
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
        if context.cardarea == G.jokers and (card.ability.extra.x_mult > 1) and not context.before and not context.after then
            return {
                message = localize{type='variable',key='a_xmult',vars={card.ability.extra.x_mult}},
                Xmult_mod = card.ability.extra.x_mult
            }
        end
    end
}
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
	cost = 5,
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
        if context.buying_card and not context.blueprint then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize{type = 'variable', key = 'a_chips', vars = {card.ability.extra.chips}}, colour = G.C.CHIPS})
            return {calculated = true}
        end
        if context.cardarea == G.jokers and (card.ability.extra.chips > 0) and not context.before and not context.after then
            return {
                message = localize{type='variable',key='a_chips',vars={card.ability.extra.chips}},
                chip_mod = card.ability.extra.chips
            }
        end
    end
}
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
	cost = 5,
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
	cost = -25,
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
	cost = 7,
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
        if context.cardarea == G.jokers and not context.before and not context.after and card.ability.extra.Xmult > 1 then
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
	cost = 8,
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
local big_cube = {
    object_type = "Joker",
	name = "cry-Big Cube",
	key = "big_cube",
    joker_gate = "cry-Cube",
    config = {extra = {Xchips = 6}},
	pos = {x = 4, y = 4},
	loc_txt = {
        name = 'Big Cube',
        text = {
            "{X:chips,C:white} X#1# {} Chips"
        }
    },
	rarity = 1,
	cost = 25,
	atlas = "atlasone",
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.Xchips}}
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and not context.before and not context.after then
            return {
                message = "X"..card.ability.extra.Xchips,
                Xchip_mod = card.ability.extra.Xchips,
                colour = G.C.CHIPS
            }
        end
    end
}
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
        if context.cardarea == G.jokers and (card.ability.extra.x_mult > 1) and not context.before and not context.after then
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
            "contains a {C:attention}6{} and a {C:attention}9"
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
local seal_the_deal = {
    object_type = "Joker",
    name = "cry-Seal The Deal",
    key = "seal_the_deal",
    config = {extra = {Xchips = 6}},
    pos = {x = 2, y = 4},
    loc_txt = {
        name = 'Seal the Deal',
        text = {
            "Add a {C:attention}random seal{} to all",
            "cards scored on {C:attention}last hand{} played"
        }
    },
    rarity = 2,
    cost = 6,
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
	cost = 10,
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
                if card.ability.x_mult > 1 then
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
	cost = 9,
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
        if context.cardarea == G.jokers and (card.ability.extra.chips > 0) and not context.before and not context.after then
            return {
                message = localize{type='variable',key='a_chips',vars={card.ability.extra.chips}},
                chip_mod = card.ability.extra.chips
            }
	    end
	end,
	atlas = "atlasone",
}
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
        if context.cardarea == G.jokers and (card.ability.extra.x_mult > 1) and not context.before and not context.after then
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
local blurred = {
	object_type = "Joker",
	name = "cry-blurred",
	key = "blurred",
	pos = {x = 0, y = 0},
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
	atlas = "blurred",
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
local blurred_sprite = { --left this on it's own atlas because i can't tell when this thing starts and ends
	object_type = "Atlas",
    key = "blurred",
    path = "j_cry_blurred.png",
    px = 71,
    py = 95
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
local antennastoheaven = {
    object_type = "Joker",
    name = "cry-antennastoheaven",
    key = "antennastoheaven",
    pos = {x = 3, y = 1},
    config = {extra = {bonus = 0.1, Xchips = 1}},
    loc_txt = {
        name = '...Like Antennas to Heaven',
        text = {
            "This Joker gains",
	    "{X:chips,C:white} X#1# {} Chips when each played",
            "{C:attention}7{} or {C:attention}4{} is scored",
            "{C:inactive}(Currently {X:chips,C:white} X#2# {C:inactive} Chips)"
        }
    },
    rarity = 3,
    cost = 7,
    perishable_compat = false,
    blueprint_compat = true,
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.bonus, center.ability.extra.Xchips}}
    end,
    atlas = "atlasone",
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and (card.ability.extra.Xchips > 1) and not context.before and not context.after then
            return {
                message = "X"..card.ability.extra.Xchips,
                Xchip_mod = card.ability.extra.Xchips,
                colour = G.C.CHIPS
            }
	end
	if context.cardarea == G.play and context.individual and not context.blueprint then
            local rank = SMODS.Ranks[context.other_card.base.value].key
            if rank == "4" or rank == "7" then
                card.ability.extra.Xchips = card.ability.extra.Xchips + card.ability.extra.bonus
                return {
                    extra = {focus = card, message = localize('k_upgrade_ex')},
                    card = card,
                    colour = G.C.CHIPS
                }
            end
        end
    end
}
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
        if context.using_consumeable then
        	ease_dollars(card.ability.extra.money)
		return {calculated = true}
        end
    end
}
local weegaming = {
    object_type = "Joker",
    name = "cry-weegaming",
    key = "weegaming",
    config = {extra = {retriggers = 2}},
    pos = {x = 0, y = 0},
    atlas = 'weegaming',
    loc_txt = {
        name = '2D',
        text = {
            "Retrigger each played {C:attention}2{}", --wee gaming
            "{C:attention:}#1#{} additional time(s)", --wee gaming?
        }
    },
    rarity = 2,
    cost = 7,
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
local weegaming_sprite = { --placeholder, remember to replace this later
    object_type = "Atlas",
    key = "weegaming",
    path = "j_placeholder.png",
    px = 71,
    py = 95
}
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
    cost = 2,
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
    cost = 3,
    atlas = "atlastwo",
    calculate = function(self, card, context)
        if (context.before or context.after or context.pre_discard or context.discard or context.cardarea == G.hand) and not context.blueprint and not context.retrigger_joker then
            G.GAME.current_round.hands_played = 0
            G.GAME.current_round.discards_used = 0
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        G.GAME.current_round.hands_played = 0
        G.GAME.current_round.discards_used = 0
    end
}
--Notes from my testing
-- I've found that DNA and Burnt Joker work SOMEWHAT but can be jank at times (ESPECIALLY so with retrigger jokers). i can only assume other modded jokers will behave in a similar way. Trading card and sixth sense work without any issues tho so yey
local magnet = {
    object_type = "Joker",
    name = "cry-magnet",
    key = "magnet",
    pos = {x = 4, y = 0},
    config = {extra = {money = 3, Xmoney = 3, slots = 4}},
    loc_txt = {
        name = 'Fridge Magnet',
        text = {
            "Earn {C:money}$#1#{} at end of round",
	    "Earn {X:money,C:white} X#2# {} if there are",
	    "{C:attention}#3#{} or fewer {C:attention}Joker{} cards",
        }
    },
    rarity = 1,
    cost = 5,
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
cost = 7,
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
			"and permanently add {C:attention}quintuple{}",
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
        if context.cardarea == G.jokers and (card.ability.extra.chips > 0) and not context.before and not context.after then
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
            G.GAME.joker_buffer = G.GAME.joker_buffer - 1
            G.E_MANAGER:add_event(Event({func = function()
                G.GAME.joker_buffer = 0
                card.ability.extra.chips = card.ability.extra.chips + sliced_card.sell_cost*5
                card:juice_up(0.8, 0.8)
                sliced_card:start_dissolve({HEX("57ecab")}, nil, 1.6)
                play_sound('slice1', 0.96+math.random()*0.08)
            return true end }))
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize{type = 'variable', key = 'a_chips', vars = {card.ability.extra.chips+4*sliced_card.sell_cost}}, colour = G.C.CHIPS, no_juice = true})
			return {calculated = true}
        end
    end
}
local pirate_dagger = {
	object_type = "Joker",
	name = "cry-Pirate Dagger",
	key = "pirate_dagger",
	pos = {x = 3, y = 3},
	config = {extra = {Xchips = 1}},
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
	cost = 6,
	perishable_compat = false,
	    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.Xchips}}
    end,
	atlas = "atlastwo",
		calculate = function(self, card, context)
        if context.cardarea == G.jokers and (card.ability.extra.Xchips > 1) and not context.before and not context.after then
            return {
                message = localize{type='variable',key='a_xchips',vars={card.ability.extra.Xchips}},
                Xchip_mod = card.ability.extra.Xchips
            }
        end
            local my_pos = nil
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then my_pos = i; break end
		end
        if context.setting_blind and not (context.blueprint_card or self).getting_sliced and my_pos and G.jokers.cards[my_pos+1] and not G.jokers.cards[my_pos+1].ability.eternal and not G.jokers.cards[my_pos+1].getting_sliced then 
            local sliced_card = G.jokers.cards[my_pos+1]
            sliced_card.getting_sliced = true
            G.GAME.joker_buffer = G.GAME.joker_buffer - 1
            G.E_MANAGER:add_event(Event({func = function()
                G.GAME.joker_buffer = 0
                card.ability.extra.Xchips = card.ability.extra.Xchips + sliced_card.sell_cost*0.25
                card:juice_up(0.8, 0.8)
                sliced_card:start_dissolve({HEX("57ecab")}, nil, 1.6)
                play_sound('slice1', 0.96+math.random()*0.08)
            return true end }))
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize{type = 'variable', key = 'a_xchips', vars = {card.ability.extra.Xchips+0.25*sliced_card.sell_cost}}, colour = G.C.CHIPS, no_juice = true})
			return {calculated = true}
        end
    end
}
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
        if context.cardarea == G.jokers and (card.ability.extra.x_mult > 1) and not context.before and not context.after then
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
		if context.selling_self and card.ability.extra.score >= 30 and not context.blueprint and not context.retrigger_joker then
			local card = create_card("Joker", G.jokers, nil, 1, nil, nil, nil, "cry_sapling")
                        card:add_to_deck()
                        G.jokers:emplace(card)
                        card:start_materialize()
			return {completed=true}
		end
	end
}
local spaceglobe = {
	object_type = "Joker",
	name = "cry-spaceglobe",
	key = "spaceglobe",
	pos = {x = 1, y = 4},
	config = {extra = {Xchips = 1, Xchipmod = 0.2, type = "High Card"}},
	loc_txt = {
        name = 'Celestial Globe',
        text = {
			"This Joker gains {X:chips,C:white}X#2#{} Chips",
			"if {C:attention}poker hand{} is a {C:attention}#3#{}",
			"{C:inactive}(Hand changes after increase){}",
			"{C:inactive}(Currently{} {X:chips,C:white}X#1#{} {C:inactive}Chips){}"
		}
    	},
	rarity = 3,
	cost = 6,
	blueprint_compat = true,
	perishable_compat = false,
	loc_vars = function(self, info_queue, center)
		return {vars = {center.ability.extra.Xchips, center.ability.extra.Xchipmod, center.ability.extra.type}}
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
                            	card.ability.extra.type = pseudorandom_element(_type, pseudoseed('to_do'))
                            	return true
                        	end
                    	}))
			card.ability.extra.Xchips = card.ability.extra.Xchips + card.ability.extra.Xchipmod
                    	return {
                    	message = localize('k_upgrade_ex'),
                        card = card,
			}
                	end
		end
		if context.cardarea == G.jokers and (card.ability.extra.Xchips > 1) and not context.before and not context.after then
            		return {
                		message = "X"..card.ability.extra.Xchips,
                		Xchip_mod = card.ability.extra.Xchips,
                		colour = G.C.CHIPS
            		}
		end
		
        end
}
local happy = {
    object_type = "Joker",
    name = "cry-happy",
    key = "happy",
    pos = {x = 2, y = 1},
    loc_txt = {
        name = ':D',
        text = {
            "Create a random {C:attention}Joker{}",
            "when {C:attention}obtained{}",
	    "Sell this card to",
	    "create a random {C:attention}Joker{}",
	    "{C:inactive}(Must have room){}"
        }
    },
    rarity = 1,
    cost = 6,
    blueprint_compat = true,
    eternal_compat = false,
    atlas = "atlastwo",
    calculate = function(self, card, context)
        if context.selling_self and #G.jokers.cards + G.GAME.joker_buffer <= G.jokers.config.card_limit and not context.retrigger_joker then
		local createjoker = math.min(1, G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
		G.GAME.joker_buffer = G.GAME.joker_buffer + createjoker
		local card = create_card('Joker', G.jokers, nil, nil, nil, nil, nil, 'happy')
			card:add_to_deck()
			G.jokers:emplace(card)
			G.GAME.joker_buffer = 0
			return {completed=true}
        end
    end,
    add_to_deck = function(self, card, from_debuff)
	if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
		local createjoker = math.min(1, G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
		G.GAME.joker_buffer = G.GAME.joker_buffer + createjoker
		local card = create_card('Joker', G.jokers, nil, nil, nil, nil, nil, 'happy')
			card:add_to_deck()
			G.jokers:emplace(card)
			G.GAME.joker_buffer = 0
			return {completed=true}
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
            "{C:dark_edition}Foil{} cards",
            "each give {C:chips}+#1#{} Chips"
        }
    },
    loc_vars = function(self, info_queue, center)
	info_queue[#info_queue+1] = G.P_CENTERS.e_foil
        return {vars = {center.ability.extra.chips}}
    end,
    rarity = 2,
    cost = 6,
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
    end,
    atlas = "atlastwo",
}
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
	cost = 6,
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
	end,
	atlas = "atlastwo",
}
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
	end,
	atlas = "atlastwo",
}
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
                    self.cost = 25
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
        items = {blurred_sprite, jimball_sprite, weegaming_sprite, dropshot, maximized, potofjokes, queensgambit, wee_fib, compound_interest, whip, pickle, triplet_rhythm, booster, chili_pepper, lucky_joker, cursor, cube, big_cube, nice, sus, chad, jimball, waluigi, eternalflame, seal_the_deal, fspinner, krustytheclown, blurred, gardenfork, lightupthenight, nosound, antennastoheaven, hunger, weegaming, redbloon, apjoker, maze, magnet, unjust_dagger, monkey_dagger, pirate_dagger, mondrian, sapling, spaceglobe, happy, meteor, exoplanet, stardust,}}
