-- Code to handle stickers, debuffs, etc.
-- Warning: this is a bit of a mess

--anyway this function basically hardcodes unredeeming a voucher
function cry_debuff_voucher(center) -- sorry for all the mess here...
	local new_center = G.GAME.cry_voucher_centers[center]
	local center_table = {
		name = new_center and new_center.name,
		extra = new_center and new_center.config.extra,
	}
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
				G.GAME.discount_percent = 25
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
				G.GAME.round_resets.reroll_cost = G.GAME.round_resets.reroll_cost + center_table.extra
				G.GAME.current_round.reroll_cost = math.max(0, G.GAME.current_round.reroll_cost + center_table.extra)
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
				G.GAME.interest_cap = G.P_CENTERS.v_seed_money.extra
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

function cry_voucher_debuffed(name) -- simple function but idk
	if G.GAME.voucher_sticker_index and G.GAME.voucher_sticker_index.perishable[name] then
		if G.GAME.voucher_sticker_index.perishable[name] == 0 then
			return true
		end
	end
	return false
end

function cry_voucher_pinned(name)
	if G.GAME.voucher_sticker_index then
		if G.GAME.voucher_sticker_index.pinned[name] then
			return true
		end
	end
	return false
end

function cry_get_next_voucher_edition() -- currently only for editions + sticker decks, can be modified if voucher stickering/editioning becomes more important
	if G.GAME.modifiers.cry_force_edition then
		return cry_edition_to_table(G.GAME.modifiers.cry_force_edition)
	elseif G.GAME.modifiers.cry_force_random_edition then
		return cry_poll_random_edition()
	end
end
-- code to generate Stickers for Vouchers, based on that for Jokers
function cry_get_next_voucher_stickers()
	local eternal_perishable_poll = pseudorandom("cry_vet" .. (key_append or "") .. G.GAME.round_resets.ante)
	local ret = { eternal = false, perishable = false, rental = false, pinned = false, banana = false }
	if
		(G.GAME.modifiers.cry_force_sticker == "eternal")
		or G.GAME.modifiers.cry_sticker_sheet_plus
		or (
			G.GAME.modifiers.cry_any_stickers
			and (G.GAME.modifiers.enable_eternals_in_shop and eternal_perishable_poll > 0.8)
		)
	then
		ret.eternal = true
	end
	if G.GAME.modifiers.enable_perishables_in_shop and G.GAME.modifiers.cry_any_stickers then -- bloated as shit
		if
			not G.GAME.modifiers.cry_eternal_perishable_compat
			and ((eternal_perishable_poll > 0.4) and (eternal_perishable_poll <= 0.7))
		then
			ret.perishable = true
		end
		if
			G.GAME.modifiers.cry_eternal_perishable_compat
			and pseudorandom("cry_vper" .. (key_append or "") .. G.GAME.round_resets.ante) > 0.7
		then
			ret.perishable = true
		end
	end
	if (G.GAME.modifiers.cry_force_sticker == "perishable") or G.GAME.modifiers.cry_sticker_sheet_plus then
		ret.perishable = true
	end
	if
		G.GAME.modifiers.cry_force_sticker == "rental"
		or G.GAME.modifiers.cry_sticker_sheet_plus
		or (
			G.GAME.modifiers.cry_any_stickers
			and (
				G.GAME.modifiers.enable_rentals_in_shop
				and pseudorandom("cry_vssjr" .. (key_append or "") .. G.GAME.round_resets.ante) > 0.7
			)
		)
	then
		ret.rental = true
	end
	if
		G.GAME.modifiers.cry_force_sticker == "pinned"
		or G.GAME.modifiers.cry_sticker_sheet_plus
		or (
			G.GAME.modifiers.cry_any_stickers
			and (
				G.GAME.modifiers.cry_enable_pinned_in_shop
				and pseudorandom("cry_vpin" .. (key_append or "") .. G.GAME.round_resets.ante) > 0.7
			)
		)
	then
		ret.pinned = true
	end
	if G.GAME.modifiers.cry_force_sticker == "banana" or G.GAME.modifiers.cry_sticker_sheet_plus then
		ret.banana = true
	end
	if
		not G.GAME.modifiers.cry_eternal_perishable_compat
		and G.GAME.modifiers.enable_banana
		and G.GAME.modifiers.cry_any_stickers
		and (pseudorandom("cry_bpbanana" .. (key_append or "") .. G.GAME.round_resets.ante) > 0.7)
		and (eternal_perishable_poll <= 0.7)
	then
		ret.banana = true
	end
	if
		G.GAME.modifiers.cry_eternal_perishable_compat
		and G.GAME.modifiers.enable_banana
		and G.GAME.modifiers.cry_any_stickers
		and (pseudorandom("cry_bpbanana" .. (key_append or "") .. G.GAME.round_resets.ante) > 0.7)
	then
		ret.banana = true
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
	self.pinned = _pinned
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
})
SMODS.Sticker:take_ownership("pinned", {
	atlas = "sticker",
	pos = { x = 5, y = 0 },
	prefix_config = { key = false },
	loc_vars = function(self, info_queue, card)
		if card.ability.consumeable then
			return { key = "cry_pinned_consumeable" } -- this doesn't work. i want this to work :(
		elseif card.ability.set == "Voucher" then
			return { key = "cry_pinned_voucher" }
		elseif card.ability.set == "Booster" then
			return { key = "cry_pinned_booster" }
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
})

--Sticker calc for playing cards
--[[local ec = eval_card
function eval_card(card, context)
	local ret = ec(card, context)
	if card.area == G.hand or card.area == G.play or card.area == G.discard or card.area == G.deck then
		for k, v in pairs(SMODS.Stickers) do
			if card.ability[k] and v.calculate and type(v.calculate) == "function" then
				context.from_playing_card = true
				context.ret = ret
				v:calculate(card, context)
			end
		end
	end
	return ret
end--]]
