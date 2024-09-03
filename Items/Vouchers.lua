local voucher_atlas = {
    object_type = "Atlas",
    key = "atlasvoucher",
    path = "atlasvoucher.png",
    px = 71,
    py = 95
}
local copies = {
    object_type = "Voucher",
	key = "copies",
    	atlas = "atlasvoucher",
	pos = {x = 1, y = 1},
	loc_txt = {
        name = 'Copies',
        text = {
	    "Double Tags become",
	    "{C:attention}Triple Tags{} and are",
            "{C:attention}2X{} as common"
		}
    },
    loc_vars = function(self, info_queue)
        --info_queue[#info_queue+1] = {set = "Tag", key = "tag_double"}
        --info_queue[#info_queue+1] = {set = "Tag", key = "tag_cry_triple", specific_vars = {2}}
        return {vars = {}}
    end,
}
local tag_printer = {
    object_type = "Voucher",
	key = "tag_printer",
    	atlas = "atlasvoucher",
	pos = {x = 1, y = 2},
	loc_txt = {
        name = 'Tag Printer',
        text = {
	    "Double Tags become",
	    "{C:attention}Quadruple Tags{} and",
            "are {C:attention}3X{} as common"
		}
    },
    loc_vars = function(self, info_queue)
        --info_queue[#info_queue+1] = {set = "Tag", key = "tag_double"}
        --info_queue[#info_queue+1] = {set = "Tag", key = "tag_cry_quadruple", specific_vars = {3}}
        return {vars = {}}
    end,
    requires = {"v_cry_copies"}
}
local clone_machine = {
    object_type = "Voucher",
	key = "clone_machine",
    	atlas = "atlasvoucher",
	pos = {x = 1, y = 3},
	loc_txt = {
        name = 'Clone Machine',
        text = {
	    "Double Tags become",
	    "{C:attention}Quintuple Tags{} and",
            "are {C:attention}4X{} as common"
		}
    },
    loc_vars = function(self, info_queue)
        --info_queue[#info_queue+1] = {set = "Tag", key = "tag_double"}
        --info_queue[#info_queue+1] = {set = "Tag", key = "tag_cry_quintuple", specific_vars = {4}}
        return {vars = {}}
    end,
    requires = {"v_cry_tag_printer"}
}
local command_prompt = {
    object_type = "Voucher",
	key = "command_prompt",
    	atlas = "atlasvoucher",
	pos = {x = 0, y = 1},
	loc_txt = {
        name = 'Command Prompt',
        text = {
	    "{C:cry_code}Code{} cards",
	    "can appear",
            "in the {C:attention}shop{}"
		}
    },
    loc_vars = function(self, info_queue)
        return {vars = {}}
    end,
    redeem = function(self)
        G.E_MANAGER:add_event(Event({func = function()
            G.GAME.code_rate = 4
        return true end }))
    end
}
local satellite_uplink = {
    object_type = "Voucher",
	key = "satellite_uplink",
    	atlas = "atlasvoucher",
	pos = {x = 0, y = 2},
	loc_txt = {
        name = 'Satellite Uplink',
        text = {
			"{C:cry_code}Code{} cards may",
            "appear in any of",
            "the {C:attention}Celestial Packs{}"
		}
    },
    loc_vars = function(self, info_queue)
        return {vars = {}}
    end,
    requires = {"v_cry_command_prompt"}
}
local quantum_computing = {
    object_type = "Voucher",
	key = "quantum_computing",
    	atlas = "atlasvoucher",
	pos = {x = 0, y = 3},
	loc_txt = {
        name = 'Quantum Computing',
        text = {
			"{C:cry_code}Code{} cards can spawn",
            "with {C:dark_edition}Negative{} edition"
		}
    },
    loc_vars = function(self, info_queue)
        return {vars = {}}
    end,
    requires = {"v_cry_satellite_uplink"}
}
local overstock_multi = {
    	object_type = "Voucher",
	key = "overstock_multi",
	config = {extra = 1},
   	atlas = "atlasvoucher",
	pos = {x = 4, y = 1},
	requires = {"v_overstock_plus"},
	loc_txt = {
        name = 'Multistock',
        text = {
	    "{C:attention}+#1#{} card slot(s) and",
            "{C:attention}+#1#{} booster pack slot(s)",
	    "available in shop"
		}
    },
    loc_vars = function(self, info_queue)
        return {vars = {math.max(1, math.floor(self.config.extra))}}
    end,
    redeem = function(self)
	if not G.GAME.modifiers.cry_booster_packs then G.GAME.modifiers.cry_booster_packs = 2 end
        G.GAME.modifiers.cry_booster_packs = G.GAME.modifiers.cry_booster_packs + math.max(1, math.floor(self.config.extra)) --Booster slots
	G.E_MANAGER:add_event(Event({func = function() --card slot
            change_shop_size(math.max(1, math.floor(self.config.extra)))
            return true end }))
    end
}
local massproduct = {
    	object_type = "Voucher",
	key = "massproduct",
   	atlas = "atlasvoucher",
	pos = {x = 6, y = 4},
	requires = {"v_liquidation"},
	loc_txt = {
        name = 'Mass Production',
        text = {
	    "All cards and packs",
	    "in shop cost {C:attention}$1{}"
		}
    },
    redeem = function(self)
        G.E_MANAGER:add_event(Event({func = function()
            G.GAME.discount_percent = 100
            for k, v in pairs(G.I.CARD) do
                if v.set_cost then v:set_cost() end
            end
            return true end }))
    end
}
local curate = {
    	object_type = "Voucher",
	key = "curate",
   	atlas = "atlasvoucher",
	pos = {x = 6, y = 1},
	requires = {"v_glow_up"},
	loc_txt = {
        name = 'Curate',
        text = {
	    "All cards",
            "appear with",
	    "an {C:dark_edition}Edition{}"
		}
    },
}
local rerollexchange = {
    	object_type = "Voucher",
	key = "rerollexchange",
   	atlas = "atlasvoucher",
	pos = {x = 2, y = 0},
	requires = {"v_reroll_glut"},
	loc_txt = {
        name = 'Reroll Exchange',
        text = {
	    "All rerolls",
            "cost {C:attention}$2{}"
		}
    	},
	redeem = function(self)
	--most of the code for this (one line) is in cryptid.lua, check out the reroll function there
        G.E_MANAGER:add_event(Event({func = function()
            if G.GAME.current_round.reroll_cost > 2 then G.GAME.current_round.reroll_cost = 2 end
        return true end }))
    	end
}
local scope = {
    	object_type = "Voucher",
	key = "scope",
   	atlas = "atlasvoucher",
	pos = {x = 2, y = 0},
	requires = {"v_observatory"},
	loc_txt = {
        name = 'Galactic Scope',
        text = {
	    "Create the {C:planet}Planet",
            "card for played",
	    "{C:attention}poker hand{}",
	    "{C:inactive}(Must have room){}"
		}
    	},
}
local dexterity = {
    	object_type = "Voucher",
	key = "dexterity",
	config = {extra = 2},
   	atlas = "atlasvoucher",
	pos = {x = 2, y = 0},
	requires = {"v_nacho_tong"},
	loc_txt = {
        name = 'Dexterity',
        text = {
	    "Permanently",
            "gain {C:blue}+#1#{} hand(s)",
	    "each round"
		}
    },
    loc_vars = function(self, info_queue)
        return {vars = {math.max(1, math.floor(self.config.extra))}}
    end,
    redeem = function(self)
        G.E_MANAGER:add_event(Event({func = function()
            G.GAME.round_resets.hands = G.GAME.round_resets.hands + math.max(1, math.floor(self.config.extra))
	    ease_hands_played(math.max(1, math.floor(self.config.extra)))
        return true end }))
    end
}
local threers = {
    	object_type = "Voucher",
	key = "threers",
	config = {extra = 2},
   	atlas = "atlasvoucher",
	pos = {x = 5, y = 0},
	requires = {"v_recyclomancy"},
	loc_txt = {
        name = 'The 3 Rs',
        text = {
	    "Permanently",
            "gain {C:red}+#1#{} discard(s)",
	    "each round"
		}
    },
    loc_vars = function(self, info_queue)
        return {vars = {math.max(1, math.floor(self.config.extra))}}
    end,
    redeem = function(self)
        G.E_MANAGER:add_event(Event({func = function()
            G.GAME.round_resets.discards = G.GAME.round_resets.discards + math.max(1, math.floor(self.config.extra))
	    ease_discard(math.max(1, math.floor(self.config.extra)))
        return true end }))
    end
}
local tacclimator = {
    	object_type = "Voucher",
	key = "tacclimator",
	config = {extra = 56/4, extra_disp = 6}, --blame thunk for this extra value
   	atlas = "atlasvoucher",
	pos = {x = 1, y = 4},
	requires = {"v_tarot_tycoon"},
	loc_txt = {
        name = 'Tarot Acclimator',
        text = {
	    "{C:tarot}Tarot{} cards appear",
            "{C:attention}X#1#{} more frequently",
	    "in the shop",
	    "All future {C:tarot}Tarot{}",
	    "cards are {C:green}free{}"
		}
    },
    loc_vars = function(self, info_queue)
        return {vars = {self.config.extra_disp}}
    end,
    redeem = function(self)
        G.E_MANAGER:add_event(Event({func = function()
            G.GAME.tarot_rate = 4*self.config.extra
            return true end }))
    end
}
local pacclimator = {
    	object_type = "Voucher",
	key = "pacclimator",
	config = {extra = 56/4, extra_disp = 6}, --blame thunk for this extra value
   	atlas = "atlasvoucher",
	pos = {x = 0, y = 4},
	requires = {"v_planet_tycoon"},
	loc_txt = {
        name = 'Planet Acclimator',
        text = {
	    "{C:planet}Planet{} cards appear",
            "{C:attention}X#1#{} more frequently",
	    "in the shop",
	    "All future {C:planet}Planet{}",
	    "cards are {C:green}free{}"
		}
    },
    loc_vars = function(self, info_queue)
        return {vars = {self.config.extra_disp}}
    end,
    redeem = function(self)
        G.E_MANAGER:add_event(Event({func = function()
            G.GAME.planet_rate = 4*self.config.extra
            return true end }))
    end
}
local moneybean = {
    	object_type = "Voucher",
	key = "moneybean",
	config = {extra = 1e300},
   	atlas = "atlasvoucher",
	pos = {x = 5, y = 1},
	requires = {"v_money_tree"},
	loc_txt = {
        name = 'Money Beanstalk',
        text = {
	    "Raise the cap on",
            "interest earned in",
	    "each round to {C:money}$#1#{}",
		}
    },
    loc_vars = function(self, info_queue)
        return {vars = {self.config.extra/5}}
    end,
    redeem = function(self)
         G.E_MANAGER:add_event(Event({func = function()
            G.GAME.interest_cap = self.config.extra
            return true end }))
    end
}
local fabric = {
    	object_type = "Voucher",
	key = "fabric",
	config = {extra = 2},
   	atlas = "atlasvoucher",
	pos = {x = 2, y = 0},
	requires = {"v_antimatter"},
	loc_txt = {
        name = 'Universal Fabric',
        text = {
	    "{C:dark_edition}+#1#{} Joker slot(s)"
		}
    },
    loc_vars = function(self, info_queue)
        return {vars = {math.max(1, math.floor(self.config.extra))}}
    end,
    redeem = function(self)
	 G.E_MANAGER:add_event(Event({func = function()
            if G.jokers then 
                G.jokers.config.card_limit = G.jokers.config.card_limit + math.max(1, math.floor(self.config.extra))
            end
            return true end }))
    end
}
local asteroglyph = {
    	object_type = "Voucher",
	key = "asteroglyph",
   	atlas = "atlasvoucher",
	pos = {x = 5, y = 2},
	requires = {"v_petroglyph"},
	loc_txt = {
        name = 'Asteroglyph',
        text = {
	    "Set Ante to {C:attention}0{}"
		}
    },
    redeem = function(self)
	ease_ante(-G.GAME.round_resets.ante)
        G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante --idk if this stuff is actually needed or not
        G.GAME.round_resets.blind_ante = 0 --Kinda in incorrect interaction with redemmed deck when heiroglyph/petroglyph is redeemed at ante 1, not sure if this code causes it but can't be bothered
    end
}
local blankcanvas = {
    	object_type = "Voucher",
	key = "blankcanvas",
	config = {extra = 2},
   	atlas = "atlasvoucher",
	pos = {x = 2, y = 4},
	requires = {"v_palette"},
	loc_txt = {
        name = 'Blank Canvas',
        text = {
	    "{C:attention}+#1#{} hand size"
		}
    },
    loc_vars = function(self, info_queue)
        return {vars = {math.max(1, math.floor(self.config.extra))}}
    end,
    redeem = function(self)
	G.hand:change_size(math.max(1, math.floor(self.config.extra)))
    end
}
local triple = { --Copies voucher triple tag
    object_type = "Tag",
    atlas = "tag_cry",
    pos = {x=0, y=1},
    config = {type = 'tag_add', num = 2},
    key = "triple",
    loc_txt = {
        name = "Triple Tag",
        text = {
            "Gives {C:attention}#1#{} copies of the",
            "next selected {C:attention}Tag",
            "{s:0.8,C:inactive}Copying Tags excluded",
        }
    },
    loc_vars = function(self, info_queue)
        return {vars = {self.config.num}}
    end,
    apply = function(tag, context)
        if context.type == 'tag_add' and context.tag.key ~= 'tag_double' and context.tag.key ~= 'tag_cry_triple' and context.tag.key ~= 'tag_cry_quadruple' and context.tag.key ~= 'tag_cry_quintuple' and context.tag.key ~= 'tag_cry_memory' then
            local lock = tag.ID
            G.CONTROLLER.locks[lock] = true
            tag:yep('+', G.C.RED,function()
                if context.tag.ability and context.tag.ability.orbital_hand then
                    G.orbital_hand = context.tag.ability.orbital_hand
                end
                for i = 1, tag.config.num do
                    add_tag(Tag(context.tag.key))
                end
                G.orbital_hand = nil
                G.CONTROLLER.locks[lock] = nil
                return true
            end)
            tag.triggered = true
        end
        return true
    end,
    in_pool = function()
        return G.GAME.used_vouchers.v_cry_copies
    end
}
local quadruple = { --Tag printer voucher quadruple tag
    object_type = "Tag",
    atlas = "tag_cry",
    pos = {x=1, y=1},
    config = {type = 'tag_add', num = 3},
    key = "quadruple",
    loc_txt = {
        name = "Quadruple Tag",
        text = {
            "Gives {C:attention}#1#{} copies of the",
            "next selected {C:attention}Tag",
            "{s:0.8,C:inactive}Copying Tags excluded",
        }
    },
    loc_vars = function(self, info_queue)
        return {vars = {self.config.num}}
    end,
    apply = function(tag, context)
        if context.type == 'tag_add' and context.tag.key ~= 'tag_double' and context.tag.key ~= 'tag_cry_triple' and context.tag.key ~= 'tag_cry_quadruple' and context.tag.key ~= 'tag_cry_quintuple' and context.tag.key ~= 'tag_cry_memory' then
            local lock = tag.ID
            G.CONTROLLER.locks[lock] = true
            tag:yep('+', G.C.RED,function()
                if context.tag.ability and context.tag.ability.orbital_hand then
                    G.orbital_hand = context.tag.ability.orbital_hand
                end
                for i = 1, tag.config.num do
                    add_tag(Tag(context.tag.key))
                end
                G.orbital_hand = nil
                G.CONTROLLER.locks[lock] = nil
                return true
            end)
            tag.triggered = true
        end
        return true
    end,
    in_pool = function()
        return G.GAME.used_vouchers.v_cry_tag_printer
    end
}
local quintuple = { --Clone machine voucher quintuple tag
    object_type = "Tag",
    atlas = "tag_cry",
    pos = {x=2, y=1},
    config = {type = 'tag_add', num = 4},
    key = "quintuple",
    loc_txt = {
        name = "Quintuple Tag",
        text = {
            "Gives {C:attention}#1#{} copies of the",
            "next selected {C:attention}Tag",
            "{s:0.8,C:inactive}Copying Tags excluded",
        }
    },
    loc_vars = function(self, info_queue)
        return {vars = {self.config.num}}
    end,
    apply = function(tag, context)
        if context.type == 'tag_add' and context.tag.key ~= 'tag_double' and context.tag.key ~= 'tag_cry_triple' and context.tag.key ~= 'tag_cry_quadruple' and context.tag.key ~= 'tag_cry_quintuple' and context.tag.key ~= 'tag_cry_memory' then
            local lock = tag.ID
            G.CONTROLLER.locks[lock] = true
            tag:yep('+', G.C.RED,function()
                if context.tag.ability and context.tag.ability.orbital_hand then
                    G.orbital_hand = context.tag.ability.orbital_hand
                end
                for i = 1, tag.config.num do
                    add_tag(Tag(context.tag.key))
                end
                G.orbital_hand = nil
                G.CONTROLLER.locks[lock] = nil
                return true
            end)
            tag.triggered = true
        end
        return true
    end,
    in_pool = function()
        return G.GAME.used_vouchers.v_cry_clone_machine
    end
}

-- If Tier 3 Vouchers is loaded, make Cryptid function as Tier 4 Vouchers
if SMODS.Mods["Tier3Sub"] then
    overstock_multi.requires[#overstock_multi.requires+1] = "v_overstock_three"
    massproduct.requires[#massproduct.requires+1] = "v_money_mint"
    curate.requires[#curate.requires+1] = "v_glow_in_dark"
    rerollexchange.requires[#rerollexchange.requires+1] = "v_reroll_addict"
    dexterity.requires[#dexterity.requires+1] = "v_applause"
    threers.requires[#threers.requires+1] = "v_down_to_zero"
    tacclimator.requires[#tacclimator.requires+1] = "v_tarot_factory"
    pacclimator.requires[#pacclimator.requires+1] = "v_planet_factory"
    moneybean.requires[#moneybean.requires+1] = "v_money_forest"
    fabric.requires[#fabric.requires+1] = "v_neutral_particle"
    asteroglyph.requires[#asteroglyph.requires+1] = "v_in_the_beginning"
    blankcanvas.requires[#blankcanvas.requires+1] = "v_happy_accident"
    tacclimator.config.extra = tacclimator.config.extra * 8
    pacclimator.config.extra = pacclimator.config.extra * 8
end
local voucheritems = {voucher_atlas, copies, tag_printer, triple, quadruple, quintuple, overstock_multi, massproduct, curate, rerollexchange, dexterity, threers, tacclimator, pacclimator, moneybean, fabric, asteroglyph, blankcanvas, clone_machine,}
if Cryptid_config["Code Cards"] then --tweak this later since I want command prompt/satellite uplink in the same space as the other vouchers
    voucheritems[#voucheritems+1] = command_prompt
    voucheritems[#voucheritems+1] = satellite_uplink
    voucheritems[#voucheritems+1] = quantum_computing
end
return {name = "Vouchers", 
        init = function()
            --Curate
            local pe = poll_edition
            function poll_edition(_key, _mod, _no_neg, _guaranteed, _options)
                local ed = pe(_key, _mod, _no_neg, _guaranteed, _options)
                while not ed and G.GAME.used_vouchers.v_cry_curate do
                    ed = pe(_key, _mod, _no_neg, _guaranteed, _options)
                end
                return ed
            end
            --Copies and upgrades
            local gcp = get_current_pool
            function get_current_pool(type, rarity, legendary, append, z)
                pool, pool_append = gcp(type, rarity, legendary, append, z)
                if type == 'Tag' then
                    for i = 1, #pool do
                        if pool[i] == "tag_double" and G.GAME.used_vouchers.v_cry_copies then
                            pool[i] = "tag_cry_triple"
                        end
                        if (pool[i] == "tag_double" or pool[i] == "tag_cry_triple") and G.GAME.used_vouchers.v_cry_tag_printer then
                            pool[i] = "tag_cry_quadruple"
                        end
                        if (pool[i] == "tag_double" or pool[i] == "tag_cry_triple" or pool[i] == "tag_cry_quadruple") and G.GAME.used_vouchers.v_cry_clone_machine then
                            pool[i] = "tag_cry_quintuple"
                        end
                    end
                end
                return pool, pool_append
            end
            local tinit = Tag.init
            function Tag:init(tag, y, z)
                if tag == "tag_double" and G.GAME.used_vouchers.v_cry_copies then
                    tag = "tag_cry_triple"
                end
                if (tag == "tag_double" or tag == "tag_cry_triple") and G.GAME.used_vouchers.v_cry_tag_printer then
                    tag = "tag_cry_quadruple"
                end
                if (tag == "tag_double" or tag == "tag_cry_triple" or tag == "tag_cry_quadruple") and G.GAME.used_vouchers.v_cry_clone_machine then
                    tag = "tag_cry_quintuple"
                end
                return tinit(self,tag,y,z)
            end
	    local sc = Card.set_cost
            function Card:set_cost()
                sc(self)
                if self.ability.set == "Tarot" and G.GAME.used_vouchers.v_cry_tacclimator then --Make Tarots free when Tarot Acclimator is redeemed
                    self.cost = 0
                end
                if self.ability.set == "Planet" and G.GAME.used_vouchers.v_cry_pacclimator then --Make Planets free when Planet Acclimator is redeemed
                    self.cost = 0
                end
            end
        end,
        items = voucheritems}
