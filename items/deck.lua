local very_fair = {
	object_type = "Back",
	name = "Very Fair Deck",
	key = "very_fair",
	config = { hands = -2, discards = -2 },
	pos = { x = 4, y = 0 },
	order = 1,
	atlas = "atlasdeck",
	apply = function(self)
		G.GAME.modifiers.cry_no_vouchers = true
	end,
}
very_fair_quip = {}

local equilibrium = {
	object_type = "Back",
	name = "cry-Equilibrium",
	key = "equilibrium",
	order = 3,
	config = { vouchers = { "v_overstock_norm", "v_overstock_plus" } },
	pos = { x = 0, y = 1 },
	atlas = "atlasdeck",
	apply = function(self)
		G.GAME.modifiers.cry_equilibrium = true
	end,
}
local misprint = {
	object_type = "Back",
	name = "cry-Misprint",
	key = "misprint",
	order = 4,
	config = { cry_misprint_min = 0.1, cry_misprint_max = 10 },
	pos = { x = 4, y = 2 },
	atlas = "atlasdeck",
	apply = function(self)
		G.GAME.modifiers.cry_misprint_min = self.config.cry_misprint_min
		G.GAME.modifiers.cry_misprint_max = self.config.cry_misprint_max
	end,
}
local infinite = {
	object_type = "Back",
	name = "cry-Infinite",
	key = "infinite",
	order = 2,
	config = { cry_highlight_limit = 1e20, hand_size = 1 },
	pos = { x = 3, y = 0 },
	atlas = "atlasdeck",
	apply = function(self)
		G.GAME.modifiers.cry_highlight_limit = self.config.cry_highlight_limit
	end,
}
local conveyor = {
	object_type = "Back",
	name = "cry-Conveyor",
	key = "conveyor",
	order = 7,
	pos = { x = 1, y = 1 },
	atlas = "atlasdeck",
	apply = function(self)
		G.GAME.modifiers.cry_conveyor = true
	end,
}
local CCD = {
	object_type = "Back",
	name = "cry-CCD",
	key = "CCD",
	order = 5,
	config = { cry_ccd = true },
	pos = { x = 0, y = 0 },
	atlas = "atlasdeck",
	apply = function(self)
		G.GAME.modifiers.cry_ccd = true
	end,
}
local wormhole = {
	object_type = "Back",
	name = "cry-Wormhole",
	key = "wormhole",
	order = 6,
	config = { cry_negative_rate = 20, joker_slot = -2 },
	pos = { x = 3, y = 4 },
	atlas = "atlasdeck",
	apply = function(self)
		G.GAME.modifiers.cry_negative_rate = self.config.cry_negative_rate
		G.E_MANAGER:add_event(Event({
			func = function()
				if G.jokers then
					local card = create_card("Joker", G.jokers, nil, "cry_exotic", nil, nil, nil, "cry_wormhole")
					card:add_to_deck()
					card:start_materialize()
					G.jokers:emplace(card)
					return true
				end
			end,
		}))
	end,
}
local redeemed = {
	object_type = "Back",
	name = "cry-Redeemed",
	key = "redeemed",
	order = 8,
	pos = { x = 4, y = 4 },
	atlas = "atlasdeck",
	apply = function(self)
		G.GAME.modifiers.cry_redeemed = true
	end,
}
local legendary = {
	object_type = "Back",
	name = "cry-Legendary",
	key = "legendary",
	config = { cry_legendary = true, cry_legendary_rate = 0.2 },
	pos = { x = 0, y = 6 },
	atlas = "atlasdeck",
	order = 15,
	trigger_effect = function(self, args)
		if args.context == "eval" and G.GAME.last_blind and G.GAME.last_blind.boss then
			if G.jokers then
				if #G.jokers.cards < G.jokers.config.card_limit then
					local legendary_poll = pseudorandom(pseudoseed("cry_legendary"))
					legendary_poll = legendary_poll / (G.GAME.probabilities.normal or 1)
					if legendary_poll < self.config.cry_legendary_rate then
						local card = create_card("Joker", G.jokers, true, 4, nil, nil, nil, "")
						card:add_to_deck()
						card:start_materialize()
						G.jokers:emplace(card)
						return true
					else
						card_eval_status_text(
							G.jokers,
							"jokers",
							nil,
							nil,
							nil,
							{ message = localize("k_nope_ex"), colour = G.C.RARITY[4] }
						)
					end
				else
					card_eval_status_text(
						G.jokers,
						"jokers",
						nil,
						nil,
						nil,
						{ message = localize("k_no_room_ex"), colour = G.C.RARITY[4] }
					)
				end
			end
		end
	end,
	apply = function(self)
		G.E_MANAGER:add_event(Event({
			func = function()
				if G.jokers then
					local card = create_card("Joker", G.jokers, true, 4, nil, nil, nil, "")
					card:add_to_deck()
					card:start_materialize()
					G.jokers:emplace(card)
					return true
				end
			end,
		}))
	end,
}
local critical = {
	object_type = "Back",
	name = "cry-Critical",
	key = "critical",
	order = 10,
	config = { cry_crit_rate = 0.25, cry_crit_miss_rate = 0.125 },
	pos = { x = 4, y = 5 },
	atlas = "atlasdeck",
	loc_vars = function(self, info_queue, center)
		return { vars = { G.GAME.probabilities.normal or 1 } }
	end,
	trigger_effect = function(self, args)
		if args.context == "final_scoring_step" then
			local crit_poll = pseudorandom(pseudoseed("cry_critical"))
			crit_poll = crit_poll / (G.GAME.probabilities.normal or 1)
			if crit_poll < self.config.cry_crit_rate then
				args.mult = args.mult ^ 2
				update_hand_text({ delay = 0 }, { mult = args.mult, chips = args.chips })
				G.E_MANAGER:add_event(Event({
					func = function()
						play_sound("talisman_emult", 1)
						attention_text({
							scale = 1.4,
							text = localize("cry_critical_hit_ex"),
							hold = 2,
							align = "cm",
							offset = { x = 0, y = -2.7 },
							major = G.play,
						})
						return true
					end,
				}))
			elseif crit_poll < self.config.cry_crit_rate + self.config.cry_crit_miss_rate then
				args.mult = args.mult ^ 0.5
				update_hand_text({ delay = 0 }, { mult = args.mult, chips = args.chips })
				G.E_MANAGER:add_event(Event({
					func = function()
						play_sound("timpani", 1)
						attention_text({
							scale = 1.4,
							text = localize("cry_critical_miss_ex"),
							hold = 2,
							align = "cm",
							offset = { x = 0, y = -2.7 },
							major = G.play,
						})
						return true
					end,
				}))
			end
			delay(0.6)
			return args.chips, args.mult
		end
	end,
}
local glowing = {
	object_type = "Back",
	name = "cry-Glowing",
	key = "glowing",
	-- is this config even used for anything
	config = { cry_glowing = true },
	pos = { x = 4, y = 2 },
	order = 9,
	loc_vars = function(self, info_queue, center)
		return { vars = { " " } }
	end,
	atlas = "glowing",
	trigger_effect = function(self, args)
		if args.context == "eval" and G.GAME.last_blind and G.GAME.last_blind.boss then
			for i = 1, #G.jokers.cards do
				if not Card.no(G.jokers.cards[i], "immutable", true) then
					cry_with_deck_effects(G.jokers.cards[i], function(card)
						cry_misprintize(card, { min = 1.25, max = 1.25 }, nil, true)
					end)
				end
			end
		end
	end,
}
local beta = {
	object_type = "Back",
	name = "cry-Beta",
	key = "beta",
	config = { cry_beta = true },
	pos = { x = 5, y = 5 },
	order = 13,
	atlas = "atlasdeck",
	apply = function(self)
		G.GAME.modifiers.cry_beta = true
	end,
}
local bountiful = {
	object_type = "Back",
	name = "cry-Bountiful",
	key = "bountiful",
	config = { cry_forced_draw_amount = 5 },
	pos = { x = 2, y = 6 },
	order = 14,
	atlas = "atlasdeck",
	apply = function(self)
		G.GAME.modifiers.cry_forced_draw_amount = self.config.cry_forced_draw_amount
	end,
}
local beige = {
	object_type = "Back",
	name = "cry-Beige",
	key = "beige",
	pos = { x = 1, y = 6 },
	order = 15,
	atlas = "atlasdeck",
	apply = function(self)
		G.GAME.modifiers.cry_common_value_quad = true
	end,
}
return {
	name = "Misc. Decks",
	init = function()
		--equilibrium deck patches
		local gcp = get_current_pool
		function get_current_pool(t, r, l, a, override_equilibrium_effect)
			if
				G.GAME.modifiers.cry_equilibrium
				and not override_equilibrium_effect
				and (a == "sho" or t == "Voucher" or t == "Booster")
			then
				if
					t ~= "Enhanced"
					and t ~= "Edition"
					and t ~= "Back"
					and t ~= "Tag"
					and t ~= "Seal"
					and t ~= "Stake"
				then
					if true then	-- if not P_CRY_ITEMS then
						-- we're regenerating the pool every time because of banned keys but it's fine tbh
						P_CRY_ITEMS = {}
						local valid_pools = { "Joker", "Consumeables", "Voucher", "Booster" }
						for _, id in ipairs(valid_pools) do
							for k, v in pairs(G.P_CENTER_POOLS[id]) do
								if v.unlocked == true and not center_no(v, "doe", k) and not G.GAME.banned_keys[v.key] then
									P_CRY_ITEMS[#P_CRY_ITEMS + 1] = v.key
								end
							end
						end
						--[[	this doesn't seem to be working
						for k, v in pairs(G.P_CARDS) do
							if v.unlocked == true and not center_no(v, "doe", k) then
								P_CRY_ITEMS[#P_CRY_ITEMS + 1] = v.key
							end
						end
						]]
					end
					if #P_CRY_ITEMS <= 0 then P_CRY_ITEMS[#P_CRY_ITEMS + 1] = 'v_blank' end
					return P_CRY_ITEMS, "cry_equilibrium" .. G.GAME.round_resets.ante
				end
			end
			return gcp(t, r, l, a)
		end
		local gp = get_pack
		function get_pack(k, t)
			if G.GAME.modifiers.cry_equilibrium then
				if not P_CRY_ITEMS then
					P_CRY_ITEMS = {}
					local valid_pools = { "Joker", "Consumeables", "Voucher", "Booster" }
					for _, id in ipairs(valid_pools) do
						for k, v in pairs(G.P_CENTER_POOLS[id]) do
							if not center_no(v, "doe", k) then
								P_CRY_ITEMS[#P_CRY_ITEMS + 1] = v.key
							end
						end
					end
					for k, v in pairs(G.P_CARDS) do
						if not center_no(v, "doe", k) then
							P_CRY_ITEMS[#P_CRY_ITEMS + 1] = v.key
						end
					end
				end
				return G.P_CENTERS[pseudorandom_element(
					P_CRY_ITEMS,
					pseudoseed("cry_equipackbrium" .. G.GAME.round_resets.ante)
				)]
			end
			return gp(k, t)
		end
		--wormhole deck patches
		SMODS.Edition:take_ownership("negative", {
			get_weight = function(self)
				return self.weight * (G.GAME.modifiers.cry_negative_rate or 1)
			end,
		}, true)
		--redeemed deck patches
		local cr = Card.redeem
		function Card:redeem()
			cr(self)
			if G.GAME.modifiers.cry_redeemed then
				if
					#G.play.cards == 0
					and (not G.redeemed_vouchers_during_hand or #G.redeemed_vouchers_during_hand.cards == 0)
				then
					G.cry_redeemed_buffer = {}
				end
				for k, v in pairs(G.P_CENTER_POOLS["Voucher"]) do
					if v.requires and not G.GAME.used_vouchers[v] then
						for _, vv in pairs(v.requires) do
							if vv == self.config.center.key then
								--redeem extra voucher code based on Betmma's Vouchers
								local area
								if G.STATE == G.STATES.HAND_PLAYED then
									if not G.redeemed_vouchers_during_hand then
										G.redeemed_vouchers_during_hand = CardArea(
											G.play.T.x,
											G.play.T.y,
											G.play.T.w,
											G.play.T.h,
											{ type = "play", card_limit = 5 }
										)
									end
									area = G.redeemed_vouchers_during_hand
								else
									area = G.play
								end
								if not G.cry_redeemed_buffer[v.key]
								and v.unlocked then
									local card = create_card("Voucher", area, nil, nil, nil, nil, v.key)
									G.cry_redeemed_buffer[v.key] = true
									card:start_materialize()
									area:emplace(card)
									card.cost = 0
									card.shop_voucher = false
									local current_round_voucher = G.GAME.current_round.voucher
									card:redeem()
									G.GAME.current_round.voucher = current_round_voucher
									G.E_MANAGER:add_event(Event({
										trigger = "after",
										delay = 0,
										func = function()
											card:start_dissolve()
											return true
										end,
									}))
								end
							end
						end
					end
				end
			end
		end
	end,
	items = {
		very_fair,
		equilibrium,
		misprint,
		infinite,
		conveyor,
		CCD,
		wormhole,
		redeemed,
		legendary,
		critical,
		glowing,
		beta,
		bountiful,
		beige,
	},
}
