-- gameset.lua: functions for gameset UI and logic
G.SETTINGS.cry_intro_complete = false
-- Based on vanilla tutorial system - add a system where Jolly Joker talks to the player
local gu = Game.update
function Game:update(dt)
    gu(self, dt)
    if not G.PROFILES[G.SETTINGS.profile].cry_intro_complete then G.FUNCS.cry_intro_controller() end
end

G.FUNCS.cry_intro_controller = function()
    G.PROFILES[G.SETTINGS.profile].cry_intro_progress = G.PROFILES[G.SETTINGS.profile].cry_intro_progress or {
        state = "start",
        completed = {}
    }
    if not G.SETTINGS.paused and not G.PROFILES[G.SETTINGS.profile].cry_intro_complete then
        if G.STATE == G.STATES.MENU and not G.PROFILES[G.SETTINGS.profile].cry_intro_progress.completed.start then
            G.PROFILES[G.SETTINGS.profile].cry_intro_progress.section = 'start'
            G.FUNCS.cry_intro_part('start')
            G.PROFILES[G.SETTINGS.profile].cry_intro_progress.completed.start  = true
            G:save_progress()
        end
    end
end

function create_UIBox_character_button_with_sprite(args) 
    local button = args.button or "NONE"
    local func = args.func or nil
    local colour = args.colour or G.C.RED
    local update_func = args.update_func or nil
    local sprite = args.sprite or nil
  
    local t = --{n=G.UIT.ROOT, config = {align = "cm", padding = 0.1, colour = G.C.CLEAR}, nodes={
      {n=G.UIT.C, config={align = "tm", minw = 2.5, padding = 0.2, minh = 1.2, r = 0.1, hover = true, colour = colour, button = func, func = update_func, shadow = true, maxw = args.maxw, id = args.id}, nodes={
        {n=G.UIT.R, config={align = "cm", padding = 0}, nodes={
          {n=G.UIT.T, config={text = button, scale = 0.55, colour = G.C.UI.TEXT_LIGHT, focus_args = {button = 'x', orientation = 'bm'}, func = 'set_button_pip'}},
        }},
        {n=G.UIT.R, config={align = "cm", padding = 0}, nodes={
            {n=G.UIT.O, config={object=sprite}}
          }},
      }}--,
      --}}
    return t
end

G.FUNCS.cry_intro_part = function(_part)
    local step = 1
    G.SETTINGS.paused = true
    if _part == 'start' then
        G.gateway = Sprite(G.ROOM_ATTACH.T.x + G.ROOM_ATTACH.T.w/2 - 1, G.ROOM_ATTACH.T.y + G.ROOM_ATTACH.T.h/2 - 4, G.CARD_W*1.5, G.CARD_H*1.5, G.ASSET_ATLAS['cry_atlasnotjokers'], {x=2, y=0})
        G.gateway.states.visible = false
        G.gateway.states.collide.can = true
        G.gateway.states.focus.can = false
        G.gateway.states.hover.can = true
        G.gateway.states.drag.can = false
        G.gateway.hover = Node.hover
        G.yawetag = Sprite(G.ROOM_ATTACH.T.x + G.ROOM_ATTACH.T.w/2 - 1, G.ROOM_ATTACH.T.y + G.ROOM_ATTACH.T.h/2 - 4, G.CARD_W*1.5, G.CARD_H*1.5, G.ASSET_ATLAS['cry_atlasnotjokers'], {x=6, y=5})
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
                G.gateway:set_alignment{major = G.ROOM_ATTACH, type = 'cm', offset = {x = -2.5, y = -3}}
                G.yawetag.states.visible = true
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
        local modestSprite = Sprite(0, 0, 1, 1, G.ASSET_ATLAS['cry_gameset'], {x = 0, y = 0})
        modestSprite:define_draw_steps({
            {shader = 'dissolve', shadow_height = 0.05},
            {shader = 'dissolve'}
        })
        local mainlineSprite = Sprite(0, 0, 1, 1, G.ASSET_ATLAS['cry_gameset'], {x = 1, y = 0})
        mainlineSprite:define_draw_steps({
            {shader = 'dissolve', shadow_height = 0.05},
            {shader = 'dissolve'}
        })
        local madnessSprite = Sprite(0, 0, 1, 1, G.ASSET_ATLAS['cry_gameset'], {x = 2, y = 0})
        madnessSprite:define_draw_steps({
            {shader = 'dissolve', shadow_height = 0.05},
            {shader = 'dissolve'}
        })
        --TODO: localize
        G.modestBtn = create_UIBox_character_button_with_sprite({sprite = modestSprite, button = "Modest", id = "modest", func = "cry_modest", colour = G.C.GREEN, maxw = 3})
        G.mainlineBtn = create_UIBox_character_button_with_sprite({sprite = mainlineSprite, button = "Mainline", id = "mainline", func = "cry_mainline", colour = G.C.RED, maxw = 3})
        G.madnessBtn = create_UIBox_character_button_with_sprite({sprite = madnessSprite, button = "Madness", id = "madness", func = "cry_madness", colour = G.C.CRY_EXOTIC, maxw = 3})
        local gamesetUI = create_UIBox_generic_options({infotip = false, contents ={
            G.modestBtn,
            G.mainlineBtn,
            G.madnessBtn,
        },
        back_label = "Confirm",
        back_colour = G.C.BLUE,
        back_func = "cry_gameset_confirm"
        })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            blocking = false, blockable = false,
            func = function()
                G.madnessBtn.config.colour = G.C.CRY_EXOTIC
                return true
            end
        }))
        gamesetUI.nodes[2] = nil
        gamesetUI.config.colour = G.C.CLEAR
        G.gamesetUI = UIBox{
            definition = gamesetUI,
            config = {major = G.ROOM_ATTACH, type = 'cm', offset = {x = 0, y = 2.5}}
        }
        G.gamesetUI.states.visible = false
        step = cry_intro_info({
            text_key = 'cry_intro_5',
            attach = {major = G.ROOM_ATTACH, type = 'cm', offset = {x = 0, y = -3}},
            step = step,
            highlight = {
                G.gateway,
                G.yawetag,
                G.gamesetUI
            },
            on_start = function()
                --the scaling should be eased later...
                G.gamesetUI.states.visible = true
                G.gateway:set_alignment{major = G.ROOM_ATTACH, type = 'cm', offset = {x = -4.5, y = 2.2}}
                G.gateway.T.w = G.gateway.T.w * 3
                G.gateway.T.h = G.gateway.T.h * 3
                G.yawetag:set_alignment{major = G.ROOM_ATTACH, type = 'cm', offset = {x = 4.5, y = 2.2}}
                G.yawetag.T.w = G.yawetag.T.w * 3
                G.yawetag.T.h = G.yawetag.T.h * 3
            end,
            no_button = true
        })
    end
    if _part == 'modest' or _part == 'mainline' or _part == 'madness' then
        local desc_length = { --number of times Jolly Joker speaks for each gameset
            modest = 2,
            mainline = 3,
            madness = 3
        }
        G.E_MANAGER:clear_queue('tutorial')
        if G.OVERLAY_TUTORIAL.content then G.OVERLAY_TUTORIAL.content:remove() end
        G.OVERLAY_TUTORIAL.Jimbo:remove_button()
        G.OVERLAY_TUTORIAL.Jimbo:remove_speech_bubble()
        G.OVERLAY_TUTORIAL.step = nil
        for i = 1, desc_length[_part] do
            step = cry_intro_info({
                text_key = 'cry_'.._part..'_'..i,
                attach = {major = G.ROOM_ATTACH, type = 'cm', offset = {x = 0, y = -3}},
                step = step,
                highlight = {
                    G.gamesetUI:get_UIE_by_ID(_part)
                },
            })
        end
        step = cry_intro_info({
            no_button = true,
            attach = {major = G.ROOM_ATTACH, type = 'cm', offset = {x = 0, y = -3}},
            step = step,
            highlight = {
                G.gateway,
                G.yawetag,
                G.gamesetUI
            },
        })
    end
end

G.FUNCS.cry_modest = function(e)
    G.modestBtn.config.colour = G.C.CRY_SELECTED
    G.mainlineBtn.config.colour = G.C.RED
    G.madnessBtn.config.colour = G.C.CRY_EXOTIC
    G.FUNCS.cry_intro_part("modest")
    G.selectedGameset = "modest"
end
G.FUNCS.cry_mainline = function(e)
    G.modestBtn.config.colour = G.C.GREEN
    G.mainlineBtn.config.colour = G.C.CRY_SELECTED
    G.madnessBtn.config.colour = G.C.CRY_EXOTIC
    G.FUNCS.cry_intro_part("mainline")
    G.selectedGameset = "mainline"
end
G.FUNCS.cry_madness = function(e)
    G.modestBtn.config.colour = G.C.GREEN
    G.mainlineBtn.config.colour = G.C.RED
    G.madnessBtn.config.colour = G.C.CRY_SELECTED
    G.FUNCS.cry_intro_part("madness")
    G.selectedGameset = "madness"
end
G.FUNCS.cry_gameset_confirm = function(e) --WIP
    if G.selectedGameset then
        G.PROFILES[G.SETTINGS.profile].cry_intro_complete = true
        G.PROFILES[G.SETTINGS.profile].cry_gameset = G.selectedGameset
        G.SETTINGS.paused = false
        G.gamesetUI:remove()
        G.gateway:remove()
        G.yawetag:remove()
        G.E_MANAGER:clear_queue('tutorial')
        G.OVERLAY_TUTORIAL.Jimbo:remove()
        if G.OVERLAY_TUTORIAL.content then G.OVERLAY_TUTORIAL.content:remove() end 
        G.OVERLAY_TUTORIAL:remove()
        G.OVERLAY_TUTORIAL = nil
    end
end

function cry_intro_info(args)
    local overlay_colour = {0.32,0.36,0.41,0}
    ease_value(overlay_colour, 4, 0.6, nil, 'REAL', true,0.4)
    G.OVERLAY_TUTORIAL = G.OVERLAY_TUTORIAL or UIBox{
        definition = {n=G.UIT.ROOT, config = {align = "cm", padding = 32.05, r=0.1, colour = overlay_colour, emboss = 0.05}, nodes={
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
                if args.text_key then G.OVERLAY_TUTORIAL.Jimbo:add_speech_bubble(args.text_key, align, args.loc_vars) end
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

-- Profile stuff: all profiles start with M to separate from vanilla
function G.UIDEF.profile_select()
    G.focused_profile = G.focused_profile or G.SETTINGS.profile or (Cryptid.profile_prefix .. "1")
  
    local t =   create_UIBox_generic_options({padding = 0,contents ={
        {n=G.UIT.R, config={align = "cm", padding = 0, draw_layer = 1, minw = 4}, nodes={
          create_tabs(
          {tabs = {
              {
                label = Cryptid.profile_prefix .. "1",
                chosen = G.focused_profile == (Cryptid.profile_prefix .. "1"),
                tab_definition_function = G.UIDEF.profile_option,
                tab_definition_function_args = Cryptid.profile_prefix .. "1"
              },
              {
                label = Cryptid.profile_prefix .. "2",
                chosen = G.focused_profile == (Cryptid.profile_prefix .. "2"),
                tab_definition_function = G.UIDEF.profile_option,
                tab_definition_function_args = Cryptid.profile_prefix .. "2"
              },
              {
                label = Cryptid.profile_prefix .. "3",
                chosen = G.focused_profile == (Cryptid.profile_prefix .. "3"),
                tab_definition_function = G.UIDEF.profile_option,
                tab_definition_function_args = Cryptid.profile_prefix .. "3"
              }
          },
          snap_to_nav = true}),
        }},
    }})
    return t
  end

-- Gets gameset sprite of current profile
function gameset_sprite(scale, profile, force_gameset)
    gameset = force_gameset or G.PROFILES[profile or G.SETTINGS.profile].cry_gameset
    scale = scale or 1
    local sprite = Sprite(0, 0, scale, scale, G.ASSET_ATLAS['cry_gameset'], {x = (gameset == 'madness' and 2 or gameset == 'modest' and 0 or 1), y = 0})
    sprite:define_draw_steps({
        {shader = 'dissolve', shadow_height = 0.09},
        {shader = 'dissolve'}
    })
    sprite.states.collide.can = true
    sprite.states.drag.can = true
    return sprite
end

-- set_ability accounts for gamesets
function Card:get_gameset(center)
    if not center then center = card.config.center end
    if self.force_gameset then return self.force_gameset end
    if center.force_gameset then return center.force_gameset end
    return G.PROFILES[G.SETTINGS.profile].cry_gameset --individual config will work later
end
local csa = Card.set_ability
function Card:set_ability(center, y, z)
    csa(self, center, y, z)
    if center.gameset_config and center.gameset_config[self:get_gameset(center)] then
        for k, v in pairs(center.gameset_config[self:get_gameset(center)]) do
            self.ability[k] = v
        end
    end
end

--open gameset config UI when clicking on a card in the Cryptid collection
local ccl = Card.click
function Card:click()
    ccl(self)
    if G.your_collection then
        for k, v in pairs(G.your_collection) do
            if self.area == v and G.ACTIVE_MOD_UI and G.ACTIVE_MOD_UI.id == "Cryptid" then
                cry_gameset_config_UI(self.config.center)
            end
        end
    end
end

-- gameset config UI
function cry_gameset_config_UI(center)
    G.SETTINGS.paused = true
    G.your_collection = {}
    G.your_collection[1] = CardArea(
        G.ROOM.T.x + 0.2*G.ROOM.T.w/2,G.ROOM.T.h,
        5.3*G.CARD_W,
        1.03*G.CARD_H, 
        {card_limit = 5, type = 'title', highlight_limit = 0, collection = true})
    local deck_tables = 
    {n=G.UIT.R, config={align = "cm", padding = 0, no_fill = true}, nodes={
        {n=G.UIT.O, config={object = G.your_collection[1]}}
    }}

    local gamesets = {'disabled', 'modest', 'mainline', 'madness'}

    for i = 1, #gamesets do
        local _center = cry_deep_copy(center)
        _center.force_gameset = gamesets[i]
        local card = Card(G.your_collection[1].T.x + G.your_collection[1].T.w/2, G.your_collection[1].T.y, G.CARD_W, G.CARD_H, G.P_CARDS.empty, _center)
        card:start_materialize()
        card.gameset_select = true
        if gamesets[i] == 'disabled' then
            card.debuff = true
            --todo: replace sprite with ://DELETE?
        end
        G.your_collection[1]:emplace(card)
    end

    INIT_COLLECTION_CARD_ALERTS()
    
    local t = create_UIBox_generic_options({ infotip = localize('cry_gameset_explanation'), back_func = 'your_collection', snap_back = true, contents = {
                {n=G.UIT.R, config={align = "cm", minw = 2.5, padding = 0.1, r = 0.1, colour = G.C.BLACK, emboss = 0.05}, nodes={deck_tables}},
            }})
    G.FUNCS.overlay_menu{
        definition = t
    }
end