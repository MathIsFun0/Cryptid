local white_hole = {
    object_type = "Consumable",
    set = "Spectral",
    name = "cry-White Hole",
    key = "white_hole",
    pos = {x=1,y=4},
    loc_txt = {
        name = 'White Hole',
        text = { "{C:attention}Remove{} all hand levels,",
        "upgrade {C:legendary,E:1}most played{} poker hand",
        "by {C:attention}3{} for each removed level"
        }
    },
    cost = 4,
    atlas = "atlasnotjokers",
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
    end,
    --Incantation compat
    can_stack = true,
    can_divide = true,
    can_bulk_use = true,
    bulk_use = function(self, card, area, copier, number)
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
        level_up_hand(card, _hand, false, removed_levels*3^number)
        update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
    end
}
local vacuum = {
    object_type = "Consumable",
    set = "Spectral",
    name = "cry-Vacuum",
    key = "vacuum",
    pos = {x=3,y=1},
	config = {extra = 4},
    loc_txt = {
        name = 'Vacuum',
        text = {
			"Removes {C:red}all {C:green}modifications{}",
			"from {C:red}all{} cards held in hand,",
			"Earn {C:money}$#1#{} per {C:green}modification{} removed",
			"{C:inactive,s:0.7}(ex. Enhancements, Seals, Editions)"
        }
    },
    cost = 4,
    atlas = "atlasnotjokers",
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
local hammerspace = {
    object_type = "Consumable",
    set = "Spectral",
    name = "cry-Hammerspace",
    key = "hammerspace",
    pos = {x=4,y=3},
	config = {},
    loc_txt = {
        name = 'Hammerspace',
        text = {
			"Apply random {C:attention}consumables{}",
			"as if they were {C:dark_edition}Enhancements{}",
			"to cards held in hand"
        }
    },
    cost = 4,
    atlas = "atlasnotjokers",
    can_use = function(self, card)
        return #G.hand.cards > 0
    end,
    use = function(self, card, area, copier)
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
            local percent = 0.85 + (i-0.999)/(#G.hand.cards-0.998)*0.3
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() CARD:flip();CARD:set_ability(get_random_consumable('cry_hammerspace'), true, nil);play_sound('tarot2', percent);CARD:juice_up(0.3, 0.3);return true end }))
        end
    end
}
local lock = {
    object_type = "Consumable",
    set = "Spectral",
    name = "cry-Lock",
    key = "lock",
    pos = {x=0,y=1},
	config = {},
    loc_txt = {
        name = 'Lock',
        text = {
			"Remove {C:red}all{} stickers",
			"from {C:red}all{} Jokers,",
			"then apply {C:purple,E:1}Eternal{}",
			"to a random {C:attention}Joker{}"
        }
    },
    cost = 4,
    atlas = "atlasnotjokers",
    can_use = function(self, card)
        return #G.jokers.cards > 0
    end,
    use = function(self, card, area, copier)
		local target = #G.jokers.cards == 1 and G.jokers.cards[1] or G.jokers.cards[math.random(#G.jokers.cards)]
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot1')
            card:juice_up(0.3, 0.5)
            return true end }))
        for i=1, #G.jokers.cards do
            local percent = 1.15 - (i-0.999)/(#G.jokers.cards-0.998)*0.3
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.jokers.cards[i]:flip();play_sound('card1', percent);G.jokers.cards[i]:juice_up(0.3, 0.3);return true end }))
        end
        delay(0.2)
        for i=1, #G.jokers.cards do
			local CARD = G.jokers.cards[i]
            local percent = 0.85 + (i-0.999)/(#G.jokers.cards-0.998)*0.3
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() CARD:flip();CARD.ability.perishable = nil;CARD.pinned = nil;CARD:set_rental(nil);CARD:set_eternal(nil);CARD.ability.banana = nil;play_sound('card1', percent);CARD:juice_up(0.3, 0.3);return true end }))
        end
        delay(0.2)
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot2')
            card:juice_up(0.3, 0.5)
            return true end }))
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.15, func = function()
            play_sound('card1', 0.9)
            target:flip()
            return true end }))
        delay(0.2)
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, func = function()
			play_sound('gold_seal', 1.2, 0.4)
            target:juice_up(0.3, 0.3)
            return true end }))
        delay(0.2)
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.15, func = function()
            play_sound('card1',1.1)
            target:flip()
			target:set_eternal(true)
            return true end }))
    end
}
local trade = {
    object_type = "Consumable",
    set = "Spectral",
    name = "cry-Trade",
    key = "trade",
    pos = {x=2,y=1},
	config = {},
    loc_txt = {
        name = 'Trade',
        text = {
			"{C:attention}Lose{} a random Voucher,",
            "gain {C:attention}2{} random Vouchers"
        }
    },
    cost = 4,
    atlas = "atlasnotjokers",
    can_use = function(self, card)
	local usable_count = 0
        for _, v in pairs(G.GAME.used_vouchers) do
            if v then usable_count = usable_count + 1 end
        end
	if G.GAME.voucher_sticker_index and G.GAME.voucher_sticker_index.eternal then
	    for _, v in pairs(G.GAME.voucher_sticker_index.eternal) do
                if v then usable_count = usable_count - 1 end
            end
	end
	if usable_count > 0 then return true else return false end
    end,
    use = function(self, card, area, copier)
        local usable_vouchers = {}
        for k, _ in pairs(G.GAME.used_vouchers) do
            local can_use = true
            for kk, __ in pairs(G.GAME.used_vouchers) do
                local v = G.P_CENTERS[kk]
                if v.requires then
                    for _, vv in pairs(v.requires) do
                        if vv == k then
                            can_use = false
                            break
                        end
                    end
                end
		if G.GAME.voucher_sticker_index and G.GAME.voucher_sticker_index.eternal and G.GAME.voucher_sticker_index.eternal[v.name] then
		    can_use = false
		end
            end
            if can_use then
                usable_vouchers[#usable_vouchers+1] = k
            end
        end
        local unredeemed_voucher = pseudorandom_element(usable_vouchers, pseudoseed("cry_trade"))
        --redeem extra voucher code based on Betmma's Vouchers
        local area
        if G.STATE == G.STATES.HAND_PLAYED then
            if not G.redeemed_vouchers_during_hand then
                G.redeemed_vouchers_during_hand = CardArea(
                    G.play.T.x, G.play.T.y, G.play.T.w, G.play.T.h, 
                    {type = 'play', card_limit = 5})
            end
            area = G.redeemed_vouchers_during_hand
        else
            area = G.play
        end
        local card = create_card('Voucher', area, nil, nil, nil, nil, unredeemed_voucher)

	if G.GAME.voucher_edition_index[card.ability.name] then
	    local edition = cry_edition_to_table(G.GAME.voucher_edition_index[card.ability.name])
	    if edition then
		card:set_edition(edition, true, true)
	    end
	end
	if G.GAME.voucher_sticker_index.eternal[card.ability.name] then
	    card:set_eternal(true)
	    card.ability.eternal = true
	end
	if G.GAME.voucher_sticker_index.perishable[card.ability.name] then
	    card:set_perishable(true)
	    card.ability.perish_tally = G.GAME.voucher_sticker_index.perishable[card.ability.name]
	    card.ability.perishable = true
	    if G.GAME.voucher_sticker_index.perishable[card.ability.name] == 0 then
		card.debuff = true
	    end
	end
	if G.GAME.voucher_sticker_index.rental[card.ability.name] then
	    card:set_rental(true)
	    card.ability.rental = true
	end
	if G.GAME.voucher_sticker_index.pinned[card.ability.name] then
	    card.pinned = true
	end
	if G.GAME.voucher_sticker_index.banana[card.ability.name] then
	    card.ability.banana = true
	end
        card:start_materialize()
        area:emplace(card)
        card.cost=0
        card.shop_voucher=false
        local current_round_voucher=G.GAME.current_round.voucher
        card:unredeem()
        G.GAME.current_round.voucher=current_round_voucher
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay =  0,
            func = function() 
                card:start_dissolve()
                return true
            end})) 
        for i = 1, 2 do
            local area
            if G.STATE == G.STATES.HAND_PLAYED then
                if not G.redeemed_vouchers_during_hand then
                    G.redeemed_vouchers_during_hand = CardArea(
                        G.play.T.x, G.play.T.y, G.play.T.w, G.play.T.h, 
                        {type = 'play', card_limit = 5})
                end
                area = G.redeemed_vouchers_during_hand
            else
                area = G.play
            end
            local _pool = get_current_pool('Voucher', nil, nil, nil, true)
            local center = pseudorandom_element(_pool, pseudoseed('cry_trade_redeem'))
            local it = 1
            while center == 'UNAVAILABLE' do
                it = it + 1
                center = pseudorandom_element(_pool, pseudoseed('cry_trade_redeem_resample'..it))
            end
            local card = create_card('Voucher', area, nil, nil, nil, nil, center)
            card:start_materialize()
            area:emplace(card)
            card.cost=0
            card.shop_voucher=false
            local current_round_voucher=G.GAME.current_round.voucher
            card:redeem()
            G.GAME.current_round.voucher=current_round_voucher
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay =  0,
                func = function() 
                    card:start_dissolve()
                    return true
                end})) 
        end
    end
}
local analog = {
    object_type = "Consumable",
    set = "Spectral",
    name = "cry-Analog",
    key = "analog",
    pos = {x=0,y=0},
	config = {copies = 2, ante = 1},
    loc_txt = {
        name = 'Analog',
        text = {
			"Create {C:attention}#1#{} copies of a",
            "random {C:attention}Joker{}, destroy",
            "all other Jokers, {C:attention}+#2#{} Ante"
        }
    },
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.copies,center.ability.ante}}
    end,
    cost = 4,
    atlas = "atlasnotjokers",
    can_use = function(self, card)
        return #G.jokers.cards > 0
    end,
    use = function(self, card, area, copier)
        local deletable_jokers = {}
        for k, v in pairs(G.jokers.cards) do
            if not v.ability.eternal then deletable_jokers[#deletable_jokers + 1] = v end
        end
        local chosen_joker = pseudorandom_element(G.jokers.cards, pseudoseed('cry_analog_choice'))
        local _first_dissolve = nil
        G.E_MANAGER:add_event(Event({trigger = 'before', delay = 0.75, func = function()
            for k, v in pairs(deletable_jokers) do
                if v ~= chosen_joker then 
                    v:start_dissolve(nil, _first_dissolve)
                    _first_dissolve = true
                end
            end
            return true end }))
        for i = 1, card.ability.copies do
            G.E_MANAGER:add_event(Event({trigger = 'before', delay = 0.4, func = function()
                local card = copy_card(chosen_joker)
                card:start_materialize()
                card:add_to_deck()
                G.jokers:emplace(card)
                return true end }))
        end
        ease_ante(card.ability.ante)
    end
}
local summoning = {
    object_type = "Consumable",
    set = "Spectral",
    name = "cry-Summoning",
    key = "summoning",
    pos = {x=3,y=4},
    loc_txt = {
        name = 'Summoning',
        text = { "Create a random",
        "{C:cry_epic}Epic{} {C:joker}Joker{}, destroy",
        'one random {C:joker}Joker{}' }
    },
    cost = 4,
    atlas = "atlasnotjokers",
    can_use = function(self, card)
        return #G.jokers.cards > 0
    end,
    use = function(self, card, area, copier)
        local deletable_jokers = {}
        for k, v in pairs(G.jokers.cards) do
            if not v.ability.eternal then deletable_jokers[#deletable_jokers + 1] = v end
        end
        local chosen_joker = pseudorandom_element(G.jokers.cards, pseudoseed('cry_summoning'))
        local _first_dissolve = nil
        G.E_MANAGER:add_event(Event({trigger = 'before', delay = 0.75, func = function()
            for k, v in pairs(deletable_jokers) do
                if v == chosen_joker then 
                    v:start_dissolve(nil, _first_dissolve)
                    _first_dissolve = true
                end
            end
            return true end }))
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            play_sound('timpani')
            local card = create_card('Joker', G.jokers, nil, "cry_epic", nil, nil, nil, 'cry_summoning')
            card:add_to_deck()
            G.jokers:emplace(card)
            card:juice_up(0.3, 0.5)
            return true end }))
        delay(0.6)
    end
}
local replica = {
    object_type = "Consumable",
    set = "Spectral",
    name = "cry-Replica",
    key = "replica",
    pos = {x=1,y=1},
	config = {},
    loc_txt = {
        name = 'Replica',
        text = {
	    "Convert all cards",
	    "held in hand",
            "to a {C:attention}random{}",
	    "card held in hand"
        }
    },
    cost = 4,
    atlas = "atlasnotjokers",
    can_use = function(self, card)
        return #G.hand.cards > 0
    end,
    use = function(self, card, area, copier)
        local chosen_card = pseudorandom_element(G.hand.cards, pseudoseed('cry_replica_choice'))
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot1')
            card:juice_up(0.3, 0.5)
            return true end }))
        for i=1, #G.hand.cards do
            local percent = 1.15 - (i-0.999)/(#G.hand.cards-0.998)*0.3
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.cards[i]:flip();play_sound('card1', percent);G.hand.cards[i]:juice_up(0.3, 0.3);return true end }))
        end
        for i=1, #G.hand.cards do
            if not G.hand.cards[i].ability.eternal then
                G.E_MANAGER:add_event(Event({func = function()
                    copy_card(chosen_card, G.hand.cards[i])
                return true end }))
            end
        end 
        for i=1, #G.hand.cards do
            local percent = 0.85 + (i-0.999)/(#G.hand.cards-0.998)*0.3
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.cards[i]:flip();play_sound('tarot2', percent, 0.6);G.hand.cards[i]:juice_up(0.3, 0.3);return true end }))
        end
        delay(0.5)
    end
}
return {name = "Spectrals", 
        init = function()
            --Trade - undo redeeming vouchers
            function Card:unredeem()
                if self.ability.set == "Voucher" then
                    stop_use()
                    if not self.config.center.discovered then
                        discover_card(self.config.center)
                    end
            
                    self.states.hover.can = false
                    if G.GAME.used_vouchers[self.config.center_key] then G.GAME.used_vouchers[self.config.center_key] = nil end
                    G.GAME.cry_owned_vouchers[self.config.center_key] = nil
                    local top_dynatext = nil
                    local bot_dynatext = nil
                    
                    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                            top_dynatext = DynaText({string = localize{type = 'name_text', set = self.config.center.set, key = self.config.center.key}, colours = {G.C.RED}, rotate = 1,shadow = true, bump = true,float=true, scale = 0.9, pop_in = 0.6/G.SPEEDFACTOR, pop_in_rate = 1.5*G.SPEEDFACTOR})
                            bot_dynatext = DynaText({string = "Unredeemed...", colours = {G.C.RED}, rotate = 2,shadow = true, bump = true,float=true, scale = 0.9, pop_in = 1.4/G.SPEEDFACTOR, pop_in_rate = 1.5*G.SPEEDFACTOR, pitch_shift = 0.25})
                            self:juice_up(0.3, 0.5)
                            play_sound('card1')
                            play_sound('timpani')
                            self.children.top_disp = UIBox{
                                definition =    {n=G.UIT.ROOT, config = {align = 'tm', r = 0.15, colour = G.C.CLEAR, padding = 0.15}, nodes={
                                                    {n=G.UIT.O, config={object = top_dynatext}}
                                                }},
                                config = {align="tm", offset = {x=0,y=0},parent = self}
                            }
                            self.children.bot_disp = UIBox{
                                    definition =    {n=G.UIT.ROOT, config = {align = 'tm', r = 0.15, colour = G.C.CLEAR, padding = 0.15}, nodes={
                                                        {n=G.UIT.O, config={object = bot_dynatext}}
                                                    }},
                                    config = {align="bm", offset = {x=0,y=0},parent = self}
                                }
                        return true end }))
                    G.GAME.current_round.voucher = nil
            
                    self:unapply_to_run()
            
                    delay(0.6)
                    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 2.6, func = function()
                        top_dynatext:pop_out(4)
                        bot_dynatext:pop_out(4)
                        return true end }))
                    
                    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.5, func = function()
                        self.children.top_disp:remove()
                        self.children.top_disp = nil
                        self.children.bot_disp:remove()
                        self.children.bot_disp = nil
                    return true end }))
                end
            end
            function Card:unapply_to_run(center)
                local center_table = {
                    name = center and center.name or self and self.ability.name,
                    extra = self and G.GAME.cry_voucher_centers[self.config.center_key].config.extra
                }
                local obj = center or self.config.center
                if obj.unredeem and type(obj.unredeem) == 'function' then
                    obj:unredeem(self)
                    return
                end
		local is_debuffed = false
		if G.GAME.voucher_sticker_index.perishable[center_table.name] and G.GAME.voucher_sticker_index.perishable[center_table.name] == 0 then is_debuffed = true end
		if G.GAME.voucher_sticker_index.eternal[center_table.name] then
		    G.GAME.voucher_sticker_index.eternal[center_table.name] = nil
		end
		if G.GAME.voucher_sticker_index.perishable[center_table.name] then
		    G.GAME.voucher_sticker_index.perishable[center_table.name] = nil
		end
		if G.GAME.voucher_sticker_index.rental[center_table.name] then
		    G.GAME.voucher_sticker_index.rental[center_table.name] = nil
		end
		if G.GAME.voucher_sticker_index.pinned[center_table.name] then
		    G.GAME.voucher_sticker_index.pinned[center_table.name] = nil
		end
		if G.GAME.voucher_sticker_index.banana[center_table.name] then
		    G.GAME.voucher_sticker_index.banana[center_table.name] = nil
		end

		if is_debuffed == false then

                if center_table.name == 'Overstock' or center_table.name == 'Overstock Plus' then
                    G.E_MANAGER:add_event(Event({func = function()
                        change_shop_size(-center_table.extra)
                        return true end }))
                end
                if center_table.name == 'Tarot Merchant' or center_table.name == 'Tarot Tycoon' then
                    G.E_MANAGER:add_event(Event({func = function()
                        G.GAME.tarot_rate = G.GAME.tarot_rate / center_table.extra
                        return true end }))
                end
                if center_table.name == 'Planet Merchant' or center_table.name == 'Planet Tycoon' then
                    G.E_MANAGER:add_event(Event({func = function()
                        G.GAME.planet_rate = G.GAME.planet_rate / center_table.extra
                        return true end }))
                end
                if center_table.name == 'Hone' or center_table.name == 'Glow Up' then
                    G.E_MANAGER:add_event(Event({func = function()
                        G.GAME.edition_rate = G.GAME.edition_rate / center_table.extra
                        return true end }))
                end
                if center_table.name == 'Magic Trick' then
                    G.E_MANAGER:add_event(Event({func = function()
                        G.GAME.playing_card_rate = 0
                        return true end }))
                end
                if center_table.name == 'Crystal Ball' then
                    G.E_MANAGER:add_event(Event({func = function()
                        G.consumeables.config.card_limit = G.consumeables.config.card_limit - center_table.extra
                        return true end }))
                end
                if center_table.name == 'Clearance Sale' then
                    G.E_MANAGER:add_event(Event({func = function()
                        G.GAME.discount_percent = 0
                        for k, v in pairs(G.I.CARD) do
                            if v.set_cost then v:set_cost() end
                        end
                        return true end }))
                end
                if center_table.name == 'Liquidation' then
                    G.E_MANAGER:add_event(Event({func = function()
                        G.GAME.discount_percent = 25	-- no idea why the below returns nil, so it's hardcoded now
			-- G.GAME.discount_percent = G.P_CENTERS.v_clearance_sale.extra
                        for k, v in pairs(G.I.CARD) do
                            if v.set_cost then v:set_cost() end
                        end
                        return true end }))
                end
                if center_table.name == 'Reroll Surplus' or center_table.name == 'Reroll Glut' then
                    G.E_MANAGER:add_event(Event({func = function()
                        G.GAME.round_resets.reroll_cost = G.GAME.round_resets.reroll_cost + self.ability.extra
                        G.GAME.current_round.reroll_cost = math.max(0, G.GAME.current_round.reroll_cost + self.ability.extra)
                        return true end }))
                end
                if center_table.name == 'Seed Money' then
                    G.E_MANAGER:add_event(Event({func = function()
                        G.GAME.interest_cap = 25 --note: does not account for potential deck effects
                        return true end }))
                end
                if center_table.name == 'Money Tree' then
                    G.E_MANAGER:add_event(Event({func = function()
                        G.GAME.interest_cap = G.P_CENTERS.v_seed_money.extra
                        return true end }))
                end
                if center_table.name == 'Grabber' or center_table.name == 'Nacho Tong' then
                    G.GAME.round_resets.hands = G.GAME.round_resets.hands - center_table.extra
                    ease_hands_played(-center_table.extra)
                end
                if center_table.name == 'Paint Brush' or center_table.name == 'Palette' then
                    G.hand:change_size(-center_table.extra)
                end
                if center_table.name == 'Wasteful' or center_table.name == 'Recyclomancy' then
                    G.GAME.round_resets.discards = G.GAME.round_resets.discards - center_table.extra
                    ease_discard(-center_table.extra)
                end
                if center_table.name == 'Antimatter' then
                    G.E_MANAGER:add_event(Event({func = function()
                        if G.jokers then 
                            G.jokers.config.card_limit = G.jokers.config.card_limit - center_table.extra
                        end
                        return true end }))
                end
                if center_table.name == 'Hieroglyph' or center_table.name == 'Petroglyph' then
                    ease_ante(center_table.extra)
                    G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante
                    G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante+center_table.extra
            
                    if center_table.name == 'Hieroglyph' then
                        G.GAME.round_resets.hands = G.GAME.round_resets.hands + center_table.extra
                        ease_hands_played(center_table.extra)
                    end
                    if center_table.name == 'Petroglyph' then
                        G.GAME.round_resets.discards = G.GAME.round_resets.discards + center_table.extra
                        ease_discard(center_table.extra)
                    end
                end

		end

            end
        end,
        items = {white_hole, vacuum, hammerspace, lock, trade, analog, summoning, replica}}
