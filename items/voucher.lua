local voucher_atlas = {
	object_type = "Atlas",
	key = "atlasvoucher",
	path = "atlasvoucher.png",
	px = 71,
	py = 95,
}
local copies = { --Double tags become Triple Tags and are 2X as common
	cry_credits = {
		idea = {
			"Catman",
			"Mystic Misclick",
		},
		art = {
			"Mystic Misclick",
		},
		code = {
			"Math",
		},
	},
	object_type = "Voucher",
	dependencies = {
		items = {
			"set_cry_voucher",
			"set_cry_tag",
		},
	},
	key = "copies",
	atlas = "atlasvoucher",
	order = 1,
	pos = { x = 1, y = 1 },
	loc_vars = function(self, info_queue)
		info_queue[#info_queue + 1] = { set = "Tag", key = "tag_double" }
		info_queue[#info_queue + 1] = { set = "Tag", key = "tag_cry_triple", specific_vars = { 2 } }
		return { vars = {} }
	end,
	init = function(self)
		--Copies and upgrades
		local tinit = Tag.init
		function Tag:init(tag, for_collection, _blind_type)
			if not for_collection then
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
			end
			return tinit(self, tag, for_collection, _blind_type)
		end
	end,
}
local tag_printer = { --Double tags become Quadruple Tags and are 3X as common
	cry_credits = {
		idea = {
			"Catman",
			"Mystic Misclick",
		},
		art = {
			"Mystic Misclick",
		},
		code = {
			"Math",
		},
	},
	object_type = "Voucher",
	dependencies = {
		items = {
			"set_cry_voucher",
			"set_cry_tag",
			"v_cry_copies",
		},
	},
	key = "tag_printer",
	order = 2,
	atlas = "atlasvoucher",
	pos = { x = 1, y = 2 },
	loc_vars = function(self, info_queue)
		info_queue[#info_queue + 1] = { set = "Tag", key = "tag_double" }
		info_queue[#info_queue + 1] = { set = "Tag", key = "tag_cry_quadruple", specific_vars = { 3 } }
		return { vars = {} }
	end,
	requires = { "v_cry_copies" },
}
local clone_machine = { --Double tags become Quintuple Tags and are 4X as common
	cry_credits = {
		idea = {
			"Catman",
			"Mystic Misclick",
		},
		art = {
			"Linus Goof Balls",
		},
		code = {
			"Math",
		},
	},
	object_type = "Voucher",
	dependencies = {
		items = {
			"set_cry_voucher",
			"set_cry_tag",
			"set_cry_tier3",
			"v_cry_tag_printer",
		},
	},
	key = "clone_machine",
	atlas = "atlasvoucher",
	order = 91,
	pos = { x = 1, y = 3 },
	pools = { ["Tier3"] = true },
	loc_vars = function(self, info_queue)
		info_queue[#info_queue + 1] = { set = "Tag", key = "tag_double" }
		info_queue[#info_queue + 1] = { set = "Tag", key = "tag_cry_quintuple", specific_vars = { 4 } }
		return { vars = {} }
	end,
	requires = { "v_cry_tag_printer" },
}
local command_prompt = { --Code cards can appear in the shop
	cry_credits = {
		idea = {
			"HexaCryonic",
		},
		art = {
			"HexaCryonic",
		},
		code = {
			"Mathguy",
		},
	},
	object_type = "Voucher",
	dependencies = {
		items = {
			"set_cry_voucher",
			"set_cry_code",
		},
	},
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
	cry_credits = {
		idea = {
			"HexaCryonic",
		},
		art = {
			"HexaCryonic",
		},
		code = {
			"Mathguy",
		},
	},
	object_type = "Voucher",
	dependencies = {
		items = {
			"set_cry_voucher",
			"set_cry_code",
			"v_cry_command_prompt",
		},
	},
	key = "satellite_uplink",
	atlas = "atlasvoucher",
	order = 4,
	pos = { x = 0, y = 2 },
	loc_vars = function(self, info_queue)
		return { vars = {} }
	end,
	requires = { "v_cry_command_prompt" },
}
local quantum_computing = { --Code cards spawn with +1 use
	cry_credits = {
		idea = {
			"HexaCryonic",
		},
		art = {
			"HexaCryonic",
		},
		code = {
			"Mathguy",
		},
	},
	object_type = "Voucher",
	dependencies = {
		items = {
			"set_cry_voucher",
			"set_cry_tier3",
			"set_cry_code",
			"v_cry_satellite_uplink",
		},
	},
	key = "quantum_computing",
	order = 92,
	atlas = "atlasvoucher",
	pos = { x = 0, y = 3 },
	config = { extra = 1 },
	pools = { ["Tier3"] = true },
	loc_vars = function(self, info_queue, card)
		return { vars = { (card and card.ability.extra or self.config.extra) } }
	end,
	requires = { "v_cry_satellite_uplink" },
}
local pairing = { --Retrigger all M Jokers if played hand is a Pair
	object_type = "Voucher",
	dependencies = {
		items = {
			"set_cry_voucher",
			"set_cry_m",
		},
	},
	key = "pairing",
	atlas = "atlasvoucher",
	order = 5,
	pos = { x = 4, y = 5 },
	cry_credits = {
		art = {
			"lolxddj",
		},
		code = {
			"Math",
		},
		jolly = {
			"Jolly Open Winner",
			"Xaltios",
		},
	},
	in_pool = function(self)
		local mcheck = Cryptid.get_m_jokers()
		if mcheck > 0 then
			return true
		end
		return false
	end,
}
local repair_man = { --Retrigger all M Jokers if played hand contains a pair
	object_type = "Voucher",
	dependencies = {
		items = {
			"set_cry_voucher",
			"set_cry_m",
			"v_cry_pairing",
		},
	},
	key = "repair_man",
	atlas = "atlasvoucher",
	order = 6,
	pos = { x = 5, y = 5 },
	requires = { "v_cry_pairing" },
	cry_credits = {
		art = {
			"lolxddj",
		},
		code = {
			"Math",
		},
		jolly = {
			"Jolly Open Winner",
			"Xaltios",
		},
	},
	in_pool = function(self)
		local mcheck = Cryptid.get_m_jokers()
		if mcheck > 0 then
			return true
		end
		return false
	end,
}
local pairamount_plus = { --Retrigger all M Jokers once for every pair contained in played hand
	object_type = "Voucher",
	dependencies = {
		items = {
			"set_cry_voucher",
			"set_cry_m",
			"set_cry_tier3",
			"v_cry_repair_man",
		},
	},
	key = "pairamount_plus",
	atlas = "atlasvoucher",
	order = 93,
	pos = { x = 6, y = 5 },
	requires = { "v_cry_repair_man" },
	pools = { ["Tier3"] = true },
	cry_credits = {
		art = {
			"lolxddj",
		},
		code = {
			"Math",
		},
		jolly = {
			"Jolly Open Winner",
			"Xaltios",
		},
	},
	in_pool = function(self)
		local mcheck = Cryptid.get_m_jokers()
		if mcheck > 0 then
			return true
		end
		return false
	end,
}
local double_vision = { --Double-Sided cards appear 4x more frequently
	object_type = "Voucher",
	dependencies = {
		items = {
			"set_cry_voucher",
			"e_cry_double_sided",
		},
	},
	key = "double_vision",
	order = 7,
	atlas = "atlasvoucher",
	pos = { x = 4, y = 3 },
	loc_vars = function(self, info_queue)
		info_queue[#info_queue + 1] = G.P_CENTERS.e_cry_double_sided
	end,
	cry_credits = {
		art = {
			"Linus Goof Balls",
		},
		code = {
			"Math",
		},
		jolly = {
			"Jolly Open Winner",
			"Axolotolus",
		},
	},
}
local double_slit = { --Meld can appear in the shop and Arcana Packs
	object_type = "Voucher",
	dependencies = {
		items = {
			"set_cry_voucher",
			"e_cry_double_sided",
			"c_cry_meld",
			"v_cry_double_vision",
		},
	},
	key = "double_slit",
	atlas = "atlasvoucher",
	order = 8,
	pos = { x = 3, y = 4 },
	requires = { "v_cry_double_vision" },
	loc_vars = function(self, info_queue)
		info_queue[#info_queue + 1] = G.P_CENTERS.c_cry_meld
	end,
	cry_credits = {
		art = {
			"Linus Goof Balls",
		},
		code = {
			"Math",
		},
		jolly = {
			"Jolly Open Winner",
			"Axolotolus",
		},
	},
}
local double_down = { --After every round, X1.5 to all values on the back of Double-Sided Cards
	object_type = "Voucher",
	dependencies = {
		items = {
			"set_cry_voucher",
			"set_cry_tier3",
			"e_cry_double_sided",
			"v_cry_double_slit",
		},
	},
	key = "double_down",
	atlas = "atlasvoucher",
	order = 94,
	pos = { x = 4, y = 4 },
	requires = { "v_cry_double_slit" },
	pools = { ["Tier3"] = true },
	loc_vars = function(self, info_queue)
		info_queue[#info_queue + 1] = G.P_CENTERS.e_cry_double_sided
	end,
	cry_credits = {
		art = {
			"Linus Goof Balls",
		},
		code = {
			"Math",
		},
		jolly = {
			"Jolly Open Winner",
			"Axolotolus",
		},
	},
}
local overstock_multi = { --+1 card slot[s], +1 booster pack slot[s] and +1 voucher slot[s] available in the shop
	cry_credits = {
		idea = {
			"Frix",
		},
		art = {
			"HexaCryonic",
		},
		code = {
			"Jevonn",
		},
	},
	object_type = "Voucher",
	dependencies = {
		items = {
			"set_cry_tier3",
		},
	},
	key = "overstock_multi",
	config = { extra = 1 },
	atlas = "atlasvoucher",
	order = 75,
	pos = { x = 4, y = 1 },
	requires = { "v_overstock_plus" },
	pools = { ["Tier3"] = true },
	loc_vars = function(self, info_queue, card)
		return { vars = { (card and card.ability.extra or self.config.extra) } }
	end,
	redeem = function(self, card)
		local mod = math.floor(card and card.ability.extra or self.config.extra)
		SMODS.change_booster_limit(mod)
		G.E_MANAGER:add_event(Event({
			func = function() --card slot
				-- why is this in an event?
				change_shop_size(mod)
				return true
			end,
		}))
		SMODS.change_voucher_limit(mod)
	end,
	unredeem = function(self, card)
		local mod = math.floor(card and card.ability.extra or self.config.extra)
		SMODS.change_booster_limit(-mod)
		G.E_MANAGER:add_event(Event({
			func = function() --card slot
				-- why is this in an event?
				change_shop_size(-mod)
				return true
			end,
		}))
		SMODS.change_voucher_limit(-mod)
	end,
}
local massproduct = { --All cards and packs in the shop cost $1
	cry_credits = {
		idea = {
			"Frix",
		},
		art = {
			"Ein13",
		},
		code = {
			"Jevonn",
		},
	},
	object_type = "Voucher",
	dependencies = {
		items = {
			"set_cry_tier3",
		},
	},
	key = "massproduct",
	atlas = "atlasvoucher",
	order = 76,
	pos = { x = 6, y = 4 },
	requires = { "v_liquidation" },
	pools = { ["Tier3"] = true },
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
	cry_credits = {
		idea = {
			"Frix",
		},
		art = {
			"Linus Goof Balls",
		},
		code = {
			"Math",
		},
	},
	object_type = "Voucher",
	dependencies = {
		items = {
			"set_cry_tier3",
		},
	},
	key = "curate",
	atlas = "atlasvoucher",
	order = 77,
	pos = { x = 6, y = 1 },
	requires = { "v_glow_up" },
	pools = { ["Tier3"] = true },
	init = function(self)
		local pe = poll_edition
		function poll_edition(_key, _mod, _no_neg, _guaranteed, _options)
			local ed = pe(_key, _mod, _no_neg, _guaranteed, _options)
			while not ed and G.GAME.used_vouchers.v_cry_curate do
				ed = pe(_key, _mod, _no_neg, _guaranteed, _options)
			end
			return ed
		end
	end,
}
local rerollexchange = { --All rerolls cost $2
	cry_credits = {
		idea = {
			"Project666",
		},
		art = {
			"Linus Goof Balls",
		},
		code = {
			"Jevonn",
		},
	},
	object_type = "Voucher",
	dependencies = {
		items = {
			"set_cry_tier3",
		},
	},
	key = "rerollexchange",
	atlas = "atlasvoucher",
	order = 78,
	pos = { x = 6, y = 2 },
	requires = { "v_reroll_glut" },
	pools = { ["Tier3"] = true },
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
	dependencies = {
		items = {
			"set_cry_tier3",
		},
	},
	key = "scope",
	atlas = "atlasvoucher",
	order = 80,
	pos = { x = 2, y = 0 },
	requires = { "v_observatory" },
	pools = { ["Tier3"] = true },
}
local dexterity = { --Permanently gain +2 hand[s] each round
	cry_credits = {
		idea = {
			"Frix",
		},
		art = {
			"Linus Goof Balls",
		},
		code = {
			"Jevonn",
		},
	},
	object_type = "Voucher",
	dependencies = {
		items = {
			"set_cry_tier3",
		},
	},
	key = "dexterity",
	config = { extra = 2 },
	atlas = "atlasvoucher",
	order = 81,
	pos = { x = 6, y = 3 },
	requires = { "v_nacho_tong" },
	pools = { ["Tier3"] = true },
	loc_vars = function(self, info_queue, card)
		return { vars = { math.max(1, math.floor(card and card.ability.extra or self.config.extra)) } }
	end,
	redeem = function(self, card)
		G.GAME.round_resets.hands = G.GAME.round_resets.hands + (card and card.ability.extra or self.config.extra)
		ease_hands_played((card and card.ability.extra or self.config.extra))
	end,
	unredeem = function(self, card)
		G.GAME.round_resets.hands = G.GAME.round_resets.hands - (card and card.ability.extra or self.config.extra)
		ease_hands_played(-1 * (card and card.ability.extra or self.config.extra))
	end,
}
local threers = { --Permanently gain +2 discard[s] each round
	cry_credits = {
		idea = {
			"Frix",
		},
		art = {
			"jenwalter666",
		},
		code = {
			"Jevonn",
		},
	},
	object_type = "Voucher",
	dependencies = {
		items = {
			"set_cry_tier3",
		},
	},
	key = "threers",
	config = { extra = 2 },
	atlas = "atlasvoucher",
	order = 82,
	pos = { x = 5, y = 0 },
	requires = { "v_recyclomancy" },
	pools = { ["Tier3"] = true },
	loc_vars = function(self, info_queue, card)
		return { vars = { (card and card.ability.extra or self.config.extra) } }
	end,
	redeem = function(self, card)
		G.GAME.round_resets.discards = G.GAME.round_resets.discards + (card and card.ability.extra or self.config.extra)
		ease_discard((card and card.ability.extra or self.config.extra))
	end,
	unredeem = function(self, card)
		G.GAME.round_resets.discards = G.GAME.round_resets.discards - (card and card.ability.extra or self.config.extra)
		ease_discard(-1 * (card and card.ability.extra or self.config.extra))
	end,
}
local tacclimator = { --Tarot cards appear X6 more frequently in the shop   All future Tarot cards are free
	cry_credits = {
		idea = {
			"Frix",
		},
		art = {
			"jenwalter666",
		},
		code = {
			"Jevonn",
			"Toneblock",
		},
	},
	object_type = "Voucher",
	dependencies = {
		items = {
			"set_cry_tier3",
		},
	},
	key = "tacclimator",
	config = { extra = 24 / 4, extra_disp = 6 },
	atlas = "atlasvoucher",
	order = 83,
	pos = { x = 1, y = 4 },
	requires = { "v_tarot_tycoon" },
	pools = { ["Tier3"] = true },
	loc_vars = function(self, info_queue, card)
		return { vars = { card and card.ability.extra_disp or self.config.extra_disp } }
	end,
	redeem = function(self, card)
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.tarot_rate = G.GAME.tarot_rate * (card and card.ability.extra or self.config.extra)
				return true
			end,
		}))
	end,
	unredeem = function(self, card)
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.tarot_rate = G.GAME.tarot_rate / (card and card.ability.extra or self.config.extra)
				return true
			end,
		}))
	end,
}
local pacclimator = { --Planet cards appear X6 more frequently in the shop   All future Planet cards are free
	cry_credits = {
		idea = {
			"Frix",
		},
		art = {
			"jenwalter666",
		},
		code = {
			"Jevonn",
			"Toneblock",
		},
	},
	object_type = "Voucher",
	dependencies = {
		items = {
			"set_cry_tier3",
		},
	},
	key = "pacclimator",
	config = { extra = 24 / 4, extra_disp = 6 },
	atlas = "atlasvoucher",
	order = 84,
	pos = { x = 0, y = 4 },
	requires = { "v_planet_tycoon" },
	pools = { ["Tier3"] = true },
	loc_vars = function(self, info_queue, card)
		return { vars = { card and card.ability.extra or self.config.extra_disp } }
	end,
	redeem = function(self, card)
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.planet_rate = G.GAME.planet_rate * (card and card.ability.extra or self.config.extra)
				return true
			end,
		}))
	end,
	unredeem = function(self, card)
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.planet_rate = G.GAME.planet_rate / (card and card.ability.extra or self.config.extra)
				return true
			end,
		}))
	end,
}
local moneybean = { --Raise the cap on interest earned in each round to $2.0e299
	cry_credits = {
		idea = {
			"Frix",
		},
		art = {
			"Watermelon lover",
		},
		code = {
			"Jevonn",
		},
	},
	object_type = "Voucher",
	dependencies = {
		items = {
			"set_cry_tier3",
		},
	},
	key = "moneybean",
	config = { extra = 1e300 },
	atlas = "atlasvoucher",
	order = 85,
	pos = { x = 5, y = 1 },
	requires = { "v_money_tree" },
	pools = { ["Tier3"] = true },
	loc_vars = function(self, info_queue, card)
		return { vars = { (card and card.ability.extra or self.config.extra) / 5 } }
	end,
	redeem = function(self, card) -- this doesn't really matter with the whole interest overwrite
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.interest_cap = (card and card.ability.extra or self.config.extra)
				return true
			end,
		}))
	end,
	unredeem = function(self, card)
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.interest_cap = math.max(
					25,
					(G.P_CENTERS.v_money_tree.config.extra or 0),
					(G.P_CENTERS.v_seed_money.config.extra or 0)
				)
				return true
			end,
		}))
	end,
}
local fabric = { --+2 Joker slot[s]
	cry_credits = {
		idea = {
			"Frix",
		},
		art = {
			"Linus Goof Balls",
		},
		code = {
			"Jevonn",
		},
	},
	object_type = "Voucher",
	dependencies = {
		items = {
			"set_cry_tier3",
		},
	},
	key = "fabric",
	config = { extra = 2 },
	atlas = "atlasvoucher",
	order = 86,
	pos = { x = 6, y = 0 },
	requires = { "v_antimatter" },
	pools = { ["Tier3"] = true },
	loc_vars = function(self, info_queue, card)
		return { vars = { (card and card.ability.extra or self.config.extra) } }
	end,
	redeem = function(self, card)
		G.E_MANAGER:add_event(Event({
			func = function()
				if G.jokers then
					G.jokers.config.card_limit = G.jokers.config.card_limit
						+ (card and card.ability.extra or self.config.extra)
				end
				return true
			end,
		}))
	end,
	unredeem = function(self, card)
		G.E_MANAGER:add_event(Event({
			func = function()
				if G.jokers then
					G.jokers.config.card_limit = G.jokers.config.card_limit
						- (card and card.ability.extra or self.config.extra)
				end
				return true
			end,
		}))
	end,
	unlocked = false,
	check_for_unlock = function(self, args)
		if
			G.PROFILES[G.SETTINGS.profile].voucher_usage["v_antimatter"]
			and G.PROFILES[G.SETTINGS.profile].voucher_usage["v_antimatter"].count >= 10
		then
			unlock_card(self)
		end
		if args.type == "cry_lock_all" then
			lock_card(self)
		end
		if args.type == "cry_unlock_all" then
			unlock_card(self)
		end
	end,
}
--Order 87 reserved for Fake-out (unimplemented)
local asteroglyph = { --Set Ante to 0
	cry_credits = {
		idea = {
			"Frix",
		},
		art = {
			"Hat Stack",
		},
		code = {
			"jenwalter666",
		},
	},
	object_type = "Voucher",
	dependencies = {
		items = {
			"set_cry_tier3",
		},
	},
	key = "asteroglyph",
	atlas = "atlasvoucher",
	order = 88,
	pos = { x = 5, y = 2 },
	requires = { "v_petroglyph" },
	pools = { ["Tier3"] = true },
	loc_vars = function(self, info_queue)
		return { vars = { Cryptid.asteroglyph_ante() } }
	end,
	redeem = function(self)
		local mod = -G.GAME.round_resets.ante + Cryptid.asteroglyph_ante()
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
	end,
	unlocked = false,
	check_for_unlock = function(self, args)
		if G and G.GAME and G.GAME.round_resets and G.GAME.round_resets.ante and G.GAME.round_resets.ante >= 36 then
			unlock_card(self)
		end
		if args.type == "cry_lock_all" then
			lock_card(self)
		end
		if args.type == "cry_unlock_all" then
			unlock_card(self)
		end
	end,
	init = function(self)
		function Cryptid.asteroglyph_ante()
			if not (G.GAME or {}).modifiers then
				return 0
			end
			if not G.GAME.modifiers.cry_astero_ante then
				G.GAME.modifiers.cry_astero_ante = 0
			end
			return G.GAME.modifiers.cry_astero_ante
		end
	end,
}
--Order 89 reserved for Ivory Script (unimplemented)
local blankcanvas = { --+2 hand size
	cry_credits = {
		idea = {
			"Frix",
		},
		art = {
			"Watermelon lover",
		},
		code = {
			"Jevonn",
		},
	},
	object_type = "Voucher",
	dependencies = {
		items = {
			"set_cry_tier3",
		},
	},
	key = "blankcanvas",
	config = { extra = 2 },
	atlas = "atlasvoucher",
	order = 90,
	pos = { x = 2, y = 4 },
	requires = { "v_palette" },
	pools = { ["Tier3"] = true },
	loc_vars = function(self, info_queue, card)
		return { vars = { (card and card.ability.extra or self.config.extra) } }
	end,
	redeem = function(self, card)
		G.hand:change_size((card and card.ability.extra or self.config.extra))
	end,
	unredeem = function(self, card)
		G.hand:change_size(-1 * (card and card.ability.extra or self.config.extra))
	end,
	unlocked = false,
	check_for_unlock = function(self, args)
		if G and G.hand and G.hand.config and G.hand.config.card_limit and G.hand.config.card_limit <= 0 then
			unlock_card(self)
		end
		if args.type == "cry_lock_all" then
			lock_card(self)
		end
		if args.type == "cry_unlock_all" then
			unlock_card(self)
		end
	end,
}
local stickyhand = { --+1 card selection limit
	cry_credits = {
		idea = {
			"HexaCryonic",
		},
		art = {
			"HexaCryonic",
		},
		code = {
			"HexaCryonic",
		},
	},
	object_type = "Voucher",
	dependencies = {
		items = {
			"set_cry_voucher",
		},
	},
	key = "stickyhand",
	config = { extra = 1 },
	atlas = "atlasvoucher",
	order = 9,
	pos = { x = 0, y = 5 },
	loc_vars = function(self, info_queue, card)
		return { vars = { (card and card.ability.extra or self.config.extra) } }
	end,
	redeem = function(self, card)
		G.hand.config.highlighted_limit = G.hand.config.highlighted_limit
			+ (card and card.ability.extra or self.config.extra)
	end,
	unredeem = function(self, card)
		G.hand.config.highlighted_limit = G.hand.config.highlighted_limit
			- (card and card.ability.extra or self.config.extra)
		if G.hand.config.highlighted_limit < 5 then
			G.hand.config.highlighted_limit = 5
		end
		if not G.GAME.before_play_buffer then
			G.hand:unhighlight_all()
		end
	end,
}
local grapplinghook = { --+1 card selection limit (replace me when "extra functionality" is added later)
	cry_credits = {
		idea = {
			"HexaCryonic",
		},
		art = {
			"HexaCryonic",
		},
		code = {
			"HexaCryonic",
		},
	},
	object_type = "Voucher",
	dependencies = {
		items = {
			"set_cry_voucher",
			"v_cry_stickyhand",
		},
	},
	key = "grapplinghook",
	config = { extra = 2 },
	atlas = "atlasvoucher",
	order = 10,
	pos = { x = 1, y = 5 },
	requires = { "v_cry_stickyhand" },
	loc_vars = function(self, info_queue, card)
		return { vars = { (card and card.ability.extra or self.config.extra) } }
	end,
	redeem = function(self, card)
		G.hand.config.highlighted_limit = G.hand.config.highlighted_limit
			+ (card and card.ability.extra or self.config.extra)
	end,
	unredeem = function(self, card)
		G.hand.config.highlighted_limit = G.hand.config.highlighted_limit
			- (card and card.ability.extra or self.config.extra)
		if G.hand.config.highlighted_limit < 5 then
			G.hand.config.highlighted_limit = 5
		end
		if not G.GAME.before_play_buffer then
			G.hand:unhighlight_all()
		end
	end,
}
local hyperspacetether = { --+2 card selection limit + other stuff
	cry_credits = {
		idea = {
			"HexaCryonic",
		},
		art = {
			"HexaCryonic",
		},
		code = {
			"HexaCryonic",
		},
	},
	object_type = "Voucher",
	dependencies = {
		items = {
			"set_cry_voucher",
			"set_cry_tier3",
			"v_cry_grapplinghook",
		},
	},
	key = "hyperspacetether",
	config = { extra = 2 },
	atlas = "atlasvoucher",
	pos = { x = 2, y = 5 },
	order = 95,
	requires = { "v_cry_grapplinghook" },
	pools = { ["Tier3"] = true },
	loc_vars = function(self, info_queue, card)
		return { vars = { (card and card.ability.extra or self.config.extra) } }
	end,
	redeem = function(self, card)
		G.hand.config.highlighted_limit = G.hand.config.highlighted_limit
			+ (card and card.ability.extra or self.config.extra)
	end,
	unredeem = function(self, card)
		G.hand.config.highlighted_limit = G.hand.config.highlighted_limit
			- (card and card.ability.extra or self.config.extra)
		if G.hand.config.highlighted_limit < 5 then
			G.hand.config.highlighted_limit = 5
		end
		if not G.GAME.before_play_buffer then
			G.hand:unhighlight_all()
		end
	end,
}
local triple = { --Copies voucher triple tag
	cry_credits = {
		idea = {
			"Catman",
			"Mystic Misclick",
		},
		art = {
			"5381",
		},
		code = {
			"Math",
		},
	},
	object_type = "Tag",
	dependencies = {
		items = {
			"set_cry_tag",
			"v_cry_copies",
		},
	},
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
	cry_credits = {
		idea = {
			"Catman",
			"Mystic Misclick",
		},
		art = {
			"5381",
		},
		code = {
			"Math",
		},
	},
	object_type = "Tag",
	dependencies = {
		items = {
			"set_cry_tag",
			"v_cry_tag_printer",
		},
	},
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
	cry_credits = {
		idea = {
			"Catman",
			"Mystic Misclick",
		},
		art = {
			"5381",
		},
		code = {
			"Math",
		},
	},
	object_type = "Tag",
	dependencies = {
		items = {
			"set_cry_tag",
			"v_cry_clone_machine",
		},
	},
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
	hyperspacetether,
	command_prompt,
	satellite_uplink,
	quantum_computing,
	pairing,
	repair_man,
	pairamount_plus,
	double_vision,
	double_slit,
	double_down,
}
return {
	name = "Vouchers",
	init = function()
		--Add T3 Voucher pool for Golden Voucher Tag (in Tags.lua) and maybe other things in the future
		-- Uncursed this -Math
		function Cryptid.next_tier3_key(_from_tag)
			local _pool, _pool_key = get_current_pool("Tier3")
			if _from_tag then
				_pool_key = "Voucher_fromtag"
			end
			local center = pseudorandom_element(_pool, pseudoseed(_pool_key))
			local it = 1
			while center == "UNAVAILABLE" do
				it = it + 1
				center = pseudorandom_element(_pool, pseudoseed(_pool_key .. "_resample" .. it))
			end

			return center
		end
	end,
	items = voucheritems,
}
