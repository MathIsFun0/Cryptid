local gateway = {
    object_type = "Consumable",
    set = "Spectral",
    name = "cry-Gateway",
    key = "gateway",
    pos = {x=0,y=0},
    loc_txt = {
        name = 'Gateway',
        text = { "Create a random",
        "{C:cry_exotic}Exotic{C:attention} Joker{}, destroy",
        'all other Jokers' }
    },
    cost = 4,
    atlas = "gateway",
    hidden = true, --default soul_set and soul_rate of 0.3% in spectral packs is used
    can_use = function(card)
        return true
    end,
    use = function(card, area, copier)
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
	config = {extra = {x_mult = 1.5, repetitions = 1}},
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
	discovered = true,
	blueprint_compat = true,
	atlas = 'iterum',
	soul_pos = {x = 1, y = 0, extra = {x = 2, y = 0}},
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.x_mult,center.ability.extra.repetitions}}
    end,
    calculate = function(self, context)
        if context.repetition then
            if context.cardarea == G.play then
                return {
                    message = localize('k_again_ex'),
                    repetitions = self.ability.extra.repetitions,
                    card = self
                }
            end
        elseif context.individual then
            if context.cardarea == G.play then
                return {
                    x_mult = self.ability.extra.x_mult,
                    colour = G.C.RED,
                    card = self
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
        "{C:planet}Planet{} cards give",
        "{X:red,C:white} X#1# {} Mult and {X:blue,C:white} X#1# {} Chips",
        "for their specified",
        "{C:attention}poker hand{} when used"}
    },
	rarity = "cry_exotic",
	cost = 50,
	discovered = true,
	atlas = "universum",
	soul_pos = {x = 1, y = 0, extra = {x = 2, y = 0}},
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra}}
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
	config = {extra = {pow_mult = 1.1, pow_mult_mod = 0.01}},
	pos = {x = 0, y = 0},
	loc_txt = {
        name = 'Exponentia',
        text = {
			"This Joker gains {X:dark_edition,C:white} ^#1# {} Mult",
			"when {C:mult}XMult{} is triggered",
			"{C:inactive}(Currently {X:dark_edition,C:white} ^#2# {C:inactive} Mult)"
        }
    },
	rarity = "cry_exotic",
	cost = 50,
	discovered = true,
	atlas = "exponentia",
	soul_pos = {x = 2, y = 0, extra = {x = 1, y = 0}},
	calculate = function(self, context)
        if context.cardarea == G.jokers and (self.ability.extra.pow_mult > 1) and not context.before and not context.after then
            return {
                message = "^"..self.ability.extra.pow_mult.." Mult",
                pow_mult_mod = self.ability.extra.pow_mult,
                colour = G.C.MULT
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

return {name = "Exotic Jokers", 
        init = function()
            --Universum Patches
            local uht = update_hand_text
            function update_hand_text(config, vals)
                if next(find_joker("cry-Universum")) then
                    G.E_MANAGER:add_event(Event({--This is the Hand name text for the poker hand
                    trigger = 'before',
                    blockable = not config.immediate,
                    delay = config.delay or 0.8,
                    func = function()
                        local col = G.C.GREEN
                        if vals.chips and G.GAME.current_round.current_hand.chips ~= vals.chips then
                            local delta = vals.chips
                            if type(vals.chips) == 'number' and type(G.GAME.current_round.current_hand.chips) == 'number' then delta = 'X'..(vals.chips / G.GAME.current_round.current_hand.chips) end
                            G.GAME.current_round.current_hand.chips = vals.chips
                            G.hand_text_area.chips:update(0)
                            if vals.StatusText then 
                                attention_text({
                                    text =delta,
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
                            if type(vals.mult) == 'number' and type(G.GAME.current_round.current_hand.mult) == 'number' then delta = 'X'..(vals.mult / G.GAME.current_round.current_hand.mult) end
                            G.GAME.current_round.current_hand.mult = vals.mult
                            G.hand_text_area.mult:update(0)
                            if vals.StatusText then 
                                attention_text({
                                    text =delta,
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
                                if type(vals.level) == 'number' then 
                                    G.hand_text_area.hand_level.config.colour = G.C.HAND_LEVELS[math.min(vals.level, 7)]
                                else
                                    G.hand_text_area.hand_level.config.colour = G.C.HAND_LEVELS[1]
                                end
                                G.hand_text_area.hand_level:juice_up()
                            end
                        end
                        if config.sound and not config.modded then play_sound(config.sound, config.pitch or 1, config.volume or 1) end
                        if config.modded then 
                            G.HUD_blind:get_UIE_by_ID('HUD_blind_debuff_1'):juice_up(0.3, 0)
                            G.HUD_blind:get_UIE_by_ID('HUD_blind_debuff_2'):juice_up(0.3, 0)
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

            G.P_JOKER_RARITY_POOLS["cry_exotic"] = {iterum, universum, exponentia}
        end,
        items = {gateway_sprite, iterum_sprite, universum_sprite, exponentia_sprite, gateway, iterum, universum, exponentia}}