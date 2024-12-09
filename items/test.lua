local test = {
	object_type = "Joker",
	key = "test",
	discovered = true,
    gameset_config = {
        modest = {extra = {chips = 1}},
        madness = {extra = {chips = 100}},
		cryptid_in_2025 = {extra = {chips = 1e308}},
    },
	extra_gamesets = {"cryptid_in_2025"},
	dependencies = {
		items = {
			"j_cry_happy"
		},
	},
	config = {extra = {chips = 10}},
	pos = { x = 1, y = 0 },
	rarity = 1,
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
	in_pool = function()
		return false
	end,
}
return {items = {test, test2, test3, rework, rework_tag}}
