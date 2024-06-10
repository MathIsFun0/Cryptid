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
    boss_colour = HEX('40ff40')
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
        G.GAME.boss_dt = nil
        G.P_BLINDS.bl_cry_clock.mult = 0
    end,
    disable = function(self, blind, silent)
        G.GAME.blind.chips = get_blind_amount(G.GAME.round_resets.ante)*G.GAME.starting_params.ante_scaling*2
        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
    end
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
    defeat = function(self, blind, silent)
        G.GAME.boss_dt = 0
    end,
    disable = function(self, blind, silent)
        G.GAME.blind.chips = get_blind_amount(G.GAME.round_resets.ante)*G.GAME.starting_params.ante_scaling*2
        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
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

return {name = "Blinds", 
        init = function()
            --Clock Patches
            local upd = Game.update
            function Game:update(dt)
                upd(self,dt)
                if G.GAME and G.GAME.round_resets and G.GAME.round_resets.blind_choices and G.GAME.round_resets.blind_choices.Boss and G.GAME.round_resets.blind_choices.Boss == "bl_cry_clock" then
                    if not G.GAME.boss_dt then 
                        G.GAME.boss_dt = true
                        G.P_BLINDS.bl_cry_clock.mult = 0
                    end
                    if G.GAME.round_resets.blind_states.Boss ~= "Current" then
                        G.P_BLINDS.bl_cry_clock.mult = G.P_BLINDS.bl_cry_clock.mult + 0.1*dt/3
                        --Update UI
                        if G.blind_select_opts then
                            local blind_UI = G.blind_select_opts.boss.definition.nodes[1].nodes[1].nodes[1].nodes[1]
                            local chip_text_node = blind_UI.nodes[1].nodes[3].nodes[1].nodes[2].nodes[2].nodes[3]
                            chip_text_node.config.text = number_format(get_blind_amount(G.GAME.round_resets.blind_ante)*G.GAME.starting_params.ante_scaling*G.P_BLINDS.bl_cry_clock.mult)
                            chip_text_node.config.scale = score_number_scale(0.9, get_blind_amount(G.GAME.round_resets.blind_ante)*G.GAME.starting_params.ante_scaling*G.P_BLINDS.bl_cry_clock.mult)
                            G.blind_select_opts.boss:recalculate()
                        end
                    elseif not G.GAME.blind.disabled and Big:new(G.GAME.chips) < Big:new(G.GAME.blind.chips) then
                        G.GAME.blind.chips = G.GAME.blind.chips + 0.1*dt/3*get_blind_amount(G.GAME.round_resets.blind_ante)*G.GAME.starting_params.ante_scaling
                        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                    end
                end
                if G.GAME and G.GAME.blind and not G.GAME.blind.disabled and G.GAME.blind.name == "cry-Lavender Loop" and Big:new(G.GAME.chips) < Big:new(G.GAME.blind.chips) then
                    if not G.GAME.boss_dt then 
                        G.GAME.boss_dt = true
                    end
                    G.GAME.blind.chips = G.GAME.blind.chips * 1.25^(dt/1.5)
                    G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                end
            end
        end,
        items = {tax, clock, lavender_loop, blind_sprites}}