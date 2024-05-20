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
    hidden = true, --default soul_rate of 0.3% in spectral packs is used
    soul_set = "Planet",
    can_use = function(card)
        return true
    end,
    use = function(card, area, copier)
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

return {name = "Spectrals", 
        init = function()
            
        end,
        items = {white_hole_sprite, white_hole}}