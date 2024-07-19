local pink = {object_type = "Stake",
	name = "cry-Pink Stake",
	key = "pink",
	pos = {x = 0, y = 0},
    atlas = "stake",
    applied_stakes = {"gold"},
	loc_txt = {
        name = "Pink Stake",
        text = {
        "Required score scales",
        "faster for each {C:attention}Ante"
        }
    },
    modifiers = function()
        G.GAME.modifiers.scaling = math.max(G.GAME.modifiers.scaling or 0, 4)
    end,
    colour = HEX("ff5ee6")
}
local brown = {object_type = "Stake",
	name = "cry-Brown Stake",
	key = "brown",
	pos = {x = 1, y = 0},
    atlas = "stake",
    applied_stakes = {"cry_pink"},
    modifiers = function()
        G.GAME.modifiers.cry_eternal_perishable_compat = true
    end,
	loc_txt = {
        name = "Brown Stake",
        text = {
        "All {C:attention}stickers{} are compatible",
        "with each other"
        }
    },
    colour = HEX("883200")
}
local yellow = {object_type = "Stake",
	name = "cry-Yellow Stake",
	key = "yellow",
	pos = {x = 2, y = 0},
    atlas = "stake",
    applied_stakes = {"cry_brown"},
    modifiers = function()
        G.GAME.modifiers.cry_any_stickers = true
    end,
	loc_txt = {
        name = "Yellow Stake",
        text = {
        "{C:attention}Stickers{} can appear on",
        "all purchasable items"
        }
    },
    colour = HEX("f7ff1f")
}
local jade = {object_type = "Stake",
	name = "cry-Jade Stake",
	key = "jade",
	pos = {x = 3, y = 0},
    atlas = "stake",
    applied_stakes = {"cry_yellow"},
    modifiers = function()
        G.GAME.modifiers.flipped_cards = 20
    end,
	loc_txt = {
        name = "Jade Stake",
        text = {
        "Cards can be drawn {C:attention}face down{}",
        }
    },
    shiny = true,
    colour = HEX("78953c")
}
local cyan = {object_type = "Stake",
	name = "cry-Cyan Stake",
	key = "cyan",
	pos = {x = 4, y = 0},
    atlas = "stake",
    applied_stakes = {"cry_jade"},
    modifiers = function()
        G.GAME.modifiers.cry_rarer_jokers = true
    end,
	loc_txt = {
        name = "Cyan Stake",
        text = {
        "{C:green}Uncommon{} and {C:red}Rare{} Jokers are",
        "less likely to appear",
        }
    },
    colour = HEX("39ffcc")
}
local gray = {object_type = "Stake",
	name = "cry-Gray Stake",
	key = "gray",
	pos = {x = 0, y = 1},
    atlas = "stake",
    applied_stakes = {"cry_cyan"},
    modifiers = function()
        G.GAME.modifiers.cry_reroll_scaling = 2
    end,
	loc_txt = {
        name = "Gray Stake",
        text = {
        "Rerolls increase by {C:attention}$2{} each"
        }
    },
    colour = HEX("999999")
}
local crimson = {object_type = "Stake",
	name = "cry-Crimson Stake",
	key = "crimson",
	pos = {x = 1, y = 1},
    atlas = "stake",
    applied_stakes = {"cry_gray"},
    modifiers = function()
        G.GAME.modifiers.cry_voucher_restock_antes = 2
    end,
	loc_txt = {
        name = "Crimson Stake",
        text = {
        "Vouchers restock on {C:attention}even{} Antes",
        }
    },
    colour = HEX("800000")
}
local diamond = {object_type = "Stake",
	name = "cry-Diamond Stake",
	key = "diamond",
	pos = {x = 2, y = 1},
    atlas = "stake",
    applied_stakes = {"cry_crimson"},
    modifiers = function()
        G.GAME.win_ante = 10
    end,
	loc_txt = {
        name = "Diamond Stake",
        text = {
        "Must beat Ante {C:attention}10{} to win",
        }
    },
    shiny = true,
    colour = HEX("88e5d9")
}
local amber = {object_type = "Stake",
	name = "cry-Amber Stake",
	key = "amber",
	pos = {x = 3, y = 1},
    atlas = "stake",
    applied_stakes = {"cry_diamond"},
    modifiers = function()
        G.GAME.modifiers.cry_booster_packs = 1
    end,
	loc_txt = {
        name = "Amber Stake",
        text = {
        "{C:attention}-1{} Booster Pack slot",
        }
    },
    shiny = true,
    colour = HEX("feb900")
}
local bronze = {object_type = "Stake",
	name = "cry-Bronze Stake",
	key = "bronze",
	pos = {x = 4, y = 1},
    atlas = "stake",
    applied_stakes = {"cry_amber"},
    modifiers = function()
        G.GAME.modifiers.cry_voucher_price_hike = 1.5
    end,
	loc_txt = {
        name = "Bronze Stake",
        text = {
        "Vouchers are {C:attention}50%{} more expensive",
        }
    },
    shiny = true,
    colour = HEX("d27c37")
}
local quartz = {object_type = "Stake",
	name = "cry-Quartz Stake",
	key = "quartz",
	pos = {x = 0, y = 2},
    atlas = "stake",
    applied_stakes = {"cry_bronze"},
    modifiers = function()
        G.GAME.modifiers.cry_enable_pinned_in_shop = true
    end,
	loc_txt = {
        name = "Quartz Stake",
        text = {
        "Jokers can be {C:attention}Pinned{}",
        "{s:0.8,C:inactive}(Stays pinned to the leftmost position){}",
        }
    },
    shiny = true,
    colour = HEX("e8e8e8")
}
local ruby = {object_type = "Stake",
	name = "cry-Ruby Stake",
	key = "ruby",
	pos = {x = 1, y = 2},
    atlas = "stake",
    applied_stakes = {"cry_quartz"},
    modifiers = function()
        G.GAME.modifiers.cry_big_boss_rate = 0.3
    end,
	loc_txt = {
        name = "Ruby Stake",
        text = {
        "{C:attention}Big{} Blinds can become",
        "{C:attention}Boss{} Blinds",
        }
    },
    shiny = true,
    colour = HEX("fc5f55")
}
local glass = {object_type = "Stake",
	name = "cry-Glass Stake",
	key = "glass",
	pos = {x = 2, y = 2},
    atlas = "stake",
    applied_stakes = {"cry_ruby"},
    modifiers = function()
        G.GAME.modifiers.cry_shatter_rate = 30
    end,
	loc_txt = {
        name = "Glass Stake",
        text = {
        "Cards can {C:attention}shatter{} when scored",
        }
    },
    shiny = true,
    colour = HEX("ffffff8f")
}
local sapphire = {object_type = "Stake",
	name = "cry-Sapphire Stake",
	key = "sapphire",
	pos = {x = 3, y = 2},
    atlas = "stake",
    applied_stakes = {"cry_glass"},
    modifiers = function()
        G.GAME.modifiers.cry_ante_tax = 0.25
        G.GAME.modifiers.cry_ante_tax_max = 10
    end,
	loc_txt = {
        name = "Sapphire Stake",
        text = {
        "Lose {C:attention}25%{} of current money",
        "at end of Ante",
        "{s:0.8,C:inactive}(Up to $10){}",
        }
    },
    shiny = true,
    colour = HEX("3551fc")
}
local emerald = {object_type = "Stake",
	name = "cry-Emerald Stake",
	key = "emerald",
	pos = {x = 4, y = 2},
    atlas = "stake",
    applied_stakes = {"cry_sapphire"},
    modifiers = function()
        G.GAME.modifiers.cry_enable_flipped_in_shop = true
    end,
	loc_txt = {
        name = "Emerald Stake",
        text = {
        "Cards, packs, and vouchers",
        "can be {C:attention}face down{}",
        "{s:0.8,C:inactive}(Unable to be viewed until purchased){}",
        }
    },
    shiny = true,
    colour = HEX("06fc2c")
}
local platinum = {object_type = "Stake",
	name = "cry-Platinum Stake",
	key = "platinum",
	pos = {x = 0, y = 3},
    atlas = "stake",
    applied_stakes = {"cry_emerald"},
    modifiers = function()
        G.GAME.modifiers.cry_no_small_blind = true
        G.GAME.round_resets.blind_states['Small'] = 'Hide'
    end,
	loc_txt = {
        name = "Platinum Stake",
        text = {
        "Small Blinds are {C:attention}removed{}",
        }
    },
    shiny = true,
    colour = HEX("b0f6ff")
}
--init colors so they have references 
G.C.CRY_TWILIGHT = {0,0,0,0}
G.C.CRY_VERDANT = {0,0,0,0}
G.C.CRY_EMBER = {0,0,0,0}
G.C.CRY_DAWN = {0,0,0,0}
G.C.CRY_HORIZON = {0,0,0,0}
G.C.CRY_BLOSSOM = {0,0,0,0}
G.C.CRY_AZURE = {0,0,0,0}
G.C.CRY_ASCENDANT = {0,0,0,0}
local twilight = {object_type = "Stake",
	name = "cry-Twilight Stake",
	key = "twilight",
	pos = {x = 1, y = 3},
    atlas = "stake",
    applied_stakes = {"cry_platinum"},
    modifiers = function()
        G.GAME.modifiers.enable_banana = true
    end,
	loc_txt = {
        name = "Twilight Stake",
        text = {
        "Cards can be {C:attention}Banana{}",
        "{s:0.8,C:inactive}(1 in 10 chance of being destroyed each round){}",
        }
    },
    shiny = true,
    colour = G.C.CRY_TWILIGHT
}
local verdant = {object_type = "Stake",
	name = "cry-Verdant Stake",
	key = "verdant",
	pos = {x = 2, y = 3},
    atlas = "stake",
    applied_stakes = {"cry_twilight"},
    modifiers = function()
        G.GAME.modifiers.scaling = 5
    end,
	loc_txt = {
        name = "Verdant Stake",
        text = {
        "Required score scales",
        "faster for each {C:attention}Ante",
        }
    },
    shiny = true,
    colour = G.C.CRY_VERDANT
}
local ember = {object_type = "Stake",
	name = "cry-Ember Stake",
	key = "ember",
	pos = {x = 3, y = 3},
    atlas = "stake",
    applied_stakes = {"cry_verdant"},
    modifiers = function()
        G.GAME.modifiers.cry_no_sell_value = true
    end,
	loc_txt = {
        name = "Ember Stake",
        text = {
        "All items have no sell value",
        }
    },
    shiny = true,
    colour = G.C.CRY_EMBER
}
local dawn = {object_type = "Stake",
	name = "cry-Dawn Stake",
	key = "dawn",
	pos = {x = 4, y = 3},
    atlas = "stake",
    applied_stakes = {"cry_ember"},
    modifiers = function()
        G.GAME.modifiers.cry_consumable_reduce = true
    end,
	loc_txt = {
        name = "Dawn Stake",
        text = {
        "Tarots and Spectrals target {C:attention}1",
        "fewer card",
        "{s:0.8,C:inactive}(Minimum of 1){}"
        }
    },
    shiny = true,
    colour = G.C.CRY_DAWN
}
local horizon = {object_type = "Stake",
	name = "cry-Horizon Stake",
	key = "horizon",
	pos = {x = 0, y = 4},
    atlas = "stake",
    applied_stakes = {"cry_dawn"},
    modifiers = function()
        G.GAME.modifiers.cry_card_each_round = true
    end,
	loc_txt = {
        name = "Horizon Stake",
        text = {
        "When blind selected, add a",
        "{C:attention}random card{} to deck",
        }
    },
    shiny = true,
    colour = G.C.CRY_HORIZON
}
local blossom = {object_type = "Stake",
	name = "cry-Blossom Stake",
	key = "blossom",
	pos = {x = 1, y = 4},
    atlas = "stake",
    applied_stakes = {"cry_horizon"},
    modifiers = function()
        G.GAME.modifiers.cry_big_showdown = true
    end,
	loc_txt = {
        name = "Blossom Stake",
        text = {
        "{C:attention}Final{} Boss Blinds can appear",
        "in {C:attention}any{} Ante"
        }
    },
    shiny = true,
    colour = G.C.CRY_BLOSSOM
}
local azure = {object_type = "Stake",
	name = "cry-Azure Stake",
	key = "azure",
	pos = {x = 2, y = 4},
    atlas = "stake",
    applied_stakes = {"cry_blossom"},
    modifiers = function()
        G.GAME.modifiers.cry_jkr_misprint_mod = 0.8
    end,
	loc_txt = {
        name = "Azure Stake",
        text = {
        "Values on Jokers are reduced",
        "by {C:attention}20%{}"
        }
    },
    shiny = true,
    colour = G.C.CRY_AZURE
}
local ascendant = {object_type = "Stake",
	name = "cry-Ascendant Stake",
	key = "ascendant",
	pos = {x = 3, y = 4},
    atlas = "stake",
    applied_stakes = {"cry_azure"},
    modifiers = function()
        change_shop_size(-1)
    end,
	loc_txt = {
        name = "Ascendant Stake",
        text = {
        "{C:attention}-1{} Shop slot",
        }
    },
    shiny = true,
    colour = G.C.CRY_ASCENDANT
}
local stake_atlas = {object_type = "Atlas",
    key = "stake",
    
    path = "stake_cry.png",
    px = 29,
    py = 29
}
return {name = "More Stakes", 
        init = function(self)
            -- Ante scaling changes
            local gba = get_blind_amount
            function get_blind_amount(ante)
                local k = to_big(0.7)
                if G.GAME.modifiers.scaling == 4 then
                    local amounts = {
                        to_big(300),  to_big(1200), to_big(4000),  to_big(11000),  to_big(30000),  to_big(100000),  to_big(180000),  to_big(300000)
                    }
                    if ante < 1 then return to_big(100) end
                    if ante <= 8 then return amounts[ante] end
                    local a, b, c, d = amounts[8],1.6,ante-8, 1 + 0.2*(ante-8)
                    local amount = a*(b+(k*c)^d)^c
                    if type(amount) == 'table' then
                        if (amount:lt(R.MAX_SAFE_INTEGER)) then
                            local exponent = to_big(10)^(math.floor(amount:log10() - to_big(1))):to_number()
                            amount = math.floor(amount / exponent):to_number() * exponent
                        end
                        amount:normalize()
                    else
                      amount = amount - amount%(10^math.floor(math.log10(amount)-1))
                    end
                    return amount
                elseif G.GAME.modifiers.scaling == 5 then
                    local amounts = {
                        to_big(300),  to_big(1500), to_big(5000),  to_big(14000),  to_big(35000),  to_big(150000),  to_big(260000),  to_big(400000)
                    }
                    if ante < 1 then return to_big(100) end
                    if ante <= 8 then return amounts[ante] end
                    local a, b, c, d = amounts[8],1.6,ante-8, 1 + 0.2*(ante-8)
                    local amount = a*(b+(k*c)^d)^c
                    if type(amount) == 'table' then
                        if (amount:lt(R.MAX_SAFE_INTEGER)) then
                            local exponent = to_big(10)^(math.floor(amount:log10() - to_big(1))):to_number()
                            amount = math.floor(amount / exponent):to_number() * exponent
                        end
                        amount:normalize()
                    else
                      amount = amount - amount%(10^math.floor(math.log10(amount)-1))
                    end
                    return amount
                else return gba(ante)
                end
            end
            -- Disallow use of Debuffed Perishable consumables
            local cuc = Card.can_use_consumeable
            function Card:can_use_consumeable(any_state, skip_check)
                if self.ability.perish_tally == nil then
                    self.ability.perish_tally = G.GAME.perishable_rounds or 5
                end
                if self.ability.perishable and self.ability.perish_tally <= 0 then 
                    return false
                end
                return cuc(self, any_state, skip_check)
            end
            -- Overriding Steamodded's registering of Incantation/Familiar/Grim
            local function random_destroy(used_tarot)
                local destroyed_cards = {}
                local temp_hand = {}
                local hasHand = false
                for k, v in ipairs(G.hand.cards) do 
                    if not v.ability.eternal then
                        temp_hand[#temp_hand+1] = v
                        hasHand = true
                    end
                end
                if hasHand then destroyed_cards[#destroyed_cards + 1] = pseudorandom_element(temp_hand, pseudoseed('random_destroy')) end
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4,
                    func = function()
                        play_sound('tarot1')
                        if used_tarot and used_tarot.juice_up then used_tarot:juice_up(0.3, 0.5) end
                        return true
                    end
                }))
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        for i = #destroyed_cards, 1, -1 do
                            local card = destroyed_cards[i]
                            if card.ability.name == 'Glass Card' then
                                card:shatter()
                            else
                                card:start_dissolve(nil, i ~= #destroyed_cards)
                            end
                        end
                        return true
                    end
                }))
                return destroyed_cards
            end
            SMODS.Consumable:take_ownership('grim', {
                use = function(self, card, area, copier)
                    local used_tarot = copier or card
                    local destroyed_cards = random_destroy(used_tarot)
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.7,
                        func = function()
                            local cards = {}
                            for i = 1, card.ability.extra do
                                cards[i] = true
                                local suit_list = {}
                                for i = #SMODS.Suit.obj_buffer, 1, -1 do
                                    suit_list[#suit_list + 1] = SMODS.Suit.obj_buffer[i]
                                end
                                local _suit, _rank =
                                    SMODS.Suits[pseudorandom_element(suit_list, pseudoseed('grim_create'))].card_key, 'A'
                                local cen_pool = {}
                                for k, v in pairs(G.P_CENTER_POOLS["Enhanced"]) do
                                    if v.key ~= 'm_stone' then
                                        cen_pool[#cen_pool + 1] = v
                                    end
                                end
                                create_playing_card({
                                    front = G.P_CARDS[_suit .. '_' .. _rank],
                                    center = pseudorandom_element(cen_pool, pseudoseed('spe_card'))
                                }, G.hand, nil, i ~= 1, { G.C.SECONDARY_SET.Spectral })
                            end
                            playing_card_joker_effects(cards)
                            return true
                        end
                    }))
                    delay(0.3)
                    for i = 1, #G.jokers.cards do
                        G.jokers.cards[i]:calculate_joker({ remove_playing_cards = true, removed = destroyed_cards })
                    end
                end,
            },true)
            SMODS.Consumable:take_ownership('familiar', {
                use = function(self, card, area, copier)
                    local used_tarot = copier or card
                    local destroyed_cards = random_destroy(used_tarot)
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.7,
                        func = function()
                            local cards = {}
                            for i = 1, card.ability.extra do
                                cards[i] = true
                                local suit_list = {}
                                for i = #SMODS.Suit.obj_buffer, 1, -1 do
                                    suit_list[#suit_list + 1] = SMODS.Suit.obj_buffer[i]
                                end
                                local faces = {}
                                for _, v in ipairs(SMODS.Rank.obj_buffer) do
                                    local r = SMODS.Ranks[v]
                                    if r.face then table.insert(faces, r.card_key) end
                                end
                                local _suit, _rank =
                                    SMODS.Suits[pseudorandom_element(suit_list, pseudoseed('familiar_create'))].card_key,
                                    pseudorandom_element(faces, pseudoseed('familiar_create'))
                                local cen_pool = {}
                                for k, v in pairs(G.P_CENTER_POOLS["Enhanced"]) do
                                    if v.key ~= 'm_stone' then
                                        cen_pool[#cen_pool + 1] = v
                                    end
                                end
                                create_playing_card({
                                    front = G.P_CARDS[_suit .. '_' .. _rank],
                                    center = pseudorandom_element(cen_pool, pseudoseed('spe_card'))
                                }, G.hand, nil, i ~= 1, { G.C.SECONDARY_SET.Spectral })
                            end
                            playing_card_joker_effects(cards)
                            return true
                        end
                    }))
                    delay(0.3)
                    for i = 1, #G.jokers.cards do
                        G.jokers.cards[i]:calculate_joker({ remove_playing_cards = true, removed = destroyed_cards })
                    end
                end,
            },true)
            SMODS.Consumable:take_ownership('incantation', {
                use = function(self, card, area, copier)
                    local used_tarot = copier or card
                    local destroyed_cards = random_destroy(used_tarot)
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.7,
                        func = function()
                            local cards = {}
                            for i = 1, card.ability.extra do
                                cards[i] = true
                                local suit_list = {}
                                for i = #SMODS.Suit.obj_buffer, 1, -1 do
                                    suit_list[#suit_list + 1] = SMODS.Suit.obj_buffer[i]
                                end
                                local numbers = {}
                                for _RELEASE_MODE, v in ipairs(SMODS.Rank.obj_buffer) do
                                    local r = SMODS.Ranks[v]
                                    if v ~= 'Ace' and not r.face then table.insert(numbers, r.card_key) end
                                end
                                local _suit, _rank =
                                    SMODS.Suits[pseudorandom_element(suit_list, pseudoseed('incantation_create'))].card_key,
                                    pseudorandom_element(numbers, pseudoseed('incantation_create'))
                                local cen_pool = {}
                                for k, v in pairs(G.P_CENTER_POOLS["Enhanced"]) do
                                    if v.key ~= 'm_stone' then
                                        cen_pool[#cen_pool + 1] = v
                                    end
                                end
                                create_playing_card({
                                    front = G.P_CARDS[_suit .. '_' .. _rank],
                                    center = pseudorandom_element(cen_pool, pseudoseed('spe_card'))
                                }, G.hand, nil, i ~= 1, { G.C.SECONDARY_SET.Spectral })
                            end
                            playing_card_joker_effects(cards)
                            return true
                        end
                    }))
                    delay(0.3)
                    for i = 1, #G.jokers.cards do
                        G.jokers.cards[i]:calculate_joker({ remove_playing_cards = true, removed = destroyed_cards })
                    end
                end,
            },true)
            
            -- This is short enough that I'm fine overriding it
            function calculate_reroll_cost(skip_increment)
                if G.GAME.current_round.free_rerolls < 0 then G.GAME.current_round.free_rerolls = 0 end
                if G.GAME.current_round.free_rerolls > 0 then G.GAME.current_round.reroll_cost = 0; return end
                G.GAME.current_round.reroll_cost_increase = G.GAME.current_round.reroll_cost_increase or 0
                if not skip_increment then G.GAME.current_round.reroll_cost_increase = G.GAME.current_round.reroll_cost_increase + (G.GAME.modifiers.cry_reroll_scaling or 1) end
                G.GAME.current_round.reroll_cost = (G.GAME.round_resets.temp_reroll_cost or G.GAME.round_resets.reroll_cost) + G.GAME.current_round.reroll_cost_increase
            end
            
            local sc = Card.set_cost
            function Card:set_cost()
                sc(self)
                if self.ability.set == 'Voucher' and G.GAME.modifiers.cry_voucher_price_hike then
                    self.cost = math.floor(self.cost * G.GAME.modifiers.cry_voucher_price_hike)
                    --Update related costs
                    self.sell_cost = math.max(1, math.floor(self.cost/2)) + (self.ability.extra_value or 0)
                    if self.area and self.ability.couponed and (self.area == G.shop_jokers or self.area == G.shop_booster) then self.cost = 0 end
                    self.sell_cost_label = self.facing == 'back' and '?' or self.sell_cost
                end
                if G.GAME.modifiers.cry_no_sell_value then
                    self.sell_cost = 0
                end
            end

            for _, v in pairs(self.items) do
                if v.object_type == "Stake" then
                    v.sticker_pos = v.pos
                    v.sticker_atlas = "sticker"
                    local words = {}
                    words[1], words[2] = v.loc_txt.name:match("(%w+)(.+)")
                    local stakeName = words[1]
                    v.loc_txt = {description = v.loc_txt}
                    v.loc_txt.sticker = {
                        name = stakeName.." Sticker",
                        text = {
                            "Used this Joker",
                            "to win on {C:attention}"..stakeName,
                            "{C:attention}Stake{} difficulty"
                        }
                    }
                end
            end
        end,
        items = {stake_atlas, pink, brown, yellow, jade, cyan, gray, crimson, diamond,
        amber, bronze, quartz, ruby, glass, sapphire, emerald, platinum,
        twilight, verdant, ember, dawn, horizon, blossom, azure, ascendant}}