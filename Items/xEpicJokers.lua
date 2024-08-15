cry_enable_epics = false
local supercell = {
    	object_type = "Joker",
	name = "cry-supercell",
	key = "supercell",
    	config = {extra = {stat1 = 15, stat2 = 2, money = 3}},
	pos = {x = 5, y = 1},
	loc_txt = {
        name = 'Supercell',
        text = {
            "{C:chips}+#1#{} Chips, {C:mult}+#1#{} Mult,",
	    "{X:chips,C:white}X#2#{} Chips, {X:mult,C:white}X#2#{} Mult",
	    "Earn {C:money}$#3#{} at",
	    "end of round"
        }
    	},
	rarity = "cry_epic",
	cost = 14,
	blueprint_compat = true,
	atlas = "atlasepic",
    	loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.stat1, center.ability.extra.stat2, center.ability.extra.money}}
    	end,
    	calculate = function(self, card, context)
        	if context.cardarea == G.jokers and not context.before and not context.after then
			if card.ability.extra.stat2 > 1 then --misprint deck moment
				return {
				message = "Gaming!",
				chip_mod = card.ability.extra.stat1,
				mult_mod = card.ability.extra.stat1,
				Xchip_mod = card.ability.extra.stat2,
				Xmult_mod = card.ability.extra.stat2
				}
			end
        	end
    	end,
	calc_dollar_bonus = function(self, card)
		if card.ability.extra.money > 0 then
			return card.ability.extra.money
		end
	end
}
if JokerDisplay then
	supercell.joker_display_definition = {
		text = {
			{ text = "+",                       colour = G.C.CHIPS },
			{ ref_table = "card.ability.extra", ref_value = "stat1", colour = G.C.CHIPS },
			{ text = " +",                      colour = G.C.MULT },
			{ ref_table = "card.ability.extra", ref_value = "stat1", colour = G.C.MULT },
		},
		extra = {
			{
				{
					border_nodes = {
						{ text = "X" },
						{ ref_table = "card.ability.extra", ref_value = "stat2" }
					},
					border_colour = G.C.CHIPS
				},
				{ text = " " },
				{
					border_nodes = {
						{ text = "X" },
						{ ref_table = "card.ability.extra", ref_value = "stat2" }
					}
				}
			},
			{
				{ text = "+$",                             colour = G.C.GOLD },
				{ ref_table = "card.ability.extra",        ref_value = "money",          colour = G.C.GOLD },
				{ ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.UI.TEXT_INACTIVE, scale = 0.3 }
			}
		},
		calc_function = function(card)
			card.joker_display_values.localized_text = "(" .. localize("k_round") .. ")"
		end
	}
end
local googol_play = {
	object_type = "Joker",
	name = "cry-Googol Play Card",
	key = "googol_play",
	config = {extra = {Xmult = 1e100, odds = 8}},
	pos = {x = 3, y = 0},
	loc_txt = {
        name = 'Googol Play Card',
        text = {
			"{C:green}#1# in #2#{} chance for",
			"{X:red,C:white} X#3# {} Mult"
		}
    },
	rarity = "cry_epic",
	cost = 10,
	blueprint_compat = true,
	atlas = "atlasepic",
	soul_pos = {x = 10, y = 0, extra = {x = 4, y = 0}},
	loc_vars = function(self, info_queue, center)
		return {vars = {''..(G.GAME and G.GAME.probabilities.normal or 1), center.ability.extra.odds, center.ability.extra.Xmult}}
	end,
	calculate = function(self, card, context)
		if context.cardarea == G.jokers and not context.before and not context.after then
			if pseudorandom('cry_googol_play') < G.GAME.probabilities.normal/card.ability.extra.odds then
				return {
					message = localize{type='variable',key='a_xmult',vars={card.ability.extra.Xmult}},
					Xmult_mod = card.ability.extra.Xmult
				}
			else return {calculated = true} end
		end
	end,
}
if JokerDisplay then
	googol_play.joker_display_definition = {
		text = {
			{
				border_nodes = {
					{ text = "X" },
					{ ref_table = "card.ability.extra", ref_value = "Xmult" }
				}
			}
		},
		extra = {
			{
				{ text = "(" },
				{ ref_table = "card.joker_display_values", ref_value = "odds" },
				{ text = " in " },
				{ ref_table = "card.ability.extra",        ref_value = "odds" },
				{ text = ")" },
			}
		},
		extra_config = { colour = G.C.GREEN, scale = 0.3 },
		calc_function = function(card)
			card.joker_display_values.odds = G.GAME and G.GAME.probabilities.normal or 1
		end
	}
end
local sync_catalyst = {
	object_type = "Joker",
	name = "cry-Sync Catalyst",
	key = "sync_catalyst",
	pos = {x = 5, y = 2},
	loc_txt = {
        name = 'Sync Catalyst',
        text = {
			"Balances {C:chips}Chips{} and {C:mult}Mult{}",
			"{C:inactive,s:0.8}Hey! I\'ve seen this one before!"
		}
    },
	rarity = "cry_epic",
	cost = 12,
	blueprint_compat = true,
	atlas = "atlasepic",
	calculate = function(self, card, context)
		if context.cardarea == G.jokers and not context.before and not context.after then
			local tot = hand_chips + mult
			hand_chips = mod_chips(math.floor(tot/2))
			mult = mod_mult(math.floor(tot/2))
			update_hand_text({delay = 0}, {mult = mult, chips = hand_chips})
			return {
				message = localize('k_balanced'),
				colour = {0.8, 0.45, 0.85, 1}
			}
		end
	end,
}
local negative = {
	object_type = "Joker",
	name = "cry-Negative Joker",
	key = "negative",
	pos = {x = 1, y = 3},
	config = {extra = 4},
	loc_txt = {
        name = 'Negative Joker',
        text = {
			"{C:dark_edition}+#1#{C:attention} Joker{} slots"
		}
    },
	rarity = "cry_epic",
	cost = 10,
	atlas = "atlasepic",
	loc_vars = function(self, info_queue, center)
		return {vars = {center.ability.extra}}
	end,
	add_to_deck = function(self, card, from_debuff)
		G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra
	end,
	remove_from_deck = function(self, card, from_debuff)
		G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra
	end
}
local canvas = {
	object_type = "Joker",
	name = "cry-Canvas",
	key = "canvas",
	pos = {x = 2, y = 1},
	config = {num_retriggers = 0},
	loc_txt = {
        name = 'Canvas',
        text = {
			"{C:attention}Retrigger{} all {C:attention}Jokers{} to the left",
			"once for {C:attention}every{} non-{C:blue}Common{C:attention} Joker{}",
			"to the right of this Joker"
		}
    	},
	rarity = "cry_epic",
	cost = 18,
	blueprint_compat = true,
	atlas = "atlasepic",
	calculate = function(self, card, context)
		if context.retrigger_joker_check and not context.retrigger_joker then
			self.config.num_retriggers = 0
			for i = 1, #G.jokers.cards do
				if card.T.x + card.T.w/2 < G.jokers.cards[i].T.x + G.jokers.cards[i].T.w/2 and G.jokers.cards[i].config.center.rarity ~= 1 then
					self.config.num_retriggers = self.config.num_retriggers + 1
				end
			end
			if card.T.x + card.T.w/2 > context.other_card.T.x + context.other_card.T.w/2 then
				return {
					message = localize('k_again_ex'),
					repetitions = self.config.num_retriggers,
					card = card
				}
			end
		end
	end,
}
if JokerDisplay then
	canvas.joker_display_definition = {
		text = {
			{ text = "x" },
			{ ref_table = "card.joker_display_values", ref_value = "num_retriggers" },
		},
		calc_function = function(card)
			local num_retriggers = 0
			if G.jokers then
				for i = 1, #G.jokers.cards do
					if card.T.x + card.T.w / 2 < G.jokers.cards[i].T.x + G.jokers.cards[i].T.w / 2 and G.jokers.cards[i].config.center.rarity ~= 1 then
						num_retriggers = num_retriggers + 1
					end
				end
			end
			card.joker_display_values.num_retriggers = num_retriggers
		end
	}
end
local error_joker = {
	object_type = "Joker",
	name = "cry-Error",
	key = "error",
	pos = {x = 4, y = 2},
	config = {extra = {sell_rounds = 0, active = false}},
	loc_txt = {
        name = '{C:red}ERR{}{C:dark_edition}O{}{C:red}R{}',
        text = {
			""
		}
    },
	rarity = "cry_epic",
	cost = 1,
	blueprint_compat = false,
	eternal_compat = false,
	atlas = "atlasepic",
	add_to_deck = function(self, card, from_debuff)
		if G.GAME.modifiers.cry_force_edition and not G.GAME.modifiers.cry_force_edition_from_deck then
			G.GAME.modifiers.cry_force_edition_from_deck = G.GAME.modifiers.cry_force_edition
		elseif not G.GAME.modifiers.cry_force_edition_from_deck then
			G.GAME.modifiers.cry_force_edition = 'cry_glitched'
			G.GAME.modifiers.cry_force_edition_from_deck = "Nope!"
		end
	end,
	remove_from_deck = function(self, card, from_debuff)
		if G.GAME.modifiers.cry_force_edition_from_deck ~= "Nope!" then
			G.GAME.modifiers.cry_force_edition = G.GAME.modifiers.cry_force_edition_from_deck
		else
			G.GAME.modifiers.cry_force_edition = nil
		end
	end,
	calculate = function(self, card, context)
		if context.end_of_round and not context.blueprint and not context.repetition and not card.ability.extra.active then
			if card.ability.extra.sell_rounds == 0 then
				card.ability.extra.sell_rounds = math.floor(pseudorandom(pseudoseed("cry_error"))*10+1)
			end
			card.ability.extra.sell_rounds = card.ability.extra.sell_rounds - 1;
			if card.ability.extra.sell_rounds == 0 then
				card.ability.extra.active = true
				local eval = function(card) return not card.REMOVED end
				juice_card_until(self, eval, true)
			end
			return {
				message = "???",
				colour = G.C.BLACK
			}
		end
		if context.selling_self and card.ability.extra.active and not context.retrigger_joker and not context.blueprint then
			local eval = function(card) return (card and card.ability and card.ability.loyalty_remaining == 0) and not G.RESET_JIGGLES end
                                    juice_card_until(self, eval, true)
			local jokers = {}
			for i=1, #G.jokers.cards do 
				if G.jokers.cards[i].ability.name ~= "cry-Error" then
					jokers[#jokers+1] = G.jokers.cards[i]
				end
			end
			for i = 1, #jokers do
				local card = copy_card(jokers[i])
				card:add_to_deck()
				G.jokers:emplace(card)
			end
			return
		end
	end
}
if JokerDisplay then
	error_joker.joker_display_definition = {
		text = {
			{
				dynatext = {
					-- Maybe this can be defined before so we don't have to hard code the value
					string = {"+","-","X","/","^","=",">","<","m"},
					colours = { G.C.DARK_EDITION, },
					pop_in_rate = 9999999,
					silent = true,
					random_element = true,
					pop_delay = 0.30,
					scale = 0.4,
					min_cycle_time = 0
				}
			},
			{
				dynatext = {
					string = {"0","1","2","3","4","5","6","7","8","9","10","69","404","420","-1","0.5","m","nan","inf","nil","pi","1e9","???"},
					colours = { G.C.DARK_EDITION, },
					pop_in_rate = 9999999,
					silent = true,
					random_element = true,
					pop_delay = 0.33,
					scale = 0.4,
					min_cycle_time = 0
				}
			},
		},
	}
end
local m = {
	object_type = "Joker",
	name = "cry-m",
	key = "m",
	pos = {x = 3, y = 1},
	config = {extra = {extra = 13, x_mult = 1}, jolly = {t_mult = 8, type = 'Pair'}},
	loc_txt = {
        name = 'm',
        text = {
			"This Joker gains {X:mult,C:white} X#1# {} Mult",
			"when {C:attention}Jolly Joker{} is sold",
			"{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)"
		}
    },
	rarity = "cry_epic",
	cost = 13,
	perishable_compat = false,
	blueprint_compat = true,loc_vars = function(self, info_queue, center)
		info_queue[#info_queue+1] = { set = 'Joker', key = 'j_jolly', specific_vars = {self.config.jolly.t_mult, self.config.jolly.type} }
        return {vars = {center.ability.extra.extra, center.ability.extra.x_mult}}
    end,
	atlas = "atlasepic",
	calculate = function(self, card, context)
        if context.cardarea == G.jokers and (to_big(card.ability.extra.x_mult) > to_big(1)) and not context.before and not context.after then
            return {
                message = localize{type='variable',key='a_xmult',vars={card.ability.extra.x_mult}},
                Xmult_mod = card.ability.extra.x_mult
            }
        end
		if context.selling_card and context.card.ability.name == "Jolly Joker" and not context.blueprint then
			card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.extra
			card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize{type = 'variable', key = 'a_xmult', vars = {card.ability.extra.x_mult}}})
			return {calculated = true}
		end
	end
}
if JokerDisplay then
	m.joker_display_definition = {
		text = {
			{
				border_nodes = {
					{ text = "X" },
					{ ref_table = "card.ability.extra", ref_value = "x_mult" }
				}
			}
		},
	}
end
local M = {
	object_type = "Joker",
	name = "cry-M",
	key = "M",
	pos = {x = 0, y = 0},
	config = {jolly = {t_mult = 8, type = 'Pair'}},
	loc_txt = {
        name = 'M',
        text = {
			"Create a {C:dark_edition}Negative{}",
			"{C:attention}Jolly Joker{} when",
			"{C:attention}Blind{} is selected"
		}
    },
	rarity = "cry_epic",
	cost = 13,
	blueprint_compat = true,loc_vars = function(self, info_queue, center)
		info_queue[#info_queue+1] = { set = 'Joker', key = 'j_jolly', specific_vars = {self.config.jolly.t_mult, self.config.jolly.type} }
		info_queue[#info_queue+1] = G.P_CENTERS.e_negative
    end,
	atlas = "atlasepic",
	calculate = function(self, card, context)
        if context.setting_blind and not (context.blueprint_card or self).getting_sliced then
			local card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_jolly')
			card:set_edition({
				negative = true
			})
			card:add_to_deck()
			G.jokers:emplace(card)
			return {completed=true}
		end
	end
}

local CodeJoker = {
	object_type = "Joker",
	name = "cry-CodeJoker",
	key = "CodeJoker",
	pos = {x = 2, y = 4},
	loc_txt = {
        name = 'Code Joker',
        text = {
			"Create a {C:dark_edition}Negative{}",
			"{C:code}Code Card{} when",
			"{C:attention}Blind{} is selected"
		}
    },
	rarity = "cry_epic",
	cost = 11,
	blueprint_compat = true,
	atlas = "atlasepic",
	calculate = function(self, card, context)
        if context.setting_blind and not (context.blueprint_card or self).getting_sliced then
			play_sound('timpani')
			local card = create_card('Code', G.consumables, nil, nil, nil, nil)
			card:set_edition({
				negative = true
			})
			card:add_to_deck()
			G.consumeables:emplace(card)
			card:juice_up(0.3, 0.5)
			return {completed=true}
		end
	end
}

local copypaste = {
	object_type = "Joker",
	name = "cry-copypaste",
	key = "copypaste",
	pos = {x = 3, y = 4},
	config = {extra = {odds = 2, ckt = 0}},
	loc_txt = {
        name = 'Copy/Paste',
        text = {
			"When a {C:code}Code{} card is used,",
                "{C:green}#1# in #2#{} chance to add a copy",
                "to your consumable area",
                "{C:inactive}(Must have room)"
		}
    },
	rarity = "cry_epic",
	cost = 14,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, center)
		return {vars = {''..(G.GAME and G.GAME.probabilities.normal or 1), center.ability.extra.odds}}
    end,
	atlas = "atlasepic",
	calculate = function(self, card, context)
		if context.using_consumeable and context.consumeable.ability.set == 'Code' and not context.consumeable.beginning_end then
			if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
				if pseudorandom("cry_copypaste_joker") < G.GAME.probabilities.normal/card.ability.extra.odds then
					if G.GAME.probabilities.normal >= card.ability.extra.odds and context.consumeable.from_copypaste then
						card.ability.extra.ckt = card.ability.extra.ckt + 1
					else
						card.ability.extra.ckt = 0
					end
					G.E_MANAGER:add_event(Event({
                        func = function() 
                            local cards = copy_card(context.consumeable)
                            if card.ability.extra.ckt >= 10 then 
                                cards.beginning_end = true
                                card.ability.extra.ckt = 0
                            else
                                cards.from_from_copypaste = true
                            end
                            cards:add_to_deck()
                            G.consumeables:emplace(cards) 
                            return true
                        end}))
                    card_eval_status_text(context.blueprint_cards or card, 'extra', nil, nil, nil, {message = localize('k_copied_ex')})
                end
            end
        end
	end
}
if JokerDisplay then
	copypaste.joker_display_definition = {
		extra = {
			{
				{ text = "(" },
				{ ref_table = "card.joker_display_values", ref_value = "odds" },
				{ text = " in " },
				{ ref_table = "card.ability.extra",        ref_value = "odds" },
				{ text = ")" },
			}
		},
		extra_config = { colour = G.C.GREEN, scale = 0.3 },
		calc_function = function(card)
			card.joker_display_values.odds = G.GAME and G.GAME.probabilities.normal or 1
		end
	}
end

local boredom = {
	object_type = "Joker",
	name = "cry-Boredom",
	key = "boredom",
	pos = {x = 1, y = 0},
	config = {extra = {odds = 2}},
	loc_txt = {
        name = 'Boredom',
        text = {
			"{C:green}#1# in #2#{} chance to",
			"{C:attention}retrigger{} each {C:attention}Joker{}",
			"or {C:attention}played card{}",
			"{C:inactive,s:0.8}Does not affect other Boredom{}"
		}
    },
	rarity = "cry_epic",
	cost = 14,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, center)
		return {vars = {''..(G.GAME and G.GAME.probabilities.normal or 1), center.ability.extra.odds}}
    end,
	atlas = "atlasepic",
	calculate = function(self, card, context)
        if context.retrigger_joker_check and not context.retrigger_joker and context.other_card ~= self then
			if pseudorandom("cry_boredom_joker") < G.GAME.probabilities.normal/card.ability.extra.odds then
				return {
					message = localize('k_again_ex'),
					repetitions = 1,
					card = card
				}
			else return {calculated = true} end
        end
		if context.repetition and context.cardarea == G.play then
			if pseudorandom("cry_boredom_card") < G.GAME.probabilities.normal/card.ability.extra.odds then
				return {
					message = localize('k_again_ex'),
					repetitions = 1,
					card = card
				}
			else
				return {calculated = true}
			end
		end
	end
}
if JokerDisplay then
	boredom.joker_display_definition = {
		extra = {
			{
				{ text = "(" },
				{ ref_table = "card.joker_display_values", ref_value = "odds" },
				{ text = " in " },
				{ ref_table = "card.ability.extra",        ref_value = "odds" },
				{ text = ")" },
			}
		},
		extra_config = { colour = G.C.GREEN, scale = 0.3 },
		calc_function = function(card)
			card.joker_display_values.odds = G.GAME and G.GAME.probabilities.normal or 1
		end
	}
end
local number_blocks = {
    object_type = "Joker",
    name = "cry-Number Blocks",
    key = "number_blocks",
    config = {extra = {money_mod = 1, money = 0}},
    pos = {x = 0, y = 2},
    loc_txt = {
        name = 'Number Blocks',
        text = {
            "Earn {C:money}$#1#{} at end of round",
            "Increase payout by {C:money}$#2#{}",
            "for each {C:attention}#3#{} held in hand,",
            "rank changes every round"
        }
    },
    rarity = "cry_epic",
    cost = 14,
    atlas = "atlasepic",
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.money, center.ability.extra.money_mod, localize(G.GAME.current_round.cry_nb_card and G.GAME.current_round.cry_nb_card.rank or "Ace", 'ranks')}}
    end,
    calculate = function(self, card, context)
        if context.individual and not context.end_of_round and context.cardarea == G.hand and not context.blueprint and not context.before and not context.after and context.other_card:get_id() == G.GAME.current_round.cry_nb_card.id then
            if context.other_card.debuff then
                return {
                    message = localize('k_debuffed'),
                    colour = G.C.RED,
                    card = card
                }
            else
                card.ability.extra.money = card.ability.extra.money + card.ability.extra.money_mod
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_upgrade_ex')})
                return {calculated = true}
            end
        end
    end,
    calc_dollar_bonus = function(self, card)
        if card.ability.extra.money > 0 then
            return card.ability.extra.money
        end
    end
}
if JokerDisplay then
	number_blocks.joker_display_definition = {
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
			card.joker_display_values.localized_text_rank = "(" ..
				localize(G.GAME.current_round.cry_nb_card and G.GAME.current_round.cry_nb_card.rank or "Ace", 'ranks') ..
				") "
			card.joker_display_values.localized_text_round = "(" .. localize("k_round") .. ")"
		end
	}
end

local double_scale = {
    object_type = "Joker",
    name = "cry-Double Scale",
    key = "Double Scale",
    pos = {x = 0, y = 3},
    loc_txt = {
        name = 'Double Scale',
        text = {
            "Scaling {C:attention}Jokers{}",
            "scale {C:attention}quadratically",
            "{C:inactive,s:0.8}(ex. +1, +3, +6, +10)",
            "{C:inactive,s:0.8}(grows by +1, +2, +3)"
        }
    },
    rarity = "cry_epic",
    cost = 18,
    atlas = "atlasepic",
    --todo: support jokers that scale multiple variables
    calculate = function(self, card, context)
        --initialize tracking object
        if not G.GAME.cry_double_scale then
            G.GAME.cry_double_scale = {double_scale = true} --doesn't really matter what's in here as long as there's something
        end
        for i = 1, #G.jokers.cards do
		if G.jokers.cards[i].ability.name ~= "cry-happyhouse"
	    or G.jokers.cards[i].ability.name ~= "cry-sapling"
	    or G.jokers.cards[i].ability.name ~= "cry-mstack"
	    or G.jokers.cards[i].ability.name ~= "cry-notebook" then
            --sort_id is a unique ID for each Joker
            local jkr = G.jokers.cards[i]
            if jkr.ability and type(jkr.ability) == 'table' then
                if not G.GAME.cry_double_scale[jkr.sort_id] then
                    G.GAME.cry_double_scale[jkr.sort_id] = {ability = {double_scale = true}}
                    for k, v in pairs(jkr.ability) do
                        if type(jkr.ability[k]) ~= 'table' then
                            G.GAME.cry_double_scale[jkr.sort_id].ability[k] = v
                        else
                            G.GAME.cry_double_scale[jkr.sort_id].ability[k] = {}
                            for _k, _v in pairs(jkr.ability[k]) do
                                G.GAME.cry_double_scale[jkr.sort_id].ability[k][_k] = _v
                            end
                        end
                    end
                elseif not G.GAME.cry_double_scale[jkr.sort_id].scaler then
                    dbl_info = G.GAME.cry_double_scale[jkr.sort_id]
					if jkr.ability.name == "cry-Number Blocks" then
						dbl_info.base = {"extra", "money"}
						dbl_info.scaler = {"extra", "money_mod"}
						dbl_info.scaler_base = jkr.ability.extra.money_mod
						dbl_info.offset = 1
						return
					end
					if jkr.ability.name == "cry-Exponentia" then
						dbl_info.base = {"extra", "Emult"}
						dbl_info.scaler = {"extra", "Emult_mod"}
						dbl_info.scaler_base = jkr.ability.extra.Emult_mod
						dbl_info.offset = 1
						return
					end
					if jkr.ability.name == "cry-Redeo" then
						dbl_info.base = {"extra", "money_req"}
						dbl_info.scaler = {"extra", "money_mod"}
						dbl_info.scaler_base = jkr.ability.extra.money_mod
						dbl_info.offset = 1
						return
					end
					if jkr.ability.name == "cry-Chili Pepper" then
						dbl_info.base = {"extra", "Xmult"}
						dbl_info.scaler = {"extra", "Xmult_mod"}
						dbl_info.scaler_base = jkr.ability.extra.Xmult_mod
						dbl_info.offset = 1
						return
					end
					if jkr.ability.name == "cry-Scalae" then
						dbl_info.base = {"extra", "shadow_scale"}
						dbl_info.scaler = {"extra", "shadow_scale_mod"}
						dbl_info.scaler_base = jkr.ability.extra.scale_mod
						dbl_info.offset = 1
						return
					end
					if jkr.ability.name == "Yorick" then
						dbl_info.base = {"x_mult"}
						dbl_info.scaler = {"extra", "xmult"} --not kidding
						dbl_info.scaler_base = 1
						dbl_info.offset = 1
						return
					end
					if jkr.ability.name == "Hologram" then
						dbl_info.base = {"x_mult"}
						dbl_info.scaler = {"extra"}
						dbl_info.scaler_base = jkr.ability.extra
						dbl_info.offset = 1
						return
					end
					if jkr.ability.name == "Gift Card" then
						dbl_info.base = {"extra_value"}
						dbl_info.scaler = {"extra"}
						dbl_info.scaler_base = jkr.ability.extra
						dbl_info.offset = 1
						return
					end
					if jkr.ability.name == "Throwback" then
						dbl_info.base = {"x_mult"}
						dbl_info.scaler = {"extra"}
						dbl_info.scaler_base = jkr.ability.x_mult or 1
						dbl_info.offset = 1
						return
					end
					if jkr.ability.name == "Egg" then
						dbl_info.base = {"extra_value"}
						dbl_info.scaler = {"extra"}
						dbl_info.scaler_base = jkr.ability.extra
						dbl_info.offset = 1
						return
					end
                    for k, v in pairs(jkr.ability) do
						--extra_value is ignored because it can be scaled by Gift Card
                        if k ~= "extra_value" and dbl_info.ability[k] ~= v and is_number(v) and is_number(dbl_info.ability[k]) then
                            dbl_info.base = {k}
                            local predicted_mod = math.abs(to_big(v):to_number()-to_big(dbl_info.ability[k]):to_number())
                            local best_key = {""}
                            local best_coeff = 10^100
                            for l, u in pairs(jkr.ability) do
                                if l ~= k and is_number(u) then
                                    if predicted_mod/u >= 0.999 and predicted_mod/u < best_coeff then
                                        best_coeff = predicted_mod/u
                                        best_key = {l}
                                    end
                                end
                                if type(jkr.ability[l]) == 'table' then
                                    for _l, _u in pairs(jkr.ability[l]) do 
                                        if is_number(_u) and predicted_mod/_u >= 0.999 and predicted_mod/_u < best_coeff then
                                            best_coeff = predicted_mod/_u
                                            best_key = {l,_l}
                                        end
                                    end
                                end
                            end
                            dbl_info.scaler = best_key
                        end
                        if type(jkr.ability[k]) == 'table' and type(dbl_info.ability) == 'table' and type(dbl_info.ability[k]) == 'table' then
                            for _k, _v in pairs(jkr.ability[k]) do
                                if dbl_info.ability[k][_k] ~= _v and is_number(_v) and is_number(dbl_info.ability[k][_k]) then
                                    dbl_info.base = {k,_k}
                                    local predicted_mod = math.abs(_v-dbl_info.ability[k][_k])
                                    local best_key = {""}
                                    local best_coeff = 10^100
                                    for l, u in pairs(jkr.ability) do
                                        if is_number(u) and predicted_mod/u >= 0.999 then
                                            if predicted_mod/u < best_coeff then
                                                best_coeff = predicted_mod/u
                                                best_key = {l}
                                            end
                                        end
                                        if type(jkr.ability[l]) == 'table' then
                                            for _l, _u in pairs(jkr.ability[l]) do 
                                                if (l ~= k or _l ~= _k) and is_number(_u) and predicted_mod/_u >= 0.999 then
                                                    if predicted_mod/_u < best_coeff then
                                                        best_coeff = predicted_mod/_u
                                                        best_key = {l,_l}
                                                    end
                                                end
                                            end
                                        end
                                    end
                                    dbl_info.scaler = best_key
                                end
                            end
                        end
                    end
                    if dbl_info.scaler then
                        dbl_info.scaler_base = #dbl_info.scaler == 2 and dbl_info.ability[dbl_info.scaler[1]][dbl_info.scaler[2]] or dbl_info.ability[dbl_info.scaler[1]]
                        dbl_info.offset = 1
                    end
                end
                if G.GAME.cry_double_scale[jkr.sort_id] and G.GAME.cry_double_scale[jkr.sort_id].scaler then
                    --update scaling metadata
                    dbl_info = G.GAME.cry_double_scale[jkr.sort_id]
                    local current_val, last_val, scale = 0, 0, 0
                    if #dbl_info.base == 2 then
						if type(jkr.ability) ~= "table" or not jkr.ability[dbl_info.base[1]] or type(jkr.ability[dbl_info.base[1]]) ~= "table" or not jkr.ability[dbl_info.base[1]][dbl_info.base[2]] then return end 
                        current_val = jkr.ability[dbl_info.base[1]][dbl_info.base[2]]
                        last_val = dbl_info.ability[dbl_info.base[1]] and dbl_info.ability[dbl_info.base[1]][dbl_info.base[2]] or 1
                    else
						if not jkr.ability[dbl_info.base[1]] then return end
                        current_val = jkr.ability[dbl_info.base[1]]
                        last_val = dbl_info.ability[dbl_info.base[1]] or 1
                    end
                    if #dbl_info.scaler == 2 then
						if not jkr.ability[dbl_info.scaler[1]] or not jkr.ability[dbl_info.scaler[1]][dbl_info.scaler[2]] then return end
                        scale = jkr.ability[dbl_info.scaler[1]][dbl_info.scaler[2]]
                    else
						if not jkr.ability[dbl_info.scaler[1]] then return end
                        scale = jkr.ability[dbl_info.scaler[1]]
                    end
                    scale_amt = math.abs((current_val-last_val)/scale)
                    if to_big(scale_amt) > to_big(0) then
                        dbl_info.offset = dbl_info.offset + scale_amt
                        local new_scale = dbl_info.scaler_base * dbl_info.offset
                        if #dbl_info.base == 2 then
							if not jkr.ability[dbl_info.base[1]] or not jkr.ability[dbl_info.base[1]][dbl_info.base[2]] then return end 
                            dbl_info.ability[dbl_info.base[1]][dbl_info.base[2]] = jkr.ability[dbl_info.base[1]][dbl_info.base[2]]
                        else
							if not jkr.ability[dbl_info.base[1]] then return end
                            dbl_info.ability[dbl_info.base[1]] = jkr.ability[dbl_info.base[1]]
                        end
                        if #dbl_info.scaler == 2 then
							if not jkr.ability[dbl_info.scaler[1]] or not jkr.ability[dbl_info.scaler[1]][dbl_info.scaler[2]] then return end
                            jkr.ability[dbl_info.scaler[1]][dbl_info.scaler[2]] = new_scale
                        else
							if not jkr.ability[dbl_info.scaler[1]] then return end
                            jkr.ability[dbl_info.scaler[1]] = new_scale
                        end
                        card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_upgrade_ex')})
                    end
                end
            end
        end
        return
    end
	end
}
local oldcandy = {
	object_type = "Joker",
	name = "cry_oldcandy",
	key = "oldcandy",
	pos = {x = 4, y = 1},
    config = {extra = {hand_size = 3}},
	loc_txt = {
	name = 'Nostalgic Candy',
	text = {
			"Sell this card to",
			"permanently gain",
			"{C:attention}+#1#{} hand size",
		}
	},
    loc_vars = function(self, info_queue, center)
    return {vars = {center.ability.extra.hand_size}}
    end,
	rarity = "cry_epic",
	cost = 9,
	eternal_compat = false,
	atlas = "atlasepic",
	calculate = function(self, card, context)
	if context.selling_self and not context.blueprint then
            G.hand:change_size(math.floor(card.ability.extra.hand_size))
        end
end
}	
local caramel = {
    object_type = "Joker",
	name = "cry-caramel",
	key = "caramel",
	config = {extra = {x_mult = 1.75, rounds_remaining = 11}},
	pos = {x = 0, y = 1},
	loc_txt = {
        name = 'Caramel',
        text = {
        "Each played card gives",
	"{X:mult,C:white}X#1#{} Mult when scored",
        "for the next {C:attention}#2#{} rounds",
        }
    	},
	rarity = "cry_epic",
	cost = 12,
	blueprint_compat = true,
	eternal_compat = false,
	atlas = 'atlasepic',
    	loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.x_mult, center.ability.extra.rounds_remaining}}
    	end,
    	calculate = function(self, card, context)
        	if context.individual then
        		if context.cardarea == G.play then
                	return {
                    	x_mult = card.ability.extra.x_mult,
                    	colour = G.C.RED,
                    	card = card
                	}
			end
		end
		if context.end_of_round and not context.blueprint and not context.individual and not context.repetition and not context.retrigger_joker then
            	card.ability.extra.rounds_remaining = card.ability.extra.rounds_remaining - 1
            	if card.ability.extra.rounds_remaining > 0 then
                return {
                    message = {"-1 Round"},
                    colour = G.C.FILTER
                }
            	else
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('tarot1')
                        card.T.r = -0.2
                        card:juice_up(0.3, 0.4)
                        card.states.drag.is = true
                        card.children.center.pinch.x = true
                        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                            func = function()
                                    G.jokers:remove_card(card)
                                    card:remove()
                                    card = nil
                                return true; end})) 
                        return true
                    end
                })) 
                return {
                    message = localize('k_eaten_ex'),
                    colour = G.C.FILTER
                }
            end
        end
    	end
}
if JokerDisplay then
	caramel.joker_display_definition = {
		text = {
			{
				border_nodes = {
					{ text = "X" },
					{ ref_table = "card.joker_display_values", ref_value = "x_mult" }
				}
			}
		},
		reminder_text = {
			{ ref_table = "card.joker_display_values", ref_value = "rounds_remaining" },
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
			card.joker_display_values.x_mult = tonumber(string.format("%.2f", (card.ability.extra.x_mult ^ count)))
	
			card.joker_display_values.start_round = card.joker_display_values.start_round or
				card.ability.extra.rounds_remaining
			card.joker_display_values.rounds_remaining = "(" .. card.ability.extra.rounds_remaining ..
				"/" .. card.joker_display_values.start_round .. ")"
		end,
	}
end
local curse = {
    object_type = "Joker",
    name = "cry_curse",
    key = "curse",
    pos = {x = 1, y = 1},
    loc_txt = {
        name = 'Sob',
        text = {
            "{C:edition,E:1}you cannot{} {C:dark_edition,E:1}run...{}",
            "{C:edition,E:1}you cannot{} {C:dark_edition,E:1}hide...{}",
            "{C:edition,E:1}you cannot{} {C:dark_edition,E:1}escape...{}",
	    "{C:inactive}(Must have room){}"
        }
    },
    rarity = "cry_epic",
    cost = 9,
    perishable_compat = true,
    atlas = "atlasepic",
    calculate = function(self, card, context)
        if context.selling_self and #G.jokers.cards + G.GAME.joker_buffer <= G.jokers.config.card_limit and not context.retrigger_joker and not context.blueprint then
	    local createjoker = math.min(1, G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
	    G.GAME.joker_buffer = G.GAME.joker_buffer + createjoker
            local card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_obelisk')
            card:add_to_deck()
            G.jokers:emplace(card)
	    G.GAME.joker_buffer = 0
            return {
                    card_eval_status_text(card, 'extra', nil, nil, nil, {
                        message = "Curse!",
                        colour = G.C.FILTER,
                    })
                }
        end
	if context.discard and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit and not context.retrigger_joker and not context.blueprint then
	    local createjoker = math.min(1, G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
	    G.GAME.joker_buffer = G.GAME.joker_buffer + createjoker
            local card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_obelisk')
            card:add_to_deck()
            G.jokers:emplace(card)
	    G.GAME.joker_buffer = 0
            return {
                    card_eval_status_text(card, 'extra', nil, nil, nil, {
                        message = "Curse!",
                        colour = G.C.FILTER,
                    })
                }
        end
	if context.pre_discard and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit and not context.retrigger_joker and not context.blueprint then
	    local createjoker = math.min(1, G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
	    G.GAME.joker_buffer = G.GAME.joker_buffer + createjoker
            local card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_obelisk')
            card:add_to_deck()
            G.jokers:emplace(card)
	    G.GAME.joker_buffer = 0
            return {
                    card_eval_status_text(card, 'extra', nil, nil, nil, {
                        message = "Curse!",
                        colour = G.C.FILTER,
                    })
                }
        end
	if context.reroll_shop and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit and not context.retrigger_joker and not context.blueprint then
	    local createjoker = math.min(1, G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
	    G.GAME.joker_buffer = G.GAME.joker_buffer + createjoker
            local card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_obelisk')
            card:add_to_deck()
            G.jokers:emplace(card)
	    G.GAME.joker_buffer = 0
            return {
                    card_eval_status_text(card, 'extra', nil, nil, nil, {
                        message = "Curse!",
                        colour = G.C.FILTER,
                    })
                }
        end
	if context.open_booster and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit and not context.retrigger_joker and not context.blueprint then
	    local createjoker = math.min(1, G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
	    G.GAME.joker_buffer = G.GAME.joker_buffer + createjoker
            local card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_obelisk')
            card:add_to_deck()
            G.jokers:emplace(card)
	    G.GAME.joker_buffer = 0
            return {
                    card_eval_status_text(card, 'extra', nil, nil, nil, {
                        message = "Curse!",
                        colour = G.C.FILTER,
                    })
                }
        end
	if context.buying_card and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit and not context.retrigger_joker and not context.blueprint then
	    local createjoker = math.min(1, G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
	    G.GAME.joker_buffer = G.GAME.joker_buffer + createjoker
            local card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_obelisk')
            card:add_to_deck()
            G.jokers:emplace(card)
	    G.GAME.joker_buffer = 0
            return {
                    card_eval_status_text(card, 'extra', nil, nil, nil, {
                        message = "Curse!",
                        colour = G.C.FILTER,
                    })
                }
        end
	if context.skip_blind and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit and not context.retrigger_joker and not context.blueprint then
	    local createjoker = math.min(1, G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
	    G.GAME.joker_buffer = G.GAME.joker_buffer + createjoker
            local card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_obelisk')
            card:add_to_deck()
            G.jokers:emplace(card)
	    G.GAME.joker_buffer = 0
            return {
                    card_eval_status_text(card, 'extra', nil, nil, nil, {
                        message = "Curse!",
                        colour = G.C.FILTER,
                    })
                }
        end
	if context.cardarea == G.jokers and context.before and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit and not context.retrigger_joker and not context.blueprint then
	    local createjoker = math.min(1, G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
	    G.GAME.joker_buffer = G.GAME.joker_buffer + createjoker
            local card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_obelisk')
            card:add_to_deck()
            G.jokers:emplace(card)
	    G.GAME.joker_buffer = 0
            return {
                    card_eval_status_text(card, 'extra', nil, nil, nil, {
                        message = "Curse!",
                        colour = G.C.FILTER,
                    })
                }
        end
	if context.using_consumeable and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit and not context.retrigger_joker and not context.blueprint then
	    local createjoker = math.min(1, G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
	    G.GAME.joker_buffer = G.GAME.joker_buffer + createjoker
            local card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_obelisk')
            card:add_to_deck()
            G.jokers:emplace(card)
	    G.GAME.joker_buffer = 0
            return {
                    card_eval_status_text(card, 'extra', nil, nil, nil, {
                        message = "Curse!",
                        colour = G.C.FILTER,
                    })
                }
        end
	if context.selling_card and context.card.ability.name ~= "Obelisk" and #G.jokers.cards + G.GAME.joker_buffer <= G.jokers.config.card_limit and not context.retrigger_joker and not context.blueprint then
	    local createjoker = math.min(1, G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
	    G.GAME.joker_buffer = G.GAME.joker_buffer + createjoker
            local card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_obelisk')
            card:add_to_deck()
            G.jokers:emplace(card)
	    G.GAME.joker_buffer = 0
            return {
                    card_eval_status_text(card, 'extra', nil, nil, nil, {
                        message = "Curse!",
                        colour = G.C.FILTER,
                    })
                }
        end
	if context.setting_blind and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit and not context.retrigger_joker and not context.blueprint then
	    local createjoker = math.min(1, G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
	    G.GAME.joker_buffer = G.GAME.joker_buffer + createjoker
            local card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_obelisk')
            card:add_to_deck()
            G.jokers:emplace(card)
	    G.GAME.joker_buffer = 0
            return {
                    card_eval_status_text(card, 'extra', nil, nil, nil, {
                        message = "Curse!",
                        colour = G.C.FILTER,
                    })
                }
        end
	if context.skipping_booster and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit and not context.retrigger_joker and not context.blueprint then
	    local createjoker = math.min(1, G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
	    G.GAME.joker_buffer = G.GAME.joker_buffer + createjoker
            local card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_obelisk')
            card:add_to_deck()
            G.jokers:emplace(card)
	    G.GAME.joker_buffer = 0
            return {
                    card_eval_status_text(card, 'extra', nil, nil, nil, {
                        message = "Curse!",
                        colour = G.C.FILTER,
                    })
                }
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        local card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_obelisk')
        card:set_edition({
            negative = true
        })
        card:set_eternal(true)
        card:add_to_deck()
        G.jokers:emplace(card)
        return {
                    card_eval_status_text(card, 'extra', nil, nil, nil, {
                        message = "Curse!",
                        colour = G.C.DARK_EDITION,
                    })
                }
    end
}
local bonusjoker = {
	object_type = "Joker",
	name = "cry-bonusjoker",
	key = "bonusjoker",
	pos = {x = 3, y = 2},
	config = {extra = {odds = 8, check = 0}},
	loc_txt = {
        name = 'Bonus Joker',
        text = {
			"{C:green}#1# in #2#{} chance for each",
			"played {C:attention}Bonus{} card to increase",
			"{C:attention}Joker{} or {C:attention}Consumable slots",
			"by {C:dark_edition}1{} when scored",
			"{C:red}Works twice per round",
			"{C:inactive,s:0.8}(Equal chance for each){}"
		}
    	},
	rarity = "cry_epic",
	cost = 11,
	blueprint_compat = true,
	enhancement_gate = 'm_bonus',
	loc_vars = function(self, info_queue, center)
		info_queue[#info_queue+1] = G.P_CENTERS.m_bonus
		return {vars = {''..(G.GAME and G.GAME.probabilities.normal or 1), center.ability.extra.odds}}
    	end,
	atlas = "atlasepic",
	calculate = function(self, card, context)
    		if context.individual and context.cardarea == G.play then
        		if context.other_card.ability.effect == "Bonus Card" then
            			if pseudorandom('bonusjoker') < G.GAME.probabilities.normal / card.ability.extra.odds and card.ability.extra.check < 2 and not context.retrigger_joker then
					local option = pseudorandom_element({1, 2}, pseudoseed('bonusjoker'))
					if option == 1 then
						if not context.blueprint then card.ability.extra.check = card.ability.extra.check + 1 end
                				G.jokers.config.card_limit = G.jokers.config.card_limit + 1
					else
						if not context.blueprint then card.ability.extra.check = card.ability.extra.check + 1 end
						G.consumeables.config.card_limit = G.consumeables.config.card_limit + 1
					end
					return {
						extra = {focus = card, message = localize('k_upgrade_ex')},
						card = card,
						colour = G.C.MONEY
					}
				end
        		end
    		end
		if context.end_of_round and card.ability.extra.check ~= 0 and not context.blueprint and not context.retrigger_joker and not context.individual and not context.repetition then
			card.ability.extra.check = 0
            		return {
                    	message = localize('k_reset'),
                        card = card,
			}
		end
	end
}
if JokerDisplay then
	bonusjoker.joker_display_definition = {
		text = {
            		{ text = "+" },
            		{ ref_table = "card.joker_display_values", ref_value = "count" },
        	},
        	text_config = { colour = G.C.DARK_EDITION },
        	extra = {
            	{
                { text = "(" },
                { ref_table = "card.joker_display_values",                     ref_value = "odds" },
                { text = " in " },
                { ref_table = "card.ability.extra",                     ref_value = "odds" },
                { text = ")" },
            	}
        },
        extra_config = { colour = G.C.GREEN, scale = 0.3 },
        calc_function = function(card)
            local count = 0
            local hand = next(G.play.cards) and G.play.cards or G.hand.highlighted
            local text, _, scoring_hand = JokerDisplay.evaluate_hand(hand)
			if text ~= "Unknown" then
				for _, scoring_card in pairs(scoring_hand) do
					if scoring_card.ability.effect and scoring_card.ability.effect == "Bonus Card" then
						count = count +
							JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
					end
				end
			end
            card.joker_display_values.count = count
            card.joker_display_values.odds = G.GAME and G.GAME.probabilities.normal or 1
		end
	}
end
local multjoker = {
	object_type = "Joker",
	name = "cry-multjoker",
	key = "multjoker",
	pos = {x = 2, y = 3},
	config = {extra = {odds = 4}},
	loc_txt = {
        name = 'Mult Joker',
        text = {
			"{C:green}#1# in #2#{} chance for each",
			"played {C:attention}Mult{} card to create",
			"a {C:spectral}Cryptid{} card when scored",
			"{C:inactive}(Must have room)"
		}
    	},
	rarity = "cry_epic",
	cost = 11,
	blueprint_compat = true,
	enhancement_gate = 'm_mult',
	loc_vars = function(self, info_queue, center)
		info_queue[#info_queue+1] = G.P_CENTERS.m_mult
		info_queue[#info_queue+1] = G.P_CENTERS.c_cryptid
		return {vars = {''..(G.GAME and G.GAME.probabilities.normal or 1), center.ability.extra.odds}}
    	end,
	atlas = "atlasepic",
	calculate = function(self, card, context)
    		if context.individual and context.cardarea == G.play then
        		if context.other_card.ability.effect == "Mult Card" and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            			if pseudorandom('multjoker') < G.GAME.probabilities.normal / card.ability.extra.odds then
					G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
					G.E_MANAGER:add_event(Event({
                                        	func = function() 
                                            	local new_card = create_card('Spectral',G.consumeables, nil, nil, nil, nil, 'c_cryptid', 'multjoker')
                                            	new_card:add_to_deck()
                                            	G.consumeables:emplace(new_card)
                                            	G.GAME.consumeable_buffer = 0
                                            	return true
                                        	end}))   
                                    	card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = ('+1 Cryptid'), colour = G.C.SECONDARY_SET.Spectral})                
				end
        		end
    		end
	end
}
if JokerDisplay then
	multjoker.joker_display_definition = {
		text = {
            { text = "+" },
            { ref_table = "card.joker_display_values", ref_value = "count" },
        },
        text_config = { colour = G.C.SECONDARY_SET.Spectral },
        extra = {
            {
                { text = "(" },
                { ref_table = "card.joker_display_values",                     ref_value = "odds" },
                { text = " in " },
                { ref_table = "card.ability.extra",                     ref_value = "odds" },
                { text = ")" },
            }
        },
        extra_config = { colour = G.C.GREEN, scale = 0.3 },
        calc_function = function(card)
            local count = 0
            local hand = next(G.play.cards) and G.play.cards or G.hand.highlighted
            local text, _, scoring_hand = JokerDisplay.evaluate_hand(hand)
			if text ~= "Unknown" then
				for _, scoring_card in pairs(scoring_hand) do
					if scoring_card.ability.effect and scoring_card.ability.effect == "Mult Card" then
						count = count +
							JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
					end
				end
			end
            card.joker_display_values.count = count
            card.joker_display_values.odds = G.GAME and G.GAME.probabilities.normal or 1
        end
	}
end

local goldjoker = {
    object_type = "Joker",
	name = "cry-goldjoker",
	key = "goldjoker",
    	config = {extra = {percent_mod = 1, percent = 0}},
	pos = {x = 0, y = 4},
	loc_txt = {
        name = 'Gold Joker',
        text = {
		"Earn {C:money}#1#%{} of total",
            	"money at end of round",
            	"Payout increases by {C:money}#2#%{}",
            	"when each played {C:attention}Gold{}",
		"card is scored"
        }
    },
	rarity = "cry_epic",
	cost = 14,
	enhancement_gate = 'm_gold',
	perishable_compat = false,
	atlas = "atlasepic",
    	loc_vars = function(self, info_queue, center)
		info_queue[#info_queue+1] = G.P_CENTERS.m_gold
        	return {vars = {center.ability.extra.percent, center.ability.extra.percent_mod}}
    	end,
	calculate = function(self, card, context)
		if context.cardarea == G.play and context.individual and not context.blueprint then
			if context.other_card.ability.effect == "Gold Card" then
				card.ability.extra.percent = card.ability.extra.percent + card.ability.extra.percent_mod
				return {
					extra = {focus = card, message = localize('k_upgrade_ex')},
					card = card,
					colour = G.C.MONEY
					}
			end
		end
		if context.individual and context.cardarea == G.play then
        		if context.other_card.ability.effect == "Gold Card" then
				card.ability.extra.percent = card.ability.extra.percent + card.ability.extra.percent_mod
                		return {
				message = localize('k_upgrade_ex'),
				card = card,
				colour = G.C.CHIPS
				}
        		end
    		end
	end,
	calc_dollar_bonus = function(self, card)
		local bonus = math.max(0,math.floor(0.01*card.ability.extra.percent*G.GAME.dollars))
        if bonus > 0 then return bonus end
	end
}
if JokerDisplay then
    goldjoker.joker_display_definition = {
        text = {
            { text = "+$" },
            { ref_table = "card.joker_display_values", ref_value = "dollars" },
        },
        text_config = { colour = G.C.GOLD },
        reminder_text = {
            { ref_table = "card.joker_display_values", ref_value = "localized_text" },
        },
        calc_function = function(card)
            local bonus = math.max(0, math.floor(0.01 * card.ability.extra.percent * G.GAME.dollars))
            card.joker_display_values.dollars = bonus and bonus > 0 and bonus or 0
            card.joker_display_values.localized_text = "(" .. localize("k_round") .. ")"
        end
    }
end
local altgoogol = {
	object_type = "Joker",
	name = "cry-altgoogol",
	key = "altgoogol",
	pos = {x = 4, y = 3},
	loc_txt = {
        name = 'Nostalgic Googol Play Card',
        text = {
			"Sell this card to create",
			"{C:attention}2{} copies of the leftmost {C:attention}Joker{}",
			"{C:inactive,s:0.8}Does not copy Nostalgic Googol Play Cards{}"
		}
    },
	rarity = "cry_epic",
	cost = 10,
	blueprint_compat = true,
	atlas = "atlasepic",
	soul_pos = {x = 10, y = 0, extra = {x = 5, y = 3}},
	calculate = function(self, card, context)
		if context.selling_self and not context.retrigger_joker then
			local spawn = {}
			if G.jokers.cards[1].ability.name ~= card.ability.name then spawn[#spawn+1] = G.jokers.cards[1] end
			if #spawn ~= 0 then
					 G.E_MANAGER:add_event(Event({
                    				func = function() 
							for i = 1, 2 do
                        					local card = copy_card(pseudorandom_element(spawn, pseudoseed('cry_speculo')), nil) --borrowed code moment
                        					card:add_to_deck()
                        					G.jokers:emplace(card) 
							end
                        				return true
                    				end}))
                				card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_duplicated_ex')})
                				return {calculated = true}
			else return {calculated = true} end
        	end
	end
}
if JokerDisplay then
    altgoogol.joker_display_definition = {
        reminder_text = {
            { text = '(', },
            { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
            { text = ')', },
        },
        calc_function = function(card)
            local leftmost_joker_key = G.jokers and G.jokers.cards[1] and G.jokers.cards[1] ~= card and
                G.jokers.cards[1].config.center.key
            card.joker_display_values.localized_text = leftmost_joker_key and
                localize { type = 'name_text', key = leftmost_joker_key, set = 'Joker' } or "-"
        end
    }
end

local soccer = {
	object_type = "Joker",
	name = "cry-soccer",
	key = "soccer",
	pos = {x = 1, y = 4},
	config = {extra = {holygrail = 1}},
	loc_txt = {
        name = 'One for All', --changed the name from latin because this isn't exotic
        text = {
			"{C:attention}+#1#{} Joker slot",
			"{C:attention}+#1#{} Booster Pack slot",
			"{C:attention}+#1#{} hand size",
			"{C:attention}+#1#{} consumable slot",
			"{C:attention}+#1#{} card in shop",
		}
    },
	rarity = "cry_epic",
	cost = 20,
	atlas = "atlasepic",
	loc_vars = function(self, info_queue, center)
		return {vars = {center.ability.extra.holygrail}}
	end,
	add_to_deck = function(self, card, from_debuff) --TODO: Card in booster packs, Voucher slots
		card.ability.extra.holygrail = math.floor(card.ability.extra.holygrail)
		G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.holygrail
		G.consumeables.config.card_limit = G.consumeables.config.card_limit + card.ability.extra.holygrail
		G.hand:change_size((card.ability.extra.holygrail))
		if not G.GAME.modifiers.cry_booster_packs then G.GAME.modifiers.cry_booster_packs = 2 end
        	G.GAME.modifiers.cry_booster_packs = G.GAME.modifiers.cry_booster_packs + card.ability.extra.holygrail
		change_shop_size(card.ability.extra.holygrail)
	end,
	remove_from_deck = function(self, card, from_debuff)
		G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra.holygrail
		G.consumeables.config.card_limit = G.consumeables.config.card_limit - card.ability.extra.holygrail
		G.hand:change_size((-card.ability.extra.holygrail))
		if not G.GAME.modifiers.cry_booster_packs then G.GAME.modifiers.cry_booster_packs = 2 end
        	G.GAME.modifiers.cry_booster_packs = G.GAME.modifiers.cry_booster_packs - card.ability.extra.holygrail
		change_shop_size(card.ability.extra.holygrail * -1)
	end
} 
return {name = "Epic Jokers", 
		init = function()
			
			--Error Patches
			cry_error_operators = {"+","-","X","/","^","=",">","<","m"}
			cry_error_numbers = {"0","1","2","3","4","5","6","7","8","9","10","69","404","420","-1","0.5","m","nan","inf","nil","pi","1e9","???"}
			cry_error_msgs = {
				{string = 'rand()', colour = G.C.RARITY["cry_exotic"]},
				{string = 'm', colour = G.C.UI.TEXT_DARK},
				{string = 'Chips', colour = G.C.CHIPS},
				{string = 'Mult', colour = G.C.MULT},
				{string = 'Jokers', colour = G.C.FILTER},
				{string = 'dollars', colour = G.C.FILTER},
				{string = 'hands', colour = G.C.FILTER},
				{string = 'slots', colour = G.C.FILTER},
				{string = 'Antes', colour = G.C.FILTER},
				{string = 'ERROR', colour = G.C.UI.TEXT_INACTIVE},
				{string = 'Tarots', colour = G.C.SECONDARY_SET.Tarot},
				{string = 'Planets', colour = G.C.SECONDARY_SET.Planet},
				{string = 'Specls', colour = G.C.SECONDARY_SET.Spectral},
				{string = "#@"..(G.deck and G.deck.cards[1] and G.deck.cards[#G.deck.cards].base.id or 11)..(G.deck and G.deck.cards[1] and G.deck.cards[#G.deck.cards].base.suit:sub(1,1) or 'D'), colour = G.C.RED},
			}

			cry_enable_epics = true
			--Number Blocks Patches
            local gigo = Game.init_game_object;
            function Game:init_game_object()
                local g = gigo(self)
                g.current_round.cry_nb_card = {rank = 'Ace'}
                return g
            end
            local rcc = reset_castle_card;
            function reset_castle_card()
                rcc()
                G.GAME.current_round.cry_nb_card = {rank = 'Ace'}
                local valid_castle_cards = {}
                for k, v in ipairs(G.playing_cards) do
                    if v.ability.effect ~= 'Stone Card' then
                        valid_castle_cards[#valid_castle_cards+1] = v
                    end
                end
                if valid_castle_cards[1] then 
                    local castle_card = pseudorandom_element(valid_castle_cards, pseudoseed('cry_nb'..G.GAME.round_resets.ante))
                    if not G.GAME.current_round.cry_nb_card then
                        G.GAME.current_round.cry_nb_card = {}
                    end
                    G.GAME.current_round.cry_nb_card.rank = castle_card.base.value
					G.GAME.current_round.cry_nb_card.id = castle_card.base.id
                end
            end

            --For Double Scale, modify Green Joker to use one variable
            SMODS.Joker:take_ownership('green_joker', {
                config = {extra = 1, mult = 0},
                name = "cry-Green Joker", --will prevent old calculation code from working
                loc_vars = function(self, info_queue, center)
                    return {vars = {center.ability.extra,center.ability.extra,center.ability.mult}}
                end,
                calculate = function(self, card, context)
                    if context.discard and not context.blueprint and context.other_card == context.full_hand[#context.full_hand] then
                        local prev_mult = card.ability.mult
                        card.ability.mult = math.max(0, card.ability.mult - card.ability.extra)
                        if card.ability.mult ~= prev_mult then 
                            return {
                                message = localize{type='variable',key='a_mult_minus',vars={card.ability.extra}},
                                colour = G.C.RED,
                                card = card
                            }
                        end
                    end
                    if context.cardarea == G.jokers and context.before and not context.blueprint then
                        card.ability.mult = card.ability.mult + card.ability.extra
                        return {
                            card = card,
                            message = localize{type='variable',key='a_mult',vars={card.ability.extra}}
                        }
                    end
                    if context.cardarea == G.jokers and not context.before and not context.after then
                        return {
                            message = localize{type='variable',key='a_mult',vars={card.ability.mult}},
                            mult_mod = card.ability.mult
                        }
                    end
                end,
                loc_txt = {}
            },true)
		end,
		items = {supercell, googol_play, sync_catalyst, negative, canvas, error_joker, M, m, CodeJoker, copypaste, boredom, double_scale, number_blocks, oldcandy, caramel, curse, bonusjoker, multjoker,goldjoker,altgoogol,soccer}}