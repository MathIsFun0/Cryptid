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
	pos = {x = 0, y = 0},
	loc_txt = {
        name = 'Iterum',
        text = {
        "Retrigger all cards played {C:attention}#2#{} time(s),",
        "each played card gives",
        "{X:mult,C:white} X#1# {} Mult when scored"}
    },
	rarity = "cry_exotic",
	cost = 50,
	blueprint_compat = true,
	atlas = 'iterum',
	soul_pos = {x = 1, y = 0, extra = {x = 2, y = 0}},
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
local iterum_sprite = {
    object_type = "Atlas",
    key = "iterum",
    
    path = "j_cry_iterum.png",
    px = 71,
    py = 95
}
local universum = {
    object_type = "Joker",
	name = "cry-Universum",
	key = "universum",
	config = {extra = 2},
	pos = {x = 0, y = 0},
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
	atlas = "universum",
	soul_pos = {x = 1, y = 0, extra = {x = 2, y = 0}},
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra}}
    end,
    calculate = function(self, card, context)
        if context.cry_universum then
            return {mod = to_big(card.ability.extra)}
        end
    end
}
local universum_sprite = {
    object_type = "Atlas",
    key = "universum",
    
    path = "j_cry_universum.png",
    px = 71,
    py = 95
}
local exponentia = {
    object_type = "Joker",
	name = "cry-Exponentia",
	key = "exponentia",
	config = {extra = {pow_mult = 1, pow_mult_mod = 0.01}},
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
	atlas = "exponentia",
	soul_pos = {x = 2, y = 0, extra = {x = 1, y = 0}},
	calculate = function(self, card, context)
        if context.cardarea == G.jokers and (card.ability.extra.pow_mult > 1) and not context.before and not context.after then
            return {
                message = "^"..card.ability.extra.pow_mult.." Mult",
                pow_mult_mod = card.ability.extra.pow_mult,
                colour = G.C.DARK_EDITION
            }
        end
	end,
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.pow_mult_mod, center.ability.extra.pow_mult}}
    end
}
local exponentia_sprite = {
    object_type = "Atlas",
    key = "exponentia",
    path = "j_cry_exponentia.png",
    px = 71,
    py = 95
}
local speculo = {
    object_type = "Joker",
	name = "cry-Speculo",
	key = "speculo",
	pos = {x = 0, y = 0},
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
	atlas = "speculo",
	soul_pos = {x = 1, y = 0, extra = {x = 2, y = 0}},
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
local speculo_sprite = {
    object_type = "Atlas",
    key = "speculo",
    path = "j_cry_speculo.png",
    px = 71,
    py = 95
}
local redeo = {
    object_type = "Joker",
	name = "cry-Redeo",
	key = "redeo",
    config = {extra = {ante_reduction = 1, money_req = 10, money_remaining = 0, money_mod = 10}},
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.ante_reduction, center.ability.extra.money_req, center.ability.extra.money_remaining, center.ability.extra.money_mod}}
    end,
	pos = {x = 0, y = 0},
	loc_txt = {
        name = 'Redeo',
        text = {
            "{C:attention}-#1#{} Ante when",
            "{C:money}$#2#{} {C:inactive}($#3#){} spent",
            "{C:inactive,s:0.8}Requirements increase by",
            "{C:money,s:0.8}$#4#{C:inactive,s:0.8} after each use"
        }
    },
	rarity = "cry_exotic",
	cost = 50,
	atlas = "redeo",
	soul_pos = {x = 1, y = 0, extra = {x = 2, y = 0}},
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
local redeo_sprite = {
    object_type = "Atlas",
    key = "redeo",
    path = "j_cry_redeo.png",
    px = 71,
    py = 95
}

local tenebris = {
	object_type = "Joker",
	name = "cry-Tenebris",
	key = "tenebris",
	pos = {x = 0, y = 0},
	soul_pos = {x = 1, y = 0, extra = {x = 2, y = 0}},
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
	atlas = "tenebris",
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

local tenebris_sprite = {
	object_type = "Atlas",
    key = "tenebris",
    path = "j_cry_tenebris.png",
    px = 71,
    py = 95
}

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
			"Draw {C:green}full deck{} to hand",
			"when {C:attention}Blind{} is selected"
		}
    },
	rarity = 3,
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
    path = "j_cry_effarcire.png",
    px = 71,
    py = 95
}
local crustulum = {
	object_type = "Joker",
	name = "cry-crustulum",
	key = "crustulum",
	config = {extra = {chips = 0, chip_mod = 4,}},
	pos = {x = 0, y = 0},
	soul_pos = {x = 2, y = 0, extra = {x = 1, y = 0}},
	loc_txt = {
        name = 'Crustulum',
        text = {
            "This Joker gains {C:chips}+#2#{} Chips",
            "per {C:attention}reroll{} in the shop,",
            "{C:green}all rerolls are free{}",
            "{C:inactive}(Currently {C:chips}+#1#{C:inactive} chips)"
        }
    	},
	rarity = "cry_exotic",
	cost = 50,
	atlas = "crustulum",
	blueprint_compat = true,
	perishable_compat = false,
	loc_vars = function(self, info_queue, center)
		return {vars = {center.ability.extra.chips, center.ability.extra.chip_mod}}
	end,
	calculate = function(self, card, context) --Warning, implementation is extremely scuffed ;-;
    	if context.reroll_shop and not context.blueprint then
        	card.ability.extra.chips = (card.ability.extra.chips) + card.ability.extra.chip_mod
        	card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize{type = 'variable', key = 'a_chips', vars = {card.ability.extra.chips}}, colour = G.C.CHIPS})
		G.GAME.current_round.free_rerolls = 1
		calculate_reroll_cost(true)
        	return {calculated = true}
		end
	if context.end_of_round then 
		G.GAME.current_round.free_rerolls = 1
		calculate_reroll_cost(true)
		end
	if context.cardarea == G.jokers and (card.ability.extra.chips) > 0 and not context.before and not context.after then
        return {
            	message = localize{type='variable', key='a_chips', vars={card.ability.extra.chips}},
            	chip_mod = card.ability.extra.chips
        	}
		end
	end,
	add_to_deck = function(self, card, from_debuff)
        G.GAME.current_round.free_rerolls = 1
	calculate_reroll_cost(true)
	end
}
local crustulum_sprite = {
    object_type = "Atlas",
    key = "crustulum",
    path = "j_cry_crustulum.png",
    px = 71,
    py = 95
}
--todo: make the pow_mult always prime
local primus = {
    object_type = "Joker",
    name = "cry-primus",
    key = "primus",
    config = {extra = {pow_mult = 1.01, pow_mult_mod = 0.17}},
    pos = {x = 0, y = 0},
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
    atlas = "primus",
    soul_pos = {x = 2, y = 0, extra = {x = 1, y = 0}},
    calculate = function(self, card, context)
        local check = true
        if context.scoring_hand then
            for i = 1, #context.full_hand do
                if context.full_hand[i]:get_id() == 4 or context.full_hand[i]:get_id() == 6 or context.full_hand[i]:get_id() == 8 or context.full_hand[i]:get_id() == 9 or context.full_hand[i]:get_id() == 10 or context.full_hand[i]:get_id() == 11 or context.full_hand[i]:get_id() == 12 or context.full_hand[i]:get_id() == 13 then
                    check = false
                end
            end
        end
        if context.cardarea == G.jokers and check and context.before and not context.blueprint then
            card.ability.extra.pow_mult = card.ability.extra.pow_mult + card.ability.extra.pow_mult_mod
            return {
                card_eval_status_text(card, 'extra', nil, nil, nil, {
                    message = "Upgrade!",
                    colour = G.C.DARK_EDITION,
                })
            }   
        end
        if context.cardarea == G.jokers and (card.ability.extra.pow_mult > 1) and not context.before and not context.after then
            return {
                message = "^"..card.ability.extra.pow_mult.." Mult",
                pow_mult_mod = card.ability.extra.pow_mult,
                colour = G.C.DARK_EDITION
            }
        end
    end,
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.pow_mult_mod, center.ability.extra.pow_mult}}
    end
}

local primus_sprite = {
    object_type = "Atlas",
    key = "primus",
    path = "j_cry_primus.png",
    px = 71,
    py = 95
}	

return {name = "Exotic Jokers", 
        init = function()
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
        items = {gateway_sprite, iterum_sprite, universum_sprite, exponentia_sprite, speculo_sprite, redeo_sprite, tenebris_sprite, effarcire_sprite, crustulum_sprite, primus_sprite, gateway, iterum, universum, exponentia, speculo, redeo, tenebris, effarcire, crustulum, primus,}}
