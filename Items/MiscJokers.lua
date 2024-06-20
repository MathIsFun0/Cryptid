local dropshot = {
    object_type = "Joker",
	name = "cry-Dropshot",
	key = "dropshot",
    config = {extra = {Xmult_mod = 0.2, x_mult = 1}},
	pos = {x = 0, y = 0},
	loc_txt = {
        name = 'Dropshot',
        text = {
        "This Joker gains {X:mult,C:white} X#1# {} Mult",
		"per played, nonscoring {V:1}#2#{} card,",
		"suit changes every round",
        "{C:inactive}(Currently {X:mult,C:white} X#3# {C:inactive} Mult)"
        }
    },
	rarity = 3,
	cost = 8,
	discovered = true,
    	blueprint_compat = true,
	perishable_compat = false,
	atlas = "dropshot",
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
local dropshot_sprite = {
    object_type = "Atlas",
    key = "dropshot",
    
    path = "j_cry_dropshot.png",
    px = 71,
    py = 95
}
local maximized = {
    object_type = "Joker",
	name = "cry-Maximized",
	key = "maximized",
	pos = {x = 0, y = 0},
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
	discovered = true,
	atlas = "maximized"
}
local maximized_sprite = {
    object_type = "Atlas",
    key = "maximized",
    
    path = "j_cry_maximized.png",
    px = 71,
    py = 95
}
local potofjokes = {
    object_type = "Joker",
	name = "cry-Pot of Jokes",
	key = "pot_of_jokes",
	config = {extra = {h_size = -2, h_mod = 1}},
	pos = {x = 0, y = 0},
	loc_txt = {
        name = 'Pot of Jokes',
        text = {
            "{C:attention}#1#{} hand size,",
            "increases by",
            "{C:blue}#2#{} every round"}
    	},
	rarity = 3,
	cost = 10,
    	discovered = true,
	perishable_compat = false,
	atlas = 'pot_of_jokes',
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
local potofjokes_sprite = {
    object_type = "Atlas",
    key = "pot_of_jokes",
    
    path = "j_cry_pot_of_jokes.png",
    px = 71,
    py = 95
}
local queensgambit = {
    object_type = "Joker",
    name = "cry-Queen's Gambit",
    key = "queens_gambit",
    pos = {x = 0, y = 0},
    loc_txt = {
        name = 'Queen\'s Gambit',
        text = { "If {C:attention}poker hand{} is a",
        "{C:attention}Royal Flush{}, destroy scored",
        "{C:attention}Queen{} and create a",
        "{C:dark_edition}Negative {}{C:red}Rare{}{C:attention} Joker{}"}
    },
    rarity = 3,
    cost = 10,
    discovered = true,
    atlas = "queens_gambit",
    config = {extra = {type = "Straight Flush"}},
    calculate = function(self, card, context)
        if context.destroying_card and not context.blueprint then
            if G.GAME.current_round.current_hand.handname == "Royal Flush" and SMODS.Ranks[context.destroying_card.base.value].key == "Queen" then
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.FILTER})
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    func = function()
                        local card = create_card("Joker", G.jokers, nil, 0.99, nil, nil, nil, "cry_gambit")
                        card:set_edition({
                            negative = true
                        })
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
local queensgambit_sprite = {
    object_type = "Atlas",
    key = "queens_gambit",
    
    path = "j_cry_queens_gambit.png",
    px = 71,
    py = 95
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
		"{C:mult}+#2#{} Mult for each scored",
		"{C:attention}Ace{}, {C:attention}2{}, {C:attention}3{}, {C:attention}5{}, or {C:attention}8{}",
		"{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)"}
    },
	rarity = 3,
	cost = 12,
	discovered = true,
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
					extra = {focus = self, message = localize('k_upgrade_ex')},
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
    pos = {x = 0, y = 0},
    config = {extra = {Xmult_mod = 0.5, x_mult = 1}},
    loc_txt = {
        name = 'The WHIP',
        text = { "this Joker gains {X:mult,C:white} X#1# {} Mult",
        "if {C:attention}hand played{} contains a",
        "2 and 7 of different suits",
        "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)"}
    },
    rarity = 2,
    cost = 6,
    discovered = true,
    blueprint_compat = true,
    perishable_compat = false,
    atlas = "whip",
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
local whip_sprite = {
    object_type = "Atlas",
    key = "whip",
    path = "j_cry_whip.png",
    px = 71,
    py = 95
}
local lucky_joker = {
    object_type = "Joker",
	name = "cry-Lucky Joker",
	key = "lucky_joker",
    config = {extra = { dollars = 5}},
	pos = {x = 0, y = 0},
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
	discovered = true,
    blueprint_compat = true,
	atlas = "lucky_joker",
    enhancement_gate = 'm_lucky',
    loc_vars = function(self, info_queue, center)
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
local lucky_joker_sprite = {
    object_type = "Atlas",
    key = "lucky_joker",
    
    path = "j_cry_lucky_joker.png",
    px = 71,
    py = 95
}

local cursor = {
    object_type = "Joker",
	name = "cry-Cursor",
	key = "cursor",
    config = {extra = {chips = 0, chip_mod = 5}},
	pos = {x = 0, y = 0},
	loc_txt = {
        name = 'Cursor',
        text = {
            "This Joker gains {C:chips}+#2#{} Chips",
            "per card {C:attention}purchased{}",
            "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)"
        }
    },
	rarity = 1,
	cost = 5,
	discovered = true,
    	blueprint_compat = true,
	perishable_compat = false,
	atlas = "cursor",
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
local cursor_sprite = {
    object_type = "Atlas",
    key = "cursor",
    path = "j_cry_cursor.png",
    px = 71,
    py = 95
}
local pickle = {
    object_type = "Joker",
	name = "cry-Pickle",
	key = "pickle",
    config = {extra = {tags = 3, tags_mod = 1}},
	pos = {x = 0, y = 0},
	loc_txt = {
        name = 'Pickle',
        text = {
            "When Blind skipped, create",
            "{C:attention}#1#{} Tags, reduced by",
            "{C:red}#2#{} when Blind selected"
        }
    },
	rarity = 2,
	cost = 5,
	discovered = true,
  	blueprint_compat = true,
	eternal_compat = false,
	atlas = "pickle",
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
local pickle_sprite = {
    object_type = "Atlas",
    key = "pickle",
    path = "j_cry_pickle.png",
    px = 71,
    py = 95
}

local cube = {
    object_type = "Joker",
	name = "cry-Cube",
	key = "cube",
    config = {extra = {chips = 6}},
	pos = {x = 0, y = 0},
	loc_txt = {
        name = 'Cube',
        text = {
            "{C:chips}+#1#{} Chips"
        }
    },
	rarity = 1,
	cost = -25,
	discovered = true,
    blueprint_compat = true,
	atlas = "cube",
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
local cube_sprite = {
    object_type = "Atlas",
    key = "cube",
    path = "j_cry_cube.png",
    px = 71,
    py = 95
}

local triplet_rhythm = {
    object_type = "Joker",
	name = "cry-Triplet Rhythm",
	key = "triplet_rhythm",
    config = {extra = {Xmult = 3}},
	pos = {x = 0, y = 0},
	loc_txt = {
        name = 'Triplet Rhythm',
        text = {
            "{X:mult,C:white} X#1# {} Mult if scoring hand",
            "contains {C:attention}exactly{} three {C:attention}3s"
        }
    },
	rarity = 2,
	cost = 7,
	discovered = true,
    blueprint_compat = true,
	atlas = "triplet_rhythm",
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
local triplet_rhythm_sprite = {
    object_type = "Atlas",
    key = "triplet_rhythm",
    path = "j_cry_triplet_rhythm.png",
    px = 71,
    py = 95
}
local booster = {
    object_type = "Joker",
	name = "cry-Booster Joker",
	key = "booster",
    config = {extra = {booster_slots = 1}},
	pos = {x = 0, y = 0},
	loc_txt = {
        name = 'Booster Joker',
        text = {
            "{C:attention}+#1#{} Booster Pack slot",
        }
    },
	rarity = 2,
	cost = 7,
	discovered = true,
    blueprint_compat = false,
	atlas = "booster_joker",
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
local booster_sprite = {
    object_type = "Atlas",
    key = "booster_joker",
    path = "j_cry_booster.png",
    px = 71,
    py = 95
}
local chili_pepper = {
    object_type = "Joker",
	name = "cry-Chili Pepper",
	key = "chili_pepper",
    config = {extra = {Xmult = 1, Xmult_mod = 0.5, rounds_remaining = 8}},
	pos = {x = 0, y = 0},
	loc_txt = {
        name = 'Chili Pepper',
        text = {
            "{X:mult,C:white} X#1# {} Mult, increases by",
            "{X:mult,C:white} X#2# {} Mult at end of round,",
            "destroyed after {C:attention}#3#{} rounds"
        }
    },
	rarity = 2,
	cost = 6,
	discovered = true,
  	blueprint_compat = false,
	eternal_compat = false,
	perishable_compat = false,
	atlas = "chili_pepper",
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
local chili_pepper_sprite = {
    object_type = "Atlas",
    key = "chili_pepper",
    path = "j_cry_chili_pepper.png",
    px = 71,
    py = 95
}
local compound_interest = {
    object_type = "Joker",
	name = "cry-Compound Interest",
	key = "compound_interest",
    config = {extra = {percent_mod = 2, percent = 10}},
	pos = {x = 0, y = 0},
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
	discovered = true,
	perishable_compat = false,
	atlas = "compound_interest",
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.percent, center.ability.extra.percent_mod}}
    end,
	calc_dollar_bonus = function(self, card)
		local bonus = math.max(0,math.floor(0.01*card.ability.extra.percent*G.GAME.dollars))
        card.ability.extra.percent = card.ability.extra.percent + card.ability.extra.percent_mod
        if bonus > 0 then return bonus end
	end
}
local compound_interest_sprite = {
	object_type = "Atlas",
    key = "compound_interest",
    path = "j_cry_compound_interest.png",
    px = 71,
    py = 95
}

local big_cube = {
    object_type = "Joker",
	name = "cry-Big Cube",
	key = "big_cube",
    joker_gate = "cry-Cube",
    config = {extra = {Xchips = 6}},
	pos = {x = 0, y = 0},
	loc_txt = {
        name = 'Big Cube',
        text = {
            "{X:chips,C:white} X#1# {} Chips"
        }
    },
	rarity = 1,
	cost = 25,
	discovered = true,
	atlas = "big_cube",
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
local big_cube_sprite = {
	object_type = "Atlas",
    key = "big_cube",
    path = "j_cry_big_cube.png",
    px = 71,
    py = 95
}

local eternalflame = {
	object_type = "Joker",
	name = "cry-eternalflame",
	key = "eternalflame",
	pos = {x = 0, y = 0},
	config = {extra = {extra = 0.1, x_mult = 1}},
	loc_txt = {
        name = 'Eternal Flame',
        text = {
			"This Joker gains {X:mult,C:white} X#1# {} Mult",
			"per {C:attention}card{} sold",
			"{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)"
		}
    },
	rarity = 3,
	cost = 9,
	discovered = true,
	perishable_compat = false,
	blueprint_compat = true,loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.extra, center.ability.extra.x_mult}}
    end,
	atlas = "eternalflame",
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
local eternalflame_sprite = {
	object_type = "Atlas",
    key = "eternalflame",
    
    path = "j_cry_eternalflame.png",
    px = 71,
    py = 95
}

local nice = {
    object_type = "Joker",
	name = "cry-Nice",
	key = "nice",
    config = {extra = {chips = 420, sixcount = 0, ninecount = 0}},
	pos = {x = 0, y = 0},
	loc_txt = {
        name = 'Nice',
        text = {
            "{C:chips}+#1#{} Chips if played hand",
            "contains a {C:attention}6{} and a {C:attention}9"
        }
    },
	rarity = 3,
	cost = 6.9,
	discovered = true,
	atlas = "nice",
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
    pos = {x = 0, y = 0},
    loc_txt = {
        name = 'Seal the Deal',
        text = {
            "All scored cards on {C:attention}last hand",
            "{C:attention}of round{} gain a {C:attention}random seal"
        }
    },
    rarity = 2,
    cost = 6,
    discovered = true,
    atlas = "seal_the_deal",
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
local nice_sprite = {
	object_type = "Atlas",
    key = "nice",
    path = "j_cry_nice.png",
    px = 71,
    py = 95
}

local seal_the_deal_sprite = {
    object_type = "Atlas",
    key = "seal_the_deal",
    path = "j_cry_seal_the_deal.png",
    px = 71,
    py = 95
}

local chad = {
	object_type = "Joker",
	name = "cry-Chad",
	key = "chad",
	pos = {x = 0, y = 0},
	config = {extra = {retriggers = 2}},
	loc_txt = {
        name = 'Chad',
        text = {
            "Retrigger {C:attention}leftmost{} Joker",
            "{C:attention}#1#{} additional times"
		}
    },
	rarity = 3,
	cost = 10,
	discovered = true,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, center)
		return {vars = {center.ability.extra.retriggers}}
    end,
	atlas = "chad",
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
local chad_sprite = {
	object_type = "Atlas",
    key = "chad",
    path = "j_cry_chad.png",
    px = 71,
    py = 95
}
local jimball = {
	object_type = "Joker",
	name = "cry-Jimball",
	key = "jimball",
	pos = {x = 0, y = 0},
    config = {x_mult = 1, extra = 0.15},
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
	discovered = true,
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
local jimball_sprite = {
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
	pos = {x = 0, y = 0},
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
	discovered = true,
	blueprint_compat = true,
	atlas = "sus",
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
local sus_sprite = {
	object_type = "Atlas",
    key = "sus",
    path = "j_cry_sus.png",
    px = 71,
    py = 95
}
local fspinner = {
	object_type = "Joker",
	name = "cry-fspinner",
	key = "fspinner",
	pos = {x = 0, y = 0},
        config = {extra = {chips = 0, chip_mod = 14}},
	loc_txt = {
        name = 'Fidget Spinner',
        text = {
            "This Joker gains {C:chips}+#2#{} Chips",
            "if hand played is {C:attention}not{}",
            "most played poker hand",
            "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)"
		}
    },
	loc_vars = function(self, info_queue, center)
		return {vars = {center.ability.extra.chips, center.ability.extra.chip_mod}}
    end,
	rarity = 2,
	cost = 6,
	discovered = true,
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
	atlas = "fspinner",
}
local fspinner_sprite = {
	object_type = "Atlas",
    key = "fspinner",
    path = "j_cry_fspinner.png",
    px = 71,
    py = 95
}
local waluigi = {
	object_type = "Joker",
	name = "cry-Waluigi",
	key = "waluigi",
	pos = {x = 0, y = 0},
    soul_pos = {x = 1, y = 0},
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
	discovered = true,
	blueprint_compat = true,
	calculate = function(self, card, context)
        if context.other_joker and context.other_joker.ability.set == "Joker" then
            G.E_MANAGER:add_event(Event({
                func = function()
                    context.other_joker:juice_up(0.5, 0.5)
                    return true
                end
            })) 
            return {
                message = localize{type='variable',key='a_xmult',vars={card.ability.extra.Xmult}},
                Xmult_mod = card.ability.extra.Xmult
            }
        end
	end,
	atlas = "waluigi",
}
local waluigi_sprite = {
	object_type = "Atlas",
    key = "waluigi",
    path = "j_cry_waluigi.png",
    px = 71,
    py = 95
}
local krustytheclown = {
	object_type = "Joker",
	name = "cry-krustytheclown",
	key = "krustytheclown",
	pos = {x = 0, y = 0},
	config = {extra = {extra = 0.02, x_mult = 1}},
	loc_txt = {
        name = 'Krusty The Clown',
        text = {
			"This Joker gains {X:mult,C:white} X#1# {} Mult",
			"per {C:attention}card{} scored",
			"{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)"
		}
    	},
	rarity = 2,
	cost = 7,
	discovered = true,
	perishable_compat = false,
	blueprint_compat = true,loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.extra, center.ability.extra.x_mult}}
    	end,
	atlas = "krustytheclown",
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
local krustytheclown_sprite = {
	object_type = "Atlas",
    key = "krustytheclown",
    
    path = "j_cry_krustytheclown.png",
    px = 71,
    py = 95
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
			"{C:blue}+#1#{} hand when",
			"blind is selected"
		}
   	},
	rarity = 1,
	cost = 4,
	discovered = true,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, center)
	return {vars = {center.ability.extra.hands}}
	end,
	atlas = "blurred",
	calculate = function(self, card, context)
        if context.setting_blind and not (context.blueprint_card or card).getting_sliced then
			return {
				extra = {focus = card, message = localize('k_hand')}, --make this actually work in the future
				ease_hands_played(card.ability.extra.hands),
				delay(0.6),
			}
		end
	end 
}
local blurred_sprite = {
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
    pos = {x = 0, y = 0},
    config = {extra = {money = 7}},
    loc_txt = {
        name = 'Garden of Forking Paths',
        text = { "Earn {C:money}$#1#{} if {C:attention}played hand{}",
        "contains an {C:attention}Ace{} and a {C:attention}7{}",
	}
    },
    rarity = 3,
    cost = 7,
    discovered = true,
    blueprint_compat = true,
    atlas = "gardenfork",
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
                            return {message = "+$" .. card.ability.extra.money, colour = G.C.MONEY}
                        end
                    end
                end
            end
        end
    end
}
local gardenfork_sprite = {
    object_type = "Atlas",
    key = "gardenfork",
    path = "j_cry_gardenfork.png",
    px = 71,
    py = 95
}
local lightupthenight = {
	object_type = "Joker",
	name = "cry-lightupthenight",
	key = "lightupthenight",
	config = {extra = {xmult = 1.75}},
	pos = {x = 0, y = 0},
	atlas = 'lightupthenight',
	loc_txt = {
        name = 'Light Up the Night',
        text = {
		"Each played {C:attention}7{} and {C:attention}2{}",
		"gives {X:mult,C:white}X#1#{} Mult when scored",
    	}
	},
	rarity = 3,
	cost = 7,
	discovered = true,
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
local lightupthenight_sprite = {
    object_type = "Atlas",
    key = "lightupthenight",
    path = "j_cry_lightupthenight.png",
    px = 71,
    py = 95
}
local nosound = {
    object_type = "Joker",
    name = "cry-nosound",
    key = "nosound",
    config = {extra = {retriggers = 3}},
    pos = {x = 0, y = 0},
    atlas = 'nosound',
    loc_txt = {
        name = 'No Sound, No Memory',
        text = {
            "Retrigger all played {C:attention}7s{}",
            "{C:attention:}#1#{} additional times",
        }
    },
    rarity = 3,
    cost = 7,
    discovered = true,
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
local nosound_sprite = {
    object_type = "Atlas",
    key = "nosound",
    path = "j_cry_nosound.png",
    px = 71,
    py = 95
}
local antennastoheaven = {
    object_type = "Joker",
    name = "cry-antennastoheaven",
    key = "antennastoheaven",
    pos = {x = 0, y = 0},
    config = {extra = {bonus = 0.1, Xchips = 1}},
    loc_txt = {
        name = '...Like Antennas To Heaven',
        text = {
            "This Joker gains {X:chips,C:white} X#1# {} Chips",
            "per {C:attention}7{} or {C:attention}4{} scored",
            "{C:inactive}(Currently {X:chips,C:white} X#2# {C:inactive} Chips)"
        }
    },
    rarity = 3,
    cost = 7,
    discovered = true,
    perishable_compat = false,
    blueprint_compat = true,
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.bonus, center.ability.extra.Xchips}}
    end,
    atlas = "antennastoheaven",
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
local antennastoheaven_sprite = {
    object_type = "Atlas",
    key = "antennastoheaven",
    path = "j_cry_antennastoheaven.png",
    px = 71,
    py = 95
}
local hunger = {
    	object_type = "Joker",
	name = "cry-hunger",
	key = "hunger",
    	config = {extra = {money = 3}},
	pos = {x = 0, y = 0},
	loc_txt = {
        name = 'Consume-able',
        text = {
            "Earn {C:money}$#1#{} when",
            "using a {C:attention}consumable{}",
        }
    	},
	rarity = 2,
	cost = 6,
	discovered = true,
    	blueprint_compat = true,
	atlas = "hunger",
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
local hunger_sprite = {
    object_type = "Atlas",
    key = "hunger",
    path = "j_cry_hunger.png",
    px = 71,
    py = 95
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
        items = {dropshot_sprite, maximized_sprite, potofjokes_sprite, queensgambit_sprite, whip_sprite, lucky_joker_sprite, cursor_sprite, pickle_sprite, cube_sprite, triplet_rhythm_sprite, booster_sprite, chili_pepper_sprite, compound_interest_sprite, big_cube_sprite, eternalflame_sprite, nice_sprite, sus_sprite, chad_sprite, waluigi_sprite, seal_the_deal_sprite, jimball_sprite, fspinner_sprite, krustytheclown_sprite, blurred_sprite, gardenfork_sprite, lightupthenight_sprite, nosound_sprite, antennastoheaven_sprite, hunger_sprite, dropshot, maximized, potofjokes, queensgambit, wee_fib, compound_interest, whip, pickle, triplet_rhythm, booster, chili_pepper, lucky_joker, cursor, cube, big_cube, nice, sus, chad, jimball, waluigi, eternalflame, seal_the_deal, fspinner, krustytheclown, blurred, gardenfork, lightupthenight, nosound, antennastoheaven, hunger,}}
