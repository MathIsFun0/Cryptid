Cryptid.memepack = { --This is used for the Cryptid memepack pool
    "j_jolly",
    "j_obelisk",
    "j_space", --Nobody takes this thing seriously so i'm putting it here
    "j_mr_bones", --sans undertale
}
if cry_enable_jokers then Cryptid.memepack[#Cryptid.memepack+1] = "j_cry_cube" end
if cry_enable_jokers then Cryptid.memepack[#Cryptid.memepack+1] = "j_cry_happyhouse" end
if cry_enable_jokers then Cryptid.memepack[#Cryptid.memepack+1] = "j_cry_nice" end
if cry_enable_jokers then Cryptid.memepack[#Cryptid.memepack+1] = "j_cry_sus" end
if cry_enable_jokers then Cryptid.memepack[#Cryptid.memepack+1] = "j_cry_chad" end
if cry_enable_jokers then Cryptid.memepack[#Cryptid.memepack+1] = "j_cry_jimball" end
if cry_enable_jokers then Cryptid.memepack[#Cryptid.memepack+1] = "j_cry_krustytheclown" end
if cry_enable_jokers then Cryptid.memepack[#Cryptid.memepack+1] = "j_cry_blurred" end
if cry_enable_jokers then Cryptid.memepack[#Cryptid.memepack+1] = "j_cry_filler" end
if cry_minvasion then Cryptid.memepack[#Cryptid.memepack+1] = "j_cry_reverse" end --uno reverse
if cry_minvasion then Cryptid.memepack[#Cryptid.memepack+1] = "j_cry_bonk" end
if cry_enable_epics then Cryptid.memepack[#Cryptid.memepack+1] = "j_cry_boredom" end
if cry_enable_epics then Cryptid.memepack[#Cryptid.memepack+1] = "j_cry_curse" end
if cry_enable_epics then Cryptid.memepack[#Cryptid.memepack+1] = "j_cry_m" end

function memepackpool(_type, _rarity, legendary, key_append)
    G.ARGS.TEMP_POOL = EMPTY(G.ARGS.TEMP_POOL)
    local _pool, _starting_pool, _pool_key, _pool_size = G.ARGS.TEMP_POOL, {}, 'meme', 0

    for k, v in pairs(Cryptid.memepack) do
        if v then 
            _starting_pool[#_starting_pool+1] = G.P_CENTERS[v]
        end
    end

    for k, v in ipairs(_starting_pool) do
        local add = true
        
        if G.GAME.used_jokers[v.key] and not next(find_joker("Showman")) then
            add = false
        end

        if add and not G.GAME.banned_keys[v.key] then
            _pool[#_pool+1] = v.key
            _pool_size = _pool_size + 1
        end

        if _pool_size == 0 then
            _pool = EMPTY(G.ARGS.TEMP_POOL)
            _pool[#_pool + 1] = "j_mr_bones"
        end
    end

    return _pool, _pool_key .. G.GAME.round_resets.ante
end

local memepackgetcurrentpool = get_current_pool
function get_current_pool(_type, _rarity, _legendary, _append)
    if _type == "meme" then return memepackpool(_type, _rarity, _legendary, _append) end
    return memepackgetcurrentpool(_type, _rarity, _legendary, _append)
end

local memepack_atlas = {
    object_type = "Atlas",
    key = "memepack",
    path = "pack_cry.png",
    px = 71,
    py = 95
}
local meme1 = {
    object_type = "Booster",
    key = "meme_1",
    kind = "meme",
    atlas = "memepack",
    pos = {x=0,y=1},
    config = {extra = 5, choose = 2},
    cost = 14,
    weight = 0.18/3, --0.18 base ÷ 3 since there are 3 identical packs
    create_card = function(self, card)
        return create_card("meme", G.pack_cards, nil, nil, true, true, nil, 'cry_meme')
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.CRY_ASCENDANT)
        ease_background_colour{new_colour = G.C.CRY_ASCENDANT, special_colour = G.C.BLACK, contrast = 2}
    end,
    loc_vars = function(self, info_queue, card)
	return { vars = {card.config.center.config.choose, card.ability.extra} }
    end,
    loc_txt = {
        name = "Meme Pack",
        text = {
            "Choose {C:attention}#1#{} of",
            "up to {C:attention}#2# Meme Jokers{}"
        }
    },
    update_pack = function(self, dt)
        ease_colour(G.C.DYN_UI.MAIN, G.C.CRY_ASCENDANT)
        ease_background_colour{new_colour = G.C.CRY_ASCENDANT, special_colour = G.C.BLACK, contrast = 2}
        SMODS.Booster.update_pack(self, dt)
    end,
    group_key = "k_cry_meme_pack"
}
local meme2 = {
    object_type = "Booster",
    key = "meme_two",
    kind = "meme",
    atlas = "memepack",
    pos = {x=1,y=1},
    config = {extra = 5, choose = 2},
    cost = 14,
    weight = 0.18/3, --0.18 base ÷ 3 since there are 3 identical packs
    create_card = function(self, card)
        return create_card("meme", G.pack_cards, nil, nil, true, true, nil, 'cry_memetwo')
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.CRY_ASCENDANT)
        ease_background_colour{new_colour = G.C.CRY_ASCENDANT, special_colour = G.C.BLACK, contrast = 2}
    end,
    loc_vars = function(self, info_queue, card)
	return { vars = {card.config.center.config.choose, card.ability.extra} }
    end,
    loc_txt = {
        name = "Meme Pack",
        text = {
            "Choose {C:attention}#1#{} of",
            "up to {C:attention}#2# Meme Jokers{}"
        }
    },
    update_pack = function(self, dt)
        ease_colour(G.C.DYN_UI.MAIN, G.C.CRY_ASCENDANT)
        ease_background_colour{new_colour = G.C.CRY_ASCENDANT, special_colour = G.C.BLACK, contrast = 2}
        SMODS.Booster.update_pack(self, dt)
    end,
    group_key = "k_cry_meme_pack"
}
local meme3 = {
    object_type = "Booster",
    key = "meme_three",
    kind = "meme",
    atlas = "memepack",
    pos = {x=2,y=1},
    config = {extra = 5, choose = 2},
    cost = 14,
    weight = 0.18/3, --0.18 base ÷ 3 since there are 3 identical packs
    create_card = function(self, card)
        return create_card("meme", G.pack_cards, nil, nil, true, true, nil, 'cry_memethree')
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.CRY_ASCENDANT)
        ease_background_colour{new_colour = G.C.CRY_ASCENDANT, special_colour = G.C.BLACK, contrast = 2}
    end,
    loc_vars = function(self, info_queue, card)
	return { vars = {card.config.center.config.choose, card.ability.extra} }
    end,
    loc_txt = {
        name = "Meme Pack",
        text = {
            "Choose {C:attention}#1#{} of",
            "up to {C:attention}#2# Meme Jokers{}"
        }
    },
    update_pack = function(self, dt)
        ease_colour(G.C.DYN_UI.MAIN, G.C.CRY_ASCENDANT)
        ease_background_colour{new_colour = G.C.CRY_ASCENDANT, special_colour = G.C.BLACK, contrast = 2}
        SMODS.Booster.update_pack(self, dt)
    end,
    group_key = "k_cry_meme_pack"
}

if not AurinkoAddons then
	AurinkoAddons = {}
end

--Edition code based on Bunco's Glitter Edition

local mosaic_shader = {
    object_type = "Shader",
    key = 'mosaic', 
    path = 'mosaic.fs'
}
local mosaic = {
    object_type = "Edition",
    key = "mosaic",
    weight = 0.8, --slightly rarer than Polychrome
    shader = "mosaic",
    in_shop = true,
    extra_cost = 6,
    config = {x_chips = 2.5},
    sound = {
        sound = 'cry_e_mosaic',
        per = 1,
        vol = 0.2
    },
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,
    loc_vars = function(self, info_queue)
        return {vars = {self.config.x_chips}}
    end,
    loc_txt = {
        name = "Mosaic",
        label = "Mosaic",
        text = {
            "{X:chips,C:white} X#1# {} Chips"
        }
    }
}
local oversat_shader = {
    object_type = "Shader",
    key = 'oversat', 
    path = 'oversat.fs'
}
local oversat = {
    object_type = "Edition",
    key = "oversat",
    weight = 3,
    shader = "oversat",
    in_shop = true,
    extra_cost = 5,
    sound = {
        sound = 'cry_e_oversaturated',
        per = 1,
        vol = 0.25
    },
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,
    loc_txt = {
        name = "Oversaturated",
        label = "Oversaturated",
        text = {
            "All values",
	    "on this card",
	    "are {C:attention}doubled{}",
	    "{C:inactive}(If possible)"
        }
    },
    on_apply = function(card)
        cry_with_deck_effects(card, function(card)
            cry_misprintize(card,nil,true)
            cry_misprintize(card, {min=2*(G.GAME.modifiers.cry_misprint_min or 1),max=2*(G.GAME.modifiers.cry_misprint_max or 1)})
        end)
    end,
    on_remove = function(card)
        cry_with_deck_effects(card, function(card)
            cry_misprintize(card,nil,true)
            cry_misprintize(card)
        end)
    end
}

AurinkoAddons.cry_oversat = function(card, hand, instant, amount)
	G.GAME.hands[hand].chips = math.max(G.GAME.hands[hand].chips + (G.GAME.hands[hand].l_chips * amount), 0)
	G.GAME.hands[hand].mult = math.max(G.GAME.hands[hand].mult + (G.GAME.hands[hand].l_mult * amount), 1)
	if not instant then
		G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, func = function()
			play_sound('chips1')
			card:juice_up(0.8, 0.5)
		return true end }))
		update_hand_text({delay = 1.3}, {chips = G.GAME.hands[hand].chips, StatusText = true})
		G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, func = function()
			play_sound('multhit1')
			card:juice_up(0.8, 0.5)
		return true end }))
		update_hand_text({delay = 1.3}, {mult = G.GAME.hands[hand].mult, StatusText = true})
	elseif hand == G.handlist[#G.handlist] then
		G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
			play_sound('chips1')
			card:juice_up(0.8, 0.5)
		return true end }))
		update_hand_text({delay = 1.3}, {chips = (amount > 0 and '++' or '--'), StatusText = true})
		G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
			play_sound('multhit1')
			card:juice_up(0.8, 0.5)
		return true end }))
		update_hand_text({delay = 1.3}, {mult = (amount > 0 and '++' or '--'), StatusText = true})
	end
end

local glitched_shader = {
    object_type = "Shader",
    key = 'glitched', 
    path = 'glitched.fs'
}
local glitched = {
    object_type = "Edition",
    key = "glitched",
    weight = 15,
    shader = "glitched",
    in_shop = true,
    extra_cost = 3,
    sound = {
        sound = 'cry_e_glitched',
        per = 1,
        vol = 0.25
    },
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,
    loc_txt = {
        name = "Glitched",
        label = "Glitched",
        text = {
            'All values on this card',
	    'are {C:dark_edition}randomized{}',
            'between {C:attention}X0.1{} and {C:attention}X10{}',
            '{C:inactive}(If possible){}',
        }
    },
    on_apply = function(card)
        cry_with_deck_effects(card, function(card)
            cry_misprintize(card,nil,true)
            cry_misprintize(card, {min=0.1*(G.GAME.modifiers.cry_misprint_min or 1),max=10*(G.GAME.modifiers.cry_misprint_max or 1)})
        end)
    end,
    on_remove = function(card)
        cry_with_deck_effects(card, function(card)
            cry_misprintize(card,nil,true)
            cry_misprintize(card)
        end)
    end
}

local randtext = {'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',' ','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','0','1','2','3','4','5','6','7','8','9','+','-','?','!','$','%','[',']','(',')'}

local function obfuscatedtext(length)
	local str = ''
	for i = 1, length do
		str = str .. randtext[math.random(#randtext)]
	end
	return str
end

AurinkoAddons.cry_glitched = function(card, hand, instant, amount)
	local modc = G.GAME.hands[hand].l_chips * cry_log_random(pseudoseed('cry_aurinko_chips_misprint'..G.GAME.round_resets.ante),(G.GAME.modifiers.cry_misprint_min or 1) / 10,(G.GAME.modifiers.cry_misprint_max or 1) * 10) * amount
	local modm = G.GAME.hands[hand].l_mult * cry_log_random(pseudoseed('cry_aurinko_mult_misprint'..G.GAME.round_resets.ante),(G.GAME.modifiers.cry_misprint_min or 1) / 10,(G.GAME.modifiers.cry_misprint_max or 1) * 10) * amount
	G.GAME.hands[hand].chips = math.max(G.GAME.hands[hand].chips + modc, 1)
	G.GAME.hands[hand].mult = math.max(G.GAME.hands[hand].mult + modm, 1)
	if not instant then
		for i = 1, math.random(6,10) do
			update_hand_text({sound = 'button', volume = 0.4, pitch = 1.1, delay = 0.2}, {chips = obfuscatedtext(3)})
		end
		G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0, func = function()
			play_sound('chips1')
			card:juice_up(0.8, 0.5)
		return true end }))
		update_hand_text({delay = 0}, {chips = (amount > 0 and '+' or '-') .. number_format(math.abs(modc)), StatusText = true})
		update_hand_text({delay = 1.3}, {chips = G.GAME.hands[hand].chips})
		for i = 1, math.random(6,10) do
			update_hand_text({sound = 'button', volume = 0.4, pitch = 1.1, delay = 0.2}, {mult = obfuscatedtext(3)})
		end
		G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0, func = function()
			play_sound('multhit1')
			card:juice_up(0.8, 0.5)
		return true end }))
		update_hand_text({delay = 0}, {mult = (amount > 0 and '+' or '-') .. number_format(math.abs(modm)), StatusText = true})
		update_hand_text({delay = 1.3}, {mult = G.GAME.hands[hand].mult})
	elseif hand == G.handlist[#G.handlist] then
		G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
			play_sound('chips1')
			card:juice_up(0.8, 0.5)
		return true end }))
		update_hand_text({delay = 1.3}, {chips = (amount > 0 and '+' or '-') .. '???', StatusText = true})
		G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
			play_sound('multhit1')
			card:juice_up(0.8, 0.5)
		return true end }))
		update_hand_text({delay = 1.3}, {mult = (amount > 0 and '+' or '-') .. '???', StatusText = true})
	end
end

local astral_shader = {
    object_type = "Shader",
    key = 'astral', 
    path = 'astral.fs'
}
local astral = {
    object_type = "Edition",
    key = "astral",
    weight = 0.3, --very rare
    shader = "astral",
    in_shop = true,
    extra_cost = 3,
    sound = {
        sound = 'talisman_emult',
        per = 1,
        vol = 0.5
    },
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,
    loc_txt = {
        name = "Astral",
        label = "Astral",
        text = {
            "{X:dark_edition,C:white}^#1#{} Mult"
        }
    },
    config = {e_mult = 1.1},
    loc_vars = function(self, info_queue)
        return {vars = {self.config.e_mult}}
    end
}
local blurred_shader = {
    object_type = "Shader",
    key = 'blur', 
    path = 'blur.fs'
}
local blurred = {
    object_type = "Edition",
    key = "blur",
    weight = 0.5, --very rare
    shader = "blur",
    in_shop = true,
    extra_cost = 3,
    sound = {
        sound = 'cry_e_blur',
        per = 1,
        vol = 0.5
    },
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,
    loc_txt = {
        name = "Blurred",
        label = "Blurred",
        text = {
            "{C:attention}Retrigger{} this", "card {C:attention}1{} time",
            "{C:green}#1# in #2#{} chance", "to retrigger {C:attention}#3#{}", "additional time"
        }
    },
    config = {retrigger_chance = 2, retriggers = 1, extra_retriggers = 1},
    loc_vars = function(self, info_queue, center)
        local chance = center and center.edition.retrigger_chance or self.config.retrigger_chance
        local retriggers = center and center.edition.retriggers or self.config.retriggers

        return {vars = {G.GAME.probabilities.normal, chance, retriggers}}
    end,
    calculate = function(self, card, context)
        if context.retrigger_edition_check then
            if pseudorandom("cry_blurred") <= G.GAME.probabilities.normal / self.config.retrigger_chance then
                return {
                    message = "Again?",
                    repetitions = self.config.extra_retriggers,
                    card = card
                }
            end
        end
    end
}
local noisy_shader = {
    object_type = "Shader",
    key = 'noisy', 
    path = 'noisy.fs'
}
local noisy = {
    object_type = "Edition",
    key = "noisy",
    weight = 3,
    shader = "noisy",
    in_shop = true,
    extra_cost = 4,
    config = {min_mult = 0, max_mult = 30, min_chips = 0, max_chips = 150},
    sound = {
        sound = 'cry_e_noisy',
        per = 1,
        vol = 0.25
    },
    loc_txt = {
        name = "Noisy",
        label = "Noisy",
        text = {
            "???"
        }
    },
    calculate = function(self, card, context)
        if context.edition_main and context.edition_val then
            context.edition_val.mult_mod = pseudorandom("cry_noisy_mult", self.config.min_mult, self.config.max_mult)
            context.edition_val.chip_mod = pseudorandom("cry_noisy_chips", self.config.min_chips, self.config.max_chips)
        end
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        if not full_UI_table.name then
            full_UI_table.name = localize { type = 'name', set = self.set, key = self.key, nodes = full_UI_table.name }
        end
        local r_mults = {}
        for i = self.config.min_mult, self.config.max_mult do
            r_mults[#r_mults+1] = tostring(i)
        end
        local loc_mult = ' '..(localize('k_mult'))..' '
        local r_chips = {}
        for i = self.config.min_chips, self.config.max_chips do
            r_chips[#r_chips+1] = tostring(i)
        end
        local loc_chips = ' Chips '
        mult_ui = {
            {n=G.UIT.T, config={text = '  +',colour = G.C.MULT, scale = 0.32}},
            {n=G.UIT.O, config={object = DynaText({string = r_mults, colours = {G.C.MULT},pop_in_rate = 9999999, silent = true, random_element = true, pop_delay = 0.5, scale = 0.32, min_cycle_time = 0})}},
            {n=G.UIT.O, config={object = DynaText({string = {
                {string = 'rand()', colour = G.C.JOKER_GREY},{string = "#@"..(G.deck and G.deck.cards[1] and G.deck.cards[#G.deck.cards].base.id or 11)..(G.deck and G.deck.cards[1] and G.deck.cards[#G.deck.cards].base.suit:sub(1,1) or 'D'), colour = G.C.RED},
                loc_mult, loc_mult, loc_mult, loc_mult, loc_mult, loc_mult, loc_mult, loc_mult, loc_mult, loc_mult, loc_mult, loc_mult, loc_mult},
            colours = {G.C.UI.TEXT_DARK},pop_in_rate = 9999999, silent = true, random_element = true, pop_delay = 0.2011, scale = 0.32, min_cycle_time = 0})}},
        }
        chip_ui = {
            {n=G.UIT.T, config={text = '  +',colour = G.C.CHIPS, scale = 0.32}},
            {n=G.UIT.O, config={object = DynaText({string = r_chips, colours = {G.C.CHIPS},pop_in_rate = 9999999, silent = true, random_element = true, pop_delay = 0.5, scale = 0.32, min_cycle_time = 0})}},
            {n=G.UIT.O, config={object = DynaText({string = {
                {string = 'rand()', colour = G.C.JOKER_GREY},{string = "@#"..(G.deck and G.deck.cards[1] and G.deck.cards[1].base.suit:sub(2,2) or 'm')..(G.deck and G.deck.cards[1] and G.deck.cards[1].base.id or 7), colour = G.C.BLUE},
                loc_chips, loc_chips, loc_chips, loc_chips, loc_chips, loc_chips, loc_chips, loc_chips, loc_chips, loc_chips, loc_chips, loc_chips, loc_chips},
            colours = {G.C.UI.TEXT_DARK},pop_in_rate = 9999999, silent = true, random_element = true, pop_delay = 0.2011, scale = 0.32, min_cycle_time = 0})}},
        }
        desc_nodes[#desc_nodes+1] = mult_ui
        desc_nodes[#desc_nodes+1] = chip_ui
    end
}
local jollyeditionshader = {
    object_type = "Shader",
    key = 'm',
    path = 'm.fs'
}
local jollyedition = {
    object_type = "Edition",
    in_shop = false,
    weight = 0,
    name = "cry-jollyedition",
    sound = {
        sound = 'cry_e_jolly',
        per = 1,
        vol = 0.3
    },
    extra_cost = 0,
    config = {mult = 8},
    apply_to_float = true,
    key = "m",
    shader = "m",
    disable_base_shader = true,
    disable_shadow = true,
    loc_vars = function(self, info_queue)
        return {vars = {self.config.mult}}
    end,
    loc_txt = {
        name = "Jolly",
        label = "Jolly",
        text = {
            "{C:mult}+#1#{} Mult",
	    "This card is feeling",
	    "rather {C:attention}jolly{}"	
        }
    }
}

local glass_shader = {
    object_type = "Shader",
    key = 'glass',
    path = 'glass.fs',
    send_vars = function (sprite, card)
        return {
            lines_offset = card and card.edition and card.edition.cry_glass_seed or 0
        }
    end,
}
local glass_edition = {
    object_type = "Edition",
    key = "glass",
    shader = "glass",
    disable_base_shader = true,
    disable_shadow = true,
    on_apply = function (card)
        -- Randomize offset to -1..1
        card.edition.cry_glass_seed = pseudorandom('e_cry_glass') * 2 - 1
    end,
    sound = {
        sound = 'cry_e_fragile',
        per = 1,
        vol = 0.3
    },
    weight = 7,
    extra_cost = 2,
    config = {x_mult = 3, shatter_chance = 8},
    loc_vars = function(self, info_queue)
        return {vars = {(G.GAME.probabilities.normal or 1)*(self.config.shatter_chance-1), self.config.shatter_chance, self.config.x_mult}}
    end,
    loc_txt = {
        name = "Fragile",
        label = "Fragile",
        text = {
            "{C:white,X:mult} X#3# {} Mult",
            "{C:green}#1# in #2#{} chance this",
            "card isn't {C:red}destroyed",
            "when triggered"	
        }
    },
    calculate = function(self, card, context)
        if context.joker_triggered or (context.from_playing_card and context.cardarea and context.cardarea == G.play and not context.repetition) then
            if pseudorandom("cry_fragile") > G.GAME.probabilities.normal*(self.config.shatter_chance-1)/self.config.shatter_chance then
                card.will_shatter = true
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    func = function()
                        if not card.shattered then
                            card:shatter()
                        end
                    return true
                    end
                }))
            end
        end
    end
}

local gold_shader = {
    object_type = "Shader",
    key = 'gold',
    path = 'gold.fs',
    send_vars = function (sprite, card)
        return {
            lines_offset = card and card.edition and card.edition.cry_gold_seed or 0
        }
    end,
}
local gold_edition = {
    object_type = "Edition",
    key = "gold",
    shader = "gold",
    weight = 7,
    extra_cost = 2,
    config = {dollars = 2},
    loc_vars = function(self, info_queue)
        return {vars = {self.config.dollars}}
    end,
    sound = {
        sound = 'cry_e_golden',
        per = 1,
        vol = 0.3
    },
    on_apply = function (card)
        -- Randomize offset to -1..1
        card.edition.cry_gold_seed = pseudorandom('e_cry_gold') * 2 - 1
    end,
    loc_txt = {
        name = "Golden",
        label = "Golden",
        text = {
            "{C:money}+$#1#{} when used",
            "or triggered"	
        }
    },
    calculate = function(self, card, context)
        if context.joker_triggered or context.from_consumable or (context.from_playing_card and context.cardarea and context.cardarea == G.play and not context.repetition) then
            ease_dollars(self.config.dollars)
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('$')..self.config.dollars, colour = G.C.MONEY})
        end
    end
}
local echo_atlas = {
    object_type = 'Atlas',
    key = 'echo_atlas',
    path = 'm_cry_echo.png',
    px = 71,
    py = 95,
}
local echo = {
    object_type = 'Enhancement',
    key = 'echo',
    loc_txt = {
        name = 'Echo Card',
        text = {'{C:green}#2# in #3#{} chance to',
        '{C:attention}retrigger{} #1# additional',
    'times when scored'}
    },
    atlas = 'echo_atlas',
    config = {retriggers = 2, extra = 2},
    loc_vars = function(self, info_queue)
        return {vars = {self.config.retriggers,G.GAME.probabilities.normal, self.config.extra}}
    end,
}
local eclipse = {
    object_type = "Consumable",
    set = "Tarot",
    name = "cry-Eclipse",
    key = "eclipse",
    pos = {x=1,y=0},
    config = {mod_conv = 'm_cry_echo', max_highlighted = 1},
    loc_txt = {
        name = 'The Eclipse',
        text = {
            "Enhances {C:attention}#1#{} selected card",
            "into an {C:attention}Echo Card"
        }
    },
    atlas = "atlasnotjokers",
    loc_vars = function(self, info_queue)
        info_queue[#info_queue+1] = G.P_CENTERS.m_cry_echo

        return {vars = {self.config.max_highlighted}}
    end,
}
local blessing = {
    object_type = "Consumable",
    set = "Tarot",
    name = "cry-theblessing",
    key = "theblessing",
    pos = {x=2, y=3},
    loc_txt = {
        name = "The Blessing",
        text = {
		"Creates {C:attention}1{}",
		"random {C:attention}consumable{}",
		"{C:inactive}(Must have room){}",
        }
    },
    cost = 3,
    atlas = "atlasnotjokers",
    can_use = function(self, card)
        return #G.consumeables.cards < G.consumeables.config.card_limit or card.area == G.consumeables
    end,
    can_bulk_use = true,
    use = function(self, card, area, copier)
	local used_consumable = copier or card
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                if G.consumeables.config.card_limit > #G.consumeables.cards then
                    play_sound('timpani')
                    local _card = create_card('Consumeables', G.consumables, nil, nil, nil, nil, nil, 'blessing')
                    _card:add_to_deck()
                    G.consumeables:emplace(_card)
                    used_consumable:juice_up(0.3, 0.5)
                end
                return true end }))
        delay(0.6)
    end
}
--note: seal colors are also used in lovely.toml for spectral descriptions
-- and must be modified in both places
local azure_seal = {
    object_type = "Seal",
    name = "cry-Azure-Seal",
    key = "azure",
    badge_colour = HEX("1d4fd7"),
	config = { planets_amount = 3 },
    loc_txt = {
        -- Badge name
        label = 'Azure Seal',
        -- Tooltip description
        name = 'Azure Seal',
        text = {
            'Create {C:attention}#1#{} {C:dark_edition}Negative{}',
            '{C:planet}Planets{} for played',
            '{C:attention}poker hand{}, then',
            '{C:red}destroy{} this card'
        },
    },
    loc_vars = function(self, info_queue)
        return { vars = {self.config.planets_amount} }
    end,
    atlas = "azure_atlas",
    pos = {x=0, y=0},

    -- Requires latest Steamodded version (as of 7/9/24)
    calculate = function(self, card, context)        
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
        mod_conv = 'cry_azure_seal',
        -- Tooltip args
        seal = { planets_amount = 3 },
        max_highlighted = 1,
    },
    loc_vars = function(self, info_queue, center)
        -- Handle creating a tooltip with set args.
        info_queue[#info_queue+1] = { set = 'Other', key = 'cry_azure_seal', specific_vars = { self.config.seal.planets_amount } }
        return {vars = {center.ability.max_highlighted}}
    end,
    loc_txt = {
        name = 'Typhoon',
        text = {
            "Add an {C:cry_azure}Azure Seal{}",
            "to {C:attention}#1#{} selected",
            "card in your hand"
        }
    },
    cost = 4,
    atlas = "atlasnotjokers",
    pos = {x=0, y=4},
    use = function(self, card, area, copier) --Good enough
	local used_consumable = copier or card
	for i = 1, #G.hand.highlighted do
	local highlighted = G.hand.highlighted[i]
	G.E_MANAGER:add_event(Event({func = function()
            	play_sound('tarot1')
            	highlighted:juice_up(0.3, 0.5)
            	return true end }))
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                    if highlighted then
                        highlighted:set_seal('cry_azure')
                    end
                return true
            end
        }))
	delay(0.5)
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function() G.hand:unhighlight_all(); return true end }))
	end
    end
}
local cat = {
    object_type = "Tag",
    atlas = "tag_cry",
    pos = {x=0, y=2},
    key = "cat",
    name = "cry-Cat Tag",
    loc_txt = {
        name = "Cat Tag",
        text = {"Meow.", "{C:inactive}Level {C:dark_edition}#1#"}
    }
}
local epic_tag = {
    object_type = "Tag",
    atlas = "tag_cry",
    pos = {x=3, y=0},
    config = {type = 'store_joker_create'},
    key = "epic",
    loc_txt = {
        name = "Epic Tag",
        text = {
            "Shop has a half-price",
            "{C:cry_epic}Epic Joker"
        }
    },
    apply = function(tag, context)
        if context.type == 'store_joker_create' then
            local rares_in_posession = {0}
                for k, v in ipairs(G.jokers.cards) do
                    if v.config.center.rarity == "cry_epic" and not rares_in_posession[v.config.center.key] then
                        rares_in_posession[1] = rares_in_posession[1] + 1 
                        rares_in_posession[v.config.center.key] = true
                    end
                end
                local card
                if #G.P_JOKER_RARITY_POOLS.cry_epic > rares_in_posession[1] then 
                    card = create_card('Joker', context.area, nil, 1, nil, nil, nil, 'cry_eta')
                    create_shop_card_ui(card, 'Joker', context.area)
                    card.states.visible = false
                    tag:yep('+', G.C.RARITY.cry_epic,function() 
                        card:start_materialize()
                        card.misprint_cost_fac = 0.5
                        card:set_cost()
                        return true
                    end)
                else
                    tag:nope()
                end
                tag.triggered = true
                return card
        end
    end
}
local schematic = {
    object_type = "Tag",
    atlas = "tag_cry",
    pos = {x=1, y=2},
    config = {type = 'store_joker_create'},
    key = "schematic",
    loc_txt = {
        name = "Schematic Tag",
        text = {
            "Shop has a",
            "{C:attention}Brainstorm"
        }
    },
    loc_vars = function(self, info_queue)
        info_queue[#info_queue+1] = { set = 'Joker', key = 'j_brainstorm'} 
        return {vars = {}}
    end,
    apply = function(tag, context)
        if context.type == 'store_joker_create' then
                local card
                    card = create_card('Joker', context.area, nil, nil, nil, nil, "j_brainstorm")
                    create_shop_card_ui(card, 'Joker', context.area)
                    card.states.visible = false
                    tag:yep('+', G.C.RARITY.cry_epic,function() 
                        card:start_materialize()
                        card:set_cost()
                        return true
                    end)
                tag.triggered = true
                return card
        end
    end
}
local empoweredPack = {
    object_type = "Booster",
    key = "empowered",
    kind = "Spectral",
    pos = {x=0,y=4},
    config = {extra = 2, choose = 1},
    cost = 0,
    weight = 0,
    draw_hand = true,
    update_pack = SMODS.Booster.update_pack,
    loc_vars = SMODS.Booster.loc_vars,
    ease_background_colour = function(self) ease_background_colour_blind(G.STATES.SPECTRAL_PACK) end,
    create_UIBox = function(self) return create_UIBox_spectral_pack() end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0,0, {
            timer = 0.015,
            scale = 0.1,
            initialize = true,
            lifespan = 3,
            speed = 0.2,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = {G.C.WHITE, lighten(G.C.GOLD, 0.2)},
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
    create_card = function(self, card, i)
        if (i%2 == 1) then
            return create_card("Spectral", G.pack_cards, nil, nil, true, true, 'c_soul')
        else
            return create_card("Spectral", G.pack_cards, nil, nil, true, true, 'c_cry_gateway')
        end
    end,
    loc_txt = {
        name = "Spectral Pack [Empowered Tag]",
        text = {
            "Choose {C:attention}#1#{} of up to",
            "{C:attention}#2#{C:spectral} Spectral{} cards",
            "{s:0.8,C:inactive}(Generated by Empowered Tag)"
        }
    },
    group_key = "k_spectral_pack"
}
local empowered = {
    object_type = "Tag",
    atlas = "tag_cry",
    pos = {x=1, y=0},
    config = {type = 'new_blind_choice'},
    key = "empowered",
    loc_txt = {
        name = "Empowered Tag",
        text = {
            "Gives a free {C:spectral}Spectral Pack",
            "with {C:legendary,E:1}The Soul{} and {C:cry_exotic,E:1}Gateway{}"
        }
    },
    loc_vars = function(self, info_queue)
        info_queue[#info_queue+1] = G.P_CENTERS.p_spectral_normal_1
        info_queue[#info_queue+1] = {set = "Spectral", key = "c_soul"}
        if G.P_CENTERS.c_cry_gateway then
            info_queue[#info_queue+1] = {set = "Spectral", key = "c_cry_gateway"}
        end
        return {vars = {}}
    end,
    apply = function(tag, context)
        if context.type == 'new_blind_choice' then
            if G.STATE ~= G.STATES.SPECTRAL_PACK then
                G.GAME.PACK_INTERRUPT = G.STATE
            end
            tag:yep('+', G.C.SECONDARY_SET.Spectral,function() 
                local key = 'p_cry_empowered'
                local card = Card(G.play.T.x + G.play.T.w/2 - G.CARD_W*1.27/2,
                G.play.T.y + G.play.T.h/2-G.CARD_H*1.27/2, G.CARD_W*1.27, G.CARD_H*1.27, G.P_CARDS.empty, G.P_CENTERS[key], {bypass_discovery_center = true, bypass_discovery_ui = true})
                card.cost = 0
                card.from_tag = true
                G.FUNCS.use_card({config = {ref_table = card}})
                card:start_materialize()
                return true
            end)
            tag.triggered = true
            return true
        end
    end,
    in_pool = function()
        return false
    end
}
local gambler = {
    object_type = "Tag",
    atlas = "tag_cry",
    pos = {x=2, y=0},
    config = {type = 'immediate', odds = 4},
    min_ante = 2,
    key = "gambler",
    loc_txt = {
        name = "Gambler's Tag",
        text = {
            "{C:green}#1# in #2#{} chance to create",
            "an {C:cry_exotic,E:1}Empowered Tag"
        }
    },
    loc_vars = function(self, info_queue)
        info_queue[#info_queue+1] = {set = "Tag", key = "tag_cry_empowered"}
        return {vars = {G.GAME.probabilities.normal or 1, self.config.odds}}
    end,
    apply = function(tag, context)
        if context.type == 'immediate' then
            if pseudorandom('cry_gambler_tag') < G.GAME.probabilities.normal/tag.config.odds then
                local lock = tag.ID
                G.CONTROLLER.locks[lock] = true
                tag:yep('+', G.C.RARITY.cry_exotic,function()
                    add_tag(Tag("tag_cry_empowered"))
                    G.E_MANAGER:add_event(Event({
                        trigger = "after",
                        delay = 0.3,
                        func = function()
                            if not G.GAME.PACK_INTERRUPT then
                                G.GAME.tags[#G.GAME.tags]:apply_to_run({type = 'new_blind_choice'})
                            end
                            G.CONTROLLER.locks[lock] = nil
                            return true
                        end
                    }))
                    return true
                end)
            else
                tag:nope()
            end
            tag.triggered = true
            return true
        end
    end
}
local bundle = {
    object_type = "Tag",
    atlas = "tag_cry",
    pos = {x=0, y=0},
    config = {type = 'immediate'},
    key = "bundle",
    min_ante = 2,
    loc_txt = {
        name = "Bundle Tag",
        text = {
            "Create a {C:attention}Standard Tag{}, {C:tarot}Charm Tag{},",
            "{C:attention}Buffoon Tag{}, and {C:planet}Meteor Tag"
        }
    },
    loc_vars = function(self, info_queue)
        info_queue[#info_queue+1] = {set = "Tag", key = "tag_standard"}
        info_queue[#info_queue+1] = {set = "Tag", key = "tag_charm"}
        info_queue[#info_queue+1] = {set = "Tag", key = "tag_meteor"}
        info_queue[#info_queue+1] = {set = "Tag", key = "tag_buffoon"}
        return {vars = {}}
    end,
    apply = function(tag, context)
        if context.type == 'immediate' then
            local lock = tag.ID
            G.CONTROLLER.locks[lock] = true
            tag:yep('+', G.C.ATTENTION,function()
                add_tag(Tag("tag_standard"))
                add_tag(Tag("tag_charm"))
                add_tag(Tag("tag_meteor"))
                add_tag(Tag("tag_buffoon"))
                G.CONTROLLER.locks[lock] = nil
                return true
            end)
            tag.triggered = true
            return true
        end
    end
}
local memory = {
    object_type = "Tag",
    atlas = "tag_cry",
    pos = {x=3, y=1},
    name = "cry-Memory Tag",
    config = {type = 'immediate', num = 2},
    key = "memory",
    loc_txt = {
        name = "Memory Tag",
        text = {
            "Create {C:attention}#1#{} copies of",
            "the last {C:attention}Tag{} used",
            "during this run",
            "{s:0.8,C:inactive}Copying Tags excluded",
            "{s:0.8,C:inactive}Currently: {s:0.8,C:attention}#2#"
        }
    },
    loc_vars = function(self, info_queue)
        if G.GAME.cry_last_tag_used then
            _c = G.P_TAGS[G.GAME.cry_last_tag_used]
        end
        local loc_tag = _c and localize{type = 'name_text', key = G.GAME.cry_last_tag_used, set = _c.set} or localize('k_none')
        return {vars = {self.config.num, loc_tag}}
    end,
    apply = function(tag, context)
        if context.type == 'immediate' and G.GAME.cry_last_tag_used then
            local lock = tag.ID
            G.CONTROLLER.locks[lock] = true
            tag:yep('+', G.C.ATTENTION,function()
                for i = 1, 2 do
                    local t = Tag(G.GAME.cry_last_tag_used)
                    t.ability.orbital_hand = G.GAME.cry_memory_orbital
                    add_tag(t)
                end
                G.CONTROLLER.locks[lock] = nil
                return true
            end)
            tag.triggered = true
        end
        return true
    end,
    in_pool = function()
        return G.GAME.cry_last_tag_used and true
    end
}

local miscitems = {memepack_atlas, meme1, meme2, meme3,
mosaic_shader, oversat_shader, glitched_shader, astral_shader, blurred_shader, glass_shader, gold_shader, noisy_shader,
glass_edition, gold_edition, glitched, noisy, mosaic, oversat, blurred, astral,
echo_atlas, echo, eclipse, blessing,
azure_seal_sprite, typhoon, azure_seal,
cat, empoweredPack, empowered, gambler, bundle, memory, schematic}
if cry_enable_epics then
    miscitems[#miscitems+1] = epic_tag
end
if cry_minvasion then 
    miscitems[#miscitems+1] = jollyeditionshader
    miscitems[#miscitems+1] = jollyedition
end
return {name = "Misc.", 
        init = function()

--echo card
cs = Card.calculate_seal
function Card:calculate_seal(context)
    local ret = cs(self,context)
    if context.repetition then
        local total_repetitions = ret and ret.repetitions or 0

        if self.config.center == G.P_CENTERS.m_cry_echo then
            if pseudorandom('echo') < G.GAME.probabilities.normal/(self.ability.extra or 2) then --hacky crash fix
                total_repetitions = total_repetitions + self.ability.retriggers
            end
        end

        if total_repetitions > 0 then
            return {
                message = localize('k_again_ex'),
                repetitions = total_repetitions,
                card = self
            }
        end
    end
    return ret
end
--Memory Tag Patches - store last tag used
local tapr = Tag.apply_to_run
function Tag:apply_to_run(x)
    local ret = tapr(self,x)
    if self.triggered and self.key ~= "tag_double" and self.key ~= "tag_cry_memory" and 
    self.key ~= "tag_cry_triple" and self.key ~= "tag_cry_quadruple" and self.key ~= "tag_cry_quintuple" then
        G.GAME.cry_last_tag_used = self.key
        G.GAME.cry_memory_orbital = self.ability.orbital_hand
    end
    return ret
end
		
--Change name of cards with Jolly edition
local gcui = generate_card_ui
function generate_card_ui(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end, card)
    local full_UI_table = gcui(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end, card)
    if card and card.edition and card.edition.cry_m and (not card.ability or card.ability.set ~= "Edition") and full_UI_table and full_UI_table.name and type(full_UI_table.name) == 'table' and full_UI_table.name[1] and full_UI_table.name[1].config and full_UI_table.name[1].config.object and full_UI_table.name[1].config.object.config then
        local conf = full_UI_table.name[1].config.object.config
        if conf.string and #conf.string > 0 then
            local function m_ify_word(text)
                -- Define a pattern for vowels
                local vowels = "AEIOUaeiou"
            
                -- Use gsub to replace the first consonant of each word with 'M'
                local result = text:gsub("(%a)(%w*)", function(first, rest)
                    if vowels:find(first) then
                        -- If the first character is a vowel, add an M
                        if (not rest[1]) or (rest:lower()[1] == rest[1]) then --this check doesn't work properly
                            return "M" .. first:lower() .. rest
                        else
                            return "M" .. first:upper() .. rest
                        end
                    elseif first:lower() == "m" then
                        -- If the word already starts with 'M', keep it unchanged
                        return first .. rest
                    else
                        -- Replace the first consonant with 'M'
                        return "M" .. rest
                    end
                end)
            
                return result
            end
            function m_ify(text)
                -- Use gsub to apply the m_ify_word function to each word
                local result = text:gsub("(%S+)", function(word)
                    return m_ify_word(word)
                end)
            
                return result
            end
            conf.string[1] = m_ify(conf.string[1])
            full_UI_table.name[1].config.object:remove()
            full_UI_table.name[1].config.object = DynaText(conf)
        end
    end
    return full_UI_table
end

        end,
        items = miscitems}
