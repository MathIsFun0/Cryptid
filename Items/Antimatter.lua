local blank = {
	object_type = "Back",
	name = "cry-Blank",
	key = "blank",
	order = 75,
	pos = { x = 1, y = 0 },
	atlas = "blank",
}
local blank_sprite = {
	object_type = "Atlas",
	key = "blank",
	path = "atlasdeck.png",
	px = 71,
	py = 95,
}
local antimatter = {
	object_type = "Back",
	name = "cry-Antimatter",
	order = 76,
	key = "antimatter",
	config = {
		cry_antimatter = true,
		discards = 1, --Red Deck: 1
		hands = 1, --Blue Deck: 1
		dollars = 10, --Yellow Deck
		extra_hand_bonus = 2,
		extra_discard_bonus = 1, --Green Deck
		joker_slot = 1, --Black Deck: 1
		vouchers = {
			"v_crystal_ball",
			"v_telescope",
			"v_tarot_merchant",
			"v_planet_merchant",
			"v_overstock_norm",
			"v_overstock_plus",
		}, --Vouchers from all decks
		consumables = { "c_fool", "c_fool", "c_hex" }, --Consumables from all decks
		spectral_rate = 2, --Ghost Deck
		remove_faces = true, --Abandoned Deck
		hand_size = 3, --Painted Deck & Infinite deck
		randomize_rank_suit = true, --Erratic Deck
		cry_equilibrium = true, --Deck of Equilibrium
		cry_misprint_min = 1,
		cry_misprint_max = 10, --Misprint Deck
		cry_highlight_limit = 1e20, --Infinite Deck
		cry_wormhole = true,
		cry_negative_rate = 20, --Wormhole Deck
		cry_redeemed = true, --Redeemed Deck
		cry_crit_rate = 0.25, --Critical Deck
		cry_encoded = true, --Encoded Deck
		cry_legendary = true,
		cry_legendary_rate = 0.2, --Legendary Deck
		-- Enhanced Decks
		cry_force_enhancement = "random",
		cry_force_edition = "random",
		cry_force_seal = "random",
		cry_boss_blocked = { "bl_goad", "bl_window", "bl_club", "bl_head" },
	},
	pos = { x = 2, y = 0 },
	trigger_effect = function(self, args)
		if args.context == "final_scoring_step" then
			--Critical Deck
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
							hold = 4,
							align = "cm",
							offset = { x = 0, y = -1.7 },
							major = G.play,
						})
						return true
					end,
				}))
			end
			delay(0.6)
			--Plasma Deck
			local tot = args.chips + args.mult
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
			return args.chips, args.mult
		end
		--Glowing Deck & Legendary Deck
		if args.context == "eval" and G.GAME.last_blind and G.GAME.last_blind.boss then
			--Glowing Deck
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i].ability.name ~= "Ace Aequilibrium" then --Same Reason as Gemini/Multiply
					cry_with_deck_effects(G.jokers.cards[i], function(card)
						cry_misprintize(card, { min = 1.25, max = 1.25 }, nil, true)
					end)
				end
			end
			--Legendary Deck
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
	atlas = "blank",
}
return {
	name = "Antimatter Deck",
	init = function() end,
	items = { blank_sprite, blank, antimatter },
}
