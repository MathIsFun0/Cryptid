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
    config = {Xchips = 2.5},
    sound = {
        sound = 'cry_e_mosaic',
        per = 1,
        vol = 0.2
    },
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,
    loc_vars = function(self, info_queue)
        return {vars = {self.config.Xchips}}
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
            "All values are {C:attention}doubled{}, if possible"
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
            "All values are {C:dark_edition}randomized{}",
            'between {C:blue}X0.1{} and {C:red}X10{}, if possible',
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
        sound = 'cry_^Mult',
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
    config = {pow_mult = 1.1},
    loc_vars = function(self, info_queue)
        return {vars = {self.config.pow_mult}}
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
    end
}

local eclipse_atlas = {
    object_type = 'Atlas',
    key = 'eclipse_atlas',
    path = 'c_cry_eclipse.png',
    px = 71,
    py = 95,
}

local eclipse = {
    object_type = "Consumable",
    set = "Tarot",
    name = "cry-Eclipse",
    key = "eclipse",
    pos = {x=0,y=0},
    config = {mod_conv = 'm_cry_echo', max_highlighted = 1},
    loc_txt = {
        name = 'The Eclipse',
        text = {
            "Enhances {C:attention}#1#{} selected card",
            "into an {C:attention}Echo Card"
        }
    },
    atlas = "eclipse_atlas",
    loc_vars = function(self, info_queue)
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
        description = {
            name = 'Azure Seal',
            text = {
                'Create {C:attention}#1#{} {C:dark_edition}Negative{}',
                '{C:planet}Planets{} for played',
                '{C:attention}poker hand{}, then',
                '{C:red}destroy{} this card'
            }
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
            "to {C:attention}1{} selected",
            "card in your hand"
        }
    },
    cost = 4,
    atlas = "typhoon_atlas",
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
    key = "typhoon_atlas",
    
    path = "s_cry_typhoon.png",
    px = 71,
    py = 95
}
return {name = "Misc.", 
        init = function()
            se = Card.set_edition
            function Card:set_edition(x,y,z)
                local was_oversat = self.edition and (self.edition.cry_oversat or self.edition.cry_glitched)
                se(self,x,y,z)
		if was_oversat then
			cry_misprintize(self,nil,true)
		end
		if self.edition and self.edition.cry_oversat then
			cry_misprintize(self, {min=2*(G.GAME.modifiers.cry_misprint_min or 1),max=2*(G.GAME.modifiers.cry_misprint_max or 1)})
		end
		if self.edition and self.edition.cry_glitched then
			cry_misprintize(self, {min=0.1*(G.GAME.modifiers.cry_misprint_min or 1),max=10*(G.GAME.modifiers.cry_misprint_max or 1)})
		end
            end
            --echo card
            cs = Card.calculate_seal
            function Card:calculate_seal(context)
                local ret = cs(self,context)
                if context.repetition then
                    if self.config.center == G.P_CENTERS.m_cry_echo then
                        if pseudorandom('echo') < G.GAME.probabilities.normal/self.ability.extra then
                            return {
                                message = localize('k_again_ex'),
                                repetitions = (ret and ret.repetitions or 0) + self.ability.retriggers,
                                card = self
                            }
                        end
                    end
                end
                return ret
            end
        end,
        items = {mosaic_shader, mosaic, oversat_shader, oversat, glitched_shader, glitched, astral_shader, astral, echo_atlas, echo, eclipse_atlas, eclipse, typhoon_sprite, azure_seal_sprite, typhoon, azure_seal}}

