--extra blind functions for use by bosses
function Blind:cry_ante_base_mod(dt)
    if not self.disabled then
        local obj = self.config.blind
        if obj.cry_ante_base_mod and type(obj.cry_ante_base_mod) == 'function' then
            return obj:cry_ante_base_mod(self, dt)
        end
    end
    return 0
end
function Blind:cry_cap_score(score)
    if not self.disabled then
        local obj = self.config.blind
        if obj.cry_cap_score and type(obj.cry_cap_score) == 'function' then
            return obj:cry_cap_score(self, score)
        end
    end
    return score
end
function Blind:cry_after_play()
    if not self.disabled then
        local obj = self.config.blind
        if obj.cry_after_play and type(obj.cry_after_play) == 'function' then
            return obj:cry_after_play(self)
        end
    end
end
function Blind:cry_before_play()
    if not self.disabled then
        local obj = self.config.blind
        if obj.cry_before_play and type(obj.cry_before_play) == 'function' then
            return obj:cry_before_play(self)
        end
    end
end

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
    discovered = true,
    boss_colour = HEX('40ff40'),
    cry_cap_score = function(self, blind, score)
        return math.floor(math.min(0.4*blind.chips,score)+0.5)
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
    discovered = true,
    boss_colour = HEX('853455'),
    defeat = function(self, blind, silent)
        G.P_BLINDS.bl_cry_clock.mult = 0
    end,
    disable = function(self, blind, silent)
        G.GAME.blind.chips = get_blind_amount(G.GAME.round_resets.ante)*G.GAME.starting_params.ante_scaling*2
        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
    end,
    cry_ante_base_mod = function(self, blind, dt)
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
    discovered = true,
    boss_colour = HEX('babd24'),
    cry_after_play = function(self, blind)
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
            "set ante to multiple of 8"
        }
    },
    atlas = "blinds",
    discovered = true,
    boss_colour = HEX('00ffaa')
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
    discovered = true,
    boss_colour = HEX('ae00ff'),
    disable = function(self, blind, silent)
        G.GAME.blind.chips = get_blind_amount(G.GAME.round_resets.ante)*G.GAME.starting_params.ante_scaling*2
        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
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
    discovered = true,
    boss_colour = HEX('f65d34'),
    drawn_to_hand = function(self, blind)
        if G.jokers.cards[1] then
            local idx = pseudorandom(pseudoseed('cry_vermillion_virus'),1,#G.jokers.cards)
            if G.jokers.cards[idx] then
                _card = create_card('Joker', G.jokers, nil, 0, nil, nil, nil, 'cry_vermillion_virus_gen')
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
    discovered = true,
    boss_colour = HEX('4057d6'),
    cry_before_play = function(self, blind)
        local idx = pseudorandom(pseudoseed("cry_sapphire_stamp"), 1, #G.hand.highlighted)
        G.hand:remove_from_highlighted(G.hand.highlighted[idx])
    end,
    set_blind = function(self, blind, reset, silent)
        if not reset then
            G.hand.config.highlighted_limit = G.hand.config.highlighted_limit + 1
        end
    end,
    defeat = function(self, blind, silent)
        G.hand.config.highlighted_limit = G.hand.config.highlighted_limit - 1
    end,
    disable = function(self, blind, silent)
        G.hand.config.highlighted_limit = G.hand.config.highlighted_limit - 1
    end,
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

return {name = "Blinds", 
        init = function()
            --Clock Patches
            local upd = Game.update
            function Game:update(dt)
                upd(self,dt)
                if G.GAME and G.GAME.round_resets and G.GAME.round_resets.blind_choices and G.GAME.round_resets.blind_choices.Boss and G.P_BLINDS[G.GAME.round_resets.blind_choices.Boss].cry_ante_base_mod then
                    if G.P_BLINDS[G.GAME.round_resets.blind_choices.Boss].mult ~= 0 and G.P_BLINDS[G.GAME.round_resets.blind_choices.Boss].mult_ante ~= G.GAME.round_resets.ante then 
                        G.P_BLINDS[G.GAME.round_resets.blind_choices.Boss].mult = 0
                        G.P_BLINDS[G.GAME.round_resets.blind_choices.Boss].mult_ante = G.GAME.round_resets.ante
                    end
                    if G.GAME.round_resets.blind_states.Boss ~= "Current" then
                        G.P_BLINDS[G.GAME.round_resets.blind_choices.Boss].mult = G.P_BLINDS[G.GAME.round_resets.blind_choices.Boss].mult + G.P_BLINDS[G.GAME.round_resets.blind_choices.Boss]:cry_ante_base_mod(nil, dt)
                        --Update UI
                        if G.blind_select_opts then
                            local blind_UI = G.blind_select_opts.boss.definition.nodes[1].nodes[1].nodes[1].nodes[1]
                            local chip_text_node = blind_UI.nodes[1].nodes[3].nodes[1].nodes[2].nodes[2].nodes[3]
                            chip_text_node.config.text = number_format(get_blind_amount(G.GAME.round_resets.blind_ante)*G.GAME.starting_params.ante_scaling*G.P_BLINDS.bl_cry_clock.mult)
                            chip_text_node.config.scale = score_number_scale(0.9, get_blind_amount(G.GAME.round_resets.blind_ante)*G.GAME.starting_params.ante_scaling*G.P_BLINDS.bl_cry_clock.mult)
                            G.blind_select_opts.boss:recalculate()
                        end
                    elseif not G.GAME.blind.disabled and to_big(G.GAME.chips) < to_big(G.GAME.blind.chips) then
                        G.GAME.blind.chips = G.GAME.blind.chips + G.GAME.blind:cry_ante_base_mod(dt)*get_blind_amount(G.GAME.round_resets.blind_ante)*G.GAME.starting_params.ante_scaling
                        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                    end
                end
                if G.GAME and G.GAME.blind and not G.GAME.blind.disabled and G.GAME.blind.name == "cry-Lavender Loop" and to_big(G.GAME.chips) < to_big(G.GAME.blind.chips) then
                    G.GAME.blind.chips = G.GAME.blind.chips * 1.25^(dt/1.5)
                    G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
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
        end,
        items = {tax, clock, trick, joke, lavender_loop, vermillion_virus, sapphire_stamp, blind_sprites}}