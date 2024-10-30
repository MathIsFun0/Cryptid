if CardSleeves then
	local atlasSleeves = SMODS.Atlas({
		object_type = "Atlas",
		key = "atlasSleeves",
		path = "atlasSleeves.png",
		px = 71,
		py = 95,
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
						local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_cry_CodeJoker")
						card:add_to_deck()
						card:start_materialize()
						G.jokers:emplace(card)
						local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_cry_copypaste")
						card:add_to_deck()
						card:start_materialize()
						G.jokers:emplace(card)
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
		trigger_effect = function(self, args)
			if args.context.create_card then
				cry_misprintize(
					args.context.card,
					{ min = 0.1 * (G.GAME.modifiers.cry_misprint_min or 1), max = 10
						* (G.GAME.modifiers.cry_misprint_max or 1) }
				)
			end
		end,
		apply = function(self)
			G.GAME.modifiers.cry_misprint_min = self.config.cry_misprint_min
			G.GAME.modifiers.cry_misprint_max = self.config.cry_misprint_max
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
	local sleeveitems = { atlasSleeves }
	if CardSleeves and Cryptid.enabled["Misc. Decks"] then
		sleeveitems[#sleeveitems + 1] = encodedsleeve
		sleeveitems[#sleeveitems + 1] = equilibriumsleeve
		sleeveitems[#sleeveitems + 1] = misprintsleeve
		sleeveitems[#sleeveitems + 1] = infinitesleeve
		sleeveitems[#sleeveitems + 1] = conveyorsleeve
		sleeveitems[#sleeveitems + 1] = CCDsleeve
		sleeveitems[#sleeveitems + 1] = wormholesleeve
		sleeveitems[#sleeveitems + 1] = redeemedsleeve
		sleeveitems[#sleeveitems + 1] = criticalsleeve
		sleeveitems[#sleeveitems + 1] = legendarysleeve
	end
end
return { name = "Sleeves", init = function() end, items = { sleeveitems } }
