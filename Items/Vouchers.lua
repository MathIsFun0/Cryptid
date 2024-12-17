local voucher_atlas = {
	object_type = "Atlas",
	key = "atlasvoucher",
	path = "atlasvoucher.png",
	px = 71,
	py = 95,
}
local copies = { --Double tags become Triple Tags and are 2X as common
	object_type = "Voucher",
	key = "copies",
	atlas = "atlasvoucher",
	order = 1,
	pos = { x = 1, y = 1 },
	loc_vars = function(self, info_queue)
		info_queue[#info_queue+1] = {set = "Tag", key = "tag_double"}
		info_queue[#info_queue+1] = {set = "Tag", key = "tag_cry_triple", specific_vars = {2}}
		return { vars = {} }
	end,
}
local tag_printer = { --Double tags become Quadruple Tags and are 3X as common
	object_type = "Voucher",
	key = "tag_printer",
	order = 2,
	atlas = "atlasvoucher",
	pos = { x = 1, y = 2 },
	loc_vars = function(self, info_queue)
		info_queue[#info_queue+1] = {set = "Tag", key = "tag_double"}
		info_queue[#info_queue+1] = {set = "Tag", key = "tag_cry_quadruple", specific_vars = {3}}
		return { vars = {} }
	end,
	requires = { "v_cry_copies" },
}
local clone_machine = { --Double tags become Quintuple Tags and are 4X as common
	object_type = "Voucher",
	key = "clone_machine",
	atlas = "atlasvoucher",
	order = 91,
	pos = { x = 1, y = 3 },
	loc_vars = function(self, info_queue)
		info_queue[#info_queue+1] = {set = "Tag", key = "tag_double"}
		info_queue[#info_queue+1] = {set = "Tag", key = "tag_cry_quintuple", specific_vars = {4}}
		return { vars = {} }
	end,
	requires = { "v_cry_tag_printer" },
}
local command_prompt = { --Code cards can appear in the shop
	object_type = "Voucher",
	key = "command_prompt",
	atlas = "atlasvoucher",
	order = 3,
	pos = { x = 0, y = 1 },
	loc_vars = function(self, info_queue)
		return { vars = {} }
	end,
	redeem = function(self)
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.code_rate = (G.GAME.code_rate or 0) + 4
				return true
			end,
		}))
	end,
	unredeem = function(self)
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.code_rate = math.max(0, G.GAME.code_rate - 4)
				return true
			end,
		}))
	end,
}
local satellite_uplink = { --Code cards may appear in any of the Celestial Packs
	object_type = "Voucher",
	key = "satellite_uplink",
	atlas = "atlasvoucher",
	order = 4,
	pos = { x = 0, y = 2 },
	loc_vars = function(self, info_queue)
		return { vars = {} }
	end,
	requires = { "v_cry_command_prompt" },
}
local quantum_computing = { --Code cards can spawn with Negative addition
	object_type = "Voucher",
	key = "quantum_computing",
	order = 92,
	atlas = "atlasvoucher",
	pos = { x = 0, y = 3 },
	loc_vars = function(self, info_queue)
		return { vars = {} }
	end,
	requires = { "v_cry_satellite_uplink" },
}
local pairing = { --Retrigger all M Jokers if played hand is a Pair
	object_type = "Voucher",
	key = "pairing",
	atlas = "atlasvoucher",
	order = 5,
	pos = { x = 4, y = 5 },
	cry_credits = {
		jolly = {
			"Jolly Open Winner",
			"Xaltios",
		},
	},
	in_pool = function(self)
		local mcheck = get_m_jokers()
		if mcheck > 0 then
			return true
		end
		return false
	end,
}
local repair_man = { --Retrigger all M Jokers if played hand contains a pair
	object_type = "Voucher",
	key = "repair_man",
	atlas = "atlasvoucher",
	order = 6,
	pos = { x = 5, y = 5 },
	requires = { "v_cry_pairing" },
	cry_credits = {
		jolly = {
			"Jolly Open Winner",
			"Xaltios",
		},
	},
	in_pool = function(self)
		local mcheck = get_m_jokers()
		if mcheck > 0 then
			return true
		end
		return false
	end,
}
local pairamount_plus = { --Retrigger all M Jokers once for every pair contained in played hand
	object_type = "Voucher",
	key = "pairamount_plus",
	atlas = "atlasvoucher",
	order = 93,
	pos = { x = 6, y = 5 },
	requires = { "v_cry_repair_man" },
	cry_credits = {
		jolly = {
			"Jolly Open Winner",
			"Xaltios",
		},
	},
	in_pool = function(self)
		local mcheck = get_m_jokers()
		if mcheck > 0 then
			return true
		end
		return false
	end,
}
local double_vision = { --Double-Sided cards appear 4x more frequently
	object_type = "Voucher",
	key = "double_vision",
	order = 7,
	atlas = "atlasvoucher",
	pos = { x = 4, y = 3 },
	loc_vars = function(self, info_queue)
		info_queue[#info_queue + 1] = G.P_CENTERS.e_cry_double_sided
	end,
	cry_credits = {
		jolly = {
			"Jolly Open Winner",
			"Axolotolus",
		},
	},
}
local double_slit = { --Meld can appear in the shop and Arcana Packs
	object_type = "Voucher",
	key = "double_slit",
	atlas = "atlasvoucher",
	order = 8,
	pos = { x = 3, y = 4 },
	requires = { "v_cry_double_vision" },
	loc_vars = function(self, info_queue)
		info_queue[#info_queue + 1] = G.P_CENTERS.c_cry_meld
	end,
	cry_credits = {
		jolly = {
			"Jolly Open Winner",
			"Axolotolus",
		},
	},
}
local double_down = { --After every round, X1.5 to all values on the back of Double-Sided Cards
	object_type = "Voucher",
	key = "double_down",
	atlas = "atlasvoucher",
	order = 94,
	pos = { x = 4, y = 4 },
	requires = { "v_cry_double_slit" },
	loc_vars = function(self, info_queue)
		info_queue[#info_queue + 1] = G.P_CENTERS.e_cry_double_sided
	end,
	cry_credits = {
		jolly = {
			"Jolly Open Winner",
			"Axolotolus",
		},
	},
}
local overstock_multi = { --+1 card slot[s] and +1 booster pack slot[s] available in the shop
	object_type = "Voucher",
	key = "overstock_multi",
	config = { extra = 1 },
	atlas = "atlasvoucher",
	order = 75,
	pos = { x = 4, y = 1 },
	requires = { "v_overstock_plus" },
	loc_vars = function(self, info_queue)
		return { vars = { math.max(1, math.floor(self.config.extra)) } }
	end,
	redeem = function(self)
		if not G.GAME.modifiers.cry_booster_packs then
			G.GAME.modifiers.cry_booster_packs = 2
		end
		G.GAME.modifiers.cry_booster_packs = G.GAME.modifiers.cry_booster_packs
			+ math.max(1, math.floor(self.config.extra)) --Booster slots
		G.E_MANAGER:add_event(Event({
			func = function() --card slot
				change_shop_size(math.max(1, math.floor(self.config.extra)))
				return true
			end,
		}))
	end,
	unredeem = function(self)
		if not G.GAME.modifiers.cry_booster_packs then
			G.GAME.modifiers.cry_booster_packs = 2
		end
		G.GAME.modifiers.cry_booster_packs = G.GAME.modifiers.cry_booster_packs
			- math.max(1, math.floor(self.config.extra)) --Booster slots
		G.E_MANAGER:add_event(Event({
			func = function() --card slot
				change_shop_size(math.min(-1, -1*math.floor(self.config.extra)))
				return true
			end,
		}))
	end,
}
local massproduct = { --All cards and packs in the shop cost $1
	object_type = "Voucher",
	key = "massproduct",
	atlas = "atlasvoucher",
	order = 76,
	pos = { x = 6, y = 4 },
	requires = { "v_liquidation" },
	redeem = function(self)
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.backup_discount_percent = G.GAME.backup_discount_percent or G.GAME.discount_percent
				G.GAME.discount_percent = 100
				for k, v in pairs(G.I.CARD) do
					if v.set_cost then
						v:set_cost()
					end
				end
				return true
			end,
		}))
	end,
	unredeem = function(self)
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.discount_percent = G.GAME.backup_discount_percent or 0
				for k, v in pairs(G.I.CARD) do
					if v.set_cost then
						v:set_cost()
					end
				end
				return true
			end,
		}))
	end,
}
local curate = { --All cards appear with an Edition
	object_type = "Voucher",
	key = "curate",
	atlas = "atlasvoucher",
	order = 77,
	pos = { x = 6, y = 1 },
	requires = { "v_glow_up" },
}
local rerollexchange = { --All rerolls cost $2
	object_type = "Voucher",
	key = "rerollexchange",
	atlas = "atlasvoucher",
	order = 78,
	pos = { x = 6, y = 2 },
	requires = { "v_reroll_glut" },
	redeem = function(self)
		--most of the code for this (one line) is in cryptid.lua, check out the reroll function there
		G.E_MANAGER:add_event(Event({
			func = function()
				if G.GAME.current_round.reroll_cost > 2 then
					G.GAME.current_round.reroll_cost = 2
				end
				return true
			end,
		}))
	end,
	unredeem = function(self)
		G.E_MANAGER:add_event(Event({
			func = function()
				calculate_reroll_cost(true)
				return true
			end,
		}))
	end,
}
--Order 79 reserved for celestial storage (unimplemented)
local scope = { --Also unimplemented
	object_type = "Voucher",
	key = "scope",
	atlas = "atlasvoucher",
	order = 80,
	pos = { x = 2, y = 0 },
	requires = { "v_observatory" },
}
local dexterity = { --Permanently gain +2 hand[s] each round
	object_type = "Voucher",
	key = "dexterity",
	config = { extra = 2 },
	atlas = "atlasvoucher",
	order = 81,
	pos = { x = 6, y = 3 },
	requires = { "v_nacho_tong" },
	loc_vars = function(self, info_queue)
		return { vars = { math.max(1, math.floor(self.config.extra)) } }
	end,
	redeem = function(self)
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.round_resets.hands = G.GAME.round_resets.hands + math.max(1, math.floor(self.config.extra))
				ease_hands_played(math.max(1, math.floor(self.config.extra)))
				return true
			end,
		}))
	end,
	unredeem = function(self)
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.round_resets.hands = G.GAME.round_resets.hands - math.max(1, math.floor(self.config.extra))
				ease_hands_played(math.min(-1, -1*math.floor(self.config.extra)))
				return true
			end,
		}))
	end,
}
local threers = { --Permanently gain +2 discard[s] each round
	object_type = "Voucher",
	key = "threers",
	config = { extra = 2 },
	atlas = "atlasvoucher",
	order = 82,
	pos = { x = 5, y = 0 },
	requires = { "v_recyclomancy" },
	loc_vars = function(self, info_queue)
		return { vars = { math.max(1, math.floor(self.config.extra)) } }
	end,
	redeem = function(self)
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.round_resets.discards = G.GAME.round_resets.discards + math.max(1, math.floor(self.config.extra))
				ease_discard(math.max(1, math.floor(self.config.extra)))
				return true
			end,
		}))
	end,
	unredeem = function(self)
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.round_resets.discards = G.GAME.round_resets.discards - math.max(1, math.floor(self.config.extra))
				ease_discard(math.min(-1, math.floor(-1*self.config.extra)))
				return true
			end,
		}))
	end,
}
local tacclimator = { --Tarot cards appear X6 more frequently in the shop   All future Tarot cards are free
	object_type = "Voucher",
	key = "tacclimator",
	config = { extra = 56 / 4, extra_disp = 6 }, --blame thunk for this extra value
	atlas = "atlasvoucher",
	order = 83,
	pos = { x = 1, y = 4 },
	requires = { "v_tarot_tycoon" },
	loc_vars = function(self, info_queue)
		return { vars = { self.config.extra_disp } }
	end,
	redeem = function(self)
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.tarot_rate = 4 * self.config.extra
				return true
			end,
		}))
	end,
	unredeem = function(self)
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.tarot_rate = G.GAME.tarot_rate / self.config.extra * (56/4) / 6
				return true
			end,
		}))
	end,
}
local pacclimator = { --Planet cards appear X6 more frequently in the shop   All future Planet cards are free
	object_type = "Voucher",
	key = "pacclimator",
	config = { extra = 56 / 4, extra_disp = 6 }, --blame thunk for this extra value
	atlas = "atlasvoucher",
	order = 84,
	pos = { x = 0, y = 4 },
	requires = { "v_planet_tycoon" },
	loc_vars = function(self, info_queue)
		return { vars = { self.config.extra_disp } }
	end,
	redeem = function(self)
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.planet_rate = 4 * self.config.extra
				return true
			end,
		}))
	end,
	unredeem = function(self)
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.planet_rate = G.GAME.planet_rate / self.config.extra * (56/4) / 6
				return true
			end,
		}))
	end,
}
local moneybean = { --Raise the cap on interest earned in each round to $2.0e299
	object_type = "Voucher",
	key = "moneybean",
	config = { extra = 1e300 },
	atlas = "atlasvoucher",
	order = 85,
	pos = { x = 5, y = 1 },
	requires = { "v_money_tree" },
	loc_vars = function(self, info_queue)
		return { vars = { self.config.extra / 5 } }
	end,
	redeem = function(self)
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.interest_cap = self.config.extra
				return true
			end,
		}))
	end,
	unredeem = function(self)
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.interest_cap = math.max(25, (G.P_CENTERS.v_money_tree.config.extra or 0), (G.P_CENTERS.v_seed_money.config.extra or 0))
				return true
			end,
		}))
	end,
}
local fabric = { --+2 Joker slot[s]
	object_type = "Voucher",
	key = "fabric",
	config = { extra = 2 },
	atlas = "atlasvoucher",
	order = 86,
	pos = { x = 6, y = 0 },
	requires = { "v_antimatter" },
	loc_vars = function(self, info_queue)
		return { vars = { math.max(1, math.floor(self.config.extra)) } }
	end,
	redeem = function(self)
		G.E_MANAGER:add_event(Event({
			func = function()
				if G.jokers then
					G.jokers.config.card_limit = G.jokers.config.card_limit + math.max(1, math.floor(self.config.extra))
				end
				return true
			end,
		}))
	end,
	unredeem = function(self)
		G.E_MANAGER:add_event(Event({
			func = function()
				if G.jokers then
					G.jokers.config.card_limit = G.jokers.config.card_limit - math.max(1, math.floor(self.config.extra))
				end
				return true
			end,
		}))
	end,
}
--Order 87 reserved for Fake-out (unimplemented)
local function asteroglyph_ante()
	if not (G.GAME or {}).modifiers then
		return 0
	end
	if not G.GAME.modifiers.cry_astero_ante then
		G.GAME.modifiers.cry_astero_ante = 0
	end
	return G.GAME.modifiers.cry_astero_ante
end

local asteroglyph = { --Set Ante to 0
	object_type = "Voucher",
	key = "asteroglyph",
	atlas = "atlasvoucher",
	order = 88,
	pos = { x = 5, y = 2 },
	requires = { "v_petroglyph" },
	loc_vars = function(self, info_queue)
		return { vars = { asteroglyph_ante() } }
	end,
	redeem = function(self)
		local mod = -G.GAME.round_resets.ante + asteroglyph_ante()
		ease_ante(mod)
		G.GAME.modifiers.cry_astero_ante = (G.GAME.modifiers.cry_astero_ante or 0) > 0
				and math.min(math.ceil(G.GAME.modifiers.cry_astero_ante ^ 1.13), 1e300)
			or 1
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.round_resets.blind_ante = mod
				return true
			end,
		}))
	end
}
--Order 89 reserved for Ivory Script (unimplemented)
local blankcanvas = { --+2 hand size
	object_type = "Voucher",
	key = "blankcanvas",
	config = { extra = 2 },
	atlas = "atlasvoucher",
	order = 90,
	pos = { x = 2, y = 4 },
	requires = { "v_palette" },
	loc_vars = function(self, info_queue)
		return { vars = { math.max(1, math.floor(self.config.extra)) } }
	end,
	redeem = function(self)
		G.hand:change_size(math.max(1, math.floor(self.config.extra)))
	end,
	unredeem = function(self)
		G.hand:change_size(-1*math.max(1, math.floor(self.config.extra)))
	end,
}

local stickyhand = { --+1 card selection limit
	object_type = "Voucher",
	key = "stickyhand",
	config = { extra = 1 },
	atlas = "atlasvoucher",
	order = 9,
	pos = { x = 0, y = 5 },
	loc_vars = function(self, info_queue)
		return { vars = { math.max(1, math.floor(self.config.extra)) } }
	end,
	redeem = function(self)
  G.hand.config.highlighted_limit = G.hand.config.highlighted_limit
		+ math.max(1, math.floor(self.config.extra))
	end,
	unredeem = function(self)
  G.hand.config.highlighted_limit = G.hand.config.highlighted_limit
		- math.max(1, math.floor(self.config.extra))
		if G.hand.config.highlighted_limit < 5 then G.hand.config.highlighted_limit = 5 end
		G.hand:unhighlight_all()
	end,
}

local grapplinghook = { --+1 card selection limit (replace me when "extra functionality" is added later)
	object_type = "Voucher",
	key = "grapplinghook",
	config = { extra = 2 },
	atlas = "atlasvoucher",
	order = 10,
	pos = { x = 1, y = 5 },
	requires = { "v_cry_stickyhand" },
	loc_vars = function(self, info_queue)
		return { vars = { math.max(1, math.floor(self.config.extra)) } }
	end,
	redeem = function(self)
  G.hand.config.highlighted_limit = G.hand.config.highlighted_limit
		+ math.max(1, math.floor(self.config.extra))
	end,
	unredeem = function(self)
  G.hand.config.highlighted_limit = G.hand.config.highlighted_limit
		- math.max(1, math.floor(self.config.extra))
		if G.hand.config.highlighted_limit < 5 then G.hand.config.highlighted_limit = 5 end
		G.hand:unhighlight_all()
	end,
}

local hyperspacetether = { --+2 card selection limit (replace me when "extra functionality" is added later)
	object_type = "Voucher",
	key = "hyperspacetether",
	config = { extra = 2 },
	atlas = "atlasvoucher",
	pos = { x = 2, y = 5 },
	order = 95,
	requires = { "v_cry_grapplinghook" },
	loc_vars = function(self, info_queue)
		return { vars = { math.max(1, math.floor(self.config.extra)) } }
	end,
	redeem = function(self)
  G.hand.config.highlighted_limit = G.hand.config.highlighted_limit
		+ math.max(1, math.floor(self.config.extra))
	end,
	unredeem = function(self)
  G.hand.config.highlighted_limit = G.hand.config.highlighted_limit
		- math.max(1, math.floor(self.config.extra))
		if G.hand.config.highlighted_limit < 5 then G.hand.config.highlighted_limit = 5 end
		G.hand:unhighlight_all()
	end,
}


local triple = { --Copies voucher triple tag
	object_type = "Tag",
	atlas = "tag_cry",
	name = "cry-Triple Tag",
	order = 20,
	pos = { x = 0, y = 1 },
	config = { type = "tag_add", num = 2 },
	key = "triple",
	loc_vars = function(self, info_queue)
		return { vars = { self.config.num } }
	end,
	apply = function(self, tag, context)
		if
			context.type == "tag_add"
			and context.tag.key ~= "tag_double"
			and context.tag.key ~= "tag_cry_triple"
			and context.tag.key ~= "tag_cry_quadruple"
			and context.tag.key ~= "tag_cry_quintuple"
			and context.tag.key ~= "tag_cry_memory"
		then
			local lock = tag.ID
			G.CONTROLLER.locks[lock] = true
			tag:yep("+", G.C.RED, function()
				if context.tag.ability and context.tag.ability.orbital_hand then
					G.orbital_hand = context.tag.ability.orbital_hand
				end
				for i = 1, tag.config.num do
					local tag = Tag(context.tag.key)
					if context.tag.key == "tag_cry_rework" then
						tag.ability.rework_edition = context.tag.ability.rework_edition
						tag.ability.rework_key = context.tag.ability.rework_key
					end
					add_tag(tag)
				end
				G.orbital_hand = nil
				G.CONTROLLER.locks[lock] = nil
				return true
			end)
			tag.triggered = true
			return true
		end
	end,
	in_pool = function()
		return G.GAME.used_vouchers.v_cry_copies
	end,
}
local quadruple = { --Tag printer voucher quadruple tag
	object_type = "Tag",
	atlas = "tag_cry",
	name = "cry-Quadruple Tag",
	order = 21,
	pos = { x = 1, y = 1 },
	config = { type = "tag_add", num = 3 },
	key = "quadruple",
	loc_vars = function(self, info_queue)
		return { vars = { self.config.num } }
	end,
	apply = function(self, tag, context)
		if
			context.type == "tag_add"
			and context.tag.key ~= "tag_double"
			and context.tag.key ~= "tag_cry_triple"
			and context.tag.key ~= "tag_cry_quadruple"
			and context.tag.key ~= "tag_cry_quintuple"
			and context.tag.key ~= "tag_cry_memory"
		then
			local lock = tag.ID
			G.CONTROLLER.locks[lock] = true
			tag:yep("+", G.C.RED, function()
				if context.tag.ability and context.tag.ability.orbital_hand then
					G.orbital_hand = context.tag.ability.orbital_hand
				end
				for i = 1, tag.config.num do
					local tag = Tag(context.tag.key)
					if context.tag.key == "tag_cry_rework" then
						tag.ability.rework_edition = context.tag.ability.rework_edition
						tag.ability.rework_key = context.tag.ability.rework_key
					end
					add_tag(tag)
				end
				G.orbital_hand = nil
				G.CONTROLLER.locks[lock] = nil
				return true
			end)
			tag.triggered = true
			return true
		end
	end,
	in_pool = function()
		return G.GAME.used_vouchers.v_cry_tag_printer
	end,
}
local quintuple = { --Clone machine voucher quintuple tag
	object_type = "Tag",
	atlas = "tag_cry",
	name = "cry-Quintuple Tag",
	order = 22,
	pos = { x = 2, y = 1 },
	config = { type = "tag_add", num = 4 },
	key = "quintuple",
	loc_vars = function(self, info_queue)
		return { vars = { self.config.num } }
	end,
	apply = function(self, tag, context)
		if
			context.type == "tag_add"
			and context.tag.key ~= "tag_double"
			and context.tag.key ~= "tag_cry_triple"
			and context.tag.key ~= "tag_cry_quadruple"
			and context.tag.key ~= "tag_cry_quintuple"
			and context.tag.key ~= "tag_cry_memory"
		then
			local lock = tag.ID
			G.CONTROLLER.locks[lock] = true
			tag:yep("+", G.C.RED, function()
				if context.tag.ability and context.tag.ability.orbital_hand then
					G.orbital_hand = context.tag.ability.orbital_hand
				end
				for i = 1, tag.config.num do
					local tag = Tag(context.tag.key)
					if context.tag.key == "tag_cry_rework" then
						tag.ability.rework_edition = context.tag.ability.rework_edition
						tag.ability.rework_key = context.tag.ability.rework_key
					end
					add_tag(tag)
				end
				G.orbital_hand = nil
				G.CONTROLLER.locks[lock] = nil
				return true
			end)
			tag.triggered = true
			return true
		end
	end,
	in_pool = function()
		return G.GAME.used_vouchers.v_cry_clone_machine
	end,
}
-- If Tier 3 Vouchers is loaded, make Cryptid function as Tier 4 Vouchers
if SMODS.Mods["Tier3Sub"] then
	overstock_multi.requires[#overstock_multi.requires + 1] = "v_overstock_three"
	massproduct.requires[#massproduct.requires + 1] = "v_money_mint"
	curate.requires[#curate.requires + 1] = "v_glow_in_dark"
	rerollexchange.requires[#rerollexchange.requires + 1] = "v_reroll_addict"
	dexterity.requires[#dexterity.requires + 1] = "v_applause"
	threers.requires[#threers.requires + 1] = "v_down_to_zero"
	tacclimator.requires[#tacclimator.requires + 1] = "v_tarot_factory"
	pacclimator.requires[#pacclimator.requires + 1] = "v_planet_factory"
	moneybean.requires[#moneybean.requires + 1] = "v_money_forest"
	fabric.requires[#fabric.requires + 1] = "v_neutral_particle"
	asteroglyph.requires[#asteroglyph.requires + 1] = "v_in_the_beginning"
	blankcanvas.requires[#blankcanvas.requires + 1] = "v_happy_accident"
	tacclimator.config.extra = tacclimator.config.extra * 8
	pacclimator.config.extra = pacclimator.config.extra * 8
end

--Add T3 Voucher pool for Golden Voucher Tag (in Tags.lua) and maybe other things in the future
--I am sorry in advance (this is extremely cursed)

Cryptid.Megavouchers[#Cryptid.Megavouchers + 1] = "v_cry_overstock_multi"
Cryptid.Megavouchers[#Cryptid.Megavouchers + 1] = "v_cry_massproduct"
Cryptid.Megavouchers[#Cryptid.Megavouchers + 1] = "v_cry_curate"
Cryptid.Megavouchers[#Cryptid.Megavouchers + 1] = "v_cry_rerollexchange"
Cryptid.Megavouchers[#Cryptid.Megavouchers + 1] = "v_cry_dexterity"
Cryptid.Megavouchers[#Cryptid.Megavouchers + 1] = "v_cry_threers"
Cryptid.Megavouchers[#Cryptid.Megavouchers + 1] = "v_cry_tacclimator"
Cryptid.Megavouchers[#Cryptid.Megavouchers + 1] = "v_cry_pacclimator"
Cryptid.Megavouchers[#Cryptid.Megavouchers + 1] = "v_cry_moneybean"
Cryptid.Megavouchers[#Cryptid.Megavouchers + 1] = "v_cry_fabric"
Cryptid.Megavouchers[#Cryptid.Megavouchers + 1] = "v_cry_asteroglyph"
Cryptid.Megavouchers[#Cryptid.Megavouchers + 1] = "v_cry_blankcanvas"
Cryptid.Megavouchers[#Cryptid.Megavouchers + 1] = "v_cry_hyperspacetether"
Cryptid.Megavouchers[#Cryptid.Megavouchers + 1] = "v_cry_clone_machine"

if Cryptid.enabled["M Jokers"] then
	Cryptid.Megavouchers[#Cryptid.Megavouchers + 1] = "v_cry_pairamount_plus"
end
if Cryptid.enabled["Code Cards"] then
	Cryptid.Megavouchers[#Cryptid.Megavouchers + 1] = "v_cry_quantum_computing"
end
if Cryptid.enabled["Misc."] then
	Cryptid.Megavouchers[#Cryptid.Megavouchers + 1] = "v_cry_double_down"
end

function megavoucherpool(_type, _rarity, legendary, key_append)
	G.ARGS.TEMP_POOL = EMPTY(G.ARGS.TEMP_POOL)
	local _pool, _starting_pool, _pool_key, _pool_size = G.ARGS.TEMP_POOL, {}, "megavoucher", 0

	for k, v in pairs(Cryptid.Megavouchers) do
		if v then
			_starting_pool[#_starting_pool + 1] = G.P_CENTERS[v]
		end
	end

	for k, v in ipairs(_starting_pool) do
		local add = false

		if not G.GAME.cry_owned_vouchers[v.key] then
                	local check = true
			if G.shop_vouchers and G.shop_vouchers.cards then
                            for kk, vv in ipairs(G.shop_vouchers.cards) do
                                if vv.config.center.key == v.key then check = false end
                            end
                        end
			if check then
                            add = true
                        end
		end

		if add and not G.GAME.banned_keys[v.key] then
			_pool[#_pool + 1] = v.key
			_pool_size = _pool_size + 1
		end

		if _pool_size == 0 then
			_pool = EMPTY(G.ARGS.TEMP_POOL)
			_pool[#_pool + 1] = "v_blank"
		end
	end

	return _pool, _pool_key .. G.GAME.round_resets.ante
end

local megavouchergetcurrentpool = get_current_pool
function get_current_pool(_type, _rarity, _legendary, _append)
	if _type == "megavoucher" then
		return megavoucherpool(_type, _rarity, _legendary, _append)
	end
	return megavouchergetcurrentpool(_type, _rarity, _legendary, _append)
end

function get_next_megavoucher_key(_from_tag)
    local _pool, _pool_key = get_current_pool('megavoucher')
    if _from_tag then _pool_key = 'Voucher_fromtag' end
    local center = pseudorandom_element(_pool, pseudoseed(_pool_key))
    local it = 1
    while center == 'UNAVAILABLE' do
        it = it + 1
        center = pseudorandom_element(_pool, pseudoseed(_pool_key..'_resample'..it))
    end

    return center
end

local voucheritems = {
	voucher_atlas,
	copies,
	tag_printer,
	triple,
	quadruple,
	quintuple,
	overstock_multi,
	massproduct,
	curate,
	rerollexchange,
	dexterity,
	threers,
	tacclimator,
	pacclimator,
	moneybean,
	fabric,
	asteroglyph,
	blankcanvas,
	clone_machine,
	stickyhand,
	grapplinghook,
	hyperspacetether
}
if Cryptid.enabled["Code Cards"] then
	voucheritems[#voucheritems + 1] = command_prompt
	voucheritems[#voucheritems + 1] = satellite_uplink
	voucheritems[#voucheritems + 1] = quantum_computing
end
if Cryptid.enabled["M Jokers"] then
	voucheritems[#voucheritems + 1] = pairing
	voucheritems[#voucheritems + 1] = repair_man
	voucheritems[#voucheritems + 1] = pairamount_plus
end
if Cryptid.enabled["Misc."] then
	voucheritems[#voucheritems + 1] = double_vision
	voucheritems[#voucheritems + 1] = double_slit
	voucheritems[#voucheritems + 1] = double_down
end
return {
	name = "Vouchers",
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
			if type == "Tag" then
				for i = 1, #pool do
					if pool[i] == "tag_double" and G.GAME.used_vouchers.v_cry_copies then
						pool[i] = "tag_cry_triple"
					end
					if
						(pool[i] == "tag_double" or pool[i] == "tag_cry_triple")
						and G.GAME.used_vouchers.v_cry_tag_printer
					then
						pool[i] = "tag_cry_quadruple"
					end
					if
						(pool[i] == "tag_double" or pool[i] == "tag_cry_triple" or pool[i] == "tag_cry_quadruple")
						and G.GAME.used_vouchers.v_cry_clone_machine
					then
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
			if
				(tag == "tag_double" or tag == "tag_cry_triple" or tag == "tag_cry_quadruple")
				and G.GAME.used_vouchers.v_cry_clone_machine
			then
				tag = "tag_cry_quintuple"
			end
			return tinit(self, tag, y, z)
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
	items = voucheritems,
}
