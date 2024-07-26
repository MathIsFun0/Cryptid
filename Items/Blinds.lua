
--extra blind functions for use by bosses
function Blind:cry_ante_base_mod(dt)
    if not self.disabled then
        local obj = self.config.blind
        if obj.cry_ante_base_mod and type(obj.cry_ante_base_mod) == 'function' then
            return obj:cry_ante_base_mod(dt)
        end
    end
    return 0
end
function Blind:cry_round_base_mod(dt)
    if not self.disabled then
        local obj = self.config.blind
        if obj.cry_round_base_mod and type(obj.cry_round_base_mod) == 'function' then
            return obj:cry_round_base_mod(dt)
        end
    end
    return 1
end
function Blind:cry_cap_score(score)
    if not self.disabled then
        local obj = self.config.blind
        if obj.cry_cap_score and type(obj.cry_cap_score) == 'function' then
            return obj:cry_cap_score(score)
        end
    end
    return score
end
function Blind:cry_after_play()
    if not self.disabled then
        local obj = self.config.blind
        if obj.cry_after_play and type(obj.cry_after_play) == 'function' then
            return obj:cry_after_play()
        end
    end
end
function Blind:cry_before_play()
    if not self.disabled then
        local obj = self.config.blind
        if obj.cry_before_play and type(obj.cry_before_play) == 'function' then
            return obj:cry_before_play()
        end
    end
end
function Blind:cry_calc_ante_gain()
    if not self.disabled then
        local obj = self.config.blind
        if obj.cry_calc_ante_gain and type(obj.cry_calc_ante_gain) == 'function' then
            return obj:cry_calc_ante_gain()
        end
    end
    return 1
end

local oldox = {
    object_type = "Blind",
    name = "cry-oldox",
    key = "oldox",
    pos = {x = 0, y = 0},
    boss = {
        min = 2,
        max = 10
    },
	loc_txt = {
        name = 'Nostalgic Ox',
        text = {
            "All hands start",
            "with 0 Chips"
        }
    },
    atlas = "nostalgia",
    boss_colour = HEX('4f6367'),
    modify_hand = function(self, cards, poker_hands, text, mult, hand_chips)
    	if to_big(hand_chips) ~= to_big(0) then
		      G.GAME.blind.triggered = true
        	return mult, to_big(0), true
    	end
    	return mult, to_big(0), false
    end
}
local oldhouse = {
    object_type = "Blind",
    name = "cry-oldhouse",
    key = "oldhouse",
    pos = {x = 0, y = 2},
    boss = {
        min = 3,
        max = 10
    },
	loc_txt = {
        name = 'Nostalgic House',
        text = {
            "No Full Houses",
        }
    },
    atlas = "nostalgia",
    boss_colour = HEX('4f6367'),
    debuff_hand = function(self, cards, hand, handname, check)
    	if handname == "Full House" and not G.GAME.blind.disabled then
		G.GAME.blind.triggered = true
        	return true
    	end
	return false
    end,
    get_loc_debuff_text = function(self)
    	return "No Full Houses"
    end
}
local oldarm = {
    object_type = "Blind",
    name = "cry-oldarm",
    key = "oldarm",
    pos = {x = 0, y = 3},
    boss = {
        min = 3,
        max = 10
    },
	loc_txt = {
        name = 'Nostalgic Arm',
        text = {
            "Must play 4",
	    "or fewer cards"
        }
    },
    atlas = "nostalgia",
    boss_colour = HEX('4f6367'),
    debuff_hand = function(self, cards, hand, handname, check)
    	if #cards > 4 and not G.GAME.blind.disabled then
		G.GAME.blind.triggered = true
        	return true
    	end
	return false
    end,
    get_loc_debuff_text = function(self)
    	return "Must play 4 or fewer cards"
    end
}
local oldfish = {
    object_type = "Blind",
    name = "cry-oldfish",
    key = "oldfish",
    pos = {x = 0, y = 4},
    boss = {
        min = 2,
        max = 10
    },
	loc_txt = {
        name = 'Nostalgic Fish',
        text = {
            "All hands start",
            "with 1 Mult"
        }
    },
    atlas = "nostalgia",
    boss_colour = HEX('4f6367'),
    modify_hand = function(self, cards, poker_hands, text, mult, hand_chips)
    	if to_big(mult) ~= to_big(1) then
		      G.GAME.blind.triggered = true
        	return to_big(1), hand_chips, true
    	end
    	return to_big(1), hand_chips, false
    end
}
local oldmanacle = {
    object_type = "Blind",
    name = "cry-oldmanacle",
    key = "oldmanacle",
    pos = {x = 0, y = 5},
    boss = {
        min = 1,
        max = 10
    },
	loc_txt = {
        name = 'Nostalgic Manacle',
        text = {
            "Divide Mult by discards",
        }
    },
    atlas = "nostalgia",
    boss_colour = HEX('4f6367'),
    modify_hand = function(self, cards, poker_hands, text, mult, hand_chips) 
    	if G.GAME.current_round.discards_left > 1 then
		G.GAME.blind.triggered = true
        	return math.floor(mult / G.GAME.current_round.discards_left), hand_chips, true
    	end
    	return mult, hand_chips, false
    end
}
local oldserpent = {
    object_type = "Blind",
    name = "cry-oldserpent",
    key = "oldserpent",
    pos = {x = 0, y = 6},
    boss = {
        min = 5,
        max = 10
    },
    loc_txt = {
        name = 'Nostalgic Serpent',
        text = {
            "Divide Mult by",
            "level of played poker hand"
        }
    },
    atlas = "nostalgia",
    boss_colour = HEX('4f6367'),
    modify_hand = function(self, cards, poker_hands, text, mult, hand_chips)
        if G.GAME.hands[text].level > 1 then
            G.GAME.blind.triggered = true
            return math.floor(mult / G.GAME.hands[text].level), hand_chips, true
        end
        return mult, hand_chips, false
    end
}
local oldpillar = {
    object_type = "Blind",
    name = "cry-oldpillar",
    key = "oldpillar",
    pos = {x = 0, y = 7},
    boss = {
        min = 3,
        max = 10
    },
	loc_txt = {
        name = 'Nostalgic Pillar',
        text = {
            "No Straights",
        }
    },
    atlas = "nostalgia",
    boss_colour = HEX('4f6367'),
    debuff_hand = function(self, cards, hand, handname, check)
    	if handname == "Straight" and not G.GAME.blind.disabled then
		G.GAME.blind.triggered = true
        	return true
    	end
	return false
    end,
    get_loc_debuff_text = function(self)
    	return "No Straights"
    end
}
local oldflint = {
    object_type = "Blind",
    name = "cry-oldflint",
    key = "oldflint",
    pos = {x = 0, y = 8},
    boss = {
        min = 3,
        max = 10
    },
	loc_txt = {
        name = 'Nostalgic Flint',
        text = {
            "No Flushes",
        }
    },
    atlas = "nostalgia",
    boss_colour = HEX('4f6367'),
    debuff_hand = function(self, cards, hand, handname, check)
    	if handname == "Flush" and not G.GAME.blind.disabled then
		G.GAME.blind.triggered = true
        	return true
    	end
	return false
    end,
    get_loc_debuff_text = function(self)
    	return "No Flushes"
    end
}
local oldmark = {
    object_type = "Blind",
    name = "cry-oldmark",
    key = "oldmark",
    pos = {x = 0, y = 1},
    boss = {
        min = 4,
        max = 10
    },
	loc_txt = {
        name = 'Nostalgic Mark',
        text = {
            "No hands containing",
            "a Pair"
        }
    },
    atlas = "nostalgia",
    boss_colour = HEX('4f6367'),
    debuff_hand = function(self, cards, hand, handname, check)
    	if next(hand["Pair"]) then 
	        G.GAME.blind.triggered = true		
        	return true
    	end
	return false
    end,
    get_loc_debuff_text = function(self)
    	return "No hands containing a Pair"
    end
}
local tax = {
    object_type = "Blind",
    name = "cry-Tax",
    key = "tax",
    pos = {x = 0, y = 0},
    boss = {
        min = 1,
        max = 10
    },
	loc_txt = {
        name = 'The Tax',
        text = {
            "Score per hand capped at",
            "0.4X blind requirements"
        }
    },
    atlas = "blinds",
    boss_colour = HEX('40ff40'),
    cry_cap_score = function(self, score)
        return math.floor(math.min(0.4*G.GAME.blind.chips,score)+0.5)
    end,
    in_pool = function()
        return G.GAME.round_resets.hands >= 3
    end
}
local box = {
    object_type = "Blind",
    name = "cry-box",
    key = "box",
    pos = {x = 0, y = 8},
    boss = {
        min = 1,
        max = 10
    },
	loc_txt = {
        name = 'The Box',
        text = {
            "All Common Jokers",
            "are debuffed"
        }
    },
    atlas = "blinds",
    boss_colour = HEX('883a3b'),
    debuff_card = function(self, card, from_blind)
    if (card.area == G.jokers) and not G.GAME.blind.disabled and card.config.center.rarity == 1 then
        return true
    end
    return false
end
}
local clock = {
    object_type = "Blind",
    name = "cry-Clock",
    key = "clock",
    pos = {x = 0, y = 1},
    mult = 0,
    boss = {
        min = 1,
        max = 10
    },
	loc_txt = {
        name = 'The Clock',
        text = {
            "+0.1X blind requirements every",
            "3 seconds spent this ante"
        }
    },
    atlas = "blinds",
    boss_colour = HEX('853455'),
    defeat = function(self, silent)
        G.P_BLINDS.bl_cry_clock.mult = 0
    end,
    disable = function(self, silent)
        G.GAME.blind.chips = get_blind_amount(G.GAME.round_resets.ante)*G.GAME.starting_params.ante_scaling*2
        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
    end,
    cry_ante_base_mod = function(self, dt)
        return 0.1*dt/3
    end
}
local trick = {
    object_type = "Blind",
    name = "cry-Trick",
    key = "trick",
    pos = {x = 0, y = 3},
    boss = {
        min = 1,
        max = 10
    },
	loc_txt = {
        name = 'The Trick',
        text = {
            "After each hand, flip all",
            "face-up cards held in hand"
        }
    },
    atlas = "blinds",
    boss_colour = HEX('babd24'),
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
    end
}

local joke = {
    object_type = "Blind",
    name = "cry-Joke",
    key = "joke",
    pos = {x = 0, y = 4},
    boss = {
        min = 1,
        max = 10
    },
	loc_txt = {
        name = 'The Joke',
        text = {
            "If score is >2X requirements,",
            "set ante to multiple of #1#"
        }
    },
    atlas = "blinds",
    boss_colour = HEX('00ffaa'),
    loc_vars = function(self, info_queue, card)
		return { vars = {G.GAME.win_ante} }
	end,
    cry_calc_ante_gain = function(self)
        if to_big(G.GAME.chips) >= to_big(G.GAME.blind.chips) * 2 then
            return G.GAME.win_ante-G.GAME.round_resets.ante%G.GAME.win_ante
        end
        return 1
    end
}
local hammer = {
    object_type = "Blind",
    name = "cry-hammer",
    key = "hammer",
    pos = {x = 0, y = 9},
    boss = {
        min = 2,
        max = 10
    },
    loc_txt = {
        name = 'The Hammer',
        text = {
            "All cards with odd",
            "rank are debuffed"
        }
    },
    atlas = "blinds",
    boss_colour = HEX('ffabd6'),
    debuff_card = function(self, card, from_blind)
        if card.area ~= G.jokers and not G.GAME.blind.disabled then
            if card.ability.effect ~= 'Stone Card' and (card.base.value == '3' or card.base.value == '5' or card.base.value == '7' or card.base.value == '9' or card.base.value == 'Ace') then
                return true
            end
            return false
        end
    end
}
local windmill = {
    object_type = "Blind",
    name = "cry-windmill",
    key = "windmill",
    pos = {x = 0, y = 10},
    boss = {
        min = 4,
        max = 10
    },
	loc_txt = {
        name = 'The Windmill',
        text = {
            "All Uncommon Jokers",
            "are debuffed"
        }
    },
    atlas = "blinds",
    boss_colour = HEX('f70000'),
    debuff_card = function(self, card, from_blind)
    if (card.area == G.jokers) and not G.GAME.blind.disabled and card.config.center.rarity == 2 then
        return true
    end
    return false
end
}
local pinkbow = { --Add effect for this later. NOTE TO SELF: DO NOT FORGET!!!
    object_type = "Blind",
    name = "cry-pinkbow",
    key = "pinkbow",
    pos = {x = 0, y = 11},
    dollars = 8,
    boss = {
        min = 3,
        max = 10,
        showdown = true
    },
    loc_txt = {
        name = 'Pink Bow',
        text = {
            "Randomize rank of cards",
            "held in hand on play"
        }
    },
    atlas = "blinds",
    boss_colour = HEX('ff00cc'),
}
local lavender_loop = {
    object_type = "Blind",
    name = "cry-Lavender Loop",
    key = "lavender_loop",
    pos = {x = 0, y = 2},
    mult = 1,
    dollars = 8,
    boss = {
        min = 3,
        max = 10,
        showdown = true
    },
	loc_txt = {
        name = 'Lavender Loop',
        text = {
            "1.25X blind requirements every",
            "1.5 seconds spent this round"
        }
    },
    atlas = "blinds",
    boss_colour = HEX('ae00ff'),
    disable = function(self, silent)
        G.GAME.blind.chips = get_blind_amount(G.GAME.round_resets.ante)*G.GAME.starting_params.ante_scaling*2
        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
    end,
    cry_round_base_mod = function(self, dt)
        return 1.25^(dt/1.5)
    end
}
local vermillion_virus = {
    object_type = "Blind",
    name = "cry-Vermillion Virus",
    key = "vermillion_virus",
    pos = {x = 0, y = 5},
    dollars = 8,
    boss = {
        min = 3,
        max = 10,
        showdown = true
    },
	loc_txt = {
        name = 'Vermillion Virus',
        text = {
            "One random Joker",
            "replaced every hand"
        }
    },
    atlas = "blinds",
    boss_colour = HEX('f65d34'),
    cry_before_play = function(self)
        if G.jokers.cards[1] then
            local idx = pseudorandom(pseudoseed('cry_vermillion_virus'),1,#G.jokers.cards)
            if G.jokers.cards[idx] then
                _card = create_card('Joker', G.jokers, nil, nil, nil, nil, nil, 'cry_vermillion_virus_gen')
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
}

local sapphire_stamp = {
    object_type = "Blind",
    name = "cry-Sapphire Stamp",
    key = "sapphire_stamp",
    pos = {x = 0, y = 6},
    dollars = 8,
    boss = {
        min = 3,
        max = 10,
        showdown = true
    },
	loc_txt = {
        name = 'Sapphire Stamp',
        text = {
            "Select an extra card, deselect",
            "random card before scoring"
        }
    },
    atlas = "blinds",
    boss_colour = HEX('4057d6'),
    cry_before_play = function(self)
        local idx = pseudorandom(pseudoseed("cry_sapphire_stamp"), 1, #G.hand.highlighted)
        G.hand:remove_from_highlighted(G.hand.highlighted[idx])
    end,
    set_blind = function(self, reset, silent)
        if not reset then
            G.hand.config.highlighted_limit = G.hand.config.highlighted_limit + 1
        end
    end,
    defeat = function(self, silent)
        if not self.disabled then
            G.hand.config.highlighted_limit = G.hand.config.highlighted_limit - 1
        end
    end,
    disable = function(self, silent)
        G.hand.config.highlighted_limit = G.hand.config.highlighted_limit - 1
    end,
}

local obsidian_orb = {
    object_type = "Blind",
    name = "cry-Obsidian Orb",
    key = "obsidian_orb",
    pos = {x = 0, y = 7},
    dollars = 8,
    boss = {
        min = 3,
        max = 10,
        showdown = true
    },
	loc_txt = {
        name = 'Obsidian Orb',
        text = {
            "Applies abilities of",
            "all defeated bosses"
        }
    },
    atlas = "blinds",
    boss_colour = HEX('290759'),
    set_blind = function(self, reset, silent)
        for k, _ in pairs(G.GAME.defeated_blinds) do
            s = G.P_BLINDS[k]
            if s.set_blind then s:set_blind(reset,silent) end
            if s.name == 'The Eye' and not reset then
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
            if s.name == 'The Mouth' and not reset then
                G.GAME.blind.only_hand = false
            end
            if s.name == 'The Fish' and not reset then 
                G.GAME.blind.prepped = nil
            end
            if s.name == 'The Water' and not reset then 
                G.GAME.blind.discards_sub = G.GAME.current_round.discards_left
                ease_discard(-G.GAME.blind.discards_sub)
            end
            if s.name == 'The Needle' and not reset then 
                G.GAME.blind.hands_sub = G.GAME.round_resets.hands - 1
                ease_hands_played(-G.GAME.blind.hands_sub)
            end
            if s.name == 'The Manacle' and not reset then
                G.hand:change_size(-1)
            end
            if s.name == 'Amber Acorn' and not reset and #G.jokers.cards > 0 then
                G.jokers:unhighlight_all()
                for k, v in ipairs(G.jokers.cards) do
                    v:flip()
                end
                if #G.jokers.cards > 1 then 
                    G.E_MANAGER:add_event(Event({ trigger = 'after', delay = 0.2, func = function() 
                        G.E_MANAGER:add_event(Event({ func = function() G.jokers:shuffle('aajk'); play_sound('cardSlide1', 0.85);return true end })) 
                        delay(0.15)
                        G.E_MANAGER:add_event(Event({ func = function() G.jokers:shuffle('aajk'); play_sound('cardSlide1', 1.15);return true end })) 
                        delay(0.15)
                        G.E_MANAGER:add_event(Event({ func = function() G.jokers:shuffle('aajk'); play_sound('cardSlide1', 1);return true end })) 
                        delay(0.5)
                    return true end })) 
                end
            end
        
            --add new debuffs
            for _, v in ipairs(G.playing_cards) do
                self:debuff_card(v)
            end
            for _, v in ipairs(G.jokers.cards) do
                if not reset then self:debuff_card(v, true) end
            end
        end
    end,
    defeat = function(self, silent)
        for k, _ in pairs(G.GAME.defeated_blinds) do
            if G.P_BLINDS[k].defeat then G.P_BLINDS[k]:defeat(silent) end
            if G.P_BLINDS[k].name == "The Manacle" and not self.disabled then
                G.hand:change_size(1)
            end
        end
    end,
    disable = function(self, silent)
        for k, _ in pairs(G.GAME.defeated_blinds) do
            s = G.P_BLINDS[k]
            if s.disable then s:disable(silent) end
            if s.name == 'The Water' then 
                ease_discard(G.GAME.blind.discards_sub)
            end
            if s.name == 'The Wheel' or s.name == 'The House' or s.name == 'The Mark' or s.name == 'The Fish' then 
                for i = 1, #G.hand.cards do
                    if G.hand.cards[i].facing == 'back' then
                        G.hand.cards[i]:flip()
                    end
                end
                for k, v in pairs(G.playing_cards) do
                    v.ability.wheel_flipped = nil
                end
            end
            if s.name == 'The Needle' then 
                ease_hands_played(G.GAME.blind.hands_sub)
            end
            if s.name == 'The Wall' then 
                G.GAME.blind.chips = G.GAME.blind.chips/2
                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
            end
            if s.name == 'Cerulean Bell' then 
                for k, v in ipairs(G.playing_cards) do
                    v.ability.forced_selection = nil
                end
            end
            if s.name == 'The Manacle' then 
                G.hand:change_size(1)
                
                G.FUNCS.draw_from_deck_to_hand(1)
            end
            if s.name == 'Violet Vessel' then 
                G.GAME.blind.chips = G.GAME.blind.chips/3
                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
            end
        end
    end,
    press_play = function(self)
        for k, _ in pairs(G.GAME.defeated_blinds) do
            s = G.P_BLINDS[k]
            if s.press_play then s:press_play() end
            if s.name == "The Hook" then
                G.E_MANAGER:add_event(Event({ func = function()
                    local any_selected = nil
                    local _cards = {}
                    for k, v in ipairs(G.hand.cards) do
                        _cards[#_cards+1] = v
                    end
                    for i = 1, 2 do
                        if G.hand.cards[i] then 
                            local selected_card, card_key = pseudorandom_element(_cards, pseudoseed('hook'))
                            G.hand:add_to_highlighted(selected_card, true)
                            table.remove(_cards, card_key)
                            any_selected = true
                            play_sound('card1', 1)
                        end
                    end
                    if any_selected then G.FUNCS.discard_cards_from_highlighted(nil, true) end
                return true end })) 
                G.GAME.blind.triggered = true
                delay(0.7)
            end
            if s.name == 'Crimson Heart' then 
                if G.jokers.cards[1] then
                    G.GAME.blind.triggered = true
                    G.GAME.blind.prepped = true
                end
            end
            if s.name == 'The Fish' then
                G.GAME.blind.prepped = true
            end
            if s.name == "The Tooth" then
                G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
                for i = 1, #G.play.cards do
                    G.E_MANAGER:add_event(Event({func = function() G.play.cards[i]:juice_up(); return true end })) 
                    ease_dollars(-1)
                    delay(0.23)
                end
                return true end })) 
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
                new_mult = math.max(math.floor(new_mult*0.5 + 0.5), 1)
                new_chips = math.max(math.floor(new_chips*0.5 + 0.5), 0)
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
                    if not check then G.GAME.blind.hands[handname] = true end
                end
                if s.name == "The Mouth" then
                    if s.only_hand and s.only_hand ~= handname then
                        G.GAME.blind.triggered = true
                        G.GAME.blind.debuff_boss = s
                        return true
                    end
                    if not check then s.only_hand = handname end
                end
            end
            if s.name == 'The Arm' then 
                G.GAME.blind.triggered = false
                if G.GAME.hands[handname].level > 1 then
                    G.GAME.blind.triggered = true
                    if not check then
                        level_up_hand(G.GAME.blind.children.animatedSprite, handname, nil, -1)
                        G.GAME.blind:wiggle()
                    end
                end 
            end
            if s.name == 'The Ox' then 
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
            if s.drawn_to_hand then s:drawn_to_hand() end
            if s.name == 'Cerulean Bell' then
                local any_forced = nil
                for k, v in ipairs(G.hand.cards) do
                    if v.ability.forced_selection then
                        any_forced = true
                    end
                end
                if not any_forced then 
                    G.hand:unhighlight_all()
                    local forced_card = pseudorandom_element(G.hand.cards, pseudoseed('cerulean_bell'))
                    forced_card.ability.forced_selection = true
                    G.hand:add_to_highlighted(forced_card)
                end
            end
            if s.name == 'Crimson Heart' and G.GAME.blind.prepped and G.jokers.cards[1] then
                local jokers = {}
                for i = 1, #G.jokers.cards do
                    if not G.jokers.cards[i].debuff or #G.jokers.cards < 2 then jokers[#jokers+1] =G.jokers.cards[i] end
                    G.jokers.cards[i]:set_debuff(false)
                end 
                local _card = pseudorandom_element(jokers, pseudoseed('crimson_heart'))
                if _card then
                    _card:set_debuff(true)
                    _card:juice_up()
                    self:wiggle()
                end
            end
        end
    end,
    stay_flipped = function(self, area, card)
        for k, _ in pairs(G.GAME.defeated_blinds) do
            s = G.P_BLINDS[k]
            if s.stay_flipped and s:stay_flipped(area, card) then return true end
            if area == G.hand then
                if s.name == 'The Wheel' and pseudorandom(pseudoseed('wheel')) < G.GAME.probabilities.normal/7 then
                    return true
                end
                if s.name == 'The House' and G.GAME.current_round.hands_played == 0 and G.GAME.current_round.discards_used == 0 then
                    return true
                end
                if s.name == 'The Mark' and card:is_face(true) then
                    return true
                end
                if s.name == 'The Fish' and G.GAME.blind.prepped then 
                    return true
                end
            end
        end
    end,
    debuff_card = function(self, card, from_blind)
        if card and type(card) == 'table' and card.area then
            for k, _ in pairs(G.GAME.defeated_blinds) do
                s = G.P_BLINDS[k]
                if s.debuff_card then s:debuff_card(card, from_blind) end
                if s.debuff and not G.GAME.blind.disabled and card.area ~= G.jokers then
                    --this part is buggy for some reason
                    if s.debuff.suit and Card.is_suit(card, s.debuff.suit, true) then
                        card:set_debuff(true)
                        return
                    end
                    if s.debuff.is_face =='face' and Card.is_face(card, true) then
                        card:set_debuff(true)
                        return
                    end
                    if s.name == 'The Pillar' and card.ability.played_this_ante then
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
                if s.name == 'Crimson Heart' and not G.GAME.blind.disabled and card.area == G.jokers then 
                    return
                end
                if s.name == 'Verdant Leaf' and not G.GAME.blind.disabled and card.area ~= G.jokers then card:set_debuff(true); return end
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
                ante = math.max(ante,s:cry_calc_ante_gain())
            end
        end
        return ante
    end,
    cry_before_play = function(self)
        for k, _ in pairs(G.GAME.defeated_blinds) do
            s = G.P_BLINDS[k]
            if s.cry_before_play then s:cry_before_play() end
        end
    end,
    cry_after_play = function(self)
        for k, _ in pairs(G.GAME.defeated_blinds) do
            s = G.P_BLINDS[k]
            if s.cry_after_play then s:cry_after_play() end
        end
    end,
    get_loc_debuff_text = function(self)
        if not G.GAME.blind.debuff_boss then return "Applies abilities of all defeated bosses" end
        local loc_vars = nil
        if G.GAME.blind.debuff_boss.name == 'The Ox' then
            loc_vars = {localize(G.GAME.current_round.most_played_poker_hand, 'poker_hands')}
        end
        local loc_target = localize{type = 'raw_descriptions', key = G.GAME.blind.debuff_boss.key, set = 'Blind', vars = loc_vars}
        local loc_debuff_text = ''
        for k, v in ipairs(loc_target) do
            loc_debuff_text = loc_debuff_text..v..(k <= #loc_target and ' ' or '')
        end
        local disp_text = (G.GAME.blind.debuff_boss.name == 'The Wheel' and G.GAME.probabilities.normal or '')..loc_debuff_text
        if (G.GAME.blind.debuff_boss.name == 'The Mouth') and G.GAME.blind.only_hand then disp_text = disp_text..' ['..localize(G.GAME.blind.only_hand, 'poker_hands')..']' end
        return disp_text
    end
}

local blind_sprites = {
    object_type = "Atlas",
    key = "blinds",
    atlas_table = "ANIMATION_ATLAS",
    path = "bl_cry.png",
    px = 34,
    py = 34,
    frames = 21
}
local nostalgia_sprites = {
    object_type = "Atlas",
    key = "nostalgia",
    atlas_table = "ANIMATION_ATLAS",
    path = "bl_nostalgia.png",
    px = 34,
    py = 34,
    frames = 21
}

local items_togo = {oldox, oldhouse, oldarm, oldfish, oldmanacle, oldserpent, oldpillar, oldflint, oldmark, tax, trick, joke, hammer, box, windmill, vermillion_virus, sapphire_stamp, obsidian_orb, blind_sprites, nostalgia_sprites}

if Cryptid_config["Timer Mechanics"] then
	table.insert(items_togo, clock)
	table.insert(items_togo, lavender_loop)
end

return {name = "Blinds", 
        init = function()
            --Clock Patches
            local upd = Game.update
            function Game:update(dt)
                upd(self,dt)
                local choices = {"Small", "Big", "Boss"}
                G.GAME.CRY_BLINDS = G.GAME.CRY_BLINDS or {}
                for _, c in pairs(choices) do
                    if G.GAME and G.GAME.round_resets and G.GAME.round_resets.blind_choices and G.GAME.round_resets.blind_choices[c] and G.P_BLINDS[G.GAME.round_resets.blind_choices[c]].cry_ante_base_mod then
                        if G.P_BLINDS[G.GAME.round_resets.blind_choices[c]].mult ~= 0 and G.P_BLINDS[G.GAME.round_resets.blind_choices[c]].mult_ante ~= G.GAME.round_resets.ante then 
                            if G.P_BLINDS[G.GAME.round_resets.blind_choices[c]].name == "cry-Obsidian Orb" then
                                for i = 1, #G.GAME.defeated_blinds do
                                    G.P_BLINDS[G.GAME.round_resets.blind_choices[c]].mult = G.P_BLINDS[G.GAME.round_resets.blind_choices[c]].mult * G.P_BLINDS[G.GAME.defeated_blinds[i]]/2
                                end
                            else
                                G.P_BLINDS[G.GAME.round_resets.blind_choices[c]].mult = 0
                            end
                            G.P_BLINDS[G.GAME.round_resets.blind_choices[c]].mult_ante = G.GAME.round_resets.ante
                        end
                        if G.GAME.round_resets.blind_states[c] ~= "Current" and G.GAME.round_resets.blind_states[c] ~= "Defeated" then
                            G.GAME.CRY_BLINDS[c] = (G.GAME.CRY_BLINDS[c] or G.P_BLINDS[G.GAME.round_resets.blind_choices[c]].mult) + (G.P_BLINDS[G.GAME.round_resets.blind_choices[c]].cry_ante_base_mod and G.P_BLINDS[G.GAME.round_resets.blind_choices[c]]:cry_ante_base_mod(dt*(G.GAME.modifiers.cry_rush_hour_iii and 2 or 1)) or 0)
                            --Update UI
                            --todo: in blinds screen, too
                            if G.blind_select_opts then
                                local blind_UI = G.blind_select_opts[string.lower(c)].definition.nodes[1].nodes[1].nodes[1].nodes[1]
                                local chip_text_node = blind_UI.nodes[1].nodes[3].nodes[1].nodes[2].nodes[2].nodes[3]
                                chip_text_node.config.text = number_format(get_blind_amount(G.GAME.round_resets.blind_ante)*G.GAME.starting_params.ante_scaling*G.GAME.CRY_BLINDS[c])
                                chip_text_node.config.scale = score_number_scale(0.9, get_blind_amount(G.GAME.round_resets.blind_ante)*G.GAME.starting_params.ante_scaling*G.GAME.CRY_BLINDS[c])
                                G.blind_select_opts[string.lower(c)]:recalculate()
                            end
                        elseif G.GAME.round_resets.blind_states[c] ~= "Defeated" and not G.GAME.blind.disabled and to_big(G.GAME.chips) < to_big(G.GAME.blind.chips) then
                            G.GAME.blind.chips = G.GAME.blind.chips + G.GAME.blind:cry_ante_base_mod(dt*(G.GAME.modifiers.cry_rush_hour_iii and 2 or 1))*get_blind_amount(G.GAME.round_resets.ante)*G.GAME.starting_params.ante_scaling
                            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                        end
                    end
                    if G.GAME.round_resets.blind_states[c] == "Current" and G.GAME and G.GAME.blind and not G.GAME.blind.disabled and to_big(G.GAME.chips) < to_big(G.GAME.blind.chips) then
                        G.GAME.blind.chips = G.GAME.blind.chips * G.GAME.blind:cry_round_base_mod(dt*(G.GAME.modifiers.cry_rush_hour_iii and 2 or 1))
                        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                    end
                end
            end
            --Trick Patches
            local gfep = G.FUNCS.evaluate_play
            function G.FUNCS.evaluate_play(e)
                gfep(e)
                G.GAME.blind:cry_after_play()
            end
            --Sapphire Stamp Patches
            local pcfh = G.FUNCS.play_cards_from_highlighted
            function G.FUNCS.play_cards_from_highlighted(e)
                G.GAME.blind:cry_before_play()
                pcfh(e)
            end
            --Obsidian Orb Patches
            local dft = Blind.defeat
            function Blind:defeat(s)
                dft(self, s)
                if self.name ~= "cry-Obsidian Orb" and 
                   (self.name ~= "cry-oldarm" or not G.GAME.defeated_blinds["bl_psychic"]) and
                   (self.name ~= "The Psychic" or not G.GAME.defeated_blinds["bl_cry_oldarm"]) and
                   (self.name ~= "The Eye" or not G.GAME.defeated_blinds["bl_mouth"]) and
                   (self.name ~= "The Mouth" or not G.GAME.defeated_blinds["bl_eye"]) and
                   (self.name ~= "The Needle" or not G.GAME.defeated_blinds["bl_cry_tax"]) and
                   (self.name ~= "cry-Tax" or not G.GAME.defeated_blinds["bl_needle"])
                   then
                    G.GAME.defeated_blinds[self.config.blind.key] = true
                end
            end
            local sr = Game.start_run
            function Game:start_run(args)
                sr(self, args)
				if G.P_BLINDS.bl_cry_clock then
					G.P_BLINDS.bl_cry_clock.mult = 0
				end
                if not G.GAME.defeated_blinds then G.GAME.defeated_blinds = {} end
            end
            --patch for multiple Clocks to tick separately and load separately
            local bsb = Blind.set_blind
            function Blind:set_blind(blind, y, z)
                local c = "Boss"
                if string.sub(G.GAME.subhash or '', -1) == 'S' then c = "Small" end
                if string.sub(G.GAME.subhash or '', -1) == 'B' then c = "Big" end
                if G.GAME.CRY_BLINDS and G.GAME.CRY_BLINDS[c] and not y and blind and blind.mult then blind.mult = G.GAME.CRY_BLINDS[c] end
                bsb(self, blind, y, z)
            end
            local rb = reset_blinds
            function reset_blinds()
                if G.GAME.round_resets.blind_states.Boss == 'Defeated' then
                    G.GAME.CRY_BLINDS = {}
					if G.P_BLINDS.bl_cry_clock then
						G.P_BLINDS.bl_cry_clock.mult = 0
					end
                end
                rb()
            end
        end,
        items = items_togo}
