if not Cryptid then Cryptid = {} end
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
if cry_enable_jokers then Cryptid.memepack[#Cryptid.memepack+1] = "j_cry_reverse" end --uno reverse
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
    weight = 0.11/3, --0.11 base ÷ 3 since there are 3 identical packs
    create_card = function(self, card)
        return create_card("meme", G.pack_cards, nil, nil, true, true, nil, 'cry_meme')
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.SET.Code) --reused Code Pack code so this can be changed later with a diff colour
        ease_background_colour{new_colour = G.C.SET.Code, special_colour = G.C.BLACK, contrast = 2}
    end,
    loc_vars = function(self, info_queue, card)
	return { vars = {card.config.center.config.choose, card.ability.extra} }
    end,
    loc_txt = {
        name = "Meme Pack",
        text = {
            "Choose {C:attention}#1#{} of",
            "up to {C:attention}#2# Memes{}"
        }
    },
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
    weight = 0.11/3, --0.11 base ÷ 3 since there are 3 identical packs
    create_card = function(self, card)
        return create_card("meme", G.pack_cards, nil, nil, true, true, nil, 'cry_memetwo')
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.SET.Code) --reused Code Pack code so this can be changed later with a diff colour
        ease_background_colour{new_colour = G.C.SET.Code, special_colour = G.C.BLACK, contrast = 2}
    end,
    loc_vars = function(self, info_queue, card)
	return { vars = {card.config.center.config.choose, card.ability.extra} }
    end,
    loc_txt = {
        name = "Meme Pack",
        text = {
            "Choose {C:attention}#1#{} of",
            "up to {C:attention}#2# Memes{}"
        }
    },
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
    weight = 0.11/3, --0.11 base ÷ 3 since there are 3 identical packs
    create_card = function(self, card)
        return create_card("meme", G.pack_cards, nil, nil, true, true, nil, 'cry_memethree')
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.SET.Code) --reused Code Pack code so this can be changed later with a diff colour
        ease_background_colour{new_colour = G.C.SET.Code, special_colour = G.C.BLACK, contrast = 2}
    end,
    loc_vars = function(self, info_queue, card)
	return { vars = {card.config.center.config.choose, card.ability.extra} }
    end,
    loc_txt = {
        name = "Meme Pack",
        text = {
            "Choose {C:attention}#1#{} of",
            "up to {C:attention}#2# Memes{}"
        }
    },
    group_key = "k_cry_meme_pack"
}

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
    }
}
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
    }
}
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
    config = {retrigger_chance = 2, retriggers = 1},
    loc_vars = function(self, info_queue, center)
        local chance = center and center.edition.retrigger_chance or self.config.retrigger_chance
        local retriggers = center and center.edition.retriggers or self.config.retriggers

        return {vars = {G.GAME.probabilities.normal, chance, retriggers}}
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
            "Add an {C:cry_azure}Azure Seal{}",
            "to {C:attention}#1#{} selected",
            "card in your hand"
        }
    },
    cost = 4,
    atlas = "atlasnotjokers",
    pos = {x=0, y=4},
    use = function(self, card, area, copier) --Good enough
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
                        highlighted:set_seal('s_cry_azure')
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
    loc_txt = {
        name = "Cat Tag",
        text = {"Meow."}
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
--Bug: this still doesn't trigger immediately
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
                local key = 'p_spectral_normal_1'
                local card = Card(G.play.T.x + G.play.T.w/2 - G.CARD_W*1.27/2,
                G.play.T.y + G.play.T.h/2-G.CARD_H*1.27/2, G.CARD_W*1.27, G.CARD_H*1.27, G.P_CARDS.empty, G.P_CENTERS[key], {bypass_discovery_center = true, bypass_discovery_ui = true})
                card.cost = 0
                card.from_tag = true
                card.from_empowered = true
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
mosaic_shader, oversat_shader, glitched_shader, astral_shader, blurred_shader,
glitched, mosaic, oversat, blurred, astral,
echo_atlas, echo, eclipse, 
azure_seal_sprite, typhoon, azure_seal,
cat, empowered, gambler, bundle, memory}
if cry_enable_epics then
    miscitems[#miscitems+1] = epic_tag
end
return {name = "Misc.", 
        init = function()

function calculate_blurred(card)
    local retriggers = 1

    if card.edition.retrigger_chance then
        local chance = card.edition.retrigger_chance
        chance = G.GAME.probabilities.normal / chance

        if pseudorandom("blurred") <= chance then
            retriggers = retriggers + card.edition.retriggers
        end
    end
    
    return {
        message = 'Again?',
        repetitions = retriggers,
        card = card
    }
end

se = Card.set_edition
function Card:set_edition(x,y,z)
    local from_copy = false
    if self.from_copy then from_copy = true end
    self.from_copy = nil
    se(self,x,y,z)
    if not from_copy then
        if self.edition and self.edition.cry_oversat then
            cry_misprintize(self,nil,true)
            cry_misprintize(self, {min=2*(G.GAME.modifiers.cry_misprint_min or 1),max=2*(G.GAME.modifiers.cry_misprint_max or 1)})
        end
        if self.edition and self.edition.cry_glitched then
            cry_misprintize(self,nil,true)
            cry_misprintize(self, {min=0.1*(G.GAME.modifiers.cry_misprint_min or 1),max=10*(G.GAME.modifiers.cry_misprint_max or 1)})
        end
    end
end

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
        if self.edition and self.edition.cry_blur and not context.other_card then
            local check = calculate_blurred(self)
            
            if check and check.repetitions then
                total_repetitions = total_repetitions + check.repetitions
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

function Card:calculate_banana()
    if not self.ability.extinct then
        if self.ability.banana and (pseudorandom('banana') < G.GAME.probabilities.normal/10) then 
            self.ability.extinct = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound('tarot1')
                    self.T.r = -0.2
                    self:juice_up(0.3, 0.4)
                    self.states.drag.is = true
                    self.children.center.pinch.x = true
                    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                        func = function()
                                if self.area then self.area:remove_card(self) end
                                self:remove()
                                self = nil
                            return true; end})) 
                    return true
                end
            }))
            card_eval_status_text(self, 'jokers', nil, nil, nil, {message = localize('k_extinct_ex'), delay = 0.1})
            return true
        elseif self.ability.banana then
            card_eval_status_text(self, 'jokers', nil, nil, nil, {message = localize('k_safe_ex'), delay = 0.1})
            return false
        end
    end
    return false
end

function Card:set_banana(_banana)
    self.ability.banana = _banana
end

function Card:set_pinned(_pinned)
    self.pinned = _pinned
end
        end,
        items = miscitems}
