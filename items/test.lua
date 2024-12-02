local test = {
	object_type = "Joker",
	key = "test",
    gameset_config = {
        modest = {extra = {chips = 1}},
        madness = {extra = {chips = 100}},
    },
	config = {extra = {chips = 10}},
	pos = { x = 1, y = 0 },
	rarity = 1,
	order = 11,
	cost = 1,
	blueprint_compat = true,
	atlas = "atlasone",
	loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.chips }, key = "j_cry_test_"..Card.get_gameset(self, center) }
	end,
	calculate = function(self, card, context)
		if context.cardarea == G.jokers and not context.before and not context.after then
			return {
				message = localize({ type = "variable", key = "a_chips", vars = { card.ability.extra.chips } }),
				chip_mod = card.ability.extra.chips,
			}
		elseif context.first_hand_drawn and Card.get_gameset(self, center) ~= "modest" then
			ease_dollars(Card.get_gameset(self, center) ~= "mainline" and 44444 or 44)
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
		if context.selling_self and not context.retrigger_joker and (Card.get_gameset(self, center) == "modest" and not context.blueprint) then
			local modestcheck = nil
			if Card.get_gameset(self, center) == "modest" then modestcheck = true end
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
return {items = {test, test2}}
