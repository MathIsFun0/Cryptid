local timantti = {
    object_type = "Consumable",
    set = "Planet",
    name = "cry-Timantti",
    key = "Timantti",
    pos = {x=0,y=2},
    config = {hand_types = {'High Card', 'Pair', 'Two Pair'}},
    loc_txt = {
        name = 'Timantti',
        text = {
            "Level up {C:attention}#1#{},",
            "{C:attention}#2#{}, and {C:attention}#3#"
        }
    },
    cost = 4,
	aurinko = true,
    atlas = "atlasnotjokers",
    can_use = function(self, card)
        return true
    end,
    loc_vars = function(self, info_queue, center)
        return {vars = self.config.hand_types}
    end,
    use = function(self, card, area, copier)
        suit_level_up(self, card, area, copier)
    end,
    bulk_use = function(self, card, area, copier, number)
        suit_level_up(self, card, area, copier, number)
    end,
    calculate = function(self, card, context)
	if G.GAME.used_vouchers.v_observatory and (context.scoring_name == "High Card" or context.scoring_name == "Pair" or context.scoring_name == "Two Pair") then
		local value = G.P_CENTERS.v_observatory.config.extra
                return {
                    message = localize{type = 'variable', key = 'a_xmult', vars = {value}},
                    Xmult_mod = value
                }
	end
    end
}
local klubi = {
    object_type = "Consumable",
    set = "Planet",
    name = "cry-Klubi",
    key = "Klubi",
    pos = {x=1,y=2},
    config = {hand_types = {'Three of a Kind', 'Straight', 'Flush'}},
    loc_txt = {
        name = 'Klubi',
        text = {
            "Level up {C:attention}#1#{},",
            "{C:attention}#2#{}, and {C:attention}#3#"
        }
    },
    cost = 4,
	aurinko = true,
    atlas = "atlasnotjokers",
    can_use = function(self, card)
        return true
    end,
    loc_vars = function(self, info_queue, center)
        return {vars = self.config.hand_types}
    end,
    use = function(self, card, area, copier)
        suit_level_up(self, card, area, copier)
    end,
    bulk_use = function(self, card, area, copier, number)
        suit_level_up(self, card, area, copier, number)
    end,
    calculate = function(self, card, context)
	if G.GAME.used_vouchers.v_observatory and (context.scoring_name == "Three of a Kind" or context.scoring_name == "Straight" or context.scoring_name == "Flush") then
		local value = G.P_CENTERS.v_observatory.config.extra
                return {
                    message = localize{type = 'variable', key = 'a_xmult', vars = {value}},
                    Xmult_mod = value
                }
	end
    end
}
local sydan = {
    object_type = "Consumable",
    set = "Planet",
    name = "cry-Sydan",
    key = "Sydan",
    pos = {x=2,y=2},
    config = {hand_types = {'Full House', 'Four of a Kind', 'Straight Flush'}},
    loc_txt = {
        name = 'Sydan',
        text = {
            "Level up {C:attention}#1#{},",
            "{C:attention}#2#{}, and {C:attention}#3#"
        }
    },
    cost = 4,
	aurinko = true,
    atlas = "atlasnotjokers",
    can_use = function(self, card)
        return true
    end,
    loc_vars = function(self, info_queue, center)
        return {vars = self.config.hand_types}
    end,
    use = function(self, card, area, copier)
        suit_level_up(self, card, area, copier)
    end,
    bulk_use = function(self, card, area, copier, number)
        suit_level_up(self, card, area, copier, number)
    end,
    calculate = function(self, card, context)
	if G.GAME.used_vouchers.v_observatory and (context.scoring_name == "Full House" or context.scoring_name == "Four of a Kind" or context.scoring_name == "Straight Flush") then
		local value = G.P_CENTERS.v_observatory.config.extra
                return {
                    message = localize{type = 'variable', key = 'a_xmult', vars = {value}},
                    Xmult_mod = value
                }
	end
    end
}
local lapio = {
    object_type = "Consumable",
    set = "Planet",
    name = "cry-Lapio",
    key = "Lapio",
    pos = {x=3,y=2},
    config = {hand_types = {'Five of a Kind', 'Flush House', 'Flush Five'}, softlock = true},
    loc_txt = {
        name = 'Lapio',
        text = {
            "Level up {C:attention}#1#{},",
            "{C:attention}#2#{}, and {C:attention}#3#"
        }
    },
    cost = 4,
	aurinko = true,
    atlas = "atlasnotjokers",
    can_use = function(self, card)
        return true
    end,
    loc_vars = function(self, info_queue, center)
        return {vars = self.config.hand_types}
    end,
    use = function(self, card, area, copier)
        suit_level_up(self, card, area, copier)
    end,
    bulk_use = function(self, card, area, copier, number)
        suit_level_up(self, card, area, copier, number)
    end,
    calculate = function(self, card, context)
	if G.GAME.used_vouchers.v_observatory and (context.scoring_name == "Five of a Kind" or context.scoring_name == "Flush House" or context.scoring_name == "Flush Five") then
		local value = G.P_CENTERS.v_observatory.config.extra
                return {
                    message = localize{type = 'variable', key = 'a_xmult', vars = {value}},
                    Xmult_mod = value
                }
	end
    end
}
local planetlua = {
    object_type = "Consumable",
    set = "Planet",
    name = "cry-planetlua",
    key = "planetlua",
    config = {extra = {odds = 5}},
    pos = {x=4,y=2},
    loc_txt = {
        name = 'Planet.lua',
        text = {
            "{C:green}#1# in #2#{} chance to",
            "upgrade every",
	    "{C:legendary,E:1}poker hand{}",
	    "by {C:attention}1{} level"
        }
    },
    cost = 4,
    aurinko = true,
    atlas = "atlasnotjokers",
    loc_vars = function(self, info_queue, center)
        return {vars = {''..(G.GAME and G.GAME.probabilities.normal or 1), center.ability.extra.odds}}
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
	if pseudorandom('planetlua') < G.GAME.probabilities.normal/card.ability.extra.odds then --Code "borrowed" from black hole
        	update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=localize('k_all_hands'),chips = '...', mult = '...', level=''})
        	G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
            		play_sound('tarot1')
            		card:juice_up(0.8, 0.5)
            		G.TAROT_INTERRUPT_PULSE = true
            		return true end }))
        	update_hand_text({delay = 0}, {mult = '+', StatusText = true})
        	G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.9, func = function()
            		play_sound('tarot1')
            		card:juice_up(0.8, 0.5)
            		return true end }))
        	update_hand_text({delay = 0}, {chips = '+', StatusText = true})
        	G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.9, func = function()
            		play_sound('tarot1')
            		card:juice_up(0.8, 0.5)
            		G.TAROT_INTERRUPT_PULSE = nil
            		return true end }))
        	update_hand_text({sound = 'button', volume = 0.7, pitch = 0.9, delay = 0}, {level='+1'})
        	delay(1.3)
        	for k, v in pairs(G.GAME.hands) do
            		level_up_hand(card, k, true)
        	end
        	update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
	else
		G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function() --"borrowed" from Wheel Of Fortune
                attention_text({
                    text = localize('k_nope_ex'),
                    scale = 1.3, 
                    hold = 1.4,
                    major = card,
                    backdrop_colour = G.C.SECONDARY_SET.Planet,
                    align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and 'tm' or 'cm',
                    offset = {x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and -0.2 or 0},
                    silent = true
                    })
                    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.06*G.SETTINGS.GAMESPEED, blockable = false, blocking = false, func = function()
                        play_sound('tarot2', 0.76, 0.4);return true end}))
                    play_sound('tarot2', 1, 0.4)
                    card:juice_up(0.3, 0.5)
                return true end }))
	end
    end,
	bulk_use = function(self, card, area, copier, number)
	local quota = 0
	for i = 1, number do
		quota = quota + (pseudorandom('planetlua') < G.GAME.probabilities.normal/card.ability.extra.odds and 1 or 0)
	end
	if quota > 0 then 
        	update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=localize('k_all_hands'),chips = '...', mult = '...', level=''})
        	G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
            		play_sound('tarot1')
            		card:juice_up(0.8, 0.5)
            		G.TAROT_INTERRUPT_PULSE = true
            		return true end }))
        	update_hand_text({delay = 0}, {mult = '+', StatusText = true})
        	G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.9, func = function()
            		play_sound('tarot1')
            		card:juice_up(0.8, 0.5)
            		return true end }))
        	update_hand_text({delay = 0}, {chips = '+', StatusText = true})
        	G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.9, func = function()
            		play_sound('tarot1')
            		card:juice_up(0.8, 0.5)
            		G.TAROT_INTERRUPT_PULSE = nil
            		return true end }))
        	update_hand_text({sound = 'button', volume = 0.7, pitch = 0.9, delay = 0}, {level='+' .. quota})
        	delay(1.3)
        	for k, v in pairs(G.GAME.hands) do
            		level_up_hand(card, k, true, quota)
        	end
        	update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
	else
		G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                attention_text({
                    text = localize('k_nope_ex'),
                    scale = 1.3, 
                    hold = 1.4,
                    major = card,
                    backdrop_colour = G.C.SECONDARY_SET.Planet,
                    align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and 'tm' or 'cm',
                    offset = {x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and -0.2 or 0},
                    silent = true
                    })
                    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.06*G.SETTINGS.GAMESPEED, blockable = false, blocking = false, func = function()
                        play_sound('tarot2', 0.76, 0.4);return true end}))
                    play_sound('tarot2', 1, 0.4)
                    card:juice_up(0.3, 0.5)
                return true end }))
	end
    end,
    calculate = function(self, card, context) --Observatory effect: (G.GAME.probabilities.normal) in (odds) chance for x1.5 Mult
	if G.GAME.used_vouchers.v_observatory and (pseudorandom('nstar') < G.GAME.probabilities.normal/card.ability.extra.odds) then
		local value = G.P_CENTERS.v_observatory.config.extra
                return {
                    message = localize{type = 'variable', key = 'a_xmult', vars = {value}},
                    Xmult_mod = value
                }
	end
    end
}
function suit_level_up(center, card, area, copier, number)
	for _, v in pairs(card.config.center.config.hand_types) do
        	update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=localize(v, 'poker_hands'),chips = G.GAME.hands[v].chips, mult = G.GAME.hands[v].mult, level=G.GAME.hands[v].level})
        	level_up_hand(card, v, nil, number)
	end
	update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
end
local planet_cards = {sydan, klubi, lapio, timantti}
if not (SMODS.Mods["jen"] or {}).can_load then
    planet_cards[#planet_cards+1] = planetlua
end
return {name = "Planets", 
        init = function()
            
        end,
        items = planet_cards}
