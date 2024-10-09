local pink = {
	object_type = "Stake",
	name = "cry-Pink Stake",
	key = "pink",
	pos = { x = 0, y = 0 },
	atlas = "stake",
	applied_stakes = { "gold" },
	modifiers = function()
		G.GAME.modifiers.scaling = (G.GAME.modifiers.scaling or 1) + 1
	end,
	order = 9,
	colour = HEX("ff5ee6"),
}
local brown = {
	object_type = "Stake",
	name = "cry-Brown Stake",
	key = "brown",
	pos = { x = 1, y = 0 },
	atlas = "stake",
	applied_stakes = { "cry_pink" },
	modifiers = function()
		G.GAME.modifiers.cry_eternal_perishable_compat = true
	end,
	order = 10,
	colour = HEX("883200"),
}
local yellow = {
	object_type = "Stake",
	name = "cry-Yellow Stake",
	key = "yellow",
	pos = { x = 2, y = 0 },
	atlas = "stake",
	applied_stakes = { "cry_brown" },
	modifiers = function()
		G.GAME.modifiers.cry_any_stickers = true
	end,
	order = 11,
	colour = HEX("f7ff1f"),
}
local jade = {
	object_type = "Stake",
	name = "cry-Jade Stake",
	key = "jade",
	pos = { x = 3, y = 0 },
	atlas = "stake",
	applied_stakes = { "cry_yellow" },
	modifiers = function()
		G.GAME.modifiers.flipped_cards = 20
	end,
	shiny = true,
	order = 12,
	colour = HEX("78953c"),
}
local cyan = {
	object_type = "Stake",
	name = "cry-Cyan Stake",
	key = "cyan",
	pos = { x = 4, y = 0 },
	atlas = "stake",
	applied_stakes = { "cry_jade" },
	modifiers = function()
		G.GAME.modifiers.cry_rarer_jokers = true
		-- Note that this is not the exact rarity as the old lovely patch might be nerf/buff to the stake
		G.GAME.uncommon_mod = 0.5
		G.GAME.rare_mod = 0.5
	end,
	order = 13,
	colour = HEX("39ffcc"),
}
local gray = {
	object_type = "Stake",
	name = "cry-Gray Stake",
	key = "gray",
	pos = { x = 0, y = 1 },
	atlas = "stake",
	applied_stakes = { "cry_cyan" },
	modifiers = function()
		G.GAME.modifiers.cry_reroll_scaling = 2
	end,
	order = 14,
	colour = HEX("999999"),
}
local crimson = {
	object_type = "Stake",
	name = "cry-Crimson Stake",
	key = "crimson",
	pos = { x = 1, y = 1 },
	atlas = "stake",
	applied_stakes = { "cry_gray" },
	modifiers = function()
		G.GAME.modifiers.cry_voucher_restock_antes = 2
	end,
	order = 15,
	colour = HEX("800000"),
}
local diamond = {
	object_type = "Stake",
	name = "cry-Diamond Stake",
	key = "diamond",
	pos = { x = 2, y = 1 },
	atlas = "stake",
	applied_stakes = { "cry_crimson" },
	modifiers = function()
		G.GAME.win_ante = 10
	end,
	shiny = true,
	order = 16,
	colour = HEX("88e5d9"),
}
local amber = {
	object_type = "Stake",
	name = "cry-Amber Stake",
	key = "amber",
	pos = { x = 3, y = 1 },
	atlas = "stake",
	applied_stakes = { "cry_diamond" },
	modifiers = function()
		G.GAME.modifiers.cry_booster_packs = 1
	end,
	shiny = true,
	order = 17,
	colour = HEX("feb900"),
}
local bronze = {
	object_type = "Stake",
	name = "cry-Bronze Stake",
	key = "bronze",
	pos = { x = 4, y = 1 },
	atlas = "stake",
	applied_stakes = { "cry_amber" },
	modifiers = function()
		G.GAME.modifiers.cry_voucher_price_hike = 1.5
	end,
	shiny = true,
	order = 18,
	colour = HEX("d27c37"),
}
local quartz = {
	object_type = "Stake",
	name = "cry-Quartz Stake",
	key = "quartz",
	pos = { x = 0, y = 2 },
	atlas = "stake",
	applied_stakes = { "cry_bronze" },
	modifiers = function()
		G.GAME.modifiers.cry_enable_pinned_in_shop = true
	end,
	shiny = true,
	order = 19,
	colour = HEX("e8e8e8"),
}
local ruby = {
	object_type = "Stake",
	name = "cry-Ruby Stake",
	key = "ruby",
	pos = { x = 1, y = 2 },
	atlas = "stake",
	applied_stakes = { "cry_quartz" },
	modifiers = function()
		G.GAME.modifiers.cry_big_boss_rate = 0.3
	end,
	shiny = true,
	order = 20,
	colour = HEX("fc5f55"),
}
local glass = {
	object_type = "Stake",
	name = "cry-Glass Stake",
	key = "glass",
	pos = { x = 2, y = 2 },
	atlas = "stake",
	applied_stakes = { "cry_ruby" },
	modifiers = function()
		G.GAME.modifiers.cry_shatter_rate = 30
	end,
	shiny = true,
	order = 21,
	colour = HEX("ffffff8f"),
}
local sapphire = {
	object_type = "Stake",
	name = "cry-Sapphire Stake",
	key = "sapphire",
	pos = { x = 3, y = 2 },
	atlas = "stake",
	applied_stakes = { "cry_glass" },
	modifiers = function()
		G.GAME.modifiers.cry_ante_tax = 0.25
		G.GAME.modifiers.cry_ante_tax_max = 10
	end,
	shiny = true,
	order = 22,
	colour = HEX("3551fc"),
}
local emerald = {
	object_type = "Stake",
	name = "cry-Emerald Stake",
	key = "emerald",
	pos = { x = 4, y = 2 },
	atlas = "stake",
	applied_stakes = { "cry_sapphire" },
	modifiers = function()
		G.GAME.modifiers.cry_enable_flipped_in_shop = true
	end,
	shiny = true,
	order = 23,
	colour = HEX("06fc2c"),
}
local platinum = {
	object_type = "Stake",
	name = "cry-Platinum Stake",
	key = "platinum",
	pos = { x = 0, y = 3 },
	atlas = "stake",
	applied_stakes = { "cry_emerald" },
	modifiers = function()
		G.GAME.modifiers.cry_no_small_blind = true
		G.GAME.round_resets.blind_states["Small"] = "Hide"
	end,
	shiny = true,
	order = 24,
	colour = HEX("b0f6ff"),
}
--init colors so they have references
G.C.CRY_TWILIGHT = { 0, 0, 0, 0 }
G.C.CRY_VERDANT = { 0, 0, 0, 0 }
G.C.CRY_EMBER = { 0, 0, 0, 0 }
G.C.CRY_DAWN = { 0, 0, 0, 0 }
G.C.CRY_HORIZON = { 0, 0, 0, 0 }
G.C.CRY_BLOSSOM = { 0, 0, 0, 0 }
G.C.CRY_AZURE = { 0, 0, 0, 0 }
G.C.CRY_ASCENDANT = { 0, 0, 0, 0 }
local twilight = {
	object_type = "Stake",
	name = "cry-Twilight Stake",
	key = "twilight",
	pos = { x = 1, y = 3 },
	atlas = "stake",
	applied_stakes = { "cry_platinum" },
	modifiers = function()
		G.GAME.modifiers.enable_banana = true
	end,
	shiny = true,
	order = 25,
	colour = G.C.CRY_TWILIGHT,
}
local banana = {
	object_type = "Sticker",
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
}
local verdant = {
	object_type = "Stake",
	name = "cry-Verdant Stake",
	key = "verdant",
	pos = { x = 2, y = 3 },
	atlas = "stake",
	applied_stakes = { "cry_twilight" },
	modifiers = function()
		G.GAME.modifiers.scaling = (G.GAME.modifiers.scaling or 1) + 1
	end,
	shiny = true,
	order = 26,
	colour = G.C.CRY_VERDANT,
}
local ember = {
	object_type = "Stake",
	name = "cry-Ember Stake",
	key = "ember",
	pos = { x = 3, y = 3 },
	atlas = "stake",
	applied_stakes = { "cry_verdant" },
	modifiers = function()
		G.GAME.modifiers.cry_no_sell_value = true
	end,
	shiny = true,
	order = 27,
	colour = G.C.CRY_EMBER,
}
local dawn = {
	object_type = "Stake",
	name = "cry-Dawn Stake",
	key = "dawn",
	pos = { x = 4, y = 3 },
	atlas = "stake",
	applied_stakes = { "cry_ember" },
	modifiers = function()
		G.GAME.modifiers.cry_consumable_reduce = true
	end,
	shiny = true,
	order = 28,
	colour = G.C.CRY_DAWN,
}
local horizon = {
	object_type = "Stake",
	name = "cry-Horizon Stake",
	key = "horizon",
	pos = { x = 0, y = 4 },
	atlas = "stake",
	applied_stakes = { "cry_dawn" },
	modifiers = function()
		G.GAME.modifiers.cry_card_each_round = true
	end,
	shiny = true,
	order = 29,
	colour = G.C.CRY_HORIZON,
}
local blossom = {
	object_type = "Stake",
	name = "cry-Blossom Stake",
	key = "blossom",
	pos = { x = 1, y = 4 },
	atlas = "stake",
	applied_stakes = { "cry_horizon" },
	modifiers = function()
		G.GAME.modifiers.cry_big_showdown = true
	end,
	shiny = true,
	order = 30,
	colour = G.C.CRY_BLOSSOM,
}
local azure = {
	object_type = "Stake",
	name = "cry-Azure Stake",
	key = "azure",
	pos = { x = 2, y = 4 },
	atlas = "stake",
	applied_stakes = { "cry_blossom" },
	modifiers = function()
		G.GAME.modifiers.cry_jkr_misprint_mod = 0.8
	end,
	shiny = true,
	order = 31,
	colour = G.C.CRY_AZURE,
}
local ascendant = {
	object_type = "Stake",
	name = "cry-Ascendant Stake",
	key = "ascendant",
	pos = { x = 3, y = 4 },
	atlas = "stake",
	applied_stakes = { "cry_azure" },
	modifiers = function()
		change_shop_size(-1)
	end,
	shiny = true,
	order = 32,
	colour = G.C.CRY_ASCENDANT,
}
local stake_atlas = { object_type = "Atlas", key = "stake", 
path = "stake_cry.png", px = 29, py = 29 }
return {
	name = "More Stakes",
	init = function(self)
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
					temp_hand[#temp_hand + 1] = v
					hasHand = true
				end
			end
			if hasHand then
				destroyed_cards[#destroyed_cards + 1] = pseudorandom_element(temp_hand, pseudoseed("random_destroy"))
			end
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.4,
				func = function()
					play_sound("tarot1")
					if used_tarot and used_tarot.juice_up then
						used_tarot:juice_up(0.3, 0.5)
					end
					return true
				end,
			}))
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.1,
				func = function()
					for i = #destroyed_cards, 1, -1 do
						local card = destroyed_cards[i]
						if card.ability.name == "Glass Card" then
							card:shatter()
						else
							card:start_dissolve(nil, i ~= #destroyed_cards)
						end
					end
					return true
				end,
			}))
			return destroyed_cards
		end
		SMODS.Consumable:take_ownership("grim", {
			use = function(self, card, area, copier)
				local used_tarot = copier or card
				local destroyed_cards = random_destroy(used_tarot)
				G.E_MANAGER:add_event(Event({
					trigger = "after",
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
								SMODS.Suits[pseudorandom_element(suit_list, pseudoseed("grim_create"))].card_key, "A"
							local cen_pool = {}
							for k, v in pairs(G.P_CENTER_POOLS["Enhanced"]) do
								if v.key ~= "m_stone" then
									cen_pool[#cen_pool + 1] = v
								end
							end
							create_playing_card({
								front = G.P_CARDS[_suit .. "_" .. _rank],
								center = pseudorandom_element(cen_pool, pseudoseed("spe_card")),
							}, G.hand, nil, i ~= 1, { G.C.SECONDARY_SET.Spectral })
						end
						playing_card_joker_effects(cards)
						return true
					end,
				}))
				delay(0.3)
				for i = 1, #G.jokers.cards do
					G.jokers.cards[i]:calculate_joker({ remove_playing_cards = true, removed = destroyed_cards })
				end
			end,
		}, true)
		SMODS.Consumable:take_ownership("familiar", {
			use = function(self, card, area, copier)
				local used_tarot = copier or card
				local destroyed_cards = random_destroy(used_tarot)
				G.E_MANAGER:add_event(Event({
					trigger = "after",
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
								if r.face then
									table.insert(faces, r.card_key)
								end
							end
							local _suit, _rank =
								SMODS.Suits[pseudorandom_element(suit_list, pseudoseed("familiar_create"))].card_key,
								pseudorandom_element(faces, pseudoseed("familiar_create"))
							local cen_pool = {}
							for k, v in pairs(G.P_CENTER_POOLS["Enhanced"]) do
								if v.key ~= "m_stone" then
									cen_pool[#cen_pool + 1] = v
								end
							end
							create_playing_card({
								front = G.P_CARDS[_suit .. "_" .. _rank],
								center = pseudorandom_element(cen_pool, pseudoseed("spe_card")),
							}, G.hand, nil, i ~= 1, { G.C.SECONDARY_SET.Spectral })
						end
						playing_card_joker_effects(cards)
						return true
					end,
				}))
				delay(0.3)
				for i = 1, #G.jokers.cards do
					G.jokers.cards[i]:calculate_joker({ remove_playing_cards = true, removed = destroyed_cards })
				end
			end,
		}, true)
		SMODS.Consumable:take_ownership("incantation", {
			use = function(self, card, area, copier)
				local used_tarot = copier or card
				local destroyed_cards = random_destroy(used_tarot)
				G.E_MANAGER:add_event(Event({
					trigger = "after",
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
								if v ~= "Ace" and not r.face then
									table.insert(numbers, r.card_key)
								end
							end
							local _suit, _rank =
								SMODS.Suits[pseudorandom_element(suit_list, pseudoseed("incantation_create"))].card_key,
								pseudorandom_element(numbers, pseudoseed("incantation_create"))
							local cen_pool = {}
							for k, v in pairs(G.P_CENTER_POOLS["Enhanced"]) do
								if v.key ~= "m_stone" then
									cen_pool[#cen_pool + 1] = v
								end
							end
							create_playing_card({
								front = G.P_CARDS[_suit .. "_" .. _rank],
								center = pseudorandom_element(cen_pool, pseudoseed("spe_card")),
							}, G.hand, nil, i ~= 1, { G.C.SECONDARY_SET.Spectral })
						end
						playing_card_joker_effects(cards)
						return true
					end,
				}))
				delay(0.3)
				for i = 1, #G.jokers.cards do
					G.jokers.cards[i]:calculate_joker({ remove_playing_cards = true, removed = destroyed_cards })
				end
			end,
		}, true)

		local sc = Card.set_cost
		function Card:set_cost()
			sc(self)
			if self.ability.set == "Voucher" and G.GAME.modifiers.cry_voucher_price_hike then
				self.cost = math.floor(self.cost * G.GAME.modifiers.cry_voucher_price_hike)
				--Update related costs
				self.sell_cost = math.max(1, math.floor(self.cost / 2)) + (self.ability.extra_value or 0)
				if
					self.area
					and self.ability.couponed
					and (self.area == G.shop_jokers or self.area == G.shop_booster)
				then
					self.cost = 0
				end
				self.sell_cost_label = self.facing == "back" and "?" or self.sell_cost
			end
		end
		for _, v in pairs(self.items) do
			if v.object_type == "Stake" then
				v.sticker_pos = v.pos
				v.sticker_atlas = "sticker"
			end
		end
	end,
	items = {
		stake_atlas,
		pink,
		brown,
		yellow,
		jade,
		cyan,
		gray,
		crimson,
		diamond,
		amber,
		bronze,
		quartz,
		ruby,
		glass,
		sapphire,
		emerald,
		platinum,
		twilight,
		verdant,
		ember,
		dawn,
		horizon,
		blossom,
		azure,
		ascendant,
		banana,
	},
}
