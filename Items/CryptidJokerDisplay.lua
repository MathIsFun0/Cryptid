--=============== Page 1 ===============--
--SuperCell
--Dropshot
--Kidnapping
--Iterum
--Happy House
--Bubble M
--Fast Food M
--M Stack
--Exponentia
--Neon M
--Virgo
--Notebook
--Pot Of Jokes
--Bonk
--Loopy
--=============== Page 2 ===============--
--Old Membership Card
--Redeo
--Scrabble Tile
--Sacrifice
--Googol Play Card
--Weebonacci
--Reverse card
--Tiny
--Tenebris
--Huge
--Tredecim
--The WHIP
--Lucky Joker
--Canvas
--Megg
--=============== Page 3 ===============--
--Jolly Joker?
--Cursor
--Pickle
--ERROR
--Cube
--Triplet Rhythm
--Chili Pepper
--Compound Interest
--Crustulum
--Big Cube
--m
--Boredom
--Eternal Flame
--Nice
--Chad
--=============== Page 4 ===============--
--Jimball
--Fidget Spinner
--Number Blocks
--Luigi
--Waluigi
--Mario
--Nostalgic candy
--Wario
--Krusty the Clown
--Primus
--Garden of Forking Paths
--Light Up the Night
--No sound, No Memory
--...Like Antennas To heavem
--Caramel
--=============== Page 5 ===============--
--Sob
--Consume-able
--2D
--Red Bloon
--AP Joker
--Fridge Magnet
--Stella Mortis
--Unjust Dagger
--Monkey Dagger
--Bonus Joker
--Pirate Dagger
--Mondrian
--Sapling
--Celestial Globe
--:D
--=============== Page 6 ===============--
--Meteor Shower
--Exoplanet
--Stardust
--Mult Joker
--Gold Joker
--Nostalgic Googol play Card
--Circulus Pistoris
--The Duos
--The Home
--The Nuts
--The Quintet
--The Unity
--The Swarm
--The Filler
--Crypto Coin
--=============== Page 7 ===============--
--Wheel Of Hope
--Old Blueprint
--Night
--Bus Driver
--Morse Code
--Membership Card
--M Chain
--Copy/Paste
--Cut
--Python
--Monster
--Non-Verisimile
--Gemini
--Nostalgic Invisible Joker
--Facile
--=============== Page 8 ===============--
--Giggly Joker
--Nutty Joker
--Manic Joker
--Silly Joker
--Delirious Joker
--Wacky Joker
--Kooky Joker
--Dubious Joker
--Shrewd Joker
--Tricksy Joker
--Foxy Joker
--Savvy Joker
--Subtle Joker
--Discreet Joker
--Fractal
--=============== Page 9 ===============--
--Ace Aequilibrium
--Duplicare
--Queen's Gambit

if JokerDisplay then

	--Side note: I Don't think retrigger type exp gives a correct value with Emult jokers, but ehhhhh ig I can live with that (It's good enough)

	--This is here so it shows up on the github symbol panel (easy to scroll to)
	local page1 = {}
	
        JokerDisplay.Definitions["j_cry_supercell"] = {
                text = {
                        { text = "+", colour = G.C.CHIPS },
                        { ref_table = "card.ability.extra", ref_value = "stat1", colour = G.C.CHIPS, retrigger_type = "mult" },
                        { text = " +", colour = G.C.MULT },
                        { ref_table = "card.ability.extra", ref_value = "stat1", colour = G.C.MULT, retrigger_type = "mult" },
                },
                extra = {
                        {
                                {
                                        border_nodes = {
                                                { text = "X" },
                                                { ref_table = "card.ability.extra", ref_value = "stat2", retrigger_type = "exp" },
                                        },
                                        border_colour = G.C.CHIPS,
                                },
                                { text = " " },
                                {
                                        border_nodes = {
                                                { text = "X" },
                                                { ref_table = "card.ability.extra", ref_value = "stat2", retrigger_type = "exp" },
                                        },
                                },
                        },
                        {
                                { text = "+$", colour = G.C.GOLD },
                                { ref_table = "card.ability.extra", ref_value = "money", colour = G.C.GOLD },
                                {
                                        ref_table = "card.joker_display_values",
                                        ref_value = "localized_text",
                                        colour = G.C.UI.TEXT_INACTIVE,
                                        scale = 0.3,
                                },
                        },
                },
                calc_function = function(card)
                        card.joker_display_values.localized_text = "(" .. localize("k_round") .. ")"
                end,
        }
        JokerDisplay.Definitions["j_cry_dropshot"] = {
		text = {
			{
				border_nodes = {
					{ text = "X" },
					{ ref_table = "card.ability.extra", ref_value = "x_mult", retrigger_type = "exp" },
				},
			},
		},
		reminder_text = {
			{ text = "(" },
			{ ref_table = "card.joker_display_values", ref_value = "dropshot_card_suit" },
			{ text = ")" },
		},
		calc_function = function(card)
			local dropshot_suit = G.GAME
				and G.GAME.current_round.cry_dropshot_card
				and G.GAME.current_round.cry_dropshot_card.suit
			card.joker_display_values.dropshot_card_suit = dropshot_suit
					and localize(G.GAME.current_round.cry_dropshot_card.suit, "suits_plural")
				or "-"
		end,
		style_function = function(card, text, reminder_text, extra)
			if reminder_text and reminder_text.children[2] then
				local dropshot_suit = G.GAME
					and G.GAME.current_round.cry_dropshot_card
					and G.GAME.current_round.cry_dropshot_card.suit
				reminder_text.children[2].config.colour = dropshot_suit
						and lighten(G.C.SUITS[G.GAME.current_round.cry_dropshot_card.suit], 0.35)
					or G.C.ORANGE
			end
			return false
		end,
	}
	JokerDisplay.Definitions["j_cry_kidnap"] = {
		text = {
			{ text = "+$" },
			{ ref_table = "card.ability.extra", ref_value = "money" },
		},
		text_config = { colour = G.C.GOLD },
		reminder_text = {
			{ ref_table = "card.joker_display_values", ref_value = "localized_text" },
		},
		calc_function = function(card)
			card.joker_display_values.localized_text = "(" .. localize("k_round") .. ")"
		end,
	}
	JokerDisplay.Definitions["j_cry_iterum"] = {
		text = {
			{
				border_nodes = {
					{ text = "X" },
					{ ref_table = "card.joker_display_values", ref_value = "x_mult", retrigger_type = "exp" },
				},
			},
		},
		calc_function = function(card)
			local count = 0
			local hand = next(G.play.cards) and G.play.cards or G.hand.highlighted
			local text, _, scoring_hand = JokerDisplay.evaluate_hand(hand)
			if text ~= "Unknown" then
				for _, scoring_card in pairs(scoring_hand) do
					count = count + JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
				end
			end
			card.joker_display_values.x_mult = card.ability.extra.x_mult ^ count
		end,
		retrigger_function = function(playing_card, scoring_hand, held_in_hand, joker_card)
			if held_in_hand then
				return 0
			end
			return (joker_card.ability.extra.repetitions * JokerDisplay.calculate_joker_triggers(joker_card)) or 0
		end,
	}
	JokerDisplay.Definitions["j_cry_happyhouse"] = {
		text = {
			{
				border_nodes = {
					{ text = "^" },
					{
						ref_table = "card.joker_display_values",
						ref_value = "e_mult",
						retrigger_type = function(number, triggers)
							local num = number
							for i = 1, triggers - 1 do
								num = num ^ number
							end
							return num
						end,
					},
				},
				border_colour = G.C.DARK_EDITION,
			},
		},
		reminder_text = {
			{ text = "(" },
			{ ref_table = "card.ability.extra", ref_value = "check" },
			{ text = "/114)" },
		},
		calc_function = function(card)
			card.joker_display_values.e_mult = card.ability.extra.check >= 114 and card.ability.extra.mult or 1
		end,
	}
	JokerDisplay.Definitions["j_cry_bubblem"] = {
		reminder_text = {
			{ text = "(" },
			{ ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
			{ text = ")" },
		},
		reminder_text_config = { scale = 0.35 },
		calc_function = function(card)
			card.joker_display_values.localized_text = localize(card.ability.extra.type, "poker_hands")
		end,
	}
	JokerDisplay.Definitions["j_cry_foodm"] = {
		text = {
			{ text = "+" },
			{ ref_table = "card.ability.extra", ref_value = "mult", retrigger_type = "mult" },
		},
		text_config = { colour = G.C.MULT },
		reminder_text = {
			{ text = "(" },
			{ ref_table = "card.joker_display_values", ref_value = "rounds_remaining" },
			{ text = ")" },
		},
		calc_function = function(card)
			card.joker_display_values.rounds_remaining = localize({
				type = "variable",
				key = "loyalty_inactive",
				vars = { card.ability.extra.rounds_remaining or 2 },
			})
		end,
	}
	JokerDisplay.Definitions["j_cry_mstack"] = {
		reminder_text = {
			{ text = "(" },
			{
				ref_table = "card.ability.extra",
				ref_value = "retriggers",
				colour = G.C.ORANGE,
				retrigger_type = "mult",
			},
			{ text = ")" },
		},
		retrigger_function = function(playing_card, scoring_hand, held_in_hand, joker_card)
			if held_in_hand then
				return 0
			end
			return (joker_card.ability.extra.retriggers * JokerDisplay.calculate_joker_triggers(joker_card)) or 0
		end,
	}
	JokerDisplay.Definitions["j_cry_exponentia"] = {
		text = {
			{
				border_nodes = {
					{ text = "^" },
					{
						ref_table = "card.ability.extra",
						ref_value = "Emult",
						retrigger_type = function(number, triggers)
							local num = number
							for i = 1, triggers - 1 do
								num = num ^ number
							end
							return num
						end,
					},
				},
				border_colour = G.C.DARK_EDITION,
			},
		},
	}
	JokerDisplay.Definitions["j_cry_mneon"] = {
		text = {
			{ text = "+$" },
			{ ref_table = "card.ability.extra", ref_value = "money" },
		},
		text_config = { colour = G.C.GOLD },
		reminder_text = {
			{ ref_table = "card.joker_display_values", ref_value = "localized_text" },
		},
		calc_function = function(card)
			card.joker_display_values.localized_text = "(" .. localize("k_round") .. ")"
		end,
	}
	JokerDisplay.Definitions["j_cry_virgo"] = {
		reminder_text = {
			{ text = "(" },
			{ text = "$", colour = G.C.GOLD },
			{ ref_table = "card", ref_value = "sell_cost", colour = G.C.GOLD },
			{ text = ") (" },
			{ ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
			{ text = ")" },
		},
		reminder_text_config = { scale = 0.35 },
		calc_function = function(card)
			card.joker_display_values.localized_text = localize(card.ability.extra.type, "poker_hands")
		end,
	}
	JokerDisplay.Definitions["j_cry_notebook"] = {
		reminder_text = {
			{ text = "(" },
			{ ref_table = "card.ability.extra", ref_value = "slot" },
			{ text = ") " },
			{ ref_table = "card.joker_display_values", ref_value = "localized_text" },
		},
		extra = {
			{
				{ text = "(" },
				{ ref_table = "card.joker_display_values", ref_value = "odds" },
				{ text = " in " },
				{ ref_table = "card.ability.extra", ref_value = "odds" },
				{ text = ")" },
			},
		},
		extra_config = { colour = G.C.GREEN, scale = 0.3 },
		calc_function = function(card)
			card.joker_display_values.localized_text = "("
				.. (card.ability.extra.check and localize("k_active_ex") or "Inactive")
				.. ")"
			card.joker_display_values.odds = G.GAME and G.GAME.probabilities.normal or 1
		end,
	}
	JokerDisplay.Definitions["j_cry_pot_of_jokes"] = {
		reminder_text = {
			{ text = "(" },
			{ ref_table = "card.joker_display_values", ref_value = "h_size", colour = G.C.ORANGE },
			{ text = ")" },
		},
		calc_function = function(card)
			card.joker_display_values.h_size = (card.ability.extra.h_size >= 0 and "+" or "")
				.. card.ability.extra.h_size
		end,
	}
	JokerDisplay.Definitions["j_cry_bonk"] = {
		mod_function = function(card, mod_joker)
			local chips_mod = mod_joker.ability.extra.chips
			if card.ability.name == "Jolly Joker" or (card.edition and card.edition.key == "e_cry_m") then
				chips_mod = chips_mod * mod_joker.ability.extra.xchips
			end
			return { chips = chips_mod * JokerDisplay.calculate_joker_triggers(mod_joker) or nil }
		end,
	}
	JokerDisplay.Definitions["j_cry_loopy"] = {
		text = {
			{ text = "x" },
			{ ref_table = "card.ability.extra", ref_value = "retrigger" },
		},
		retrigger_joker_function = function(card, retrigger_joker)
			return retrigger_joker.ability.extra.retrigger or 0
		end,
	}
	
	--This is here so it shows up on the github symbol panel (easy to scroll to)
	local page2 = {}
	
	JokerDisplay.Definitions["j_cry_membershipcardtwo"] = {
		text = {
			{ text = "+" },
			{ ref_table = "card.joker_display_values", ref_value = "stat", retrigger_type = "mult" },
		},
		text_config = { colour = G.C.CHIPS },
		calc_function = function(card)
			card.joker_display_values.stat = card.ability.extra.chips * (GLOBAL_cry_member_count or 1)
		end,
	}
	JokerDisplay.Definitions["j_cry_redeo"] = {
		reminder_text = {
			{ text = "($" },
			{ ref_table = "card.ability.extra", ref_value = "money_remaining" },
			{ text = "/$" },
			{ ref_table = "card.ability.extra", ref_value = "money_req" },
			{ text = ")" },
		},
	}
	JokerDisplay.Definitions["j_cry_scrabble"] = {
		extra = {
			{
				{ text = "(" },
				{ ref_table = "card.joker_display_values", ref_value = "odds" },
				{ text = " in " },
				{ ref_table = "card.ability.extra", ref_value = "odds" },
				{ text = ")" },
			},
		},
		extra_config = { colour = G.C.GREEN, scale = 0.3 },
		calc_function = function(card)
			card.joker_display_values.odds = G.GAME and G.GAME.probabilities.normal or 1
		end,
	}
	JokerDisplay.Definitions["j_cry_sacrifice"] = {
		reminder_text = {
			{ text = "(" },
			{ ref_table = "card.ability.extra", ref_value = "text" },
			{ text = ")" },
		},
	}
	JokerDisplay.Definitions["j_cry_googol_play"] = {
		text = {
			{
				border_nodes = {
					{ text = "X" },
					{ ref_table = "card.ability.extra", ref_value = "Xmult", retrigger_type = "exp" },
				},
			},
		},
		extra = {
			{
				{ text = "(" },
				{ ref_table = "card.joker_display_values", ref_value = "odds" },
				{ text = " in " },
				{ ref_table = "card.ability.extra", ref_value = "odds" },
				{ text = ")" },
			},
		},
		extra_config = { colour = G.C.GREEN, scale = 0.3 },
		calc_function = function(card)
			card.joker_display_values.odds = G.GAME and G.GAME.probabilities.normal or 1
		end,
	}
	JokerDisplay.Definitions["j_cry_wee_fib"] = {
		text = {
			{ text = "+" },
			{ ref_table = "card.ability.extra", ref_value = "mult", retrigger_type = "mult" },
		},
		text_config = { colour = G.C.MULT },
		reminder_text = {
			{ ref_table = "card.joker_display_values", ref_value = "localized_text" },
		},
		calc_function = function(card)
			card.joker_display_values.localized_text = "(" .. localize("Ace", "ranks") .. ",2,3,5,8)"
		end,
	}
	JokerDisplay.Definitions["j_cry_reverse"] = {
		reminder_text = {
			{ text = "(" },
			{ ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
			{ text = ")" },
		},
		reminder_text_config = { scale = 0.35 },
		calc_function = function(card)
			card.joker_display_values.localized_text = localize(card.ability.extra.type, "poker_hands")
		end,
	}
	JokerDisplay.Definitions["j_cry_smallestm"] = {
		reminder_text = {
			{ text = "(" },
			{ ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
			{ text = ")" },
		},
		calc_function = function(card)
			card.joker_display_values.localized_text = localize(card.ability.extra.type, "poker_hands")
		end,
	}
	JokerDisplay.Definitions["j_cry_tenebris"] = {
		text = {
			{ text = "+$" },
			{ ref_table = "card.ability.extra", ref_value = "money" },
		},
		text_config = { colour = G.C.GOLD },
		reminder_text = {
			{ ref_table = "card.joker_display_values", ref_value = "localized_text" },
		},
		calc_function = function(card)
			card.joker_display_values.localized_text = "(" .. localize("k_round") .. ")"
		end,
	}
	JokerDisplay.Definitions["j_cry_biggestm"] = {
		text = {
			{
				border_nodes = {
					{ text = "X" },
					{ ref_table = "card.joker_display_values", ref_value = "x_mult", retrigger_type = "exp" },
				},
			},
		},
		reminder_text = {
			{ text = "(" },
			{ ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
			{ text = ")" },
		},
		calc_function = function(card)
			card.joker_display_values.x_mult = card.ability.extra.check and card.ability.extra.x_mult or 1
			card.joker_display_values.localized_text = localize(card.ability.extra.type, "poker_hands")
		end,
	}
	JokerDisplay.Definitions["j_cry_mprime"] = {
		mod_function = function(card, mod_joker)
			return { e_mult = (
				card.ability.name == "Jolly Joker"
				or card.edition and card.edition.key == "e_cry_m"
				or card.ability.effect == "M Joker"
		 	) 
			and mod_joker.ability.extra.mult * JokerDisplay.calculate_joker_triggers(mod_joker) or nil }
		end,
	}
	JokerDisplay.Definitions["j_cry_whip"] = {
		text = {
			{
				border_nodes = {
					{ text = "X" },
					{ ref_table = "card.ability.extra", ref_value = "x_mult", retrigger_type = "exp" },
				},
			},
		},
		reminder_text = {
			{ text = "(2,7)" },
		},
	}
	JokerDisplay.Definitions["j_cry_lucky_joker"] = {
		text = {
			{ ref_table = "card.joker_display_values", ref_value = "count", retrigger_type = "mult" },
			{ text = "x", scale = 0.35 },
			{ text = "$", colour = G.C.GOLD },
			{ ref_table = "card.ability.extra", ref_value = "dollars", colour = G.C.GOLD },
		},
		reminder_text = {
			{ text = "(" },
			{ ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
			{ text = ")" },
		},
		calc_function = function(card)
			local count = 0
			local hand = next(G.play.cards) and G.play.cards or G.hand.highlighted
			local text, _, scoring_hand = JokerDisplay.evaluate_hand(hand)
			if text ~= "Unknown" then
				for _, scoring_card in pairs(scoring_hand) do
					if scoring_card.ability.effect and scoring_card.ability.effect == "Lucky Card" then
						count = count + JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
					end
				end
			end
			card.joker_display_values.count = count
			card.joker_display_values.localized_text =
				localize({ type = "name_text", set = "Enhanced", key = "m_lucky" })
		end,
	}
	JokerDisplay.Definitions["j_cry_canvas"] = {
		text = {
			{ text = "x" },
			{ ref_table = "card.joker_display_values", ref_value = "num_retriggers" },
		},
		calc_function = function(card)
			local num_retriggers = 0
			if G.jokers then
				for i = 1, #G.jokers.cards do
					if
						card.T.x + card.T.w / 2 < G.jokers.cards[i].T.x + G.jokers.cards[i].T.w / 2
						and G.jokers.cards[i].config.center.rarity ~= 1
					then
						num_retriggers = num_retriggers + 1
					end
				end
			end
			card.joker_display_values.num_retriggers = num_retriggers
		end,
		retrigger_joker_function = function(card, retrigger_joker)
			return card.T.x + card.T.w / 2 < retrigger_joker.T.x + retrigger_joker.T.w / 2
					and retrigger_joker.joker_display_values.num_retriggers
				or 0
		end,
	}
	JokerDisplay.Definitions["j_cry_Megg"] = {
		text = {
			{ text = "+" },
			{ ref_table = "card.ability.extra", ref_value = "amount" },
		},
		text_config = { colour = G.C.ORANGE },
		reminder_text = {
			{ ref_table = "card.joker_display_values", ref_value = "localized_text" },
		},
		calc_function = function(card)
			card.joker_display_values.localized_text = "(" .. localize("k_round") .. ")"
		end,
	}

	--This is here so it shows up on the github symbol panel (easy to scroll to)
	local page3 = {}
	
	JokerDisplay.Definitions["j_cry_jollysus"] = {
		reminder_text = {
			{ text = "(" },
			{ ref_table = "card.ability.extra", ref_value = "active" },
			{ text = ")" },
		},
	}
	JokerDisplay.Definitions["j_cry_cursor"] = {
		text = {
			{ text = "+" },
			{ ref_table = "card.ability.extra", ref_value = "chips", retrigger_type = "mult" },
		},
		text_config = { colour = G.C.CHIPS },
	}
	JokerDisplay.Definitions["j_cry_pickle"] = {
		reminder_text = {
			{ text = "(" },
			{ text = "+", colour = G.C.ORANGE },
			{ ref_table = "card.ability.extra", ref_value = "tags", colour = G.C.ORANGE, retrigger_type = "mult" },
			{ ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
			{ text = ")" },
		},
		calc_function = function(card)
			card.joker_display_values.localized_text = " " .. localize("b_tags")
		end,
	}
	JokerDisplay.Definitions["j_cry_error"] = {
		text = {
			{
				dynatext = {
					-- Maybe this can be defined before so we don't have to hard code the value
					string = { "+", "-", "X", "/", "^", "=", ">", "<", "m" },
					colours = { G.C.DARK_EDITION },
					pop_in_rate = 9999999,
					silent = true,
					random_element = true,
					pop_delay = 0.30,
					scale = 0.4,
					min_cycle_time = 0,
				},
			},
			{
				dynatext = {
					string = {
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
					},
					colours = { G.C.DARK_EDITION },
					pop_in_rate = 9999999,
					silent = true,
					random_element = true,
					pop_delay = 0.33,
					scale = 0.4,
					min_cycle_time = 0,
				},
			},
		},
	}
	JokerDisplay.Definitions["j_cry_cube"] = {
		text = {
			{ text = "+" },
			{ ref_table = "card.ability.extra", ref_value = "chips", retrigger_type = "mult" },
		},
		text_config = { colour = G.C.CHIPS },
	}
	JokerDisplay.Definitions["j_cry_triplet_rhythm"] = {
		text = {
			{
				border_nodes = {
					{ text = "X" },
					{ ref_table = "card.joker_display_values", ref_value = "x_mult", retrigger_type = "exp" },
				},
			},
		},
		calc_function = function(card)
			local count = 0
			local hand = next(G.play.cards) and G.play.cards or G.hand.highlighted
			local text, _, scoring_hand = JokerDisplay.evaluate_hand(hand)
			if text ~= "Unknown" and #scoring_hand == 3 then
				for _, scoring_card in pairs(scoring_hand) do
					if scoring_card:get_id() and scoring_card:get_id() == 3 then
						count = count + 1
					end
				end
			end
			card.joker_display_values.x_mult = count == 3 and card.ability.extra.Xmult or 1
		end,
	}
	JokerDisplay.Definitions["j_cry_chili_pepper"] = {
		text = {
			{
				border_nodes = {
					{ text = "X" },
					{ ref_table = "card.ability.extra", ref_value = "Xmult", retrigger_type = "exp" },
				},
			},
		},
		reminder_text = {
			{ ref_table = "card.joker_display_values", ref_value = "rounds_remaining" },
		},
		calc_function = function(card)
			card.joker_display_values.start_round = card.joker_display_values.start_round
				or card.ability.extra.rounds_remaining
			card.joker_display_values.rounds_remaining = "("
				.. card.ability.extra.rounds_remaining
				.. "/"
				.. card.joker_display_values.start_round
				.. ")"
		end,
	}
	JokerDisplay.Definitions["j_cry_compound_interest"] = {
		text = {
			{ text = "+$" },
			{ ref_table = "card.joker_display_values", ref_value = "dollars" },
		},
		text_config = { colour = G.C.GOLD },
		reminder_text = {
			{ ref_table = "card.joker_display_values", ref_value = "localized_text" },
		},
		calc_function = function(card)
			local bonus = math.max(0, math.floor(0.01 * card.ability.extra.percent * (G.GAME.dollars or 1)))
			card.joker_display_values.dollars = bonus and bonus > 0 and bonus or 0
			card.joker_display_values.localized_text = "(" .. localize("k_round") .. ")"
		end,
	}
	JokerDisplay.Definitions["j_cry_crustulum"] = {
		text = {
			{ text = "+" },
			{ ref_table = "card.ability.extra", ref_value = "chips", retrigger_type = "mult" },
		},
		text_config = { colour = G.C.CHIPS },
	}
	JokerDisplay.Definitions["j_cry_big_cube"] = {
		text = {
			{
				border_nodes = {
					{ text = "X" },
					{ ref_table = "card.ability.extra", ref_value = "x_chips", retrigger_type = "exp" },
				},
				border_colour = G.C.CHIPS,
			},
		},
	}
	JokerDisplay.Definitions["j_cry_m"] = {
		text = {
			{
				border_nodes = {
					{ text = "X" },
					{ ref_table = "card.ability.extra", ref_value = "x_mult", retrigger_type = "exp" },
				},
			},
		},
	}
	JokerDisplay.Definitions["j_cry_boredom"] = {
		extra = {
			{
				{ text = "(" },
				{ ref_table = "card.joker_display_values", ref_value = "odds" },
				{ text = " in " },
				{ ref_table = "card.ability.extra", ref_value = "odds" },
				{ text = ")" },
			},
		},
		extra_config = { colour = G.C.GREEN, scale = 0.3 },
		calc_function = function(card)
			card.joker_display_values.odds = G.GAME and G.GAME.probabilities.normal or 1
		end,
	}
	JokerDisplay.Definitions["j_cry_eternalflame"] = {
		text = {
			{
				border_nodes = {
					{ text = "X" },
					{ ref_table = "card.ability.extra", ref_value = "x_mult", retrigger_type = "exp" },
				},
			},
		},
	}
	JokerDisplay.Definitions["j_cry_nice"] = {
		text = {
			{ text = "+" },
			{ ref_table = "card.joker_display_values", ref_value = "chips", retrigger_type = "mult" },
		},
		text_config = { colour = G.C.CHIPS },
		reminder_text = {
			{ text = "(6+9)" },
		},
		extra_config = { colour = G.C.GREEN, scale = 0.3 },
		calc_function = function(card)
			local six_count = 0
			local nine_count = 0
			local hand = next(G.play.cards) and G.play.cards or G.hand.highlighted
			for _, played_card in pairs(hand) do
				if played_card:get_id() then
					if played_card:get_id() == 6 then
						six_count = six_count + 1
					elseif played_card:get_id() == 9 then
						nine_count = nine_count + 1
					end
				end
			end
			card.joker_display_values.chips = six_count > 0 and nine_count > 0 and card.ability.extra.chips or 0
		end,
	}
	JokerDisplay.Definitions["j_cry_chad"] = {
		reminder_text = {
			{ text = "(" },
			{ ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
			{ text = ")" },
		},
		calc_function = function(card)
			local leftmost_joker_key = G.jokers
				and G.jokers.cards[1]
				and G.jokers.cards[1] ~= card
				and G.jokers.cards[1].config.center.key
			card.joker_display_values.localized_text = leftmost_joker_key
					and localize({ type = "name_text", key = leftmost_joker_key, set = "Joker" })
				or "-"
		end,
		retrigger_joker_function = function(card, retrigger_joker)
			return card ~= retrigger_joker and G.jokers.cards[1] == card and retrigger_joker.ability.extra.retriggers
				or 0
		end,
	}

	--This is here so it shows up on the github symbol panel (easy to scroll to)
	local page4 = {}
	
	JokerDisplay.Definitions["j_cry_jimball"] = {
		text = {
			{
				border_nodes = {
					{ text = "X" },
					{ ref_table = "card.joker_display_values", ref_value = "x_mult", retrigger_type = "exp" },
				},
			},
		},
		calc_function = function(card)
			local hand = G.hand.highlighted
			local text, _, _ = JokerDisplay.evaluate_hand(hand)
			local play_more_than = 0
			local hand_exists = text ~= "Unknown" and G.GAME and G.GAME.hands and G.GAME.hands[text]
			if hand_exists then
				for k, v in pairs(G.GAME.hands) do
					if text ~= k and v.played and v.played >= play_more_than and v.visible then
						play_more_than = v.played
					end
				end
			end
			card.joker_display_values.x_mult = (
				hand_exists
					and (G.GAME.hands[text].played < play_more_than and 1 or card.ability.x_mult + card.ability.extra)
				or card.ability.x_mult
			)
		end,
	}
	JokerDisplay.Definitions["j_cry_fspinner"] = {
		text = {
			{ text = "+" },
			{ ref_table = "card.joker_display_values", ref_value = "chips", retrigger_type = "mult" },
		},
		text_config = { colour = G.C.CHIPS },
		calc_function = function(card)
			local hand = G.hand.highlighted
			local text, _, _ = JokerDisplay.evaluate_hand(hand)
			local play_more_than = 0
			local hand_exists = text ~= "Unknown" and G.GAME and G.GAME.hands and G.GAME.hands[text]
			if hand_exists then
				for k, v in pairs(G.GAME.hands) do
					if v.played and v.played >= play_more_than and v.visible then
						play_more_than = v.played
					end
				end
			end
			card.joker_display_values.chips = (
				hand_exists
					and (G.GAME.hands[text].played < play_more_than and card.ability.extra.chips + card.ability.extra.chip_mod)
				or card.ability.extra.chips
			)
		end,
	}
	JokerDisplay.Definitions["j_cry_number_blocks"] = {
		text = {
			{ text = "+$" },
			{ ref_table = "card.ability.extra", ref_value = "money" },
		},
		text_config = { colour = G.C.GOLD },
		reminder_text = {
			{ ref_table = "card.joker_display_values", ref_value = "localized_text_rank" },
			{ ref_table = "card.joker_display_values", ref_value = "localized_text_round" },
		},
		calc_function = function(card)
			card.joker_display_values.localized_text_rank = "("
				.. localize(
					G.GAME.current_round.cry_nb_card and G.GAME.current_round.cry_nb_card.rank or "Ace",
					"ranks"
				)
				.. ") "
			card.joker_display_values.localized_text_round = "(" .. localize("k_round") .. ")"
		end,
	}
	JokerDisplay.Definitions["j_cry_luigi"] = {
		mod_function = function(card, mod_joker)
			return { x_chips = mod_joker.ability.extra.x_chips ^ JokerDisplay.calculate_joker_triggers(mod_joker) }
		end,
	}
	JokerDisplay.Definitions["j_cry_waluigi"] = {
		mod_function = function(card, mod_joker)
			return { x_mult = mod_joker.ability.extra.Xmult ^ JokerDisplay.calculate_joker_triggers(mod_joker) }
		end,
	}
	JokerDisplay.Definitions["j_cry_mario"] = {
		text = {
			{ text = "x" },
			{ ref_table = "card.ability.extra", ref_value = "retriggers" },
		},
		retrigger_joker_function = function(card, retrigger_joker)
			return retrigger_joker.ability.extra.retriggers or 0
		end,
	}
	JokerDisplay.Definitions["j_cry_oldcandy"] = {
		text = {
			{ text = "+" },
			{ ref_table = "card.ability.extra", ref_value = "hand_size" },
		},
		text_config = { colour = G.C.ORANGE },
	}
	JokerDisplay.Definitions["j_cry_wario"] = {
		mod_function = function(card, mod_joker)
			return { dollars = mod_joker.ability.extra.money }
		end,
	}
	JokerDisplay.Definitions["j_cry_krustytheclown"] = {
		text = {
			{
				border_nodes = {
					{ text = "X" },
					{ ref_table = "card.ability.extra", ref_value = "x_mult", retrigger_type = "exp" },
				},
			},
		},
	}
	JokerDisplay.Definitions["j_cry_primus"] = {
		text = {
			{
				border_nodes = {
					{ text = "^" },
					{
						ref_table = "card.ability.extra",
						ref_value = "Emult",
						retrigger_type = function(number, triggers)
							local num = number
							for i = 1, triggers - 1 do
								num = num ^ number
							end
							return num
						end,
					},
				},
				border_colour = G.C.DARK_EDITION,
			},
		},
		reminder_text = {
			{ ref_table = "card.joker_display_values", ref_value = "localized_text" },
		},
		calc_function = function(card)
			card.joker_display_values.localized_text = "(" .. localize("Ace", "ranks") .. ",2,3,5,7)"
		end,
	}
	JokerDisplay.Definitions["j_cry_gardenfork"] = {
		text = {
			{ text = "+$" },
			{ ref_table = "card.joker_display_values", ref_value = "dollars", retrigger_type = "mult" },
		},
		text_config = { colour = G.C.GOLD },
		reminder_text = {
			{ ref_table = "card.joker_display_values", ref_value = "localized_text" },
		},
		calc_function = function(card)
			local ace_count = 0
			local seven_count = 0
			local hand = next(G.play.cards) and G.play.cards or G.hand.highlighted
			local text, _, scoring_hand = JokerDisplay.evaluate_hand(hand)
			if text ~= "Unknown" then
				for _, scoring_card in pairs(scoring_hand) do
					if scoring_card:get_id() then
						if scoring_card:get_id() == 14 then
							ace_count = ace_count + 1
						elseif scoring_card:get_id() == 7 then
							seven_count = seven_count + 1
						end
					end
				end
			end
			card.joker_display_values.dollars = ace_count > 0 and seven_count > 0 and card.ability.extra.money or 0
			card.joker_display_values.localized_text = "(" .. localize("Ace", "ranks") .. "+7)"
		end,
	}
	JokerDisplay.Definitions["j_cry_lightupthenight"] = {
		text = {
			{
				border_nodes = {
					{ text = "X" },
					{ ref_table = "card.joker_display_values", ref_value = "x_mult", retrigger_type = "exp" },
				},
			},
		},
		reminder_text = {
			{ text = "(7,2)" },
		},
		calc_function = function(card)
			local count = 0
			local hand = next(G.play.cards) and G.play.cards or G.hand.highlighted
			local text, _, scoring_hand = JokerDisplay.evaluate_hand(hand)
			if text ~= "Unknown" then
				for _, scoring_card in pairs(scoring_hand) do
					if scoring_card:get_id() and (scoring_card:get_id() == 2 or scoring_card:get_id() == 7) then
						count = count + JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
					end
				end
			end
			card.joker_display_values.x_mult = card.ability.extra.xmult ^ count
		end,
	}
	JokerDisplay.Definitions["j_cry_nosound"] = {
		retrigger_function = function(playing_card, scoring_hand, held_in_hand, joker_card)
			if held_in_hand then
				return 0
			end
			return playing_card:get_id()
					and playing_card:get_id() == 7
					and joker_card.ability.extra.retriggers * JokerDisplay.calculate_joker_triggers(joker_card)
				or 0
		end,
	}
	JokerDisplay.Definitions["j_cry_antennastoheaven"] = {
		text = {
			{
				border_nodes = {
					{ text = "X" },
					{ ref_table = "card.ability.extra", ref_value = "x_chips", retrigger_type = "exp" },
				},
				border_colour = G.C.CHIPS,
			},
		},
		reminder_text = {
			{ text = "(7,4)" },
		},
	}
	JokerDisplay.Definitions["j_cry_caramel"] = {
		text = {
			{
				border_nodes = {
					{ text = "X" },
					{ ref_table = "card.joker_display_values", ref_value = "x_mult", retrigger_type = "exp" },
				},
			},
		},
		reminder_text = {
			{ ref_table = "card.joker_display_values", ref_value = "rounds_remaining" },
		},
		calc_function = function(card)
			local count = 0
			local hand = next(G.play.cards) and G.play.cards or G.hand.highlighted
			local text, _, scoring_hand = JokerDisplay.evaluate_hand(hand)
			if text ~= "Unknown" then
				for _, scoring_card in pairs(scoring_hand) do
					count = count + JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
				end
			end
			card.joker_display_values.x_mult = card.ability.extra.x_mult ^ count

			card.joker_display_values.start_round = card.joker_display_values.start_round
				or card.ability.extra.rounds_remaining
			card.joker_display_values.rounds_remaining = "("
				.. card.ability.extra.rounds_remaining
				.. "/"
				.. card.joker_display_values.start_round
				.. ")"
		end,
	}

	--This is here so it shows up on the github symbol panel (easy to scroll to)
	local page5 = {}
	
	JokerDisplay.Definitions["j_cry_curse"] = {
		text = {
			{ ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.DARK_EDITION },
		},
		calc_function = function(card)
			card.joker_display_values.localized_text = localize("cry_sobbing")
		end,
	}
	JokerDisplay.Definitions["j_cry_hunger"] = {
		text = {
			{ text = "+$" },
			{ ref_table = "card.ability.extra", ref_value = "money" },
		},
		text_config = { colour = G.C.GOLD },
	}
	JokerDisplay.Definitions["j_cry_weegaming"] = {
		retrigger_function = function(playing_card, scoring_hand, held_in_hand, joker_card)
			if held_in_hand then
				return 0
			end
			return playing_card:get_id()
					and playing_card:get_id() == 2
					and joker_card.ability.extra.retriggers * JokerDisplay.calculate_joker_triggers(joker_card)
				or 0
		end,
	}
	JokerDisplay.Definitions["j_cry_redbloon"] = {
		text = {
			{ text = "+$" },
			{ ref_table = "card.joker_display_values", ref_value = "dollars" },
		},
		text_config = { colour = G.C.GOLD },
		reminder_text = {
			{ ref_table = "card.joker_display_values", ref_value = "localized_text" },
			{ ref_table = "card.joker_display_values", ref_value = "rounds_remaining" },
		},
		calc_function = function(card)
			card.joker_display_values.dollars = card.ability.extra.rounds_remaining
					and card.ability.extra.rounds_remaining <= 1
					and card.ability.extra.money
				or 0

			card.joker_display_values.localized_text = "(" .. localize("k_round") .. ")"
			card.joker_display_values.start_round = card.joker_display_values.start_round
				or card.ability.extra.rounds_remaining
			card.joker_display_values.rounds_remaining = " ("
				.. card.ability.extra.rounds_remaining
				.. "/"
				.. card.joker_display_values.start_round
				.. ")"
		end,
	}
	JokerDisplay.Definitions["j_cry_apjoker"] = {
		text = {
			{
				border_nodes = {
					{ text = "X" },
					{ ref_table = "card.joker_display_values", ref_value = "x_mult", retrigger_type = "exp" },
				},
			},
		},
		calc_function = function(card)
			local is_boss = G.GAME and G.GAME.blind and G.GAME.blind.get_type and G.GAME.blind:get_type() == "Boss"
			card.joker_display_values.x_mult = is_boss and card.ability.extra.x_mult or 1
		end,
	}
	JokerDisplay.Definitions["j_cry_magnet"] = {
		text = {
			{ text = "+$" },
			{ ref_table = "card.joker_display_values", ref_value = "dollars" },
		},
		text_config = { colour = G.C.GOLD },
		reminder_text = {
			{ ref_table = "card.joker_display_values", ref_value = "localized_text" },
		},
		calc_function = function(card)
			card.joker_display_values.dollars = G.jokers
					and #G.jokers.cards <= card.ability.extra.slots
					and card.ability.extra.money * card.ability.extra.Xmoney
				or card.ability.extra.money

			card.joker_display_values.localized_text = "(" .. localize("k_round") .. ")"
		end,
	}
	JokerDisplay.Definitions["j_cry_stella_mortis"] = {
		text = {
			{
				border_nodes = {
					{ text = "^" },
					{
						ref_table = "card.ability.extra",
						ref_value = "Emult",
						retrigger_type = function(number, triggers)
							local num = number
							for i = 1, triggers - 1 do
								num = num ^ number
							end
							return num
						end,
					},
				},
				border_colour = G.C.DARK_EDITION,
			},
		},
	}
	JokerDisplay.Definitions["j_cry_unjust_dagger"] = {
		text = {
			{
				border_nodes = {
					{ text = "X" },
					{ ref_table = "card.ability.extra", ref_value = "x_mult", retrigger_type = "exp" },
				},
			},
		},
	}
	JokerDisplay.Definitions["j_cry_monkey_dagger"] = {
		text = {
			{ text = "+" },
			{ ref_table = "card.ability.extra", ref_value = "chips", retrigger_type = "mult" },
		},
		text_config = { colour = G.C.CHIPS },
	}
	JokerDisplay.Definitions["j_cry_bonusjoker"] = {
		text = {
			{ text = "+" },
			{ ref_table = "card.joker_display_values", ref_value = "count" },
		},
		text_config = { colour = G.C.DARK_EDITION },
		extra = {
			{
				{ text = "(" },
				{ ref_table = "card.joker_display_values", ref_value = "odds" },
				{ text = " in " },
				{ ref_table = "card.ability.extra", ref_value = "odds" },
				{ text = ")" },
			},
		},
		extra_config = { colour = G.C.GREEN, scale = 0.3 },
		calc_function = function(card)
			local count = 0
			local hand = next(G.play.cards) and G.play.cards or G.hand.highlighted
			local text, _, scoring_hand = JokerDisplay.evaluate_hand(hand)
			if text ~= "Unknown" then
				for _, scoring_card in pairs(scoring_hand) do
					if scoring_card.ability.effect and scoring_card.ability.effect == "Bonus Card" then
						count = count + JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
					end
				end
			end
			card.joker_display_values.count = math.min(count, 2 - card.ability.extra.check)
			card.joker_display_values.odds = G.GAME and G.GAME.probabilities.normal or 1
		end,
	}
	JokerDisplay.Definitions["j_cry_pirate_dagger"] = {
		text = {
			{
				border_nodes = {
					{ text = "X" },
					{ ref_table = "card.ability.extra", ref_value = "x_chips", retrigger_type = "exp" },
				},
				border_colour = G.C.CHIPS,
			},
		},
	}
	JokerDisplay.Definitions["j_cry_mondrian"] = {
		text = {
			{
				border_nodes = {
					{ text = "X" },
					{ ref_table = "card.ability.extra", ref_value = "x_mult", retrigger_type = "exp" },
				},
			},
		},
	}
	JokerDisplay.Definitions["j_cry_sapling"] = {
		reminder_text = {
			{ ref_table = "card.joker_display_values", ref_value = "localized_text" },
		},
		calc_function = function(card)
			local is_active = card.ability.extra.score >= card.ability.extra.req
			card.joker_display_values.localized_text = "("
				.. (is_active and localize("k_active_ex") or (card.ability.extra.score .. "/" .. card.ability.extra.req))
				.. ")"
		end,
	}
	JokerDisplay.Definitions["j_cry_spaceglobe"] = {
		text = {
			{
				border_nodes = {
					{ text = "X" },
					{ ref_table = "card.ability.extra", ref_value = "x_chips", retrigger_type = "exp" },
				},
				border_colour = G.C.CHIPS,
			},
		},
		reminder_text = {
			{ text = "(" },
			{ ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
			{ text = ")" },
		},
		calc_function = function(card)
			card.joker_display_values.localized_text = localize(card.ability.extra.type, "poker_hands")
		end,
	}
	JokerDisplay.Definitions["j_cry_happy"] = {
		reminder_text = {
			{ ref_table = "card.joker_display_values", ref_value = "localized_text" },
		},
		calc_function = function(card)
			card.joker_display_values.localized_text = "(" .. localize("k_round") .. ")"
		end,
	}

	--This is here so it shows up on the github symbol panel (easy to scroll to)
	local page6 = {}
	
	JokerDisplay.Definitions["j_cry_meteor"] = {
		text = {
			{ text = "+" },
			{ ref_table = "card.joker_display_values", ref_value = "chips", retrigger_type = "mult" },
		},
		text_config = { colour = G.C.CHIPS },
		reminder_text = {
			{ text = "(" },
			{ ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.DARK_EDITION },
			{ text = ")" },
		},
		calc_function = function(card)
			local chips = 0
			local hand = next(G.play.cards) and G.play.cards or G.hand.highlighted
			local text, _, scoring_hand = JokerDisplay.evaluate_hand(hand)
			if text ~= "Unknown" then
				for _, scoring_card in pairs(scoring_hand) do --Foil cards scored (Note: Meteor shower does not support foil cards held in hand)
					if scoring_card.edition and scoring_card.edition.foil == true then
						chips = chips
							+ card.ability.extra.chips
								* JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
					end
				end
			end
			card.joker_display_values.chips = chips
			card.joker_display_values.localized_text = localize({ type = "name_text", set = "Edition", key = "e_foil" })
		end,
		mod_function = function(card, mod_joker) --Foil Jokers
			return { chips = (card ~= mod_joker and card.edition and card.edition.foil == true) and 
			mod_joker.ability.extra.chips * JokerDisplay.calculate_joker_triggers(mod_joker) or nil }
		end,
	}
	JokerDisplay.Definitions["j_cry_exoplanet"] = {
		text = {
			{ text = "+" },
			{ ref_table = "card.joker_display_values", ref_value = "mult", retrigger_type = "mult" },
		},
		text_config = { colour = G.C.MULT },
		reminder_text = {
			{ text = "(" },
			{ ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.DARK_EDITION },
			{ text = ")" },
		},
		calc_function = function(card)
			local count = 0
			local playing_hand = next(G.play.cards)
			local hand = next(G.play.cards) and G.play.cards or G.hand.highlighted
			local text, _, scoring_hand = JokerDisplay.evaluate_hand(hand)
			if text ~= "Unknown" then
				for _, scoring_card in pairs(scoring_hand) do --Holographic cards scored
					if scoring_card.edition and scoring_card.edition.holo == true then
						count = count + JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
					end
				end
			end
			for _, playing_card in ipairs(G.hand.cards) do --Holographic cards held in hand
                		if playing_hand or not playing_card.highlighted then
                    			if not (playing_card.facing == 'back') and not playing_card.debuff 
					and playing_card.edition and playing_card.edition.holo == true then
                        			count = count + JokerDisplay.calculate_card_triggers(playing_card, nil, true)
                    			end
                		end
            		end
			card.joker_display_values.mult = card.ability.extra.mult * count
			card.joker_display_values.localized_text = localize({ type = "name_text", set = "Edition", key = "e_holo" })
		end,
		mod_function = function(card, mod_joker)--Holographic Jokers
			return { mult = (card ~= mod_joker and card.edition and card.edition.holo == true) and 
			mod_joker.ability.extra.mult * JokerDisplay.calculate_joker_triggers(mod_joker) or nil }
		end,
	}
	JokerDisplay.Definitions["j_cry_stardust"] = {
		text = {
			{
				border_nodes = {
					{ text = "X" },
					{ ref_table = "card.joker_display_values", ref_value = "x_mult", retrigger_type = "exp" },
				},
			},
		},
		reminder_text = {
			{ text = "(" },
			{ ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.DARK_EDITION },
			{ text = ")" },
		},
		calc_function = function(card)
			local count = 0
			local playing_hand = next(G.play.cards)
			local hand = next(G.play.cards) and G.play.cards or G.hand.highlighted
			local text, _, scoring_hand = JokerDisplay.evaluate_hand(hand)
			if text ~= "Unknown" then
				for _, scoring_card in pairs(scoring_hand) do --Polychrome cards scored
					if scoring_card.edition and scoring_card.edition.polychrome == true then
						count = count + JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
					end
				end
			end
			for _, playing_card in ipairs(G.hand.cards) do --Polychrome cards held in hand
                		if playing_hand or not playing_card.highlighted then
                    			if not (playing_card.facing == 'back') and not playing_card.debuff 
					and playing_card.edition and playing_card.edition.polychrome == true then
                        			count = count + JokerDisplay.calculate_card_triggers(playing_card, nil, true)
                    			end
                		end
            		end
			card.joker_display_values.x_mult = card.ability.extra.xmult ^ count
			card.joker_display_values.localized_text =
				localize({ type = "name_text", set = "Edition", key = "e_polychrome" })
		end,
		mod_function = function(card, mod_joker) --Polychrome Jokers
			return { x_mult = (card ~= mod_joker and card.edition and card.edition.polychrome == true) and 
			mod_joker.ability.extra.xmult ^ JokerDisplay.calculate_joker_triggers(mod_joker) or nil }
		end,
	}
	JokerDisplay.Definitions["j_cry_multjoker"] = {
		text = {
			{ text = "+" },
			{ ref_table = "card.joker_display_values", ref_value = "count", retrigger_type = "mult" },
		},
		text_config = { colour = G.C.SECONDARY_SET.Spectral },
		extra = {
			{
				{ text = "(" },
				{ ref_table = "card.joker_display_values", ref_value = "odds" },
				{ text = " in " },
				{ ref_table = "card.ability.extra", ref_value = "odds" },
				{ text = ")" },
			},
		},
		extra_config = { colour = G.C.GREEN, scale = 0.3 },
		calc_function = function(card)
			local count = 0
			local hand = next(G.play.cards) and G.play.cards or G.hand.highlighted
			local text, _, scoring_hand = JokerDisplay.evaluate_hand(hand)
			if text ~= "Unknown" then
				for _, scoring_card in pairs(scoring_hand) do
					if scoring_card.ability.effect and scoring_card.ability.effect == "Mult Card" then
						count = count + JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
					end
				end
			end
			card.joker_display_values.count = count
			card.joker_display_values.odds = G.GAME and G.GAME.probabilities.normal or 1
		end,
	}
	JokerDisplay.Definitions["j_cry_goldjoker"] = {
		text = {
			{ text = "+$" },
			{ ref_table = "card.joker_display_values", ref_value = "dollars" },
		},
		text_config = { colour = G.C.GOLD },
		reminder_text = {
			{ ref_table = "card.joker_display_values", ref_value = "localized_text" },
		},
		calc_function = function(card)
			local bonus = math.max(0, math.floor(0.01 * card.ability.extra.percent * (G.GAME.dollars or 0)))
			card.joker_display_values.dollars = bonus and bonus > 0 and bonus or 0
			card.joker_display_values.localized_text = "(" .. localize("k_round") .. ")"
		end,
	}
	JokerDisplay.Definitions["j_cry_altgoogol"] = {
		reminder_text = {
			{ text = "(" },
			{ ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
			{ text = ")" },
		},
		calc_function = function(card)
			local leftmost_joker_key = G.jokers
				and G.jokers.cards[1]
				and G.jokers.cards[1] ~= card
				and G.jokers.cards[1].config.center.key
			card.joker_display_values.localized_text = leftmost_joker_key
					and localize({ type = "name_text", key = leftmost_joker_key, set = "Joker" })
				or "-"
		end,
	}
	JokerDisplay.Definitions["j_cry_circulus_pistoris"] = {
		text = {
			{ text = "^", colour = G.C.CHIPS },
			{ ref_table = "card.ability.extra", ref_value = "Echips", colour = G.C.CHIPS },
			{ text = "^", colour = G.C.MULT },
			{ ref_table = "card.ability.extra", ref_value = "Emult", colour = G.C.MULT },
		},
		extra = {

			{
				ref_table = "card.joker_display_values",
				ref_value = "localized_text",
				colour = G.C.UI.TEXT_INACTIVE,
				scale = 0.3,
			},
		},
		calc_function = function(card)
			card.joker_display_values.localized_text = "(" .. localize("k_round") .. ")"
		end,
	}
	local hand_xmult_jd = {
		text = {
			{
				border_nodes = {
					{ text = "X" },
					{ ref_table = "card.joker_display_values", ref_value = "x_mult", retrigger_type = "exp" },
				},
			},
		},
		reminder_text = {
			{ text = "(" },
			{ ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
			{ text = ")" },
		},
		calc_function = function(card)
			local x_mult = 1
			local text, poker_hands, _ = JokerDisplay.evaluate_hand()
			if text ~= "Unknown" and poker_hands[card.ability.type] and next(poker_hands[card.ability.type]) then
				x_mult = card.ability.x_mult
			end
			card.joker_display_values.x_mult = x_mult
			card.joker_display_values.localized_text = localize(card.ability.type, "poker_hands")
		end,
	}
	JokerDisplay.Definitions["j_cry_duos"] = hand_xmult_jd
	JokerDisplay.Definitions["j_cry_home"] = hand_xmult_jd
	JokerDisplay.Definitions["j_cry_nuts"] = hand_xmult_jd
	JokerDisplay.Definitions["j_cry_quintet"] = hand_xmult_jd
	JokerDisplay.Definitions["j_cry_unity"] = hand_xmult_jd
	JokerDisplay.Definitions["j_cry_swarm"] = hand_xmult_jd
	JokerDisplay.Definitions["j_cry_filler"] = hand_xmult_jd
	JokerDisplay.Definitions["j_cry_coin"] = {
		text = {
			{ text = "+$" },
			{ ref_table = "card.ability.extra", ref_value = "money" },
			{ text = "-" },
			{ ref_table = "card.joker_display_values", ref_value = "money" },
		},
		text_config = { colour = G.C.GOLD },
		calc_function = function(card)
			card.joker_display_values.money = (card.ability.extra.money * 10)
		end,
	}

	--This is here so it shows up on the github symbol panel (easy to scroll to)
	local page7 = {}
	
	JokerDisplay.Definitions["j_cry_wheelhope"] = {
		text = {
			{
				border_nodes = {
					{ text = "X" },
					{ ref_table = "card.ability.extra", ref_value = "x_mult", retrigger_type = "exp" },
				},
			},
		},
	}
	JokerDisplay.Definitions["j_cry_oldblueprint"] = {
		reminder_text = {
			{ text = "(" },
			{ ref_table = "card.joker_display_values", ref_value = "blueprint_compat", colour = G.C.RED },
			{ text = ")" },
		},
		extra = {
			{
				{ text = "(" },
				{ ref_table = "G.GAME.probabilities", ref_value = "normal" }, --the usual thing doesn't work for some reason
				{ text = " in " },
				{ ref_table = "card.ability.extra", ref_value = "odds" },
				{ text = ")" },
			},
		},
		extra_config = { colour = G.C.GREEN, scale = 0.3 },
		calc_function = function(card)
			local copied_joker, copied_debuff = JokerDisplay.calculate_blueprint_copy(card)
			card.joker_display_values.blueprint_compat = localize("k_incompatible")
			JokerDisplay.copy_display(card, copied_joker, copied_debuff)
		end,
		get_blueprint_joker = function(card)
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] == card then
					return G.jokers.cards[i + 1]
				end
			end
			return nil
		end,
	}
	JokerDisplay.Definitions["j_cry_night"] = {
		text = {
			{
				border_nodes = {
					{ text = "^" },
					{
						ref_table = "card.joker_display_values",
						ref_value = "e_mult",
						retrigger_type = function(number, triggers)
							local num = number
							for i = 1, triggers - 1 do
								num = num ^ number
							end
							return num
						end,
					},
				},
				border_colour = G.C.DARK_EDITION,
			},
		},
		reminder_text = {
			{ ref_table = "card.joker_display_values", ref_value = "localized_text" },
		},
		calc_function = function(card)
			card.joker_display_values.e_mult = (G.GAME and G.GAME.current_round.hands_left <= 1)
					and card.ability.extra.mult
				or 1
			card.joker_display_values.localized_text = "("
				.. ((G.GAME and G.GAME.current_round.hands_left <= 1) and localize("k_active_ex") or "Inactive")
				.. ")"
		end,
	}
	JokerDisplay.Definitions["j_cry_busdriver"] = {
		text = {
			{ text = "+", colour = G.C.MULT },
			{ ref_table = "card.ability.extra", ref_value = "mult", colour = G.C.MULT },
			{ text = " or -", colour = G.C.MULT },
			{ ref_table = "card.ability.extra", ref_value = "mult", colour = G.C.MULT },
		},
	}
	JokerDisplay.Definitions["j_cry_morse"] = {
		text = {
			{ text = "+$" },
			{ ref_table = "card.ability.extra", ref_value = "money" },
		},
		text_config = { colour = G.C.GOLD },
		reminder_text = {
			{ ref_table = "card.joker_display_values", ref_value = "localized_text" },
		},
		calc_function = function(card)
			card.joker_display_values.localized_text = "(" .. localize("k_round") .. ")"
		end,
	}
	JokerDisplay.Definitions["j_cry_membershipcard"] = {
		text = {
			{
				border_nodes = {
					{ text = "X" },
					{ ref_table = "card.joker_display_values", ref_value = "stat", retrigger_type = "exp" },
				},
			},
		},
		calc_function = function(card)
			card.joker_display_values.stat =
				math.max(1, (card.ability.extra.Xmult_mod * (GLOBAL_cry_member_count or 1)))
		end,
	}
	JokerDisplay.Definitions["j_cry_cryptidmoment"] = {
		text = {
			{ text = "+" },
			{ ref_table = "card.ability.extra", ref_value = "money" },
		},
		text_config = { colour = G.C.ORANGE },
	}
	JokerDisplay.Definitions["j_cry_copypaste"] = {
		extra = {
			{
				{ text = "(" },
				{ ref_table = "card.joker_display_values", ref_value = "odds" },
				{ text = " in " },
				{ ref_table = "card.ability.extra", ref_value = "odds" },
				{ text = ")" },
			},
		},
		extra_config = { colour = G.C.GREEN, scale = 0.3 },
		calc_function = function(card)
			card.joker_display_values.odds = G.GAME and G.GAME.probabilities.normal or 1
		end,
	}
	JokerDisplay.Definitions["j_cry_cut"] = {
		text = {
			{
				border_nodes = {
					{ text = "X" },
					{ ref_table = "card.ability.extra", ref_value = "Xmult", retrigger_type = "exp" },
				},
				border_colour = G.C.MULT,
			},
		},
	}
	JokerDisplay.Definitions["j_cry_python"] = {
		text = {
			{
				border_nodes = {
					{ text = "X" },
					{ ref_table = "card.ability.extra", ref_value = "Xmult", retrigger_type = "exp" },
				},
				border_colour = G.C.MULT,
			},
		},
	}
	JokerDisplay.Definitions["j_cry_longboi"] = {
		text = {
			{
				border_nodes = {
					{ text = "X" },
					{ ref_table = "card.ability.extra", ref_value = "mult", retrigger_type = "exp" },
				},
			},
		},
	}
	JokerDisplay.Definitions["j_cry_verisimile"] = {
		text = {
			{
				border_nodes = {
					{ text = "X" },
					{ ref_table = "card.ability.extra", ref_value = "xmult", retrigger_type = "exp" },
				},
			},
		},
	}
	JokerDisplay.Definitions["j_cry_gemino"] = {
		text = {
			{ text = "X2" },
		},
		text_config = { colour = G.C.GREEN },
		reminder_text = {
			{ ref_table = "card.joker_display_values", ref_value = "localized_text" },
		},
		calc_function = function(card)
			card.joker_display_values.localized_text = "(" .. localize("k_round") .. ")"
		end,
	}
	JokerDisplay.Definitions["j_cry_oldinvisible"] = {
		reminder_text = {
			{ text = "(" },
			{ ref_table = "card.ability", ref_value = "extra" },
			{ text = "/4)" },
		}
	}
	JokerDisplay.Definitions["j_cry_facile"] = {
		text = {
			{
				border_nodes = {
					{ text = "^" },
					{ ref_table = "card.joker_display_values", ref_value = "Emult", retrigger_type = "exp" },
				},
				border_colour = G.C.DARK_EDITION,
			},
		},
		calc_function = function(card)
			local count = 0
			local hand = next(G.play.cards) and G.play.cards or G.hand.highlighted
			local text, _, scoring_hand = JokerDisplay.evaluate_hand(hand)
			if text ~= "Unknown" then
				for _, scoring_card in pairs(scoring_hand) do
					count = count + JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
				end
			end
			card.joker_display_values.Emult = (count <= card.ability.extra.check and card.ability.extra.Emult or 1)
		end,
	}

	--This is here so it shows up on the github symbol panel (easy to scroll to)
	local page8 = {}
	
	local hand_tmult_jd = {
		text = {
                        { text = "+", colour = G.C.MULT },
                        { ref_table = "card.joker_display_values", ref_value = "t_mult", colour = G.C.MULT, retrigger_type = "mult" },
                },
		reminder_text = {
			{ text = "(" },
			{ ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
			{ text = ")" },
		},
		calc_function = function(card)
			local t_mult = 0
			local text, poker_hands, _ = JokerDisplay.evaluate_hand()
			if text ~= "Unknown" and poker_hands[card.ability.type] and next(poker_hands[card.ability.type]) then
				t_mult = card.ability.t_mult
			end
			card.joker_display_values.t_mult = t_mult
			card.joker_display_values.localized_text = localize(card.ability.type, "poker_hands")
		end,
	}
	local hand_tchips_jd = {
		text = {
                        { text = "+", colour = G.C.CHIPS },
                        { ref_table = "card.joker_display_values", ref_value = "t_chips", colour = G.C.CHIPS, retrigger_type = "mult" },
                },
		reminder_text = {
			{ text = "(" },
			{ ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
			{ text = ")" },
		},
		calc_function = function(card)
			local t_chips = 0
			local text, poker_hands, _ = JokerDisplay.evaluate_hand()
			if text ~= "Unknown" and poker_hands[card.ability.type] and next(poker_hands[card.ability.type]) then
				t_chips = card.ability.t_chips
			end
			card.joker_display_values.t_chips = t_chips
			card.joker_display_values.localized_text = localize(card.ability.type, "poker_hands")
		end,
	}
	JokerDisplay.Definitions["j_cry_giggly"] = hand_tmult_jd
	JokerDisplay.Definitions["j_cry_nutty"] = hand_tmult_jd
	JokerDisplay.Definitions["j_cry_manic"] = hand_tmult_jd
	JokerDisplay.Definitions["j_cry_silly"] = hand_tmult_jd
	JokerDisplay.Definitions["j_cry_delirious"] = hand_tmult_jd
	JokerDisplay.Definitions["j_cry_wacky"] = hand_tmult_jd
	JokerDisplay.Definitions["j_cry_kooky"] = hand_tmult_jd
	JokerDisplay.Definitions["j_cry_dubious"] = hand_tchips_jd
	JokerDisplay.Definitions["j_cry_shrewd"] = hand_tchips_jd
	JokerDisplay.Definitions["j_cry_tricksy"] = hand_tchips_jd
	JokerDisplay.Definitions["j_cry_foxy"] = hand_tchips_jd
	JokerDisplay.Definitions["j_cry_savvy"] = hand_tchips_jd
	JokerDisplay.Definitions["j_cry_subtle"] = hand_tchips_jd
	JokerDisplay.Definitions["j_cry_discreet"] = hand_tchips_jd
	JokerDisplay.Definitions["j_cry_fractal"] = {
		text = {
			{ text = "+" },
			{ ref_table = "card.ability", ref_value = "extra" },
		},
		text_config = { colour = G.C.ORANGE },
	}
	
	--This is here so it shows up on the github symbol panel (easy to scroll to)
	local page9 = {}

	JokerDisplay.Definitions["j_cry_duplicare"] = {
		mod_function = function(card, mod_joker)
			return { e_mult = mod_joker.ability.extra.Emult ^ JokerDisplay.calculate_joker_triggers(mod_joker) or nil }
		end,
	}
	JokerDisplay.Definitions["j_cry_equilib"] = {
		text = {
			{ ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
		},
		calc_function = function(card)
			local joker_generated = "???"
			if G.GAME.aequilibriumkey and G.GAME.aequilibriumkey > 1 then
				joker_generated = localize({
					type = "name_text",
					set = "Joker",
					key = G.P_CENTER_POOLS["Joker"][math.floor(G.GAME.aequilibriumkey or 1) - 1].key,
				})
			end
			card.joker_display_values.localized_text = joker_generated
		end,
	}
	JokerDisplay.Definitions["j_cry_queens_gambit"] = {
		reminder_text = {
			{ text = "(" },
			{ ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
			{ text = ")" },
		},
		reminder_text_config = { scale = 0.35 },
		calc_function = function(card)
			card.joker_display_values.localized_text = localize("Royal Flush", "poker_hands")
		end,
	}
	
	--end of Jokerdisplays
end
return { name = "JokerDisplay" }
