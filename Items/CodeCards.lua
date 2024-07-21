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
    key = "p_code_normal_1",
    kind = "Code",
    atlas = "pack",
    pos = {x=0,y=0},
    config = {extra = 2, choose = 1},
    cost = 4,
    weight = 1.2,
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
    key = "p_code_normal_2",
    kind = "Code",
    atlas = "pack",
    pos = {x=1,y=0},
    config = {extra = 2, choose = 1},
    cost = 4,
    weight = 1.2,
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
    key = "p_code_jumbo_1",
    kind = "Code",
    atlas = "pack",
    pos = {x=2,y=0},
    config = {extra = 4, choose = 1},
    cost = 4,
    weight = 0.6,
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
    key = "p_code_mega_1",
    kind = "Code",
    atlas = "pack",
    pos = {x=3,y=0},
    config = {extra = 4, choose = 2},
    cost = 4,
    weight = 0.15,
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
    use = function(self, card, area, copier)
        G.GAME.cry_payload = (G.GAME.cry_payload or 1) * card.ability.interest_mult
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
    end
}

--for testing
--crash_functions = {crash_functions[#crash_functions]}



local code_cards = {code, code_atlas, pack_atlas, pack1, pack2, packJ, packM, payload, reboot, revert, crash}
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
        end,
        items = code_cards}