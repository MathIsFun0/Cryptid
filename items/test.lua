local test = {
	object_type = "Joker",
	key = "test",
	discovered = true,
    gameset_config = {
        modest = {extra = {chips = 1}, center = {rarity = 1}},
		mainline = {center = {rarity = 2}},
        madness = {extra = {chips = 100}, center = {rarity = 3}},
		cryptid_in_2025 = {extra = {chips = 1e308}, center = {rarity = "cry_exotic"}},
    },
	extra_gamesets = {"cryptid_in_2025"},
	dependencies = {
		items = {
			"j_cry_happy",
			"set_cry_m"
		},
	},
	config = {extra = {chips = 10}},
	pos = { x = 1, y = 0 },
	rarity = 2,
	order = 11,
	cost = 1,
	blueprint_compat = true,
	atlas = "atlasone",
	loc_vars = function(self, info_queue, center)
		local gameset = Card.get_gameset(center)
		if gameset == 'disabled' then gameset = 'mainline' end --still show description
		return { vars = { center.ability.extra.chips }, key = "j_cry_test_"..gameset }
	end,
	calculate = function(self, card, context)
		local gameset = Card.get_gameset(card)
		if context.cardarea == G.jokers and not context.before and not context.after then
			return {
				message = localize({ type = "variable", key = "a_chips", vars = { card.ability.extra.chips } }),
				chip_mod = card.ability.extra.chips,
			}
		elseif context.first_hand_drawn and gameset ~= "modest" then
			ease_dollars(gameset ~= "mainline" and 44444 or 44)
		end
	end,
	cry_credits = {
		idea = {
			"m"
		},
		art = {
			"m"
		},
		code = {
			"Jevonn"
		}
	},
}
--Note, did not update description yet
local test2 = {
	object_type = "Joker",
	name = "cry-altgoogol",
	key = "altgoogol",
	discovered = true,
	pos = { x = 4, y = 3 },
	immutable = true,
	rarity = "cry_epic",
	cost = 13,
	order = 60,
	blueprint_compat = false,
	eternal_compat = false,
	atlas = "atlasepic",
	soul_pos = { x = 10, y = 0, extra = { x = 5, y = 3 } },
	calculate = function(self, card, context)
		local gameset = Card.get_gameset(card)
		if context.selling_self and not context.retrigger_joker and (gameset == "madness" or not context.blueprint) then
			local modestcheck = nil
			if gameset == "modest" then modestcheck = true end
			local jokers = {}
                	for i=1, #G.jokers.cards do 
                    		if G.jokers.cards[i] ~= card then
                        		jokers[#jokers+1] = G.jokers.cards[i]
                    		end
                	end
                	if #jokers > 0 then
				if not modestcheck or #G.jokers.cards <= G.jokers.config.card_limit then 
					if G.jokers.cards[1].ability.name ~= "cry-altgoogol" then
						G.E_MANAGER:add_event(Event({
							func = function()
								for i = 1, (2 - (modestcheck and 1 or 0))  do
									local chosen_joker = G.jokers.cards[1]
									local card = copy_card(chosen_joker, nil, nil, nil, (modestcheck and (chosen_joker.edition and chosen_joker.edition.negative) or nil))
									card:add_to_deck()
									G.jokers:emplace(card)
								end
								return true
							end,
						}))
						card_eval_status_text(
							context.blueprint_card or card,
							"extra",
							nil,
							nil,
							nil,
						{ 
							message = localize("k_duplicated_ex"),
							colour = G.C.RARITY.cry_epic,
							}
						)
						return nil, true
					else
						card_eval_status_text(
							context.blueprint_card or card,
							"extra",
							nil,
							nil,
							nil,
							{ 
							message = localize("k_nope_ex"),
							colour = G.C.RARITY.cry_epic,
							}
						)
						return nil, true
					end
				else
					card_eval_status_text(
							context.blueprint_card or card,
							"extra",
							nil,
							nil,
							nil,
							{ 
							message = localize("k_no_room_ex"),
							colour = G.C.RARITY.cry_epic,
							}
					)
					return nil, true
				end
			else
				card_eval_status_text(
						context.blueprint_card or card,
						"extra",
						nil,
						nil,
						nil,
						{ 
						message = localize("k_no_other_jokers"),
						colour = G.C.RARITY.cry_epic,
						}
				)
				return nil, true
			end
		end
	end,
	cry_credits = {
		idea = {
			"Jevonn"
		},
		art = {
			"Jevonn"
		},
		code = {
			"Jevonn"
		}
	},
}
local test3 = {
	object_type = "Joker",
	name = "cry-happy",
	key = "happy",
	pos = { x = 2, y = 1 },
	rarity = 1,
	cost = 2,
	discovered = true,
	gameset_config = {
        	modest = {cost = 5},
    	},
	order = 63,
	blueprint_compat = true,
	eternal_compat = false,
	atlas = "atlastwo",
	calculate = function(self, card, context)
		if
			context.selling_self
			and #G.jokers.cards + G.GAME.joker_buffer <= G.jokers.config.card_limit
			and not context.retrigger_joker
		then
			local sellcreatejoker = 1
			G.GAME.joker_buffer = G.GAME.joker_buffer + sellcreatejoker
			G.E_MANAGER:add_event(Event({
				func = function()
					for i = 1, sellcreatejoker do
						local card = create_card("Joker", G.jokers, nil, nil, nil, nil, nil, "happy")
						card:add_to_deck()
						G.jokers:emplace(card)
						card:start_materialize()
						G.GAME.joker_buffer = 0
					end
					return true
				end,
			}))
			card_eval_status_text(
				context.blueprint_card or card,
				"extra",
				nil,
				nil,
				nil,
				{ message = localize("k_plus_joker"), colour = G.C.BLUE }
			)
			return nil, true
		end
		if
			context.end_of_round
			and not context.individual
			and not context.repetition
			and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit
			and not context.retrigger_joker
		then
			local roundcreatejoker = math.min(1, G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
			G.GAME.joker_buffer = G.GAME.joker_buffer + roundcreatejoker
			G.E_MANAGER:add_event(Event({
				func = function()
					if roundcreatejoker > 0 then
						local card = create_card("Joker", G.jokers, nil, nil, nil, nil, nil, "happy")
						card:add_to_deck()
						G.jokers:emplace(card)
						card:start_materialize()
						G.GAME.joker_buffer = 0
					end
					return true
				end,
			}))
			card_eval_status_text(
				context.blueprint_card or card,
				"extra",
				nil,
				nil,
				nil,
				{ message = localize("k_plus_joker"), colour = G.C.BLUE }
			)
			return nil, true
		end
	end,
	cry_credits = {
		idea = {
			"Jevonn"
		},
		art = {
			"Jevonn"
		},
		code = {
			"Jevonn"
		}
	},
}
local rework = {
	object_type = "Consumable",
	set = "Tarot",
	key = "rework",
	discovered = true,
	name = "cry-Rework",
	order = 25,
	pos = {
		x = 3,
		y = 3,
	},
	cost = 4,
	loc_vars = function(self, info_queue)
		info_queue[#info_queue + 1] =
			{ set = "Tag", key = "tag_cry_rework", specific_vars = { "[edition]", "[joker]" } }
		return { vars = {} }
	end,
	can_use = function(self, card)
		--todo: nostalgic deck compat
		return #G.jokers.highlighted == 1 and not G.jokers.highlighted[1].ability.eternal
		and G.jokers.highlighted[1].ability.name ~= "cry-meteor"
		and G.jokers.highlighted[1].ability.name ~= "cry-exoplanet"
		and G.jokers.highlighted[1].ability.name ~= "cry-stardust"
		and G.jokers.highlighted[1].config.center.rarity ~= "cry_cursed"
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
	object_type = "Tag",
	atlas = "tag_cry",
	name = "cry-Rework Tag",
	discovered = true,
	order = 19,
	pos = { x = 0, y = 3 },
	config = { type = "store_joker_create" },
	key = "rework",
	ability = { rework_edition = nil, rework_key = nil },
	apply = function(tag, context)
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
	--This is temporary to prevent crashes, we should implement proper loc_vars handling here later
	loc_vars = function(self, info_queue)
		return { vars = { "[edition]", "[joker]" } }
	end,
	in_pool = function()
		return false
	end,
}
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
local oldmark = {
	object_type = "Blind",
	name = "cry-oldmark",
	key = "oldmark",
	pos = { x = 0, y = 1 },
	boss = {
		min = 4,
		max = 10,
	},
	atlas = "nostalgia",
	order = 12,
	boss_colour = HEX("4f6367"),
	debuff_hand = function(self, cards, hand, handname, check)
		if next(hand["Pair"]) then
			G.GAME.blind.triggered = true
			return true
		end
		return false
	end,
	get_loc_debuff_text = function(self)
		return localize("cry_debuff_oldmark")
	end,
}
local nostalgia_sprites = {
	object_type = "Atlas",
	key = "nostalgia",
	atlas_table = "ANIMATION_ATLAS",
	path = "bl_nostalgia.png",
	px = 34,
	py = 34,
	frames = 21,
}
local echo = {
	object_type = "Enhancement",
	key = "echo",
	atlas = "cry_misc",
	pos = { x = 2, y = 0 },
	config = { retriggers = 2, extra = 2 },
	loc_vars = function(self, info_queue)
		return { vars = { self.config.retriggers, G.GAME.probabilities.normal, self.config.extra } }
	end,
}
local gold_shader = {
	object_type = "Shader",
	key = "gold",
	path = "gold.fs",
	send_vars = function(sprite, card)
		return {
			lines_offset = card and card.edition and card.edition.cry_gold_seed or 0,
		}
	end,
}
local gold_edition = {
	object_type = "Edition",
	key = "gold",
	order = 5,
	shader = "gold",
	weight = 7,
	extra_cost = 2,
	in_shop = true,
	config = { dollars = 2 },
	loc_vars = function(self, info_queue)
		return { vars = { self.config.dollars } }
	end,
	sound = {
		sound = "cry_e_golden",
		per = 1,
		vol = 0.3,
	},
	on_apply = function(card)
		-- Randomize offset to -1..1
		card.edition.cry_gold_seed = pseudorandom("e_cry_gold") * 2 - 1
	end,
	calculate = function(self, card, context)
		if
			context.joker_triggered
			or context.from_consumable
			or (
				context.from_playing_card
				and context.cardarea
				and context.cardarea == G.play
				and not context.repetition
			)
		then
			ease_dollars(self.config.dollars)
			card_eval_status_text(
				card,
				"extra",
				nil,
				nil,
				nil,
				{ message = localize("$") .. self.config.dollars, colour = G.C.MONEY }
			)
		end
	end,
}
local azure_seal = {
	object_type = "Seal",
	name = "cry-Azure-Seal",
	key = "azure",
	badge_colour = HEX("1d4fd7"),
	config = { planets_amount = 3 },
	loc_vars = function(self, info_queue)
		return { vars = { self.config.planets_amount } }
	end,
	atlas = "cry_misc",
	pos = { x = 0, y = 2 },
	calculate = function(self, card, context)
		if context.destroying_card then
			G.E_MANAGER:add_event(Event({
				trigger = "before",
				delay = 0.0,
				func = function()
					local card_type = "Planet"
					local _planet = nil
					if G.GAME.last_hand_played then
						for k, v in pairs(G.P_CENTER_POOLS.Planet) do
							if v.config.hand_type == G.GAME.last_hand_played then
								_planet = v.key
								break
							end
						end
					end

					for i = 1, self.config.planets_amount do
						local card = create_card(card_type, G.consumeables, nil, nil, nil, nil, _planet, "cry_azure")

						card:set_edition({ negative = true }, true)
						card:add_to_deck()
						G.consumeables:emplace(card)
					end
					return true
				end,
			}))

			return true
		end
	end,
}
local banana = {
	object_type = "Sticker",
	badge_colour = HEX("e8c500"),
	prefix_config = { key = false },
	key = "banana",
	atlas = "sticker",
	pos = { x = 5, y = 2 },
	should_apply = false,
	loc_vars = function(self, info_queue, card)
		if card.ability.consumeable then
			return { key = "cry_banana_consumeable", vars = { G.GAME.probabilities.normal or 1, 4 } }
		elseif card.ability.set == "Voucher" then
			return { key = "cry_banana_voucher", vars = { G.GAME.probabilities.normal or 1, 12 } }
		elseif card.ability.set == "Booster" then
			return { key = "cry_banana_booster" }
		else
			return { vars = { G.GAME.probabilities.normal or 1, 10 } }
		end
	end,
}
return {items = {test, test2, test3, rework, rework_tag, blank, blank_sprite, oldmark, nostalgia_sprites, echo, gold_shader, gold_edition, azure_seal, banana}}
