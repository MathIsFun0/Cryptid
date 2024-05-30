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
                card_eval_status_text(self, 'extra', nil, nil, nil, {message = localize{type = 'variable', key = 'a_xmult', vars = {card.ability.extra.x_mult}}})
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
        if context.cardarea == G.jokers and context.before and not context.blueprint then
            if next(context.poker_hands[card.ability.extra.type]) and G.GAME.current_round.current_hand.handname == "Royal Flush" then
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

                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    func = function()
                        for i = 1, #context.scoring_hand do
                            if SMODS.Ranks[context.scoring_hand[i].base.value].key == "Queen" then
                                local card_to_destroy = context.scoring_hand[i]
                                card_to_destroy.getting_sliced = true
                                card_to_destroy:start_dissolve()
                                return true
                            end
                        end
                    end
                }))
                return {
                    message = localize('k_plus_joker'),
                    colour = G.C.RED
                }
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
        text = { "If {C:attention}played hand{} contains a",
        "2 and 7 of different suits,",
        "this Joker gains {X:mult,C:white} X#1# {} Mult",
        "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)"}
    },
    rarity = 2,
    cost = 6,
    discovered = true,
    blueprint_compat = true,
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
                            card_eval_status_text(self, 'extra', nil, nil, nil, {message = localize{type = 'variable', key = 'a_xmult', vars = {card.ability.extra.x_mult}}})
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
        if context.end_of_round and not context.blueprint and not context.individual and not context.repetition then
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
    config = {extra = {percent_mod = 3, percent = 15}},
	pos = {x = 0, y = 0},
	loc_txt = {
        name = 'Compound Interest',
        text = {
			"Earn {C:money}#1#%{} of total money",
            "at end of round, payout",
            "increases by {C:money}#2#%{} per",
            "consecutive payout"
        }
    },
	rarity = 2,
	cost = 8,
	discovered = true,
	atlas = "compound_interest",
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.percent, center.ability.extra.percent_mod}}
    end,
	calc_dollar_bonus = function(self)
		local bonus = math.floor(0.01*self.ability.extra.percent*G.GAME.dollars)
        self.ability.extra.percent = self.ability.extra.percent + self.ability.extra.percent_mod
        return bonus
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

        end,
        items = {dropshot_sprite, maximized_sprite, potofjokes_sprite, queensgambit_sprite, whip_sprite, lucky_joker_sprite, cursor_sprite, pickle_sprite, cube_sprite, triplet_rhythm_sprite, booster_sprite, chili_pepper_sprite, compound_interest_sprite, big_cube_sprite,
        dropshot, maximized, potofjokes, queensgambit, wee_fib, whip, pickle, triplet_rhythm, booster, chili_pepper, compound_interest, lucky_joker, cursor, cube, big_cube}}
