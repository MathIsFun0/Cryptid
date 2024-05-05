local gateway = SMODS.Consumable({
    set = "Spectral",
    name = "Gateway",
    key = "gateway",
    pos = {x=0,y=0},
    loc_txt = {
        name = 'Gateway',
        text = { "Create a random",
        "{C:exotic}Exotic{C:attention} Joker{}, destroy",
        'all other Jokers' }
    },
    cost = 4,
    atlas = "gateway"
})

function gateway.can_use(card)
    return true
end

function gateway.use(card, area, copier)
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
        local card = create_card('Joker', G.jokers, nil, "Exotic", nil, nil, nil, 'cry_gateway')
        card:add_to_deck()
        G.jokers:emplace(card)
        card:juice_up(0.3, 0.5)
        return true end }))
    delay(0.6)
end
local gateway_sprite = SMODS.Sprite({
    key = "gateway",
    atlas = "asset_atlas",
    path = "c_cry_gateway.png",
    px = 71,
    py = 95
})

return {gateway_sprite, gateway}