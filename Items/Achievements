local achievement_atlas = {
    object_type = "Atlas",
    key = "achievements",
    path = "cry_achievements.png",
    px = 66,
    py = 66,
}

local break_infinity = {
    object_type = "Achievement",
    key = "break_infinity",
    loc_txt = {
        name = "Break Infinity",
        description = "Score 1.57e308 Chips in a single hand",
    },
    order = 1,
    bypass_all_unlocked = true,
    unlock_condition = function(self, args)
        if args.type == "chip_score" and to_big(args.chips) >= to_big(1.57e308) then
            return true
        end
    end,
}

local used_crash = {
    object_type = "Achievement",
    key = "used_crash",
    loc_txt = {
        name = "We Told You Not To",
        description = "Use ://CRASH",
    },
    order = 2,
    bypass_all_unlocked = true,
    unlock_condition = function(self, args)
        if args.type == "ach_cry_used_crash" and G.PROFILES[G.SETTINGS.profile].consumeable_usage["c_cry_crash"] and G.PROFILES[G.SETTINGS.profile].consumeable_usage["c_cry_crash"].count > 0 then 
            return true
        end
    end,
}

local haxxor = {
    object_type = "Achievement",
    key = "haxxor",
    loc_txt = {
        name = "H4xx0r",
        description = "Use a cheat code",
    },
    order = 3,
    bypass_all_unlocked = true,
    unlock_condition = function(self, args)
        if args.type == "cheat_used" then
            return true
        end
    end,
}

local googol_play_pass = {
    object_type = "Achievement",
    key = "googol_play_pass",
    loc_txt = {
        name = "Googol Play Pass",
        description = "Rig a Googol Play Card",
    },
    order = 4,
    bypass_all_unlocked = true,
    unlock_condition = function(self, args)
        if args.type == "googol_play_rigged" then
            return true
        end
    end,
}

local bullet_hell = {
    object_type = "Achievement",
    key = "bullet_hell",
    loc_txt = {
        name = "Bullet Hell",
        description = "Have 15 AP Jokers",
    },
    order = 5,
    bypass_all_unlocked = true,
    unlock_condition = function(self, args)
        if args.type == "modify_jokers" then
            local ap_joker_count = 0

            if G.jokers then
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i].config.center.key == "j_cry_apjoker" then ap_joker_count = ap_joker_count + 1 end
                end
            end

            if ap_joker_count >= 15 then return true end
        end
    end,
}

local niw_uoy = {
    object_type = "Achievement",
    key = "niw_uoy",
    loc_txt = {
        name = "!niW uoY",
        description = "Reach Ante -8",
    },
    order = 6,
    bypass_all_unlocked = true,
    unlock_condition = function(self, args)
        if args.type == "ante_up" and args.ante <= -8 then
            return true
        end
    end,
}

local jokes_on_you = {
    object_type = "Achievement",
    key = "jokes_on_you",
    loc_txt = {
        name = "Joke's on You, Pal!",
        description = "Trigger The Joke's effect on Ante 1 and win the run",
    },
    order = 7,
    bypass_all_unlocked = true,
    unlock_condition = function(self, args) --NOTE: Might be buggy due to G.GAME saving
        if args.type == 'win' and G.GAME.cry_ach_conditions.the_jokes_on_you_triggered == true then
            return true
        end
    end,
}

local freak_house = {
    object_type = "Achievement",
    key = "freak_house",
    loc_txt = {
        name = "Freak House",
        description = "Play a Flush House consisting of 6s and 9s of Hearts whilst possessing Nice",
    },
    order = 8,
    bypass_all_unlocked = true,
    unlock_condition = function(self, args) -- NOTE: I hate doing checks like this
        if args.type == 'hand' then
            -- Do you have Nice
            local has_nice
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i].config.center.key == 'j_cry_nice' then has_nice = true end
            end

            --Is it a hearts flush
            local total_6s = 0
            local total_9s = 0
            local total_hearts = 0
            for k, v in ipairs(args.scoring_hand) do
                if v:is_suit('Hearts', nil, true) then total_hearts = total_hearts + 1 end
                if v:get_id() == 6 then total_6s = total_6s + 1
                elseif v:get_id() == 9 then total_9s = total_9s + 1 end
            end

            if has_nice and ((total_6s == 3 and total_9s == 2) or (total_6s == 2 and total_9s == 3)) and total_hearts == 5 and args.disp_text == 'Flush House' then return true end
        end
    end,
}

local ult_full_skip = {
    object_type = "Achievement",
    key = "ult_full_skip",
    loc_txt = {
        name = "Ultimate Full Skip",
        description = "Win in 1 round",
    },
    order = 9,
    bypass_all_unlocked = true,
    unlock_condition = function(self, args)
        if args.type == "win" and G.GAME.round == 1 then
            return true
        end
    end,
}

local patience_virtue = {
    object_type = "Achievement",
    key = "patience_virtue",
    loc_txt = {
        name = "Patience is a Virtue",
        description = "Wait out Lavender Loop for 2 minutes before playing first hand and beat the blind",
    },
    order = 10,
    bypass_all_unlocked = true,
    hidden_text = true,
    pos = {x=2, y=0},
    unlock_condition = function(self, args)
        if args.type == "round_win" then
            if G.GAME.blind.config.blind.key == 'bl_cry_lavender_loop' and G.GAME.cry_ach_conditions.patience_virtue_earnable == true then
                return true
            end
            if G.GAME.cry_ach_conditions.patience_virtue_earnable then G.GAME.cry_ach_conditions.patience_virtue_earnable = nil end
            if G.GAME.cry_ach_conditions.patience_virtue_timer then G.GAME.cry_ach_conditions.patience_virtue_timer = nil end
        end
    end,
}

local traffic_jam = {
    object_type = "Achievement",
    key = "traffic_jam",
    loc_txt = {
        name = "Traffic Jam",
        description = "Beat all Rush Hour challenges",
    },
    order = 11,
    bypass_all_unlocked = true,
    hidden_text = true,
    pos = {x=2, y=0},
    unlock_condition = function(self, args) --Untested, mostly because I don't want to go through the hassle of hacking in Rush Hour wins. Also feels wrong, even for testing purposes
        if args.type == "win_challenge" then
            local rush_hours_beaten = 0

            if G.PROFILES[G.SETTINGS.profile].challenge_progress.completed["c_cry_rush_hour"] then rush_hours_beaten = rush_hours_beaten + 1 end
            if G.PROFILES[G.SETTINGS.profile].challenge_progress.completed["c_cry_rush_hour_ii"] then rush_hours_beaten = rush_hours_beaten + 1 end
            if G.PROFILES[G.SETTINGS.profile].challenge_progress.completed["c_cry_rush_hour_iii"] then rush_hours_beaten = rush_hours_beaten + 1 end

            if rush_hours_beaten == 3 then return true end
        end
    end,
}

local perfectly_balanced = {
    object_type = "Achievement",
    key = "perfectly_balanced",
    loc_txt = {
        name = "Perfectly Balanced",
        description = "Beat Very Fair Deck on Ascendant Stake",
    },
    order = 12,
    bypass_all_unlocked = true,
    hidden_text = true,
    pos = {x=2, y=0},
    unlock_condition = function(self, args)
        if args.type == "win_stake" or args.type == "win_stake_startup" then
            print(get_deck_win_stake('b_cry_very_fair'))
            if (G.GAME.selected_back.effect.center.key == 'b_cry_very_fair' and G.GAME.stake == 32) or get_deck_win_stake('b_cry_very_fair') == 32 then return true end
        end
    end,
}

-- TODO: Add new Achievements. 
-- Current Ideas (Normal): 
-- ???: Obtain a Blurred Blurred Joker
-- ???: Obtain Canvas
-- WHAT HAVE YOU DONE: Sacrifice an Exotic Joker to a dagger
-- Cry: Win a run with only Sob and Obelisk
-- Overtuned: Have any Glitched item give either 100x or 0.01x its original values
-- Exodia: Have 5 Exotic Jokers
-- Current Ideas (Platinum): 
-- ???: Activate Happy House before Ante 8 (without DoE/Antimatter)

-- Implemented (Normal)
-- Break Infinity: Score more than 1.57e308 in one hand
-- H4xx0r: Use a cheat code
-- We Told You Not To: Use ://CRASH
-- Googol Play Pass: Rig a Googol Play Card
-- Bullet Hell: Have 15 copies of AP Joker
-- !niW uoY: Reach Ante -8
-- Joke's on You, Pal!: Trigger The Joke's effect on Ante 1 and win the run
-- Freak House: Play a Flush House consisting of 6s and 9s of Hearts whilst possessing Nice
-- Ultimate Full Skip: Win in 1 round
-- Implemented (Platinum)
-- Patience is a Virtue: Wait out Lavender Loop for 2 minutes before playing first hand and beat it
-- Traffic Jam: Win all Rush Hour challenges
-- Perfectly Balanced: Beat Very Fair Deck on Ascendant Stake

local achievement_objects = {achievement_atlas, break_infinity, bullet_hell, used_crash, haxxor, googol_play_pass, niw_uoy, jokes_on_you, freak_house, ult_full_skip, patience_virtue, traffic_jam, perfectly_balanced}
return {name = "Achievements",
        init = function()
            
            function create_UIBox_cryptid_achievements(args)
                args = args or {}
                fetch_achievements()
                local achievements_per_row = 4
                local achievements_pool = {}
                for k, v in pairs(G.ACHIEVEMENTS) do
                    if v.mod and v.mod.id == "Cryptid" then achievements_pool[#achievements_pool+1] = v end
                end
                if not G.CRYPTID_ACHIEVEMENTS_MATRIX then
                    G.CRYPTID_ACHIEVEMENTS_MATRIX = {{},{}}
                    local achievement_tab = {}
                    for k, v in pairs(achievements_pool) do
                        achievement_tab[#achievement_tab+1] = v
                    end
                    
                    table.sort(achievement_tab, function(a, b) return a.order < b.order end)
                    
                    local row = 1
                    for i = 1, achievements_per_row*2 do
                        local v = achievement_tab[i]
                        local temp_achievement = Sprite(0,0,1.25,1.25,G.ASSET_ATLAS[v.atlas or "cry_achievements"], v.earned and v.pos or {x=0, y=0})
                        temp_achievement:define_draw_steps({
                            {shader = 'dissolve', shadow_height = 0.05},
                            {shader = 'dissolve'}
                        })
                        if i == 1 then 
                            G.E_MANAGER:add_event(Event({
                            trigger = 'immediate',
                            func = (function()
                                G.CONTROLLER:snap_to{node = temp_achievement}
                                return true
                            end)
                            }))
                        end
                        temp_achievement.float = true
                        temp_achievement.states.hover.can = true
                        temp_achievement.states.drag.can = false
                        temp_achievement.states.collide.can = true
                        --temp_achievement.config = {blind = v, force_focus = true}
                        temp_achievement.hover = function()
                            if not G.CONTROLLER.dragging.target or G.CONTROLLER.using_touch then 
                                if not temp_achievement.hovering and temp_achievement.states.visible then
                                    temp_achievement.hovering = true
                                    temp_achievement.hover_tilt = 3
                                    temp_achievement:juice_up(0.05, 0.02)
                                    play_sound('chips1', math.random()*0.1 + 0.55, 0.12)
                                    Node.hover(temp_achievement)
                                    if temp_achievement.children.alert then 
                                        temp_achievement.children.alert:remove()
                                        temp_achievement.children.alert = nil
                                        v.alerted = true
                                        G:save_progress()
                                    end
                                end
                            end
                            temp_achievement.stop_hover = function() temp_achievement.hovering = false; Node.stop_hover(temp_achievement); temp_achievement.hover_tilt = 0 end
                        end

                        -- Description
                        local achievement_text = {}
                        local maxCharsPerLine = 30
                        local function wrapText(text, maxChars)
                            local wrappedText = {""}
                            local curr_line = 1
                            local currentLineLength = 0
                        
                            for word in text:gmatch("%S+") do
                                if currentLineLength + #word <= maxChars then
                                    wrappedText[curr_line] = wrappedText[curr_line] .. word .. ' '
                                    currentLineLength = currentLineLength + #word + 1
                                else
                                    wrappedText[curr_line] = string.sub(wrappedText[curr_line], 0, -2)
                                    curr_line = curr_line + 1
                                    wrappedText[curr_line] = ""
                                    wrappedText[curr_line] = wrappedText[curr_line] .. word .. ' '
                                    currentLineLength = #word + 1
                                end
                            end
                        
                            wrappedText[curr_line] = string.sub(wrappedText[curr_line], 0, -2)
                            return wrappedText
                        end
                    
                        local loc_target = (v.hidden_text and not v.earned) and {localize("hidden_achievement", 'achievement_descriptions')} or wrapText(localize(v.key, 'achievement_descriptions'), maxCharsPerLine)
                        local loc_name = (v.hidden_name and not v.earned) and localize("hidden_achievement", 'achievement_names') or localize(v.key, 'achievement_names')

                        local ability_text = {}
                        if loc_target then 
                            for k, v in ipairs(loc_target) do
                                ability_text[#ability_text + 1] = {n=G.UIT.R, config={align = "cm"}, nodes={{n=G.UIT.T, config={text = v, scale = 0.35, shadow = true, colour = G.C.WHITE}}}}
                            end
                        end
                        achievement_text[#achievement_text + 1] =
                        {n=G.UIT.R, config={align = "cm", emboss = 0.05, r = 0.1, minw = 2.5, padding = 0.07, colour = G.C.WHITE}, nodes={
                            ability_text[1] and {n=G.UIT.R, config={align = "cm", padding = 0.08, colour = G.C.GREY, r = 0.1, emboss = 0.05, minw = 2.5, minh = 0.9}, nodes=ability_text} or nil
                        }}

                        table.insert(G.CRYPTID_ACHIEVEMENTS_MATRIX[row], {
                            n = G.UIT.C,
                            config = { align = "cm", padding = 0.1 },
                            nodes = {
                                {n=G.UIT.R, config = {align = "cm"}, nodes = {
                                    {n=G.UIT.R, config = {align = "cm", padding = 0.1}, nodes = {{ n = G.UIT.O, config = { object = temp_achievement, focus_with_object = true }}}},
                                    {
                                        n=G.UIT.R, config = {align = "cm", minw = 2.5, padding = 0.1, colour = G.C.GREY}, nodes = {
                                            {n=G.UIT.R, config={align = "cm", emboss = 0.05, r = 0.1, minw = 2.5, padding = 0.1, colour = G.C.GREY}, nodes={
                                                {n=G.UIT.O, config={align = "cm", object = DynaText({string = loc_name, colours = {G.C.UI.TEXT_LIGHT}, shadow = true, spacing = 1, bump = true, scale = 0.4})}},
                                            }},
                                            {n=G.UIT.R, config={align = "cm"}, nodes=achievement_text},
                                        },
                                    },
                                }},
                            },
                        })
                        if #G.CRYPTID_ACHIEVEMENTS_MATRIX[row] == achievements_per_row then 
                            row = row + 1
                            G.CRYPTID_ACHIEVEMENTS_MATRIX[row] = {}
                        end
                    end
                end

                local achievements_options = {}
                for i = 1, math.ceil(#achievements_pool/(2*achievements_per_row)) do
                    table.insert(achievements_options, localize('k_page')..' '..tostring(i)..'/'..tostring(math.ceil(#achievements_pool/(2*achievements_per_row))))
                end

                local t = {
                    {n=G.UIT.C, config={}, nodes={ 
                    {n=G.UIT.C, config={align = "cm"}, nodes={
                    {n=G.UIT.R, config={align = "cm"}, nodes={
                        {n=G.UIT.R, config={align = "cm"}, nodes=G.CRYPTID_ACHIEVEMENTS_MATRIX[1]},
                        {n=G.UIT.R, config={align = "cm"}, nodes=G.CRYPTID_ACHIEVEMENTS_MATRIX[2]},
                        create_option_cycle({options = achievements_options, w = 4.5, cycle_shoulders = true, opt_callback = 'cryptid_achievements_page', focus_args = {snap_to = true, nav = 'wide'},current_option = args.selected_tab or 1, colour = G.C.RED, no_pips = true})
                    }}
                    }}
                }}  
                }
                return {
                    n = G.UIT.ROOT,
                    config = {
                        emboss = 0.05,
                        minh = 6,
                        r = 0.1,
                        minw = 6,
                        align = "tm",
                        padding = 0.2,
                        colour = G.C.BLACK
                    },
                    nodes = t
                }
            end

            G.FUNCS.cryptid_achievements_page = function(args)
                if not args or not args.cycle_config then return end
                G.CRYPTID_ACHIEVEMENTS_MATRIX = {{},{}}
                
                fetch_achievements()
                local achievements_per_row = 4
                local achievements_pool = {}
                for k, v in pairs(G.ACHIEVEMENTS) do
                    if v.mod and v.mod.id == "Cryptid" then achievements_pool[#achievements_pool+1] = v end
                end
                local achievement_tab = {}
                for k, v in pairs(achievements_pool) do
                    achievement_tab[#achievement_tab+1] = v
                end
                
                table.sort(achievement_tab, function(a, b) return a.order < b.order end)
                
                local row = 1
                for i = 1, achievements_per_row*2 do
                    local v = achievement_tab[i+(8*(args.cycle_config.current_option - 1))]
                    if not v then break end
                    local temp_achievement = Sprite(0,0,1.25,1.25,G.ASSET_ATLAS[v.atlas or "cry_achievements"], v.earned and v.pos or {x=0, y=0})
                    temp_achievement:define_draw_steps({
                        {shader = 'dissolve', shadow_height = 0.05},
                        {shader = 'dissolve'}
                    })
                    if i == 1 then 
                        G.E_MANAGER:add_event(Event({
                        trigger = 'immediate',
                        func = (function()
                            G.CONTROLLER:snap_to{node = temp_achievement}
                            return true
                        end)
                        }))
                    end
                    temp_achievement.float = true
                    temp_achievement.states.hover.can = true
                    temp_achievement.states.drag.can = false
                    temp_achievement.states.collide.can = true
                    --temp_achievement.config = {blind = v, force_focus = true}
                    temp_achievement.hover = function()
                        if not G.CONTROLLER.dragging.target or G.CONTROLLER.using_touch then 
                            if not temp_achievement.hovering and temp_achievement.states.visible then
                                temp_achievement.hovering = true
                                temp_achievement.hover_tilt = 3
                                temp_achievement:juice_up(0.05, 0.02)
                                play_sound('chips1', math.random()*0.1 + 0.55, 0.12)
                                Node.hover(temp_achievement)
                                if temp_achievement.children.alert then 
                                    temp_achievement.children.alert:remove()
                                    temp_achievement.children.alert = nil
                                    v.alerted = true
                                    G:save_progress()
                                end
                            end
                        end
                        temp_achievement.stop_hover = function() temp_achievement.hovering = false; Node.stop_hover(temp_achievement); temp_achievement.hover_tilt = 0 end
                    end

                    -- Description
                    local achievement_text = {}
                    local maxCharsPerLine = 30
                    local function wrapText(text, maxChars)
                        local wrappedText = {""}
                        local curr_line = 1
                        local currentLineLength = 0
                    
                        for word in text:gmatch("%S+") do
                            if currentLineLength + #word <= maxChars then
                                wrappedText[curr_line] = wrappedText[curr_line] .. word .. ' '
                                currentLineLength = currentLineLength + #word + 1
                            else
                                wrappedText[curr_line] = string.sub(wrappedText[curr_line], 0, -2)
                                curr_line = curr_line + 1
                                wrappedText[curr_line] = ""
                                wrappedText[curr_line] = wrappedText[curr_line] .. word .. ' '
                                currentLineLength = #word + 1
                            end
                        end
                    
                        wrappedText[curr_line] = string.sub(wrappedText[curr_line], 0, -2)
                        return wrappedText
                    end
                
                    local loc_target = (v.hidden_text and not v.earned) and {localize("hidden_achievement", 'achievement_descriptions')} or wrapText(localize(v.key, 'achievement_descriptions'), maxCharsPerLine)
                    local loc_name = (v.hidden_name and not v.earned) and localize("hidden_achievement", 'achievement_names') or localize(v.key, 'achievement_names')

                    local ability_text = {}
                    if loc_target then 
                        for k, v in ipairs(loc_target) do
                            ability_text[#ability_text + 1] = {n=G.UIT.R, config={align = "cm"}, nodes={{n=G.UIT.T, config={text = v, scale = 0.35, shadow = true, colour = G.C.WHITE}}}}
                        end
                    end
                    achievement_text[#achievement_text + 1] =
                    {n=G.UIT.R, config={align = "cm", emboss = 0.05, r = 0.1, minw = 2.5, padding = 0.07, colour = G.C.WHITE}, nodes={
                        ability_text[1] and {n=G.UIT.R, config={align = "cm", padding = 0.08, colour = G.C.GREY, r = 0.1, emboss = 0.05, minw = 2.5, minh = 0.9}, nodes=ability_text} or nil
                    }}

                    table.insert(G.CRYPTID_ACHIEVEMENTS_MATRIX[row], {
                        n = G.UIT.C,
                        config = { align = "cm", padding = 0.1 },
                        nodes = {
                            {n=G.UIT.R, config = {align = "cm"}, nodes = {
                                {n=G.UIT.R, config = {align = "cm", padding = 0.1}, nodes = {{ n = G.UIT.O, config = { object = temp_achievement, focus_with_object = true }}}},
                                {
                                    n=G.UIT.R, config = {align = "cm", minw = 2.5, padding = 0.1, colour = G.C.GREY}, nodes = {
                                        {n=G.UIT.R, config={align = "cm", emboss = 0.05, r = 0.1, minw = 2.5, padding = 0.1, colour = G.C.GREY}, nodes={
                                            {n=G.UIT.O, config={align = "cm", object = DynaText({string = loc_name, colours = {G.C.UI.TEXT_LIGHT}, shadow = true, spacing = 1, bump = true, scale = 0.4})}},
                                        }},
                                        {n=G.UIT.R, config={align = "cm"}, nodes=achievement_text},
                                    },
                                },
                            }},
                        },
                    })
                    if #G.CRYPTID_ACHIEVEMENTS_MATRIX[row] == achievements_per_row then 
                        row = row + 1
                        G.CRYPTID_ACHIEVEMENTS_MATRIX[row] = {}
                    end
                end
                
                local tab_contents = G.OVERLAY_MENU:get_UIE_by_ID('tab_contents')
                tab_contents.config.object:remove()
                tab_contents.config.object = UIBox{
                    definition = create_UIBox_cryptid_achievements({selected_tab = args.cycle_config.current_option}),
                    config = {offset = {x=0,y=0}, parent = tab_contents, type = 'cm'}
                }
                tab_contents.UIBox:recalculate()
            end
        end,
        items = achievement_objects}