--note to self: refer to https://docs.google.com/document/d/1LNaIouU3vrtWIuPBdFCqLyjYAjVtq7t64xjHnckEY50/edit for order of remaining consumables
local code = {
	object_type = "ConsumableType",
	key = "Code",
	primary_colour = HEX("14b341"),
	secondary_colour = HEX("12f254"),
	collection_rows = { 4, 4 }, -- 4 pages for all code cards
	shop_rate = 0.0,
	loc_txt = {},
	default = (SMODS.Mods["jen"] or {}).can_load and "c_cry_oboe" or "c_cry_crash",
	can_stack = true,
	can_divide = true,
}
local code_digital_hallucinations_compat = {
	colour = HEX("14b341"),
	loc_key = "cry_plus_code",
	create = function()
		local ccard = create_card("Code", G.consumeables, nil, nil, nil, nil, nil, "diha")
		ccard:set_edition({ negative = true }, true)
		ccard:add_to_deck()
		G.consumeables:emplace(ccard)
	end,
}
local pack1 = {
	cry_credits = {
		idea = {
			"HexaCryonic",
		},
		art = {
			"HexaCryonic",
		},
		code = {
			"Math",
		},
	},
	dependencies = {
		items = {
			"set_cry_code",
		},
	},
	object_type = "Booster",
	key = "code_normal_1",
	kind = "Code",
	atlas = "pack",
	pos = { x = 0, y = 0 },
	config = { extra = 2, choose = 1 },
	cost = 4,
	order = 1,
	weight = 0.96,
	create_card = function(self, card)
		return create_card("Code", G.pack_cards, nil, nil, true, true, nil, "cry_program_1")
	end,
	ease_background_colour = function(self)
		ease_colour(G.C.DYN_UI.MAIN, G.C.SET.Code)
		ease_background_colour({ new_colour = G.C.SET.Code, special_colour = G.C.BLACK, contrast = 2 })
	end,
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card and card.ability.choose or self.config.choose,
				card and card.ability.extra or self.config.extra,
			},
		}
	end,
	group_key = "k_cry_program_pack",
	cry_digital_hallucinations = code_digital_hallucinations_compat,
}
local pack2 = {
	cry_credits = {
		idea = {
			"HexaCryonic",
		},
		art = {
			"HexaCryonic",
		},
		code = {
			"Math",
		},
	},
	dependencies = {
		items = {
			"set_cry_code",
		},
	},
	object_type = "Booster",
	key = "code_normal_2",
	kind = "Code",
	atlas = "pack",
	pos = { x = 1, y = 0 },
	config = { extra = 2, choose = 1 },
	cost = 4,
	order = 2,
	weight = 0.96,
	create_card = function(self, card)
		return create_card("Code", G.pack_cards, nil, nil, true, true, nil, "cry_program_2")
	end,
	ease_background_colour = function(self)
		ease_colour(G.C.DYN_UI.MAIN, G.C.SET.Code)
		ease_background_colour({ new_colour = G.C.SET.Code, special_colour = G.C.BLACK, contrast = 2 })
	end,
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card and card.ability.choose or self.config.choose,
				card and card.ability.extra or self.config.extra,
			},
		}
	end,
	group_key = "k_cry_program_pack",
	cry_digital_hallucinations = code_digital_hallucinations_compat,
}
local packJ = {
	cry_credits = {
		idea = {
			"HexaCryonic",
		},
		art = {
			"HexaCryonic",
		},
		code = {
			"Math",
		},
	},
	dependencies = {
		items = {
			"set_cry_code",
		},
	},
	object_type = "Booster",
	key = "code_jumbo_1",
	kind = "Code",
	atlas = "pack",
	pos = { x = 2, y = 0 },
	config = { extra = 4, choose = 1 },
	cost = 6,
	order = 3,
	weight = 0.48,
	create_card = function(self, card)
		return create_card("Code", G.pack_cards, nil, nil, true, true, nil, "cry_program_j")
	end,
	ease_background_colour = function(self)
		ease_colour(G.C.DYN_UI.MAIN, G.C.SET.Code)
		ease_background_colour({ new_colour = G.C.SET.Code, special_colour = G.C.BLACK, contrast = 2 })
	end,
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card and card.ability.choose or self.config.choose,
				card and card.ability.extra or self.config.extra,
			},
		}
	end,
	group_key = "k_cry_program_pack",
	cry_digital_hallucinations = code_digital_hallucinations_compat,
}
local packM = {
	cry_credits = {
		idea = {
			"HexaCryonic",
		},
		art = {
			"HexaCryonic",
		},
		code = {
			"Math",
		},
	},
	dependencies = {
		items = {
			"set_cry_code",
		},
	},
	object_type = "Booster",
	key = "code_mega_1",
	kind = "Code",
	atlas = "pack",
	pos = { x = 3, y = 0 },
	config = { extra = 4, choose = 2 },
	cost = 8,
	order = 4,
	weight = 0.12,
	create_card = function(self, card)
		return create_card("Code", G.pack_cards, nil, nil, true, true, nil, "cry_program_m")
	end,
	ease_background_colour = function(self)
		ease_colour(G.C.DYN_UI.MAIN, G.C.SET.Code)
		ease_background_colour({ new_colour = G.C.SET.Code, special_colour = G.C.BLACK, contrast = 2 })
	end,
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card and card.ability.choose or self.config.choose,
				card and card.ability.extra or self.config.extra,
			},
		}
	end,
	group_key = "k_cry_program_pack",
	cry_digital_hallucinations = code_digital_hallucinations_compat,
}
local console = {
	cry_credits = {
		idea = {
			"HexaCryonic",
		},
		art = {
			"HexaCryonic",
		},
		code = {
			"Math",
		},
	},
	dependencies = {
		items = {
			"p_cry_code_normal_1",
		},
	},
	object_type = "Tag",
	atlas = "tag_cry",
	name = "cry-Console Tag",
	order = 26,
	pos = { x = 3, y = 2 },
	config = { type = "new_blind_choice" },
	key = "console",
	min_ante = 2,
	loc_vars = function(self, info_queue)
		info_queue[#info_queue + 1] = { set = "Other", key = "p_cry_code_normal_1", specific_vars = { 1, 2 } }
		return { vars = {} }
	end,
	apply = function(self, tag, context)
		if context.type == "new_blind_choice" then
			tag:yep("+", G.C.SECONDARY_SET.Code, function()
				local key = "p_cry_code_normal_1"
				local card = Card(
					G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2,
					G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2,
					G.CARD_W * 1.27,
					G.CARD_H * 1.27,
					G.P_CARDS.empty,
					G.P_CENTERS[key],
					{ bypass_discovery_center = true, bypass_discovery_ui = true }
				)
				card.cost = 0
				card.from_tag = true
				G.FUNCS.use_card({ config = { ref_table = card } })
				if G.GAME.modifiers.cry_force_edition and not G.GAME.modifiers.cry_force_random_edition then
					card:set_edition(nil, true, true)
				elseif G.GAME.modifiers.cry_force_random_edition then
					local edition = Cryptid.poll_random_edition()
					card:set_edition(edition, true, true)
				end
				card:start_materialize()
				return true
			end)
			tag.triggered = true
			return true
		end
	end,
}
local crash = {
	cry_credits = {
		idea = {
			"HexaCryonic",
		},
		art = {
			"HexaCryonic",
		},
		code = {
			"Math",
		},
	},
	dependencies = {
		items = {
			"set_cry_code",
		},
	},
	object_type = "Consumable",
	set = "Code",
	name = "cry-Crash",
	key = "crash",
	pos = { x = 7, y = 0 },
	config = {},
	cost = 4,
	atlas = "atlasnotjokers",
	order = 1,
	can_use = function(self, card)
		return true
	end,
	use = function(self, card, area, copier)
		if not G.PROFILES[G.SETTINGS.profile].consumeable_usage["c_cry_crash"] then
			set_consumeable_usage(card)
		end
		-- I'm being VERY safe here, game gets really weird and sometimes does and doesn't save ://CRASH use
		G:save_settings()
		G:save_progress()
		local f = pseudorandom_element(crashes, pseudoseed("cry_crash"))
		f(self, card, area, copier)
	end,
	init = function(self)
		function create_UIBox_crash(card)
			G.E_MANAGER:add_event(Event({
				blockable = false,
				func = function()
					G.REFRESH_ALERTS = true
					return true
				end,
			}))
			local t = create_UIBox_generic_options({
				no_back = true,
				colour = HEX("04200c"),
				outline_colour = G.C.SECONDARY_SET.Code,
				contents = {
					{
						n = G.UIT.R,
						nodes = {
							create_text_input({
								colour = G.C.SET.Code,
								hooked_colour = darken(copy_table(G.C.SET.Code), 0.3),
								w = 4.5,
								h = 1,
								max_length = 2500,
								extended_corpus = true,
								prompt_text = "???",
								ref_table = G,
								ref_value = "ENTERED_ACE",
								keyboard_offset = 1,
							}),
						},
					},
					{
						n = G.UIT.R,
						config = { align = "cm" },
						nodes = {
							UIBox_button({
								colour = G.C.SET.Code,
								button = "ca",
								label = { localize("cry_code_execute") },
								minw = 4.5,
								focus_args = { snap_to = true },
							}),
						},
					},
				},
			})
			return t
		end
		G.FUNCS.ca = function()
			G.GAME.USING_CODE = false
			loadstring(G.ENTERED_ACE)() --Scary!
			glitched_intensity = 0
			G.SETTINGS.GRAPHICS.crt = 0
			check_for_unlock({ type = "ach_cry_used_crash" })
			G.CHOOSE_ACE:remove()
			G.ENTERED_ACE = nil
		end

		crashes = {
			function()
				G:save_settings()
				G:save_progress()
				--instantly quit the game, no error log
				function love.errorhandler() end
				print(crash.crash.crash)
			end,
			function()
				G:save_settings()
				G:save_progress()
				--removes draw loop, you're frozen and can still weirdly interact with the game a bit
				function love.draw() end
			end,
			function()
				G:save_settings()
				G:save_progress()
				--by WilsonTheWolf and MathIsFun_, funky error screen with random funny message
				messages = {
					"Oops.",
					"Your cards have been TOASTED, extra crispy for your pleasure.",
					"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
					"What we have here is a certified whoopsidaisy",
					"Why don't you buy more jonkers? Are you stupid?",
					"lmao",
					"How about a game of YOU MUST DIE?",
					"Sorry, I was in the bathroom. What'd I mi'Where'd... Where is everyone?",
					"Peter? What are you doing? Cards. WHAT THE FUCK?",
					"what if it was called freaklatro",
					"4",
					"I SAWED THIS GAME IN HALF!",
					"is this rush hour 4",
					"You missed a semicolon on line 19742, you buffoon",
					"you are an idiot",
					"You do not recognise the cards in the deck.",
					":( Your P",
					"Assertion failed",
					"Play ULTRAKILL",
					"Play Nova Drift",
					"Play Balatro- wait",
					"what if instead of rush hour it was called kush hour and you just smoked a massive blunt",
					"death.fell.accident.water",
					"Balatro's innards were made outards",
					"i am going to club yrou",
					"But the biggest joker of them all, it was you all along!",
					"fission mailed successfully",
					"table index is nil",
					"index is nil table",
					"nil is index table",
					"nildex is in table",
					"I AM THE TABLE",
					"I'm never going back this casino agai-",
					"what did you think would happen?",
					"DO THE EARTHQUAKE! [screams]",
					"fuck you",
					"Screaming in the casino prank! AAAAAAAAAAAAAAAAAA",
					"https://www.youtube.com/watch?v=dQw4w9WgXcQ",
					"You musn't tear or crease it.",
					"Sure, but the point is to do it without making a hole.",
					"The end of all things! As was foretold in the prophecy!",
					"Do it again. It'd be funny",
					"",
					":3",
					"Looks like a skill issue to me.",
					"it turns out that card was ligma",
					"YouJustLostTheCasinoGame",
					"Nah fuck off",
					"attempt to call global your_mom (value too large)",
					"Killed by intentional game design",
					"attempt to index field 'attempt to call global to_big (too big)' (a nil value)",
					"what.avi",
					"The C",
					"Shoulda kept Chicot",
					"Maybe next time don't do that?",
					"[recursion]",
					"://SHART",
					"It's converging time.",
					"This is the last error message.",
				}
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
					local info = "Additional Context:\nBalatro Version: "
						.. VERSION
						.. "\nModded Version: "
						.. MODDED_VERSION
					local major, minor, revision, codename = love.getVersion()
					info = info
						.. "\nLove2D Version: "
						.. corruptString(string.format("%d.%d.%d", major, minor, revision))

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
							info = info
								.. "\n    "
								.. k
								.. ": "
								.. v.name
								.. " by "
								.. table.concat(v.author, ", ")
								.. " [ID: "
								.. v.id
								.. (v.priority ~= 0 and (", Priority: " .. v.priority) or "")
								.. (v.version and v.version ~= "0.0.0" and (", Version: " .. v.version) or "")
								.. "]"
							local debugInfo = v.debug_info
							if debugInfo then
								if type(debugInfo) == "string" then
									if #debugInfo ~= 0 then
										info = info .. "\n        " .. debugInfo
									end
								elseif type(debugInfo) == "table" then
									for kk, vv in pairs(debugInfo) do
										if type(vv) ~= "nil" then
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
						mod.author = { corruptString(20) }
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

						local background = { math.random() * 0.3, math.random() * 0.3, math.random() * 0.3 }
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
							table.insert(err, "\n" .. msg)
						else
							table.insert(err, "\n" .. "Failed to get additional context :/")
						end

						local p = table.concat(err, "\n")

						p = p:gsub("\t", "")
						p = p:gsub('%[string "(.-)"%]', "%1")

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
							if endHeight < 0 then
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
								background = { math.random() * 0.3, math.random() * 0.3, math.random() * 0.3 }
								p = p
									.. "\n"
									.. corruptString(math.random(linesize - linesize / 2, linesize + linesize * 2))
								linesize = linesize + linesize / 25
							end
							love.graphics.printf(p, pos, pos - scrollOffset, love.graphics.getWidth() - pos * 2)
							if scrollOffset ~= endHeight then
								love.graphics.polygon(
									"fill",
									love.graphics.getWidth() - (pos / 2),
									love.graphics.getHeight() - arrowSize,
									love.graphics.getWidth() - (pos / 2) + arrowSize,
									love.graphics.getHeight() - (arrowSize * 2),
									love.graphics.getWidth() - (pos / 2) - arrowSize,
									love.graphics.getHeight() - (arrowSize * 2)
								)
							end
							if scrollOffset ~= 0 then
								love.graphics.polygon(
									"fill",
									love.graphics.getWidth() - (pos / 2),
									arrowSize,
									love.graphics.getWidth() - (pos / 2) + arrowSize,
									arrowSize * 2,
									love.graphics.getWidth() - (pos / 2) - arrowSize,
									arrowSize * 2
								)
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
									type = "kill",
								})
							end
							if G.SAVE_MANAGER and G.SAVE_MANAGER.channel then
								G.SAVE_MANAGER.channel:push({
									type = "kill",
								})
							end
							if G.HTTP_MANAGER and G.HTTP_MANAGER.channel then
								G.HTTP_MANAGER.channel:push({
									type = "kill",
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
									local buttons = { "OK", localize("cry_code_cancel"), "Restart" }
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

				load("error(messages[math.random(1, #messages)])", corruptString(30), "t")()
			end,
			function()
				check_for_unlock({ type = "ach_cry_used_crash" })
				--fills screen with Crash cards
				glitched_intensity = 100
				G.SETTINGS.GRAPHICS.crt = 101
				G.E_MANAGER:add_event(
					Event({
						trigger = "immediate",
						blockable = false,
						no_delete = true,
						func = function()
							G.GAME.accel = G.GAME.accel or 1.1
							for i = 1, G.GAME.accel do
								local c = create_card("Code", nil, nil, nil, nil, nil, "c_cry_crash")
								c.T.x = math.random(-G.CARD_W, G.TILE_W)
								c.T.y = math.random(-G.CARD_H, G.TILE_H)
							end
							G.GAME.accel = G.GAME.accel ^ (1.005 + G.GAME.accel / 20000)
							return false
						end,
					}),
					"other"
				)
			end,
			function()
				G:save_settings()
				G:save_progress()
				-- Fake lovely panic
				love.window.showMessageBox(
					"lovely-injector",
					'lovely-injector has crashed:\npanicked at crates/lovely-core/src/lib.rs:420:69:\nFailed to parse patch at "C:\\\\users\\\\jimbo\\\\AppData\\\\Roaming\\\\Balatro\\\\Mods\\\\Cryptid\\\\lovely.toml":\nError { inner: TomlError { message: "expected `.`, `=`", original: Some("'
						.. "\"According to all known laws of aviation, there is no way a bee should be able to fly.\\nIts wings are too small to get its fat little body off the ground.\\nThe bee, of course, flies anyway because bees don't care what humans think is impossible.\\nYellow, black. Yellow, black. Yellow, black. Yellow, black.\\nOoh, black and yellow!\\nLet's shake it up a little.\\nBarry! Breakfast is ready!\\nComing!\\nHang on a second.\\nHello?\\nBarry?\\nAdam?\\nCan you believe this is happening?\\nI can't.\\nI'll pick you up.\\nLooking sharp.\\nUse the stairs, Your father paid good money for those.\\nSorry. I'm excited.\\nHere's the graduate.\\nWe're very proud of you, son.\\nA perfect report card, all B's.\\nVery proud.\\nMa! I got a thing going here.\\nYou got lint on your fuzz.\\nOw! That's me!\\nWave to us! We'll be in row 118,000.\\nBye!\\nBarry, I told you, stop flying in the house!\\nHey, Adam.\\nHey, Barry.\\nIs that fuzz gel?\\nA little. Special day, graduation.\\nNever thought I'd make it.\\nThree days grade school, three days high school.\\nThose were awkward.\\nThree days college. I'm glad I took a day and hitchhiked around The Hive.\\nYou did come back different.\\nHi, Barry. Artie, growing a mustache? Looks good.\\nHear about Frankie?\\nYeah.\\nYou going to the funeral?\\nNo, I'm not going.\\nEverybody knows, sting someone, you die.\\nDon't waste it on a squirrel.\\nSuch a hothead.\\nI guess he could have just gotten out of the way.\\nI love this incorporating an amusement park into our day.\\nThat's why we don't need vacations.\\nBoy, quite a bit of pomp under the circumstances.\\nWell, Adam, today we are men.\\nWe are!\\nBee-men.\\nAmen!\\nHallelujah!\\nStudents, faculty, distinguished bees,\\nplease welcome Dean Buzzwell.\\nWelcome, New Hive City graduating class of 9:15.\\nThat concludes our ceremonies And begins your career at Honex Industries!\\nWill we pick our job today?\\nI heard it's just orientation.\\nHeads up! Here we go.\\nKeep your hands and antennas inside the tram at all times.\\nWonder what it'll be like?\\nA little scary.\\nWelcome to Honex, a division of Honesco and a part of the Hexagon Group.\\nThis is it!\\nWow.\\nWow.\\nWe know that you, as a bee, have worked your whole life to get to the point where you can work for your whole life.\\nHoney begins when our valiant Pollen Jocks bring the nectar to The Hive.\\nOur top-secret formula is automatically color-corrected, scent-adjusted and bubble-contoured into this soothing sweet syrup with its distinctive golden glow you know as... Honey!\\nThat girl was hot.\\nShe's my cousin!\\nShe is?\\nYes, we're all cousins.\\nRight. You're right.\\nAt Honex, we constantly strive to improve every aspect of bee existence.\\nThese bees are stress-testing a new helmet technology.\\nWhat do you think he makes?\\nNot enough.\\nHere we have our latest advancement, the Krelman.\\nWhat does that do?\\nCatches that little strand of honey that hangs after you pour it.\\nSaves us millions.\\nCan anyone work on the Krelman?\\nOf course. Most bee jobs are small ones.\\nBut bees know that every small job, if it's done well, means a lot.\\nBut choose carefully because you'll stay in the job you pick for the rest of your life.\\nThe same job the rest of your life? I didn't know that.\\nWhat's the difference?\\nYou'll be happy to know that bees, as a species, haven't had one day off in 27 million years.\\nSo you'll just work us to death?\\nWe'll sure try.\\nWow! That blew my mind!\\n\\\"What's the difference?\\\"\\nHow can you say that?\\nOne job forever?\\nThat's an insane choice to have to make.\\nI'm relieved. Now we only have to make one decision in life.\\nBut, Adam, how could they never have told us that?\\nWhy would you question anything? We're bees.\\nWe're the most perfectly functioning society on Earth.\\nYou ever think maybe things work a little too well here?\\nLike what? Give me one example.\\nI don't know. But you know what I'm talking about.\\nPlease clear the gate. Royal Nectar Force on approach.\\nWait a second. Check it out.\\nHey, those are Pollen Jocks!\\nWow.\\nI've never seen them this close.\\nThey know what it's like outside The Hive.\\nYeah, but some don't come back.\\nHey, Jocks!\\nHi, Jocks!\\nYou guys did great!\\nYou're monsters!\\nYou're sky freaks! I love it! I love it!\\nI wonder where they were.\\nI don't know.\\nTheir day's not planned.\\nOutside The Hive, flying who knows where, doing who knows what.\\nYou can't just decide to be a Pollen Jock. You have to be bred for that.\\nRight.\\nLook. That's more pollen than you and I will see in a lifetime.\\nIt's just a status symbol.\\nBees make too much of it.\\nPerhaps. Unless you're wearing it and the ladies see you wearing it.\\nThose ladies?\\nAren't they our cousins too?\\nDistant. Distant.\\nLook at these two.\\nCouple of Hive Harrys.\\nLet's have fun with them.\\nIt must be dangerous being a Pollen Jock.\\nYeah. Once a bear pinned me against a mushroom!\\nHe had a paw on my throat, and with the other, he was slapping me!\\nOh, my!\\nI never thought I'd knock him out.\\nWhat were you doing during this?\\nTrying to alert the authorities.\\nI can autograph that.\\nA little gusty out there today, wasn't it, comrades?\\nYeah. Gusty.\\nWe're hitting a sunflower patch six miles from here tomorrow.\\nSix miles, huh?\\nBarry!\\nA puddle jump for us, but maybe you're not up for it.\\nMaybe I am.\\nYou are not!\\nWe're going 0900 at J-Gate.\\nWhat do you think, buzzy-boy?\\nAre you bee enough?\\nI might be. It all depends on what 0900 means.\\nHey, Honex!\\nDad, you surprised me.\\nYou decide what you're interested in?\\nWell, there's a lot of choices.\\nBut you only get one.\\nDo you ever get bored doing the same job every day?\\nSon, let me tell you about stirring.\\nYou grab that stick, and you just move it around, and you stir it around.\\nYou get yourself into a rhythm.\\nIt's a beautiful thing.\\nYou know, Dad, the more I think about it,\\nmaybe the honey field just isn't right for me.\\nYou were thinking of what, making balloon animals?\\nThat's a bad job for a guy with a stinger.\\nJanet, your son's not sure he wants to go into honey!\\nBarry, you are so funny sometimes.\\nI'm not trying to be funny.\\nYou're not funny! You're going into honey. Our son, the stirrer!\\nYou're gonna be a stirrer?\\nNo one's listening to me!\\nWait till you see the sticks I have.\\nI could say anything right now.\\nI'm gonna get an ant tattoo!\\nLet's open some honey and celebrate!\\nMaybe I'll pierce my thorax. Shave my antennae. Shack up with a grasshopper. Get a gold tooth and call everybody \\\"dawg\\\"!\\nI'm so proud.\\nWe're starting work today!\\nToday's the day.\\nCome on! All the good jobs will be gone.\\nYeah, right.\\nPollen counting, stunt bee, pouring, stirrer, front desk, hair removal...\\nIs it still available?\\nHang on. Two left!\\nOne of them's yours! Congratulations!\\nStep to the side.\\nWhat'd you get?\\nPicking crud out. Stellar!\\nWow!\\nCouple of newbies?\\nYes, sir! Our first day! We are ready!\\nMake your choice.\\nYou want to go first?\\nNo, you go.\\nOh, my. What's available?\\nRestroom attendant's open, not for the reason you think.\\nAny chance of getting the Krelman?\\nSure, you're on.\\nI'm sorry, the Krelman just closed out.\\nWax monkey's always open.\\nThe Krelman opened up again.\\nWhat happened?\\nA bee died. Makes an opening. See? He's dead. Another dead one.\\nDeady. Deadified. Two more dead.\\nDead from the neck up. Dead from the neck down. That's life!\\nOh, this is so hard!\\nHeating, cooling, stunt bee, pourer, stirrer, humming, inspector number seven, lint coordinator, stripe supervisor, mite wrangler.\\nBarry, what do you think I should... Barry?\\nBarry!\\nAll right, we've got the sunflower patch in quadrant nine...\\nWhat happened to you?\\nWhere are you?\\nI'm going out.\\nOut? Out where?\\nOut there.\\nOh, no!\\nI have to, before I go to work for the rest of my life.\\nYou're gonna die! You're crazy! Hello?\\nAnother call coming in.\\nIf anyone's feeling brave, there's a Korean deli on 83rd that gets their roses today.\\nHey, guys.\\nLook at that.\\nIsn't that the kid we saw yesterday?\\nHold it, son, flight deck's restricted.\\nIt's OK, Lou. We're gonna take him up.\\nReally? Feeling lucky, are you?\\nSign here, here. Just initial that.\\nThank you.\\nOK.\\nYou got a rain advisory today, and as you all know, bees cannot fly in rain.\\nSo be careful. As always, watch your brooms, hockey sticks, dogs, birds, bears and bats.\\nAlso, I got a couple of reports of root beer being poured on us.\\nMurphy's in a home because of it, babbling like a cicada!\\nThat's awful.\\nAnd a reminder for you rookies, bee law number one, absolutely no talking to humans!\\n All right, launch positions!\\nBuzz, buzz, buzz, buzz! Buzz, buzz, buzz, buzz! Buzz, buzz, buzz, buzz!\\nBlack and yellow!\\nHello!\\nYou ready for this, hot shot?\\nYeah. Yeah, bring it on.\\nWind, check.\\nAntennae, check.\\nNectar pack, check.\\nWings, check.\\nStinger, check.\\nScared out of my shorts, check.\\nOK, ladies,\\nlet's move it out!\\nPound those petunias, you striped stem-suckers!\\nAll of you, drain those flowers!\\nWow! I'm out!\\nI can't believe I'm out!\\nSo blue.\\nI feel so fast and free!\\nBox kite!\\nWow!\\nFlowers!\\nThis is Blue Leader, We have roses visual.\\nBring it around 30 degrees and hold.\\nRoses!\\n30 degrees, roger. Bringing it around.\\nStand to the side, kid.\\nIt's got a bit of a kick.\\nThat is one nectar collector!\\nEver see pollination up close?\\nNo, sir.\\nI pick up some pollen here, sprinkle it over here. Maybe a dash over there, a pinch on that one.\\nSee that? It's a little bit of magic.\\nThat's amazing. Why do we do that?\\nThat's pollen power. More pollen, more flowers, more nectar, more honey for us.\\nCool.\\nI'm picking up a lot of bright yellow, Could be daisies, Don't we need those?\\nCopy that visual.\\nWait. One of these flowers seems to be on the move.\\nSay again? You're reporting a moving flower?\\nAffirmative.\\nThat was on the line!\\nThis is the coolest. What is it?\\nI don't know, but I'm loving this color.\\nIt smells good.\\nNot like a flower, but I like it.\\nYeah, fuzzy.\\nChemical-y.\\nCareful, guys. It's a little grabby.\\nMy sweet lord of bees!\\nCandy-brain, get off there!\\nProblem!\\nGuys!\\nThis could be bad.\\nAffirmative.\\nVery close.\\nGonna hurt.\\nMama's little boy.\\nYou are way out of position, rookie!\\nComing in at you like a missile!\\nHelp me!\\nI don't think these are flowers.\\nShould we tell him?\\nI think he knows.\\nWhat is this?!\\nMatch point!\\nYou can start packing up, honey, because you're about to eat it!\\nYowser!\\nGross.\\nThere's a bee in the car!\\nDo something!\\nI'm driving!\\nHi, bee.\\nHe's back here!\\nHe's going to sting me!\\nNobody move. If you don't move, he won't sting you. Freeze!\\nHe blinked!\\nSpray him, Granny!\\nWhat are you doing?!\\nWow... the tension level out here is unbelievable.\\nI gotta get home.\\nCan't fly in rain. Can't fly in rain. Can't fly in rain.\\nMayday! Mayday! Bee going down!\\nKen, could you close the window please?\\nKen, could you close the window please?\\nCheck out my new resume. I made it into a fold-out brochure. You see? Folds out.\\nOh, no. More humans. I don't need this.\\nWhat was that?\\nMaybe this time. This time. This time. This time! This time! This... Drapes!\\nThat is diabolical.\\nIt's fantastic. It's got all my special skills, even my top-ten favorite movies.\\nWhat's number one? Star Wars?\\nNah, I don't go for that... kind of stuff.\\nNo wonder we shouldn't talk to them. They're out of their minds.\\nWhen I leave a job interview, they're flabbergasted, can't believe what I say.\\nThere's the sun. Maybe that's a way out.\\nI don't remember the sun having a big 75 on it.\\nI predicted global warming. I could feel it getting hotter. At first I thought it was just me.\\nWait! Stop! Bee!\\nStand back. These are winter boots.\\nWait!\\nDon't kill him!\\nYou know I'm allergic to them! This thing could kill me!\\nWhy does his life have less value than yours?\\nWhy does his life have any less value than mine? Is that your statement?\\nI'm just saying all life has value. You don't know what he's capable of feeling.\\nMy brochure!\\nThere you go, little guy.\\nI'm not scared of him.It's an allergic thing.\\n Put that on your resume brochure.\\nMy whole face could puff up.\\nMake it one of your special skills.\\nKnocking someone out is also a special skill.\\nRight. Bye, Vanessa. Thanks.\\nVanessa, next week? Yogurt night?\\nSure, Ken. You know, whatever.\\nYou could put carob chips on there.\\nBye.\\nSupposed to be less calories.\\nBye.\\nI gotta say something. She saved my life. I gotta say something.\\nAll right, here it goes.\\nNah.\\nWhat would I say?\\nI could really get in trouble. It's a bee law. You're not supposed to talk to a human.\\nI can't believe I'm doing this. I've got to.\\nOh, I can't do it. Come on!\\nNo. Yes. No. Do it. I can't.\\nHow should I start it? \\\"You like jazz?\\\" No, that's no good.\\nHere she comes! Speak, you fool!\\nHi!\\nI'm sorry. You're talking.\\nYes, I know.\\nYou're talking!\\nI'm so sorry.\\nNo, it's OK. It's fine.\\nI know I'm dreaming. But I don't recall going to bed.\\nWell, I'm sure this is very disconcerting.\\nThis is a bit of a surprise to me. I mean, you're a bee!\\nI am. And I'm not supposed to be doing this, but they were all trying to kill me.\\nAnd if it wasn't for you... I had to thank you. It's just how I was raised.\\nThat was a little weird. I'm talking with a bee.\\nYeah.\\nI'm talking to a bee. And the bee is talking to me!\\nI just want to say I'm grateful.\\nI'll leave now.\\nWait! How did you learn to do that?\\nWhat?\\nThe talking thing.\\nSame way you did, I guess. \\\"Mama, Dada, honey.\\\" You pick it up.\\nThat's very funny.\\nYeah.\\nBees are funny. If we didn't laugh, we'd cry with what we have to deal with.\\nAnyway... Can I... get you something?\\nLike what?\\nI don't know. I mean... I don't know. Coffee?\\nI don't want to put you out.\\nIt's no trouble. It takes two minutes.\\nIt's just coffee.\\nI hate to impose.\\nDon't be ridiculous!\\nActually, I would love a cup.\\nHey, you want rum cake?\\nI shouldn't.\\nHave some.\\nNo, I can't.\\nCome on!\\nI'm trying to lose a couple micrograms.\\nWhere?\\nThese stripes don't help.\\nYou look great!\\nI don't know if you know anything about fashion.\\nAre you all right?\\nNo.\\nHe's making the tie in the cab as they're flying up Madison.\\nHe finally gets there.\\nHe runs up the steps into the church.\\nThe wedding is on.\\nAnd he says, \\\"Watermelon?\\nI thought you said Guatemalan.\\nWhy would I marry a watermelon?\\\"\\nIs that a bee joke?\\nThat's the kind of stuff we do.\\nYeah, different.\\nSo, what are you gonna do, Barry?\\nAbout work? I don't know.\\nI want to do my part for The Hive, but I can't do it the way they want.\\nI know how you feel.\\nYou do?\\nSure.\\nMy parents wanted me to be a lawyer or a doctor, but I wanted to be a florist.\\nReally?\\nMy only interest is flowers.\\nOur new queen was just elected with that same campaign slogan.\\nAnyway, if you look... There's my hive right there. See it?\\nYou're in Sheep Meadow!\\nYes! I'm right off the Turtle Pond!\\nNo way! I know that area. I lost a toe ring there once.\\nWhy do girls put rings on their toes?\\nWhy not?\\nIt's like putting a hat on your knee.\\nMaybe I'll try that.\\nYou all right, ma'am?\\nOh, yeah. Fine.\\nJust having two cups of coffee!\\nAnyway, this has been great.\\nThanks for the coffee.\\nYeah, it's no trouble.\\nSorry I couldn't finish it. If I did, I'd be up the rest of my life.\\nAre you...?\\nCan I take a piece of this with me?\\nSure! Here, have a crumb.\\nThanks!\\nYeah.\\nAll right. Well, then... I guess I'll see you around. Or not.\\nOK, Barry.\\nAnd thank you so much again... for before.\\nOh, that? That was nothing.\\nWell, not nothing, but... Anyway...\\nThis can't possibly work.\\nHe's all set to go.\\nWe may as well try it.\\nOK, Dave, pull the chute.\\nSounds amazing.\\nIt was amazing!\\nIt was the scariest, happiest moment of my life.\\nHumans! I can't believe you were with humans!\\nGiant, scary humans!\\nWhat were they like?\\nHuge and crazy. They talk crazy.\\nThey eat crazy giant things.\\nThey drive crazy.\\nDo they try and kill you, like on TV?\\nSome of them. But some of them don't.\\nHow'd you get back?\\nPoodle.\\nYou did it, and I'm glad. You saw whatever you wanted to see.\\nYou had your \\\"experience.\\\" Now you can pick out yourjob and be normal.\\nWell...\\nWell?\\nWell, I met someone.\\nYou did? Was she Bee-ish?\\nA wasp?! Your parents will kill you!\\nNo, no, no, not a wasp.\\nSpider?\\nI'm not attracted to spiders.\\nI know it's the hottest thing, with the eight legs and all. I can't get by that face.\\nSo who is she?\\nShe's... human.\\nNo, no. That's a bee law. You wouldn't break a bee law.\\nHer name's Vanessa.\\nOh, boy.\\nShe's so nice. And she's a florist!\\nOh, no! You're dating a human florist!\\nWe're not dating.\\nYou're flying outside The Hive, talking to humans that attack our homes with power washers and M-80s! One-eighth a stick of dynamite!\\nShe saved my life! And she understands me.\\nThis is over!\\nEat this.\\nThis is not over! What was that?\\nThey call it a crumb.\\nIt was so stingin' stripey!\\nAnd that's not what they eat.\\nThat's what falls off what they eat!\\nYou know what a Cinnabon is?\\nNo.\\nIt's bread and cinnamon and frosting. They heat it up...\\nSit down!\\n...really hot!\\nListen to me!\\nWe are not them! We're us.\\nThere's us and there's them!\\n\"), keys: [], span: Some(10..11)}}}",
					"error"
				)
				love.window.showMessageBox(
					"lovely-injector",
					"lovely-injector has crashed:\npanicked at library/cors/src/panicking.rs:221:5:\npanic in a function that cannot unwind",
					"error"
				)

				function love.errorhandler() end
				print(crash.crash.crash)
			end,
			function()
				--Arbitrary Code Execution
				glitched_intensity = 100
				G.SETTINGS.GRAPHICS.crt = 100
				G.GAME.USING_CODE = true
				G.ENTERED_ACE = ""
				G.CHOOSE_ACE = UIBox({
					definition = create_UIBox_crash(card),
					config = {
						align = "bmi",
						offset = { x = 0, y = G.ROOM.T.y + 29 },
						major = G.jokers,
						bond = "Weak",
						instance_type = "POPUP",
					},
				})
			end,
		}
	end,
}
local payload = {
	cry_credits = {
		idea = {
			"Mjiojio",
		},
		art = {
			"HexaCryonic",
		},
		code = {
			"Math",
		},
	},
	dependencies = {
		items = {
			"set_cry_code",
		},
	},
	object_type = "Consumable",
	set = "Code",
	name = "cry-Payload",
	key = "payload",
	pos = { x = 8, y = 0 },
	config = { interest_mult = 3 },
	loc_vars = function(self, info_queue, center)
		return { vars = { self.config.interest_mult } }
	end,
	cost = 4,
	atlas = "atlasnotjokers",
	order = 2,
	can_use = function(self, card)
		return true
	end,
	can_bulk_use = true,
	use = function(self, card, area, copier)
		G.GAME.cry_payload = to_big((G.GAME.cry_payload or 1)) * to_big(card.ability.interest_mult)
	end,
	bulk_use = function(self, card, area, copier, number)
		G.GAME.cry_payload = to_big((G.GAME.cry_payload or 1)) * to_big(card.ability.interest_mult) ^ to_big(number)
	end,
}
local reboot = {
	cry_credits = {
		idea = {
			"HexaCryonic",
		},
		art = {
			"HexaCryonic",
		},
		code = {
			"Math",
		},
	},
	dependencies = {
		items = {
			"set_cry_code",
		},
	},
	object_type = "Consumable",
	set = "Code",
	name = "cry-Reboot",
	key = "reboot",
	pos = { x = 9, y = 0 },
	config = {},
	cost = 4,
	atlas = "atlasnotjokers",
	order = 3,
	can_use = function(self, card)
		return G.STATE == G.STATES.SELECTING_HAND
	end,
	use = function(self, card, area, copier)
		G.FUNCS.draw_from_hand_to_discard()
		G.FUNCS.draw_from_discard_to_deck()
		ease_discard(
			math.max(0, G.GAME.round_resets.discards + G.GAME.round_bonus.discards) - G.GAME.current_round.discards_left
		)
		ease_hands_played(
			math.max(1, G.GAME.round_resets.hands + G.GAME.round_bonus.next_hands) - G.GAME.current_round.hands_left
		)
		for k, v in pairs(G.playing_cards) do
			v.ability.wheel_flipped = nil
		end
		G.E_MANAGER:add_event(Event({
			trigger = "immediate",
			func = function()
				G.STATE = G.STATES.DRAW_TO_HAND
				G.deck:shuffle("cry_reboot" .. G.GAME.round_resets.ante)
				G.deck:hard_set_T()
				G.STATE_COMPLETE = false
				return true
			end,
		}))
	end,
}
local revert = {
	cry_credits = {
		idea = {
			"Mjiojio",
		},
		art = {
			"HexaCryonic",
		},
		code = {
			"Math",
		},
	},
	dependencies = {
		items = {
			"set_cry_code",
		},
	},
	object_type = "Consumable",
	set = "Code",
	name = "cry-Revert",
	key = "revert",
	pos = { x = 10, y = 0 },
	config = {},
	cost = 4,
	atlas = "atlasnotjokers",
	order = 4,
	can_use = function(self, card)
		return G.GAME.cry_revert
	end,
	use = function(self, card, area, copier)
		G.E_MANAGER:add_event(
			Event({
				trigger = "after",
				delay = G.SETTINGS.GAMESPEED,
				func = function()
					G:delete_run()
					G:start_run({
						savetext = STR_UNPACK(G.GAME.cry_revert),
					})
				end,
			}),
			"other"
		)
	end,
	init = function(self)
		local sr = save_run
		function save_run()
			--Sneaking this here but hopefully fixes pointer UI crashes
			if G.GAME.USING_CODE then
				return
			end
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
}
local semicolon = {
	cry_credits = {
		idea = {
			"HexaCryonic",
		},
		art = {
			"HexaCryonic",
		},
		code = {
			"Math",
		},
	},
	dependencies = {
		items = {
			"set_cry_code",
		},
	},
	object_type = "Consumable",
	set = "Code",
	name = "cry-Semicolon",
	key = "semicolon",
	pos = {
		x = 7,
		y = 1,
	},
	config = {},
	cost = 4,
	atlas = "atlasnotjokers",
	order = 32,
	can_use = function(self, card)
		return G.STATE == G.STATES.SELECTING_HAND and not G.GAME.blind.boss
	end,
	use = function(self, card, area, copier)
		G.E_MANAGER:add_event(
			Event({
				trigger = "immediate",
				func = function()
					if G.STATE ~= G.STATES.SELECTING_HAND then
						return false
					end
					G.GAME.current_round.semicolon = true
					G.STATE = G.STATES.HAND_PLAYED
					G.STATE_COMPLETE = true
					end_round()
					return true
				end,
			}),
			"other"
		)
	end,
}
local malware = {
	cry_credits = {
		idea = {
			"HexaCryonic",
		},
		art = {
			"HexaCryonic",
		},
		code = {
			"HexaCryonic",
		},
	},
	dependencies = {
		items = {
			"set_cry_code",
		},
	},
	object_type = "Consumable",
	set = "Code",
	name = "cry-Malware",
	key = "malware",
	pos = {
		x = 8,
		y = 1,
	},
	config = {},
	cost = 4,
	atlas = "atlasnotjokers",
	order = 9,
	can_use = function(self, card)
		return #G.hand.cards > 0
	end,
	use = function(self, card, area, copier)
		G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 0.4,
			func = function()
				play_sound("tarot1")
				card:juice_up(0.3, 0.5)
				return true
			end,
		}))
		for i = 1, #G.hand.cards do
			local percent = 1.15 - (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.15,
				func = function()
					G.hand.cards[i]:flip()
					play_sound("card1", percent)
					G.hand.cards[i]:juice_up(0.3, 0.3)
					return true
				end,
			}))
		end
		delay(0.2)
		for i = 1, #G.hand.cards do
			local CARD = G.hand.cards[i]
			local percent = 0.85 + (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.15,
				func = function()
					CARD:flip()
					CARD:set_edition({
						cry_glitched = true,
					})
					play_sound("tarot2", percent)
					CARD:juice_up(0.3, 0.3)
					return true
				end,
			}))
		end
	end,
}
local seed = {
	cry_credits = {
		idea = {
			"Mjiojio",
		},
		art = {
			"HexaCryonic",
		},
		code = {
			"Math",
		},
	},
	dependencies = {
		items = {
			"set_cry_code",
		},
	},
	object_type = "Consumable",
	set = "Code",
	name = "cry-Seed",
	key = "seed",
	pos = {
		x = 10,
		y = 1,
	},
	config = {},
	cost = 4,
	atlas = "atlasnotjokers",
	order = 12,
	can_use = function(self, card)
		--the card itself and one other card
		return #G.jokers.highlighted
				+ #G.hand.highlighted
				+ #G.consumeables.highlighted
				+ (G.pack_cards and #G.pack_cards.highlighted or 0)
			--+ (G.shop_cards and #G.shop_cards.highlighted or 0) TODO: this so you can use seed when it's in shop
			== 2
	end,
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = { key = "cry_rigged", set = "Other", vars = {} }
	end,
	use = function(self, card, area, copier)
		if area then
			area:remove_from_highlighted(card)
		end
		if G.jokers.highlighted[1] then
			G.jokers.highlighted[1].ability.cry_rigged = true
			if G.jokers.highlighted[1].config.center.key == "j_cry_googol_play" then
				check_for_unlock({ type = "googol_play_rigged" })
			end
		end
		if G.hand.highlighted[1] then
			G.hand.highlighted[1].ability.cry_rigged = true
		end
		if G.consumeables.highlighted[1] then
			G.consumeables.highlighted[1].ability.cry_rigged = true
		end
		if Cryptid.safe_get(G, "pack_cards", "highlighted", 1) then
			G.pack_cards.highlighted[1].ability.cry_rigged = true
		end
	end,
}
local rigged = {
	dependencies = {
		items = {
			"c_cry_seed",
		},
	},
	object_type = "Sticker",
	atlas = "sticker",
	pos = { x = 6, y = 1 },
	key = "cry_rigged",
	no_sticker_sheet = true,
	prefix_config = { key = false },
	badge_colour = HEX("14b341"),
	draw = function(self, card) --don't draw shine
		local notilt = nil
		if card.area and card.area.config.type == "deck" then
			notilt = true
		end
		if not G.shared_stickers["cry_rigged2"] then
			G.shared_stickers["cry_rigged2"] =
				Sprite(0, 0, G.CARD_W, G.CARD_H, G.ASSET_ATLAS["cry_sticker"], { x = 5, y = 1 })
		end -- no matter how late i init this, it's always late, so i'm doing it in the damn draw function

		G.shared_stickers[self.key].role.draw_major = card
		G.shared_stickers["cry_rigged2"].role.draw_major = card

		G.shared_stickers[self.key]:draw_shader("dissolve", nil, nil, notilt, card.children.center)

		card.hover_tilt = card.hover_tilt / 2 -- call it spaghetti, but it's what hologram does so...
		G.shared_stickers["cry_rigged2"]:draw_shader("dissolve", nil, nil, notilt, card.children.center)
		G.shared_stickers["cry_rigged2"]:draw_shader(
			"hologram",
			nil,
			card.ARGS.send_to_shader,
			notilt,
			card.children.center
		) -- this doesn't really do much tbh, but the slight effect is nice
		card.hover_tilt = card.hover_tilt * 2
	end,
}
local hook = {
	cry_credits = {
		idea = {
			"HexaCryonic",
		},
		art = {
			"HexaCryonic",
		},
		code = {
			"Math",
		},
	},
	dependencies = {
		items = {
			"set_cry_code",
		},
	},
	object_type = "Consumable",
	set = "Code",
	name = "cry-Hook",
	key = "hook",
	pos = {
		x = 7,
		y = 4,
	},
	config = {},
	cost = 4,
	atlas = "atlasnotjokers",
	order = 14,
	no_pool_flag = "beta_deck",
	can_use = function(self, card)
		return #G.jokers.highlighted == 2
	end,
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = { key = "cry_hooked", set = "Other", vars = { "hooked Joker" } }
	end,
	use = function(self, card, area, copier)
		G.jokers.highlighted[1].ability.cry_hooked = true
		G.jokers.highlighted[2].ability.cry_hooked = true
		G.jokers.highlighted[1].hook_id = G.jokers.highlighted[2].sort_id
		G.jokers.highlighted[2].hook_id = G.jokers.highlighted[1].sort_id
	end,
	init = function(self)
		--HOOK:// patches (probably broken)
		--[[local cj = Card.calculate_joker
		function Card:calculate_joker(context)
			local ret, trig = cj(self, context)
			if
				(ret or trig)
				and self.ability.cry_hooked
				and not context.post_trigger
				and not context.cry_hook
				and not context.retrigger_joker_check
				and not context.megatrigger_check
			then
				context.cry_hook = true
				for i = 1, #G.jokers.cards do
					if G.jokers.cards[i].sort_id == self.hook_id then
						card_eval_status_text(
							G.jokers.cards[i],
							"extra",
							nil,
							nil,
							nil,
							{ message = localize("cry_hooked_ex"), colour = G.C.SET.Code }
						)
						cj(G.jokers.cards[i], context)
						--I tried a few things to get the color of messages to be green from the other joker, but they haven't worked :(
					end
				end
				context.cry_hook = nil
			end
			return ret, trig
		end--]]
		local Cardstart_dissolveRef = Card.start_dissolve
		function Card:start_dissolve(dissolve_colours, silent, dissolve_time_fac, no_juice)
			if G.jokers then
				for i = 1, #G.jokers.cards do
					if G.jokers.cards[i].hook_id == self.sort_id then
						G.jokers.cards[i].ability.cry_hooked = false
						G.jokers.cards[i].hook_id = nil
					end
				end
			end
			Cardstart_dissolveRef(self, dissolve_colours, silent, dissolve_time_fac, no_juice)
		end
	end,
}
local hooked = {
	dependencies = {
		items = {
			"c_cry_hook",
		},
	},
	object_type = "Sticker",
	atlas = "sticker",
	pos = { x = 5, y = 3 },
	no_edeck = true,
	loc_vars = function(self, info_queue, card)
		local var
		if not card or not card.hook_id then
			var = "[" .. localize("k_joker") .. "]"
		else
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i].sort_id == card.hook_id then
					var = localize({ type = "name_text", set = "Joker", key = G.jokers.cards[i].config.center.key })
				end
			end
			var = var or ("[no joker found - " .. (card.hook_id or "nil") .. "]")
		end
		return { vars = { var or "hooked Joker" } }
	end,
	key = "cry_hooked",
	no_sticker_sheet = true,
	prefix_config = { key = false },
	badge_colour = HEX("14b341"),
	draw = function(self, card) --don't draw shine
		G.shared_stickers[self.key].role.draw_major = card
		G.shared_stickers[self.key]:draw_shader("dissolve", nil, nil, nil, card.children.center)
	end,
}
local variable = {
	cry_credits = {
		idea = {
			"HexaCryonic",
		},
		art = {
			"HexaCryonic",
		},
		code = {
			"AlexZGreat",
		},
	},
	dependencies = {
		items = {
			"set_cry_code",
		},
	},
	object_type = "Consumable",
	set = "Code",
	key = "variable",
	name = "cry-Variable",
	atlas = "atlasnotjokers",
	pos = {
		x = 9,
		y = 1,
	},
	cost = 4,
	order = 8,
	config = { max_highlighted = 2, extra = { enteredrank = "" } },
	loc_vars = function(self, info_queue, card)
		return { vars = { Cryptid.safe_get(card, "ability", "max_highlighted") or self.config.max_highlighted } }
	end,
	use = function(self, card, area, copier)
		G.GAME.USING_CODE = true
		G.ENTERED_RANK = ""
		G.CHOOSE_RANK = UIBox({
			definition = create_UIBox_variable(card),
			config = {
				align = "cm",
				offset = { x = 0, y = 10 },
				major = G.ROOM_ATTACH,
				bond = "Weak",
				instance_type = "POPUP",
			},
		})
		G.CHOOSE_RANK.alignment.offset.y = 0
		G.ROOM.jiggle = G.ROOM.jiggle + 1
		G.CHOOSE_RANK:align_to_major()
	end,
	init = function(self)
		function create_UIBox_variable(card)
			G.E_MANAGER:add_event(Event({
				blockable = false,
				func = function()
					G.REFRESH_ALERTS = true
					return true
				end,
			}))
			local t = create_UIBox_generic_options({
				no_back = true,
				colour = HEX("04200c"),
				outline_colour = G.C.SECONDARY_SET.Code,
				contents = {
					{
						n = G.UIT.R,
						nodes = {
							create_text_input({
								colour = G.C.SET.Code,
								hooked_colour = darken(copy_table(G.C.SET.Code), 0.3),
								w = 4.5,
								h = 1,
								max_length = 16,
								extended_corpus = true,
								prompt_text = localize("cry_code_rank"),
								ref_table = G,
								ref_value = "ENTERED_RANK",
								keyboard_offset = 1,
							}),
						},
					},
					{
						n = G.UIT.R,
						nodes = {
							UIBox_button({
								colour = G.C.SET.Code,
								button = "variable_apply",
								label = { localize("cry_code_apply") },
								minw = 4.5,
								focus_args = { snap_to = true },
							}),
						},
					},
					{
						n = G.UIT.R,
						nodes = {
							UIBox_button({
								colour = G.C.RED,
								button = "variable_apply_previous",
								label = { localize("cry_code_apply_previous") },
								minw = 4.5,
								focus_args = { snap_to = true },
							}),
						},
					},
					{
						n = G.UIT.R,
						nodes = {
							UIBox_button({
								colour = G.C.RED,
								button = "variable_cancel",
								label = { localize("cry_code_cancel") },
								minw = 4.5,
								focus_args = { snap_to = true },
							}),
						},
					},
				},
			})
			return t
		end

		G.FUNCS.variable_apply_previous = function()
			if G.PREVIOUS_ENTERED_RANK then
				G.ENTERED_RANK = G.PREVIOUS_ENTERED_RANK or ""
			end
			G.FUNCS.variable_apply()
		end

		G.FUNCS.variable_apply = function()
			local rank_table = {
				{},
				{ "2", "Two", "II" },
				{ "3", "Three", "III" },
				{ "4", "Four", "IV" },
				{ "5", "Five", "V" },
				{ "6", "Six", "VI" },
				{ "7", "Seven", "VII" },
				{ "8", "Eight", "VIII" },
				{ "9", "Nine", "IX" },
				{ "10", "1O", "Ten", "X", "T" },
				{ "J", "Jack" },
				{ "Q", "Queen" },
				{ "K", "King" },
				{ "A", "Ace", "One", "1", "I" },
				{ "M" },
				{ "nil" },
			}

			local rank_suffix = nil

			for i, v in pairs(rank_table) do
				for j, k in pairs(v) do
					if string.lower(G.ENTERED_RANK) == string.lower(k) then
						rank_suffix = i
					end
				end
			end

			if rank_suffix then
				local TempCard = {}
				for i = 1, #G.hand.highlighted do
					TempCard[i] = G.hand.highlighted[i]
				end
				G.PREVIOUS_ENTERED_RANK = G.ENTERED_RANK
				G.GAME.USING_CODE = false
				if rank_suffix == 15 then
					check_for_unlock({ type = "cheat_used" })
					local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_jolly")
					card:add_to_deck()
					G.jokers:emplace(card)
				elseif rank_suffix == 16 then
					check_for_unlock({ type = "cheat_used" })
					local card = create_card("Code", G.consumeables, nil, nil, nil, nil, "c_cry_crash")
					card:add_to_deck()
					G.consumeables:emplace(card)
				elseif rank_suffix == 17 then
					check_for_unlock({ type = "cheat_used" })
					G.E_MANAGER:add_event(Event({
						trigger = "after",
						delay = 0.4,
						func = function()
							play_sound("tarot1")
							return true
						end,
					}))
					for i = 1, #TempCard do
						local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
						G.E_MANAGER:add_event(Event({
							trigger = "after",
							delay = 0.15,
							func = function()
								TempCard[i]:flip()
								play_sound("card1", percent)
								TempCard[i]:juice_up(0.3, 0.3)
								return true
							end,
						}))
					end
					delay(0.2)
					for i = 1, #TempCard do
						local CARD = TempCard[i]
						local percent = 0.85 + (i - 0.999) / (#TempCard - 0.998) * 0.3
						G.E_MANAGER:add_event(Event({
							trigger = "after",
							delay = 0.15,
							func = function()
								CARD:flip()
								CARD:set_ability(
									G.P_CENTERS[pseudorandom_element(
										G.P_CENTER_POOLS.Consumeables,
										pseudoseed("cry_variable")
									).key],
									true,
									nil
								)
								play_sound("tarot2", percent)
								CARD:juice_up(0.3, 0.3)
								return true
							end,
						}))
					end
				else
					G.E_MANAGER:add_event(Event({
						trigger = "after",
						delay = 0.4,
						func = function()
							play_sound("tarot1")
							return true
						end,
					}))
					for i = 1, #TempCard do
						local percent = 1.15 - (i - 0.999) / (#TempCard - 0.998) * 0.3
						G.E_MANAGER:add_event(Event({
							trigger = "after",
							delay = 0.15,
							func = function()
								TempCard[i]:flip()
								play_sound("card1", percent)
								TempCard[i]:juice_up(0.3, 0.3)
								return true
							end,
						}))
					end
					delay(0.2)
					for i = 1, #TempCard do
						G.E_MANAGER:add_event(Event({
							trigger = "after",
							delay = 0.1,
							func = function()
								local card = TempCard[i]
								local suit_prefix = string.sub(card.base.suit, 1, 1) .. "_"
								local r2suffix = nil
								if rank_suffix < 10 then
									r2suffix = tostring(rank_suffix)
								elseif rank_suffix == 10 then
									r2suffix = "T"
								elseif rank_suffix == 11 then
									r2suffix = "J"
								elseif rank_suffix == 12 then
									r2suffix = "Q"
								elseif rank_suffix == 13 then
									r2suffix = "K"
								elseif rank_suffix == 14 then
									r2suffix = "A"
								end
								card:set_base(G.P_CARDS[suit_prefix .. r2suffix])
								return true
							end,
						}))
					end
					for i = 1, #TempCard do
						local percent = 0.85 + (i - 0.999) / (#TempCard - 0.998) * 0.3
						G.E_MANAGER:add_event(Event({
							trigger = "after",
							delay = 0.15,
							func = function()
								TempCard[i]:flip()
								play_sound("tarot2", percent, 0.6)
								TempCard[i]:juice_up(0.3, 0.3)
								return true
							end,
						}))
					end
					G.E_MANAGER:add_event(Event({
						trigger = "after",
						delay = 0.2,
						func = function()
							G.hand:unhighlight_all()
							return true
						end,
					}))
					delay(0.5)
				end
				G.CHOOSE_RANK:remove()
			end
		end

		G.FUNCS.variable_cancel = function()
			G.CHOOSE_RANK:remove()
			G.GAME.USING_CODE = false
		end
	end,
}
local class = {
	cry_credits = {
		idea = {
			"HexaCryonic",
		},
		art = {
			"HexaCryonic",
		},
		code = {
			"Math",
		},
	},
	dependencies = {
		items = {
			"set_cry_code",
		},
	},
	object_type = "Consumable",
	set = "Code",
	key = "class",
	name = "cry-Class",
	atlas = "atlasnotjokers",
	pos = {
		x = 11,
		y = 1,
	},
	cost = 4,
	order = 16,
	config = { max_highlighted = 1, extra = { enteredrank = "" } },
	loc_vars = function(self, info_queue, card)
		return { vars = { Cryptid.safe_get(card, "ability", "max_highlighted") or self.config.max_highlighted } }
	end,
	use = function(self, card, area, copier)
		G.GAME.USING_CODE = true
		G.ENTERED_ENH = ""
		G.CHOOSE_ENH = UIBox({
			definition = create_UIBox_class(card),
			config = {
				align = "cm",
				offset = { x = 0, y = 10 },
				major = G.ROOM_ATTACH,
				bond = "Weak",
				instance_type = "POPUP",
			},
		})
		G.CHOOSE_ENH.alignment.offset.y = 0
		G.ROOM.jiggle = G.ROOM.jiggle + 1
		G.CHOOSE_ENH:align_to_major()
	end,
	init = function(self)
		function create_UIBox_class(card)
			G.E_MANAGER:add_event(Event({
				blockable = false,
				func = function()
					G.REFRESH_ALERTS = true
					return true
				end,
			}))
			local t = create_UIBox_generic_options({
				no_back = true,
				colour = HEX("04200c"),
				outline_colour = G.C.SECONDARY_SET.Code,
				contents = {
					{
						n = G.UIT.R,
						nodes = {
							create_text_input({
								colour = G.C.SET.Code,
								hooked_colour = darken(copy_table(G.C.SET.Code), 0.3),
								w = 4.5,
								h = 1,
								max_length = 16,
								prompt_text = localize("cry_code_enh"),
								ref_table = G,
								ref_value = "ENTERED_ENH",
								keyboard_offset = 1,
							}),
						},
					},
					{
						n = G.UIT.R,
						nodes = {
							UIBox_button({
								colour = G.C.SET.Code,
								button = "class_apply",
								label = { localize("cry_code_apply") },
								minw = 4.5,
								focus_args = { snap_to = true },
							}),
						},
					},
					{
						n = G.UIT.R,
						nodes = {
							UIBox_button({
								colour = G.C.RED,
								button = "class_apply_previous",
								label = { localize("cry_code_apply_previous") },
								minw = 4.5,
								focus_args = { snap_to = true },
							}),
						},
					},
					{
						n = G.UIT.R,
						nodes = {
							UIBox_button({
								colour = G.C.RED,
								button = "class_cancel",
								label = { localize("cry_code_cancel") },
								minw = 4.5,
								focus_args = { snap_to = true },
							}),
						},
					},
				},
			})
			return t
		end

		G.FUNCS.class_apply_previous = function()
			if G.PREVIOUS_ENTERED_ENH then
				G.ENTERED_ENH = G.PREVIOUS_ENTERED_ENH or ""
			end
			G.FUNCS.class_apply()
		end
		--todo: mod support
		G.FUNCS.class_apply = function()
			local enh_table = {
				m_bonus = { "bonus" },
				m_mult = { "mult", "red" },
				m_wild = { "wild", "suit" },
				m_glass = { "glass", "xmult" },
				m_steel = { "steel", "metal", "grey" },
				m_stone = { "stone", "chip", "chips" },
				m_gold = { "gold", "money", "yellow" },
				m_lucky = { "lucky", "rng" },
				m_cry_echo = { "echo", "retrigger", "retriggers" },
				m_cry_light = { "light" },
				ccd = { "ccd" },
				null = { "nil" },
			}

			local enh_suffix = nil

			for i, v in pairs(enh_table) do
				for j, k in pairs(v) do
					if string.lower(G.ENTERED_ENH) == string.lower(k) then
						enh_suffix = i
					end
				end
			end

			if enh_suffix then
				local TempCard = {}
				for i = 1, #G.hand.highlighted do
					TempCard[i] = G.hand.highlighted[i]
				end
				G.PREVIOUS_ENTERED_ENH = G.ENTERED_ENH
				G.GAME.USING_CODE = false
				if enh_suffix == "ccd" then
					check_for_unlock({ type = "cheat_used" })
					G.E_MANAGER:add_event(Event({
						trigger = "after",
						delay = 0.4,
						func = function()
							play_sound("tarot1")
							return true
						end,
					}))
					for i = 1, #TempCard do
						local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
						G.E_MANAGER:add_event(Event({
							trigger = "after",
							delay = 0.15,
							func = function()
								TempCard[i]:flip()
								play_sound("card1", percent)
								TempCard[i]:juice_up(0.3, 0.3)
								return true
							end,
						}))
						delay(0.2)
					end
					for i = 1, #TempCard do
						local CARD = TempCard[i]
						local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
						G.E_MANAGER:add_event(Event({
							trigger = "after",
							delay = 0.15,
							func = function()
								CARD:flip()
								CARD:set_ability(Cryptid.random_consumable("cry_class"), true, nil)
								play_sound("tarot2", percent)
								CARD:juice_up(0.3, 0.3)
								return true
							end,
						}))
					end
				elseif enh_suffix == "null" then
					local destroyed_cards = {}
					check_for_unlock({ type = "cheat_used" })
					for i = #TempCard, 1, -1 do
						local card = TempCard[i]
						if not card.ability.eternal then
							destroyed_cards[#destroyed_cards + 1] = TempCard[i]
							if card.ability.name == "Glass Card" then
								card:shatter()
							else
								card:start_dissolve(nil, i == #TempCard)
							end
						end
					end
					if destroyed_cards[1] then
						for j = 1, #G.jokers.cards do
							eval_card(
								G.jokers.cards[j],
								{ cardarea = G.jokers, remove_playing_cards = true, removed = destroyed_cards }
							)
						end
					end
					G.CHOOSE_ENH:remove()
					return
				else
					G.E_MANAGER:add_event(Event({
						trigger = "after",
						delay = 0.4,
						func = function()
							play_sound("tarot1")
							return true
						end,
					}))
					for i = 1, #TempCard do
						local percent = 1.15 - (i - 0.999) / (#TempCard - 0.998) * 0.3
						G.E_MANAGER:add_event(Event({
							trigger = "after",
							delay = 0.15,
							func = function()
								TempCard[i]:flip()
								play_sound("card1", percent)
								TempCard[i]:juice_up(0.3, 0.3)
								return true
							end,
						}))
					end
					delay(0.2)
					for i = 1, #TempCard do
						G.E_MANAGER:add_event(Event({
							trigger = "after",
							delay = 0.1,
							func = function()
								TempCard[i]:set_ability(G.P_CENTERS[enh_suffix])
								return true
							end,
						}))
					end
					for i = 1, #TempCard do
						local percent = 0.85 + (i - 0.999) / (#TempCard - 0.998) * 0.3
						G.E_MANAGER:add_event(Event({
							trigger = "after",
							delay = 0.15,
							func = function()
								TempCard[i]:flip()
								play_sound("tarot2", percent, 0.6)
								TempCard[i]:juice_up(0.3, 0.3)
								return true
							end,
						}))
					end
				end
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0.2,
					func = function()
						G.hand:unhighlight_all()
						return true
					end,
				}))
				delay(0.5)
				G.CHOOSE_ENH:remove()
			end
		end

		G.FUNCS.class_cancel = function()
			G.GAME.USING_CODE = false
			G.CHOOSE_ENH:remove()
		end
	end,
}
local commit = {
	cry_credits = {
		idea = {
			"HexaCryonic",
		},
		art = {
			"HexaCryonic",
		},
		code = {
			"Math",
		},
	},
	dependencies = {
		items = {
			"set_cry_code",
		},
	},
	object_type = "Consumable",
	set = "Code",
	key = "commit",
	name = "cry-Commit",
	atlas = "atlasnotjokers",
	pos = {
		x = 8,
		y = 2,
	},
	cost = 4,
	order = 31,
	can_use = function(self, card)
		return #G.jokers.highlighted == 1
			and not G.jokers.highlighted[1].ability.eternal
			and not (
				type(G.jokers.highlighted[1].config.center.rarity) == "number"
				and G.jokers.highlighted[1].config.center.rarity >= 5
			)
	end,
	use = function(self, card, area, copier)
		local deleted_joker_key = G.jokers.highlighted[1].config.center.key
		local rarity = G.jokers.highlighted[1].config.center.rarity
		local legendary = nil
		--please someone add a rarity api to steamodded
		if rarity == 1 then
			rarity = 0
		elseif rarity == 2 then
			rarity = 0.9
		elseif rarity == 3 then
			rarity = 0.99
		elseif rarity == 4 then
			rarity = nil
			legendary = true
		end -- Deleted check for "cry epic" it was giving rare jokers by setting rarity to 1
		local _first_dissolve = nil
		G.E_MANAGER:add_event(Event({
			trigger = "before",
			delay = 0.75,
			func = function()
				G.jokers.highlighted[1]:start_dissolve(nil, _first_dissolve)
				_first_dissolve = true
				return true
			end,
		}))
		G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 0.4,
			func = function()
				play_sound("timpani")
				local card = create_card("Joker", G.jokers, legendary, rarity, nil, nil, nil, "cry_commit")
				card:add_to_deck()
				G.jokers:emplace(card)
				card:juice_up(0.3, 0.5)
				if card.config.center.key == deleted_joker_key then
					check_for_unlock({ type = "pr_unlock" })
				end
				return true
			end,
		}))
	end,
}
local merge = {
	cry_credits = {
		idea = {
			"HexaCryonic",
		},
		art = {
			"HexaCryonic",
		},
		code = {
			"Math",
		},
	},
	dependencies = {
		items = {
			"set_cry_code",
		},
	},
	object_type = "Consumable",
	set = "Code",
	key = "merge",
	name = "cry-Merge",
	atlas = "atlasnotjokers",
	pos = {
		x = 7,
		y = 2,
	},
	cost = 4,
	order = 21,
	can_use = function(self, card)
		if #G.hand.highlighted ~= 1 + (card.area == G.hand and 1 or 0) then
			return false
		end
		if #G.consumeables.highlighted ~= 1 + (card.area == G.consumeables and 1 or 0) then
			return false
		end
		local n = 1
		if G.hand.highlighted[1] == card then
			n = 2
		end
		if G.hand.highlighted[n].ability.consumeable then
			return false
		end
		local m = 1
		if G.consumeables.highlighted[1] == card then
			m = 2
		end
		if
			G.consumeables.highlighted[m].ability.eternal
			or G.consumeables.highlighted[m].ability.set == "Unique"
			or not G.consumeables.highlighted[m].ability.consumeable
		then
			return false
		end
		return true
	end,
	use = function(self, card, area, copier)
		G.E_MANAGER:add_event(Event({
			trigger = "immediate",
			func = function()
				G.cry_mergearea1 =
					CardArea(G.play.T.x, G.play.T.y, G.play.T.w, G.play.T.h, { type = "play", card_limit = 5 })
				G.cry_mergearea2 =
					CardArea(G.play.T.x, G.play.T.y, G.play.T.w, G.play.T.h, { type = "play", card_limit = 5 })
				area:remove_from_highlighted(card)
				local key = G.consumeables.highlighted[1].config.center.key
				local c = G.consumeables.highlighted[1]
				local CARD = G.hand.highlighted[1]
				card:start_dissolve()
				play_sound("card1")
				G.consumeables:remove_from_highlighted(c)
				CARD.area = G.cry_mergearea1
				c.area = G.cry_mergearea2
				draw_card(G.hand, G.cry_mergearea1, 1, "up", true, CARD)
				draw_card(G.consumeables, G.cry_mergearea2, 1, "up", true, c)
				delay(0.2)
				CARD:flip()
				c:flip()
				delay(0.2)
				local percent = 0.85 + (1 - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0.2,
					func = function()
						play_sound("timpani")
						c:start_dissolve(nil, nil, 0)
						CARD:flip()
						CARD:set_ability(G.P_CENTERS[key], true, nil)
						play_sound("tarot2", percent)
						CARD:juice_up(0.3, 0.3)
						return true
					end,
				}))
				delay(0.5)
				draw_card(G.cry_mergearea1, G.hand, 1, "up", true, CARD)
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0.5,
					func = function()
						G.cry_mergearea2:remove_card(c)
						G.cry_mergearea2:remove()
						G.cry_mergearea1:remove()
						G.cry_mergearea1 = nil
						G.cry_mergearea2 = nil
						return true
					end,
				}))
				return true
			end,
		}))
	end,
}
local multiply = {
	cry_credits = {
		idea = {
			"HexaCryonic",
		},
		art = {
			"HexaCryonic",
		},
		code = {
			"Math",
		},
	},
	dependencies = {
		items = {
			"set_cry_code",
		},
	},
	object_type = "Consumable",
	set = "Code",
	key = "multiply",
	name = "cry-Multiply",
	atlas = "atlasnotjokers",
	order = 24,
	pos = {
		x = 10,
		y = 2,
	},
	cost = 4,
	can_use = function(self, card)
		if not G.GAME.modifiers.cry_beta then
			return #G.jokers.highlighted == 1 and not Card.no(G.jokers.highlighted[1], "immutable", true)
		else
			return #G.jokers.highlighted == 2
				and not (
					Card.no(G.jokers.highlighted[1], "immutable", true)
					or Card.no(G.jokers.highlighted[2], "immutable", true)
				)
		end
	end,
	use = function(self, card, area, copier)
		if not G.jokers.highlighted[1].config.cry_multiply then
			G.jokers.highlighted[1].config.cry_multiply = 1
		end
		G.jokers.highlighted[1].config.cry_multiply = G.jokers.highlighted[1].config.cry_multiply * 2
		Cryptid.with_deck_effects(G.jokers.highlighted[1], function(card)
			Cryptid.misprintize(card, { min = 2, max = 2 }, nil, true)
		end)
	end,
	init = function(self)
		--reset Jokers at end of round
		local er = end_round
		function end_round()
			er()
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i].config.cry_multiply then
					m = G.jokers.cards[i].config.cry_multiply
					Cryptid.with_deck_effects(G.jokers.cards[i], function(card)
						Cryptid.misprintize(card, { min = 1 / m, max = 1 / m }, nil, true)
					end)
					G.jokers.cards[i].config.cry_multiply = nil
				end
			end
		end
	end,
}
local divide = {
	cry_credits = {
		idea = {
			"HexaCryonic",
		},
		art = {
			"HexaCryonic",
		},
		code = {
			"Math",
		},
	},
	dependencies = {
		items = {
			"set_cry_code",
		},
	},
	object_type = "Consumable",
	set = "Code",
	key = "divide",
	name = "cry-Divide",
	atlas = "atlasnotjokers",
	order = 23,
	pos = {
		x = 9,
		y = 2,
	},
	cost = 4,
	can_use = function(self, card)
		return G.STATE == G.STATES.SHOP
	end,
	can_bulk_use = true,
	use = function(self, card, area, copier)
		for i = 1, #G.shop_jokers.cards do
			local c = G.shop_jokers.cards[i]
			c.misprint_cost_fac = (c.misprint_cost_fac or 1) * 0.5
			c:set_cost()
		end
		for i = 1, #G.shop_booster.cards do
			local c = G.shop_booster.cards[i]
			c.misprint_cost_fac = (c.misprint_cost_fac or 1) * 0.5
			c:set_cost()
		end
		for i = 1, #G.shop_vouchers.cards do
			local c = G.shop_vouchers.cards[i]
			c.misprint_cost_fac = (c.misprint_cost_fac or 1) * 0.5
			c:set_cost()
		end
	end,
	bulk_use = function(self, card, area, copier, number)
		for i = 1, #G.shop_jokers.cards do
			local c = G.shop_jokers.cards[i]
			c.misprint_cost_fac = (c.misprint_cost_fac or 1) / (2 ^ number)
			c:set_cost()
		end
		for i = 1, #G.shop_booster.cards do
			local c = G.shop_booster.cards[i]
			c.misprint_cost_fac = (c.misprint_cost_fac or 1) / (2 ^ number)
			c:set_cost()
		end
		for i = 1, #G.shop_vouchers.cards do
			local c = G.shop_vouchers.cards[i]
			c.misprint_cost_fac = (c.misprint_cost_fac or 1) / (2 ^ number)
			c:set_cost()
		end
	end,
}
local delete = {
	cry_credits = {
		idea = {
			"Mjiojio",
		},
		art = {
			"HexaCryonic",
		},
		code = {
			"Math",
			"Toneblock",
		},
	},
	dependencies = {
		items = {
			"set_cry_code",
		},
	},
	object_type = "Consumable",
	set = "Code",
	key = "delete",
	name = "cry-Delete",
	atlas = "atlasnotjokers",
	order = 18,
	pos = {
		x = 11,
		y = 2,
	},
	cost = 4,
	config = { cry_multiuse = 3 },
	loc_vars = function(self, info_queue, card)
		return { vars = { Cryptid.safe_get(card, "ability", "cry_multiuse") or self.config.cry_multiuse } }
	end,
	can_use = function(self, card)
		return G.STATE == G.STATES.SHOP
			and card.area == G.consumeables
			and #G.shop_jokers.highlighted + #G.shop_booster.highlighted + #G.shop_vouchers.highlighted == 1
			and G.shop_jokers.highlighted[1] ~= self
			and G.shop_booster.highlighted[1] ~= self
			and G.shop_vouchers.highlighted[1] ~= self
	end,
	use = function(self, card, area, copier)
		if not G.GAME.banned_keys then
			G.GAME.banned_keys = {}
		end -- i have no idea if this is always initialised already tbh
		if not G.GAME.cry_banned_pcards then
			G.GAME.cry_banned_pcards = {}
		end
		local a = nil
		local c = nil
		local _p = nil
		if G.shop_jokers.highlighted[1] then
			_p = not not G.shop_jokers.highlighted[1].base.value
			a = G.shop_jokers
			c = G.shop_jokers.highlighted[1]
		end
		if G.shop_booster.highlighted[1] then
			a = G.shop_booster
			c = G.shop_booster.highlighted[1]
		end
		if G.shop_vouchers.highlighted[1] then
			a = G.shop_vouchers
			c = G.shop_vouchers.highlighted[1]
			if c.shop_voucher then
				G.GAME.current_round.voucher.spawn[c.config.center.key] = nil
				G.GAME.current_round.cry_voucher_edition = nil
				G.GAME.current_round.cry_voucher_stickers =
					{ eternal = false, perishable = false, rental = false, pinned = false, banana = false }
			end
		end
		if c.config.center.rarity == "cry_exotic" then
			check_for_unlock({ type = "what_have_you_done" })
		end

		G.GAME.cry_banished_keys[c.config.center.key] = true

		-- blanket ban all boosters of a specific type
		if a == G.shop_booster then
			local _center = c.config.center
			for k, v in pairs(G.P_CENTER_POOLS.Booster) do
				if
					_center.kind == v.kind
					and _center.config.extra == v.config.extra
					and _center.config.choose == v.config.choose
				then
					G.GAME.cry_banished_keys[v.key] = true
				end
			end
		end

		if _p then
			for k, v in pairs(G.P_CARDS) do
				-- blanket banning ranks here, probably more useful
				if v.value == c.base.value then -- and v.suit == c.base.suit
					G.GAME.cry_banned_pcards[k] = true
				end
			end
		end
		c:start_dissolve()
	end,
	init = function(self)
		-- dumb hook because i don't feel like aggressively patching get_pack to do stuff
		-- very inefficient
		-- maybe smods should overwrite the function and make it more targetable?
		local getpackref = get_pack
		function get_pack(_key, _type)
			local temp_banned = copy_table(G.GAME.banned_keys)
			for k, v in pairs(G.GAME.cry_banished_keys) do
				G.GAME.banned_keys[k] = v
			end
			local ret = getpackref(_key, _type)
			G.GAME.banned_keys = copy_table(temp_banned)
			return ret
		end
	end,
	-- i was gonna use this function and all but... i don't like the way it does things
	-- leaving it here so nobody screams at me
	--[[
	keep_on_use = function(self, card)
		if card.ability.cry_multiuse <= 1 then
			return false
		else
			card.ability.cry_multiuse = card.ability.cry_multiuse - 1
			delay(0.3)
			card:juice_up()
			play_sound('tarot1')
			card_eval_status_text(card, 'extra', nil, nil, nil, {message = card.ability.cry_multiuse, colour = G.C.SECONDARY_SET.Code})
			return true
		end
	end,
	]]
}
local spaghetti = {
	cry_credits = {
		idea = {
			"HexaCryonic",
		},
		art = {
			"HexaCryonic",
		},
		code = {
			"Math",
		},
	},
	dependencies = {
		items = {
			"set_cry_code",
		},
	},
	object_type = "Consumable",
	set = "Code",
	key = "spaghetti",
	name = "cry-Spaghetti",
	atlas = "atlasnotjokers",
	order = 13,
	pos = {
		x = 12,
		y = 2,
	},
	cost = 4,
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.e_cry_glitched
		info_queue[#info_queue + 1] = { set = "Other", key = "food_jokers" }
	end,
	can_use = function(self, card)
		return true
	end,
	use = function(self, card, area, copier)
		local card = create_card("Food", G.jokers, nil, nil, nil, nil, nil, "cry_spaghetti")
		card:set_edition({
			cry_glitched = true,
		})
		card:add_to_deck()
		G.jokers:emplace(card)
	end,
}
local machinecode = {
	cry_credits = {
		idea = {
			"HexaCryonic",
		},
		art = {
			"HexaCryonic",
		},
		code = {
			"Math",
		},
	},
	dependencies = {
		items = {
			"set_cry_code",
		},
	},
	object_type = "Consumable",
	set = "Code",
	name = "cry-Machine Code",
	key = "machinecode",
	pos = { x = 7, y = 3 },
	cost = 3,
	atlas = "atlasnotjokers",
	order = 19,
	can_use = function(self, card)
		return true
	end,
	can_bulk_use = true,
	loc_vars = function(self, info_queue, center)
		return {
			main_start = {
				Cryptid.randomchar(codechars6),
				Cryptid.randomchar(codechars6),
				Cryptid.randomchar(codechars6),
				Cryptid.randomchar(codechars6),
				Cryptid.randomchar(codechars6),
				Cryptid.randomchar(codechars6),
			},
		}
	end,
	use = function(self, card, area, copier)
		local card = create_card(
			"Consumeables",
			G.consumeables,
			nil,
			nil,
			nil,
			nil,
			Cryptid.random_consumable("cry_machinecode", nil, "c_cry_machinecode").key,
			c_cry_machinecode
		)
		card:set_edition({ cry_glitched = true })
		card:add_to_deck()
		G.consumeables:emplace(card)
	end,
	bulk_use = function(self, card, area, copier, number)
		local a = {}
		local b
		for i = 1, number do
			b = Cryptid.random_consumable("cry_machinecode", nil, "c_cry_machinecode")
			a[b] = (a[b] or 0) + 1
		end
		for k, v in pairs(a) do
			local card = create_card("Consumeables", G.consumeables, nil, nil, nil, nil, k.key)
			card:set_edition({ cry_glitched = true })
			card:add_to_deck()
			if Incantation then
				card:setQty(v)
			end
			G.consumeables:emplace(card)
		end
		G.E_MANAGER:add_event(Event({
			trigger = "after",
			func = function()
				a = nil
				return true
			end,
		}))
	end,
	init = function(self)
		--Machine Code rendering
		codechars2 = { "!", "'", ",", ".", ":", ";", "i", "l", "|", "¡", "¦", "ì", "í", "ı" }
		codechars4 = { " ", "(", ")", "[", "]", "j", "î", "ī", "ĭ" }
		codechars5 = { '"', "*", "<", ">", "{", "}", "¨", "°", "º", "×" }
		codechars6 = {
			"$",
			"%",
			"+",
			"-",
			"/",
			"0",
			"1",
			"2",
			"3",
			"4",
			"5",
			"6",
			"7",
			"8",
			"9",
			"=",
			"?",
			"A",
			"B",
			"C",
			"D",
			"E",
			"F",
			"G",
			"H",
			"I",
			"J",
			"K",
			"L",
			"N",
			"O",
			"P",
			"R",
			"S",
			"T",
			"U",
			"V",
			"Y",
			"Z",
			"\\",
			"^",
			"_",
			"a",
			"b",
			"c",
			"d",
			"e",
			"f",
			"g",
			"h",
			"k",
			"n",
			"o",
			"p",
			"q",
			"r",
			"s",
			"t",
			"u",
			"v",
			"y",
			"z",
			"~",
			"¢",
			"¥",
			"§",
			"¬",
			"±",
			"¿",
			"À",
			"Á",
			"Â",
			"Ã",
			"Ä",
			"Å",
			"Ç",
			"È",
			"É",
			"Ê",
			"Ë",
			"Ì",
			"Í",
			"Î",
			"Ï",
			"Ñ",
			"Ò",
			"Ó",
			"Ô",
			"Õ",
			"Ö",
			"Ù",
			"Ú",
			"Û",
			"Ü",
			"Ý",
			"Þ",
			"à",
			"á",
			"â",
			"ã",
			"ä",
			"å",
			"ç",
			"è",
			"é",
			"ê",
			"ë",
			"ï",
			"ñ",
			"ò",
			"ó",
			"ô",
			"õ",
			"ö",
			"÷",
			"ù",
			"ú",
			"û",
			"ü",
			"ý",
			"þ",
			"ÿ",
			"Ā",
			"ā",
			"Ă",
			"ă",
			"Ć",
			"ć",
			"Ē",
			"ē",
			"Ĕ",
			"ĕ",
			"Ğ",
			"ğ",
			"Ī",
			"Ĭ",
			"İ",
			"ł",
			"Ń",
			"ń",
			"Ō",
			"ō",
			"Ŏ",
			"ŏ",
			"Ś",
			"ś",
			"Ş",
			"ş",
			"Ū",
			"ū",
			"Ŭ",
			"ŭ",
			"Ÿ",
			"Ź",
			"ź",
			"Ż",
			"ż",
			"Ǔ",
			"ǔ",
			"μ",
		}
		codechars7 = { "#", "Q", "X", "x", "£", "ß", "Ą", "ą", "Đ", "đ", "Ę", "ę" }
		codechars8 = { "M", "W", "m", "w", "¤", "¶", "Ø", "ø", "Ł" }
		codechars9 = { "&", "@", "©", "«", "®", "»" }
		codechars10 = { "Æ", "æ", "Œ", "œ" }
		function Cryptid.randomchar(arr)
			return {
				n = G.UIT.O,
				config = {
					object = DynaText({
						string = arr,
						colours = { G.C.BLACK },
						pop_in_rate = 9999999,
						silent = true,
						random_element = true,
						pop_delay = 0.1,
						scale = 0.4,
						min_cycle_time = 0,
					}),
				},
			}
		end
	end,
}
local run = {
	cry_credits = {
		idea = {
			"Mjiojio",
		},
		art = {
			"HexaCryonic",
		},
		code = {
			"Math",
		},
	},
	dependencies = {
		items = {
			"set_cry_code",
		},
	},
	object_type = "Consumable",
	set = "Code",
	name = "cry-Run",
	key = "run",
	pos = { x = 12, y = 0 },
	cost = 3,
	atlas = "atlasnotjokers",
	order = 6,
	can_use = function(self, card)
		return Cryptid.safe_get(G.GAME, "blind", "in_blind") and not G.GAME.USING_RUN
	end,
	can_bulk_use = true,
	use = function(self, card, area, copier)
		G.cry_runarea = CardArea(
			G.discard.T.x,
			G.discard.T.y,
			G.discard.T.w,
			G.discard.T.h,
			{ type = "discard", card_limit = 1e100 }
		)
		local hand_count = #G.hand.cards
		for i = 1, hand_count do
			draw_card(G.hand, G.cry_runarea, i * 100 / hand_count, "down", nil, nil, 0.07)
		end
		G.E_MANAGER:add_event(Event({
			trigger = "immediate",
			func = function()
				G.GAME.current_round.jokers_purchased = 0
				G.STATE = G.STATES.SHOP
				G.GAME.USING_CODE = true
				G.GAME.USING_RUN = true
				G.GAME.RUN_STATE_COMPLETE = 0
				G.GAME.shop_free = nil
				G.GAME.shop_d6ed = nil
				G.STATE_COMPLETE = false
				G.GAME.current_round.used_packs = {}
				return true
			end,
		}))
	end,
	init = function(self)
		local gfts = G.FUNCS.toggle_shop
		G.FUNCS.toggle_shop = function(e)
			gfts(e)
			if G.GAME.USING_RUN then
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0.5,
					func = function()
						G.GAME.USING_RUN = false
						G.GAME.USING_CODE = false
						return true
					end,
				}))
				local hand_count = #G.cry_runarea.cards
				for i = 1, hand_count do
					draw_card(G.cry_runarea, G.hand, i * 100 / hand_count, "up", true)
				end
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0.5,
					func = function()
						G.GAME.current_round.used_packs = {}
						G.cry_runarea:remove()
						G.cry_runarea = nil
						G.STATE = G.STATES.SELECTING_HAND
						return true
					end,
				}))
			end
		end
		local gus = Game.update_shop
		function Game:update_shop(dt)
			gus(self, dt)
			if G.GAME.USING_RUN and G.STATE_COMPLETE and G.GAME.RUN_STATE_COMPLETE < 60 then
				G.shop.alignment.offset.y = -5.3
				G.GAME.RUN_STATE_COMPLETE = G.GAME.RUN_STATE_COMPLETE + 1
			end
		end
		local guis = G.UIDEF.shop
		function G.UIDEF.shop()
			local ret = guis()
			if G.GAME.USING_RUN then
				G.SHOP_SIGN:remove()
				G.SHOP_SIGN = {
					remove = function()
						return true
					end,
					alignment = { offset = { y = 0 } },
				}
			end
			return ret
		end
	end,
}
local exploit = {
	cry_credits = {
		idea = {
			"Mjiojio",
		},
		art = {
			"HexaCryonic",
		},
		code = {
			"Toneblock",
		},
	},
	dependencies = {
		items = {
			"set_cry_code",
		},
	},
	object_type = "Consumable",
	set = "Code",
	key = "exploit",
	name = "cry-Exploit",
	atlas = "atlasnotjokers",
	pos = {
		x = 8,
		y = 3,
	},
	cost = 4,
	order = 28,
	config = { cry_multiuse = 2, extra = { enteredhand = "" } }, -- i don't think this ever uses config...?
	loc_vars = function(self, info_queue, card)
		return { vars = { Cryptid.safe_get(card, "ability", "cry_multiuse") or self.config.cry_multiuse } }
	end,
	can_use = function(self, card)
		return true
	end,
	use = function(self, card, area, copier)
		G.GAME.USING_CODE = true
		G.ENTERED_HAND = ""
		G.CHOOSE_HAND = UIBox({
			definition = create_UIBox_exploit(card),
			config = {
				align = "cm",
				offset = { x = 0, y = 10 },
				major = G.ROOM_ATTACH,
				bond = "Weak",
				instance_type = "POPUP",
			},
		})
		G.CHOOSE_HAND.alignment.offset.y = 0
		G.ROOM.jiggle = G.ROOM.jiggle + 1
		G.CHOOSE_HAND:align_to_major()
	end,
	init = function(self)
		function create_UIBox_exploit(card)
			G.E_MANAGER:add_event(Event({
				blockable = false,
				func = function()
					G.REFRESH_ALERTS = true
					return true
				end,
			}))
			local t = create_UIBox_generic_options({
				no_back = true,
				colour = HEX("04200c"),
				outline_colour = G.C.SECONDARY_SET.Code,
				contents = {
					{
						n = G.UIT.R,
						nodes = {
							create_text_input({
								colour = G.C.SET.Code,
								hooked_colour = darken(copy_table(G.C.SET.Code), 0.3),
								w = 4.5,
								h = 1,
								max_length = 24,
								extended_corpus = true,
								prompt_text = localize("cry_code_hand"),
								ref_table = G,
								ref_value = "ENTERED_HAND",
								keyboard_offset = 1,
							}),
						},
					},
					{
						n = G.UIT.R,
						nodes = {
							UIBox_button({
								colour = G.C.SET.Code,
								button = "exploit_apply",
								label = { localize("cry_code_exploit") },
								minw = 4.5,
								focus_args = { snap_to = true },
							}),
						},
					},
					{
						n = G.UIT.R,
						nodes = {
							UIBox_button({
								colour = G.C.RED,
								button = "exploit_apply_previous",
								label = { localize("cry_code_exploit_previous") },
								minw = 4.5,
								focus_args = { snap_to = true },
							}),
						},
					},
					{
						n = G.UIT.R,
						nodes = {
							UIBox_button({
								colour = G.C.RED,
								button = "exploit_cancel",
								label = { localize("cry_code_cancel") },
								minw = 4.5,
								focus_args = { snap_to = true },
							}),
						},
					},
				},
			})
			return t
		end
		G.FUNCS.exploit_apply_previous = function()
			if G.PREVIOUS_ENTERED_HAND then
				G.ENTERED_HAND = G.PREVIOUS_ENTERED_HAND or ""
			end
			G.FUNCS.exploit_apply()
		end
		G.FUNCS.exploit_apply = function()
			local hand_table = {
				["High Card"] = {
					"high card",
					"high",
					"1oak",
					"1 of a kind",
					"haha one",
				},
				["Pair"] = {
					"pair",
					"2oak",
					"2 of a kind",
					"m",
					"window",
				},
				["Two Pair"] = {
					"two pair",
					"2 pair",
					"mm",
					"pairpair",
					"pair of a kind",
				},
				["Three of a Kind"] = {
					"three of a kind",
					"3 of a kind",
					"3oak",
					"trips",
					"triangle",
				},
				["Straight"] = {
					"straight",
					"lesbian",
					"gay",
					"bisexual",
					"asexual",
					"staircase",
				},
				["Flush"] = {
					"flush",
					"skibidi",
					"toilet",
					"floosh",
					"monotone",
				},
				["Full House"] = {
					"full house",
					"full",
					"that 70s show",
					"modern family",
					"family matters",
					"the middle",
				},
				["Four of a Kind"] = {
					"four of a kind",
					"4 of a kind",
					"4oak",
					"22oakoak",
					"quads",
					"four to the floor",
				},
				["Straight Flush"] = {
					"straight flush",
					"strush",
					"slush",
					"slushie",
					"slushy",
					"monotone staircase",
				},
				["Five of a Kind"] = {
					"five of a kind",
					"5 of a kind",
					"5oak",
					"quints",
				},
				["Flush House"] = {
					"flush house",
					"flouse",
					"outhouse",
					"monotone house",
					"the grey house",
				},
				["Flush Five"] = {
					"flush five",
					"fish",
					"you know what that means",
					"five of a flush",
					"monotone fish",
				},
				["cry_Bulwark"] = {
					"bulwark",
					"flush rock",
					"stoned",
					"stone flush",
					"flush stone",
					"rock and stone",
				},
				["cry_Clusterfuck"] = {
					"clusterfuck",
					"fuck",
					"wtf",
					"cluster",
					"what",
				},
				["cry_UltPair"] = {
					"ultimate pair",
					"ultpair",
					"ult pair",
					"pairpairpair",
					"flush pair of a kind of a kind",
					"2f2oakoak",
					"two flush two of a kind of a kind",
				},
				["cry_WholeDeck"] = {
					"the entire fucking deck",
					"deck",
					"tefd",
					"fifty-two",
					"you are fuck deck",
					"deck of a kind",
					"the entire deck",
					"everything of a kind",
					"everything",
				},
			}
			local current_hand = nil
			for k, v in pairs(SMODS.PokerHands) do
				local index = v.key
				local current_name = G.localization.misc.poker_hands[index]
				if not hand_table[v.key] then
					hand_table[v.key] = { current_name }
				end
			end
			for i, v in pairs(hand_table) do
				for j, k in pairs(v) do
					if string.lower(G.ENTERED_HAND) == string.lower(k) then
						current_hand = i
					end
				end
			end
			if current_hand and G.GAME.hands[current_hand].visible then
				G.PREVIOUS_ENTERED_HAND = G.ENTERED_HAND
				G.GAME.cry_exploit_override = current_hand
				G.FUNCS.exploit_cancel()
				return
			end
		end
		G.FUNCS.exploit_cancel = function()
			G.CHOOSE_HAND:remove()
			G.GAME.USING_CODE = false
		end
		-- mess with poker hand evaluation
		local evaluate_poker_hand_ref = evaluate_poker_hand
		function evaluate_poker_hand(hand)
			local results = evaluate_poker_hand_ref(hand)
			if G.GAME.cry_exploit_override then
				if not results[G.GAME.cry_exploit_override][1] then
					for _, v in ipairs(G.handlist) do
						if results[v][1] then
							results[G.GAME.cry_exploit_override] = results[v]
							break
						end
					end
				end
			end
			return results
		end
		local htuis = G.FUNCS.hand_text_UI_set
		G.FUNCS.hand_text_UI_set = function(e)
			htuis(e)
			if G.GAME.cry_exploit_override then
				e.config.object.colours = { G.C.SECONDARY_SET.Code }
			else
				e.config.object.colours = { G.C.UI.TEXT_LIGHT }
			end
			e.config.object:update_text()
		end
	end,
}
local oboe = {
	cry_credits = {
		idea = {
			"HexaCryonic",
		},
		art = {
			"HexaCryonic",
		},
		code = {
			"Math",
		},
	},
	dependencies = {
		items = {
			"set_cry_code",
		},
	},
	object_type = "Consumable",
	set = "Code",
	key = "oboe",
	name = "cry-oboe",
	atlas = "atlasnotjokers",
	order = 10,
	config = { extra = { choices = 1 } },
	pos = {
		x = 9,
		y = 3,
	},
	cost = 4,
	can_bulk_use = true,
	loc_vars = function(self, info_queue, card)
		if not card then
			return { vars = { self.config.extra.choices, (Cryptid.safe_get(G.GAME, "cry_oboe") or 0) } }
		end
		return { vars = { card.ability.extra.choices, (Cryptid.safe_get(G.GAME, "cry_oboe") or 0) } }
	end,
	can_use = function(self, card)
		return true
	end,
	use = function(self, card, area, copier)
		G.GAME.cry_oboe = (G.GAME.cry_oboe or 0) + card.ability.extra.choices
	end,
	bulk_use = function(self, card, area, copier, number)
		G.GAME.cry_oboe = (G.GAME.cry_oboe or 0) + (card.ability.extra.choices * number)
	end,
}
local rework = {
	cry_credits = {
		idea = {
			"HexaCryonic",
		},
		art = {
			"HexaCryonic",
		},
		code = {
			"Math",
		},
	},
	dependencies = {
		items = {
			"set_cry_code",
		},
	},
	object_type = "Consumable",
	set = "Code",
	key = "rework",
	name = "cry-Rework",
	atlas = "atlasnotjokers",
	order = 25,
	no_pool_flag = "beta_deck",
	pos = {
		x = 10,
		y = 3,
	},
	cost = 4,
	loc_vars = function(self, info_queue)
		info_queue[#info_queue + 1] =
			{ set = "Tag", key = "tag_cry_rework", specific_vars = { "[edition]", "[joker]", "n" } }
		return { vars = {} }
	end,
	can_use = function(self, card)
		if not G.GAME.modifiers.cry_beta then
			return #G.jokers.highlighted == 1
				and not G.jokers.highlighted[1].ability.eternal
				and G.jokers.highlighted[1].ability.name
					~= ("cry-meteor" or "cry-exoplanet" or "cry-stardust" or "cry_cursed" or ("Diet Cola" or Card.get_gameset(
						card
					) == "madness"))
		else
			return #G.jokers.highlighted == 2
				and not G.jokers.highlighted[1].ability.eternal
				and G.jokers.highlighted[1].ability.name
					~= ("cry-meteor" or "cry-exoplanet" or "cry-stardust" or "cry_cursed" or ("Diet Cola" or Card.get_gameset(
						card
					) == "madness"))
		end
	end,
	use = function(self, card, area, copier)
		local jkr = G.jokers.highlighted[1]
		local found_index = 1
		if jkr.edition then
			for i, v in ipairs(G.P_CENTER_POOLS.Edition) do
				if v.key == jkr.edition.key then
					found_index = i
					break
				end
			end
		end
		found_index = found_index + 1
		if found_index > #G.P_CENTER_POOLS.Edition then
			found_index = found_index - #G.P_CENTER_POOLS.Edition
		end
		local tag = Tag("tag_cry_rework")
		if not tag.ability then
			tag.ability = {}
		end
		if jkr.config.center.key == "c_base" then
			jkr.config.center.key = "j_scholar"
		end
		tag.ability.rework_key = jkr.config.center.key
		tag.ability.rework_edition = G.P_CENTER_POOLS.Edition[found_index].key
		add_tag(tag)
		--SMODS.Tags.tag_cry_rework.apply(tag, {type = "store_joker_create"})
		G.E_MANAGER:add_event(Event({
			trigger = "before",
			delay = 0.75,
			func = function()
				jkr:start_dissolve()
				return true
			end,
		}))
	end,
}
local rework_tag = {
	cry_credits = {
		idea = {
			"HexaCryonic",
		},
		art = {
			"HexaCryonic",
		},
		code = {
			"Math",
		},
	},
	dependencies = {
		items = {
			"c_cry_rework",
		},
	},
	object_type = "Tag",
	atlas = "tag_cry",
	name = "cry-Rework Tag",
	order = 19,
	pos = { x = 0, y = 3 },
	config = { type = "store_joker_create" },
	key = "rework",
	ability = { rework_edition = nil, rework_key = nil },
	loc_vars = function(self, info_queue, tag)
		local function p(w)
			r = ""
			local vowels = { "a", "e", "i", "o", "u" }
			for i, v in ipairs(vowels) do
				if string.sub(string.lower(w), 1, 1) == v then
					r = "n"
					break
				end
			end
			return r
		end
		local ed = Cryptid.safe_get(tag, "ability", "rework_edition")
				and localize({ type = "name_text", set = "Edition", key = tag.ability.rework_edition })
			or "[" .. string.lower(localize("k_edition")) .. "]"
		return {
			vars = {
				ed,
				Cryptid.safe_get(tag, "ability", "rework_key")
						and localize({ type = "name_text", set = "Joker", key = tag.ability.rework_key })
					or "[" .. string.lower(localize("k_joker")) .. "]",
				string.sub(ed, 1, 1) ~= "[" and p(ed) or "n",
			},
		}
	end,
	apply = function(self, tag, context)
		if context.type == "store_joker_create" then
			local card = create_card("Joker", context.area, nil, nil, nil, nil, (tag.ability.rework_key or "j_scholar"))
			create_shop_card_ui(card, "Joker", context.area)
			card:set_edition((tag.ability.rework_edition or "e_foil"), true, nil, true)
			card.states.visible = false
			tag:yep("+", G.C.FILTER, function()
				card:start_materialize()
				return true
			end)
			tag.triggered = true
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.5,
				func = function()
					save_run() --fixes savescum bugs hopefully?
					return true
				end,
			}))
			return card
		end
	end,
	in_pool = function()
		return false
	end,
}
local patch = {
	dependencies = {
		items = {
			"set_cry_code",
		},
	},
	object_type = "Consumable",
	set = "Code",
	key = "patch",
	name = "cry-patch",
	atlas = "atlasnotjokers",
	order = 26,
	config = {},
	pos = {
		x = 8,
		y = 4,
	},
	cost = 4,
	can_bulk_use = true,
	loc_vars = function(self, info_queue, card)
		return {}
	end,
	can_use = function(self, card)
		return true
	end,
	use = function(self, card, area, copier)
		for i = 1, #G.hand.cards do
			local CARD = G.hand.cards[i]
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.15,
				func = function()
					CARD:flip()
					return true
				end,
			}))
		end
		for i = 1, #G.jokers.cards do
			local CARD = G.jokers.cards[i]
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.15,
				func = function()
					CARD:flip()
					return true
				end,
			}))
		end
		for i = 1, #G.consumeables.cards do
			local CARD = G.consumeables.cards[i]
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.15,
				func = function()
					CARD:flip()
					return true
				end,
			}))
		end
		delay(0.2)
		for i = 1, #G.hand.cards do
			local CARD = G.hand.cards[i]
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.15,
				func = function()
					if CARD.facing == "back" then
						CARD:flip()
					end
					CARD.debuff = false
					CARD.cry_debuff_immune = true
					play_sound("tarot2", percent)
					CARD:juice_up(0.3, 0.3)
					return true
				end,
			}))
		end
		for i = 1, #G.jokers.cards do
			local CARD = G.jokers.cards[i]
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.15,
				func = function()
					if CARD.facing == "back" then
						CARD:flip()
					end
					CARD.debuff = false
					play_sound("card1", percent)
					CARD:juice_up(0.3, 0.3)
					return true
				end,
			}))
		end
		for i = 1, #G.consumeables.cards do
			local CARD = G.consumeables.cards[i]
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.15,
				func = function()
					if CARD.facing == "back" then
						CARD:flip()
					end
					CARD.debuff = false
					play_sound("card1", percent)
					CARD:juice_up(0.3, 0.3)
					return true
				end,
			}))
		end
	end,
}
local ctrl_v = {
	cry_credits = {
		idea = {
			"ItsFlowwey",
		},
		art = {
			"HexaCryonic",
		},
		code = {
			"Foegro",
		},
	},
	dependencies = {
		items = {
			"set_cry_code",
		},
	},
	object_type = "Consumable",
	set = "Code",
	key = "ctrl_v",
	name = "cry-Ctrl-V",
	atlas = "atlasnotjokers",
	order = 27,
	config = {},
	pos = {
		x = 9,
		y = 4,
	},
	cost = 4,
	can_bulk_use = true,
	loc_vars = function(self, info_queue, card)
		return {}
	end,
	can_use = function(self, card)
		return #G.hand.highlighted + #G.consumeables.highlighted == 2
	end,
	use = function(self, card, area, copier)
		if area then
			area:remove_from_highlighted(card)
		end
		if G.hand.highlighted[1] then
			G.E_MANAGER:add_event(Event({
				func = function()
					local card = copy_card(G.hand.highlighted[1])
					card:add_to_deck()
					table.insert(G.playing_cards, card)
					G.hand:emplace(card)
					playing_card_joker_effects({ card })
					return true
				end,
			}))
		end
		if G.consumeables.highlighted[1] then
			G.E_MANAGER:add_event(Event({
				func = function()
					local card = copy_card(G.consumeables.highlighted[1])
					if card.ability.name and card.ability.name == "cry-Chambered" then
						card.ability.extra.num_copies = 1
					end
					card:add_to_deck()
					if Incantation then
						card:setQty(1)
					end
					G.consumeables:emplace(card)
					return true
				end,
			}))
		end
	end,
	bulk_use = function(self, card, area, copier, number)
		for i = 1, number do
			if area then
				area:remove_from_highlighted(card)
			end
			if G.hand.highlighted[1] then
				G.E_MANAGER:add_event(Event({
					func = function()
						local card = copy_card(G.hand.highlighted[1])
						card:add_to_deck()
						G.hand:emplace(card)
						return true
					end,
				}))
			end
			if G.consumeables.highlighted[1] then
				G.E_MANAGER:add_event(Event({
					func = function()
						local card = copy_card(G.consumeables.highlighted[1])
						if card.ability.name and card.ability.name == "cry-Chambered" then
							card.ability.extra.num_copies = 1
						end
						card:add_to_deck()
						if Incantation then
							card:setQty(1)
						end
						G.consumeables:emplace(card)
						return true
					end,
				}))
			end
		end
	end,
}
local inst = {
	cry_credits = {
		idea = {
			"HexaCryonic",
		},
		art = {
			"HexaCryonic",
		},
		code = {
			"Foegro",
		},
	},
	dependencies = {
		items = {
			"set_cry_code",
		},
	},
	object_type = "Consumable",
	set = "Code",
	key = "inst",
	name = "cry-Inst",
	atlas = "atlasnotjokers",
	order = 28,
	config = {},
	pos = {
		x = 10,
		y = 4,
	},
	cost = 4,
	can_bulk_use = true,
	loc_vars = function(self, info_queue, card)
		return {}
	end,
	can_use = function(self, card)
		local selected_cards = {}
		for i = 1, #G.hand.highlighted do
			if G.hand.highlighted[i] ~= card then
				selected_cards[#selected_cards + 1] = G.hand.highlighted[i]
			end
		end
		return #selected_cards == 1
	end,
	use = function(self, card, area, copier)
		local same = 0
		for i = 1, #G.deck.cards do
			if G.deck.cards[i].base.value == G.hand.highlighted[1].base.value then
				same = i
				draw_card(G.deck, G.hand, nil, nil, false, G.deck.cards[i])
				break
			end
		end
		for i = 1, #G.deck.cards do
			if G.deck.cards[i].base.suit == G.hand.highlighted[1].base.suit and i ~= same then
				draw_card(G.deck, G.hand, nil, nil, false, G.deck.cards[i])
				break
			end
		end
	end,
	bulk_use = function(self, card, area, copier, number)
		for j = 1, number do
			local same = 0
			for i = 1, #G.deck.cards do
				if G.deck.cards[i].base.value == G.hand.highlighted[1].base.value then
					same = i
					draw_card(G.deck, G.hand, nil, nil, false, G.deck.cards[i])
					break
				end
			end
			for i = 1, #G.deck.cards do
				if G.deck.cards[i].base.suit == G.hand.highlighted[1].base.suit and i ~= same then
					draw_card(G.deck, G.hand, nil, nil, false, G.deck.cards[i])
					break
				end
			end
		end
	end,
}
local alttab = {
	cry_credits = {
		idea = {
			"HexaCryonic",
		},
		art = {
			"HexaCryonic",
		},
		code = {
			"Toneblock",
		},
	},
	dependencies = {
		items = {
			"set_cry_code",
		},
	},
	object_type = "Consumable",
	set = "Code",
	key = "alttab",
	name = "cry-Alttab",
	atlas = "atlasnotjokers",
	order = 28,
	config = {},
	pos = {
		x = 11,
		y = 4,
	},
	cost = 4,
	can_bulk_use = true,
	loc_vars = function(self, info_queue, card)
		local ret = localize("k_none")
		if Cryptid.safe_get(G.GAME, "blind", "in_blind") then
			if G.GAME.blind:get_type() == "Small" then
				ret = localize({ type = "name_text", key = G.GAME.round_resets.blind_tags.Small, set = "Tag" })
			elseif G.GAME.blind:get_type() == "Big" then
				ret = localize({ type = "name_text", key = G.GAME.round_resets.blind_tags.Big, set = "Tag" })
			elseif G.GAME.blind:get_type() == "Boss" then
				ret = "???"
			end
		end
		if next(SMODS.find_card("j_cry_kittyprinter")) then
			ret = localize({ type = "name_text", key = "tag_cry_cat", set = "Tag" })
		end
		return { vars = { ret } }
	end,
	can_use = function(self, card)
		return Cryptid.safe_get(G.GAME, "blind", "in_blind")
	end,
	use = function(self, card, area, copier)
		local used_consumable = copier or card
		delay(0.4)
		G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 0.2,
			func = function()
				play_sound("tarot1")
				local tag = nil
				local type = G.GAME.blind:get_type()
				if next(SMODS.find_card("j_cry_kittyprinter")) then
					tag = Tag("tag_cry_cat")
				elseif type == "Boss" then
					tag = Tag(get_next_tag_key())
				else
					tag = Tag(G.GAME.round_resets.blind_tags[type])
				end
				add_tag(tag)
				used_consumable:juice_up(0.8, 0.5)
				return true
			end,
		}))
		delay(1.2)
	end,
	bulk_use = function(self, card, area, copier, number)
		local used_consumable = copier or card
		delay(0.4)
		G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 0.2,
			func = function()
				for j = 1, number do
					play_sound("tarot1")
					local tag = nil
					local type = G.GAME.blind:get_type()
					if type == "Boss" then
						tag = Tag(get_next_tag_key())
					else
						tag = Tag(G.GAME.round_resets.blind_tags[type])
					end
					add_tag(tag)
					used_consumable:juice_up(0.8, 0.5)
					delay(0.1)
				end
				return true
			end,
		}))
		delay(1.1)
	end,
}
local automaton = {
	cry_credits = {
		idea = {
			"HexaCryonic",
		},
		art = {
			"unze2unze4",
		},
		code = {
			"Math",
		},
	},
	dependencies = {
		items = {
			"set_cry_code",
		},
	},
	object_type = "Consumable",
	set = "Tarot",
	name = "cry-Automaton",
	key = "automaton",
	pos = { x = 12, y = 1 },
	config = { create = 1 },
	order = 5,
	atlas = "atlasnotjokers",
	loc_vars = function(self, info_queue, card)
		return { vars = { Cryptid.safe_get(card, "ability", "create") or self.config.create } }
	end,
	can_use = function(self, card)
		return #G.consumeables.cards < G.consumeables.config.card_limit or card.area == G.consumeables
	end,
	use = function(self, card, area, copier)
		for i = 1, math.min(card.ability.consumeable.create, G.consumeables.config.card_limit - #G.consumeables.cards) do
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.4,
				func = function()
					if G.consumeables.config.card_limit > #G.consumeables.cards then
						play_sound("timpani")
						local _card = create_card("Code", G.consumeables, nil, nil, nil, nil, nil, "cry_automaton")
						_card:add_to_deck()
						G.consumeables:emplace(_card)
						card:juice_up(0.3, 0.5)
					end
					return true
				end,
			}))
		end
		delay(0.6)
	end,
}
local green_seal = {
	dependencies = {
		items = {
			"set_cry_code",
		},
	},
	object_type = "Seal",
	name = "cry-Green-Seal",
	key = "green",
	badge_colour = HEX("12f254"), --same as code cards
	atlas = "cry_misc",
	pos = { x = 1, y = 2 },

	calculate = function(self, card, context)
		if context.cardarea == "unscored" and context.main_scoring then
			for k, v in ipairs(context.scoring_hand) do
				v.cry_green_incompat = true
			end
			for k, v in ipairs(context.full_hand) do
				if not v.cry_green_incompat then
					G.E_MANAGER:add_event(Event({
						func = function()
							if G.consumeables.config.card_limit > #G.consumeables.cards then
								local c = create_card("Code", G.consumeables, nil, nil, nil, nil, nil, "cry_green_seal")
								c:add_to_deck()
								G.consumeables:emplace(c)
								v:juice_up()
							end
							return true
						end,
					}))
				end
			end
			for k, v in ipairs(context.scoring_hand) do
				v.cry_green_incompat = nil
			end
		end
	end,
}
local source = {
	cry_credits = {
		idea = {
			"HexaCryonic",
		},
		art = {
			"HexaCryonic",
		},
		code = {
			"Math",
		},
	},
	dependencies = {
		items = {
			"cry_green",
		},
	},
	object_type = "Consumable",
	set = "Spectral",
	name = "cry-Source",
	order = 9,
	key = "source",
	config = {
		-- This will add a tooltip.
		mod_conv = "cry_green_seal",
		-- Tooltip args
		max_highlighted = 1,
	},
	loc_vars = function(self, info_queue, center)
		-- Handle creating a tooltip with set args.
		info_queue[#info_queue + 1] = { set = "Other", key = "cry_green_seal" }
		return { vars = { center.ability.max_highlighted } }
	end,
	cost = 4,
	atlas = "atlasnotjokers",
	pos = { x = 2, y = 4 },
	use = function(self, card, area, copier) --Good enough
		for i = 1, #G.hand.highlighted do
			local highlighted = G.hand.highlighted[i]
			G.E_MANAGER:add_event(Event({
				func = function()
					play_sound("tarot1")
					highlighted:juice_up(0.3, 0.5)
					return true
				end,
			}))
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.1,
				func = function()
					if highlighted then
						highlighted:set_seal("cry_green")
					end
					return true
				end,
			}))
			delay(0.5)
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.2,
				func = function()
					G.hand:unhighlight_all()
					return true
				end,
			}))
		end
	end,
}
local pointer = {
	cry_credits = {
		idea = {
			"HexaCryonic",
		},
		art = {
			"HexaCryonic",
		},
		code = {
			"Math",
		},
	},
	dependencies = {
		items = {
			"set_cry_code",
		},
	},
	object_type = "Consumable",
	set = "Spectral",
	name = "cry-Pointer",
	key = "pointer",
	pos = { x = 11, y = 3 },
	hidden = true,
	soul_set = "Code",
	order = 41,
	atlas = "atlasnotjokers",
	can_use = function(self, card)
		return true
	end,
	loc_vars = function(self, info_queue, center)
		return { vars = { (SMODS.Mods["jen"] or {}).can_load and "and OMEGA consumables " or "" } }
	end,
	use = function(self, card, area, copier)
		G.GAME.USING_CODE = true
		G.GAME.USING_POINTER = true
		G.ENTERED_CARD = ""
		G.CHOOSE_CARD = UIBox({
			definition = create_UIBox_pointer(card),
			config = {
				align = "cm",
				offset = { x = 0, y = 10 },
				major = G.ROOM_ATTACH,
				bond = "Weak",
				instance_type = "POPUP",
			},
		})
		G.CHOOSE_CARD.alignment.offset.y = 0
		G.ROOM.jiggle = G.ROOM.jiggle + 1
		G.CHOOSE_CARD:align_to_major()
		check_for_unlock({ cry_used_consumable = "c_cry_pointer" })
	end,
	init = function(self)
		function create_UIBox_pointer(card)
			G.E_MANAGER:add_event(Event({
				blockable = false,
				func = function()
					G.REFRESH_ALERTS = true
					return true
				end,
			}))
			local t = create_UIBox_generic_options({
				no_back = true,
				colour = HEX("04200c"),
				outline_colour = G.C.SECONDARY_SET.Code,
				contents = {
					{
						n = G.UIT.R,
						nodes = {
							create_text_input({
								colour = G.C.SET.Code,
								hooked_colour = darken(copy_table(G.C.SET.Code), 0.3),
								w = 4.5,
								h = 1,
								max_length = 100,
								extended_corpus = true,
								prompt_text = localize("cry_code_enter_card"),
								ref_table = G,
								ref_value = "ENTERED_CARD",
								keyboard_offset = 1,
							}),
						},
					},
					{
						n = G.UIT.R,
						config = { align = "cm" },
						nodes = {
							UIBox_button({
								colour = G.C.SET.Code,
								button = "pointer_apply",
								label = { localize("cry_code_create") },
								minw = 4.5,
								focus_args = { snap_to = true },
							}),
						},
					},
					{
						n = G.UIT.R,
						config = { align = "cm" },
						nodes = {
							UIBox_button({
								colour = G.C.SET.Code,
								button = "your_collection",
								label = { localize("b_collection_cap") },
								minw = 4.5,
								focus_args = { snap_to = true },
							}),
						},
					},
					{
						n = G.UIT.R,
						config = { align = "cm" },
						nodes = {
							UIBox_button({
								colour = G.C.RED,
								button = "pointer_apply_previous",
								label = { localize("cry_code_create_previous") },
								minw = 4.5,
								focus_args = { snap_to = true },
							}),
						},
					},
					{
						n = G.UIT.R,
						config = { align = "cm" },
						nodes = {
							UIBox_button({
								colour = G.C.RED,
								button = "pointer_cancel",
								label = { localize("cry_code_cancel") },
								minw = 4.5,
								focus_args = { snap_to = true },
							}),
						},
					},
				},
			})
			return t
		end
		G.FUNCS.pointer_cancel = function()
			G.CHOOSE_CARD:remove()
			G.GAME.USING_CODE = false
			G.GAME.USING_POINTER = false
			G.DEBUG_POINTER = false
		end
		G.FUNCS.pointer_apply_previous = function()
			if G.PREVIOUS_ENTERED_CARD then
				G.ENTERED_CARD = G.PREVIOUS_ENTERED_CARD or ""
			end
			G.FUNCS.pointer_apply()
		end
		local aliases = {
			-- Vanilla Jokers
			jimbo = "joker",
			["gary mccready"] = "joker",
			greedy = "greedy joker",
			lusty = "lusty joker",
			wrathful = "wrathful joker",
			gluttonous = "gluttonous joker",
			jolly = "jolly joker",
			zany = "zany joker",
			mad = "mad joker",
			crazy = "crazy joker",
			droll = "droll joker",
			sly = "sly joker",
			wily = "wily joker",
			clever = "clever joker",
			devious = "devious joker",
			crafty = "crafty joker",
			half = "half joker",
			stencil = "joker stencil",
			dagger = "ceremonial dagger",
			chaos = "chaos the clown",
			fib = "fibonacci",
			scary = "scary face",
			abstract = "abstract joker",
			delayedgrat = "delayed gratification",
			banana = "gros michel",
			steven = "even steven",
			todd = "odd todd",
			bus = "ride the bus",
			faceless = "faceless joker",
			todo = "to do list",
			["to-do"] = "to do list",
			square = "square joker",
			seance = "séance",
			riffraff = "riff-raff",
			cloudnine = "cloud 9",
			trousers = "spare trousers",
			ancient = "ancient joker",
			mrbones = "mr. bones",
			smeared = "smeared joker",
			wee = "wee joker",
			oopsall6s = "oops! all 6s",
			all6s = "oops! all 6s",
			oa6 = "oops! all 6s",
			idol = "the idol",
			duo = "the duo",
			trio = "the trio",
			family = "the family",
			order = "the order",
			tribe = "the tribe",
			invisible = "invisible joker",
			driverslicense = "driver's license",
			burnt = "burnt joker",
			caino = "canio",
			-- Cryptid Jokers
			house = "happy house",
			queensgambit = "queen's gambit",
			weefib = "weebonacci",
			interest = "compound interest",
			whip = "the whip",
			triplet = "triplet rhythm",
			pepper = "chili pepper",
			krusty = "krusty the clown",
			blurred = "blurred joker",
			gofp = "garden of forking paths",
			lutn = "light up the night",
			nsnm = "no sound, no memory",
			nosoundnomemory = "no sound, no memory",
			lath = "...like antennas to heaven",
			likeantennastoheaven = "...like antennas to heaven",
			consumeable = "consume-able",
			error = "j_cry_error",
			ap = "ap joker",
			rng = "rnjoker",
			filler = "the filler",
			duos = "the duos",
			home = "the home",
			nuts = "the nuts",
			quintet = "the quintet",
			unity = "the unity",
			swarm = "the swarm",
			crypto = "crypto coin",
			googol = "googol play card",
			googolplay = "googol play card",
			google = "googol play card",
			googleplay = "googol play card",
			googleplaycard = "googol play card",
			nostalgicgoogol = "nostalgic googol play card",
			nostalgicgoogolplay = "nostalgic googol play card",
			nostalgicgoogle = "nostalgic googol play card",
			nostalgicgoogleplay = "nostalgic googol play card",
			nostalgicgoogleplaycard = "nostalgic googol play card",
			oldgoogol = "nostalgic googol play card",
			oldgoogolplay = "nostalgic googol play card",
			oldgoogle = "nostalgic googol play card",
			oldgoogleplay = "nostalgic googol play card",
			oldgoogleplaycard = "nostalgic googol play card",
			ngpc = "nostalgic googol play card",
			localthunk = "supercell",
			["1fa"] = "one for all",
			["jolly?"] = "jolly joker?",
			scrabble = "scrabble tile",
			oldcandy = "nostalgic candy",
			jimbo9000 = "jimbo-tron 9000",
			jimbotron9000 = "jimbo-tron 9000",
			magnet = "fridge magnet",
			weeb = "weebonacci",
			potofgreed = "pot of jokes",
			flipside = "on the flip side",
			bonkers = "bonkers joker",
			fuckedup = "fucked-up joker",
			foolhardy = "foolhardy joker",
			adroit = "adroit joker",
			penetrating = "penetrating joker",
			treacherous = "treacherous joker",
			stronghold = "the stronghold",
			thefuck = "the fuck!?",
			["tf!?"] = "the fuck!?",
			wtf = "the fuck!?",
			clash = "the clash",
			astral = "astral in a bottle",
			smoothie = "tropical smoothie",
			chocodie = "chocolate die",
			chocodice = "chocolate die",
			chocolatedice = "chocolate die",
			cookie = "clicked cookie",
			lebronjames = "lebaron james",
			lebron = "lebaron james",
			lebaron = "lebaron james",
			hunting = "hunting season",
			clockwork = "clockwork joker",
			monopoly = "monopoly money",
			notebook = "the motebook",
			motebook = "the motebook",
			mcdonalds = "fast food m",
			code = "code joker",
			copypaste = "copy/paste",
			translucent = "translucent joker",
			circulus = "circulus pistoris",
			macabre = "macabre joker",
			cat_owl = "cat owl",
			--Vouchers
			["overstock+"] = "overstock plus",
			directorscut = "director's cut",
			["3rs"] = "the 3 rs",
			-- Vanilla Tarots
			fool = "the fool",
			magician = "the magician",
			priestess = "the high priestess",
			highpriestess = "the high priestess",
			empress = "the empress",
			emperor = "the emperor",
			hierophant = "the hierophant",
			lovers = "the lovers",
			chariot = "the chariot",
			hermit = "the hermit",
			wheeloffortune = "the wheel of fortune",
			hangedman = "the hanged man",
			devil = "the devil",
			tower = "the tower",
			star = "the star",
			moon = "the moon",
			sun = "the sun",
			world = "the world",
			-- Cryptid Tarots
			automaton = "the automaton",
			eclipse = "c_cry_eclipse",
			-- Planets
			x = "planet x",
			X = "planet x",
			-- Code Cards
			pointer = "pointer://",
			payload = "://payload",
			reboot = "://reboot",
			revert = "://revert",
			crash = "://crash",
			semicolon = ";//",
			[";"] = ";//",
			malware = "://malware",
			seed = "://seed",
			variable = "://variable",
			class = "://class",
			commit = "://commit",
			merge = "://merge",
			multiply = "://multiply",
			divide = "://divide",
			delete = "://delete",
			machinecode = "://machinecode",
			run = "://run",
			exploit = "://exploit",
			offbyone = "://offbyone",
			rework = "://rework",
			patch = "://patch",
			ctrlv = "://ctrl+v",
			["ctrl+v"] = "://ctrl+v",
			["ctrl v"] = "://ctrl+v",
			hook = "hook://",
			instantiate = "://INSTANTIATE",
			inst = "://INSTANTIATE",
			spaghetti = "://spaghetti",
			alttab = "://alttab",
			-- Tags
			topuptag = "top-up tag",
			gamblerstag = "gambler's tag",
			-- Blinds
			ox = "the ox",
			wall = "the wall",
			wheel = "the wheel",
			arm = "the arm",
			club = "the club",
			fish = "the fish",
			psychic = "the psychic",
			goad = "the goad",
			water = "the water",
			window = "the window",
			manacle = "the manacle",
			eye = "the eye",
			mouth = "the mouth",
			plant = "the plant",
			serpent = "the serpent",
			pillar = "the pillar",
			needle = "the needle",
			head = "the head",
			tooth = "the tooth",
			flint = "the flint",
			mark = "the mark",
			oldox = "nostalgic ox",
			oldhouse = "nostalgic house",
			oldarm = "nostalgic arm",
			oldfish = "nostalgic fish",
			oldmanacle = "nostalgic manacle",
			oldserpent = "nostalgic serpent",
			oldpillar = "nostalgic pillar",
			oldflint = "nostalgic flint",
			oldmark = "nostalgic mark",
			tax = "the tax",
			trick = "the trick",
			joke = "the joke",
			hammer = "the hammer",
			box = "the box",
			windmill = "the windmill",
			clock = "the clock",
		}
		for k, v in pairs(aliases) do
			Cryptid.aliases[k] = v
		end
		G.FUNCS.pointer_apply = function()
			local function apply_lower(str)
				-- Remove content within {} and any remaining spaces
				str = str:gsub("%b{}", ""):gsub("%s+", "")
				--this weirdness allows you to get m and M separately
				if string.len(str) == 1 then
					return str
				end
				return string.lower(str)
			end
			local current_card
			local entered_card = G.ENTERED_CARD
			G.PREVIOUS_ENTERED_CARD = G.ENTERED_CARD
			local aliases = Cryptid.aliases
			if aliases[apply_lower(entered_card)] then
				entered_card = aliases[apply_lower(entered_card)]
			end
			for i, v in pairs(G.P_CENTERS) do
				if v.name and apply_lower(entered_card) == apply_lower(v.name) then
					current_card = i
				end
				if apply_lower(entered_card) == apply_lower(i) then
					current_card = i
				end
				if apply_lower(entered_card) == apply_lower(localize({ type = "name_text", set = v.set, key = i })) then
					current_card = i
				end
			end
			if current_card then
				local created = false
				if
					G.P_CENTERS[current_card].set == "Joker"
					and (
						G.DEBUG_POINTER
						or (
							G.P_CENTERS[current_card].unlocked
							and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit
							and not G.GAME.banned_keys[current_card]
							and (G.P_CENTERS[current_card].rarity ~= "cry_exotic" or #SMODS.find_card("j_jen_p03") > 0)
							and not (Jen and Jen.overpowered(G.P_CENTERS[current_card].rarity))
						)
					)
				then
					local card = create_card("Joker", G.jokers, nil, nil, nil, nil, current_card)
					card:add_to_deck()
					G.jokers:emplace(card)
					created = true
				end
				if
					G.P_CENTERS[current_card].consumeable
					and (
						G.DEBUG_POINTER
						or (
							G.P_CENTERS[current_card].set ~= "jen_omegaconsumable"
							and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit
							and not G.GAME.banned_keys[current_card]
						)
					)
				then
					local card = create_card("Consumeable", G.consumeables, nil, nil, nil, nil, current_card)
					if card.ability.name and card.ability.name == "cry-Chambered" then
						card.ability.extra.num_copies = 1
					end
					card:add_to_deck()
					G.consumeables:emplace(card)
					created = true
				end
				if
					G.P_CENTERS[current_card].set == "Voucher" and G.DEBUG_POINTER
					or (G.P_CENTERS[current_card].unlocked and not G.GAME.banned_keys[current_card])
				then
					local area
					if G.STATE == G.STATES.HAND_PLAYED then
						if not G.redeemed_vouchers_during_hand then
							G.redeemed_vouchers_during_hand = CardArea(
								G.play.T.x,
								G.play.T.y,
								G.play.T.w,
								G.play.T.h,
								{ type = "play", card_limit = 5 }
							)
						end
						area = G.redeemed_vouchers_during_hand
					else
						area = G.play
					end
					local card = create_card("Voucher", area, nil, nil, nil, nil, current_card)
					card:start_materialize()
					area:emplace(card)
					card.cost = 0
					card.shop_voucher = false
					local current_round_voucher = G.GAME.current_round.voucher
					card:redeem()
					G.GAME.current_round.voucher = current_round_voucher
					G.E_MANAGER:add_event(Event({
						trigger = "after",
						delay = 0,
						func = function()
							card:start_dissolve()
							return true
						end,
					}))
					created = true
				end
				if
					G.P_CENTERS[current_card].set == "Booster"
					and (G.DEBUG_POINTER or (not G.GAME.banned_keys[current_card] and (G.P_CENTERS[current_card].name ~= "Exotic Buffoon Pack" or #SMODS.find_card(
						"j_jen_p03"
					) ~= 0)))
					and G.STATE ~= G.STATES.TAROT_PACK
					and G.STATE ~= G.STATES.SPECTRAL_PACK
					and G.STATE ~= G.STATES.STANDARD_PACK
					and G.STATE ~= G.STATES.BUFFOON_PACK
					and G.STATE ~= G.STATES.PLANET_PACK
					and G.STATE ~= G.STATES.SMODS_BOOSTER_OPENED
				then
					local card = create_card("Booster", G.hand, nil, nil, nil, nil, current_card)
					card.cost = 0
					card.from_tag = true
					G.FUNCS.use_card({ config = { ref_table = card } })
					card:start_materialize()
					created = true
				end
				if created then
					G.CHOOSE_CARD:remove()
					G.GAME.USING_CODE = false
					G.GAME.USING_POINTER = false
					G.DEBUG_POINTER = false
					return
				end
			end
			for i, v in pairs(G.P_TAGS) do
				if v.name and apply_lower(entered_card) == apply_lower(v.name) then
					current_card = i
				end
				if apply_lower(entered_card) == apply_lower(i) then
					current_card = i
				end
				if apply_lower(entered_card) == apply_lower(localize({ type = "name_text", set = v.set, key = i })) then
					current_card = i
				end
			end
			if
				current_card
				and (G.DEBUG_POINTER or (not G.P_CENTERS[current_card] and not G.GAME.banned_keys[current_card]))
			then
				local created = false
				local t = Tag(current_card, nil, "Big")
				add_tag(t)
				if current_card == "tag_orbital" then
					local _poker_hands = {}
					for k, v in pairs(G.GAME.hands) do
						if v.visible then
							_poker_hands[#_poker_hands + 1] = k
						end
					end
					t.ability.orbital_hand = pseudorandom_element(_poker_hands, pseudoseed("cry_pointer_orbital"))
				end
				if current_card == "tag_cry_rework" then
					--tbh this is the most unbalanced part of the card
					t.ability.rework_edition =
						pseudorandom_element(G.P_CENTER_POOLS.Edition, pseudoseed("cry_pointer_edition")).key
					t.ability.rework_key =
						pseudorandom_element(G.P_CENTER_POOLS.Joker, pseudoseed("cry_pointer_joker")).key
				end
				G.CHOOSE_CARD:remove()
				G.GAME.USING_CODE = false
				G.GAME.USING_POINTER = false
				G.DEBUG_POINTER = false
				return
			end
			for i, v in pairs(G.P_BLINDS) do
				if v.name and apply_lower(entered_card) == apply_lower(v.name) then
					current_card = i
				end
				if apply_lower(entered_card) == apply_lower(i) then
					current_card = i
				end
				if
					apply_lower(entered_card) == apply_lower(localize({ type = "name_text", set = "Blind", key = i }))
				then
					current_card = i
				end
			end
			if
				current_card
				and not G.P_CENTERS[current_card]
				and not G.P_TAGS[current_card]
				and (G.DEBUG_POINTER or not G.GAME.banned_keys[current_card])
			then
				local created = false
				if not G.GAME.blind or (G.GAME.blind.name == "" or not G.GAME.blind.blind_set) then
					--from debugplus
					local par = G.blind_select_opts.boss.parent
					G.GAME.round_resets.blind_choices.Boss = current_card

					G.blind_select_opts.boss:remove()
					G.blind_select_opts.boss = UIBox({
						T = { par.T.x, 0, 0, 0 },
						definition = {
							n = G.UIT.ROOT,
							config = {
								align = "cm",
								colour = G.C.CLEAR,
							},
							nodes = {
								UIBox_dyn_container(
									{ create_UIBox_blind_choice("Boss") },
									false,
									get_blind_main_colour("Boss"),
									mix_colours(G.C.BLACK, get_blind_main_colour("Boss"), 0.8)
								),
							},
						},
						config = {
							align = "bmi",
							offset = {
								x = 0,
								y = G.ROOM.T.y + 9,
							},
							major = par,
							xy_bond = "Weak",
						},
					})
					par.config.object = G.blind_select_opts.boss
					par.config.object:recalculate()
					G.blind_select_opts.boss.parent = par
					G.blind_select_opts.boss.alignment.offset.y = 0

					for i = 1, #G.GAME.tags do
						if G.GAME.tags[i]:apply_to_run({
							type = "new_blind_choice",
						}) then
							break
						end
					end
					created = true
				else
					G.GAME.blind:set_blind(G.P_BLINDS[current_card])
					ease_background_colour_blind(G.STATE)
					created = true
				end
				if created then
					G.CHOOSE_CARD:remove()
					G.GAME.USING_CODE = false
					G.GAME.USING_POINTER = false
					G.DEBUG_POINTER = false
				end
			end
			if not current_card then -- if card isn't created yet, try playing cards
				local words = {}
				for i in string.gmatch(string.lower(entered_card), "%S+") do -- not using apply_lower because we actually want the spaces here
					table.insert(words, i)
				end

				local rank_table = {
					{ "stone" },
					{ "2", "Two", "II" },
					{ "3", "Three", "III" },
					{ "4", "Four", "IV" },
					{ "5", "Five", "V" },
					{ "6", "Six", "VI" },
					{ "7", "Seven", "VII" },
					{ "8", "Eight", "VIII" },
					{ "9", "Nine", "IX" },
					{ "10", "1O", "Ten", "X", "T" },
					{ "J", "Jack" },
					{ "Q", "Queen" },
					{ "K", "King" },
					{ "A", "Ace", "One", "1", "I" },
				} -- ty variable
				local _rank = nil
				for m = #words, 1, -1 do -- the legendary TRIPLE LOOP, checking from end since rank is most likely near the end
					for i, v in pairs(rank_table) do
						for j, k in pairs(v) do
							if words[m] == string.lower(k) then
								_rank = i
								break
							end
						end
						if _rank then
							break
						end
					end
					if _rank then
						break
					end
				end
				if _rank then -- a playing card is going to get created at this point, but we can find additional descriptors
					local suit_table = {
						["Spades"] = { "spades" },
						["Hearts"] = { "hearts" },
						["Clubs"] = { "clubs" },
						["Diamonds"] = { "diamonds" },
					}
					for k, v in pairs(SMODS.Suits) do
						local index = v.key
						local current_name = G.localization.misc.suits_plural[index]
						if not suit_table[v.key] then
							suit_table[v.key] = { string.lower(current_name) }
						end
					end
					-- i'd rather be pedantic and not forgive stuff like "spade", there's gonna be a lot of checks
					-- can change that if need be
					local enh_table = {
						["m_lucky"] = { "lucky" },
						["m_mult"] = { "mult" },
						["m_bonus"] = { "bonus" },
						["m_wild"] = { "wild" },
						["m_steel"] = { "steel" },
						["m_glass"] = { "glass" },
						["m_gold"] = { "gold" },
						["m_stone"] = { "stone" },
						["m_cry_echo"] = { "echo" },
					}
					for k, v in pairs(G.P_CENTER_POOLS.Enhanced) do
						local index = v.key
						local current_name = G.localization.descriptions.Enhanced[index].name
						current_name = current_name:gsub(" Card$", "")
						if not enh_table[v.key] then
							enh_table[v.key] = { string.lower(current_name) }
						end
					end
					local ed_table = {
						["e_base"] = { "base" },
						["e_foil"] = { "foil" },
						["e_holo"] = { "holo" },
						["e_polychrome"] = { "polychrome" },
						["e_negative"] = { "negative" },
						["e_cry_mosaic"] = { "mosaic" },
						["e_cry_oversat"] = { "oversat" },
						["e_cry_glitched"] = { "glitched" },
						["e_cry_astral"] = { "astral" },
						["e_cry_blur"] = { "blurred" },
						["e_cry_gold"] = { "golden" },
						["e_cry_glass"] = { "fragile" },
						["e_cry_m"] = { "jolly" },
						["e_cry_noisy"] = { "noisy" },
						["e_cry_double_sided"] = { "double-sided", "double_sided", "double" }, -- uhhh sure
					}
					for k, v in pairs(G.P_CENTER_POOLS.Edition) do
						local index = v.key
						local current_name = G.localization.descriptions.Edition[index].name
						if not ed_table[v.key] then
							ed_table[v.key] = { string.lower(current_name) }
						end
					end
					local seal_table = {
						["Red"] = { "red" },
						["Blue"] = { "blue" },
						["Purple"] = { "purple" },
						["Gold"] = { "gold", "golden" }, -- don't worry we're handling seals differently
						["cry_azure"] = { "azure" },
						["cry_green"] = { "green" },
					}
					local sticker_table = {
						["eternal"] = { "eternal" },
						["perishable"] = { "perishable" },
						["rental"] = { "rental" },
						["pinned"] = { "pinned" },
						["banana"] = { "banana" }, -- no idea why this evades prefixing
						["cry_rigged"] = { "rigged" },
						["cry_flickering"] = { "flickering" },
						["cry_possessed"] = { "possessed" },
						["cry_absolute"] = { "absolute" },
					}
					local function parsley(_table, _word)
						for i, v in pairs(_table) do
							for j, k in pairs(v) do
								if _word == string.lower(k) then
									return i
								end
							end
						end
						return ""
					end
					local function to_rank(rrank)
						if rrank <= 10 then
							return tostring(rrank)
						elseif rrank == 11 then
							return "Jack"
						elseif rrank == 12 then
							return "Queen"
						elseif rrank == 13 then
							return "King"
						elseif rrank == 14 then
							return "Ace"
						end
					end

					-- ok with all that fluff out the way now we can figure out what on earth we're creating

					local _seal_att = false
					local _suit = ""
					local _enh = ""
					local _ed = ""
					local _seal = ""
					local _stickers = {}
					for m = #words, 1, -1 do
						-- we have a word. figure out what that word is
						-- this is dodgy spaghetti but w/ever
						local wword = words[m]
						if _suit == "" then
							_suit = parsley(suit_table, wword)
						end
						if _enh == "" then
							_enh = parsley(enh_table, wword)
							if _enh == "m_gold" and _seal_att == true then
								_enh = ""
							end
						end
						if _ed == "" then
							_ed = parsley(ed_table, wword)
							if _ed == "e_cry_gold" and _seal_att == true then
								_ed = ""
							end
						end
						if _seal == "" then
							_seal = parsley(seal_table, wword)
							if _seal == "Gold" and _seal_att == false then
								_seal = ""
							end
						end
						local _st = parsley(sticker_table, wword)
						if _st then
							_stickers[#_stickers + 1] = _st
						end
						if wword == "seal" or wword == "sealed" then
							_seal_att = true
						else
							_seal_att = false
						end -- from end so the next word should describe the seal
					end

					-- now to construct the playing card
					-- i'm doing this by applying everything but maybe it's a bit janky?

					G.CHOOSE_CARD:remove()
					G.GAME.USING_CODE = false
					G.GAME.USING_POINTER = false
					G.DEBUG_POINTER = false

					G.E_MANAGER:add_event(Event({
						func = function()
							G.playing_card = (G.playing_card and G.playing_card + 1) or 1
							local _card = create_card("Base", G.play, nil, nil, nil, nil, nil, "pointer")
							SMODS.change_base(
								_card,
								_suit ~= "" and _suit
									or pseudorandom_element(
										{ "Spades", "Hearts", "Diamonds", "Clubs" },
										pseudoseed("sigil")
									),
								_rank > 1 and to_rank(_rank) or nil
							)
							if _enh ~= "" then
								_card:set_ability(G.P_CENTERS[_enh])
							end
							if _rank == 1 then
								_card:set_ability(G.P_CENTERS["m_stone"])
							end
							if _seal ~= "" then
								_card:set_seal(_seal, true, true)
							end
							if _ed ~= "" then
								_card:set_edition(_ed, true, true)
							end
							for i = 1, #_stickers do
								_card.ability[_stickers[i]] = true
								if _stickers[i] == "pinned" then
									_card.pinned = true
								end
							end
							_card:start_materialize()
							G.play:emplace(_card)
							table.insert(G.playing_cards, _card)
							playing_card_joker_effects({ _card })
							return true
						end,
					}))
					G.E_MANAGER:add_event(Event({
						func = function()
							G.deck.config.card_limit = G.deck.config.card_limit + 1
							return true
						end,
					}))
					draw_card(G.play, G.deck, 90, "up", nil)
				end
			end
		end
	end,
}
local encoded = {
	cry_credits = {
		idea = {
			"Auto Watto",
			"Kailen",
		},
		art = {
			"Kailen",
		},
		code = {
			"Kailen",
		},
	},
	dependencies = {
		items = {
			"set_cry_code",
			"set_cry_deck",
		},
	},
	object_type = "Back",
	name = "cry-Encoded",
	key = "encoded",
	order = 11,
	pos = { x = 2, y = 5 },
	atlas = "atlasdeck",
	apply = function(self)
		G.GAME.joker_rate = 0
		G.GAME.planet_rate = 0
		G.GAME.tarot_rate = 0
		G.GAME.code_rate = 1e100
		G.E_MANAGER:add_event(Event({
			func = function()
				if G.jokers then
					if
						G.P_CENTERS["j_cry_CodeJoker"]
						and (G.GAME.banned_keys and not G.GAME.banned_keys["j_cry_CodeJoker"])
					then
						local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_cry_CodeJoker")
						card:add_to_deck()
						card:start_materialize()
						G.jokers:emplace(card)
					end
					if
						G.P_CENTERS["j_cry_copypaste"]
						and (G.GAME.banned_keys and not G.GAME.banned_keys["j_cry_copypaste"])
					then
						local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_cry_copypaste")
						card:add_to_deck()
						card:start_materialize()
						G.jokers:emplace(card)
					end
					return true
				end
			end,
		}))
	end,
	unlocked = false,
	check_for_unlock = function(self, args)
		if args.cry_used_consumable == "c_cry_pointer" then
			unlock_card(self)
		end
		if args.type == "cry_lock_all" then
			lock_card(self)
		end
		if args.type == "cry_unlock_all" then
			unlock_card(self)
		end
	end,
}
local CodeJoker = {
	dependencies = {
		items = {
			"set_cry_epic",
			"set_cry_code",
		},
	},
	object_type = "Joker",
	name = "cry-CodeJoker",
	key = "CodeJoker",
	pos = { x = 2, y = 4 },
	loc_vars = function(self, info_queue, center)
		info_queue[#info_queue + 1] = { key = "e_negative_consumable", set = "Edition", config = { extra = 1 } }
		return { key = Cryptid.gameset_loc(self, { exp_modest = "modest" }) }
	end,
	extra_gamesets = { "exp_modest" },
	rarity = "cry_epic",
	cost = 11,
	order = 109,
	blueprint_compat = true,
	atlas = "atlasepic",
	calculate = function(self, card, context)
		if
			context.setting_blind
			and not (context.blueprint_card or self).getting_sliced
			and (G.GAME.blind:get_type() == "Boss" or Cryptid.gameset(card) ~= "exp_modest")
		then
			play_sound("timpani")
			local card = create_card("Code", G.consumeables, nil, nil, nil, nil)
			card:set_edition({
				negative = true,
			})
			card:add_to_deck()
			G.consumeables:emplace(card)
			card:juice_up(0.3, 0.5)
			return nil, true
		end
	end,
	cry_credits = {
		idea = {
			"Kailen",
			"Auto Watto",
		},
		art = {
			"Kailen",
		},
		code = {
			"Kailen",
		},
	},
	unlocked = false,
	check_for_unlock = function(self, args)
		if G.P_CENTER_POOLS["Code"] then
			local count = 0
			local count2 = 0
			for k, v in pairs(G.P_CENTER_POOLS["Code"]) do
				count2 = count2 + 1
				if Cryptid.safe_get(v, "discovered") == true then
					count = count + 1
				end
			end
			if count == count2 then
				unlock_card(self)
			end
		end
		if args.type == "cry_lock_all" then
			lock_card(self)
		end
		if args.type == "cry_unlock_all" then
			unlock_card(self)
		end
	end,
}
local copypaste = {
	dependencies = {
		items = {
			"set_cry_epic",
			"set_cry_code",
		},
	},
	object_type = "Joker",
	name = "cry-copypaste",
	key = "copypaste",
	pos = { x = 3, y = 4 },
	order = 110,
	immune_to_chemach = true,
	config = {
		extra = {
			odds = 2,
			ckt = nil,
		},
	}, -- what is a ckt
	rarity = "cry_epic",
	cost = 14,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card and cry_prob(
					math.min(card.ability.extra.odds / 2, card.ability.cry_prob or 1),
					card.ability.extra.odds,
					card.ability.cry_rigged
				) or 1,
				card and card.ability.extra.odds or 2,
			}, -- this effectively prevents a copypaste from ever initially misprinting at above 50% odds. still allows rigging/oops
			key = Cryptid.gameset_loc(self, { madness = "madness", exp_modest = "modest" }),
		}
	end,
	atlas = "atlasepic",
	extra_gamesets = { "exp_modest" },
	gameset_config = {
		exp_modest = { cost = 8, center = { rarity = 3 } },
	},
	calculate = function(self, card, context)
		if context.pull_card and context.card.ability.set == "Code" and Cryptid.gameset(card) == "exp_modest" then
			if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
				G.E_MANAGER:add_event(Event({
					func = function()
						local cards = copy_card(context.card)
						cards:add_to_deck()
						G.consumeables:emplace(cards)
						return true
					end,
				}))
				card_eval_status_text(
					context.blueprint_card or card,
					"extra",
					nil,
					nil,
					nil,
					{ message = localize("k_copied_ex") }
				)
			end
		end
		if
			context.using_consumeable
			and context.consumeable.ability.set == "Code"
			and not context.consumeable.beginning_end
			and not card.ability.extra.ckt
			and Cryptid.gameset(card) ~= "exp_modest"
		then
			if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
				if
					pseudorandom("cry_copypaste_joker")
					< cry_prob(
							math.min(card.ability.extra.odds / 2, card.ability.cry_prob),
							card.ability.extra.odds,
							card.ability.cry_rigged
						)
						/ card.ability.extra.odds
				then
					G.E_MANAGER:add_event(Event({
						func = function()
							local cards = copy_card(context.consumeable)
							cards:add_to_deck()
							G.consumeables:emplace(cards)
							return true
						end,
					}))
					card_eval_status_text(
						context.blueprint_cards or card,
						"extra",
						nil,
						nil,
						nil,
						{ message = localize("k_copied_ex") }
					)
					if Card.get_gameset(card) ~= "madness" then
						card.ability.extra.ckt = true
					end
				end
			end
		elseif
			context.end_of_round
			and not context.retrigger_joker
			and not context.blueprint
			and card.ability.extra.ckt
		then
			card.ability.extra.ckt = nil
			return {
				message = localize("k_reset"),
				card = card,
			}
		end
	end,
	cry_credits = {
		idea = {
			"Auto Watto",
		},
		art = {
			"Kailen",
		},
		code = {
			"Auto Watto",
		},
	},
}
local cut = {
	dependencies = {
		items = {
			"set_cry_code",
			"set_cry_misc_joker",
		},
	},
	object_type = "Joker",
	name = "cry-cut",
	key = "cut",
	config = {
		extra = {
			Xmult = 1,
			Xmult_mod = 0.5,
		},
	},
	pos = { x = 2, y = 2 },
	rarity = 2,
	cost = 7,
	order = 108,
	blueprint_compat = true,
	perishable_compat = false,
	atlas = "atlasthree",
	calculate = function(self, card, context)
		if context.ending_shop then
			local destructable_codecard = {}
			for i = 1, #G.consumeables.cards do
				if
					G.consumeables.cards[i].ability.set == "Code"
					and not G.consumeables.cards[i].getting_sliced
					and not G.consumeables.cards[i].ability.eternal
				then
					destructable_codecard[#destructable_codecard + 1] = G.consumeables.cards[i]
				end
			end
			local codecard_to_destroy = #destructable_codecard > 0
					and pseudorandom_element(destructable_codecard, pseudoseed("cut"))
				or nil

			if codecard_to_destroy then
				codecard_to_destroy.getting_sliced = true
				card.ability.extra.Xmult =
					lenient_bignum(to_big(card.ability.extra.Xmult) + card.ability.extra.Xmult_mod)
				G.E_MANAGER:add_event(Event({
					func = function()
						(context.blueprint_card or card):juice_up(0.8, 0.8)
						codecard_to_destroy:start_dissolve({ G.C.RED }, nil, 1.6)
						return true
					end,
				}))
				if not (context.blueprint_card or self).getting_sliced then
					card_eval_status_text((context.blueprint_card or card), "extra", nil, nil, nil, {
						message = localize({
							type = "variable",
							key = "a_xmult",
							vars = { number_format(to_big(card.ability.extra.Xmult)) },
						}),
					})
				end
				return nil, true
			end
		end
		if context.joker_main and (to_big(card.ability.extra.Xmult) > to_big(1)) then
			return {
				message = localize({
					type = "variable",
					key = "a_xmult",
					vars = {
						number_format(card.ability.extra.Xmult),
					},
				}),
				Xmult_mod = card.ability.extra.Xmult,
				colour = G.C.MULT,
			}
		end
	end,
	loc_vars = function(self, info_queue, center)
		return {
			vars = {
				number_format(center.ability.extra.Xmult_mod),
				number_format(center.ability.extra.Xmult),
			},
		}
	end,
	cry_credits = {
		idea = {
			"Auto Watto",
		},
		art = {
			"Kailen",
		},
		code = {
			"Auto Watto",
		},
	},
}
local blender = {
	dependencies = {
		items = {
			"set_cry_code",
			"set_cry_misc_joker",
		},
	},
	object_type = "Joker",
	name = "cry-blender",
	key = "blender",
	pos = { x = 3, y = 2 },
	rarity = 1,
	cost = 5,
	blueprint_compat = true,
	atlas = "atlasthree",
	order = 111,
	calculate = function(self, card, context)
		if
			context.using_consumeable
			and context.consumeable.ability.set == "Code"
			and not context.consumeable.beginning_end
		then
			if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
				local card = create_card("Consumeables", G.consumeables, nil, nil, nil, nil, nil, "cry_blender")
				card:add_to_deck()
				G.consumeables:emplace(card)
			end
		end
	end,
	cry_credits = {
		idea = {
			"HexaCryonic",
		},
		art = {
			"Kailen",
		},
		code = {
			"Kailen",
		},
	},
}
local python = {
	dependencies = {
		items = {
			"set_cry_code",
			"set_cry_misc_joker",
		},
	},
	object_type = "Joker",
	name = "cry-python",
	key = "python",
	config = {
		extra = {
			Xmult = 1,
			Xmult_mod = 0.15,
		},
	},
	pos = { x = 4, y = 2 },
	rarity = 2,
	cost = 7,
	blueprint_compat = true,
	perishable_compat = false,
	atlas = "atlasthree",
	order = 112,
	loc_vars = function(self, info_queue, center)
		return {
			vars = {
				number_format(center.ability.extra.Xmult_mod),
				number_format(center.ability.extra.Xmult),
			},
		}
	end,
	calculate = function(self, card, context)
		if
			context.using_consumeable
			and context.consumeable.ability.set == "Code"
			and not context.consumeable.beginning_end
		then
			card.ability.extra.Xmult = lenient_bignum(to_big(card.ability.extra.Xmult) + card.ability.extra.Xmult_mod)
			G.E_MANAGER:add_event(Event({
				func = function()
					card_eval_status_text(card, "extra", nil, nil, nil, {
						message = localize({
							type = "variable",
							key = "a_xmult",
							vars = { number_format(card.ability.extra.Xmult) },
						}),
					})
					return true
				end,
			}))
			return
		end
		if context.joker_main and (to_big(card.ability.extra.Xmult) > to_big(1)) then
			return {
				message = localize({
					type = "variable",
					key = "a_xmult",
					vars = { number_format(card.ability.extra.Xmult) },
				}),
				Xmult_mod = lenient_bignum(card.ability.extra.Xmult),
			}
		end
	end,
	cry_credits = {
		idea = {
			"HexaCryonic",
		},
		art = {
			"Kailen",
		},
		code = {
			"Kailen",
		},
	},
}
local code_cards = {
	code,
	pack1,
	pack2,
	packJ,
	packM,
	console,
	automaton,
	green_seal,
	source,
	pointer,
	cut,
	blender,
	python,
	payload,
	reboot,
	revert,
	crash,
	semicolon,
	malware,
	seed,
	rigged,
	--hook,
	hooked,
	variable,
	class,
	commit,
	merge,
	multiply,
	divide,
	delete,
	machinecode,
	run,
	exploit,
	oboe,
	rework,
	rework_tag,
	patch,
	ctrl_v,
	inst,
	alttab,
	encoded,
	spaghetti,
	CodeJoker,
	copypaste,
}
return {
	name = "Code Cards",
	init = function()
		--Code from Betmma's Vouchers
		G.FUNCS.can_reserve_card = function(e)
			local c1 = e.config.ref_table
			if
				#G.consumeables.cards
				< G.consumeables.config.card_limit + (Cryptid.safe_get(c1, "edition", "negative") and 1 or 0)
			then
				e.config.colour = G.C.GREEN
				e.config.button = "reserve_card"
			else
				e.config.colour = G.C.UI.BACKGROUND_INACTIVE
				e.config.button = nil
			end
		end
		G.FUNCS.reserve_card = function(e)
			local c1 = e.config.ref_table
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.1,
				func = function()
					c1.area:remove_card(c1)
					c1:add_to_deck()
					if c1.children.price then
						c1.children.price:remove()
					end
					c1.children.price = nil
					if c1.children.buy_button then
						c1.children.buy_button:remove()
					end
					c1.children.buy_button = nil
					remove_nils(c1.children)
					G.consumeables:emplace(c1)
					SMODS.calculate_context({ pull_card = true, card = c1 })
					G.GAME.pack_choices = G.GAME.pack_choices - 1
					if G.GAME.pack_choices <= 0 then
						G.FUNCS.end_consumeable(nil, delay_fac)
					end
					return true
				end,
			}))
		end
		--some code to make typing more characters better
		G.FUNCS.text_input_key = function(args)
			args = args or {}
			local hook = G.CONTROLLER.text_input_hook
			if not hook.config.ref_table.extended_corpus then
				if args.key == "[" or args.key == "]" then
					return
				end
				if args.key == "0" then
					args.key = "o"
				end
			else
				if string.byte(args.key, 1) >= 128 then
					print(string.byte(args.key, 1))
					args.key = "?" --fix for lovely bugging out
				end
			end

			--shortcut to hook config
			local hook_config = G.CONTROLLER.text_input_hook.config.ref_table
			hook_config.orig_colour = hook_config.orig_colour or copy_table(hook_config.colour)

			args.key = args.key or "%"
			args.caps = args.caps or G.CONTROLLER.capslock or hook_config.all_caps --capitalize if caps lock or hook requires

			--Some special keys need to be mapped accordingly before passing through the corpus
			local keymap = {
				space = " ",
				backspace = "BACKSPACE",
				delete = "DELETE",
				["return"] = "RETURN",
				right = "RIGHT",
				left = "LEFT",
			}
			local corpus = "123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
				.. (hook.config.ref_table.extended_corpus and " 0!$&()<>?:{}+-=,.[]_" or "")

			if hook.config.ref_table.extended_corpus then
				local lower_ext = "1234567890-=;',./"
				local upper_ext = '!@#$%^&*()_+:"<>?'
				if args.caps then
					if args.key == "." then
						args.key = ">"
					end
					if args.key == "[" then
						args.key = "{"
					end
					if args.key == "]" then
						args.key = "}"
					end
					if args.key == "\\" then
						args.key = "|"
					end
				end

				pcall(function()
					if string.find(lower_ext, args.key) and args.caps then
						args.key = string.sub(string.sub(upper_ext, string.find(lower_ext, args.key)), 0, 1)
					end
				end)
			end
			local text = hook_config.text

			--set key to mapped key or upper if caps is true
			args.key = keymap[args.key] or (args.caps and string.upper(args.key) or args.key)

			--Start by setting the cursor position to the correct location
			TRANSPOSE_TEXT_INPUT(0)

			if string.len(text.ref_table[text.ref_value]) > 0 and args.key == "BACKSPACE" then --If not at start, remove preceding letter
				MODIFY_TEXT_INPUT({
					letter = "",
					text_table = text,
					pos = text.current_position,
					delete = true,
				})
				TRANSPOSE_TEXT_INPUT(-1)
			elseif string.len(text.ref_table[text.ref_value]) > 0 and args.key == "DELETE" then --if not at end, remove following letter
				MODIFY_TEXT_INPUT({
					letter = "",
					text_table = text,
					pos = text.current_position + 1,
					delete = true,
				})
				TRANSPOSE_TEXT_INPUT(0)
			elseif args.key == "RETURN" then --Release the hook
				if hook.config.ref_table.callback then
					hook.config.ref_table.callback()
				end
				hook.parent.parent.config.colour = hook_config.colour
				local temp_colour = copy_table(hook_config.orig_colour)
				hook_config.colour[1] = G.C.WHITE[1]
				hook_config.colour[2] = G.C.WHITE[2]
				hook_config.colour[3] = G.C.WHITE[3]
				ease_colour(hook_config.colour, temp_colour)
				G.CONTROLLER.text_input_hook = nil
			elseif args.key == "LEFT" then --Move cursor position to the left
				TRANSPOSE_TEXT_INPUT(-1)
			elseif args.key == "RIGHT" then --Move cursor position to the right
				TRANSPOSE_TEXT_INPUT(1)
			elseif
				hook_config.max_length > string.len(text.ref_table[text.ref_value])
				and (string.len(args.key) == 1)
				and (string.find(corpus, args.key, 1, true) or hook.config.ref_table.extended_corpus)
			then --check to make sure the key is in the valid corpus, add it to the string
				MODIFY_TEXT_INPUT({
					letter = args.key,
					text_table = text,
					pos = text.current_position + 1,
				})
				TRANSPOSE_TEXT_INPUT(1)
			end
		end
		local yc = G.FUNCS.your_collection
		G.FUNCS.your_collection = function(e)
			if G.CHOOSE_CARD then
				G.CHOOSE_CARD:remove()
				G.CHOOSE_CARD = nil
			end
			yc(e)
		end
	end,
	items = code_cards,
}
