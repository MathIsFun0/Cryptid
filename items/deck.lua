local very_fair = {
	object_type = "Back",
	dependencies = {
		items = {
			"set_cry_deck"
		},
	},
	name = "Very Fair Deck",
	key = "very_fair",
	config = { hands = -2, discards = -2 },
	pos = { x = 4, y = 0 },
	order = 1,
	atlas = "atlasdeck",
	apply = function(self)
		G.GAME.modifiers.cry_no_vouchers = true
	end,
	init = function(self)
		very_fair_quip = {}
	end
}
local equilibrium = {
	object_type = "Back",
	dependencies = {
		items = {
			"set_cry_deck"
		},
	},
	name = "cry-Equilibrium",
	key = "equilibrium",
	order = 3,
	config = { vouchers = { "v_overstock_norm", "v_overstock_plus" } },
	pos = { x = 0, y = 1 },
	atlas = "atlasdeck",
	apply = function(self)
		G.GAME.modifiers.cry_equilibrium = true
	end,
	init = function(self)
		local gp = get_pack
		function get_pack(k, t)
			if G.GAME.modifiers.cry_equilibrium then
				if not P_CRY_ITEMS then
					P_CRY_ITEMS = {}
					local valid_pools = { "Joker", "Consumeables", "Voucher", "Booster" }
					for _, id in ipairs(valid_pools) do
						for k, v in pairs(G.P_CENTER_POOLS[id]) do
							if not center_no(v, "doe", k) then
								P_CRY_ITEMS[#P_CRY_ITEMS + 1] = v.key
							end
						end
					end
					for k, v in pairs(G.P_CARDS) do
						if not center_no(v, "doe", k) then
							P_CRY_ITEMS[#P_CRY_ITEMS + 1] = v.key
						end
					end
				end
				return G.P_CENTERS[pseudorandom_element(
					P_CRY_ITEMS,
					pseudoseed("cry_equipackbrium" .. G.GAME.round_resets.ante)
				)]
			end
			return gp(k, t)
		end
	end
}
local misprint = {
	object_type = "Back",
	dependencies = {
		items = {
			"set_cry_deck"
		},
	},
	name = "cry-Misprint",
	key = "misprint",
	order = 4,
	config = { cry_misprint_min = 0.1, cry_misprint_max = 10 },
	pos = { x = 4, y = 2 },
	atlas = "atlasdeck",
	apply = function(self)
		G.GAME.modifiers.cry_misprint_min = (G.GAME.modifiers.cry_misprint_min or 1) * self.config.cry_misprint_min
			G.GAME.modifiers.cry_misprint_max = (G.GAME.modifiers.cry_misprint_max or 1) * self.config.cry_misprint_max
	end,
}
local infinite = {
	object_type = "Back",
	dependencies = {
		items = {
			"set_cry_deck"
		},
	},
	name = "cry-Infinite",
	key = "infinite",
	order = 2,
	config = { cry_highlight_limit = 1e20, hand_size = 1 },
	pos = { x = 3, y = 0 },
	atlas = "atlasdeck",
	apply = function(self)
		G.GAME.modifiers.cry_highlight_limit = self.config.cry_highlight_limit
	end,
}
local conveyor = {
	object_type = "Back",
	dependencies = {
		items = {
			"set_cry_deck"
		},
	},
	name = "cry-Conveyor",
	key = "conveyor",
	order = 7,
	pos = { x = 1, y = 1 },
	atlas = "atlasdeck",
	apply = function(self)
		G.GAME.modifiers.cry_conveyor = true
	end,
}
local CCD = {
	object_type = "Back",
	dependencies = {
		items = {
			"set_cry_deck"
		},
	},
	name = "cry-CCD",
	key = "CCD",
	order = 5,
	config = { cry_ccd = true },
	pos = { x = 0, y = 0 },
	atlas = "atlasdeck",
	apply = function(self)
		G.GAME.modifiers.cry_ccd = true
	end,
}
local wormhole = {
	object_type = "Back",
	dependencies = {
		items = {
			"set_cry_deck",
			"set_cry_exotic",
		},
	},
	name = "cry-Wormhole",
	key = "wormhole",
	order = 6,
	config = { cry_negative_rate = 20, joker_slot = -2 },
	pos = { x = 3, y = 4 },
	atlas = "atlasdeck",
	apply = function(self)
		G.GAME.modifiers.cry_negative_rate = self.config.cry_negative_rate
		G.E_MANAGER:add_event(Event({
			func = function()
				if G.jokers then
					local card = create_card("Joker", G.jokers, nil, "cry_exotic", nil, nil, nil, "cry_wormhole")
					card:add_to_deck()
					card:start_materialize()
					G.jokers:emplace(card)
					return true
				end
			end,
		}))
	end,
	init = function(self)
		SMODS.Edition:take_ownership("negative", {
			get_weight = function(self)
				return self.weight * (G.GAME.modifiers.cry_negative_rate or 1)
			end,
		}, true)
	end
}
local redeemed = {
	object_type = "Back",
	dependencies = {
		items = {
			"set_cry_deck"
		},
	},
	name = "cry-Redeemed",
	key = "redeemed",
	order = 8,
	pos = { x = 4, y = 4 },
	atlas = "atlasdeck",
	apply = function(self)
		G.GAME.modifiers.cry_redeemed = true
	end,
	init = function(self)
		local cr = Card.redeem
		function Card:redeem()
			cr(self)
			if G.GAME.modifiers.cry_redeemed then
				if
					#G.play.cards == 0
					and (not G.redeemed_vouchers_during_hand or #G.redeemed_vouchers_during_hand.cards == 0)
				then
					G.cry_redeemed_buffer = {}
				end
				for k, v in pairs(G.P_CENTER_POOLS["Voucher"]) do
					if v.requires and not G.GAME.used_vouchers[v] then
						for _, vv in pairs(v.requires) do
							if vv == self.config.center.key then
								--redeem extra voucher code based on Betmma's Vouchers
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
								if not G.cry_redeemed_buffer[v.key]
								and v.unlocked then
									local card = create_card("Voucher", area, nil, nil, nil, nil, v.key)
									G.cry_redeemed_buffer[v.key] = true
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
								end
							end
						end
					end
				end
			end
		end
	end
}
local legendary = {
	object_type = "Back",
	dependencies = {
		items = {
			"set_cry_deck"
		},
	},
	name = "cry-Legendary",
	key = "legendary",
	config = { cry_legendary = true, cry_legendary_rate = 0.2 },
	pos = { x = 0, y = 6 },
	atlas = "atlasdeck",
	order = 15,
	trigger_effect = function(self, args)
		if args.context == "eval" and safe_get(G.GAME, "last_blind", "boss") then
			if G.jokers then
				if #G.jokers.cards < G.jokers.config.card_limit then
					local legendary_poll = pseudorandom(pseudoseed("cry_legendary"))
					legendary_poll = legendary_poll / (G.GAME.probabilities.normal or 1)
					if legendary_poll < self.config.cry_legendary_rate then
						local card = create_card("Joker", G.jokers, true, 4, nil, nil, nil, "")
						card:add_to_deck()
						card:start_materialize()
						G.jokers:emplace(card)
						return true
					else
						card_eval_status_text(
							G.jokers,
							"jokers",
							nil,
							nil,
							nil,
							{ message = localize("k_nope_ex"), colour = G.C.RARITY[4] }
						)
					end
				else
					card_eval_status_text(
						G.jokers,
						"jokers",
						nil,
						nil,
						nil,
						{ message = localize("k_no_room_ex"), colour = G.C.RARITY[4] }
					)
				end
			end
		end
	end,
	apply = function(self)
		G.E_MANAGER:add_event(Event({
			func = function()
				if G.jokers then
					local card = create_card("Joker", G.jokers, true, 4, nil, nil, nil, "")
					card:add_to_deck()
					card:start_materialize()
					G.jokers:emplace(card)
					return true
				end
			end,
		}))
	end,
}
local critical = {
	object_type = "Back",
	dependencies = {
		items = {
			"set_cry_deck"
		},
	},
	name = "cry-Critical",
	key = "critical",
	order = 10,
	config = { cry_crit_rate = 0.25, cry_crit_miss_rate = 0.125 },
	pos = { x = 4, y = 5 },
	atlas = "atlasdeck",
	loc_vars = function(self, info_queue, center)
		return { vars = { G.GAME.probabilities.normal or 1 } }
	end,
	calculate = function(self, card, context)
		if context.final_scoring_step then
			local check
			local crit_poll = pseudorandom(pseudoseed("cry_critical"))
			crit_poll = crit_poll / (G.GAME.probabilities.normal or 1)
			if crit_poll < self.config.cry_crit_rate then
				check = 2
				G.E_MANAGER:add_event(Event({
					func = function()
						play_sound("talisman_emult", 1)
						attention_text({
							scale = 1.4,
							text = localize("cry_critical_hit_ex"),
							hold = 2,
							align = "cm",
							offset = { x = 0, y = -2.7 },
							major = G.play,
						})
						return true
					end,
				}))
			elseif crit_poll < self.config.cry_crit_rate + self.config.cry_crit_miss_rate then
				check = 0.5
				G.E_MANAGER:add_event(Event({
					func = function()
						play_sound("timpani", 1)
						attention_text({
							scale = 1.4,
							text = localize("cry_critical_miss_ex"),
							hold = 2,
							align = "cm",
							offset = { x = 0, y = -2.7 },
							major = G.play,
						})
						return true
					end,
				}))
			end
			delay(0.6)
			if check then
				return {
					Emult_mod = check,
					colour = G.C.DARK_EDITION,
				}
			end
		end
	end,
}
local glowing = {
	object_type = "Back",
	dependencies = {
		items = {
			"set_cry_deck"
		},
	},
	name = "cry-Glowing",
	key = "glowing",
	-- is this config even used for anything
	config = { cry_glowing = true },
	pos = { x = 4, y = 2 },
	order = 9,
	loc_vars = function(self, info_queue, center)
		return { vars = { " " } }
	end,
	atlas = "glowing",
	trigger_effect = function(self, args)
		if args.context == "eval" and safe_get(G.GAME, "last_blind", "boss") then
			for i = 1, #G.jokers.cards do
				if not Card.no(G.jokers.cards[i], "immutable", true) then
					cry_with_deck_effects(G.jokers.cards[i], function(card)
						cry_misprintize(card, { min = 1.25, max = 1.25 }, nil, true)
					end)
				end
			end
		end
	end,
}
local beta = {
	object_type = "Back",
	dependencies = {
		items = {
			"set_cry_deck"
		},
	},
	name = "cry-Beta",
	key = "beta",
	config = { cry_beta = true },
	pos = { x = 5, y = 5 },
	order = 13,
	atlas = "atlasdeck",
	apply = function(self)
		G.GAME.modifiers.cry_beta = true
	end,
}
local bountiful = {
	object_type = "Back",
	dependencies = {
		items = {
			"set_cry_deck"
		},
	},
	name = "cry-Bountiful",
	key = "bountiful",
	config = { cry_forced_draw_amount = 5 },
	pos = { x = 2, y = 6 },
	order = 14,
	atlas = "atlasdeck",
	apply = function(self)
		G.GAME.modifiers.cry_forced_draw_amount = self.config.cry_forced_draw_amount
	end,
}
local beige = {
	object_type = "Back",
	dependencies = {
		items = {
			"set_cry_deck"
		},
	},
	name = "cry-Beige",
	key = "beige",
	pos = { x = 1, y = 6 },
	order = 15,
	atlas = "atlasdeck",
	apply = function(self)
		G.GAME.modifiers.cry_common_value_quad = true
	end,
}
local blank = {
	object_type = "Back",
	dependencies = {
		items = {
			"set_cry_deck"
		},
	},
	name = "cry-Blank",
	key = "blank",
	order = 75,
	pos = { x = 1, y = 0 },
	atlas = "atlasdeck",
}
local antimatter = {
	object_type = "Back",
	dependencies = {
		items = {
			"set_cry_deck"
		},
	},
	name = "cry-Antimatter",
	order = 76,
	key = "antimatter",
	config = {
		cry_antimatter = true,
		cry_crit_rate = 0.25, --Critical Deck
		cry_legendary_rate = 0.2, --Legendary Deck
		-- Enhanced Decks
		cry_force_enhancement = "random",
		cry_force_edition = "random",
		cry_force_seal = "random",
		cry_forced_draw_amount = 5,
	},
	pos = { x = 2, y = 0 },
	trigger_effect = function(self, args)
		if args.context ~= "final_scoring_step" then
			antimatter_trigger_effect(self, args)
		else
			return antimatter_trigger_effect_final_scoring_step(self, args)
		end
	end,
	apply = function(self)
		antimatter_apply()
	end,
	atlas = "atlasdeck",
	init = function(self)
		function antimatter_apply()

			local bluecheck = safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_blue", "wins", 8)
			local yellowcheck = safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_yellow", "wins", 8)
			local abandonedcheck = safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_abandoned", "wins", 8)
			local ghostcheck = safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_ghost", "wins", 8)
			local redcheck = safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_red", "wins", 8)
			local checkeredcheck = safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_checkered", "wins", 8)
			local erraticcheck = safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_erratic", "wins", 8)
			local blackcheck = safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_black", "wins", 8)
			local paintedcheck = safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_painted", "wins", 8)
			local greencheck = safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_green", "wins", 8)
			local spookycheck = safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_cry_spooky", "wins", 8)
			local equilibriumcheck = safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_cry_equilibrium", "wins", 8)
			local misprintcheck = safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_cry_misprint", "wins", 8)
			local infinitecheck = safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_cry_infinite", "wins", 8)
			local wormholecheck = safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_cry_wormhole", "wins", 8)
			local redeemedcheck = safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_cry_redeemed", "wins", 8)
			local legendarycheck = safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_cry_legendary", "wins", 8)
			local encodedcheck = safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_cry_encoded", "wins", 8)
			local world = safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_cry_world_deck", "wins", 8)
			local sun = safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_cry_sun_deck", "wins", 8)
			local star = safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_cry_star_deck", "wins", 8)
			local moon = safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_cry_moon_deck", "wins", 8)
			
			if cry_get_gameset(G.P_CENTERS.b_cry_antimatter) == "madness" then
				bluecheck = 1
				yellowcheck = 1
				abandonedcheck = 1
				ghostcheck = 1
				redcheck = 1
				checkeredcheck = 1
				erraticcheck = 1
				blackcheck = 1
				paintedcheck = 1
				greencheck = 1
				spookycheck = 1
				equilibriumcheck = 1
				misprintcheck = 1
				infinitecheck = 1
				wormholecheck = 1
				redeemedcheck = 1
				legendarycheck = 1
				encodedcheck = 1
				world = 1
				sun = 1
				star = 1
				moon = 1
			end

			--Blue Deck
			if (bluecheck or 0) ~= 0 then
				G.GAME.starting_params.hands = G.GAME.starting_params.hands + 1
			end
			--All Consumables (see get_antimatter_consumables)
			local querty = get_antimatter_consumables()
			if #querty > 0 then
				delay(0.4)
					G.E_MANAGER:add_event(Event({
							func = function()
								for k, v in ipairs(querty) do
							if G.P_CENTERS[v] then
											local card = create_card('Tarot', G.consumeables, nil, nil, nil, nil, v, 'deck')
											card:add_to_deck()
											G.consumeables:emplace(card)
							end
								end
							return true
							end
					}))
			end
			--Yellow Deck
			if (yellowcheck or 0) ~= 0 then
				G.GAME.starting_params.dollars = G.GAME.starting_params.dollars + 10
			end
			--Abandoned Deck
			if (abandonedcheck or 0) ~= 0 then
				G.GAME.starting_params.no_faces = true
			end
			--Ghost Deck
			if (ghostcheck or 0) ~= 0 then
				G.GAME.spectral_rate = 2
			end
			-- Red Deck
			if (redcheck or 0) ~= 0 then
				G.GAME.starting_params.discards = G.GAME.starting_params.discards + 1
			end
			-- All Decks with Vouchers (see get_antimatter_vouchers)
			local vouchers = get_antimatter_vouchers()
			if #vouchers > 0 then
					for k, v in pairs(vouchers) do
					if G.P_CENTERS[v] then
								G.GAME.used_vouchers[v] = true
								G.GAME.cry_owned_vouchers[v] = true
								G.GAME.starting_voucher_count = (G.GAME.starting_voucher_count or 0) + 1
								Card.apply_to_run(nil, G.P_CENTERS[v])
					end
					end
				end
			-- Checkered Deck
			if (checkeredcheck or 0) ~= 0 then
				G.E_MANAGER:add_event(Event({
						func = function()
								for k, v in pairs(G.playing_cards) do
										if v.base.suit == 'Clubs' then 
											v:change_suit('Spades')
										end
										if v.base.suit == 'Diamonds' then 
										v:change_suit('Hearts')
										end
								end
								return true
							end
					}))
			end
			-- Erratic Deck
			if (erraticcheck or 0) ~= 0 then
				G.GAME.starting_params.erratic_suits_and_ranks = true
			end
			-- Black Deck
			if (blackcheck or 0) ~= 0 then
				G.GAME.starting_params.joker_slots = G.GAME.starting_params.joker_slots + 1
			end
			-- Painted Deck
			if (paintedcheck or 0) ~= 0 then
				G.GAME.starting_params.hand_size = G.GAME.starting_params.hand_size + 2
			end
			-- Green Deck
			if (greencheck or 0) ~= 0 then
				G.GAME.modifiers.money_per_hand = (G.GAME.modifiers.money_per_hand or 1) + 1
				G.GAME.modifiers.money_per_discard = (G.GAME.modifiers.money_per_discard or 0) + 1
			end
			-- Spooky Deck
			if (spookycheck or 0) ~= 0 then
				G.GAME.modifiers.cry_spooky = true
				G.GAME.modifiers.cry_curse_rate = 0
				--[[
				G.E_MANAGER:add_event(Event({
					func = function()
						if G.jokers then
							local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_cry_chocolate_dice")
							card:add_to_deck()
							card:start_materialize()
							G.jokers:emplace(card)
							return true
						end
					end,
				}))
				]]--
			end
			-- Deck of Equilibrium 
			if (equilibriumcheck or 0) ~= 0 then
				G.GAME.modifiers.cry_equilibrium = true
			end
			-- Misprint Deck
			if (misprintcheck or 0) ~= 0 then
				G.GAME.modifiers.cry_misprint_min = 1
				G.GAME.modifiers.cry_misprint_max = 10
			end
			-- Infinite Deck
			if (infinitecheck or 0) ~= 0 then
				G.GAME.modifiers.cry_highlight_limit = 1e20
				G.GAME.starting_params.hand_size = G.GAME.starting_params.hand_size + 1
			end
			-- Wormhole deck
			if (wormholecheck or 0) ~= 0 then
				G.GAME.modifiers.cry_negative_rate = 20
				--[[
				
				Needs to check if exotic Jokers exist are enabled (whenever that happens)
				
				G.E_MANAGER:add_event(Event({
					func = function()
						if G.jokers then
							local card = create_card("Joker", G.jokers, nil, "cry_exotic", nil, nil, nil, "cry_wormhole")
							card:add_to_deck()
							card:start_materialize()
							G.jokers:emplace(card)
							return true
						end
					end,
				}))
				
				]]--
			end
			-- Redeemed deck
			if (redeemedcheck or 0) ~= 0 then
				G.GAME.modifiers.cry_redeemed = true
			end
			-- Deck of the Moon, Deck of the Sun, Deck of the Stars, Deck of the World
			if (world or 0) ~= 0 then
				G.GAME.bosses_used["bl_goad"] = 1e308
			end
			if (star or 0) ~= 0 then
				G.GAME.bosses_used["bl_window"] = 1e308
			end
			if (sun or 0) ~= 0 then
				G.GAME.bosses_used["bl_head"] = 1e308
			end
			if (moon or 0) ~= 0 then
				G.GAME.bosses_used["bl_club"] = 1e308
			end
			--Legendary Deck
			if (legendarycheck or 0) ~= 0 then
				G.E_MANAGER:add_event(Event({
					func = function()
						if G.jokers then
							local card = create_card("Joker", G.jokers, true, 4, nil, nil, nil, "")
							card:add_to_deck()
							card:start_materialize()
							G.jokers:emplace(card)
							return true
						end
					end,
				}))
			end
			--Encoded Deck (TBA)
			if (encodedcheck or 0) ~= 0 then
				--[[
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
				]]--
			end
		end

		function antimatter_trigger_effect_final_scoring_step(self, args)

			local critcheck = safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_cry_critical", "wins", 8)
			local plasmacheck = safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_plasma", "wins", 8)
			
			if args.context == "final_scoring_step" then
					local crit_poll = pseudorandom(pseudoseed("cry_critical"))
					crit_poll = crit_poll / (G.GAME.probabilities.normal or 1)
					--Critical Deck
					if (critcheck or 0) ~= 0 then
						if crit_poll < self.config.cry_crit_rate then
							args.mult = args.mult ^ 2
							update_hand_text({ delay = 0 }, { mult = args.mult, chips = args.chips })
							G.E_MANAGER:add_event(Event({
								func = function()
									play_sound("talisman_emult", 1)
									attention_text({
										scale = 1.4,
										text = localize("cry_critical_hit_ex"),
										hold = 4,
										align = "cm",
										offset = { x = 0, y = -1.7 },
										major = G.play,
									})
									return true
								end,
							}))
							delay(0.6)
						end
					end
					--Plasma Deck
					local tot = args.chips + args.mult
					if (plasmacheck or 0) ~= 0 then
						args.chips = math.floor(tot / 2)
						args.mult = math.floor(tot / 2)
						update_hand_text({ delay = 0 }, { mult = args.mult, chips = args.chips })

						G.E_MANAGER:add_event(Event({
							func = function()
								local text = localize("k_balanced")
								play_sound("gong", 0.94, 0.3)
								play_sound("gong", 0.94 * 1.5, 0.2)
								play_sound("tarot1", 1.5)
								ease_colour(G.C.UI_CHIPS, { 0.8, 0.45, 0.85, 1 })
								ease_colour(G.C.UI_MULT, { 0.8, 0.45, 0.85, 1 })
								attention_text({
									scale = 1.4,
									text = text,
									hold = 2,
									align = "cm",
									offset = { x = 0, y = -2.7 },
									major = G.play,
								})
								G.E_MANAGER:add_event(Event({
									trigger = "after",
									blockable = false,
									blocking = false,
									delay = 4.3,
									func = function()
										ease_colour(G.C.UI_CHIPS, G.C.BLUE, 2)
										ease_colour(G.C.UI_MULT, G.C.RED, 2)
										return true
									end,
								}))
								G.E_MANAGER:add_event(Event({
									trigger = "after",
									blockable = false,
									blocking = false,
									no_delete = true,
									delay = 6.3,
									func = function()
										G.C.UI_CHIPS[1], G.C.UI_CHIPS[2], G.C.UI_CHIPS[3], G.C.UI_CHIPS[4] =
											G.C.BLUE[1], G.C.BLUE[2], G.C.BLUE[3], G.C.BLUE[4]
										G.C.UI_MULT[1], G.C.UI_MULT[2], G.C.UI_MULT[3], G.C.UI_MULT[4] =
											G.C.RED[1], G.C.RED[2], G.C.RED[3], G.C.RED[4]
										return true
									end,
								}))
								return true
							end,
						}))

						delay(0.6)
					end
					return args.chips, args.mult
				end
		end

		function antimatter_trigger_effect(self, args)

				local glowingcheck = safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_cry_glowing", "wins", 8)
				local legendarycheck = safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_cry_legendary", "wins", 8)
				local anaglyphcheck = safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_anaglyph", "wins", 8)

				if args.context == "eval" and safe_get(G.GAME, "last_blind", "boss") then
					--Glowing Deck
					if (glowingcheck or 0) ~= 0 then
						for i = 1, #G.jokers.cards do
							cry_with_deck_effects(G.jokers.cards[i], function(card)
								cry_misprintize(card, { min = 1.25, max = 1.25 }, nil, true)
							end)
						end
					end
					--Legendary Deck
					if G.jokers and (legendarycheck or 0) ~= 0 then
						if #G.jokers.cards < G.jokers.config.card_limit then
							local legendary_poll = pseudorandom(pseudoseed("cry_legendary"))
							legendary_poll = legendary_poll / (G.GAME.probabilities.normal or 1)
							if legendary_poll < self.config.cry_legendary_rate then
								local card = create_card("Joker", G.jokers, true, 4, nil, nil, nil, "")
								card:add_to_deck()
								card:start_materialize()
								G.jokers:emplace(card)
								return true
							else
								card_eval_status_text(
									G.jokers,
									"jokers",
									nil,
									nil,
									nil,
									{ message = localize("k_nope_ex"), colour = G.C.RARITY[4] }
								)
							end
						else
							card_eval_status_text(
								G.jokers,
								"jokers",
								nil,
								nil,
								nil,
								{ message = localize("k_no_room_ex"), colour = G.C.RARITY[4] }
							)
						end
					end
					--Anaglyph Deck
					if (anaglyphcheck or 0) ~= 0 then
						G.E_MANAGER:add_event(Event({
									func = (function()
										add_tag(Tag('tag_double'))
										play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
										play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
										return true
									end)
							}))
					end
				end
		end

		function get_antimatter_vouchers(voucher_table)
			-- Create a table or use one that is passed into the function
			if not voucher_table or type(voucher_table) ~= "table" then voucher_table = {} end
			
			-- Add Vouchers into the table by key
			local function already_exists(t, voucher)
				for _, v in ipairs(t) do
						if v == voucher then
						--print("sus")
								return true
						end
					end
					return false
			end
			local function Add_voucher_to_the_table(t, voucher)
					if not already_exists(t, voucher) then
						table.insert(t, voucher)
					end
			end

			--Checks for nils in the extremely nested thing i'm checking for 

			local nebulacheck = safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_nebula", "wins", 8)
			local magiccheck = safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_magic", "wins", 8)
			local zodiaccheck = safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_zodiac", "wins", 8)
			local equilibriumcheck = safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_cry_equilibrium", "wins", 8)
			
			--Nebula Deck
			if (nebulacheck or 0) ~= 0 then
				Add_voucher_to_the_table(voucher_table, "v_telescope")
			end
			-- Magic Deck
			if (magiccheck or 0) ~= 0 then
				Add_voucher_to_the_table(voucher_table, "v_crystal_ball")
			end
			
			-- Zodiac Deck
			if (zodiaccheck or 0) ~= 0 then
				Add_voucher_to_the_table(voucher_table, "v_tarot_merchant")
				Add_voucher_to_the_table(voucher_table, "v_planet_merchant")
				Add_voucher_to_the_table(voucher_table, "v_overstock_norm")
			end
			-- Deck Of Equilibrium
			if (equilibriumcheck or 0) ~= 0 then
				Add_voucher_to_the_table(voucher_table, "v_overstock_norm")
				Add_voucher_to_the_table(voucher_table, "v_overstock_plus")
			end
			return voucher_table
		end
		--Does this even need to be a function idk
		function get_antimatter_consumables(consumable_table)
			--Checks for nils in the extremely nested thing i'm checking for 
			-- Create a table or use one that is passed into the function
			if not consumable_table or type(consumable_table) ~= "table" then consumable_table = {} end
			
			-- Add Consumables into the table by key

			local magiccheck = safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_magic", "wins", 8)
			local ghostcheck = safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_ghost", "wins", 8)
			
			if (magiccheck or 0) ~= 0 then
				table.insert(consumable_table, "c_fool")
				table.insert(consumable_table, "c_fool")
			end
			if (ghostcheck or 0) ~= 0 then
				table.insert(consumable_table, "c_hex")
			end
			
			return consumable_table
		end

		--[[
		local test = antimatter_trigger_effect
		function antimatter_trigger_effect(self, args)
			test(self, args)
			if args.context == "eval" then
				ease_dollars(900)
			end
		end
		local test2 = get_antimatter_consumables
		function get_antimatter_consumables(consumable_table)
			if not consumable_table or type(consumable_table) ~= "table" then consumable_table = {} end
			table.insert(consumable_table, "c_soul")
			table.insert(consumable_table, "c_soul")
			return test2(consumable_table)
		end
		]]--
	end
}

return {
	name = "Misc. Decks",
	items = {
		very_fair,
		equilibrium,
		misprint,
		infinite,
		conveyor,
		CCD,
		wormhole,
		redeemed,
		legendary,
		critical,
		glowing,
		beta,
		bountiful,
		beige,
		blank,
		antimatter,
		e_deck,
		et_deck,
		sk_deck,
		st_deck,
		sl_deck
	},
}
