cry_enable_exotics = false
--TIP!!! for coding exotics, make sure you know which layer corresponds to which value!
--The Normal pos correponds to the background. use this for the layer that goes all the way in the back!
--The soul_pos = {blahblahblah, extra = {blahblahblah}} correspomds to the other two layers. the value in the extra table is for the layer that goes in the middle, and the other value is the one that goes all the way in the front
local gateway = {
    object_type = "Consumable",
    set = "Spectral",
    name = "cry-Gateway",
    key = "gateway",
    pos = {x=0,y=0},
    loc_txt = {
        name = 'Gateway',
        text = { "Create a random",
        "{C:cry_exotic,E:1}Exotic{C:attention} Joker{}, destroy",
        'all other Jokers' }
    },
    cost = 4,
    atlas = "gateway",
    hidden = true, --default soul_set and soul_rate of 0.3% in spectral packs is used
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
	if (#SMODS.find_card('j_jen_saint') + #SMODS.find_card('j_jen_saint_attuned')) <= 0 then
	        local deletable_jokers = {}
	        for k, v in pairs(G.jokers.cards) do
	            if not v.ability.eternal then deletable_jokers[#deletable_jokers + 1] = v end
	        end
	        local _first_dissolve = nil
	        G.E_MANAGER:add_event(Event({trigger = 'before', delay = 0.75, func = function()
	            for k, v in pairs(deletable_jokers) do
	                v:start_dissolve(nil, _first_dissolve)
	                _first_dissolve = true
	            end
	            return true end }))
	end
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            play_sound('timpani')
            local card = create_card('Joker', G.jokers, nil, "cry_exotic", nil, nil, nil, 'cry_gateway')
            card:add_to_deck()
            G.jokers:emplace(card)
            card:juice_up(0.3, 0.5)
            return true end }))
        delay(0.6)
    end
}
local gateway_sprite = {
    object_type = "Atlas",
    key = "gateway",
    path = "c_cry_gateway.png",
    px = 71,
    py = 95
}
local iterum = {
    object_type = "Joker",
	name = "cry-Iterum",
	key = "iterum",
	config = {extra = {x_mult = 2, repetitions = 1}},
	pos = {x = 0, y = 1},
	loc_txt = {
        name = 'Iterum',
        text = {
        "Retrigger all cards played",
	"{C:attention}#2#{} time(s),",
        "each played card gives",
        "{X:mult,C:white} X#1# {} Mult when scored"}
    },
	rarity = "cry_exotic",
	cost = 50,
	blueprint_compat = true,
	atlas = 'atlasexotic',
	soul_pos = {x = 1, y = 1, extra = {x = 2, y = 1}},
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.x_mult,center.ability.extra.repetitions}}
    end,
    calculate = function(self, card, context)
        if context.repetition then
            if context.cardarea == G.play then
                return {
                    message = localize('k_again_ex'),
                    repetitions = card.ability.extra.repetitions,
                    card = card
                }
            end
        elseif context.individual then
            if context.cardarea == G.play then
                return {
                    x_mult = card.ability.extra.x_mult,
                    colour = G.C.RED,
                    card = card
                }
            end
        end
    end
}
if JokerDisplay then
    iterum.joker_display_definition = {
        text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.joker_display_values", ref_value = "x_mult", retrigger_type = "exp" }
                }
            }
        },
        calc_function = function(card)
            local count = 0
            local hand = next(G.play.cards) and G.play.cards or G.hand.highlighted
            local text, _, scoring_hand = JokerDisplay.evaluate_hand(hand)
            if text ~= 'Unknown' then
                for _, scoring_card in pairs(scoring_hand) do
                    count = count +
                        JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                end
            end
            card.joker_display_values.x_mult = card.ability.extra.x_mult ^ count
        end,
        retrigger_function = function(playing_card, scoring_hand, held_in_hand, joker_card)
            if held_in_hand then return 0 end
            return (joker_card.ability.extra.repetitions * JokerDisplay.calculate_joker_triggers(joker_card)) or 0
        end
    }
end
local universum = {
    object_type = "Joker",
	name = "cry-Universum",
	key = "universum",
	config = {extra = 2},
	pos = {x = 3, y = 3},
	loc_txt = {
        name = 'Universum',
        text = {
        "{C:attention}Poker hands{} gain",
        "{X:red,C:white} X#1# {} Mult and {X:blue,C:white} X#1# {} Chips",
        "when leveled up",
        }
    },
	rarity = "cry_exotic",
	cost = 50,
    blueprint_compat = true,
	atlas = "atlasexotic",
	soul_pos = {x = 4, y = 3, extra = {x = 5, y = 3}},
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra}}
    end,
    calculate = function(self, card, context)
        if context.cry_universum then
            return {mod = to_big(card.ability.extra)}
        end
    end
}
local exponentia = {
    object_type = "Joker",
	name = "cry-Exponentia",
	key = "exponentia",
	config = {extra = {Emult = 1, Emult_mod = 0.01}},
	pos = {x = 0, y = 0},
	loc_txt = {
        name = 'Exponentia',
        text = {
			"This Joker gains {X:dark_edition,C:white} ^#1# {} Mult",
			"when {X:red,C:white} XMult {} is triggered",
			"{C:inactive}(Currently {X:dark_edition,C:white} ^#2# {C:inactive} Mult)"
        }
    },
	rarity = "cry_exotic",
	cost = 50,
    blueprint_compat = true,
	perishable_compat = false,
	atlas = "atlasexotic",
	soul_pos = {x = 2, y = 0, extra = {x = 1, y = 0}},
	calculate = function(self, card, context)
        if context.cardarea == G.jokers and (to_big(card.ability.extra.Emult) > to_big(1)) and not context.before and not context.after then
            return {
                message = "^"..number_format(card.ability.extra.Emult).." Mult",
                Emult_mod = card.ability.extra.Emult,
                colour = G.C.DARK_EDITION
            }
        end
	end,
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.Emult_mod, center.ability.extra.Emult}}
    end
}
if JokerDisplay then
    exponentia.joker_display_definition = {
        text = {
            {
                border_nodes = {
                    { text = "^" },
                    { 
                        ref_table = "card.ability.extra",
                        ref_value = "Emult",
                        retrigger_type = function (number, triggers)
                            local num = number
                            for i=1, triggers-1 do
                                num = num ^ number
                            end
                            return num
                        end
                    }
                },
                border_colour = G.C.DARK_EDITION
            }
        },
    }
end
local speculo = {
    object_type = "Joker",
	name = "cry-Speculo",
	key = "speculo",
	pos = {x = 3, y = 1},
	loc_txt = {
        name = 'Speculo',
        text = {
            "Creates a {C:dark_edition}Negative{} copy",
            "of a random {C:attention}Joker{}",
            "at the end of the {C:attention}shop",
	    "{C:inactive,s:0.8}Does not copy other Speculo{}",
        }
    },
	rarity = "cry_exotic",
	cost = 50,
    blueprint_compat = true,
	atlas = "atlasexotic",
	soul_pos = {x = 4, y = 1, extra = {x = 5, y = 1}},
	loc_vars = function(self, info_queue, center)
		info_queue[#info_queue+1] = G.P_CENTERS.e_negative
	end,
	calculate = function(self, card, context)
        if context.ending_shop then
            local eligibleJokers = {}
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i].ability.name ~= card.ability.name then eligibleJokers[#eligibleJokers+1] = G.jokers.cards[i] end
            end
            if #eligibleJokers > 0 then
                G.E_MANAGER:add_event(Event({
                    func = function() 
                        local card = copy_card(pseudorandom_element(eligibleJokers, pseudoseed('cry_speculo')), nil)
                        card:set_edition({negative = true}, true)
                        card:add_to_deck()
                        G.jokers:emplace(card) 
                        return true
                    end}))
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_duplicated_ex')})
                return {calculated = true}
            end
            return
        end
	end
}
local redeo = {
    object_type = "Joker",
	name = "cry-Redeo",
	key = "redeo",
    config = {extra = {ante_reduction = 1, money_req = 10, money_remaining = 0, money_mod = 10}},
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.ante_reduction, center.ability.extra.money_req, center.ability.extra.money_remaining, center.ability.extra.money_mod}}
    end,
	pos = {x = 3, y = 0},
	immune_to_chemach = true,
	loc_txt = {
        name = 'Redeo',
        text = {
            "{C:attention}-#1#{} Ante when",
            "{C:money}$#2#{} {C:inactive}($#3#){} spent",
            "{s:0.8}Requirements increase by",
            "{C:money,s:0.8}$#4#{s:0.8} after each use"
        }
    },
	rarity = "cry_exotic",
	cost = 50,
	atlas = "atlasexotic",
	soul_pos = {x = 4, y = 0, extra = {x = 5, y = 0}},
	calculate = function(self, card, context)
        if context.cry_ease_dollars and context.cry_ease_dollars < 0 and not context.blueprint then
            card.ability.extra.money_remaining = card.ability.extra.money_remaining - context.cry_ease_dollars
            local ante_mod = 0
            while card.ability.extra.money_remaining >= card.ability.extra.money_req do
                card.ability.extra.money_remaining = card.ability.extra.money_remaining - card.ability.extra.money_req
                card.ability.extra.money_req = card.ability.extra.money_req + card.ability.extra.money_mod
                ante_mod = ante_mod - card.ability.extra.ante_reduction
            end
            if ante_mod < 0 then
                ease_ante(ante_mod)
            end
            return {calculated = true}
        end
	end
}
if JokerDisplay then
    redeo.joker_display_definition = {
        reminder_text = {
            { text = "($" },
            { ref_table = "card.ability.extra", ref_value = "money_remaining" },
            { text = "/$" },
            { ref_table = "card.ability.extra", ref_value = "money_req" },
            { text = ")" },
        },
    }
end
local tenebris = {
	object_type = "Joker",
	name = "cry-Tenebris",
	key = "tenebris",
	pos = {x = 3, y = 2},
	soul_pos = {x = 4, y = 2, extra = {x = 5, y = 2}},
	config = {extra = {slots = 25, money = 25}},
	loc_txt = {
      		name = 'Tenebris',
        	text = {
			"{C:dark_edition}+#1#{C:attention} Joker{} slots",
			"Earn {C:money}$#2#{} at end of round"
		}
   	},
	rarity = "cry_exotic",
	cost = 50,
	atlas = "atlasexotic",
	calc_dollar_bonus = function(self, card)
		return card.ability.extra.money
	end,
	loc_vars = function(self, info_queue, center)
		return {vars = {center.ability.extra.slots, center.ability.extra.money}}
	end,
	add_to_deck = function(self, card, from_debuff)
		G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.slots
	end,
	remove_from_deck = function(self, card, from_debuff)
		G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra.slots
	end
}
if JokerDisplay then
    tenebris.joker_display_definition = {
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
        end
    }
end
local effarcire = {
    object_type = "Joker",
	name = "cry-Effarcire",
	key = "effarcire",
	config = {},
	pos = {x = 0, y = 0},
	soul_pos = {x = 1, y = 0, extra = {x = 2, y = 0}},
	loc_txt = {
        name = 'Effarcire',
        text = {
    		'Draw {C:green}full deck{} to hand',
    		'when {C:attention}Blind{} is selected',
    		'{C:inactive,s:0.8}"If you can\'t handle me at my 1x,',
    		'{C:inactive,s:0.8}you don\'t deserve me at my 2x"'
	}
	},
	cost = 50,
	atlas = 'effarcire',
	rarity = "cry_exotic",
	calculate = function(self, card, context)
		if not context.blueprint then
			if context.first_hand_drawn then
				G.FUNCS.draw_from_deck_to_hand(#G.deck.cards)
			elseif G.hand.config.card_limit < 1 then
				G.hand.config.card_limit = 1
			end
		end
	end
}
local effarcire_sprite = {
    object_type = "Atlas",
    key = "effarcire",
    path = "goofy.png",
    px = 71,
    py = 95
}
local crustulum = {
	object_type = "Joker",
	name = "cry-crustulum",
	key = "crustulum",
	config = {extra = {chips = 0, chip_mod = 4,}},
	pos = {x = 0, y = 2},
	soul_pos = {x = 2, y = 2, extra = {x = 1, y = 2}},
	loc_txt = {
        name = 'Crustulum',
        text = {
            "This Joker gains {C:chips}+#2#{} Chips",
            "per {C:attention}reroll{} in the shop",
            "{C:green}All rerolls are free{}",
            "{C:inactive}(Currently {C:chips}+#1#{C:inactive} chips)"
        }
    	},
	rarity = "cry_exotic",
	cost = 50,
	atlas = "atlasexotic",
	blueprint_compat = true,
	perishable_compat = false,
	loc_vars = function(self, info_queue, center)
		return {vars = {center.ability.extra.chips, center.ability.extra.chip_mod}}
	end,
	calculate = function(self, card, context)
    	if context.reroll_shop and not context.blueprint then
        	card.ability.extra.chips = (card.ability.extra.chips) + card.ability.extra.chip_mod
        	card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize{type = 'variable', key = 'a_chips', vars = {card.ability.extra.chips}}, colour = G.C.CHIPS})
		return {calculated = true}
		end
	if context.cardarea == G.jokers and to_big(card.ability.extra.chips) > to_big(0) and not context.before and not context.after then
        return {
            	message = localize{type='variable', key='a_chips', vars={card.ability.extra.chips}},
            	chip_mod = card.ability.extra.chips
        	}
		end
	end,
    add_to_deck = function(self, card, from_debuff)
	    calculate_reroll_cost(true)
	end
}
if JokerDisplay then
    crustulum.joker_display_definition = {
        text = {
            { text = "+" },
            { ref_table = "card.ability.extra", ref_value = "chips", retrigger_type = "mult" }
        },
        text_config = { colour = G.C.CHIPS },
    }
end
--todo: make the Emult always prime
local primus = {
    object_type = "Joker",
    name = "cry-primus",
    key = "primus",
    config = {extra = {Emult = 1.01, Emult_mod = 0.17}},
    pos = {x = 0, y = 4},
    loc_txt = {
        name = 'Primus',
        text = {
            "This Joker gains {X:dark_edition,C:white} ^#1# {} Mult",
            "if all cards in played hand are",
            "{C:attention}Aces{}, {C:attention}2s{}, {C:attention}3s{}, {C:attention}5s{}, or {C:attention}7s{}",
            "{C:inactive}(Currently {X:dark_edition,C:white} ^#2# {C:inactive} Mult)"
        }
    },
    rarity = "cry_exotic",
    cost = 53,
    blueprint_compat = true,
    perishable_compat = false,
    atlas = "atlasexotic",
    soul_pos = {x = 2, y = 4, extra = {x = 1, y = 4}},
    calculate = function(self, card, context)
        local check = true
        if context.cardarea == G.jokers and context.before and not context.blueprint then
			if context.scoring_hand then
				for k, v in ipairs(context.full_hand) do
					if v:get_id() == 4 or v:get_id() == 6 or v:get_id() == 8 or v:get_id() == 9 or v:get_id() == 10 or v:get_id() == 11 or v:get_id() == 12 or v:get_id() == 13 then
						check = false
					end
				end
			end
			if check then
				card.ability.extra.Emult = card.ability.extra.Emult + card.ability.extra.Emult_mod
				return {
					card_eval_status_text(card, 'extra', nil, nil, nil, {
						message = "Upgrade!",
						colour = G.C.DARK_EDITION,
					})
				}   
			end
        end
        if context.cardarea == G.jokers and (to_big(card.ability.extra.Emult) > to_big(1)) and not context.before and not context.after then
            return {
                message = "^"..number_format(card.ability.extra.Emult).." Mult",
                Emult_mod = card.ability.extra.Emult,
                colour = G.C.DARK_EDITION
            }
        end
    end,
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.Emult_mod, center.ability.extra.Emult}}
    end
}
if JokerDisplay then
    primus.joker_display_definition = {
        text = {  
            {
                border_nodes = {
                    { text = "^" },
                    { 
                        ref_table = "card.ability.extra",
                        ref_value = "Emult",
                        retrigger_type = function (number, triggers)
                            local num = number
                            for i=1, triggers-1 do
                                num = num ^ number
                            end
                            return num
                        end
                    }
                },
                border_colour = G.C.DARK_EDITION
            }
        },
        reminder_text = {
            { ref_table = "card.joker_display_values", ref_value = "localized_text" },
        },
        calc_function = function(card)
            card.joker_display_values.localized_text = "(" .. localize("Ace", "ranks") .. ",2,3,5,7)"
        end
    }
end
local big_num_whitelist = {
    j_ride_the_bus = true,
    j_egg = true,
    j_runner = true,
    j_ice_cream = true,
    j_constellation = true,
    j_green_joker = true,
    j_red_card = true,
    j_madness = true,
    j_square = true,
    j_vampire = true,
    j_hologram = true,
    j_obelisk = true,
    j_turtle_bean = true,
    j_lucky_cat = true,
    j_flash = true,
    j_popcorn = true,
    j_trousers = true,
    j_ramen = true,
    j_castle = true,
    j_campfire = true,
    j_throwback = true,
    j_glass = true,
    j_wee = true,
    j_hit_the_road = true,
    j_caino = true,
    j_yorick = true,
    j_cry_dropshot = true,
    j_cry_wee_fib = true,
    j_cry_whip = true,
    j_cry_pickle = true,
    j_cry_chili_pepper = true,
    j_cry_cursor = true,
    j_cry_jimball = true,
    j_cry_eternalflame = true,
    j_cry_fspinner = true,
    j_cry_krustytheclown = true,
    j_cry_antennastoheaven = true,
    j_cry_mondrian = true,
    j_cry_spaceglobe = true,
    j_cry_m = true,
    -- j_cry_bonk = true,
    j_cry_exponentia = true,
    j_cry_crustulum = true,
    j_cry_primus = true,
    j_cry_stella_mortis = true,
    j_cry_hugem = true,
    j_cry_mprime = true
}
local scalae = {
    object_type = "Joker",
    name = "cry-Scalae",
    key = "Scalae",
    pos = {x = 3, y = 4},
    soul_pos = {x = 5, y = 4, extra = {x = 4, y = 4}},
	immune_to_chemach = true,
    loc_txt = {
        name = 'Scalae',
        text = {
            "Scaling {C:attention}Jokers{} scale",
            "as a degree-{C:attention}#1#{} polynomial",
            "raise degree by {C:attention}#2#{}",
			"at end of round",
            "{C:inactive,s:0.8}({C:attention,s:0.8}Scalae{C:inactive,s:0.8} excluded)"
        }
    },
    rarity = "cry_exotic",
    cost = 50,
    atlas = "atlasexotic",
	config = {extra = {scale = 1, scale_mod = 1, shadow_scale = 1, shadow_scale_mod = 1}},
    --todo: support jokers that scale multiple variables
    calculate = function(self, card, context)
        --initialize tracking object
        	card.ability.extra.scale = to_big(card.ability.extra.scale)
        	card.ability.extra.scale_mod = to_big(card.ability.extra.scale_mod)
        	card.ability.extra.shadow_scale = to_big(card.ability.extra.shadow_scale)
        	card.ability.extra.shadow_scale_mod = to_big(card.ability.extra.shadow_scale_mod)
		if context.end_of_round and not context.individual and not context.repetition and not context.blueprint then
			card.ability.extra.scale = card.ability.extra.scale + card.ability.extra.scale_mod
			card.ability.extra.shadow_scale = card.ability.extra.scale
			card.ability.extra.scale = card.ability.extra.shadow_scale
			card.ability.extra.scale_mod = card.ability.extra.shadow_scale_mod
			return {
		                message = localize('k_upgrade_ex'),
		                colour = G.C.DARK_EDITION
		            }
		end
		card.ability.extra.scale = card.ability.extra.shadow_scale
		card.ability.extra.scale_mod = card.ability.extra.shadow_scale_mod
        return
    end,
    cry_scale_mod = function(self, card, joker, orig_scale_scale, true_base, orig_scale_base, new_scale_base)
        if joker.ability.name ~= "cry-Scalae" then
            local new_scale = (to_big(true_base) * ((1 + ((to_big(orig_scale_scale)/to_big(true_base))^(to_big(1)/to_big(card.ability.extra.scale))))^card.ability.extra.scale))
            if (new_scale < to_big(1e100)) or not ((joker.config and joker.config.center and joker.config.center.key and big_num_whitelist[joker.config.center.key]) or (joker.ability and joker.ability.big_num_scaler)) then
                if new_scale >= to_big(1e300) then
                    new_scale = 1e300
                else
                    new_scale = new_scale:to_number()
                end
            end
            return new_scale
        end
	end,
	loc_vars = function(self, info_queue, card)
		return {vars = {number_format(card.ability.extra.scale + 1), number_format(card.ability.extra.scale_mod)}}
	end
}
local stella_mortis = {
    object_type = "Joker",
	name = "cry-Stella Mortis",
	key = "stella_mortis",
	config = {extra = {Emult = 1, Emult_mod = 0.4}},
	pos = {x = 3, y = 5},
	loc_txt = {
        name = 'Stella Mortis',
        text = {
			"This Joker destroys a",
			"random {C:planet}Planet{} card",
			"and gains {X:dark_edition,C:white} ^#1# {} Mult",
			"at the end of the {C:attention}shop{}",
			"{C:inactive}(Currently {X:dark_edition,C:white} ^#2# {C:inactive} Mult)"
        }
    },
	rarity = "cry_exotic",
	cost = 50,
    	blueprint_compat = true,
	perishable_compat = false,
	atlas = "atlasexotic",
	soul_pos = {x = 5, y = 5, extra = {x = 4, y = 5}},
	calculate = function(self, card, context)
        if context.ending_shop then
            local destructable_planet = {}
            for i = 1, #G.consumeables.cards do
                if G.consumeables.cards[i].ability.set == 'Planet' and not G.consumeables.cards[i].getting_sliced and not G.consumeables.cards[i].ability.eternal then destructable_planet[#destructable_planet+1] = G.consumeables.cards[i] end
            end
            local planet_to_destroy = #destructable_planet > 0 and pseudorandom_element(destructable_planet, pseudoseed('stella_mortis')) or nil

            if planet_to_destroy then 
                planet_to_destroy.getting_sliced = true
                card.ability.extra.Emult = card.ability.extra.Emult + card.ability.extra.Emult_mod
                G.E_MANAGER:add_event(Event({func = function()
                    (context.blueprint_card or card):juice_up(0.8, 0.8)
                    planet_to_destroy:start_dissolve({G.C.RED}, nil, 1.6)
                return true end }))
                if not (context.blueprint_card or self).getting_sliced then
                    card_eval_status_text((context.blueprint_card or card), 'extra', nil, nil, nil, {message = "^"..number_format(to_big(card.ability.extra.Emult + card.ability.extra.Emult_mod)).." Mult"})
                end
                return {calculated = true}, true
            end
        end
        if context.cardarea == G.jokers and (to_big(card.ability.extra.Emult) > to_big(1)) and not context.before and not context.after then
            return {
                message = "^"..number_format(card.ability.extra.Emult).." Mult",
                Emult_mod = card.ability.extra.Emult,
                colour = G.C.DARK_EDITION
            }
        end
	end,
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.Emult_mod, center.ability.extra.Emult}}
    end
}
if JokerDisplay then
    stella_mortis.joker_display_definition = {
        text = {
            {
                border_nodes = {
                    { text = "^" },
                    { 
                        ref_table = "card.ability.extra",
                        ref_value = "Emult",
                        retrigger_type = function (number, triggers)
                            local num = number
                            for i=1, triggers-1 do
                                num = num ^ number
                            end
                            return num
                        end
                    }
                },
                border_colour = G.C.DARK_EDITION
            }
        },
    }
end
local circulus_pistoris = {
    	object_type = "Joker",
	name = "cry-Circulus Pistoris",
	key = "circulus_pistoris",
    	config = {extra = {Emult =math.pi, Echips =math.pi, hands_remaining = 3}},
	pos = {x = 0, y = 3},
	loc_txt = {
        name = 'Circulus Pistoris',
        text = {
	    "{X:dark_edition,C:white}^#1#{} Chips, {X:dark_edition,C:white}^#1#{} Mult",
	    "if {C:attention}exactly{} #2#",
        "hands remaining"
        }
    	},
	rarity = "cry_exotic",
	cost = 10*math.pi,
	blueprint_compat = true,
	atlas = "atlasexotic",
	soul_pos = {x = 2, y = 3, extra = {x = 1, y = 3}},
	loc_vars = function(self, info_queue, center)
        return {vars = {center.edition and center.edition.cry_oversat and "tau" or "pi", center.ability.extra.hands_remaining}}
    	end,
    calculate = function(self, card, context)
            if context.joker_main and (G.GAME.current_round.hands_left >= card.ability.extra.hands_remaining and G.GAME.current_round.hands_left < card.ability.extra.hands_remaining + 1) then
                local pi = math.pi
                if card.edition and card.edition.cry_oversat then
                    pi = 2 * pi
                end
                return {
                    Echip_mod = pi,
                    Emult_mod = pi,
                    message = "^"..(card.edition and card.edition.cry_oversat and "tau" or "pi").." Mult+Chips",
                    colour = {0.8, 0.45, 0.85, 1} --plasma colors
                }
            end
    end,
}
if JokerDisplay then
	circulus_pistoris.joker_display_definition = {
		text = {
			{ text = "^",                       colour = G.C.CHIPS },
			{ ref_table = "card.ability.extra", ref_value = "Echips", colour = G.C.CHIPS },
			{ text = "^",                       colour = G.C.MULT },
			{ ref_table = "card.ability.extra", ref_value = "Emult", colour = G.C.MULT },
		},
		extra = {
			
		
				{ ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.UI.TEXT_INACTIVE, scale = 0.3 }
		},
		calc_function = function(card)
			card.joker_display_values.localized_text = "(" .. localize("k_round") .. ")"
		end
	}
end
local aequilibrium = {
	object_type = "Joker",
	name = "Ace Aequilibrium", --WARNING!!!! if name is changed, the aeqactive function in Cryptid.lua's create_card must also be changed since it checks for this!
        key = 'equilib',
        loc_txt = {
            name = "Ace Aequilibrium",
            text = {
                "Jokers appear using the",
		"order from the {C:attention}Collection{}",
                "Create {C:attention}#1#{} {C:dark_edition}Negative{} Joker(s)",
		"when hand is played",
            }
        },
        config = {extra = {jokers = 2, num = 1}},
        rarity = "cry_exotic",
        pos = {x = 7, y = 0},
        soul_pos = {x = 6, y = 0, extra = {x = 8, y = 0}},
        atlas = 'atlasexotic',
        cost = 50,
        unlocked = true,
        discovered = true,
        blueprint_compat = true,
	immune_to_chemach = true,
        eternal_compat = true,
        perishable_compat = true,
        loc_vars = function(self, info_queue, center)
            info_queue[#info_queue+1] = G.P_CENTERS.e_negative
            return {vars = {center.ability.extra.jokers,}}
        end,
        calculate = function(self, card, context)
            if context.cardarea == G.jokers and context.before and not context.retrigger_joker then
                for i = 1, math.min(200, card.ability.extra.jokers) do
                    local newcard = create_card('Joker', G.jokers, nil, nil, nil, nil, nil)
                    newcard:add_to_deck()
                    G.jokers:emplace(newcard)
                    newcard:set_edition({negative = true}, true)
                end
                --return {}
            end
        end,
    }
return {name = "Exotic Jokers", 
        init = function()
            cry_enable_exotics = true
            --Universum Patches
            local uht = update_hand_text
            function update_hand_text(config, vals)
                if next(find_joker("cry-Universum")) and not Talisman.config_file.disable_anims then
                    G.E_MANAGER:add_event(Event({--This is the Hand name text for the poker hand
                    trigger = 'before',
                    blockable = not config.immediate,
                    delay = config.delay or 0.8,
                    func = function()
                        local col = G.C.GREEN
                        if vals.chips and G.GAME.current_round.current_hand.chips ~= vals.chips then
                            local delta = vals.chips
                            if is_number(vals.chips) and is_number(G.GAME.current_round.current_hand.chips) then delta = 'X'..number_format(vals.chips / G.GAME.current_round.current_hand.chips) end
                            G.GAME.current_round.current_hand.chips = vals.chips
                            G.hand_text_area.chips:update(0)
                            if vals.StatusText then 
                                attention_text({
                                    text = delta,
                                    scale = 0.8, 
                                    hold = 1,
                                    cover = G.hand_text_area.chips.parent,
                                    cover_colour = mix_colours(G.C.CHIPS, col, 0.1),
                                    emboss = 0.05,
                                    align = 'cm',
                                    cover_align = 'cr'
                                })
                            end
                        end
                        if vals.mult and G.GAME.current_round.current_hand.mult ~= vals.mult then
                            local delta = vals.mult
                            if is_number(vals.mult) and is_number(G.GAME.current_round.current_hand.mult) then delta = 'X'..number_format(vals.mult / G.GAME.current_round.current_hand.mult) end
                            G.GAME.current_round.current_hand.mult = vals.mult
                            G.hand_text_area.mult:update(0)
                            if vals.StatusText then 
                                attention_text({
                                    text = delta,
                                    scale = 0.8, 
                                    hold = 1,
                                    cover = G.hand_text_area.mult.parent,
                                    cover_colour = mix_colours(G.C.MULT, col, 0.1),
                                    emboss = 0.05,
                                    align = 'cm',
                                    cover_align = 'cl'
                                })
                            end
                            if not G.TAROT_INTERRUPT then G.hand_text_area.mult:juice_up() end
                        end
                        if vals.handname and G.GAME.current_round.current_hand.handname ~= vals.handname then
                            G.GAME.current_round.current_hand.handname = vals.handname
                            if not config.nopulse then 
                                G.hand_text_area.handname.config.object:pulse(0.2)
                            end
                        end
                        if vals.chip_total then G.GAME.current_round.current_hand.chip_total = vals.chip_total;G.hand_text_area.chip_total.config.object:pulse(0.5) end
                        if vals.level and G.GAME.current_round.current_hand.hand_level ~= ' '..localize('k_lvl')..tostring(vals.level) then
                            if vals.level == '' then
                                G.GAME.current_round.current_hand.hand_level = vals.level
                            else
                                G.GAME.current_round.current_hand.hand_level = ' '..localize('k_lvl')..tostring(vals.level)
                                if is_number(vals.level) then 
                                    G.hand_text_area.hand_level.config.colour = G.C.HAND_LEVELS[math.min(vals.level, 7)]
                                else
                                    G.hand_text_area.hand_level.config.colour = G.C.HAND_LEVELS[1]
                                end
                                G.hand_text_area.hand_level:juice_up()
                            end
                        end
                        if config.sound and not config.modded then play_sound(config.sound, config.pitch or 1, config.volume or 1) end
                        if config.modded then 
                            if G.HUD_blind and G.HUD_blind.get_UIE_by_ID and G.HUD_blind:get_UIE_by_ID('HUD_blind_debuff_1') and G.HUD_blind:get_UIE_by_ID('HUD_blind_debuff_2') then
                                G.HUD_blind:get_UIE_by_ID('HUD_blind_debuff_1'):juice_up(0.3, 0)
                                G.HUD_blind:get_UIE_by_ID('HUD_blind_debuff_2'):juice_up(0.3, 0)
                            end
                            G.GAME.blind:juice_up()
                            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.06*G.SETTINGS.GAMESPEED, blockable = false, blocking = false, func = function()
                                play_sound('tarot2', 0.76, 0.4);return true end}))
                            play_sound('tarot2', 1, 0.4)
                        end
                        return true
                    end}))
                else
                    uht(config, vals)
                end
            end

            --Redeo Patches
            local ed = ease_dollars
            function ease_dollars(mod, x)
                ed(mod,x)
                for i = 1, #G.jokers.cards do
                    local effects = G.jokers.cards[i]:calculate_joker({cry_ease_dollars = mod})
                    if effects and effects.joker_repetitions then
                        rep_list = effects.joker_repetitions
                        for z=1, #rep_list do
                            if type(rep_list[z]) == 'table' and rep_list[z].repetitions then
                                for r=1, rep_list[z].repetitions do
                                    card_eval_status_text(rep_list[z].card, 'jokers', nil, nil, nil, rep_list[z])
                                    if percent then percent = percent+percent_delta end
                                    G.jokers.cards[i]:calculate_joker({cry_ease_dollars = mod, retrigger_joker = true})
                                end
                            end
                        end
                    end
                end
            end
        end,
        items = {gateway_sprite, gateway, iterum, universum, exponentia, speculo, redeo, tenebris, effarcire, effarcire_sprite, crustulum, primus, scalae, stella_mortis, circulus_pistoris, aequilibrium}}
