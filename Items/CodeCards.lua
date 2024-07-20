local code = {
    object_type = "ConsumableType",
    key = "Code",
    primary_colour = HEX("04200c"),
    secondary_colour = HEX("12f254"),
    collection_rows = {4,4}, -- 4 pages for all code cards
    loc_txt = {
        collection = "Code Cards",
        name = "Code",
        label = "Code"
    },
    shop_rate = 0.0,
    default = 'c_cry_crash', --todo
}
local code_atlas = {
    object_type = "Atlas",
    key = "code",
    path = "c_cry_code.png",
    px = 71,
    py = 95
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
			"{C:cry_exotic,E:1}Don't."
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

local code_cards = {code, code_atlas, crash}
return {name = "Code Cards", 
        init = function()
        end,
        items = code_cards}