local gateway = SMODS.Spectral:new(
    "Gateway", --name
    "cry_gateway", --slug
    {}, --config
    {x=5,y=5}, --pos
    {
        name = 'Gateway',
        text = { "Create a random",
        "{C:exotic}Exotic{C:attention} Joker{}, destroy",
        'all other Jokers' }
    }, --loc_txt
    4, --cost
    nil, --consumeable
    nil --discovered
    --atlas
)

function gateway.can_use(card)
    return true
end

function gateway.use(card, area, copier)
    --Need to check for edgecases - if there are max Jokers and all are eternal OR there is a max of 1 joker this isn't possible already
    --If there are max Jokers and exactly 1 is not eternal, that joker cannot be the one selected
    --otherwise, the selected joker can be totally random and all other non-eternal jokers can be removed
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

-- gateway and exotic spawn logic
function create_card(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
    local area = area or G.jokers
    local center = G.P_CENTERS.b_red
        

    --should pool be skipped with a forced key
    if not forced_key and soulable and (not G.GAME.banned_keys['c_soul']) then
        if (_type == 'Tarot' or _type == 'Spectral' or _type == 'Tarot_Planet') and
        not (G.GAME.used_jokers['c_soul'] and not next(find_joker("Showman")))  then
            if pseudorandom('soul_'.._type..G.GAME.round_resets.ante) > 0.997 then
                forced_key = 'c_soul'
            end
        end
        if (_type == 'Planet' or _type == 'Spectral') and
        not (G.GAME.used_jokers['c_black_hole'] and not next(find_joker("Showman")))  then 
            if pseudorandom('soul_'.._type..G.GAME.round_resets.ante) > 0.997 then
                forced_key = 'c_black_hole'
            end
        end
        if (_type == 'Spectral') and
        not (G.GAME.used_jokers['c_cry_gateway'] and not next(find_joker("Showman")))  then 
            if pseudorandom('cry_gateway_'.._type..G.GAME.round_resets.ante) > 0.997 then
                forced_key = 'c_cry_gateway'
            end
        end
    end

    if _type == 'Base' then 
        forced_key = 'c_base'
    end

    if forced_key and not G.GAME.banned_keys[forced_key] then 
        center = G.P_CENTERS[forced_key]
        _type = (center.set ~= 'Default' and center.set or _type)
    else
        local _pool, _pool_key = get_current_pool(_type, _rarity, legendary, key_append)
        center = pseudorandom_element(_pool, pseudoseed(_pool_key))
        local it = 1
        while center == 'UNAVAILABLE' do
            it = it + 1
            center = pseudorandom_element(_pool, pseudoseed(_pool_key..'_resample'..it))
        end

        center = G.P_CENTERS[center]
    end

    local front = ((_type=='Base' or _type == 'Enhanced') and pseudorandom_element(G.P_CARDS, pseudoseed('front'..(key_append or '')..G.GAME.round_resets.ante))) or nil

    local card = Card(area.T.x + area.T.w/2, area.T.y, G.CARD_W, G.CARD_H, front, center,
    {bypass_discovery_center = area==G.shop_jokers or area == G.pack_cards or area == G.shop_vouchers or (G.shop_demo and area==G.shop_demo) or area==G.jokers or area==G.consumeables,
     bypass_discovery_ui = area==G.shop_jokers or area == G.pack_cards or area==G.shop_vouchers or (G.shop_demo and area==G.shop_demo),
     discover = area==G.jokers or area==G.consumeables, 
     bypass_back = G.GAME.selected_back.pos})
    if card.ability.consumeable and not skip_materialize then card:start_materialize() end

    if _type == 'Joker' then
        if G.GAME.modifiers.all_eternal then
            card:set_eternal(true)
        end
        if (area == G.shop_jokers) or (area == G.pack_cards) then 
            local eternal_perishable_poll = pseudorandom((area == G.pack_cards and 'packetper' or 'etperpoll')..G.GAME.round_resets.ante)
            if G.GAME.modifiers.enable_eternals_in_shop and eternal_perishable_poll > 0.7 then
                card:set_eternal(true)
            elseif G.GAME.modifiers.enable_perishables_in_shop and ((eternal_perishable_poll > 0.4) and (eternal_perishable_poll <= 0.7)) then
                card:set_perishable(true)
            end
            if G.GAME.modifiers.enable_rentals_in_shop and pseudorandom((area == G.pack_cards and 'packssjr' or 'ssjr')..G.GAME.round_resets.ante) > 0.7 then
                card:set_rental(true)
            end
        end

        local edition = poll_edition('edi'..(key_append or '')..G.GAME.round_resets.ante)
        card:set_edition(edition)
        check_for_unlock({type = 'have_edition'})
    end
    return card
end
function get_current_pool(_type, _rarity, _legendary, _append)
    --create the pool
    G.ARGS.TEMP_POOL = EMPTY(G.ARGS.TEMP_POOL)
    local _pool, _starting_pool, _pool_key, _pool_size = G.ARGS.TEMP_POOL, nil, '', 0

    if _type == 'Joker' then 
        local rarity = _rarity or pseudorandom('rarity'..G.GAME.round_resets.ante..(_append or '')) 
        rarity = (type(rarity) == 'string' and rarity) or (_legendary and 4) or (rarity > 0.95 and 3) or (rarity > 0.7 and 2) or 1
        _starting_pool, _pool_key = G.P_JOKER_RARITY_POOLS[rarity], 'Joker'..rarity..((not _legendary and _append) or '')
    else _starting_pool, _pool_key = G.P_CENTER_POOLS[_type], _type..(_append or '')
    end

    --cull the pool
    for k, v in ipairs(_starting_pool) do
        local add = nil
        if _type == 'Enhanced' then
            add = true
        elseif _type == 'Demo' then
            if v.pos and v.config then add = true end
        elseif _type == 'Tag' then
            if (not v.requires or (G.P_CENTERS[v.requires] and G.P_CENTERS[v.requires].discovered)) and 
            (not v.min_ante or v.min_ante <= G.GAME.round_resets.ante) then
                add = true
            end
        elseif not (G.GAME.used_jokers[v.key] and not next(find_joker("Showman"))) and
            (v.unlocked ~= false or v.rarity == 4) then
            if v.set == 'Voucher' then
                if not G.GAME.used_vouchers[v.key] then 
                    local include = true
                    if v.requires then 
                        for kk, vv in pairs(v.requires) do
                            if not G.GAME.used_vouchers[vv] then 
                                include = false
                            end
                        end
                    end
                    if G.shop_vouchers and G.shop_vouchers.cards then
                        for kk, vv in ipairs(G.shop_vouchers.cards) do
                            if vv.config.center.key == v.key then include = false end
                        end
                    end
                    if include then
                        add = true
                    end
                end
            elseif v.set == 'Planet' then
                if (not v.config.softlock or G.GAME.hands[v.config.hand_type].played > 0) then
                    add = true
                end
            elseif v.enhancement_gate then
                add = nil
                for kk, vv in pairs(G.playing_cards) do
                    if vv.config.center.key == v.enhancement_gate then
                        add = true
                    end
                end
            else
                add = true
            end
            if v.name == 'Black Hole' or v.name == 'The Soul' or v.name == 'Gateway' then
                add = false
            end
        end

        if v.no_pool_flag and G.GAME.pool_flags[v.no_pool_flag] then add = nil end
        if v.yes_pool_flag and not G.GAME.pool_flags[v.yes_pool_flag] then add = nil end
        
        if add and not G.GAME.banned_keys[v.key] then 
            _pool[#_pool + 1] = v.key
            _pool_size = _pool_size + 1
        else
            _pool[#_pool + 1] = 'UNAVAILABLE'
        end
    end

    --if pool is empty
    if _pool_size == 0 then
        _pool = EMPTY(G.ARGS.TEMP_POOL)
        if _type == 'Tarot' or _type == 'Tarot_Planet' then _pool[#_pool + 1] = "c_strength"
        elseif _type == 'Planet' then _pool[#_pool + 1] = "c_pluto"
        elseif _type == 'Spectral' then _pool[#_pool + 1] = "c_incantation"
        elseif _type == 'Joker' then _pool[#_pool + 1] = "j_joker"
        elseif _type == 'Demo' then _pool[#_pool + 1] = "j_joker"
        elseif _type == 'Voucher' then _pool[#_pool + 1] = "v_blank"
        elseif _type == 'Tag' then _pool[#_pool + 1] = "tag_handy"
        else _pool[#_pool + 1] = "j_joker"
        end
    end

    return _pool, _pool_key..(not _legendary and G.GAME.round_resets.ante or '')
end

return {gateway}