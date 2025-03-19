-- Code to handle stickers, debuffs, etc.
-- Warning: this is a bit of a mess

-- moved unredeem and unapply functions outside of spectrals
function Card:unredeem()
	if self.ability.set == "Voucher" then
		stop_use()
		if not self.config.center.discovered then
			discover_card(self.config.center)
		end

		self.states.hover.can = false
		local top_dynatext = nil
		local bot_dynatext = nil

		G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 0.4,
			func = function()
				top_dynatext = DynaText({
					string = localize({
						type = "name_text",
						set = self.config.center.set,
						key = self.config.center.key,
					}),
					colours = { G.C.RED },
					rotate = 1,
					shadow = true,
					bump = true,
					float = true,
					scale = 0.9,
					pop_in = 0.6 / G.SPEEDFACTOR,
					pop_in_rate = 1.5 * G.SPEEDFACTOR,
				})
				bot_dynatext = DynaText({
					string = localize("cry_unredeemed"),
					colours = { G.C.RED },
					rotate = 2,
					shadow = true,
					bump = true,
					float = true,
					scale = 0.9,
					pop_in = 1.4 / G.SPEEDFACTOR,
					pop_in_rate = 1.5 * G.SPEEDFACTOR,
					pitch_shift = 0.25,
				})
				self:juice_up(0.3, 0.5)
				play_sound("card1")
				play_sound("timpani")
				self.children.top_disp = UIBox({
					definition = {
						n = G.UIT.ROOT,
						config = { align = "tm", r = 0.15, colour = G.C.CLEAR, padding = 0.15 },
						nodes = {
							{ n = G.UIT.O, config = { object = top_dynatext } },
						},
					},
					config = { align = "tm", offset = { x = 0, y = 0 }, parent = self },
				})
				self.children.bot_disp = UIBox({
					definition = {
						n = G.UIT.ROOT,
						config = { align = "tm", r = 0.15, colour = G.C.CLEAR, padding = 0.15 },
						nodes = {
							{ n = G.UIT.O, config = { object = bot_dynatext } },
						},
					},
					config = { align = "bm", offset = { x = 0, y = 0 }, parent = self },
				})
				return true
			end,
		}))

		if not self.debuff then
			self:unapply_to_run()
		end

		delay(0.6)
		G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 2.6,
			func = function()
				top_dynatext:pop_out(4)
				bot_dynatext:pop_out(4)
				return true
			end,
		}))

		G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 0.5,
			func = function()
				self.children.top_disp:remove()
				self.children.top_disp = nil
				self.children.bot_disp:remove()
				self.children.bot_disp = nil
				return true
			end,
		}))
	end
	G.E_MANAGER:add_event(Event({
		func = function()
			Cryptid.update_used_vouchers()
			return true
		end,
	}))
end

function Card:unapply_to_run(center)
	local center_table = {
		name = center and center.name or self and self.ability.name,
		extra = self and self.ability.extra or center and center.config.extra,
	}
	local obj = center or self.config.center
	if obj.unredeem and type(obj.unredeem) == "function" then
		obj:unredeem(self)
		return
	end

	if center_table.name == "Overstock" or center_table.name == "Overstock Plus" then
		G.E_MANAGER:add_event(Event({
			func = function()
				change_shop_size(-center_table.extra)
				return true
			end,
		}))
	end
	if center_table.name == "Tarot Merchant" or center_table.name == "Tarot Tycoon" then
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.tarot_rate = G.GAME.tarot_rate / center_table.extra
				return true
			end,
		}))
	end
	if center_table.name == "Planet Merchant" or center_table.name == "Planet Tycoon" then
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.planet_rate = G.GAME.planet_rate / center_table.extra
				return true
			end,
		}))
	end
	if center_table.name == "Hone" or center_table.name == "Glow Up" then
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.edition_rate = G.GAME.edition_rate / center_table.extra
				return true
			end,
		}))
	end
	if center_table.name == "Magic Trick" then
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.playing_card_rate = 0
				return true
			end,
		}))
	end
	if center_table.name == "Crystal Ball" then
		G.E_MANAGER:add_event(Event({
			func = function()
				G.consumeables.config.card_limit = G.consumeables.config.card_limit - center_table.extra
				return true
			end,
		}))
	end
	if center_table.name == "Clearance Sale" then
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.discount_percent = 0
				for k, v in pairs(G.I.CARD) do
					if v.set_cost then
						v:set_cost()
					end
				end
				return true
			end,
		}))
	end
	if center_table.name == "Liquidation" then
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.discount_percent = 25 -- no idea why the below returns nil, so it's hardcoded now
				-- G.GAME.discount_percent = G.P_CENTERS.v_clearance_sale.extra
				for k, v in pairs(G.I.CARD) do
					if v.set_cost then
						v:set_cost()
					end
				end
				return true
			end,
		}))
	end
	if center_table.name == "Reroll Surplus" or center_table.name == "Reroll Glut" then
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.round_resets.reroll_cost = G.GAME.round_resets.reroll_cost + self.ability.extra
				G.GAME.current_round.reroll_cost = math.max(0, G.GAME.current_round.reroll_cost + self.ability.extra)
				return true
			end,
		}))
	end
	if center_table.name == "Seed Money" then
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.interest_cap = 25 --note: does not account for potential deck effects
				return true
			end,
		}))
	end
	if center_table.name == "Money Tree" then
		G.E_MANAGER:add_event(Event({
			func = function()
				if G.GAME.used_vouchers.v_seed_money then
					G.GAME.interest_cap = 50
				else
					G.GAME.interest_cap = 25
				end
				return true
			end,
		}))
	end
	if center_table.name == "Grabber" or center_table.name == "Nacho Tong" then
		G.GAME.round_resets.hands = G.GAME.round_resets.hands - center_table.extra
		ease_hands_played(-center_table.extra)
	end
	if center_table.name == "Paint Brush" or center_table.name == "Palette" then
		G.hand:change_size(-center_table.extra)
	end
	if center_table.name == "Wasteful" or center_table.name == "Recyclomancy" then
		G.GAME.round_resets.discards = G.GAME.round_resets.discards - center_table.extra
		ease_discard(-center_table.extra)
	end
	if center_table.name == "Antimatter" then
		G.E_MANAGER:add_event(Event({
			func = function()
				if G.jokers then
					G.jokers.config.card_limit = G.jokers.config.card_limit - center_table.extra
				end
				return true
			end,
		}))
	end
	if center_table.name == "Hieroglyph" or center_table.name == "Petroglyph" then
		ease_ante(center_table.extra)
		G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante
		G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante + center_table.extra

		if center_table.name == "Hieroglyph" then
			G.GAME.round_resets.hands = G.GAME.round_resets.hands + center_table.extra
			ease_hands_played(center_table.extra)
		end
		if center_table.name == "Petroglyph" then
			G.GAME.round_resets.discards = G.GAME.round_resets.discards + center_table.extra
			ease_discard(center_table.extra)
		end
	end
end

local setabilityref = Card.set_ability
function Card:set_ability(center, initial, delay_sprites)
	setabilityref(self, center, initial, delay_sprites)
	self.ignore_base_shader = self.ignore_base_shader or {}
	self.ignore_shadow = self.ignore_shadow or {}
	local function repeatcheck(comp, table)
		for _, v in ipairs(table) do
			if comp == v then
				return true
			end
		end
		return false
	end
	local edition = nil
	local sticker = nil
	local random = nil
	if Cryptid.safe_get(G, "GAME", "modifiers", "cry_force_edition") then
		edition = G.GAME.modifiers.cry_force_edition
	end
	if Cryptid.safe_get(G, "GAME", "modifiers", "cry_force_sticker") then
		sticker = G.GAME.modifiers.cry_force_sticker
	end
	if Cryptid.safe_get(G, "GAME", "modifiers", "cry_force_random_edition") then
		random = true
	end
	if
		repeatcheck(self.ability.set, { "Joker", "Voucher", "Booster", "Base", "Enhanced" })
		or self.ability.consumeable
	then
		if edition and not random then
			self:set_edition({ [edition] = true }, true, true)
		elseif random then
			self:set_edition(Cryptid.poll_random_edition(), true, true)
		end
		if sticker then
			self.ability[sticker] = true
			self:set_cost()
		end
	end
	if self.ability.set == "Voucher" then
		if self.ability.perishable and not self.ability.perish_tally then
			self.ability.perish_tally = G.GAME.cry_voucher_perishable_rounds
		end
	end
end

local updateref = Card.update
function Card:update(dt)
	updateref(self, dt)
	if self.area then
		if self.area.config.type == "discard" or self.area.config.type == "deck" then
			return --prevent lagging event queues with unneeded flips
		end
	end
	if self.sprite_facing == "back" and self.edition and self.edition.cry_double_sided then
		self.sprite_facing = "front"
		self.facing = "front"
		if self.flipping == "f2b" then
			self.flipping = "b2f"
		end
		self:dbl_side_flip()
	end
	if self.ability.cry_absolute then -- feedback loop... may be problematic
		self.cry_absolute = true
	end
	if self.cry_absolute then
		self.ability.cry_absolute = true
		self.ability.eternal = true
	end
	if self.ability.pinned then
		self.pinned = true
	end -- gluing these variables together
	if self.pinned then
		self.ability.pinned = true
	end
end

local setdebuffref = Card.set_debuff
function Card:set_debuff(should_debuff)
	local is_debuffed = self.debuff
	setdebuffref(self, should_debuff)
	if self.debuff == true and is_debuffed ~= self.debuff then
		if self.ability.set == "Voucher" then
			self:unapply_to_run()
		end
	end
end

local dissolveref = Card.start_dissolve
function Card:start_dissolve(dissolve_colours, silent, dissolve_time_fac, no_juice)
	dissolveref(self, dissolve_colours, silent, dissolve_time_fac, no_juice)
	G.E_MANAGER:add_event(Event({
		func = function()
			Cryptid.update_used_vouchers()
			return true
		end,
	}))
end

function Cryptid.update_used_vouchers()
	if G and G.GAME and G.vouchers then
		G.GAME.used_vouchers = {}
		for i, v in ipairs(G.vouchers.cards) do
			G.GAME.used_vouchers[v.config.center_key] = true
		end
	end
end

-- check if Director's Cut or Retcon offers a cheaper reroll price
function Cryptid.cheapest_boss_reroll()
	local cheapest = 1e300
	local vouchers = {
		SMODS.find_card("v_directors_cut"),
		SMODS.find_card("v_retcon"),
	}
	for _, table in ipairs(vouchers) do
		for i, v in ipairs(table) do
			if v.ability.extra <= cheapest then
				cheapest = v.ability.extra
			end
		end
	end
	return cheapest
end

-- check for best interest cap. better than what's done with redeems/unredeems
-- unfortunately this still sucks
-- make seed money/other vouchers better at some point?
function cry_best_interest_cap()
	local best = 25
	local vouchers = {
		SMODS.find_card("v_seed_money"),
		SMODS.find_card("v_money_tree"),
		SMODS.find_card("v_cry_moneybean"),
	}
	for _, table in ipairs(vouchers) do
		for i, v in ipairs(table) do
			if v.ability.extra >= best then
				best = v.ability.extra
			end
		end
	end
	return best
end
local evaluateroundref = G.FUNCS.evaluate_round
G.FUNCS.evaluate_round = function()
	G.GAME.interest_cap = cry_best_interest_cap() -- blehhhhhh
	--Semicolon Stuff
	if G.GAME.current_round.semicolon then
		add_round_eval_row({ dollars = 0, name = "blind1", pitch = 0.95, saved = true })
		G.E_MANAGER:add_event(Event({
			trigger = "before",
			delay = 1.3 * math.min(G.GAME.blind.dollars + 2, 7) / 2 * 0.15 + 0.5,
			func = function()
				G.GAME.blind:defeat()
				return true
			end,
		}))
		delay(0.2)
		add_round_eval_row({ name = "bottom", dollars = 0 })
	else
		return evaluateroundref()
	end
end
function Cryptid.edition_to_table(edition) -- look mom i figured it out (this does NOT need to be a function)
	if edition then
		return { [edition] = true }
	end
end
function cry_get_next_voucher_edition() -- currently only for edition decks, can be modified if voucher editioning becomes more important
	if G.GAME.modifiers.cry_force_edition then
		return Cryptid.edition_to_table(G.GAME.modifiers.cry_force_edition)
	elseif G.GAME.modifiers.cry_force_random_edition then
		return Cryptid.poll_random_edition()
	end
end
-- code to generate Stickers for Vouchers (and boosters), based on that for Jokers
function Cryptid.next_voucher_stickers(booster)
	local rate = 0.3
	if booster then
		rate = 0.2
	end
	local suff = "v"
	if booster then
		suff = "b"
	end
	local odds = 1 - rate

	local ret = { eternal = false, perishable = false, rental = false, pinned = false, banana = false }
	local checks = { eternal = {}, perishable = {}, rental = {}, pinned = {}, banana = {} }

	-- first order of business is making this shit not suck lmao
	-- i did this when i didn't know what i was doing so it contains a lot of pointless checks and bloat
	for k, v in pairs(checks) do
		v["poll"] = pseudorandom("cry_" .. suff .. k .. G.GAME.round_resets.ante)
		v["force"] = G.GAME.modifiers.cry_sticker_sheet_plus
			or (G.GAME.modifiers.cry_force_sticker and G.GAME.modifiers.cry_force_sticker == k)
	end
	if
		G.GAME.modifiers.cry_any_stickers
		or G.GAME.modifiers.cry_sticker_sheet_plus
		or G.GAME.modifiers.cry_force_sticker
	then
		if (G.GAME.modifiers.enable_eternals_in_shop and checks.eternal.poll > odds) or checks.eternal.force then
			ret.eternal = true
		end
		if
			(
				G.GAME.modifiers.cry_eternal_perishable_compat
				and (G.GAME.modifiers.enable_perishables_in_shop and checks.perishable.poll > odds)
			) or checks.perishable.force
		then -- still ehh? but way more understandable
			ret.perishable = true
		elseif
			(
				not G.GAME.modifiers.cry_eternal_perishable_compat
				and (
					G.GAME.modifiers.enable_perishables_in_shop
					and checks.eternal.poll > odds - rate
					and checks.eternal.poll <= odds
				)
			) or checks.perishable.force
		then
			ret.perishable = true
		end
		if (G.GAME.modifiers.enable_rentals_in_shop and checks.rental.poll > odds) or checks.rental.force then
			ret.rental = true
		end
		if (G.GAME.modifiers.enable_pinned_in_shop and checks.pinned.poll > odds) or checks.pinned.force then
			ret.pinned = true
		end
		if (G.GAME.modifiers.enable_banana_in_shop and checks.banana.poll > odds) or checks.banana.force then
			ret.banana = true
		end
	end
	return ret
end

-- Calculates Rental sticker for Consumables
function Card:cry_calculate_consumeable_rental()
	if self.ability.rental then
		ease_dollars(-G.GAME.cry_consumeable_rental_rate)
		card_eval_status_text(self, "dollars", -G.GAME.cry_consumeable_rental_rate)
	end
end
-- Calculates Rental sticker for Vouchers
function Card:cry_calculate_voucher_rental()
	if self.ability.rental then
		ease_dollars(-G.GAME.cry_voucher_rental_rate)
		card_eval_status_text(self, "dollars", -G.GAME.cry_voucher_rental_rate)
	end
end

-- Calculates Perishable sticker for Consumables
function Card:cry_calculate_consumeable_perishable()
	if not self.ability.perish_tally then
		self.ability.perish_tally = 1
	end
	if self.ability.perishable and self.ability.perish_tally > 0 then
		self.ability.perish_tally = 0
		card_eval_status_text(
			self,
			"extra",
			nil,
			nil,
			nil,
			{ message = localize("k_disabled_ex"), colour = G.C.FILTER, delay = 0.45 }
		)
		self:set_debuff()
	end
end
-- Calculates Perishable sticker for Vouchers
function Card:cry_calculate_voucher_perishable()
	if self.ability.perishable and not self.ability.perish_tally then
		self.ability.perish_tally = G.GAME.cry_voucher_perishable_rounds
	end
	if self.ability.perishable and self.ability.perish_tally > 0 then
		if self.ability.perish_tally == 1 then
			self.ability.perish_tally = 0
			card_eval_status_text(
				self,
				"extra",
				nil,
				nil,
				nil,
				{ message = localize("k_disabled_ex"), colour = G.C.FILTER, delay = 0.45 }
			)
			self:set_debuff()
		else
			self.ability.perish_tally = self.ability.perish_tally - 1
			card_eval_status_text(self, "extra", nil, nil, nil, {
				message = localize({ type = "variable", key = "a_remaining", vars = { self.ability.perish_tally } }),
				colour = G.C.FILTER,
				delay = 0.45,
			})
		end
	end
end

function Card:set_perishable(_perishable)
	self.ability.perishable = nil
	if
		(self.config.center.perishable_compat or G.GAME.modifiers.cry_any_stickers)
		and (not self.ability.eternal or G.GAME.modifiers.cry_eternal_perishable_compat)
	then
		self.ability.perishable = true
		self.ability.perish_tally = G.GAME.perishable_rounds or 5
	end
end
function Card:set_eternal(_eternal)
	self.ability.eternal = nil
	if
		(self.config.center.eternal_compat or G.GAME.modifiers.cry_any_stickers)
		and (not self.ability.perishable or G.GAME.modifiers.cry_eternal_perishable_compat)
	then
		self.ability.eternal = _eternal
	end
end
function Card:calculate_banana()
	if not self.ability.extinct then
		if self.ability.banana and (pseudorandom("banana") < G.GAME.probabilities.normal / 10) then
			self.ability.extinct = true
			G.E_MANAGER:add_event(Event({
				func = function()
					play_sound("tarot1")
					self.T.r = -0.2
					self:juice_up(0.3, 0.4)
					self.states.drag.is = true
					self.children.center.pinch.x = true
					G.E_MANAGER:add_event(Event({
						trigger = "after",
						delay = 0.3,
						blockable = false,
						func = function()
							if self.area then
								self.area:remove_card(self)
							end
							self:remove()
							self = nil
							return true
						end,
					}))
					return true
				end,
			}))
			card_eval_status_text(self, "jokers", nil, nil, nil, { message = localize("k_extinct_ex"), delay = 0.1 })
			return true
		elseif self.ability.banana then
			card_eval_status_text(self, "jokers", nil, nil, nil, { message = localize("k_safe_ex"), delay = 0.1 })
			return false
		end
	end
	return false
end
function Card:set_banana(_banana)
	self.ability.banana = _banana
end
function Card:set_pinned(_pinned)
	self.ability.pinned = _pinned
end

SMODS.Sticker:take_ownership("perishable", {
	atlas = "sticker",
	pos = { x = 4, y = 4 },
	prefix_config = { key = false },
	loc_vars = function(self, info_queue, card)
		if card.ability.consumeable then
			return { key = "cry_perishable_consumeable" }
		elseif card.ability.set == "Voucher" then
			return {
				key = "cry_perishable_voucher",
				vars = {
					G.GAME.cry_voucher_perishable_rounds or 1,
					card.ability.perish_tally or G.GAME.cry_voucher_perishable_rounds,
				},
			}
		elseif card.ability.set == "Booster" then
			return { key = "cry_perishable_booster" }
		else
			return { vars = { G.GAME.perishable_rounds or 1, card.ability.perish_tally or G.GAME.perishable_rounds } }
		end
	end,
	calculate = function(self, card, context)
		if context.end_of_round and context.main_eval then -- perishable is calculated seperately across G.playing_cards i believe
			if card.ability.consumeable then
				card:cry_calculate_consumeable_perishable()
			elseif card.ability.set == "Voucher" then
				card:cry_calculate_voucher_perishable()
			else
				card:calculate_perishable()
			end
		end
	end,
})
SMODS.Sticker:take_ownership("pinned", {
	atlas = "sticker",
	pos = { x = 5, y = 0 },
	prefix_config = { key = false },
	loc_vars = function(self, info_queue, card)
		if card.ability.consumeable then
			return { key = "cry_pinned_consumeable" }
		elseif card.ability.set == "Voucher" then
			return { key = "cry_pinned_voucher" }
		elseif card.ability.set == "Booster" then
			return { key = "cry_pinned_booster" }
		else
			return { key = "pinned_left" }
		end
	end,
})
SMODS.Sticker:take_ownership("eternal", {
	loc_vars = function(self, info_queue, card)
		if card.ability.set == "Voucher" then
			return { key = "cry_eternal_voucher" }
		elseif card.ability.set == "Booster" then
			return { key = "cry_eternal_booster" }
		end
	end,
})
SMODS.Sticker:take_ownership("rental", {
	loc_vars = function(self, info_queue, card)
		if card.ability.consumeable then
			return { key = "cry_rental_consumeable", vars = { G.GAME.cry_consumeable_rental_rate or 1 } }
		elseif card.ability.set == "Voucher" then
			return { key = "cry_rental_voucher", vars = { G.GAME.cry_voucher_rental_rate or 1 } }
		elseif card.ability.set == "Booster" then
			return { key = "cry_rental_booster" }
		else
			return { vars = { G.GAME.rental_rate or 1 } }
		end
	end,
	calculate = function(self, card, context)
		if context.end_of_round and context.main_eval then
			if card.ability.consumeable then
				card:cry_calculate_consumeable_rental()
			elseif card.ability.set == "Voucher" then
				card:cry_calculate_voucher_rental()
			else
				card:calculate_rental()
			end
		end
		if context.playing_card_end_of_round then
			card:calculate_rental()
		end
	end,
})
SMODS.Sticker({
	badge_colour = HEX("e8c500"),
	prefix_config = { key = false },
	key = "banana",
	atlas = "sticker",
	pos = { x = 5, y = 2 },
	should_apply = false,
	loc_vars = function(self, info_queue, card)
		if card.ability.consumeable then
			return { key = "cry_banana_consumeable", vars = { G.GAME.probabilities.normal or 1, 4 } }
		elseif card.ability.set == "Voucher" then
			return { key = "cry_banana_voucher", vars = { G.GAME.probabilities.normal or 1, 12 } }
		elseif card.ability.set == "Booster" then
			return { key = "cry_banana_booster" }
		else
			return { vars = { G.GAME.probabilities.normal or 1, 10 } }
		end
	end,
	calculate = function(self, card, context)
		if
			context.end_of_round
			and not context.repetition
			and not context.playing_card_end_of_round
			and not context.individual
		then
			if card.ability.set == "Voucher" then
				if pseudorandom("byebyevoucher") < G.GAME.probabilities.normal / G.GAME.cry_voucher_banana_odds then
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

					local _card = copy_card(card)
					_card.ability.extra = copy_table(card.ability.extra)
					if _card.facing == "back" then
						_card:flip()
					end

					_card:start_materialize()
					area:emplace(_card)
					_card.cost = 0
					_card.shop_voucher = false
					_card:unredeem()
					G.E_MANAGER:add_event(Event({
						trigger = "after",
						delay = 0,
						func = function()
							_card:start_dissolve()
							card:start_dissolve()
							return true
						end,
					}))
				end
			end
		end
	end,
})

-- shiny tag hooks

local tagability = Tag.set_ability
function Tag:set_ability()
	tagability(self)
	if self.ability.blind_type then
		G.GAME.cry_shiny_choices = G.GAME.cry_shiny_choices or {}
		G.GAME.cry_shiny_choices[G.GAME.round_resets.ante] = G.GAME.cry_shiny_choices[G.GAME.round_resets.ante] or {}

		if not G.GAME.cry_shiny_choices[G.GAME.round_resets.ante][self.ability.blind_type] then
			G.GAME.cry_shiny_choices[G.GAME.round_resets.ante][self.ability.blind_type] = Cryptid.roll_shiny()
		end
		self.ability.shiny = G.GAME.cry_shiny_choices[G.GAME.round_resets.ante][self.ability.blind_type] == "shiny"
			and true
	end
end

local ycollecref = G.FUNCS.your_collection
G.FUNCS.your_collection = function(e)
	ycollecref(e)
	G.cry_current_tagpage = nil
end
local omuicryref = G.FUNCS.openModUI_Cryptid
G.FUNCS.openModUI_Cryptid = function(e)
	omuicryref(e)
	G.cry_current_tagpage = nil
end

function Cryptid.shinytag_tally()
	local ret = 0
	for k, v in pairs(Cryptid.shinytagdata) do
		if Cryptid.shinytagdata[k] then
			ret = ret + 1
		end
	end
	return ret
end

-- temp crappy overwrite for voucher ui until smods does stuff

function G.UIDEF.used_vouchers()
	local silent = false
	local keys_used = {}
	local area_count = 0
	local voucher_areas = {}
	local voucher_tables = {}
	local voucher_table_rows = {}
	table.sort(G.vouchers.cards, function(a, b)
		return a.config.center.order < b.config.center.order
	end)
	for k, v in ipairs(G.vouchers.cards) do
		local key = k
		keys_used[key] = keys_used[key] or {}
		keys_used[key][#keys_used[key] + 1] = v
	end
	for k, v in ipairs(keys_used) do
		if next(v) then
			area_count = area_count + 1
		end
	end
	for k, v in ipairs(keys_used) do
		if next(v) then
			if #voucher_areas == 18 or #voucher_areas == 36 or #voucher_areas == 54 then
				table.insert(
					voucher_table_rows,
					{ n = G.UIT.R, config = { align = "cm", padding = 0, no_fill = true }, nodes = voucher_tables }
				)
				voucher_tables = {}
			end
			voucher_areas[#voucher_areas + 1] = CardArea(
				G.ROOM.T.x + 0.2 * G.ROOM.T.w / 2,
				G.ROOM.T.h,
				(#v == 1 and 0.5 or 1.33) * G.CARD_W,
				(area_count >= 10 and 0.75 or 1.07) * G.CARD_H,
				{ card_limit = 2, type = "voucher", highlight_limit = 0 }
			)
			for kk, vv in ipairs(v) do
				local card = copy_card(vv)
				card.ability.extra = copy_table(vv.ability.extra)
				if card.facing == "back" then
					card:flip()
				end
				card:start_materialize(nil, silent)
				silent = true
				voucher_areas[#voucher_areas]:emplace(card)
			end
			table.insert(voucher_tables, {
				n = G.UIT.C,
				config = { align = "cm", padding = 0, no_fill = true },
				nodes = {
					{ n = G.UIT.O, config = { object = voucher_areas[#voucher_areas] } },
				},
			})
		end
	end
	table.insert(
		voucher_table_rows,
		{ n = G.UIT.R, config = { align = "cm", padding = 0, no_fill = true }, nodes = voucher_tables }
	)

	local t = silent
			and {
				n = G.UIT.ROOT,
				config = { align = "cm", colour = G.C.CLEAR },
				nodes = {

					-- tarot/planet acclimator sliders
					next(SMODS.find_card("v_cry_tacclimator"))
							and {
								n = G.UIT.R,
								config = { align = "cm" },
								nodes = {
									create_slider({
										label = localize("b_tarot_rate"),
										label_scale = 0.4,
										text_scale = 0.3,
										w = 4,
										h = 0.4,
										ref_table = G.GAME.cry_percrate,
										ref_value = "tarot",
										colour = G.C.SECONDARY_SET.Tarot,
										min = 0,
										max = 100,
									}),
								},
							}
						or nil,
					next(SMODS.find_card("v_cry_pacclimator")) and {
						n = G.UIT.R,
						config = { align = "cm" },
						nodes = {
							create_slider({
								label = localize("b_planet_rate"),
								label_scale = 0.4,
								text_scale = 0.3,
								w = 4,
								h = 0.4,
								ref_table = G.GAME.cry_percrate,
								ref_value = "planet",
								colour = G.C.SECONDARY_SET.Planet,
								min = 0,
								max = 100,
							}),
						},
					} or nil,

					{
						n = G.UIT.R,
						config = { align = "cm" },
						nodes = {
							{
								n = G.UIT.O,
								config = {
									object = DynaText({
										string = { localize("ph_vouchers_redeemed") },
										colours = { G.C.UI.TEXT_LIGHT },
										bump = true,
										scale = 0.6,
									}),
								},
							},
						},
					},
					{ n = G.UIT.R, config = { align = "cm", minh = 0.5 }, nodes = {} },
					{
						n = G.UIT.R,
						config = { align = "cm", colour = G.C.BLACK, r = 1, padding = 0.15, emboss = 0.05 },
						nodes = {
							{ n = G.UIT.R, config = { align = "cm" }, nodes = voucher_table_rows },
						},
					},
				},
			}
		or {
			n = G.UIT.ROOT,
			config = { align = "cm", colour = G.C.CLEAR },
			nodes = {
				{
					n = G.UIT.O,
					config = {
						object = DynaText({
							string = { localize("ph_no_vouchers") },
							colours = { G.C.UI.TEXT_LIGHT },
							bump = true,
							scale = 0.6,
						}),
					},
				},
			},
		}
	return t
end
