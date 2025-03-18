local very_fair = {
	object_type = "Back",
	dependencies = {
		items = {
			"set_cry_deck",
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
		local avts = SMODS.add_voucher_to_shop
		function SMODS.add_voucher_to_shop(...)
			if G.GAME.modifiers.cry_no_vouchers then
				return
			end
			return avts(...)
		end
	end,
}
local equilibrium = {
	object_type = "Back",
	dependencies = {
		items = {
			"set_cry_deck",
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
							if not Cryptid.no(v, "doe", k) then
								P_CRY_ITEMS[#P_CRY_ITEMS + 1] = v.key
							end
						end
					end
					for k, v in pairs(G.P_CARDS) do
						if not Cryptid.no(v, "doe", k) then
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
	end,
}
local misprint = {
	object_type = "Back",
	dependencies = {
		items = {
			"set_cry_deck",
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
			"set_cry_deck",
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
			"set_cry_deck",
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
			"set_cry_deck",
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
	end,
}
local redeemed = {
	object_type = "Back",
	dependencies = {
		items = {
			"set_cry_deck",
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
								if not G.cry_redeemed_buffer then
									G.cry_redeemed_buffer = {}
								end
								if not G.cry_redeemed_buffer[v.key] and v.unlocked then
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
	end,
}
local legendary = {
	object_type = "Back",
	dependencies = {
		items = {
			"set_cry_deck",
		},
	},
	name = "cry-Legendary",
	key = "legendary",
	config = { cry_legendary = true, cry_legendary_rate = 0.2 },
	pos = { x = 0, y = 6 },
	atlas = "atlasdeck",
	order = 15,
	calculate = function(self, back, context)
		if context.context == "eval" and Cryptid.safe_get(G.GAME, "last_blind", "boss") then
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
			"set_cry_deck",
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
			"set_cry_deck",
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
	calculate = function(self, back, context)
		if context.context == "eval" and Cryptid.safe_get(G.GAME, "last_blind", "boss") then
			for i = 1, #G.jokers.cards do
				if not Card.no(G.jokers.cards[i], "immutable", true) then
					Cryptid.with_deck_effects(G.jokers.cards[i], function(card)
						Cryptid.misprintize(card, { min = 1.25, max = 1.25 }, nil, true)
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
			"set_cry_deck",
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
			"set_cry_deck",
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
			"set_cry_deck",
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
			"set_cry_deck",
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
			"set_cry_deck",
		},
	},
	loc_vars = function(self, info_queue, center)
		return { key = Cryptid.gameset_loc(self, { mainline = "balanced", modest = "balanced" }) }
	end,
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
	calculate = function(self, back, context)
		if context.context ~= "final_scoring_step" then
			Cryptid.antimatter_trigger(self, context, Cryptid.gameset(G.P_CENTERS.b_cry_antimatter) == "madness")
		else
			return Cryptid.antimatter_trigger_final_scoring(
				self,
				context,
				Cryptid.gameset(G.P_CENTERS.b_cry_antimatter) == "madness"
			)
		end
	end,
	apply = function(self)
		Cryptid.antimatter_apply(Cryptid.gameset(G.P_CENTERS.b_cry_antimatter) == "madness")
	end,
	atlas = "atlasdeck",
	init = function(self)
		function Cryptid.antimatter_apply(skip)
			--Blue Deck
			if
				(Cryptid.safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_blue", "wins", 8) or 0 ~= 0) or skip
			then
				G.GAME.starting_params.hands = G.GAME.starting_params.hands + 1
			end
			--All Consumables (see Cryptid.get_antimatter_consumables)
			local querty = Cryptid.get_antimatter_consumables(nil, skip)
			if #querty > 0 then
				delay(0.4)
				G.E_MANAGER:add_event(Event({
					func = function()
						for k, v in ipairs(querty) do
							if G.P_CENTERS[v] then
								local card = create_card("Tarot", G.consumeables, nil, nil, nil, nil, v, "deck")
								card:add_to_deck()
								G.consumeables:emplace(card)
							end
						end
						return true
					end,
				}))
			end
			--Yellow Deck
			if
				(Cryptid.safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_yellow", "wins", 8) or 0) ~= 0
				or skip
			then
				G.GAME.starting_params.dollars = G.GAME.starting_params.dollars + 10
			end
			--Abandoned Deck
			if
				(Cryptid.safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_abandoned", "wins", 8) or 0) ~= 0
				or skip
			then
				G.GAME.starting_params.no_faces = true
			end
			--Ghost Deck
			if
				(Cryptid.safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_ghost", "wins", 8) or 0) ~= 0 or skip
			then
				G.GAME.spectral_rate = 2
			end
			-- Red Deck
			if
				(Cryptid.safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_red", "wins", 8) or 0) ~= 0 or skip
			then
				G.GAME.starting_params.discards = G.GAME.starting_params.discards + 1
			end
			-- All Decks with Vouchers (see Cryptid.get_antimatter_vouchers)
			local vouchers = Cryptid.get_antimatter_vouchers(nil, skip)
			if #vouchers > 0 then
				for k, v in pairs(vouchers) do
					if G.P_CENTERS[v] then
						G.GAME.used_vouchers[v] = true
						G.GAME.starting_voucher_count = (G.GAME.starting_voucher_count or 0) + 1
						G.E_MANAGER:add_event(Event({
							func = function()
								Card.apply_to_run(nil, G.P_CENTERS[v])
								return true
							end,
						}))
					end
				end
			end
			-- Checkered Deck
			if
				(Cryptid.safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_checkered", "wins", 8) or 0) ~= 0
				or skip
			then
				G.E_MANAGER:add_event(Event({
					func = function()
						for k, v in pairs(G.playing_cards) do
							if v.base.suit == "Clubs" then
								v:change_suit("Spades")
							end
							if v.base.suit == "Diamonds" then
								v:change_suit("Hearts")
							end
						end
						return true
					end,
				}))
			end
			-- Erratic Deck
			if
				(Cryptid.safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_erratic", "wins", 8) or 0) ~= 0
				or skip
			then
				G.GAME.starting_params.erratic_suits_and_ranks = true
			end
			-- Black Deck
			if
				(Cryptid.safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_black", "wins", 8) or 0) ~= 0 or skip
			then
				G.GAME.starting_params.joker_slots = G.GAME.starting_params.joker_slots + 1
			end
			-- Painted Deck
			if
				(Cryptid.safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_painted", "wins", 8) or 0) ~= 0
				or skip
			then
				G.GAME.starting_params.hand_size = G.GAME.starting_params.hand_size + 2
			end
			-- Green Deck
			if
				(Cryptid.safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_green", "wins", 8) or 0) ~= 0 or skip
			then
				G.GAME.modifiers.money_per_hand = (G.GAME.modifiers.money_per_hand or 1) + 1
				G.GAME.modifiers.money_per_discard = (G.GAME.modifiers.money_per_discard or 0) + 1
			end
			-- Spooky Deck
			if
				(Cryptid.safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_cry_spooky", "wins", 8) or 0)
					~= 0
				or skip
			then
				G.GAME.modifiers.cry_spooky = true
				G.GAME.modifiers.cry_curse_rate = 0
				if Cryptid.enabled("j_cry_chocolate_dice") == true then
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
				end
			end
			-- Deck of Equilibrium
			if
				(
						Cryptid.safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_cry_equilibrium", "wins", 8)
						or 0
					)
					~= 0
				or skip
			then
				G.GAME.modifiers.cry_equilibrium = true
			end
			-- Misprint Deck
			if
				(Cryptid.safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_cry_misprint", "wins", 8) or 0)
					~= 0
				or skip
			then
				G.GAME.modifiers.cry_misprint_min = 1
				G.GAME.modifiers.cry_misprint_max = 10
			end
			-- Infinite Deck
			if
				(Cryptid.safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_cry_infinite", "wins", 8) or 0)
					~= 0
				or skip
			then
				G.GAME.modifiers.cry_highlight_limit = 1e20
				G.GAME.starting_params.hand_size = G.GAME.starting_params.hand_size + 1
			end
			-- Wormhole deck
			if
				(Cryptid.safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_cry_wormhole", "wins", 8) or 0)
					~= 0
				or skip
			then
				G.GAME.modifiers.cry_negative_rate = 20

				if Cryptid.enabled("set_cry_exotic") == true then
					G.E_MANAGER:add_event(Event({
						func = function()
							if G.jokers then
								local card =
									create_card("Joker", G.jokers, nil, "cry_exotic", nil, nil, nil, "cry_wormhole")
								card:add_to_deck()
								card:start_materialize()
								G.jokers:emplace(card)
								return true
							end
						end,
					}))
				end
			end
			-- Redeemed deck
			if
				(Cryptid.safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_cry_redeemed", "wins", 8) or 0)
					~= 0
				or skip
			then
				G.GAME.modifiers.cry_redeemed = true
			end
			--[[
			G.GAME.bosses_used["bl_goad"] = 1e308
			G.GAME.bosses_used["bl_window"] = 1e308
			G.GAME.bosses_used["bl_head"] = 1e308
			G.GAME.bosses_used["bl_club"] = 1e308
			]]
			--
			--Legendary Deck
			if
				(Cryptid.safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_cry_legendary", "wins", 8) or 0)
					~= 0
				or skip
			then
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
			--Encoded Deck
			if
				(Cryptid.safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_cry_encoded", "wins", 8) or 0)
					~= 0
				or skip
			then
				G.E_MANAGER:add_event(Event({
					func = function()
						if G.jokers then
							if
								G.P_CENTERS["j_cry_CodeJoker"]
								and (G.GAME.banned_keys and not G.GAME.banned_keys["j_cry_CodeJoker"])
								and Cryptid.enabled("j_cry_CodeJoker") == true
							then
								local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_cry_CodeJoker")
								card:add_to_deck()
								card:start_materialize()
								G.jokers:emplace(card)
							end
							if
								G.P_CENTERS["j_cry_copypaste"]
								and Cryptid.enabled("j_cry_copypaste") == true
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
			end
			--Beige Deck
			if
				(Cryptid.safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_cry_beige", "wins", 8) or 0) ~= 0
				or skip
			then
				G.GAME.modifiers.cry_common_value_quad = true
			end
		end

		function Cryptid.antimatter_trigger_final_scoring(self, context, skip)
			if context.context == "final_scoring_step" then
				local crit_poll = pseudorandom(pseudoseed("cry_critical"))
				crit_poll = crit_poll / (G.GAME.probabilities.normal or 1)
				--Critical Deck
				if
					(
							Cryptid.safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_cry_critical", "wins", 8)
							or 0
						)
						~= 0
					or skip
				then
					if crit_poll < self.config.cry_crit_rate then
						context.mult = context.mult ^ 2
						update_hand_text({ delay = 0 }, { mult = context.mult, chips = context.chips })
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
				local tot = context.chips + context.mult
				if
					(Cryptid.safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_plasma", "wins", 8) or 0)
						~= 0
					or skip
				then
					context.chips = math.floor(tot / 2)
					context.mult = math.floor(tot / 2)
					update_hand_text({ delay = 0 }, { mult = context.mult, chips = context.chips })

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
				return context.chips, context.mult
			end
		end
		function Cryptid.antimatter_trigger(self, context, skip)
			if context.context == "eval" and Cryptid.safe_get(G.GAME, "last_blind", "boss") then
				--Glowing Deck
				if
					(
							Cryptid.safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_cry_glowing", "wins", 8)
							or 0
						)
						~= 0
					or skip
				then
					for i = 1, #G.jokers.cards do
						Cryptid.with_deck_effects(G.jokers.cards[i], function(card)
							Cryptid.misprintize(card, { min = 1.25, max = 1.25 }, nil, true)
						end)
					end
				end
				--Legendary Deck
				if G.jokers then
					if
						(
								Cryptid.safe_get(
									G.PROFILES,
									G.SETTINGS.profile,
									"deck_usage",
									"b_cry_legendary",
									"wins",
									8
								) or 0
							)
							~= 0
						or skip
					then
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
				--Anaglyph Deck
				if
					(Cryptid.safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_anaglyph", "wins", 8) or 0)
						~= 0
					or skip
				then
					G.E_MANAGER:add_event(Event({
						func = function()
							add_tag(Tag("tag_double"))
							play_sound("generic1", 0.9 + math.random() * 0.1, 0.8)
							play_sound("holo1", 1.2 + math.random() * 0.1, 0.4)
							return true
						end,
					}))
				end
			end
		end
		function Cryptid.get_antimatter_vouchers(voucher_table, skip)
			-- Create a table or use one that is passed into the function
			if not voucher_table or type(voucher_table) ~= "table" then
				voucher_table = {}
			end
			-- Add Vouchers into the table by key
			local function already_exists(t, voucher)
				for _, v in ipairs(t) do
					if v == voucher then
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
			--Nebula Deck
			if
				(Cryptid.safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_nebula", "wins", 8) or 0 ~= 0)
				or skip
			then
				Add_voucher_to_the_table(voucher_table, "v_telescope")
			end
			-- Magic Deck
			if
				(Cryptid.safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_magic", "wins", 8) or 0 ~= 0) or skip
			then
				Add_voucher_to_the_table(voucher_table, "v_crystal_ball")
			end
			-- Zodiac Deck
			if
				(Cryptid.safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_zodiac", "wins", 8) or 0 ~= 0)
				or skip
			then
				Add_voucher_to_the_table(voucher_table, "v_tarot_merchant")
				Add_voucher_to_the_table(voucher_table, "v_planet_merchant")
				Add_voucher_to_the_table(voucher_table, "v_overstock_norm")
			end
			-- Deck Of Equilibrium
			if
				(
					Cryptid.safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_cry_equilibrium", "wins", 8)
					or 0 ~= 0
				) or skip
			then
				Add_voucher_to_the_table(voucher_table, "v_overstock_norm")
				Add_voucher_to_the_table(voucher_table, "v_overstock_plus")
			end
			return voucher_table
		end
		--Does this even need to be a function idk
		function Cryptid.get_antimatter_consumables(consumable_table, skip)
			if not consumable_table or type(consumable_table) ~= "table" then
				consumable_table = {}
			end
			if
				(Cryptid.safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_magic", "wins", 8) or 0 ~= 0) or skip
			then
				table.insert(consumable_table, "c_fool")
				table.insert(consumable_table, "c_fool")
			end
			if
				(Cryptid.safe_get(G.PROFILES, G.SETTINGS.profile, "deck_usage", "b_ghost", "wins", 8) or 0 ~= 0) or skip
			then
				table.insert(consumable_table, "c_hex")
			end
			return consumable_table
		end
	end,
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
		sl_deck,
	},
}
