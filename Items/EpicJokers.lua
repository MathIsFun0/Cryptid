cry_enable_epics = false
local googol_play = {
	object_type = "Joker",
	name = "cry-Googol Play Card",
	key = "googol_play",
	config = {extra = {Xmult = 1e100, odds = 10}},
	pos = {x = 0, y = 0},
	loc_txt = {
        name = 'Googol Play Card',
        text = {
			"{C:green}#1# in #2#{} chance for",
			"{X:red,C:white} X1e100 {} Mult"
		}
    },
	rarity = "cry_epic",
	cost = 10,
	discovered = true,
	blueprint_compat = true,
	atlas = "googol_play",
	soul_pos = {x = 2, y = 0, extra = {x = 1, y = 0}},
	loc_vars = function(self, info_queue, center)
		return {vars = {''..(G.GAME and G.GAME.probabilities.normal or 1), center.ability.extra.odds}}
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
local googol_play_sprite = {
	object_type = "Atlas",
    key = "googol_play",
    
    path = "j_cry_googol_play.png",
    px = 71,
    py = 95
}
local sync_catalyst = {
	object_type = "Joker",
	name = "cry-Sync Catalyst",
	key = "sync_catalyst",
	pos = {x = 0, y = 0},
	loc_txt = {
        name = 'Sync Catalyst',
        text = {
			"Balance {C:blue}Chips{} and",
			"{C:red}Mult{} when this Joker",
			"is triggered"
		}
    },
	rarity = "cry_epic",
	cost = 11,
	discovered = true,
	blueprint_compat = true,
	atlas = "sync_catalyst",
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
local sync_catalyst_sprite = {
	object_type = "Atlas",
    key = "sync_catalyst",
    
    path = "j_cry_sync_catalyst.png",
    px = 71,
    py = 95
}
local negative = {
	object_type = "Joker",
	name = "cry-Negative Joker",
	key = "negative",
	pos = {x = 0, y = 0},
	config = {extra = 3},
	loc_txt = {
        name = 'Negative Joker',
        text = {
			"{C:dark_edition}+#1#{} Joker slots"
		}
    },
	rarity = "cry_epic",
	cost = 12,
	discovered = true,
	atlas = "negative",
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
local negative_sprite = {
	object_type = "Atlas",
    key = "negative",
    
    path = "j_cry_negative.png",
    px = 71,
    py = 95
}
local canvas = {
	object_type = "Joker",
	name = "cry-Canvas",
	key = "canvas",
	pos = {x = 0, y = 0},
	config = {num_retriggers = 0},
	loc_txt = {
        name = 'Canvas',
        text = {
			"{C:attention}Retrigger{} all Jokers to the left",
			"once for {C:attention}every{} non-{C:blue}Common{} Joker",
			"to the right of this Joker"
		}
    },
	rarity = "cry_epic",
	cost = 15,
	discovered = true,
	blueprint_compat = true,
	atlas = "canvas",
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
local canvas_sprite = {
	object_type = "Atlas",
    key = "canvas",
    
    path = "j_cry_canvas.png",
    px = 71,
    py = 95
}
local error_joker = {
	object_type = "Joker",
	name = "cry-Error",
	key = "error",
	pos = {x = 0, y = 0},
	config = {extra = {sell_rounds = 0, active = false}},
	loc_txt = {
        name = 'ERROR',
        text = {
			""
		}
    },
	rarity = "cry_epic",
	cost = 1,
	discovered = true,
	blueprint_compat = false,
	atlas = "error",
	calculate = function(self, card, context)
		if context.end_of_round and not context.blueprint and not context.repetition then
			if card.ability.extra.sell_rounds == 0 and not card.ability.extra.active then
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
local error_sprite = {
	object_type = "Atlas",
    key = "error",
    
    path = "j_cry_error.png",
    px = 71,
    py = 95
}
local m = {
	object_type = "Joker",
	name = "cry-m",
	key = "m",
	pos = {x = 0, y = 0},
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
	discovered = true,
	blueprint_compat = true,loc_vars = function(self, info_queue, center)
		info_queue[#info_queue+1] = { set = 'Joker', key = 'j_jolly', specific_vars = {self.config.jolly.t_mult, self.config.jolly.type} }
        return {vars = {center.ability.extra.extra, center.ability.extra.x_mult}}
    end,
	atlas = "m",
	calculate = function(self, card, context)
        if context.cardarea == G.jokers and (card.ability.extra.x_mult > 1) and not context.before and not context.after then
            return {
                message = localize{type='variable',key='a_xmult',vars={card.ability.extra.x_mult}},
                Xmult_mod = card.ability.extra.x_mult
            }
        end
		if context.selling_card and context.card.ability.name == "Jolly Joker" and not context.blueprint then
			card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.extra
			card_eval_status_text(self, 'extra', nil, nil, nil, {message = localize{type = 'variable', key = 'a_xmult', vars = {card.ability.extra.x_mult}}})
			return {calculated = true}
		end
	end
}
local m_sprite = {
	object_type = "Atlas",
    key = "m",
    
    path = "j_cry_m.png",
    px = 71,
    py = 95
}
local M = {
	object_type = "Joker",
	name = "cry-M",
	key = "M",
	pos = {x = 0, y = 0},
	config = {jolly = {t_mult = 8, type = 'Pair'}},
	loc_txt = {
        name = 'M',
        text = {
			"When Blind selected,",
			"create a {C:dark_edition}Negative{}",
			"{C:attention}Jolly Joker{}"
		}
    },
	rarity = "cry_epic",
	cost = 13,
	discovered = true,
	blueprint_compat = true,loc_vars = function(self, info_queue, center)
		info_queue[#info_queue+1] = { set = 'Joker', key = 'j_jolly', specific_vars = {self.config.jolly.t_mult, self.config.jolly.type} }
    end,
	atlas = "M",
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
local M_sprite = {
	object_type = "Atlas",
    key = "M",
    path = "j_cry_big_m.png",
    px = 71,
    py = 95
}
local boredom = {
	object_type = "Joker",
	name = "cry-Boredom",
	key = "boredom",
	pos = {x = 0, y = 0},
	config = {extra = {odds = 2}},
	loc_txt = {
        name = 'Boredom',
        text = {
			"{C:green}#1# in #2#{} chance to",
			"{C:attention}retrigger{} each Joker",
			"or played card"
		}
    },
	rarity = "cry_epic",
	cost = 12,
	discovered = true,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, center)
		return {vars = {''..(G.GAME and G.GAME.probabilities.normal or 1), center.ability.extra.odds}}
    end,
	atlas = "boredom",
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
local boredom_sprite = {
	object_type = "Atlas",
    key = "boredom",
    
    path = "j_cry_boredom.png",
    px = 71,
    py = 95
}

local double_scale = {
    object_type = "Joker",
    name = "cry-Double Scale",
    key = "Double Scale",
    pos = {x = 0, y = 0},
    loc_txt = {
        name = 'Double Scale',
        text = {
            "Scaling jokers",
            "scale {C:attention}quadratically",
            "{C:inactive}(eg. +1, +3, +6, +10)",
            "{C:inactive}(grows by +1, +2, +3)"
        }
    },
    rarity = "cry_epic",
    cost = 13,
    discovered = true,
    atlas = "double_scale",
    --todo: support jokers that scale multiple variables
    calculate = function(self, card, context)
        --initialize tracking object
        if not G.GAME.cry_double_scale then
            G.GAME.cry_double_scale = {double_scale = true} --doesn't really matter what's in here as long as there's something
        end
        for i = 1, #G.jokers.cards do
            --sort_id is a unique ID for each Joker
            local jkr = G.jokers.cards[i]
            if jkr.ability then
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
					if jkr.ability.name == "cry-Exponentia" then
						dbl_info.base = {"extra", "pow_mult"}
						dbl_info.scaler = {"extra", "pow_mult_mod"}
						dbl_info.scaler_base = jkr.ability.extra.pow_mult_mod
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
                            local predicted_mod = math.abs(v-dbl_info.ability[k])
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
                        if type(jkr.ability[k]) == 'table' then
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
						if not jkr.ability[dbl_info.base[1]] or not jkr.ability[dbl_info.base[1]][dbl_info.base[2]] then return end 
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
                    if scale_amt > 0 then
                        dbl_info.offset = dbl_info.offset + scale_amt
                        local new_scale = dbl_info.scaler_base * dbl_info.offset
                        if #dbl_info.base == 2 then
                            dbl_info.ability[dbl_info.base[1]][dbl_info.base[2]] = jkr.ability[dbl_info.base[1]][dbl_info.base[2]]
                        else
                            dbl_info.ability[dbl_info.base[1]] = jkr.ability[dbl_info.base[1]]
                        end
                        if #dbl_info.scaler == 2 then
                            jkr.ability[dbl_info.scaler[1]][dbl_info.scaler[2]] = new_scale
                        else
                            jkr.ability[dbl_info.scaler[1]] = new_scale
                        end
                        card_eval_status_text(self, 'extra', nil, nil, nil, {message = localize('k_upgrade_ex')})
                    end
                end
            end
        end
        return
    end
}

local double_scale_sprite = {
    object_type = "Atlas",
    key = "double_scale",
    path = "j_cry_double_scale.png",
    px = 71,
    py = 95
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
			G.P_JOKER_RARITY_POOLS["cry_epic"] = {googol_play, sync_catalyst, negative, canvas, error_joker, m, boredom, double_scale}

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
            })
		end,
		items = {googol_play_sprite, sync_catalyst_sprite, negative_sprite, canvas_sprite, error_sprite, M_sprite, m_sprite, boredom_sprite, double_scale_sprite, googol_play, sync_catalyst, negative, canvas, error_joker, M, m, boredom, double_scale}}