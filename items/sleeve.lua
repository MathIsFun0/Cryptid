if CardSleeves then
	local veryfairsleeve = CardSleeves.Sleeve({
		key = "very_fair_sleeve",
		name = "Very Fair Sleeve",
		atlas = "atlasSleeves",
		pos = { x = 0, y = 2 },
		config = { hands = -2, discards = -2 },
		unlocked = true,
		unlock_condition = { deck = "Very Fair Deck", stake = 1 },
		loc_vars = function(self)
			return { vars = {} }
		end,
		trigger_effect = function(self, args) end,
		apply = function(self)
			G.GAME.starting_params.hands = G.GAME.starting_params.hands + self.config.hands
			G.GAME.starting_params.discards = G.GAME.starting_params.discards + self.config.discards
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
	})

	local infinitesleeve = CardSleeves.Sleeve({
		key = "infinite_sleeve",
		name = "Unlimited Sleeve",
		atlas = "atlasSleeves",
		pos = { x = 4, y = 0 },
		config = { cry_highlight_limit = 1e20, hand_size = 1 },
		unlocked = true,
		unlock_condition = { deck = "Infinite Deck", stake = 1 },
		loc_vars = function(self)
			return { vars = {} }
		end,
		trigger_effect = function(self, args) end,
		apply = function(self)
			G.GAME.modifiers.cry_highlight_limit = self.config.cry_highlight_limit
		end,
	})

	local equilibriumsleeve = CardSleeves.Sleeve({
		key = "equilibrium_sleeve",
		name = "Balanced Sleeve",
		atlas = "atlasSleeves",
		pos = { x = 2, y = 0 },
		config = { vouchers = { "v_overstock_norm", "v_overstock_plus" }, cry_equilibrium = true },
		unlocked = true,
		unlock_condition = { deck = "Deck of Equilibrium", stake = 1 },
		loc_vars = function(self)
			return { vars = {} }
		end,

		trigger_effect = function(self, args) end,
		apply = function(self)
			change_shop_size(2)
			G.GAME.modifiers.cry_equilibrium = true
		end,
	})

	local misprintsleeve = CardSleeves.Sleeve({
		key = "misprint_sleeve",
		name = "Misprinted Sleeve",
		atlas = "atlasSleeves",
		pos = { x = 3, y = 0 },
		config = { cry_misprint_min = 0.1, cry_misprint_max = 10 },
		unlocked = true,
		unlock_condition = { deck = "Misprint Deck", stake = 1 },
		apply = function(self)
			G.GAME.modifiers.cry_misprint_min = (G.GAME.modifiers.cry_misprint_min or 1) * self.config.cry_misprint_min
			G.GAME.modifiers.cry_misprint_max = (G.GAME.modifiers.cry_misprint_max or 1) * self.config.cry_misprint_max
			if self.get_current_deck_key() == "b_cry_antimatter" then
				G.GAME.modifiers.cry_misprint_min = 1
			end
		end,
	})

	local CCDsleeve = CardSleeves.Sleeve({
		key = "ccd_sleeve",
		name = "CCD Sleeve",
		atlas = "atlasSleeves",
		pos = { x = 6, y = 0 },
		config = { cry_conveyor = true },
		unlocked = true,
		unlock_condition = { deck = "CCD Deck", stake = 1 },
		loc_vars = function(self)
			return { vars = {} }
		end,
		trigger_effect = function(self, args) end,
		apply = function(self)
			G.GAME.modifiers.cry_ccd = true
		end,
	})

	local wormholesleeve = CardSleeves.Sleeve({
		key = "wormhole_sleeve",
		name = "Wormhole Sleeve",
		atlas = "atlasSleeves",
		pos = { x = 0, y = 0 },
		config = { cry_wormhole = true, cry_negative_rate = 20, joker_slot = -2 },
		unlocked = true,
		unlock_condition = { deck = "Wormhole Deck", stake = 1 },
		loc_vars = function(self)
			return { vars = {} }
		end,
		apply = function(self)
			G.E_MANAGER:add_event(Event({
				func = function()
					if G.jokers then
						local card =
							create_card("Joker", G.jokers, nil, "cry_exotic", nil, nil, nil, "cry_wormholesleeve")
						card:add_to_deck()
						card:start_materialize()
						G.jokers:emplace(card)
						return true
					end
				end,
			}))
			G.GAME.modifiers.cry_negative_rate = (G.GAME.modifiers.cry_negative_rate or 1)
				* self.config.cry_negative_rate
			G.GAME.starting_params.joker_slots = G.GAME.starting_params.joker_slots + self.config.joker_slot
		end,
	})

	local conveyorsleeve = CardSleeves.Sleeve({
		key = "conveyor_sleeve",
		name = "Conveyor Sleeve",
		atlas = "atlasSleeves",
		pos = { x = 5, y = 0 },
		config = { cry_conveyor = true },
		unlocked = true,
		unlock_condition = { deck = "Conveyor Deck", stake = 1 },
		loc_vars = function(self)
			return { vars = {} }
		end,
		trigger_effect = function(self, args) end,
		apply = function(self)
			G.GAME.modifiers.cry_conveyor = true
		end,
	})

	local redeemedsleeve = CardSleeves.Sleeve({
		key = "redeemed_sleeve",
		name = "Redeemed Sleeve",
		atlas = "atlasSleeves",
		pos = { x = 7, y = 0 },
		config = { cry_negative_rate = 20, joker_slot = -2 },
		unlocked = true,
		unlock_condition = { deck = "Redeemed Deck", stake = 1 },
		loc_vars = function(self)
			return { vars = {} }
		end,
		apply = function(self)
			G.GAME.modifiers.cry_redeemed = true
		end,
	})

	local glowingsleeve = CardSleeves.Sleeve({
		key = "glowing_sleeve",
		name = "Glowing Sleeve",
		atlas = "atlasSleeves",
		pos = { x = 0, y = 2 },
		config = { cry_glowing = true },
		unlocked = true,
		unlock_condition = { deck = "Glowing Deck", stake = 1 },
		loc_vars = function(self)
			return { vars = { " " } }
		end,
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
	})

	local criticalsleeve = CardSleeves.Sleeve({
		key = "critical_sleeve",
		name = "Critical Sleeve",
		atlas = "atlasSleeves",
		pos = { x = 8, y = 0 },
		config = { cry_crit_rate = 0.25, cry_crit_miss_rate = 0.125 },
		unlocked = true,
		unlock_condition = { deck = "Redeemed Deck", stake = 1 },
		loc_vars = function(self)
			return { vars = {} }
		end,
		apply = function(self) end,
		trigger_effect = function(self, args)
			if args.context == "final_scoring_step" then
				local crit_poll = pseudorandom(pseudoseed("cry_critical"))
				crit_poll = crit_poll / (G.GAME.probabilities.normal or 1)
				if crit_poll < self.config.cry_crit_rate then
					args.mult = args.mult ^ 2
					update_hand_text({ delay = 0 }, { mult = args.mult, chips = args.chips })
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
					args.mult = args.mult ^ 0.5
					update_hand_text({ delay = 0 }, { mult = args.mult, chips = args.chips })
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
				return args.chips, args.mult
			end
		end,
	})

	local encodedsleeve = CardSleeves.Sleeve({
		key = "encoded_sleeve",
		name = "Encoded Sleeve",
		atlas = "atlasSleeves",
		pos = { x = 1, y = 0 },
		config = {},
		unlocked = true,
		unlock_condition = { deck = "Encoded Deck", stake = 1 },
		loc_vars = function(self)
			return { vars = {} }
		end,

		trigger_effect = function(self, args) end,
		apply = function(self)
			G.E_MANAGER:add_event(Event({
				func = function()
					if G.jokers then
						-- Adding a before spawning becuase jen banned copy_paste
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

			--DOWNSIDE:

			G.GAME.joker_rate = 0
			G.GAME.planet_rate = 0
			G.GAME.tarot_rate = 0
			G.GAME.code_rate = 1e100
		end,
	})

	local nostalgicsleeve = CardSleeves.Sleeve({
		key = "beta_sleeve",
		name = "Nostalgic Sleeve",
		atlas = "atlasSleeves",
		pos = { x = 0, y = 2 },
		config = { cry_beta = true },
		unlocked = true,
		unlock_condition = { deck = "Nostalgic Deck", stake = 1 },
		loc_vars = function(self)
			return { vars = {} }
		end,

		trigger_effect = function(self, args) end,
		apply = function(self)
			G.GAME.modifiers.cry_beta = true
		end,
	})

	local bountifulsleeve = CardSleeves.Sleeve({
		key = "bountiful_sleeve",
		name = "Bountiful Sleeve",
		atlas = "atlasSleeves",
		pos = { x = 0, y = 2 },
		config = { cry_forced_draw_amount = 5 },
		unlocked = true,
		unlock_condition = { deck = "Bountiful Deck", stake = 1 },
		loc_vars = function(self)
			return { vars = {} }
		end,

		trigger_effect = function(self, args) end,
		apply = function(self)
			G.GAME.modifiers.cry_forced_draw_amount = self.config.cry_forced_draw_amount
		end,
	})

	local beigesleeve = CardSleeves.Sleeve({
		key = "beige_sleeve",
		name = "Beige Sleeve",
		atlas = "atlasSleeves",
		pos = { x = 3, y = 1 },
		unlocked = true,
		unlock_condition = { deck = "Beige Deck", stake = 1 },
		loc_vars = function(self)
			local key
			if self.get_current_deck_key() == "b_cry_beige" then
				key = self.key .. "_alt"
				return { key = key, vars = {} }
			end
			return { vars = {} }
		end,

		trigger_effect = function(self, args) end,
		apply = function(self)
			if self.get_current_deck_key() ~= "b_cry_beige" then
				G.GAME.modifiers.cry_common_value_quad = true
			else
				G.GAME.modifiers.cry_uncommon_value_quad = true
			end
		end,
	})

	local legendarysleeve = CardSleeves.Sleeve({
		key = "legendary_sleeve",
		name = "Legendary Sleeve",
		atlas = "atlasSleeves",
		pos = { x = 1, y = 1 },
		config = { cry_legendary = true, cry_legendary_rate = 0.2 },
		unlocked = true,
		unlock_condition = { deck = "Legendary Deck", stake = 1 },
		loc_vars = function(self)
			return { vars = {} }
		end,
		trigger_effect = function(self, args)
			if args.context == "eval" and G.GAME.last_blind and G.GAME.last_blind.boss then
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
	})
	local spookysleeve = CardSleeves.Sleeve({
		key = "spooky_sleeve",
		name = "Spooky Sleeve",
		atlas = "atlasSleeves",
		pos = { x = 2, y = 1 },
		config = { cry_spooky = true, cry_curse_rate = 0.25 },
		unlocked = true,
		unlock_condition = { deck = "Spooky Deck", stake = 1 },
		loc_vars = function(self)
			return { vars = {} }
		end,

		trigger_effect = function(self, args) end,
		apply = function(self)
			G.GAME.modifiers.cry_spooky = true
			G.GAME.modifiers.cry_curse_rate = self.config.cry_curse_rate or 0.25
			G.E_MANAGER:add_event(Event({
				func = function()
					if G.jokers then
						local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_cry_chocolate_dice")
						card:add_to_deck()
						card:start_materialize()
						card:set_eternal(true)
						G.jokers:emplace(card)
						return true
					end
				end,
			}))
		end,
	})
	local antimattersleeve = CardSleeves.Sleeve({
		key = "antimatter_sleeve",
		name = "Antimatter Sleeve",
		atlas = "atlasSleeves",
		pos = { x = 0, y = 1 },
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
		unlocked = true,
		unlock_condition = { deck = "Antimatter Deck", stake = 1 },
		loc_vars = function(self)
			return { vars = {} }
		end,
		trigger_effect = function(self, args) end,
		apply = function(self)
			Cryptid.antimatter_apply()
		end,
	})

	local sleeveitems = {}
	if CardSleeves then
		sleeveitems = {
			veryfairsleeve,
			infinitesleeve,
			equilibriumsleeve,
			misprintsleeve,
			CCDsleeve,
			wormholesleeve,
			conveyorsleeve,
			redeemedsleeve,
			glowingsleeve,
			criticalsleeve,
			encodedsleeve,
			nostalgicsleeve,
			bountifulsleeve,
			beigesleeve,
			legendarysleeve,
			spookysleeve,
			antimattersleeve,
		}
	end
end
return { name = "Sleeves", init = function() end, items = { sleeveitems } }
