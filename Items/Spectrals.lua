local white_hole = {
    object_type = "Consumable",
    set = "Spectral",
    name = "cry-White Hole",
    key = "white_hole",
    pos = {x=0,y=0},
    loc_txt = {
        name = 'White Hole',
        text = { "{C:attention}Remove{} all hand levels,",
        "upgrade {C:legendary,E:1}most played{} poker hand",
        "by {C:attention}3{} for each removed level"
        }
    },
    cost = 4,
    atlas = "white_hole",
    discovered = true,
    hidden = true, --default soul_rate of 0.3% in spectral packs is used
    soul_set = "Planet",
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        --Get most played hand type (logic yoinked from Telescope)
        local _planet, _hand, _tally = nil, nil, -1
        for k, v in ipairs(G.handlist) do
            if G.GAME.hands[v].visible and G.GAME.hands[v].played > _tally then
                _hand = v
                _tally = G.GAME.hands[v].played
            end
        end
        if _hand then
            for k, v in pairs(G.P_CENTER_POOLS.Planet) do
                if v.config.hand_type == _hand then
                    _planet = v.key
                end
            end
        end
        local removed_levels = 0
        for k, v in ipairs(G.handlist) do
            if G.GAME.hands[v].level > 1 then
                local this_removed_levels = G.GAME.hands[v].level - 1
                removed_levels = removed_levels + this_removed_levels
                level_up_hand(card, v, true, -this_removed_levels)
            end
        end
        update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=localize(_hand, 'poker_hands'),chips = G.GAME.hands[_hand].chips, mult = G.GAME.hands[_hand].mult, level=G.GAME.hands[_hand].level})
        level_up_hand(card, _hand, false, 3*removed_levels)
        update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
    end
}
local white_hole_sprite = {
	object_type = "Atlas",
    key = "white_hole",
    path = "c_cry_white_hole.png",
    px = 71,
    py = 95
}

local vacuum = {
    object_type = "Consumable",
    set = "Spectral",
    name = "cry-Vacuum",
    key = "vacuum",
    pos = {x=0,y=0},
	config = {extra = 4},
    loc_txt = {
        name = 'Vacuum',
        text = {
			"Removes {C:red}all {C:green}modifications{}",
			"from {C:red}all{} cards in your hand,",
			"Earn {C:money}$#1#{} per {C:green}modification{} removed",
			"{C:inactive,s:0.7}(ex. Enhancements, Seals, Editions)"
        }
    },
    cost = 15,
    atlas = "vacuum",
	discovered = true,
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra}}
    end,
    can_use = function(self, card)
        return #G.hand.cards > 0
    end,
    use = function(self, card, area, copier)
		local earnings = 0
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot1')
            card:juice_up(0.3, 0.5)
            return true end }))
        for i=1, #G.hand.cards do
            local percent = 1.15 - (i-0.999)/(#G.hand.cards-0.998)*0.3
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.cards[i]:flip();play_sound('card1', percent);G.hand.cards[i]:juice_up(0.3, 0.3);return true end }))
        end
        delay(0.2)
        for i=1, #G.hand.cards do
			local CARD = G.hand.cards[i]
			if CARD.config.center ~= G.P_CENTERS.c_base then
				earnings = earnings + 1
			end
			if CARD.edition then
				earnings = earnings + 1
			end
			if CARD.seal then
				earnings = earnings + 1
			end
            local percent = 0.85 + (i-0.999)/(#G.hand.cards-0.998)*0.3
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() CARD:flip();CARD:set_ability(G.P_CENTERS.c_base, true, nil);CARD:set_edition(nil, true);CARD:set_seal(nil, true);play_sound('tarot2', percent);CARD:juice_up(0.3, 0.3);return true end }))
        end
		ease_dollars(earnings * card.ability.extra)
    end
}
local vacuum_sprite = {
    object_type = "Atlas",
    key = "vacuum",
    
    path = "c_cry_vacuum.png",
    px = 71,
    py = 95
}

return {name = "Spectrals", 
        init = function()
            
        end,
        items = {white_hole_sprite, vacuum_sprite, white_hole, vacuum}}
