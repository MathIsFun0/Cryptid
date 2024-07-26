local code = {
    object_type = "ConsumableType",
    key = "Code",
    primary_colour = HEX("14b341"),
    secondary_colour = HEX("12f254"),
    collection_rows = {4,4}, -- 4 pages for all code cards
    loc_txt = {
        collection = "Code Cards",
        name = "Code",
        label = "Code"
    },
    shop_rate = 0.0,
    default = 'c_cry_crash',
    can_stack = true,
    can_divide = true
}
local code_atlas = {
    object_type = "Atlas",
    key = "code",
    path = "c_cry_code.png",
    px = 71,
    py = 95
}
local pack_atlas = {
    object_type = "Atlas",
    key = "pack",
    path = "pack_cry.png",
    px = 71,
    py = 95
}
local pack1 = {
    object_type = "Booster",
    key = "code_normal_1",
    kind = "Code",
    atlas = "pack",
    pos = {x=0,y=0},
    config = {extra = 2, choose = 1},
    cost = 4,
    weight = 0.96,
    create_card = function(self, card)
        return create_card("Code", G.pack_cards, nil, nil, true, true, nil, 'cry_program')
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.SET.Code)
        ease_background_colour{new_colour = G.C.SET.Code, special_colour = G.C.BLACK, contrast = 2}
    end,
    loc_vars = function(self, info_queue, card)
		return { vars = {card.config.center.config.choose, card.ability.extra} }
	end,
    loc_txt = {
        name = "Program Pack",
        text = {
            "Choose {C:attention}#1#{} of up to",
            "{C:attention}#2#{C:cry_code} Code{} cards"
        }
    },
    group_key = "k_cry_program_pack"
}
local pack2 = {
    object_type = "Booster",
    key = "code_normal_2",
    kind = "Code",
    atlas = "pack",
    pos = {x=1,y=0},
    config = {extra = 2, choose = 1},
    cost = 4,
    weight = 0.96,
    create_card = function(self, card)
        return create_card("Code", G.pack_cards, nil, nil, true, true, nil, 'cry_program')
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.SET.Code)
        ease_background_colour{new_colour = G.C.SET.Code, special_colour = G.C.BLACK, contrast = 2}
    end,
    loc_vars = function(self, info_queue, card)
		return { vars = {card.config.center.config.choose, card.ability.extra} }
	end,
    loc_txt = {
        name = "Program Pack",
        text = {
            "Choose {C:attention}#1#{} of up to",
            "{C:attention}#2#{C:cry_code} Code{} cards"
        }
    },
    group_key = "k_cry_program_pack"
}
local packJ = {
    object_type = "Booster",
    key = "code_jumbo_1",
    kind = "Code",
    atlas = "pack",
    pos = {x=2,y=0},
    config = {extra = 4, choose = 1},
    cost = 6,
    weight = 0.48,
    create_card = function(self, card)
        return create_card("Code", G.pack_cards, nil, nil, true, true, nil, 'cry_program')
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.SET.Code)
        ease_background_colour{new_colour = G.C.SET.Code, special_colour = G.C.BLACK, contrast = 2}
    end,
    loc_vars = function(self, info_queue, card)
		return { vars = {card.config.center.config.choose, card.ability.extra} }
	end,
    loc_txt = {
        name = "Jumbo Program Pack",
        text = {
            "Choose {C:attention}#1#{} of up to",
            "{C:attention}#2#{C:cry_code} Code{} cards"
        }
    },
    group_key = "k_cry_program_pack"
}
local packM = {
    object_type = "Booster",
    key = "code_mega_1",
    kind = "Code",
    atlas = "pack",
    pos = {x=3,y=0},
    config = {extra = 4, choose = 2},
    cost = 8,
    weight = 0.12,
    create_card = function(self, card)
        return create_card("Code", G.pack_cards, nil, nil, true, true, nil, 'cry_program')
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.SET.Code)
        ease_background_colour{new_colour = G.C.SET.Code, special_colour = G.C.BLACK, contrast = 2}
    end,
    loc_vars = function(self, info_queue, card)
		return { vars = {card.config.center.config.choose, card.ability.extra} }
	end,
    loc_txt = {
        name = "Mega Program Pack",
        text = {
            "Choose {C:attention}#1#{} of up to",
            "{C:attention}#2#{C:cry_code} Code{} cards"
        }
    },
    group_key = "k_cry_program_pack"
}
local console = {
    object_type = "Tag",
    atlas = "tag_cry",
    pos = {x=3, y=2},
    config = {type = 'new_blind_choice'},
    key = "console",
    min_ante = 2,
    loc_txt = {
        name = "Console Tag",
        text = {
            "Gives a free",
            "{C:cry_code}Program Pack"
        }
    },
    loc_vars = function(self, info_queue)
        info_queue[#info_queue+1] = {set = "Other", key = "p_cry_code_normal_1", specific_vars = {1,2}}
        return {vars = {}}
    end,
    apply = function(tag, context)
        if context.type == 'new_blind_choice' then
            tag:yep('+', G.C.SECONDARY_SET.Code,function() 
                local key = 'p_cry_code_normal_'..math.random(1,2)
                local card = Card(G.play.T.x + G.play.T.w/2 - G.CARD_W*1.27/2,
                G.play.T.y + G.play.T.h/2-G.CARD_H*1.27/2, G.CARD_W*1.27, G.CARD_H*1.27, G.P_CARDS.empty, G.P_CENTERS[key], {bypass_discovery_center = true, bypass_discovery_ui = true})
                card.cost = 0
                card.from_tag = true
                G.FUNCS.use_card({config = {ref_table = card}})
                card:start_materialize()
                return true
            end)
            tag.triggered = true
            return true
        end
    end,
}
local crash = {
    object_type = "Consumable",
    set = "Code",
    name = "cry-Crash",
    key = "crash",
    pos = {x=0,y=0},
	config = {},
    loc_txt = {
        name = '://CRASH',
        text = {
			"{C:cry_code,E:1}Don't."
        }
    },
    cost = 4,
    atlas = "code",
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        local f = pseudorandom_element(crash_functions, pseudoseed("cry_crash"))
        f(self, card, area, copier)
    end
}

local payload = {
    object_type = "Consumable",
    set = "Code",
    name = "cry-Payload",
    key = "payload",
    pos = {x=1,y=0},
	config = {interest_mult = 3},
    loc_txt = {
        name = '://PAYLOAD',
        text = {
			"Next defeated Blind",
            "gives {C:cry_code}X#1#{} interest"
        }
    },
    loc_vars = function(self, info_queue, center)
        return {vars = {self.config.interest_mult}}
    end,
    cost = 4,
    atlas = "code",
    can_use = function(self, card)
        return true
    end,
    can_bulk_use = true,
    use = function(self, card, area, copier)
        G.GAME.cry_payload = (G.GAME.cry_payload or 1) * card.ability.interest_mult
    end,
    bulk_use = function(self, card, area, copier, number)
        G.GAME.cry_payload = (G.GAME.cry_payload or 1) * card.ability.interest_mult^number
    end
}
local reboot = {
    object_type = "Consumable",
    set = "Code",
    name = "cry-Reboot",
    key = "reboot",
    pos = {x=2,y=0},
	config = {},
    loc_txt = {
        name = '://REBOOT',
        text = {
			"Replenish {C:blue}Hands{} and {C:red}Discards{},",
            "return {C:cry_code}all{} cards to deck",
            "and draw a {C:cry_code}new{} hand"
        }
    },
    cost = 4,
    atlas = "code",
    can_use = function(self, card)
        return G.STATE == G.STATES.SELECTING_HAND
    end,
    use = function(self, card, area, copier)
        G.FUNCS.draw_from_hand_to_discard()
        G.FUNCS.draw_from_discard_to_deck()
        ease_discard(math.max(0, G.GAME.round_resets.discards + G.GAME.round_bonus.discards)-G.GAME.current_round.discards_left)
        ease_hands_played(math.max(1, G.GAME.round_resets.hands + G.GAME.round_bonus.next_hands)-G.GAME.current_round.hands_left)
        for k, v in pairs(G.playing_cards) do
            v.ability.wheel_flipped = nil
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'immediate',
            func = function()
                G.STATE = G.STATES.DRAW_TO_HAND
                G.deck:shuffle('cry_reboot'..G.GAME.round_resets.ante)
                G.deck:hard_set_T()
                G.STATE_COMPLETE = false
                return true
            end
        }))

    end
}

local revert = {
    object_type = "Consumable",
    set = "Code",
    name = "cry-Revert",
    key = "revert",
    pos = {x=3,y=0},
	config = {},
    loc_txt = {
        name = '://REVERT',
        text = {
			"Set {C:cry_code}game state{} to",
            "start of {C:cry_code}this Ante{}"
        }
    },
    cost = 4,
    atlas = "code",
    can_use = function(self, card)
        return G.GAME.cry_revert
    end,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 4,
            func = function()
                G:delete_run()
                G:start_run({
                    savetext = STR_UNPACK(G.GAME.cry_revert),
                })
            end
        }),"other")
    end
}

local semicolon = {
    object_type = "Consumable",
    set = "Code",
    name = "cry-Semicolon",
    key = "semicolon",
    pos = {
        x = 0,
        y = 1
    },
    config = {},
    loc_txt = {
        name = ';//',
        text = {"Ends current non-Boss {C:cry_code}Blind{}", "{C:cry_code}without{} cashing out"}
    },
    cost = 4,
    atlas = "code",
    can_use = function(self, card)
        return G.STATE == G.STATES.SELECTING_HAND and not G.GAME.blind.boss
    end,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'immediate',
            func = function()
                if G.STATE ~= G.STATES.SELECTING_HAND then return false end
                G.GAME.current_round.semicolon = true
                G.STATE = G.STATES.HAND_PLAYED
                G.STATE_COMPLETE = true
                end_round()
                return true
            end
        }), "other")
    end
}

local malware = {
    object_type = "Consumable",
    set = "Code",
    name = "cry-Malware",
    key = "malware",
    pos = {
        x = 1,
        y = 1
    },
    config = {},
    loc_txt = {
        name = '://MALWARE',
        text = {"Add {C:dark_edition}Glitched{} to all",
                "cards {C:cry_code}held in hand"}
    },
    cost = 4,
    atlas = "code",
    can_use = function(self, card)
        return #G.hand.cards > 0
    end,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot1')
            card:juice_up(0.3, 0.5)
            return true end }))
        for i=1, #G.hand.cards do
            local percent = 1.15 - (i-0.999)/(#G.hand.cards-0.998)*0.3
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.cards[i]:flip();play_sound('card1', percent);G.hand.cards[i]:juice_up(0.3, 0.3);return true end }))
        end
        delay(0.2)
        for i=1, #G.hand.cards do
			local CARD = G.hand.cards[i]
            local percent = 0.85 + (i-0.999)/(#G.hand.cards-0.998)*0.3
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() CARD:flip();
            CARD:set_edition({
            				cry_glitched = true
            			})
                  play_sound('tarot2', percent);CARD:juice_up(0.3, 0.3);return true end }))
        end
    end
}

local seed = {
    object_type = "Consumable",
    set = "Code",
    name = "cry-Seed",
    key = "seed",
    pos = {
        x = 3,
        y = 1
    },
    config = {},
    loc_txt = {
        name = '://SEED',
        text = {
            "Select a Joker",
            "or playing card",
            "to become {C:cry_code}Rigged"
        }
    },
    cost = 4,
    atlas = "code",
    can_use = function(self, card)
        --the card itself and one other card
        return #G.jokers.highlighted + #G.hand.highlighted + #G.consumeables.highlighted == 2
    end,
    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {key = 'cry_rigged', set = 'Other', vars = {}}
	end,
    use = function(self, card, area, copier)
        area:remove_from_highlighted(card)
        if G.jokers.highlighted[1] then
            G.jokers.highlighted[1].ability.cry_rigged = true
        end
        if G.hand.highlighted[1] then
            G.hand.highlighted[1].ability.cry_rigged = true
        end
        if G.consumeables.highlighted[1] then
            G.consumeables.highlighted[1].ability.cry_rigged = true
        end
    end
}

local variable = {
    object_type = 'Consumable',
    set = 'Code',
    key = 'variable',
    name = 'cry-Variable',
    atlas = 'code',
    pos = {
        x = 2,
        y = 1,
    },
    cost = 4,
    config = {max_highlighted = 2, extra = {enteredrank = ""}},
    loc_txt = {
        name = '://VARIABLE',
        text = {
            'Convert {C:cry_code}#1#{} selected cards',
            'to a {C:cry_code}chosen{} rank'
        }
    },
    loc_vars = function(self, info_queue, card)
		return {vars = {self.config.max_highlighted}}
	end,
    use = function(self, card, area, copier)
        G.GAME.USING_CODE = true
        G.ENTERED_RANK = ""
        G.CHOOSE_RANK = UIBox{
            definition = create_UIBox_variable(card),
            config = {align="bmi", offset = {x=0,y=G.ROOM.T.y + 29},major = G.jokers, bond = 'Weak', instance_type = "POPUP"}
        }
    end
}
local class = {
    object_type = 'Consumable',
    set = 'Code',
    key = 'class',
    name = 'cry-Class',
    atlas = 'code',
    pos = {
        x = 4,
        y = 1,
    },
    cost = 4,
    config = {max_highlighted = 1, extra = {enteredrank = ""}},
    loc_txt = {
        name = '://CLASS',
        text = {
            'Convert {C:cry_code}#1#{} selected card',
            'to a {C:cry_code}chosen{} enhancement'
        }
    },
    loc_vars = function(self, info_queue, card)
		return {vars = {self.config.max_highlighted}}
	end,
    use = function(self, card, area, copier)
        G.GAME.USING_CODE = true
        G.ENTERED_ENH = ""
        G.CHOOSE_ENH = UIBox{
            definition = create_UIBox_class(card),
            config = {align="bmi", offset = {x=0,y=G.ROOM.T.y + 29},major = G.jokers, bond = 'Weak', instance_type = "POPUP"}
        }
    end
}
local automaton = {
    object_type = "Consumable",
    set = "Tarot",
    name = "cry-Automaton",
    key = "automaton",
    pos = {x=5,y=1},
    config = {create = 1},
    loc_txt = {
        name = 'The Automaton',
        text = {
            "Creates up to {C:attention}#1#",
            "random {C:cry_code}Code{} card",
            "{C:inactive}(Must have room)"
        }
    },
    atlas = "code",
    loc_vars = function(self, info_queue, card)
		return {vars = {self.config.create}}
	end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        for i = 1, math.min(card.ability.consumeable.create, G.consumeables.config.card_limit - #G.consumeables.cards) do
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                if G.consumeables.config.card_limit > #G.consumeables.cards then
                    play_sound('timpani')
                    local _card = create_card('Code', G.consumeables, nil, nil, nil, nil, nil, 'cry_automaton')
                    _card:add_to_deck()
                    G.consumeables:emplace(_card)
                    card:juice_up(0.3, 0.5)
                end
                return true end }))
        end
        delay(0.6)
    end
}

function create_UIBox_variable(card)
    G.E_MANAGER:add_event(Event({
        blockable = false,
        func = function()
          G.REFRESH_ALERTS = true
        return true
        end
      }))
    local t = create_UIBox_generic_options({no_back = true,
    colour = HEX("04200c"),
    outline_colour = G.C.SECONDARY_SET.Code,
    contents = {
        {n=G.UIT.R, nodes = {create_text_input({
            colour = G.C.SET.Code,
            hooked_colour = darken(copy_table(G.C.SET.Code), 0.3),
            w = 4.5, h = 1, max_length = 16, prompt_text = "ENTER RANK",
            ref_table = G, ref_value = 'ENTERED_RANK', keyboard_offset = 1
          })}},
        {n=G.UIT.R, nodes = {UIBox_button({colour = G.C.SET.Code, button = 'variable_apply', label = {'APPLY'}, minw = 4.5, focus_args = {snap_to = true}})}},
    }})
    return t
end

function create_UIBox_class(card)
    G.E_MANAGER:add_event(Event({
        blockable = false,
        func = function()
          G.REFRESH_ALERTS = true
        return true
        end
      }))
    local t = create_UIBox_generic_options({no_back = true,
    colour = HEX("04200c"),
    outline_colour = G.C.SECONDARY_SET.Code,
    contents = {
        {n=G.UIT.R, nodes = {create_text_input({
            colour = G.C.SET.Code,
            hooked_colour = darken(copy_table(G.C.SET.Code), 0.3),
            w = 4.5, h = 1, max_length = 16, prompt_text = "ENTER ENHANCEMENT",
            ref_table = G, ref_value = 'ENTERED_ENH', keyboard_offset = 1
          })}},
        {n=G.UIT.R, nodes = {UIBox_button({colour = G.C.SET.Code, button = 'class_apply', label = {'APPLY'}, minw = 4.5, focus_args = {snap_to = true}})}},
    }})
    return t
end

G.FUNCS.variable_apply = function()
    local rank_table = {
        {},
        {'2', 'Two', 'II'},
        {'3', 'Three', 'III'},
        {'4', 'Four', 'IV'},
        {'5', 'Five', 'V'},
        {'6', 'Six', 'VI'},
        {'7', 'Seven', 'VII'},
        {'8', 'Eight', 'VIII'},
        {'9', 'Nine', 'IX'},
        {'10', '1O', 'Ten', 'X', 'T'},
        {'J', 'Jack'},
        {'Q', 'Queen'},
        {'K', 'King'},
        {'A', 'Ace'},
        {'M'},
        {'nil'},
    }

    local rank_suffix = nil

    for i, v in pairs (rank_table) do
        for j, k in pairs (v) do
            if string.lower(G.ENTERED_RANK) == string.lower(k) then
                rank_suffix = i
            end
        end
    end

    if rank_suffix then
        G.GAME.USING_CODE = false
        if rank_suffix == 15 then
            local card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_jolly')
            card:add_to_deck()
            G.jokers:emplace(card)
        elseif rank_suffix == 16 then
            local card = create_card('Code', G.consumeables, nil, nil, nil, nil, 'c_cry_crash')
            card:add_to_deck()
            G.consumeables:emplace(card)
        elseif rank_suffix == 17 then
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                play_sound('tarot1')
                return true end }))
            for i=1, #G.hand.highlighted do
                local percent = 1.15 - (i-0.999)/(#G.hand.highlighted-0.998)*0.3
                G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.highlighted[i]:flip();play_sound('card1', percent);G.hand.highlighted[i]:juice_up(0.3, 0.3);return true end }))
            end
            delay(0.2)
            for i=1, #G.hand.highlighted do
                local CARD = G.hand.highlighted[i]
                local percent = 0.85 + (i-0.999)/(#G.hand.highlighted-0.998)*0.3
                G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() CARD:flip();CARD:set_ability(G.P_CENTERS[pseudorandom_element(G.P_CENTER_POOLS.Consumeables, pseudoseed('cry_variable')).key], true, nil);play_sound('tarot2', percent);CARD:juice_up(0.3, 0.3);return true end }))
            end
        else
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot1')
            return true end }))
        for i=1, #G.hand.highlighted do
            local percent = 1.15 - (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.highlighted[i]:flip();play_sound('card1', percent);G.hand.highlighted[i]:juice_up(0.3, 0.3);return true end }))
        end
        delay(0.2)
        for i=1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
                local card = G.hand.highlighted[i]
                local suit_prefix = string.sub(card.base.suit, 1, 1)..'_'
                local r2suffix = nil
                if rank_suffix < 10 then r2suffix = tostring(rank_suffix)
                elseif rank_suffix == 10 then r2suffix = 'T'
                elseif rank_suffix == 11 then r2suffix = 'J'
                elseif rank_suffix == 12 then r2suffix = 'Q'
                elseif rank_suffix == 13 then r2suffix = 'K'
                elseif rank_suffix == 14 then r2suffix = 'A'
                end
                card:set_base(G.P_CARDS[suit_prefix..r2suffix])
                return true end }))
        end  
        for i=1, #G.hand.highlighted do
            local percent = 0.85 + (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.highlighted[i]:flip();play_sound('tarot2', percent, 0.6);G.hand.highlighted[i]:juice_up(0.3, 0.3);return true end }))
        end
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function() G.hand:unhighlight_all(); return true end }))
        delay(0.5)
        end
        G.CHOOSE_RANK:remove()
    end
end
--todo: mod support
G.FUNCS.class_apply = function()
    local enh_table = {
        m_bonus = {"bonus", "chip", "chips"},
        m_mult = {"mult"},
        m_wild = {"wild"},
        m_glass = {"glass"},
        m_steel = {"steel"},
        m_stone = {"stone"},
        m_gold = {"gold"},
        m_lucky = {"lucky"},
        m_cry_echo = {"echo"},
        ccd = {"ccd"},
        null = {"nil"},
    }

    local enh_suffix = nil

    for i, v in pairs (enh_table) do
        for j, k in pairs (v) do
            if string.lower(G.ENTERED_ENH) == string.lower(k) then
                enh_suffix = i
            end
        end
    end

    if enh_suffix then
        G.GAME.USING_CODE = false
        if enh_suffix == "ccd" then
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                play_sound('tarot1')
                return true end }))
            for i=1, #G.hand.highlighted do
                local percent = 1.15 - (i-0.999)/(#G.hand.highlighted-0.998)*0.3
                G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.highlighted[i]:flip();play_sound('card1', percent);G.hand.highlighted[i]:juice_up(0.3, 0.3);return true end }))
            end
            delay(0.2)
            for i=1, #G.hand.highlighted do
                local CARD = G.hand.highlighted[i]
                local percent = 0.85 + (i-0.999)/(#G.hand.highlighted-0.998)*0.3
                G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() CARD:flip();CARD:set_ability(G.P_CENTERS[pseudorandom_element(G.P_CENTER_POOLS.Consumeables, pseudoseed('cry_class')).key], true, nil);play_sound('tarot2', percent);CARD:juice_up(0.3, 0.3);return true end }))
            end
        elseif enh_suffix == "null" then
            for i=#G.hand.highlighted, 1, -1 do
                local card = G.hand.highlighted[i]
                if card.ability.name == 'Glass Card' then 
                    card:shatter()
                else
                    card:start_dissolve(nil, i == #G.hand.highlighted)
                end
            end
            G.CHOOSE_ENH:remove()
            return
        else
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                play_sound('tarot1')
                return true end }))
            for i=1, #G.hand.highlighted do
                local percent = 1.15 - (i-0.999)/(#G.hand.highlighted-0.998)*0.3
                G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.highlighted[i]:flip();play_sound('card1', percent);G.hand.highlighted[i]:juice_up(0.3, 0.3);return true end }))
            end
            delay(0.2)
            for i=1, #G.hand.highlighted do
                G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function() G.hand.highlighted[i]:set_ability(G.P_CENTERS[enh_suffix]);return true end }))
            end 
            for i=1, #G.hand.highlighted do
                local percent = 0.85 + (i-0.999)/(#G.hand.highlighted-0.998)*0.3
                G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.highlighted[i]:flip();play_sound('tarot2', percent, 0.6);G.hand.highlighted[i]:juice_up(0.3, 0.3);return true end }))
            end
        end
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function() G.hand:unhighlight_all(); return true end }))
        delay(0.5)
        G.CHOOSE_ENH:remove()
    end
end
crash_functions = {
    function()
        --instantly quit the game, no error log
        function love.errorhandler()
        end
        print(crash.crash.crash)
    end,
    function()
        --removes draw loop, you're frozen and can still weirdly interact with the game a bit
        function love.draw()
        end
    end,
    function()
        --by WilsonTheWolf and MathIsFun_, funky error screen with random funny message
        messages = {"Oops.", "Your cards have been TOASTED, extra crispy for your pleasure.", "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
            "What we have here is a certified whoopsidaisy", "Why don't you buy more jonkers? Are you stupid?", "lmao",
            "How about a game of YOU MUST DIE?",
            "Sorry, I was in the bathroom. What'd I mi'Where'd... Where is everyone?",
            "Peter? What are you doing? Cards. WHAT THE FUCK?", "what if it was called freaklatro", "4",
            "I SAWED THIS GAME IN HALF!", "is this rush hour 4", "You missed a semicolon on line 19742, you buffoon",
            "you are an idiot", "You do not recognise the cards in the deck.", ":( Your P", "Assertion failed",
            "Play ULTRAKILL", "Play Nova Drift", "Play Balatro- wait",
            "what if instead of rush hour it was called kush hour and you just smoked a massive blunt",
            "death.fell.accident.water", "Balatro's innards were made outards", "i am going to club yrou",
            "But the biggest joker of them all, it was you all along!", "fission mailed successfully",
            "table index is nil", "index is nil table", "nil is index table", "nildex is in table", "I AM THE TABLE",
            "I'm never going back this casino agai-", "what did you think would happen?",
            "DO THE EARTHQUAKE! [screams]", "fuck you", "Screaming in the casino prank! AAAAAAAAAAAAAAAAAA",
            "https://www.youtube.com/watch?v=dQw4w9WgXcQ", "You musn't tear or crease it.",
            "Sure, but the point is to do it without making a hole.",
            "The end of all things! As was foretold in the prophecy!", "Do it again. It'd be funny", "", ":3",
            "Looks like a skill issue to me.", "it turns out that card was ligma", "YouJustLostTheCasinoGame",
            "Nah fuck off", "attempt to call global your_mom (value too large)", "Killed by intentional game design",
            "attempt to index field 'attempt to call global to_big (too big)' (a nil value)", "what.avi", "The C",
            "Shoulda kept Chicot", "Maybe next time don't do that?", "[recursion]", "://SHART", "It's converging time.",
            "This is the last error message."}
        function corruptString(str)
            -- replace each character with a random valid ascii character
            local newStr = ""
            local len
            if type(str) == "string" then
                len = #str
            else
                len = str
            end
            for i = 1, len do
                -- newStr = newStr .. string.char(math.random(33, 122))
                local c = math.random(33, 122)
                newStr = newStr .. string.char(c)
                if c == 92 then -- backslash
                    newStr = newStr .. string.char(c)
                end
            end
            return newStr
        end

        function getDebugInfoForCrash()
            local info = "Additional Context:\nBalatro Version: " .. VERSION .. "\nModded Version: " .. MODDED_VERSION
            local major, minor, revision, codename = love.getVersion()
            info = info .. "\nLove2D Version: " .. corruptString(string.format("%d.%d.%d", major, minor, revision))

            local lovely_success, lovely = pcall(require, "lovely")
            if lovely_success then
                info = info .. "\nLovely Version: " .. corruptString(lovely.version)
            end
            if SMODS.mod_list then
                info = info .. "\nSteamodded Mods:"
                local enabled_mods = {}
                for _, v in ipairs(SMODS.mod_list) do
                    if v.can_load then
                        table.insert(enabled_mods, v)
                    end
                end
                for k, v in ipairs(enabled_mods) do
                    info =
                        info .. "\n    " .. k .. ": " .. v.name .. " by " .. table.concat(v.author, ", ") .. " [ID: " .. v.id ..
                            (v.priority ~= 0 and (", Priority: " .. v.priority) or "") ..
                            (v.version and v.version ~= '0.0.0' and (", Version: " .. v.version) or "") .. "]"
                    local debugInfo = v.debug_info
                    if debugInfo then
                        if type(debugInfo) == "string" then
                            if #debugInfo ~= 0 then
                                info = info .. "\n        " .. debugInfo
                            end
                        elseif type(debugInfo) == "table" then
                            for kk, vv in pairs(debugInfo) do
                                if type(vv) ~= 'nil' then
                                    vv = tostring(vv)
                                end
                                if #vv ~= 0 then
                                    info = info .. "\n        " .. kk .. ": " .. vv
                                end
                            end
                        end
                    end
                end
            end
            return info
        end

        VERSION = corruptString(VERSION)
        MODDED_VERSION = corruptString(MODDED_VERSION)

        if SMODS.mod_list then
            for i, mod in ipairs(SMODS.mod_list) do
                mod.can_load = true
                mod.name = corruptString(mod.name)
                mod.id = corruptString(mod.id)
                mod.author = {corruptString(20)}
                mod.version = corruptString(mod.version)
                mod.debug_info = corruptString(math.random(5, 100))
            end
        end

        do
            local utf8 = require("utf8")
            local linesize = 100

            -- Modifed from https://love2d.org/wiki/love.errorhandler
            function love.errorhandler(msg)
                msg = tostring(msg)

                if not love.window or not love.graphics or not love.event then
                    return
                end

                if not love.graphics.isCreated() or not love.window.isOpen() then
                    local success, status = pcall(love.window.setMode, 800, 600)
                    if not success or not status then
                        return
                    end
                end

                -- Reset state.
                if love.mouse then
                    love.mouse.setVisible(true)
                    love.mouse.setGrabbed(false)
                    love.mouse.setRelativeMode(false)
                    if love.mouse.isCursorSupported() then
                        love.mouse.setCursor()
                    end
                end
                if love.joystick then
                    -- Stop all joystick vibrations.
                    for i, v in ipairs(love.joystick.getJoysticks()) do
                        v:setVibration()
                    end
                end
                if love.audio then
                    love.audio.stop()
                end

                love.graphics.reset()
                local font = love.graphics.setNewFont("resources/fonts/m6x11plus.ttf", 20)

                local background = {math.random() * 0.3, math.random() * 0.3, math.random() * 0.3}
                love.graphics.clear(background)
                love.graphics.origin()

                local sanitizedmsg = {}
                for char in msg:gmatch(utf8.charpattern) do
                    table.insert(sanitizedmsg, char)
                end
                sanitizedmsg = table.concat(sanitizedmsg)

                local err = {}

                table.insert(err, "Oops! The game crashed:")
                table.insert(err, sanitizedmsg)

                if #sanitizedmsg ~= #msg then
                    table.insert(err, "Invalid UTF-8 string in error message.")
                end

                local success, msg = pcall(getDebugInfoForCrash)
                if success and msg then
                    table.insert(err, '\n' .. msg)
                else
                    table.insert(err, "\n" .. "Failed to get additional context :/")
                end

                local p = table.concat(err, "\n")

                p = p:gsub("\t", "")
                p = p:gsub("%[string \"(.-)\"%]", "%1")

                local scrollOffset = 0
                local endHeight = 0
                love.keyboard.setKeyRepeat(true)

                local function scrollDown(amt)
                    if amt == nil then
                        amt = 18
                    end
                    scrollOffset = scrollOffset + amt
                    if scrollOffset > endHeight then
                        scrollOffset = endHeight
                    end
                end

                local function scrollUp(amt)
                    if amt == nil then
                        amt = 18
                    end
                    scrollOffset = scrollOffset - amt
                    if scrollOffset < 0 then
                        scrollOffset = 0
                    end
                end

                local pos = 70
                local arrowSize = 20

                local function calcEndHeight()
                    local font = love.graphics.getFont()
                    local rw, lines = font:getWrap(p, love.graphics.getWidth() - pos * 2)
                    local lineHeight = font:getHeight()
                    local atBottom = scrollOffset == endHeight and scrollOffset ~= 0
                    endHeight = #lines * lineHeight - love.graphics.getHeight() + pos * 2
                    if (endHeight < 0) then
                        endHeight = 0
                    end
                    if scrollOffset > endHeight or atBottom then
                        scrollOffset = endHeight
                    end
                end

                local function draw()
                    if not love.graphics.isActive() then
                        return
                    end
                    love.graphics.clear(background)
                    calcEndHeight()
                    local time = love.timer.getTime()
                    if not G.SETTINGS.reduced_motion then
                        background = {math.random() * 0.3, math.random() * 0.3, math.random() * 0.3}
                        p = p .. "\n" .. corruptString(math.random(linesize - linesize / 2, linesize + linesize * 2))
                        linesize = linesize + linesize / 25
                    end
                    love.graphics.printf(p, pos, pos - scrollOffset, love.graphics.getWidth() - pos * 2)
                    if scrollOffset ~= endHeight then
                        love.graphics.polygon("fill", love.graphics.getWidth() - (pos / 2),
                            love.graphics.getHeight() - arrowSize, love.graphics.getWidth() - (pos / 2) + arrowSize,
                            love.graphics.getHeight() - (arrowSize * 2), love.graphics.getWidth() - (pos / 2) - arrowSize,
                            love.graphics.getHeight() - (arrowSize * 2))
                    end
                    if scrollOffset ~= 0 then
                        love.graphics.polygon("fill", love.graphics.getWidth() - (pos / 2), arrowSize,
                            love.graphics.getWidth() - (pos / 2) + arrowSize, arrowSize * 2,
                            love.graphics.getWidth() - (pos / 2) - arrowSize, arrowSize * 2)
                    end
                    love.graphics.present()
                end

                local fullErrorText = p
                local function copyToClipboard()
                    if not love.system then
                        return
                    end
                    love.system.setClipboardText(fullErrorText)
                    p = p .. "\nCopied to clipboard!"
                end

                if G then
                    -- Kill threads (makes restarting possible)
                    if G.SOUND_MANAGER and G.SOUND_MANAGER.channel then
                        G.SOUND_MANAGER.channel:push({
                            type = 'kill'
                        })
                    end
                    if G.SAVE_MANAGER and G.SAVE_MANAGER.channel then
                        G.SAVE_MANAGER.channel:push({
                            type = 'kill'
                        })
                    end
                    if G.HTTP_MANAGER and G.HTTP_MANAGER.channel then
                        G.HTTP_MANAGER.channel:push({
                            type = 'kill'
                        })
                    end
                end

                return function()
                    love.event.pump()

                    for e, a, b, c in love.event.poll() do
                        if e == "quit" then
                            return 1
                        elseif e == "keypressed" and a == "escape" then
                            return 1
                        elseif e == "keypressed" and a == "c" and love.keyboard.isDown("lctrl", "rctrl") then
                            copyToClipboard()
                        elseif e == "keypressed" and a == "r" then
                            return "restart"
                        elseif e == "keypressed" and a == "down" then
                            scrollDown()
                        elseif e == "keypressed" and a == "up" then
                            scrollUp()
                        elseif e == "keypressed" and a == "pagedown" then
                            scrollDown(love.graphics.getHeight())
                        elseif e == "keypressed" and a == "pageup" then
                            scrollUp(love.graphics.getHeight())
                        elseif e == "keypressed" and a == "home" then
                            scrollOffset = 0
                        elseif e == "keypressed" and a == "end" then
                            scrollOffset = endHeight
                        elseif e == "wheelmoved" then
                            scrollUp(b * 20)
                        elseif e == "gamepadpressed" and b == "dpdown" then
                            scrollDown()
                        elseif e == "gamepadpressed" and b == "dpup" then
                            scrollUp()
                        elseif e == "gamepadpressed" and b == "a" then
                            return "restart"
                        elseif e == "gamepadpressed" and b == "x" then
                            copyToClipboard()
                        elseif e == "gamepadpressed" and (b == "b" or b == "back" or b == "start") then
                            return 1
                        elseif e == "touchpressed" then
                            local name = love.window.getTitle()
                            if #name == 0 or name == "Untitled" then
                                name = "Game"
                            end
                            local buttons = {"OK", "Cancel", "Restart"}
                            if love.system then
                                buttons[4] = "Copy to clipboard"
                            end
                            local pressed = love.window.showMessageBox("Quit " .. name .. "?", "", buttons)
                            if pressed == 1 then
                                return 1
                            elseif pressed == 3 then
                                return "restart"
                            elseif pressed == 4 then
                                copyToClipboard()
                            end
                        end
                    end

                    draw()

                    if love.timer then
                        love.timer.sleep(0.1)
                    end
                end

            end
        end

        load('error(messages[math.random(1, #messages)])', corruptString(30), "t")()

    end,
    function()
        --fills screen with Crash cards
        glitched_intensity = 100
        G.SETTINGS.GRAPHICS.crt = 101
        G.E_MANAGER:add_event(Event({trigger = 'immediate', blockable = false, no_delete = true,
        func = function()
            local c = create_card('Code', nil, nil, nil, nil, nil, 'c_cry_crash')
            c.T.x = math.random(-G.CARD_W,G.TILE_W)
            c.T.y = math.random(-G.CARD_H,G.TILE_H)
            return false; end}),"other")
    end,
    function()
        -- Fake lovely panic
        love.window.showMessageBox("lovely-injector", "lovely-injector has crashed:\npanicked at crates/lovely-core/src/lib.rs:420:69:\nFailed to parse patch at \"C:\\\\users\\\\jimbo\\\\AppData\\\\Roaming\\\\Balatro\\\\Mods\\\\Cryptid\\\\lovely.toml\":\nError { inner: TomlError { message: \"expected `.`, `=`\", original: Some(\""
        .."\"According to all known laws of aviation, there is no way a bee should be able to fly.\\nIts wings are too small to get its fat little body off the ground.\\nThe bee, of course, flies anyway because bees don't care what humans think is impossible.\\nYellow, black. Yellow, black. Yellow, black. Yellow, black.\\nOoh, black and yellow!\\nLet's shake it up a little.\\nBarry! Breakfast is ready!\\nComing!\\nHang on a second.\\nHello?\\nBarry?\\nAdam?\\nCan you believe this is happening?\\nI can't.\\nI'll pick you up.\\nLooking sharp.\\nUse the stairs, Your father paid good money for those.\\nSorry. I'm excited.\\nHere's the graduate.\\nWe're very proud of you, son.\\nA perfect report card, all B's.\\nVery proud.\\nMa! I got a thing going here.\\nYou got lint on your fuzz.\\nOw! That's me!\\nWave to us! We'll be in row 118,000.\\nBye!\\nBarry, I told you, stop flying in the house!\\nHey, Adam.\\nHey, Barry.\\nIs that fuzz gel?\\nA little. Special day, graduation.\\nNever thought I'd make it.\\nThree days grade school, three days high school.\\nThose were awkward.\\nThree days college. I'm glad I took a day and hitchhiked around The Hive.\\nYou did come back different.\\nHi, Barry. Artie, growing a mustache? Looks good.\\nHear about Frankie?\\nYeah.\\nYou going to the funeral?\\nNo, I'm not going.\\nEverybody knows, sting someone, you die.\\nDon't waste it on a squirrel.\\nSuch a hothead.\\nI guess he could have just gotten out of the way.\\nI love this incorporating an amusement park into our day.\\nThat's why we don't need vacations.\\nBoy, quite a bit of pomp under the circumstances.\\nWell, Adam, today we are men.\\nWe are!\\nBee-men.\\nAmen!\\nHallelujah!\\nStudents, faculty, distinguished bees,\\nplease welcome Dean Buzzwell.\\nWelcome, New Hive City graduating class of 9:15.\\nThat concludes our ceremonies And begins your career at Honex Industries!\\nWill we pick our job today?\\nI heard it's just orientation.\\nHeads up! Here we go.\\nKeep your hands and antennas inside the tram at all times.\\nWonder what it'll be like?\\nA little scary.\\nWelcome to Honex, a division of Honesco and a part of the Hexagon Group.\\nThis is it!\\nWow.\\nWow.\\nWe know that you, as a bee, have worked your whole life to get to the point where you can work for your whole life.\\nHoney begins when our valiant Pollen Jocks bring the nectar to The Hive.\\nOur top-secret formula is automatically color-corrected, scent-adjusted and bubble-contoured into this soothing sweet syrup with its distinctive golden glow you know as... Honey!\\nThat girl was hot.\\nShe's my cousin!\\nShe is?\\nYes, we're all cousins.\\nRight. You're right.\\nAt Honex, we constantly strive to improve every aspect of bee existence.\\nThese bees are stress-testing a new helmet technology.\\nWhat do you think he makes?\\nNot enough.\\nHere we have our latest advancement, the Krelman.\\nWhat does that do?\\nCatches that little strand of honey that hangs after you pour it.\\nSaves us millions.\\nCan anyone work on the Krelman?\\nOf course. Most bee jobs are small ones.\\nBut bees know that every small job, if it's done well, means a lot.\\nBut choose carefully because you'll stay in the job you pick for the rest of your life.\\nThe same job the rest of your life? I didn't know that.\\nWhat's the difference?\\nYou'll be happy to know that bees, as a species, haven't had one day off in 27 million years.\\nSo you'll just work us to death?\\nWe'll sure try.\\nWow! That blew my mind!\\n\\\"What's the difference?\\\"\\nHow can you say that?\\nOne job forever?\\nThat's an insane choice to have to make.\\nI'm relieved. Now we only have to make one decision in life.\\nBut, Adam, how could they never have told us that?\\nWhy would you question anything? We're bees.\\nWe're the most perfectly functioning society on Earth.\\nYou ever think maybe things work a little too well here?\\nLike what? Give me one example.\\nI don't know. But you know what I'm talking about.\\nPlease clear the gate. Royal Nectar Force on approach.\\nWait a second. Check it out.\\nHey, those are Pollen Jocks!\\nWow.\\nI've never seen them this close.\\nThey know what it's like outside The Hive.\\nYeah, but some don't come back.\\nHey, Jocks!\\nHi, Jocks!\\nYou guys did great!\\nYou're monsters!\\nYou're sky freaks! I love it! I love it!\\nI wonder where they were.\\nI don't know.\\nTheir day's not planned.\\nOutside The Hive, flying who knows where, doing who knows what.\\nYou can't just decide to be a Pollen Jock. You have to be bred for that.\\nRight.\\nLook. That's more pollen than you and I will see in a lifetime.\\nIt's just a status symbol.\\nBees make too much of it.\\nPerhaps. Unless you're wearing it and the ladies see you wearing it.\\nThose ladies?\\nAren't they our cousins too?\\nDistant. Distant.\\nLook at these two.\\nCouple of Hive Harrys.\\nLet's have fun with them.\\nIt must be dangerous being a Pollen Jock.\\nYeah. Once a bear pinned me against a mushroom!\\nHe had a paw on my throat, and with the other, he was slapping me!\\nOh, my!\\nI never thought I'd knock him out.\\nWhat were you doing during this?\\nTrying to alert the authorities.\\nI can autograph that.\\nA little gusty out there today, wasn't it, comrades?\\nYeah. Gusty.\\nWe're hitting a sunflower patch six miles from here tomorrow.\\nSix miles, huh?\\nBarry!\\nA puddle jump for us, but maybe you're not up for it.\\nMaybe I am.\\nYou are not!\\nWe're going 0900 at J-Gate.\\nWhat do you think, buzzy-boy?\\nAre you bee enough?\\nI might be. It all depends on what 0900 means.\\nHey, Honex!\\nDad, you surprised me.\\nYou decide what you're interested in?\\nWell, there's a lot of choices.\\nBut you only get one.\\nDo you ever get bored doing the same job every day?\\nSon, let me tell you about stirring.\\nYou grab that stick, and you just move it around, and you stir it around.\\nYou get yourself into a rhythm.\\nIt's a beautiful thing.\\nYou know, Dad, the more I think about it,\\nmaybe the honey field just isn't right for me.\\nYou were thinking of what, making balloon animals?\\nThat's a bad job for a guy with a stinger.\\nJanet, your son's not sure he wants to go into honey!\\nBarry, you are so funny sometimes.\\nI'm not trying to be funny.\\nYou're not funny! You're going into honey. Our son, the stirrer!\\nYou're gonna be a stirrer?\\nNo one's listening to me!\\nWait till you see the sticks I have.\\nI could say anything right now.\\nI'm gonna get an ant tattoo!\\nLet's open some honey and celebrate!\\nMaybe I'll pierce my thorax. Shave my antennae. Shack up with a grasshopper. Get a gold tooth and call everybody \\\"dawg\\\"!\\nI'm so proud.\\nWe're starting work today!\\nToday's the day.\\nCome on! All the good jobs will be gone.\\nYeah, right.\\nPollen counting, stunt bee, pouring, stirrer, front desk, hair removal...\\nIs it still available?\\nHang on. Two left!\\nOne of them's yours! Congratulations!\\nStep to the side.\\nWhat'd you get?\\nPicking crud out. Stellar!\\nWow!\\nCouple of newbies?\\nYes, sir! Our first day! We are ready!\\nMake your choice.\\nYou want to go first?\\nNo, you go.\\nOh, my. What's available?\\nRestroom attendant's open, not for the reason you think.\\nAny chance of getting the Krelman?\\nSure, you're on.\\nI'm sorry, the Krelman just closed out.\\nWax monkey's always open.\\nThe Krelman opened up again.\\nWhat happened?\\nA bee died. Makes an opening. See? He's dead. Another dead one.\\nDeady. Deadified. Two more dead.\\nDead from the neck up. Dead from the neck down. That's life!\\nOh, this is so hard!\\nHeating, cooling, stunt bee, pourer, stirrer, humming, inspector number seven, lint coordinator, stripe supervisor, mite wrangler.\\nBarry, what do you think I should... Barry?\\nBarry!\\nAll right, we've got the sunflower patch in quadrant nine...\\nWhat happened to you?\\nWhere are you?\\nI'm going out.\\nOut? Out where?\\nOut there.\\nOh, no!\\nI have to, before I go to work for the rest of my life.\\nYou're gonna die! You're crazy! Hello?\\nAnother call coming in.\\nIf anyone's feeling brave, there's a Korean deli on 83rd that gets their roses today.\\nHey, guys.\\nLook at that.\\nIsn't that the kid we saw yesterday?\\nHold it, son, flight deck's restricted.\\nIt's OK, Lou. We're gonna take him up.\\nReally? Feeling lucky, are you?\\nSign here, here. Just initial that.\\nThank you.\\nOK.\\nYou got a rain advisory today, and as you all know, bees cannot fly in rain.\\nSo be careful. As always, watch your brooms, hockey sticks, dogs, birds, bears and bats.\\nAlso, I got a couple of reports of root beer being poured on us.\\nMurphy's in a home because of it, babbling like a cicada!\\nThat's awful.\\nAnd a reminder for you rookies, bee law number one, absolutely no talking to humans!\\n All right, launch positions!\\nBuzz, buzz, buzz, buzz! Buzz, buzz, buzz, buzz! Buzz, buzz, buzz, buzz!\\nBlack and yellow!\\nHello!\\nYou ready for this, hot shot?\\nYeah. Yeah, bring it on.\\nWind, check.\\nAntennae, check.\\nNectar pack, check.\\nWings, check.\\nStinger, check.\\nScared out of my shorts, check.\\nOK, ladies,\\nlet's move it out!\\nPound those petunias, you striped stem-suckers!\\nAll of you, drain those flowers!\\nWow! I'm out!\\nI can't believe I'm out!\\nSo blue.\\nI feel so fast and free!\\nBox kite!\\nWow!\\nFlowers!\\nThis is Blue Leader, We have roses visual.\\nBring it around 30 degrees and hold.\\nRoses!\\n30 degrees, roger. Bringing it around.\\nStand to the side, kid.\\nIt's got a bit of a kick.\\nThat is one nectar collector!\\nEver see pollination up close?\\nNo, sir.\\nI pick up some pollen here, sprinkle it over here. Maybe a dash over there, a pinch on that one.\\nSee that? It's a little bit of magic.\\nThat's amazing. Why do we do that?\\nThat's pollen power. More pollen, more flowers, more nectar, more honey for us.\\nCool.\\nI'm picking up a lot of bright yellow, Could be daisies, Don't we need those?\\nCopy that visual.\\nWait. One of these flowers seems to be on the move.\\nSay again? You're reporting a moving flower?\\nAffirmative.\\nThat was on the line!\\nThis is the coolest. What is it?\\nI don't know, but I'm loving this color.\\nIt smells good.\\nNot like a flower, but I like it.\\nYeah, fuzzy.\\nChemical-y.\\nCareful, guys. It's a little grabby.\\nMy sweet lord of bees!\\nCandy-brain, get off there!\\nProblem!\\nGuys!\\nThis could be bad.\\nAffirmative.\\nVery close.\\nGonna hurt.\\nMama's little boy.\\nYou are way out of position, rookie!\\nComing in at you like a missile!\\nHelp me!\\nI don't think these are flowers.\\nShould we tell him?\\nI think he knows.\\nWhat is this?!\\nMatch point!\\nYou can start packing up, honey, because you're about to eat it!\\nYowser!\\nGross.\\nThere's a bee in the car!\\nDo something!\\nI'm driving!\\nHi, bee.\\nHe's back here!\\nHe's going to sting me!\\nNobody move. If you don't move, he won't sting you. Freeze!\\nHe blinked!\\nSpray him, Granny!\\nWhat are you doing?!\\nWow... the tension level out here is unbelievable.\\nI gotta get home.\\nCan't fly in rain. Can't fly in rain. Can't fly in rain.\\nMayday! Mayday! Bee going down!\\nKen, could you close the window please?\\nKen, could you close the window please?\\nCheck out my new resume. I made it into a fold-out brochure. You see? Folds out.\\nOh, no. More humans. I don't need this.\\nWhat was that?\\nMaybe this time. This time. This time. This time! This time! This... Drapes!\\nThat is diabolical.\\nIt's fantastic. It's got all my special skills, even my top-ten favorite movies.\\nWhat's number one? Star Wars?\\nNah, I don't go for that... kind of stuff.\\nNo wonder we shouldn't talk to them. They're out of their minds.\\nWhen I leave a job interview, they're flabbergasted, can't believe what I say.\\nThere's the sun. Maybe that's a way out.\\nI don't remember the sun having a big 75 on it.\\nI predicted global warming. I could feel it getting hotter. At first I thought it was just me.\\nWait! Stop! Bee!\\nStand back. These are winter boots.\\nWait!\\nDon't kill him!\\nYou know I'm allergic to them! This thing could kill me!\\nWhy does his life have less value than yours?\\nWhy does his life have any less value than mine? Is that your statement?\\nI'm just saying all life has value. You don't know what he's capable of feeling.\\nMy brochure!\\nThere you go, little guy.\\nI'm not scared of him.It's an allergic thing.\\n Put that on your resume brochure.\\nMy whole face could puff up.\\nMake it one of your special skills.\\nKnocking someone out is also a special skill.\\nRight. Bye, Vanessa. Thanks.\\nVanessa, next week? Yogurt night?\\nSure, Ken. You know, whatever.\\nYou could put carob chips on there.\\nBye.\\nSupposed to be less calories.\\nBye.\\nI gotta say something. She saved my life. I gotta say something.\\nAll right, here it goes.\\nNah.\\nWhat would I say?\\nI could really get in trouble. It's a bee law. You're not supposed to talk to a human.\\nI can't believe I'm doing this. I've got to.\\nOh, I can't do it. Come on!\\nNo. Yes. No. Do it. I can't.\\nHow should I start it? \\\"You like jazz?\\\" No, that's no good.\\nHere she comes! Speak, you fool!\\nHi!\\nI'm sorry. You're talking.\\nYes, I know.\\nYou're talking!\\nI'm so sorry.\\nNo, it's OK. It's fine.\\nI know I'm dreaming. But I don't recall going to bed.\\nWell, I'm sure this is very disconcerting.\\nThis is a bit of a surprise to me. I mean, you're a bee!\\nI am. And I'm not supposed to be doing this, but they were all trying to kill me.\\nAnd if it wasn't for you... I had to thank you. It's just how I was raised.\\nThat was a little weird. I'm talking with a bee.\\nYeah.\\nI'm talking to a bee. And the bee is talking to me!\\nI just want to say I'm grateful.\\nI'll leave now.\\nWait! How did you learn to do that?\\nWhat?\\nThe talking thing.\\nSame way you did, I guess. \\\"Mama, Dada, honey.\\\" You pick it up.\\nThat's very funny.\\nYeah.\\nBees are funny. If we didn't laugh, we'd cry with what we have to deal with.\\nAnyway... Can I... get you something?\\nLike what?\\nI don't know. I mean... I don't know. Coffee?\\nI don't want to put you out.\\nIt's no trouble. It takes two minutes.\\nIt's just coffee.\\nI hate to impose.\\nDon't be ridiculous!\\nActually, I would love a cup.\\nHey, you want rum cake?\\nI shouldn't.\\nHave some.\\nNo, I can't.\\nCome on!\\nI'm trying to lose a couple micrograms.\\nWhere?\\nThese stripes don't help.\\nYou look great!\\nI don't know if you know anything about fashion.\\nAre you all right?\\nNo.\\nHe's making the tie in the cab as they're flying up Madison.\\nHe finally gets there.\\nHe runs up the steps into the church.\\nThe wedding is on.\\nAnd he says, \\\"Watermelon?\\nI thought you said Guatemalan.\\nWhy would I marry a watermelon?\\\"\\nIs that a bee joke?\\nThat's the kind of stuff we do.\\nYeah, different.\\nSo, what are you gonna do, Barry?\\nAbout work? I don't know.\\nI want to do my part for The Hive, but I can't do it the way they want.\\nI know how you feel.\\nYou do?\\nSure.\\nMy parents wanted me to be a lawyer or a doctor, but I wanted to be a florist.\\nReally?\\nMy only interest is flowers.\\nOur new queen was just elected with that same campaign slogan.\\nAnyway, if you look... There's my hive right there. See it?\\nYou're in Sheep Meadow!\\nYes! I'm right off the Turtle Pond!\\nNo way! I know that area. I lost a toe ring there once.\\nWhy do girls put rings on their toes?\\nWhy not?\\nIt's like putting a hat on your knee.\\nMaybe I'll try that.\\nYou all right, ma'am?\\nOh, yeah. Fine.\\nJust having two cups of coffee!\\nAnyway, this has been great.\\nThanks for the coffee.\\nYeah, it's no trouble.\\nSorry I couldn't finish it. If I did, I'd be up the rest of my life.\\nAre you...?\\nCan I take a piece of this with me?\\nSure! Here, have a crumb.\\nThanks!\\nYeah.\\nAll right. Well, then... I guess I'll see you around. Or not.\\nOK, Barry.\\nAnd thank you so much again... for before.\\nOh, that? That was nothing.\\nWell, not nothing, but... Anyway...\\nThis can't possibly work.\\nHe's all set to go.\\nWe may as well try it.\\nOK, Dave, pull the chute.\\nSounds amazing.\\nIt was amazing!\\nIt was the scariest, happiest moment of my life.\\nHumans! I can't believe you were with humans!\\nGiant, scary humans!\\nWhat were they like?\\nHuge and crazy. They talk crazy.\\nThey eat crazy giant things.\\nThey drive crazy.\\nDo they try and kill you, like on TV?\\nSome of them. But some of them don't.\\nHow'd you get back?\\nPoodle.\\nYou did it, and I'm glad. You saw whatever you wanted to see.\\nYou had your \\\"experience.\\\" Now you can pick out yourjob and be normal.\\nWell...\\nWell?\\nWell, I met someone.\\nYou did? Was she Bee-ish?\\nA wasp?! Your parents will kill you!\\nNo, no, no, not a wasp.\\nSpider?\\nI'm not attracted to spiders.\\nI know it's the hottest thing, with the eight legs and all. I can't get by that face.\\nSo who is she?\\nShe's... human.\\nNo, no. That's a bee law. You wouldn't break a bee law.\\nHer name's Vanessa.\\nOh, boy.\\nShe's so nice. And she's a florist!\\nOh, no! You're dating a human florist!\\nWe're not dating.\\nYou're flying outside The Hive, talking to humans that attack our homes with power washers and M-80s! One-eighth a stick of dynamite!\\nShe saved my life! And she understands me.\\nThis is over!\\nEat this.\\nThis is not over! What was that?\\nThey call it a crumb.\\nIt was so stingin' stripey!\\nAnd that's not what they eat.\\nThat's what falls off what they eat!\\nYou know what a Cinnabon is?\\nNo.\\nIt's bread and cinnamon and frosting. They heat it up...\\nSit down!\\n...really hot!\\nListen to me!\\nWe are not them! We're us.\\nThere's us and there's them!\\n\"), keys: [], span: Some(10..11)}}}"
, "error")
        love.window.showMessageBox("lovely-injector", "lovely-injector has crashed:\npanicked at library/cors/src/panicking.rs:221:5:\npanic in a function that cannot unwind", "error")

        function love.errorhandler()
        end
        print(crash.crash.crash)
    end
}

--for testing
-- crash_functions = {crash_functions[#crash_functions]}
-- crash_functions[1]()



local code_cards = {code, code_atlas, pack_atlas, pack1, pack2, packJ, packM, console, automaton, payload, reboot, revert, crash, semicolon, malware, seed, variable, class}
return {name = "Code Cards",
        init = function()
            --allow Program Packs to let you keep the cards
            local G_UIDEF_use_and_sell_buttons_ref=G.UIDEF.use_and_sell_buttons
            function G.UIDEF.use_and_sell_buttons(card)
                if (card.area == G.pack_cards and G.pack_cards) and card.ability.consumeable then --Add a use button
                    if card.ability.set == "Code" then
                        return {
                            n=G.UIT.ROOT, config = {padding = -0.1,  colour = G.C.CLEAR}, nodes={
                            {n=G.UIT.R, config={ref_table = card, r = 0.08, padding = 0.1, align = "bm", minw = 0.5*card.T.w - 0.15, minh = 0.7*card.T.h, maxw = 0.7*card.T.w - 0.15, hover = true, shadow = true, colour = G.C.UI.BACKGROUND_INACTIVE, one_press = true, button = 'use_card', func = 'can_reserve_card'}, nodes={
                                {n=G.UIT.T, config={text = "RESERVE",colour = G.C.UI.TEXT_LIGHT, scale = 0.55, shadow = true}}
                            }},
                            {n=G.UIT.R, config={ref_table = card, r = 0.08, padding = 0.1, align = "bm", minw = 0.5*card.T.w - 0.15, maxw = 0.9*card.T.w - 0.15, minh = 0.1*card.T.h, hover = true, shadow = true, colour = G.C.UI.BACKGROUND_INACTIVE, one_press = true, button = 'Do you know that this parameter does nothing?', func = 'can_use_consumeable'}, nodes={
                                {n=G.UIT.T, config={text = localize('b_use'),colour = G.C.UI.TEXT_LIGHT, scale = 0.45, shadow = true}}
                            }},
                            {n=G.UIT.R, config = {align = "bm", w=7.7*card.T.w}},
                            {n=G.UIT.R, config = {align = "bm", w=7.7*card.T.w}},
                            {n=G.UIT.R, config = {align = "bm", w=7.7*card.T.w}},
                            {n=G.UIT.R, config = {align = "bm", w=7.7*card.T.w}},
                            -- Betmma can't explain it, neither can I
                        }}
                    end
                end
                return G_UIDEF_use_and_sell_buttons_ref(card)
            end
            --Code from Betmma's Vouchers
            G.FUNCS.can_reserve_card = function(e)
                if #G.consumeables.cards < G.consumeables.config.card_limit then
                    e.config.colour = G.C.GREEN
                    e.config.button = 'reserve_card'
                else
                  e.config.colour = G.C.UI.BACKGROUND_INACTIVE
                  e.config.button = nil
                end
            end
            G.FUNCS.reserve_card = function(e)
                local c1 = e.config.ref_table
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                    c1.area:remove_card(c1)
                    c1:add_to_deck()
                    if c1.children.price then c1.children.price:remove() end
                    c1.children.price = nil
                    if c1.children.buy_button then c1.children.buy_button:remove() end
                    c1.children.buy_button = nil
                    remove_nils(c1.children)
                    G.consumeables:emplace(c1)
                    G.GAME.pack_choices = G.GAME.pack_choices - 1
                    if G.GAME.pack_choices <= 0 then
                        G.FUNCS.end_consumeable(nil, delay_fac)
                    end
                    return true
                    end
                }))
            end
            --Revert
            local sr = save_run
            function save_run()
                if G.GAME.round_resets.ante ~= G.GAME.cry_revert_ante then
                    G.GAME.cry_revert_ante = G.GAME.round_resets.ante
                    G.GAME.cry_revert = nil
                    sr()
                    G.GAME.cry_revert = STR_PACK(G.culled_table)
                    sr()
                end
                sr()
            end
            --Semicolon - don't evaluate round
            local gfer = G.FUNCS.evaluate_round
            function G.FUNCS.evaluate_round()
                if G.GAME.current_round.semicolon then
                    add_round_eval_row({dollars = 0, name='blind1', pitch = 0.95, saved = true})
                    G.E_MANAGER:add_event(Event({
                        trigger = 'before',
                        delay = 1.3*math.min(G.GAME.blind.dollars+2, 7)/2*0.15 + 0.5,
                        func = function()
                        G.GAME.blind:defeat()
                        return true
                        end
                    }))
                    delay(0.2)
                    add_round_eval_row({name = 'bottom', dollars = 0})
                else
                    return gfer()
                end
            end
        end,
        items = code_cards}
