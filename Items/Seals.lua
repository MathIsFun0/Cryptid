local function dump(o)
    if type(o) == 'table' then
        local s = '{ '
        for k,v in pairs(o) do
           if type(k) ~= 'number' then k = '"'..k..'"' end
           s = s .. '['..k..'] = ' .. (type(v) == 'table' and 'table' or tostring(v)) .. ','
        end
        return s .. '} '
     else
        return tostring(o)
     end
end

local azure_seal = {
    object_type = "Seal",
    name = "cry-Azure-Seal",
    key = "azure",
	config = { planets_amount = 3 },
    loc_txt = {
        -- Badge name
        label = 'Azure Seal',
        -- Tooltip description
        description = {
            name = 'Azure Seal',
            text = {
                'Create {C:attention}#1#{} {C:dark_edition}Negative{}',
                'planets for played',
                'poker hand, then',
                'destroy this card'
            }
        },
    },
    loc_vars = function(self, info_queue)
        return { vars = {self.config.planets_amount} }
    end,
    atlas = "azure_atlas",
    pos = {x=0, y=0},

    -- Requires latest Steamodded version
    calculate = function(self, card, context)
        print("Calculating seal in context " .. dump(context))
        
        if context.destroying_card then
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = (function()
                    local card_type = 'Planet'
                    local _planet = nil
                    if G.GAME.last_hand_played then
                        for k, v in pairs(G.P_CENTER_POOLS.Planet) do
                            if v.config.hand_type == G.GAME.last_hand_played then
                                _planet = v.key
                                break
                            end
                        end
                    end

                    for i = 1, self.config.planets_amount do
                        local card = create_card(card_type, G.consumeables, nil, nil, nil, nil, _planet, 'cry_azure')

                        card:set_edition({negative = true}, true)
                        card:add_to_deck()
                        G.consumeables:emplace(card)
                    end
                    return true
                end)
            }))

            return true
        end
    end,
}

local azure_seal_sprite = {
    object_type = "Atlas",
    key = "azure_atlas",
    path = "s_cry_azure_seal.png",
    px = 71,
    py = 95
}


local typhoon = {
    object_type = "Consumable",
    set = "Spectral",
    name = "cry-Typhoon",
    key = "typhoon",
	config = { 
        -- This will add a tooltip.
        mod_conv = 's_cry_azure_seal',
        -- Tooltip args
        seal = { planets_amount = 3 },
        max_highlighted = 1,
    },
    loc_vars = function(self, info_queue, center)
        -- Handle creating a tooltip with set args.
        info_queue[#info_queue+1] = { set = 'Other', key = 's_cry_azure_seal', specific_vars = { self.config.seal.planets_amount } }
        return {vars = {center.ability.max_highlighted}}
    end,
    loc_txt = {
        name = 'Typhoon',
        text = {
            "Select {C:attention}#1#{} card to",
            "apply {C:attention}Azure Seal{}"
        }
    },
    cost = 4,
    atlas = "typhoon",
    pos = {x=0, y=0},
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                for i = 1, card.ability.max_highlighted do
                    local highlighted = G.hand.highlighted[i]

                    if highlighted then
                        highlighted:set_seal('s_cry_azure')
                    else
                        break
                    end
                end
                return true
            end
        }))
    end
}
local typhoon_sprite = {
    object_type = "Atlas",
    key = "typhoon",
    
    path = "s_cry_typhoon.png",
    px = 71,
    py = 95
}

return {name = "Seals", 
        init = function()
            
        end,
        items = {typhoon_sprite, azure_seal_sprite, typhoon, azure_seal}}