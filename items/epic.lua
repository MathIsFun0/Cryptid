--[[
gameset_config = {
        modest = {extra = {chips = 1}, center = {rarity = 1, blueprint_compat = false, immutable = true, no_dbl = false}},
		mainline = {center = {rarity = 2, blueprint_compat = true, immutable = true, no_dbl = true}},
        madness = {extra = {chips = 100}, center = {rarity = 3}},
		cryptid_in_2025 = {extra = {chips = 1e308}, center = {rarity = "cry_exotic"}},
 },
-- Card.get_gameset(card) ~= "modest"

--TODO Modest descriptions for
Supercell
Old Membership card
Canvas
Nostalgic Googol Play Card
One For all
--]]

-- Supercell
-- +15 Chips, +15 Mult, X2 Chips, X2 Mult, earn $3 at end of round
local supercell = {
	object_type = "Joker",
	name = "cry-supercell",
	key = "supercell",
	config = { extra = { stat1 = 15, stat2 = 2, money = 3 } },
	dependencies = {
		items = {
			"set_cry_epic",
		},
	},
	pos = { x = 5, y = 1 },
	rarity = "cry_epic",
	cost = 14,
	order = 64,
	blueprint_compat = true,
	atlas = "atlasepic",
	loc_vars = function(self, info_queue, center)
		return {
			key = Cryptid.gameset_loc(self, { modest = "balanced" }),
			vars = { center.ability.extra.stat1, center.ability.extra.stat2, center.ability.extra.money },
		}
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			if card.ability.extra.stat2 > 1 then --misprint deck moment
				if Card.get_gameset(card) ~= "modest" then
					return {
						message = localize("cry_gaming_ex"),
						chip_mod = card.ability.extra.stat1,
						mult_mod = card.ability.extra.stat1,
						Xchip_mod = card.ability.extra.stat2,
						Xmult_mod = card.ability.extra.stat2,
					}
				else
					return {
						message = localize("cry_gaming_ex"),
						Xchip_mod = card.ability.extra.stat2,
						Xmult_mod = card.ability.extra.stat2,
					}
				end
			end
		end
	end,
	calc_dollar_bonus = function(self, card)
		if card.ability.extra.money > 0 then
			return card.ability.extra.money
		end
	end,
	add_to_deck = function(self, card, from_debuff)
		if not from_debuff then
			play_sound("cry_studiofromhelsinki")
		end
	end,
	cry_credits = {
		idea = {
			"Jevonn",
		},
		art = {
			"Jevonn",
		},
		code = {
			"Jevonn",
		},
	},
}

-- Old Membership Card
-- +1 Chip for each member in the Cryptid Discord
local membershipcardtwo = {
	object_type = "Joker",
	name = "cry-membershipcardtwo",
	key = "membershipcardtwo",
	config = { extra = { chips = 1 } },
	gameset_config = {
		modest = { cost = 20, center = { rarity = 4 } },
	},
	dependencies = {
		items = {
			"set_cry_epic",
		},
	},
	pos = { x = 5, y = 4 },
	rarity = "cry_epic",
	cost = 17,
	order = 50,
	blueprint_compat = true,
	atlas = "atlasepic",
	loc_vars = function(self, info_queue, card)
		local a = 1
		if Card.get_gameset(card) == "modest" then
			a = 8
		end
		return {
			key = Cryptid.gameset_loc(self, { modest = "balanced" }),
			vars = {
				card.ability.extra.chips,
				card.ability.extra.chips * math.floor(Cryptid.member_count / a),
			},
		}
	end,
	calculate = function(self, card, context)
		if context.joker_main and card.ability.extra.chips > 0 then
			local a = 1
			if Card.get_gameset(card) == "modest" then
				a = 8
			end
			return {
				message = localize({
					type = "variable",
					key = "a_chips",
					vars = { card.ability.extra.chips * math.floor(Cryptid.member_count / a) },
				}),
				chip_mod = card.ability.extra.chips * math.floor(Cryptid.member_count / a),
			}
		end
	end,
	cry_credits = {
		idea = {
			"Jevonn",
		},
		art = {
			"Linus Goof Balls",
		},
		code = {
			"Jevonn",
		},
	},
}

-- Googol Play Card
-- 1 in 8 chance for X1e100 Mult
local googol_play = {
	object_type = "Joker",
	name = "cry-Googol Play Card",
	key = "googol_play",
	config = { extra = { Xmult = 1e100, odds = 8 } },
	dependencies = {
		items = {
			"set_cry_epic",
		},
	},
	gameset_config = {
		modest = { extra = { Xmult = 9, odds = 8 } },
	},
	pos = { x = 3, y = 0 },
	rarity = "cry_epic",
	cost = 10,
	order = 14,
	blueprint_compat = true,
	atlas = "atlasepic",
	soul_pos = { x = 10, y = 0, extra = { x = 4, y = 0 } },
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				cry_prob(card.ability.cry_prob, card.ability.extra.odds, card.ability.cry_rigged),
				card.ability.extra.odds,
				card.ability.extra.Xmult,
			},
		}
	end,
	calculate = function(self, card, context)
		if
			context.joker_main
			and pseudorandom("cry_googol_play")
				< cry_prob(card.ability.cry_prob, card.ability.extra.odds, card.ability.cry_rigged) / card.ability.extra.odds
		then
			return {
				message = localize({ type = "variable", key = "a_xmult", vars = { card.ability.extra.Xmult } }),
				Xmult_mod = card.ability.extra.Xmult,
			}
		end
	end,
	cry_credits = {
		idea = {
			".asdom",
		},
		art = {
			"Linus Goof Balls",
		},
		code = {
			"Math",
		},
	},
	unlocked = false,
	check_for_unlock = function(self, args)
		if args.type == "chip_score" and to_big(args.chips) >= to_big(1e100) then
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

-- Sync Catalyst
-- Balances Chips and Mult
local sync_catalyst = {
	object_type = "Joker",
	name = "cry-Sync Catalyst",
	key = "sync_catalyst",
	dependencies = {
		items = {
			"set_cry_epic",
		},
	},
	gameset_config = {
		modest = { cost = 20, center = { rarity = 4 } },
	},
	pos = { x = 5, y = 2 },
	rarity = "cry_epic",
	cost = 12,
	order = 54,
	blueprint_compat = true,
	immutable = true,
	atlas = "atlasepic",
	calculate = function(self, card, context)
		if context.joker_main and not context.debuffed_hand and hand_chips and mult then
			local tot = hand_chips + mult
			if not tot.array or #tot.array < 2 or tot.array[2] < 2 then --below eXeY notation
				hand_chips = mod_chips(math.floor(tot / 2))
				mult = mod_mult(math.floor(tot / 2))
			else
				if hand_chips > mult then
					tot = hand_chips
				else
					tot = mult
				end
				hand_chips = mod_chips(tot)
				mult = mod_chips(tot)
			end
			update_hand_text({ delay = 0 }, { mult = mult, chips = hand_chips })
			return {
				message = localize("k_balanced"),
				colour = { 0.8, 0.45, 0.85, 1 },
				func = function()
					G.E_MANAGER:add_event(Event({
						trigger = "after",
						func = function()
							play_sound("gong", 0.94, 0.3)
							play_sound("gong", 0.94 * 1.5, 0.2)
							play_sound("tarot1", 1.5)
							return true
						end,
					}))
				end,
			}
		end
	end,
	cry_credits = {
		idea = {
			"Project666",
		},
		art = {
			"Ein13",
		},
		code = {
			"Math",
		},
	},
	unlocked = true,
}

-- Negative Joker
-- +4 Joker slots
local negative = {
	object_type = "Joker",
	name = "cry-Negative Joker",
	key = "negative",
	pos = { x = 1, y = 3 },
	config = { extra = 4 },
	dependencies = {
		items = {
			"set_cry_epic",
		},
	},
	gameset_config = {
		modest = { cost = 16 },
	},
	rarity = "cry_epic",
	cost = 10,
	order = 70,
	atlas = "atlasepic",
	loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra } }
	end,
	add_to_deck = function(self, card, from_debuff)
		G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra
	end,
	remove_from_deck = function(self, card, from_debuff)
		G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra
	end,
	cry_credits = {
		idea = {
			"Xero01",
		},
		art = {
			"Linus Goof Balls",
		},
		code = {
			"Math",
		},
	},
}

-- Canvas
-- Retrigger all Jokers to the left once for every non-Common Joker to the right of this Joker
-- Still considering moving to Legendary - Jevonn
local canvas = {
	object_type = "Joker",
	name = "cry-Canvas",
	key = "canvas",
	immutable = true,
	order = 4,
	pos = { x = 2, y = 1 },
	dependencies = {
		items = {
			"set_cry_epic",
		},
	},
	rarity = "cry_epic",
	cost = 18,
	blueprint_compat = true,
	atlas = "atlasepic",
	loc_vars = function(self, info_queue, center)
		return { key = Cryptid.gameset_loc(self, { modest = "balanced" }) }
	end,
	calculate = function(self, card, context)
		if context.retrigger_joker_check and not context.retrigger_joker then
			local num_retriggers = 0
			for i = 1, #G.jokers.cards do
				if
					card.T.x + card.T.w / 2 < G.jokers.cards[i].T.x + G.jokers.cards[i].T.w / 2
					and G.jokers.cards[i].config.center.rarity ~= 1
					and (G.jokers.cards[i].config.center.rarity ~= "cry_candy" or Card.get_gameset(card) ~= "modest")
				then
					num_retriggers = num_retriggers + 1
				end
			end
			if card.T.x + card.T.w / 2 > context.other_card.T.x + context.other_card.T.w / 2 then
				return {
					message = localize("k_again_ex"),
					repetitions = Card.get_gameset(card) ~= "modest" and num_retriggers or math.min(2, num_retriggers),
					card = card,
				}
			end
		end
	end,
	cry_credits = {
		idea = {
			"Mystic Misclick",
		},
		art = {
			"Mystic Misclick",
		},
		code = {
			"Math",
		},
	},
}

-- ERROR
-- Displays a glitched message
-- While in shop, all cards are Glitched (fallback: Foil)
-- After a random number of rounds, duplicates all Jokers when sold
-- The glitched message can tell you what the next card rolled in the shop will be (similar to the Misprint easter egg)
local error_joker = {
	object_type = "Joker",
	name = "cry-Error",
	key = "error",
	pos = { x = 4, y = 2 },
	config = { extra = { sell_rounds = 0, active = false } },
	dependencies = {
		items = {
			-- Note: This currently does not have a dependency on Glitched because there's a fallback.
			-- However I think this should be changed later...
			"set_cry_epic",
		},
	},
	immutable = true,
	rarity = "cry_epic",
	cost = 1,
	order = 72,
	blueprint_compat = false,
	eternal_compat = false,
	atlas = "atlasepic",
	loc_vars = function(self, info_queue, center)
		local ok, ret = pcall(Cryptid.predict_card_for_shop)
		if Cryptid.safe_get(G.GAME, "pseudorandom") and G.STAGE == G.STAGES.RUN and ok then
			cry_error_msgs[#cry_error_msgs].string = "%%" .. ret
		else
			cry_error_msgs[#cry_error_msgs].string = "%%J6"
		end
		return {
			main_start = {
				{
					n = G.UIT.O,
					config = {
						object = DynaText({
							string = cry_error_operators,
							colours = { G.C.DARK_EDITION },
							pop_in_rate = 9999999,
							silent = true,
							random_element = true,
							pop_delay = 0.30,
							scale = 0.32,
							min_cycle_time = 0,
						}),
					},
				},
				{
					n = G.UIT.O,
					config = {
						object = DynaText({
							string = cry_error_numbers,
							colours = { G.C.DARK_EDITION },
							pop_in_rate = 9999999,
							silent = true,
							random_element = true,
							pop_delay = 0.33,
							scale = 0.32,
							min_cycle_time = 0,
						}),
					},
				},
				{
					n = G.UIT.O,
					config = {
						object = DynaText({
							string = cry_error_msgs,
							colours = { G.C.UI.TEXT_DARK },
							pop_in_rate = 9999999,
							silent = true,
							random_element = true,
							pop_delay = 0.4011,
							scale = 0.32,
							min_cycle_time = 0,
						}),
					},
				},
			},
		}
	end,
	add_to_deck = function(self, card, from_debuff)
		if G.GAME.modifiers.cry_force_edition and not G.GAME.modifiers.cry_force_edition_from_deck then
			G.GAME.modifiers.cry_force_edition_from_deck = G.GAME.modifiers.cry_force_edition
		elseif not G.GAME.modifiers.cry_force_edition_from_deck then
			if G.P_CENTERS.e_cry_glitched then
				G.GAME.modifiers.cry_force_edition = "cry_glitched"
			else
				G.GAME.modifiers.cry_force_edition = "foil"
			end
			G.GAME.modifiers.cry_force_edition_from_deck = "Nope!"
		end
	end,
	remove_from_deck = function(self, card, from_debuff)
		if G.GAME.modifiers.cry_force_edition_from_deck ~= "Nope!" then
			G.GAME.modifiers.cry_force_edition = G.GAME.modifiers.cry_force_edition_from_deck
		else
			G.GAME.modifiers.cry_force_edition = nil
		end
	end,
	calculate = function(self, card, context)
		if
			context.end_of_round
			and not context.blueprint
			and not context.repetition
			and not context.individual
			and not card.ability.extra.active
		then
			if card.ability.extra.sell_rounds == 0 then
				card.ability.extra.sell_rounds = math.floor(pseudorandom(pseudoseed("cry_error")) * 10 + 1)
			end
			card.ability.extra.sell_rounds = card.ability.extra.sell_rounds - 1
			if card.ability.extra.sell_rounds == 0 then
				card.ability.extra.active = true
				local eval = function(card)
					return not card.REMOVED
				end
				juice_card_until(card, eval, true)
			else
				return {
					message = "???",
					colour = G.C.BLACK,
				}
			end
		end
		if
			context.selling_self
			and card.ability.extra.active
			and not context.retrigger_joker
			and not context.blueprint
		then
			local eval = function(card)
				return (Cryptid.safe_get(card, "ability", "loyalty_remaining") == 0) and not G.RESET_JIGGLES
			end
			juice_card_until(card, eval, true)
			local jokers = {}
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i].ability.name ~= "cry-Error" then
					jokers[#jokers + 1] = G.jokers.cards[i]
				end
			end
			for i = 1, #jokers do
				local card = copy_card(jokers[i])
				card:add_to_deck()
				G.jokers:emplace(card)
			end
			return nil, true
		end
	end,
	cry_credits = {
		idea = {
			"Coronacht",
			"Fetch",
		},
		art = {
			"Mystic Misclick",
		},
		code = {
			"Math",
		},
	},
	init = function(self)
		cry_error_operators = { "+", "-", "X", "/", "^", "=", ">", "<", "m" }
		cry_error_numbers = {
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
			"10",
			"69",
			"404",
			"420",
			"-1",
			"0.5",
			"m",
			"nan",
			"inf",
			"nil",
			"pi",
			"1e9",
			"???",
			"114",
			"leet",
			"666",
			"eee6",
			"21",
			"365",
			"2024",
		}
		cry_error_msgs = {
			{ string = "rand()", colour = G.C.RARITY["cry_exotic"] },
			{ string = "m", colour = G.C.UI.TEXT_DARK },
			{ string = "Chips", colour = G.C.CHIPS },
			{ string = "Mult", colour = G.C.MULT },
			{ string = "Jokers", colour = G.C.FILTER },
			{ string = "dollars", colour = G.C.FILTER },
			{ string = "hands", colour = G.C.FILTER },
			{ string = "slots", colour = G.C.FILTER },
			{ string = "Antes", colour = G.C.FILTER },
			{ string = "ERROR", colour = G.C.UI.TEXT_INACTIVE },
			{ string = "Tarots", colour = G.C.SECONDARY_SET.Tarot },
			{ string = "Planets", colour = G.C.SECONDARY_SET.Planet },
			{ string = "Codes", colour = G.C.SECONDARY_SET.Code },
			{ string = "Specls", colour = G.C.SECONDARY_SET.Spectral },
			{ string = "Jolly", colour = G.C.CRY_JOLLY },
			{ string = "Tags", colour = G.C.RED },
			{ string = "Cryptids", colour = G.C.SECONDARY_SET.Spectral },
			{ string = "Glop", colour = G.C.CRY_ALTGREENGRADIENT },
			{ string = "%%ERROR", colour = G.C.CRY_ASCENDANT }, --temp string, this will be modified
		}

		function Cryptid.predict_pseudoseed(key)
			local M = G.GAME.pseudorandom[key] or pseudohash(key .. (G.GAME.pseudorandom.seed or ""))
			local m = math.abs(tonumber(string.format("%.13f", (2.134453429141 + M * 1.72431234) % 1)))
			return (m + (G.GAME.pseudorandom.hashed_seed or 0)) / 2
		end

		function Cryptid.predict_card_for_shop()
			local total_rate = G.GAME.joker_rate + G.GAME.playing_card_rate
			for _, v in ipairs(SMODS.ConsumableType.obj_buffer) do
				total_rate = total_rate + (G.GAME[v:lower() .. "_rate"] or 0)
			end
			local polled_rate = pseudorandom(Cryptid.predict_pseudoseed("cdt" .. G.GAME.round_resets.ante)) * total_rate
			local check_rate = 0
			-- need to preserve order to leave RNG unchanged
			local rates =
				{
					{ type = "Joker", val = G.GAME.joker_rate },
					{ type = "Tarot", val = G.GAME.tarot_rate },
					{ type = "Planet", val = G.GAME.planet_rate },
					{
						type = (G.GAME.used_vouchers["v_illusion"] and pseudorandom(
							Cryptid.predict_pseudoseed("illusion")
						) > 0.6) and "Enhanced" or "Base",
						val = G.GAME.playing_card_rate,
					},
					{ type = "Spectral", val = G.GAME.spectral_rate },
				}
			for _, v in ipairs(SMODS.ConsumableType.obj_buffer) do
				if not (v == "Tarot" or v == "Planet" or v == "Spectral") then
					table.insert(rates, { type = v, val = G.GAME[v:lower() .. "_rate"] })
				end
			end
			for _, v in ipairs(rates) do
				if polled_rate > check_rate and polled_rate <= check_rate + v.val then
					local c = create_card(v.type, "ERROR", nil, nil, nil, nil, nil, "sho")
					if not c.set then
						return v.type:sub(1, 1) .. c.suit:sub(1, 1) .. c.value:sub(1, 2)
					else
						for i = 1, #G.P_CENTER_POOLS[c.set] do
							if G.P_CENTER_POOLS[c.set][i].key == c.key then
								return c.set:sub(1, 1) .. i
							end
						end
					end
				end
				check_rate = check_rate + v.val
			end
		end
	end,
}

-- m
-- This Joker gains X13 Mult when Jolly Joker is sold
local m = {
	object_type = "Joker",
	discovered = true,
	name = "cry-m",
	key = "m",
	pos = { x = 3, y = 1 },
	config = { extra = { extra = 13, x_mult = 1 } },
	gameset_config = {
		modest = { extra = { extra = 1, x_mult = 1 } },
	},
	dependencies = {
		items = {
			"set_cry_epic",
			-- Note: This isn't in the M Joker content set due to being added separately
		},
	},
	pools = { ["Meme"] = true, ["M"] = true },
	rarity = "cry_epic",
	order = 1,
	cost = 13,
	effect = "M Joker",
	perishable_compat = false,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, center)
		info_queue[#info_queue + 1] = G.P_CENTERS.j_jolly
		return { vars = { center.ability.extra.extra, center.ability.extra.x_mult } }
	end,
	atlas = "atlasepic",
	calculate = function(self, card, context)
		if context.joker_main and (to_big(card.ability.extra.x_mult) > to_big(1)) then
			return {
				message = localize({ type = "variable", key = "a_xmult", vars = { card.ability.extra.x_mult } }),
				Xmult_mod = card.ability.extra.x_mult,
			}
		end
		if context.selling_card and context.card:is_jolly() and not context.blueprint then
			card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.extra
			if not context.retrigger_joker then
				--This doesn't display the correct amount of mult if retriggered it display the amount from the first retrigger instead of the final one
				--But I would rather have this than constant card_eval_status_text spam
				--If anyone knows a solution feel free to do a pr xd
				card_eval_status_text(
					card,
					"extra",
					nil,
					nil,
					nil,
					{ message = localize({ type = "variable", key = "a_xmult", vars = { card.ability.extra.x_mult } }) }
				)
			end
			return nil, true
		end
	end,
	cry_credits = {
		idea = {
			"Jevonn",
		},
		art = {
			"Jevonn",
		},
		code = {
			"Math",
		},
	},
}

-- M
-- Create a Negative Jolly Joker when Blind is selected
local M = {
	object_type = "Joker",
	name = "cry-M",
	key = "M",
	pos = { x = 0, y = 0 },
	order = 250,
	dependencies = {
		items = {
			"set_cry_epic",
			--Note: This isn't in the M Joker content set due to being added separately
		},
	},
	rarity = "cry_epic",
	effect = "M Joker",
	cost = 13,
	immutable = true,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, center)
		info_queue[#info_queue + 1] = G.P_CENTERS.j_jolly
		if not center.edition or (center.edition and not center.edition.negative) then
			info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
		end
	end,
	atlas = "atlasepic",
	calculate = function(self, card, context)
		if context.setting_blind and not (context.blueprint_card or self).getting_sliced then
			local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_jolly")
			card:set_edition({
				negative = true,
			})
			card:add_to_deck()
			G.jokers:emplace(card)
			return nil, true
		end
	end,
	pools = { ["M"] = true },
	cry_credits = {
		idea = {
			"Jevonn",
		},
		art = {
			"Jevonn",
		},
		code = {
			"Math",
		},
	},
}

-- Boredom
-- 1 in 2 chance to retrigger each Joker or played card
local boredom = {
	object_type = "Joker",
	name = "cry-Boredom",
	key = "boredom",
	pos = { x = 1, y = 0 },
	config = { extra = { odds = 2 } },
	dependencies = {
		items = {
			"set_cry_epic",
		},
	},
	gameset_config = {
		modest = { extra = { odds = 3 } },
	},
	pools = { ["Meme"] = true },
	rarity = "cry_epic",
	order = 32,
	cost = 14,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				cry_prob(card.ability.cry_prob, card.ability.extra.odds, card.ability.cry_rigged),
				card.ability.extra.odds,
			},
		}
	end,
	atlas = "atlasepic",
	calculate = function(self, card, context)
		if context.retrigger_joker_check and not context.retrigger_joker and context.other_card ~= self then
			if
				pseudorandom("cry_boredom_joker")
				< cry_prob(card.ability.cry_prob, card.ability.extra.odds, card.ability.cry_rigged)
					/ card.ability.extra.odds
			then
				return {
					message = localize("k_again_ex"),
					repetitions = 1,
					card = card,
				}
			else
				return nil, true
			end
		end
		if
			context.repetition
			and context.cardarea == G.play
			and pseudorandom("cry_boredom_card")
				< cry_prob(card.ability.cry_prob, card.ability.extra.odds, card.ability.cry_rigged) / card.ability.extra.odds
		then
			return {
				message = localize("k_again_ex"),
				repetitions = 1,
				card = card,
			}
		end
	end,
	cry_credits = {
		idea = {
			"Math",
		},
		art = {
			"Saturn",
		},
		code = {
			"Math",
		},
	},
}

-- Number Blocks
-- Earn $1 at end of round; Increase payout by $1 for each [rank] held in hand (changes every round)
local number_blocks = {
	object_type = "Joker",
	name = "cry-Number Blocks",
	key = "number_blocks",
	config = { extra = { money_mod = 1, money = 1 } },
	dependencies = {
		items = {
			"set_cry_epic",
		},
	},
	pos = { x = 0, y = 2 },
	rarity = "cry_epic",
	cost = 14,
	order = 12,
	atlas = "atlasepic",
	loc_vars = function(self, info_queue, center)
		return {
			vars = {
				center.ability.extra.money,
				center.ability.extra.money_mod,
				localize(Cryptid.safe_get(G.GAME, "current_round", "cry_nb_card", "rank") or "Ace", "ranks"),
			},
		}
	end,
	calculate = function(self, card, context)
		if
			context.individual
			and not context.end_of_round
			and context.cardarea == G.hand
			and not context.blueprint
			and not context.before
			and not context.after
			and context.other_card:get_id() == G.GAME.current_round.cry_nb_card.id
		then
			if context.other_card.debuff then
				return {
					message = localize("k_debuffed"),
					colour = G.C.RED,
					card = card,
				}
			else
				card.ability.extra.money = card.ability.extra.money + card.ability.extra.money_mod
				card_eval_status_text(card, "extra", nil, nil, nil, { message = localize("k_upgrade_ex") })
				return nil, true
			end
		end
	end,
	calc_dollar_bonus = function(self, card)
		if to_big(card.ability.extra.money) > to_big(0) then
			return card.ability.extra.money
		end
	end,
	cry_credits = {
		idea = {
			"Jevonn",
		},
		art = {
			"Jevonn",
		},
		code = {
			"Math",
		},
	},
}

-- Double Scale
-- Scaling jokers scale quadratically
-- Most of the code for this lies in Card:cry_double_scale_calc in lib/calculate.lua
local double_scale = {
	object_type = "Joker",
	name = "cry-Double Scale",
	key = "Double Scale",
	pos = { x = 0, y = 3 },
	dependencies = {
		items = {
			"set_cry_epic",
		},
	},
	gameset_config = {
		modest = { cost = 20, center = { rarity = 4 } },
		exp_modest = { cost = 11 },
	},
	extra_gamesets = { "exp_modest" },
	loc_vars = function(self, info_queue, center)
		return { key = Cryptid.gameset_loc(self, { exp_modest = "modest" }) }
	end,
	order = 6,
	rarity = "cry_epic",
	cost = 18,
	immutable = true,
	atlas = "atlasepic",
	cry_scale_mod = function(self, card, joker, orig_scale_scale, true_base, orig_scale_base, new_scale_base)
		if Cryptid.gameset(self) == "exp_modest" then
			return true_base * 2
		end
		return orig_scale_scale + true_base
	end,
	cry_credits = {
		idea = {
			"Mystic Misclick",
		},
		art = {
			"AlezZGreat",
		},
		code = {
			"Math",
			"Mathguy",
		},
	},
}

-- Nostalgic Candy
-- Sell this card to permanently gain +3 hand size
local oldcandy = {
	object_type = "Joker",
	name = "cry_oldcandy",
	key = "oldcandy",
	pos = { x = 4, y = 1 },
	order = 43,
	config = { extra = { hand_size = 3 } },
	gameset_config = {
		modest = { extra = { hand_size = 1 } },
	},
	dependencies = {
		items = {
			"set_cry_epic",
		},
	},
	pools = { ["Food"] = true },
	loc_vars = function(self, info_queue, center)
		return { vars = { math.max(1, math.floor(center.ability.extra.hand_size)) } }
	end,
	rarity = "cry_epic",
	cost = 9,
	eternal_compat = false,
	atlas = "atlasepic",
	calculate = function(self, card, context)
		if context.selling_self and not context.blueprint then
			G.hand:change_size(math.max(1, math.floor(card.ability.extra.hand_size)))
			return nil, true
		end
	end,
	cry_credits = {
		idea = {
			"Jevonn",
		},
		art = {
			"Jevonn",
		},
		code = {
			"Jevonn",
		},
	},
}

-- Circus
-- Rare/Epic/Legendary/Exotic Jokers give X2/3/4/20 Mult
local circus = {
	object_type = "Joker",
	name = "cry-circus",
	key = "circus",
	pos = { x = 4, y = 4 },
	config = { extra = { Xmult = 1 } },
	dependencies = {
		items = {
			"set_cry_epic",
		},
	},
	atlas = "atlasepic",
	order = 33,
	loc_vars = function(self, info_queue, center)
		return {
			vars = {
				(math.max(1, center.ability.extra.Xmult) * 2),
				(math.max(1, center.ability.extra.Xmult) * 3),
				(math.max(1, center.ability.extra.Xmult) * 4),
				(math.max(1, center.ability.extra.Xmult) * 20),
			},
		}
	end,
	rarity = "cry_epic",
	cost = 16,
	blueprint_compat = true,
	calculate = function(self, card, context)
		if context.other_joker and card ~= context.other_joker then
			if context.other_joker.config.center.rarity == 3 then --Rare
				if not Talisman.config_file.disable_anims then
					G.E_MANAGER:add_event(Event({
						func = function()
							context.other_joker:juice_up(0.5, 0.5)
							return true
						end,
					}))
				end
				return {
					message = localize({
						type = "variable",
						key = "a_xmult",
						vars = { (math.max(1, card.ability.extra.Xmult) * 2) },
					}),
					Xmult_mod = (math.max(1, card.ability.extra.Xmult) * 2),
				}
			elseif context.other_joker.config.center.rarity == 4 then --Legendary
				if not Talisman.config_file.disable_anims then
					G.E_MANAGER:add_event(Event({
						func = function()
							context.other_joker:juice_up(0.5, 0.5)
							return true
						end,
					}))
				end
				return {
					message = localize({
						type = "variable",
						key = "a_xmult",
						vars = { (math.max(1, card.ability.extra.Xmult) * 4) },
					}),
					Xmult_mod = (math.max(1, card.ability.extra.Xmult) * 4),
				}
			elseif context.other_joker.config.center.rarity == "cry_epic" then --Epic
				if not Talisman.config_file.disable_anims then
					G.E_MANAGER:add_event(Event({
						func = function()
							context.other_joker:juice_up(0.5, 0.5)
							return true
						end,
					}))
				end
				return {
					message = localize({
						type = "variable",
						key = "a_xmult",
						vars = { (math.max(1, card.ability.extra.Xmult) * 3) },
					}),
					Xmult_mod = (math.max(1, card.ability.extra.Xmult) * 3),
				}
			elseif context.other_joker.config.center.rarity == "cry_exotic" then --Exotic
				if not Talisman.config_file.disable_anims then
					G.E_MANAGER:add_event(Event({
						func = function()
							context.other_joker:juice_up(0.5, 0.5)
							return true
						end,
					}))
				end
				return {
					message = localize({
						type = "variable",
						key = "a_xmult",
						vars = { (math.max(1, card.ability.extra.Xmult) * 20) },
					}),
					Xmult_mod = (math.max(1, card.ability.extra.Xmult) * 20),
				}
			end
		end
	end,
	cry_credits = {
		idea = {
			"Ein13",
		},
		art = {
			"Ein13",
		},
		code = {
			"Jevonn",
		},
	},
}

-- Caramel
-- Each played card gives X1.75 Mult when scored for the next 11 rounds
local caramel = {
	object_type = "Joker",
	name = "cry-caramel",
	key = "caramel",
	config = { extra = { x_mult = 1.75, rounds_remaining = 11 } },
	dependencies = {
		items = {
			"set_cry_epic",
		},
	},
	pos = { x = 0, y = 1 },
	rarity = "cry_epic",
	cost = 12,
	order = 106,
	gameset_config = {
		modest = { extra = { x_mult = 1.5, rounds_remaining = 6 } },
	},
	pools = { ["Food"] = true },
	blueprint_compat = true,
	eternal_compat = false,
	atlas = "atlasepic",
	loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.x_mult, center.ability.extra.rounds_remaining } }
	end,
	calculate = function(self, card, context)
		if context.individual then
			if context.cardarea == G.play then
				return {
					x_mult = card.ability.extra.x_mult,
					colour = G.C.RED,
					card = card,
				}
			end
		end
		if
			context.end_of_round
			and not context.blueprint
			and not context.individual
			and not context.repetition
			and not context.retrigger_joker
		then
			card.ability.extra.rounds_remaining = card.ability.extra.rounds_remaining - 1
			if card.ability.extra.rounds_remaining > 0 then
				return {
					message = { localize("cry_minus_round") },
					colour = G.C.FILTER,
				}
			else
				G.E_MANAGER:add_event(Event({
					func = function()
						play_sound("tarot1")
						card.T.r = -0.2
						card:juice_up(0.3, 0.4)
						card.states.drag.is = true
						card.children.center.pinch.x = true
						G.E_MANAGER:add_event(Event({
							trigger = "after",
							delay = 0.3,
							blockable = false,
							func = function()
								G.jokers:remove_card(card)
								card:remove()
								card = nil
								return true
							end,
						}))
						return true
					end,
				}))
				return {
					message = localize("k_eaten_ex"),
					colour = G.C.FILTER,
				}
			end
		end
	end,
	cry_credits = {
		idea = {
			"Jevonn",
		},
		art = {
			"Jevonn",
		},
		code = {
			"Jevonn",
		},
	},
}

-- Sob
-- you cannot run... you cannot hide... you cannot escape...
-- Creates a Negative Absolute Eternal Obelisk when added
-- Creates Obelisks (if room) when doing just about anything

-- Still planning on making one more change to this later - Jevonn
local curse_sob = {
	object_type = "Joker",
	name = "cry_curse_sob",
	key = "curse_sob",
	pos = { x = 1, y = 1 },
	pools = { ["Meme"] = true },
	dependencies = {
		items = {
			"set_cry_epic",
		},
	},
	gameset_config = {
		modest = { cost = 20, center = { rarity = 4 } },
	},
	rarity = "cry_epic",
	cost = 9,
	order = 82,
	immutable = true,
	perishable_compat = true,
	atlas = "atlasepic",
	calculate = function(self, card, context)
		if
			context.selling_card
			and context.card.ability.name == "Obelisk"
			and not context.retrigger_joker
			and not context.blueprint
		then
			return {}
		elseif
			( -- Compacting all the elseifs into one block for space and readability also maintablity
				context.selling_self
				or context.discard
				or context.reroll_shop --Yes
				or context.buying_card
				or context.skip_blind
				or context.using_consumeable
				or context.selling_card
				or context.setting_blind
				or context.skipping_booster
				or context.open_booster
			)
			and #G.jokers.cards + G.GAME.joker_buffer < (context.selling_self and (G.jokers.config.card_limit + 1) or G.jokers.config.card_limit)
			and not context.retrigger_joker
			and not context.blueprint
		then
			local createjoker = math.min(1, G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
			G.GAME.joker_buffer = G.GAME.joker_buffer + createjoker
			local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_obelisk")
			card:add_to_deck()
			G.jokers:emplace(card)
			G.GAME.joker_buffer = 0
			return {
				card_eval_status_text(card, "extra", nil, nil, nil, {
					message = localize("cry_curse_ex"),
					colour = G.C.FILTER,
				}),
			}
		end
	end,
	add_to_deck = function(self, card, from_debuff)
		if not from_debuff then
			local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_obelisk")
			card:set_edition("e_negative", true, nil, true)
			card.ability.cry_absolute = true
			card:add_to_deck()
			G.jokers:emplace(card)
			return {
				card_eval_status_text(card, "extra", nil, nil, nil, {
					message = localize("cry_curse_ex"),
					colour = G.C.DARK_EDITION,
				}),
			}
		end
	end,
	cry_credits = {
		idea = {
			"Jevonn",
		},
		art = {
			"Jevonn",
		},
		code = {
			"Jevonn",
		},
	},
	unlocked = false,
	check_for_unlock = function(self, args)
		if Cryptid.safe_get(G, "jokers") then
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i].config.center.key == "j_obelisk" and G.jokers.cards[i].ability.eternal then
					unlock_card(self)
				end
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

-- Bonus Joker
-- 1 in 8 chance for each played Bonus Card to increase Joker or Consumable slots by 1 when scored
-- Works twice per round
local bonusjoker = {
	object_type = "Joker",
	name = "cry-Bonus Joker",
	key = "bonusjoker",
	pos = { x = 3, y = 2 },
	config = { extra = { odds = 8, check = 0, add = 1 } },
	dependencies = {
		items = {
			"set_cry_epic",
		},
	},
	immutable = true,
	rarity = "cry_epic",
	cost = 11,
	order = 75,
	blueprint_compat = true,
	enhancement_gate = "m_bonus",
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_bonus
		return {
			vars = {
				cry_prob(card.ability.cry_prob, card.ability.extra.odds, card.ability.cry_rigged),
				card.ability.extra.odds,
				card.ability.extra.add,
			},
		}
	end,
	atlas = "atlasepic",
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if SMODS.has_enhancement(context.other_card, "m_bonus") then
				if
					pseudorandom("bonusjoker")
						< cry_prob(card.ability.cry_prob, card.ability.extra.odds, card.ability.cry_rigged) / card.ability.extra.odds
					and card.ability.extra.check < 2
					and not context.retrigger_joker
				then
					local option = pseudorandom_element({ 1, 2 }, pseudoseed("bonusjoker"))
					if option == 1 then
						if not context.blueprint then
							card.ability.extra.check = card.ability.extra.check + 1
						end
						G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.add
					else
						if not context.blueprint then
							card.ability.extra.check = card.ability.extra.check + 1
						end
						G.consumeables.config.card_limit = G.consumeables.config.card_limit + card.ability.extra.add
					end
					return {
						extra = { focus = card, message = localize("k_upgrade_ex") },
						card = card,
						colour = G.C.MONEY,
					}
				end
			end
		end
		if
			context.end_of_round
			and card.ability.extra.check ~= 0
			and not context.blueprint
			and not context.retrigger_joker
			and not context.individual
			and not context.repetition
		then
			card.ability.extra.check = 0
			return {
				message = localize("k_reset"),
				card = card,
			}
		end
	end,
	cry_credits = {
		idea = {
			"Jevonn",
		},
		art = {
			"Jevonn",
		},
		code = {
			"Jevonn",
		},
	},
}

-- Mult Joker
-- 1 in 3 chance for each played Mult Card to create a Cryptid when scored (Must have room)
local multjoker = {
	object_type = "Joker",
	name = "cry-Mult Joker",
	key = "multjoker",
	pos = { x = 2, y = 3 },
	config = { extra = { odds = 3 } },
	dependencies = {
		items = {
			"set_cry_epic",
		},
	},
	rarity = "cry_epic",
	order = 99,
	cost = 11,
	blueprint_compat = true,
	enhancement_gate = "m_mult",
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_mult
		info_queue[#info_queue + 1] = G.P_CENTERS.c_cryptid
		return {
			vars = {
				cry_prob(card.ability.cry_prob, card.ability.extra.odds, card.ability.cry_rigged),
				card.ability.extra.odds,
			},
		}
	end,
	atlas = "atlasepic",
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if
				SMODS.has_enhancement(context.other_card, "m_mult")
				and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit
			then
				if
					pseudorandom("multjoker")
					< cry_prob(card.ability.cry_prob, card.ability.extra.odds, card.ability.cry_rigged)
						/ card.ability.extra.odds
				then
					G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
					G.E_MANAGER:add_event(Event({
						func = function()
							local new_card =
								create_card("Spectral", G.consumeables, nil, nil, nil, nil, "c_cryptid", "multjoker")
							new_card:add_to_deck()
							G.consumeables:emplace(new_card)
							G.GAME.consumeable_buffer = 0
							return true
						end,
					}))
					card_eval_status_text(
						context.blueprint_card or card,
						"extra",
						nil,
						nil,
						nil,
						{ message = localize("cry_plus_cryptid"), colour = G.C.SECONDARY_SET.Spectral }
					)
					return nil, true
				end
			end
		end
	end,
	cry_credits = {
		idea = {
			"Jevonn",
		},
		art = {
			"Jevonn",
		},
		code = {
			"Jevonn",
		},
	},
}

-- Gold Joker
-- Earn +2% at end of round when a Gold Card is scored
local goldjoker = {
	object_type = "Joker",
	name = "cry-gold Joker",
	key = "goldjoker",
	config = { extra = { percent_mod = 2, percent = 0 } },
	dependencies = {
		items = {
			"set_cry_epic",
		},
	},
	pos = { x = 0, y = 4 },
	rarity = "cry_epic",
	cost = 14,
	order = 81,
	enhancement_gate = "m_gold",
	perishable_compat = false,
	atlas = "atlasepic",
	loc_vars = function(self, info_queue, center)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_gold
		return { vars = { center.ability.extra.percent, center.ability.extra.percent_mod } }
	end,
	calculate = function(self, card, context)
		if context.cardarea == G.play and context.individual and not context.blueprint then
			if SMODS.has_enhancement(context.other_card, "m_gold") then
				card.ability.extra.percent = card.ability.extra.percent + card.ability.extra.percent_mod
				return {
					extra = { focus = card, message = localize("k_upgrade_ex") },
					card = card,
					colour = G.C.MONEY,
				}
			end
		end
		if context.individual and context.cardarea == G.play then
			if SMODS.has_enhancement(context.other_card, "m_gold") then
				card.ability.extra.percent = card.ability.extra.percent + card.ability.extra.percent_mod
				return {
					message = localize("k_upgrade_ex"),
					card = card,
					colour = G.C.CHIPS,
				}
			end
		end
	end,
	calc_dollar_bonus = function(self, card)
		local bonus = math.max(0, math.floor(0.01 * card.ability.extra.percent * (G.GAME.dollars or 0)))
		if bonus > to_big(0) then
			return bonus
		end
	end,
	cry_credits = {
		idea = {
			"Jevonn",
		},
		art = {
			"Jevonn",
		},
		code = {
			"Jevonn",
		},
	},
}

-- Nostalgic Googol Play Card
-- Sell this card to create 2 copies of the leftmost Joker
-- Still needs updated description
local altgoogol = {
	object_type = "Joker",
	name = "cry-altgoogol",
	key = "altgoogol",
	pos = { x = 4, y = 3 },
	dependencies = {
		items = {
			"set_cry_epic",
		},
	},
	immutable = true,
	rarity = "cry_epic",
	cost = 10,
	order = 60,
	blueprint_compat = false,
	eternal_compat = false,
	atlas = "atlasepic",
	soul_pos = { x = 10, y = 0, extra = { x = 5, y = 3 } },
	gameset_config = {
		modest = { cost = 15, copies = 1 },
		mainline = { copies = 2 },
		madness = { center = { blueprint_compat = true }, copies = 2 },
	},
	loc_vars = function(self, info_queue, center)
		return { key = Cryptid.gameset_loc(self, { modest = "balanced" }), vars = { center.ability.copies } }
	end,
	calculate = function(self, card, context)
		local gameset = Card.get_gameset(card)
		if context.selling_self and not context.retrigger_joker and (gameset == "madness" or not context.blueprint) then
			local jokers = {}
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] ~= card then
					jokers[#jokers + 1] = G.jokers.cards[i]
				end
			end
			if #jokers > 0 then
				if not gameset == "modest" or #G.jokers.cards <= G.jokers.config.card_limit then
					if G.jokers.cards[1].ability.name ~= "cry-altgoogol" then
						G.E_MANAGER:add_event(Event({
							func = function()
								for i = 1, card.ability.copies do
									local chosen_joker = G.jokers.cards[1]
									local card = copy_card(
										chosen_joker,
										nil,
										nil,
										nil,
										(
											gameset == "modest"
												and (Cryptid.safe_get(chosen_joker, "edition", "negative"))
											or nil
										)
									)
									card:add_to_deck()
									G.jokers:emplace(card)
								end
								return true
							end,
						}))
						card_eval_status_text(context.blueprint_card or card, "extra", nil, nil, nil, {
							message = localize("k_duplicated_ex"),
							colour = G.C.RARITY.cry_epic,
						})
						return nil, true
					else
						card_eval_status_text(context.blueprint_card or card, "extra", nil, nil, nil, {
							message = localize("k_nope_ex"),
							colour = G.C.RARITY.cry_epic,
						})
						return nil, true
					end
				else
					card_eval_status_text(context.blueprint_card or card, "extra", nil, nil, nil, {
						message = localize("k_no_room_ex"),
						colour = G.C.RARITY.cry_epic,
					})
					return nil, true
				end
			else
				card_eval_status_text(context.blueprint_card or card, "extra", nil, nil, nil, {
					message = localize("k_no_other_jokers"),
					colour = G.C.RARITY.cry_epic,
				})
				return nil, true
			end
		end
	end,
	cry_credits = {
		idea = {
			"Jevonn",
		},
		art = {
			"Jevonn",
		},
		code = {
			"Jevonn",
		},
	},
}

-- One For All
-- +1 Joker slot, Booster Pack slot, hand size, consumable slot, shop slot
local soccer = {
	object_type = "Joker",
	name = "cry-soccer",
	key = "soccer",
	pos = { x = 1, y = 4 },
	config = { extra = { holygrail = 1 } },
	dependencies = {
		items = {
			"set_cry_epic",
		},
	},
	immutable = true, -- i swear i changed this... whatever
	rarity = "cry_epic",
	order = 58,
	cost = 20,
	atlas = "atlasepic",
	loc_vars = function(self, info_queue, center)
		return { key = Cryptid.gameset_loc(self, { modest = "balanced" }), vars = { center.ability.extra.holygrail } }
	end,
	add_to_deck = function(self, card, from_debuff)
		card.ability.extra.holygrail = math.floor(card.ability.extra.holygrail)
		local mod = card.ability.extra.holygrail
		G.jokers.config.card_limit = G.jokers.config.card_limit + ((Card.get_gameset(card) == "modest") and 0 or mod)
		G.consumeables.config.card_limit = G.consumeables.config.card_limit + mod
		G.hand:change_size(mod)
		SMODS.change_booster_limit(mod)
		SMODS.change_voucher_limit(mod)
	end,
	remove_from_deck = function(self, card, from_debuff)
		card.ability.extra.holygrail = math.floor(card.ability.extra.holygrail)
		local mod = card.ability.extra.holygrail
		G.jokers.config.card_limit = G.jokers.config.card_limit + ((Card.get_gameset(card) == "modest") and 0 or -mod)
		G.consumeables.config.card_limit = G.consumeables.config.card_limit - mod
		G.hand:change_size(-mod)
		SMODS.change_booster_limit(-mod)
		SMODS.change_voucher_limit(-mod)
	end,
	cry_credits = {
		idea = {
			"Mjiojio",
		},
		art = {
			"HexaCryonic",
		},
		code = {
			"Jevonn",
		},
	},
	unlocked = false,
	check_for_unlock = function(self, args)
		if args.type == "win" then
			for k, v in pairs(G.GAME.hands) do
				if k ~= "High Card" and G.GAME.hands[k].played ~= 0 then
					return
				end
			end
			return true
		end
		if args.type == "cry_lock_all" then
			lock_card(self)
		end
		if args.type == "cry_unlock_all" then
			unlock_card(self)
		end
	end,
}

-- Flesh Panopticon
-- X20 Boss Blind size; When Boss Blind defeated, self destructs and creates a Negative Gateway
local fleshpanopticon = {
	object_type = "Joker",
	name = "cry-fleshpanopticon",
	key = "fleshpanopticon",
	pos = { x = 0, y = 5 },
	config = { extra = { boss_size = 20 } },
	dependencies = {
		items = {
			"set_cry_epic",
			"c_cry_gateway",
		},
	},
	immutable = true,
	rarity = "cry_epic",
	cost = 15,
	order = 146,
	atlas = "atlasepic",
	loc_vars = function(self, info_queue, center)
		info_queue[#info_queue + 1] = { set = "Spectral", key = "c_cry_gateway" }
		if not center.edition or (center.edition and not center.edition.negative) then
			info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
		end
		return { vars = { center.ability.extra.boss_size } }
	end,
	calculate = function(self, card, context)
		if context.setting_blind and not context.blueprint and context.blind.boss and not card.getting_sliced then
			local eval = function(card)
				return not card.REMOVED and not G.RESET_JIGGLES
			end
			juice_card_until(card, eval, true)
			card.gone = false
			G.GAME.blind.chips = G.GAME.blind.chips * card.ability.extra.boss_size
			G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
			G.HUD_blind:recalculate()
			G.E_MANAGER:add_event(Event({
				func = function()
					G.E_MANAGER:add_event(Event({
						func = function()
							play_sound("timpani")
							delay(0.4)
							return true
						end,
					}))
					card_eval_status_text(card, "extra", nil, nil, nil, { message = localize("cry_good_luck_ex") })
					return true
				end,
			}))
		end
		if
			context.end_of_round
			and not context.individual
			and not context.repetition
			and not context.blueprint
			and G.GAME.blind.boss
			and not card.gone
		then
			G.E_MANAGER:add_event(Event({
				trigger = "before",
				delay = 0.0,
				func = function()
					local card = create_card(
						nil,
						G.consumeables,
						nil,
						nil,
						nil,
						nil,
						Cryptid.enabled("c_cry_gateway") and "c_cry_gateway" or "c_soul",
						"sup"
					)
					card:set_edition({ negative = true }, true)
					card:add_to_deck()
					G.consumeables:emplace(card)
					return true
				end,
			}))
			if not card.ability.eternal then
				G.E_MANAGER:add_event(Event({
					func = function()
						play_sound("tarot1")
						card.T.r = -0.2
						card:juice_up(0.3, 0.4)
						card.states.drag.is = true
						card.children.center.pinch.x = true
						G.E_MANAGER:add_event(Event({
							trigger = "after",
							delay = 0.3,
							blockable = false,
							func = function()
								G.jokers:remove_card(card)
								card:remove()
								card = nil
								return true
							end,
						}))
						return true
					end,
				}))
			end
			card.gone = true
		end
	end,
	cry_credits = {
		idea = {
			"notmario",
		},
		art = {
			"notmario",
		},
		code = {
			"notmario",
		},
	},
}
-- Spectrogram
-- Retrigger rightmost Joker once for every Echo Card played and scored
local spectrogram = {
	object_type = "Joker",
	name = "cry-Spectrogram",
	key = "spectrogram",
	pos = { x = 1, y = 5 },
	config = { extra = { echonum = 0 } },
	rarity = "cry_epic",
	cost = 9,
	order = 133,
	atlas = "atlasepic",
	dependencies = {
		items = {
			"set_cry_epic",
			"m_cry_echo",
		},
	},
	loc_vars = function(self, info_queue, center)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_cry_echo
		return { vars = {} }
	end,
	calculate = function(self, card, context)
		if context.before and context.cardarea == G.jokers then
			card.ability.extra.echonum = 0
			for i, v in pairs(context.scoring_hand) do
				if v.config.center_key == "m_cry_echo" and not v.debuff then
					card.ability.extra.echonum = card.ability.extra.echonum + 1
				end
			end
		end

		if
			context.retrigger_joker_check
			and not context.retrigger_joker
			and context.other_card == G.jokers.cards[#G.jokers.cards]
			and context.other_card ~= self
		then
			if card.ability.extra.echonum and card.ability.extra.echonum > 0 then
				return {
					message = localize("k_again_ex"),
					repetitions = card.ability.extra.echonum,
					card = card,
				}
			end
		end
	end,
	cry_credits = {
		idea = {
			"AlexZGreat",
		},
		art = {
			"SMG9000",
		},
		code = {
			"AlexZGreat",
		},
	},
}
local jtron = {
	object_type = "Joker",
	dependencies = {
		items = {
			"set_cry_epic",
		},
	},
	name = "cry-jtron",
	key = "jtron",
	config = { extra = { bonus = 1, current = 0 } },
	rarity = "cry_epic",
	cost = 14,
	order = 64,
	blueprint_compat = true,
	atlas = "atlasepic",
	pos = { x = 2, y = 5 },
	loc_vars = function(self, info_queue, center)
		info_queue[#info_queue + 1] = G.P_CENTERS.j_joker
		center.ability.extra.current = 1 + center.ability.extra.bonus * #SMODS.find_card("j_joker")
		return { vars = { center.ability.extra.bonus, center.ability.extra.current } }
	end,
	calculate = function(self, card, context)
		card.ability.extra.current = 1 + card.ability.extra.bonus * #SMODS.find_card("j_joker")
		if context.cardarea == G.jokers and context.joker_main then
			return {
				message = localize({
					type = "variable",
					key = "a_powmult",
					vars = {
						number_format(card.ability.extra.current),
					},
				}),
				Emult_mod = card.ability.extra.current,
				colour = G.C.DARK_EDITION,
			}
		end
	end,
	cry_credits = {
		idea = { "AlexZGreat" },
		art = { "Darren_The_Frog" },
		code = { "candycanearter" },
	},
}
-- Retriggers steels every 2nd hand, scaling xmult every 3rd hand, first card to steel every 5th hand, stronger steels every 7th hand
local clockwork = { -- Steel Support: The Joker
	object_type = "Joker",
	dependencies = {
		items = {
			"set_cry_epic",
		},
	},
	name = "cry-clockwork",
	key = "clockwork",
	pos = { x = 5, y = 5 },
	config = {
		limits = { l1 = 2, l2 = 3, l3 = 5, l4 = 7 },
		counters = { c1 = 0, c2 = 0, c3 = 0, c4 = 0 },
		extra = { xmult = 1, xmult_mod = 0.25, steelenhc = 1, steel_mod = 0.1 },
	},
	order = 135,
	immutable = false,
	rarity = "cry_epic",
	cost = 12,
	blueprint_compat = true,
	atlas = "atlasone",
	enhancement_gate = "m_steel", -- lucky joker uses this? hopefully it works
	loc_vars = function(self, info_queue, center)
		local function process_var(m, cap)
			if m >= cap - 1 then
				return localize("k_active_ex")
			end
			return cap - m - 1
		end
		return {
			vars = {
				process_var(center.ability.counters.c1, center.ability.limits.l1),
				process_var(center.ability.counters.c2, center.ability.limits.l2),
				process_var(center.ability.counters.c3, center.ability.limits.l3),
				process_var(center.ability.counters.c4, center.ability.limits.l4),
				center.ability.extra.xmult,
				center.ability.extra.xmult_mod,
				center.ability.extra.steelenhc,
				center.ability.extra.steel_mod,
				center.ability.limits.l1,
				center.ability.limits.l2,
				center.ability.limits.l3,
				center.ability.limits.l4,
			},
		}
	end,
	calculate = function(self, card, context)
		if context.before and context.cardarea == G.jokers and not context.blueprint and not context.retrigger then
			local function clamp(c, l)
				local m = c + 1
				if c + 1 >= l then
					return 0
				end
				return m
			end

			card.ability.counters.c1 = clamp(card.ability.counters.c1, card.ability.limits.l1) -- ticker 1

			card.ability.counters.c2 = clamp(card.ability.counters.c2, card.ability.limits.l2) -- ticker 2
			if card.ability.counters.c2 == 0 then
				card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_mod
			end

			card.ability.counters.c3 = clamp(card.ability.counters.c3, card.ability.limits.l3) -- ticker 3

			card.ability.counters.c4 = clamp(card.ability.counters.c4, card.ability.limits.l4) -- ticker 4
			if card.ability.counters.c4 == 0 then
				card.ability.extra.steelenhc = card.ability.extra.steelenhc + card.ability.extra.steel_mod
			end
		end
		if context.repetition and context.cardarea == G.hand and card.ability.counters.c1 == 0 then -- effect 1
			if SMODS.has_enhancement(context.other_card, "m_steel") then
				return {
					message = localize("k_again_ex"),
					repetitions = 1,
					card = card,
				}
			end
		end
		if
			context.joker_main and context.cardarea == G.jokers -- effect 2
		then
			return { xmult = card.ability.extra.xmult }
		end
		if
			context.before
			and context.cardarea == G.jokers
			and not context.blueprint_card
			and not context.retrigger_joker
			and card.ability.counters.c3 == 0
		then -- effect 3
			context.full_hand[1]:set_ability(G.P_CENTERS["m_steel"], nil, true)
		end
		if
			context.individual
			and context.cardarea == G.hand
			and not context.end_of_round
			and SMODS.has_enhancement(context.other_card, "m_steel")
			and card.ability.extra.steelenhc ~= 1
		then
			if context.other_card.debuff then
				return {
					message = localize("k_debuffed"),
					colour = G.C.RED,
					card = card,
				}
			else -- effect 4
				return { xmult = card.ability.extra.steelenhc }
			end
		end
		--imo this secret effect can be madness only -Math
		if
			context.after
			and context.cardarea == G.jokers
			and not context.blueprint_card
			and not context.retrigger_joker
		then -- The Clockwork Joker is canonically a non-binary self-replicating machine amoeba, that self replicates every 21 minutes. Their pronouns are any/all; they are several billion tiny jokers
			if -- in a trench coat, constantly ticking in an almost perfect yet flawed mechanism. Its only purpose is the strengthening and spreading of the steel world; everything else is meaningless to it.
				card.ability.counters.c1 == 0 -- lore by nova :3
				and card.ability.counters.c2 == 0
				and card.ability.counters.c3 == 0
				and card.ability.counters.c4 == 0
			then
				G.E_MANAGER:add_event(Event({
					func = function()
						local m = copy_card(card)
						m:add_to_deck()
						G.jokers:emplace(m)
						return true
					end,
				}))
				return {
					message = localize("k_duplicated_ex"),
					card = card,
				}
			end
		end
	end,
	set_ability = function(self, card, initial, delay_sprites)
		card.ability.counters.c1 = math.floor(pseudorandom("Clockwork1") * (card.ability.limits.l1 - 1) + 0.5)
		card.ability.counters.c2 = math.floor(pseudorandom("Clockwork2") * (card.ability.limits.l2 - 1) + 0.5)
		card.ability.counters.c3 = math.floor(pseudorandom("Clockwork3") * (card.ability.limits.l3 - 1) + 0.5)
		card.ability.counters.c4 = math.floor(pseudorandom("Clockwork4") * (card.ability.limits.l4 - 1) + 0.5)
	end,
	cry_credits = {
		idea = {
			"cassknows",
		},
		code = {
			"Nova",
			"Math",
		},
		art = {
			"unexian",
		},
	},
}
return {
	name = "Epic Jokers",
	items = {
		supercell,
		membershipcardtwo,
		googol_play,
		sync_catalyst,
		negative,
		canvas,
		error_joker,
		M,
		m,
		boredom,
		double_scale,
		number_blocks,
		oldcandy,
		circus,
		caramel,
		curse_sob,
		bonusjoker,
		multjoker,
		goldjoker,
		altgoogol,
		soccer,
		fleshpanopticon,
		spectrogram,
		jtron,
		clockwork,
	},
}
