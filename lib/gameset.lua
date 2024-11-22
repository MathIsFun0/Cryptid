-- gameset.lua: functions for gameset UI and logic

-- Based on vanilla tutorial system - add a system where Jolly Joker talks to the player
local gu = Game.update
function Game:update(dt)
    gu(self, dt)
    if not G.SETTINGS.cry_intro_complete then G.FUNCS.cry_intro_controller() end
end

local gi = Game.init
function Game:init()
    local ret = gi(self)
    --temporarily remove all cryptid intro stuff
    G.SETTINGS.cry_intro_complete = nil
    G.cry_intro_progress = nil
    return ret
end

G.FUNCS.cry_intro_controller = function()
    G.cry_intro_progress = G.cry_intro_progress or {
        state = "start",
        completed = {}
    }
    if not G.SETTINGS.paused and not G.SETTINGS.cry_intro_complete then
        if G.STATE == G.STATES.MENU and not G.cry_intro_progress.completed.start then
            G.cry_intro_progress.section = 'start'
            G.FUNCS.cry_intro_part('start')
            G.cry_intro_progress.completed.start  = true
            G:save_progress()
        end
    end
end

G.FUNCS.cry_intro_part = function(_part)
    local step = 1
    G.SETTINGS.paused = true
    if _part == 'start' then
        G.gateway = Card(G.ROOM_ATTACH.T.x + G.ROOM_ATTACH.T.w/2 - 1, G.ROOM_ATTACH.T.y + G.ROOM_ATTACH.T.h/2 - 4, G.CARD_W*1.5, G.CARD_H*1.5, G.P_CARDS.empty, G.P_CENTERS.j_joker, {bypass_discovery_center = true})
        G.gateway.states.visible = false
        G.gateway.states.collide.can = true
        G.gateway.states.focus.can = false
        G.gateway.states.hover.can = true
        G.gateway.states.drag.can = false
        G.gateway.hover = Node.hover
        G.yawetag = Card(G.ROOM_ATTACH.T.x + G.ROOM_ATTACH.T.w/2 - 1, G.ROOM_ATTACH.T.y + G.ROOM_ATTACH.T.h/2 - 4, G.CARD_W*1.5, G.CARD_H*1.5, G.P_CARDS.empty, G.P_CENTERS.j_joker, {bypass_discovery_center = true})
        G.yawetag.states.visible = false
        G.yawetag.states.collide.can = true
        G.yawetag.states.focus.can = false
        G.yawetag.states.hover.can = true
        G.yawetag.states.drag.can = false
        G.yawetag.hover = Node.hover
        step = cry_intro_info({
            text_key = 'cry_intro_1',
            attach = {major = G.ROOM_ATTACH, type = 'cm', offset = {x = 0, y = 0}},
            step = step,
        })
        step = cry_intro_info({
            text_key = 'cry_intro_2',
            attach = {major = G.ROOM_ATTACH, type = 'cm', offset = {x = 0, y = -3}},
            step = step,
        })
        step = cry_intro_info({
            text_key = 'cry_intro_3',
            attach = {major = G.ROOM_ATTACH, type = 'cm', offset = {x = 0, y = -3}},
            step = step,
            highlight = {
                G.gateway,
                G.yawetag
            },
            on_start = function()
                G.gateway.states.visible = true
                G.gateway.children.center.atlas = G.ASSET_ATLAS['cry_atlasnotjokers']
                G.gateway.children.center:set_sprite_pos({x = 2, y = 0})
                G.gateway:set_alignment{major = G.ROOM_ATTACH, type = 'cm', offset = {x = -2.5, y = -3}}
                G.yawetag.states.visible = true
                G.yawetag.children.center.atlas = G.ASSET_ATLAS['cry_atlasnotjokers']
                G.yawetag.children.center:set_sprite_pos({x = 6, y = 5})
                G.yawetag:set_alignment{major = G.ROOM_ATTACH, type = 'cm', offset = {x = 2.5, y = -3}}
            end
        })
        step = cry_intro_info({
            text_key = 'cry_intro_4',
            attach = {major = G.ROOM_ATTACH, type = 'cm', offset = {x = 0, y = -3}},
            step = step,
            highlight = {
                G.gateway,
                G.yawetag
            },
        })
        G.modestBtn = UIBox{
            definition = create_UIBox_character_button({button = "Modest", func = "cry_modest", colour = G.C.GREEN, maxw = 3}),
            config = {major = G.ROOM_ATTACH, type = 'cm', offset = {x = -3, y = 2}}
        }
        G.mainlineBtn = UIBox{
            definition = create_UIBox_character_button({button = "Mainline", func = "cry_mainline", colour = G.C.RED, maxw = 3}),
            config = {major = G.ROOM_ATTACH, type = 'cm', offset = {x = 0, y = 2}}
        }
        G.madnessBtn = UIBox{
            definition = create_UIBox_character_button({button = "Madness", func = "cry_madness", colour = G.C.CRY_EXOTIC, maxw = 3}),
            config = {major = G.ROOM_ATTACH, type = 'cm', offset = {x = 3, y = 2}}
        }
        G.modestBtn.states.visible = false
        G.mainlineBtn.states.visible = false
        G.madnessBtn.states.visible = false
        step = cry_intro_info({
            text_key = 'cry_intro_5',
            attach = {major = G.ROOM_ATTACH, type = 'cm', offset = {x = 0, y = -3}},
            step = step,
            highlight = {
                G.gateway,
                G.yawetag,
                G.modestBtn,
                G.mainlineBtn,
                G.madnessBtn,
            },
            on_start = function()
                G.modestBtn.states.visible = true
                G.mainlineBtn.states.visible = true
                G.madnessBtn.states.visible = true
                G.gateway:set_alignment{major = G.ROOM_ATTACH, type = 'cm', offset = {x = -4.8, y = 1.8}}
                G.yawetag:set_alignment{major = G.ROOM_ATTACH, type = 'cm', offset = {x = 4.8, y = 1.8}}
            end
        })
    end
end

function cry_intro_info(args)
    local overlay_colour = {0.32,0.36,0.41,0}
    ease_value(overlay_colour, 4, 0.6, nil, 'REAL', true,0.4)
    G.OVERLAY_TUTORIAL = G.OVERLAY_TUTORIAL or UIBox{
        definition = {n=G.UIT.ROOT, config = {align = "cm", padding = 32.05, r=0.1, colour = overlay_colour, emboss = 0.05}, nodes={
            {n=G.UIT.R, config={align = "tr", minh = G.ROOM.T.h, minw = G.ROOM.T.w}, nodes={
                UIBox_button{label = {localize('b_skip').." >"}, button = "skip_tutorial_section", minw = 1.3, scale = 0.45, colour = G.C.JOKER_GREY}
            }}
        }},
        config = {
            align = "cm",
            offset = {x=0,y=3.2},
            major = G.ROOM_ATTACH,
            bond = 'Weak'
          }
      }
    G.OVERLAY_TUTORIAL.step = G.OVERLAY_TUTORIAL.step or 1
    G.OVERLAY_TUTORIAL.step_complete = false
    local row_dollars_chips = G.HUD and G.HUD:get_UIE_by_ID('row_dollars_chips') or G.ROOM_ATTACH
    local align = args.align or "tm"
    local step = args.step or 1
    local attach = args.attach or {major = row_dollars_chips, type = 'tm', offset = {x=0, y=-0.5}}
    local pos = args.pos or {x=attach.major.T.x + attach.major.T.w/2, y=attach.major.T.y + attach.major.T.h/2}
    local button = args.button or {button = localize('b_next'), func = 'tut_next'}
    args.highlight = args.highlight or {}
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.3,
        func = function()
            if G.OVERLAY_TUTORIAL and G.OVERLAY_TUTORIAL.step == step and
            not G.OVERLAY_TUTORIAL.step_complete then
                if args.on_start then args.on_start() end
                G.CONTROLLER.interrupt.focus = true
                G.OVERLAY_TUTORIAL.Jimbo = G.OVERLAY_TUTORIAL.Jimbo or Card_Character(pos)
                if type(args.highlight) == 'function' then args.highlight = args.highlight() end
                args.highlight[#args.highlight+1] = G.OVERLAY_TUTORIAL.Jimbo
                G.OVERLAY_TUTORIAL.Jimbo:add_speech_bubble(args.text_key, align, args.loc_vars)
                G.OVERLAY_TUTORIAL.Jimbo:set_alignment(attach)
                if args.hard_set then G.OVERLAY_TUTORIAL.Jimbo:hard_set_VT() end
                G.OVERLAY_TUTORIAL.button_listen = nil
                if G.OVERLAY_TUTORIAL.content then G.OVERLAY_TUTORIAL.content:remove() end
                if args.content then
                    G.OVERLAY_TUTORIAL.content = UIBox{
                        definition = args.content(),
                        config = {
                            align = args.content_config and args.content_config.align or "cm",
                            offset = args.content_config and args.content_config.offset or {x=0,y=0},
                            major = args.content_config and args.content_config.major or G.OVERLAY_TUTORIAL.Jimbo,
                            bond = 'Weak'
                          }
                      }
                    args.highlight[#args.highlight+1] = G.OVERLAY_TUTORIAL.content
                end
                if args.button_listen then G.OVERLAY_TUTORIAL.button_listen = args.button_listen end
                if not args.no_button then G.OVERLAY_TUTORIAL.Jimbo:add_button(button.button, button.func, button.colour, button.update_func, true) end
                G.OVERLAY_TUTORIAL.Jimbo:say_stuff(2*(#(G.localization.misc.tutorial[args.text_key] or {}))+1)
                if args.snap_to then
                    G.E_MANAGER:add_event(Event({
                        trigger = 'immediate',
                        blocking = false, blockable = false,
                        func = function()
                            if G.OVERLAY_TUTORIAL and G.OVERLAY_TUTORIAL.Jimbo and not G.OVERLAY_TUTORIAL.Jimbo.talking then 
                            local _snap_to = args.snap_to()
                            if _snap_to then
                                G.CONTROLLER.interrupt.focus = false
                                G.CONTROLLER:snap_to({node = args.snap_to()})
                            end
                            return true
                            end
                        end
                    }), 'tutorial') 
                end
                if args.highlight then G.OVERLAY_TUTORIAL.highlights = args.highlight end 
                G.OVERLAY_TUTORIAL.step_complete = true
            end
            return not G.OVERLAY_TUTORIAL or G.OVERLAY_TUTORIAL.step > step or G.OVERLAY_TUTORIAL.skip_steps
        end
    }), 'tutorial') 
    return step+1
end