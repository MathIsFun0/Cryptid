--note to self: refer to https://docs.google.com/document/d/1LNaIouU3vrtWIuPBdFCqLyjYAjVtq7t64xjHnckEY50/edit for order of remaining consumables
local code = {
	object_type = "ConsumableType",
	key = "Code",
	primary_colour = HEX("14b341"),
	secondary_colour = HEX("12f254"),
	collection_rows = { 4, 4 }, -- 4 pages for all code cards
	shop_rate = 0.0,
	loc_txt = {},
	default = "c_cry_crash",
	can_stack = true,
	can_divide = true,
}
local code_atlas = {
	object_type = "Atlas",
	key = "code",
	path = "c_cry_code.png",
	px = 71,
	py = 95,
}
SMODS.UndiscoveredSprite({
	key = "Code",
	atlas = "code",
	path = "c_cry_code.png",
	pos = { x = 2, y = 5 },
	px = 71,
	py = 95,
}):register()
SMODS.UndiscoveredSprite({ --todo change?
	key = "Unique",
	atlas = "code",
	path = "c_cry_code.png",
	pos = { x = 2, y = 5 },
	px = 71,
	py = 95,
}):register()
local pack_atlas = {
	object_type = "Atlas",
	key = "pack",
	path = "pack_cry.png",
	px = 71,
	py = 95,
}
local pack1 = {
	object_type = "Booster",
	key = "code_normal_1",
	kind = "Code",
	atlas = "pack",
	pos = { x = 0, y = 0 },
	config = { extra = 2, choose = 1 },
	cost = 4,
	order = 1,
	weight = 0.96,
	create_card = function(self, card)
		return create_card("Code", G.pack_cards, nil, nil, true, true, nil, "cry_program")
	end,
	ease_background_colour = function(self)
		ease_colour(G.C.DYN_UI.MAIN, G.C.SET.Code)
		ease_background_colour({ new_colour = G.C.SET.Code, special_colour = G.C.BLACK, contrast = 2 })
	end,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.config.center.config.choose, card.ability.extra } }
	end,
	group_key = "k_cry_program_pack",
}
local pack2 = {
	object_type = "Booster",
	key = "code_normal_2",
	kind = "Code",
	atlas = "pack",
	pos = { x = 1, y = 0 },
	config = { extra = 2, choose = 1 },
	cost = 4,
	order = 2,
	weight = 0.96,
	create_card = function(self, card)
		return create_card("Code", G.pack_cards, nil, nil, true, true, nil, "cry_program")
	end,
	ease_background_colour = function(self)
		ease_colour(G.C.DYN_UI.MAIN, G.C.SET.Code)
		ease_background_colour({ new_colour = G.C.SET.Code, special_colour = G.C.BLACK, contrast = 2 })
	end,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.config.center.config.choose, card.ability.extra } }
	end,
	group_key = "k_cry_program_pack",
}
local packJ = {
	object_type = "Booster",
	key = "code_jumbo_1",
	kind = "Code",
	atlas = "pack",
	pos = { x = 2, y = 0 },
	config = { extra = 4, choose = 1 },
	cost = 6,
	order = 3,
	weight = 0.48,
	create_card = function(self, card)
		return create_card("Code", G.pack_cards, nil, nil, true, true, nil, "cry_program")
	end,
	ease_background_colour = function(self)
		ease_colour(G.C.DYN_UI.MAIN, G.C.SET.Code)
		ease_background_colour({ new_colour = G.C.SET.Code, special_colour = G.C.BLACK, contrast = 2 })
	end,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.config.center.config.choose, card.ability.extra } }
	end,
	group_key = "k_cry_program_pack",
}
local packM = {
	object_type = "Booster",
	key = "code_mega_1",
	kind = "Code",
	atlas = "pack",
	pos = { x = 3, y = 0 },
	config = { extra = 4, choose = 2 },
	cost = 8,
	order = 4,
	weight = 0.12,
	create_card = function(self, card)
		return create_card("Code", G.pack_cards, nil, nil, true, true, nil, "cry_program")
	end,
	ease_background_colour = function(self)
		ease_colour(G.C.DYN_UI.MAIN, G.C.SET.Code)
		ease_background_colour({ new_colour = G.C.SET.Code, special_colour = G.C.BLACK, contrast = 2 })
	end,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.config.center.config.choose, card.ability.extra } }
	end,
	group_key = "k_cry_program_pack",
}
local console = {
	object_type = "Tag",
	atlas = "tag_cry",
	name = "cry-Console Tag",
	order = 26,
	pos = { x = 3, y = 2 },
	config = { type = "new_blind_choice" },
	key = "console",
	min_ante = 2,
	loc_vars = function(self, info_queue)
		info_queue[#info_queue + 1] = { set = "Other", key = "p_cry_code_normal_1", specific_vars = { 1, 2 } }
		return { vars = {} }
	end,
	apply = function(tag, context)
		if context.type == "new_blind_choice" then
			tag:yep("+", G.C.SECONDARY_SET.Code, function()
				local key = "p_cry_code_normal_" .. math.random(1, 2)
				local card = Card(
					G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2,
					G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2,
					G.CARD_W * 1.27,
					G.CARD_H * 1.27,
					G.P_CARDS.empty,
					G.P_CENTERS[key],
					{ bypass_discovery_center = true, bypass_discovery_ui = true }
				)
				card.cost = 0
				card.from_tag = true
				G.FUNCS.use_card({ config = { ref_table = card } })
				card:start_materialize()
				return true
			end)
			tag.triggered = true
			return true
		end
	end,
}
local crash = {
	object_type = "Consumable",
	set = "Code",
	name = "cry-Crash",
	key = "crash",
	pos = { x = 0, y = 0 },
	config = {},
	cost = 4,
	atlas = "code",
	order = 1,
	can_use = function(self, card)
		return true
	end,
	use = function(self, card, area, copier)
		if not G.PROFILES[G.SETTINGS.profile].consumeable_usage["c_cry_crash"] then
			set_consumeable_usage(card)
		end
		-- I'm being VERY safe here, game gets really weird and sometimes does and doesn't save ://CRASH use
		G:save_settings()
		G:save_progress()
		local f = pseudorandom_element(crashes, pseudoseed("cry_crash"))
		f(self, card, area, copier)
	end,
}

local payload = {
	object_type = "Consumable",
	set = "Code",
	name = "cry-Payload",
	key = "payload",
	pos = { x = 1, y = 0 },
	config = { interest_mult = 3 },
	loc_vars = function(self, info_queue, center)
		return { vars = { self.config.interest_mult } }
	end,
	cost = 4,
	atlas = "code",
	order = 2,
	can_use = function(self, card)
		return true
	end,
	can_bulk_use = true,
	use = function(self, card, area, copier)
		G.GAME.cry_payload = (G.GAME.cry_payload or 1) * card.ability.interest_mult
	end,
	bulk_use = function(self, card, area, copier, number)
		G.GAME.cry_payload = (G.GAME.cry_payload or 1) * card.ability.interest_mult ^ number
	end,
}
local reboot = {
	object_type = "Consumable",
	set = "Code",
	name = "cry-Reboot",
	key = "reboot",
	pos = { x = 2, y = 0 },
	config = {},
	cost = 4,
	atlas = "code",
	order = 3,
	can_use = function(self, card)
		return G.STATE == G.STATES.SELECTING_HAND
	end,
	use = function(self, card, area, copier)
		G.FUNCS.draw_from_hand_to_discard()
		G.FUNCS.draw_from_discard_to_deck()
		ease_discard(
			math.max(0, G.GAME.round_resets.discards + G.GAME.round_bonus.discards) - G.GAME.current_round.discards_left
		)
		ease_hands_played(
			math.max(1, G.GAME.round_resets.hands + G.GAME.round_bonus.next_hands) - G.GAME.current_round.hands_left
		)
		for k, v in pairs(G.playing_cards) do
			v.ability.wheel_flipped = nil
		end
		G.E_MANAGER:add_event(Event({
			trigger = "immediate",
			func = function()
				G.STATE = G.STATES.DRAW_TO_HAND
				G.deck:shuffle("cry_reboot" .. G.GAME.round_resets.ante)
				G.deck:hard_set_T()
				G.STATE_COMPLETE = false
				return true
			end,
		}))
	end,
}

local revert = {
	object_type = "Consumable",
	set = "Code",
	name = "cry-Revert",
	key = "revert",
	pos = { x = 3, y = 0 },
	config = {},
	cost = 4,
	atlas = "code",
	order = 4,
	can_use = function(self, card)
		return G.GAME.cry_revert
	end,
	use = function(self, card, area, copier)
		G.E_MANAGER:add_event(
			Event({
				trigger = "after",
				delay = G.SETTINGS.GAMESPEED,
				func = function()
					G:delete_run()
					G:start_run({
						savetext = STR_UNPACK(G.GAME.cry_revert),
					})
				end,
			}),
			"other"
		)
	end,
}

local semicolon = {
	object_type = "Consumable",
	set = "Code",
	name = "cry-Semicolon",
	key = "semicolon",
	pos = {
		x = 0,
		y = 1,
	},
	config = {},
	cost = 4,
	atlas = "code",
	order = 32,
	can_use = function(self, card)
		return G.STATE == G.STATES.SELECTING_HAND and not G.GAME.blind.boss
	end,
	use = function(self, card, area, copier)
		G.E_MANAGER:add_event(
			Event({
				trigger = "immediate",
				func = function()
					if G.STATE ~= G.STATES.SELECTING_HAND then
						return false
					end
					G.GAME.current_round.semicolon = true
					G.STATE = G.STATES.HAND_PLAYED
					G.STATE_COMPLETE = true
					end_round()
					return true
				end,
			}),
			"other"
		)
	end,
}

local malware = {
	object_type = "Consumable",
	set = "Code",
	name = "cry-Malware",
	key = "malware",
	pos = {
		x = 1,
		y = 1,
	},
	config = {},
	cost = 4,
	atlas = "code",
	order = 9,
	can_use = function(self, card)
		return #G.hand.cards > 0
	end,
	use = function(self, card, area, copier)
		G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 0.4,
			func = function()
				play_sound("tarot1")
				card:juice_up(0.3, 0.5)
				return true
			end,
		}))
		for i = 1, #G.hand.cards do
			local percent = 1.15 - (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.15,
				func = function()
					G.hand.cards[i]:flip()
					play_sound("card1", percent)
					G.hand.cards[i]:juice_up(0.3, 0.3)
					return true
				end,
			}))
		end
		delay(0.2)
		for i = 1, #G.hand.cards do
			local CARD = G.hand.cards[i]
			local percent = 0.85 + (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.15,
				func = function()
					CARD:flip()
					CARD:set_edition({
						cry_glitched = true,
					})
					play_sound("tarot2", percent)
					CARD:juice_up(0.3, 0.3)
					return true
				end,
			}))
		end
	end,
}

local seed = {
	object_type = "Consumable",
	set = "Code",
	name = "cry-Seed",
	key = "seed",
	pos = {
		x = 3,
		y = 1,
	},
	config = {},
	cost = 4,
	atlas = "code",
	order = 12,
	can_use = function(self, card)
		--the card itself and one other card
		return #G.jokers.highlighted
				+ #G.hand.highlighted
				+ #G.consumeables.highlighted
				+ (G.pack_cards and #G.pack_cards.highlighted or 0)
			== 2
	end,
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = { key = "cry_rigged", set = "Other", vars = {} }
	end,
	use = function(self, card, area, copier)
		if area then
			area:remove_from_highlighted(card)
		end
		if G.jokers.highlighted[1] then
			G.jokers.highlighted[1].ability.cry_rigged = true
			if G.jokers.highlighted[1].config.center.key == "j_cry_googol_play" then
				check_for_unlock({ type = "googol_play_rigged" })
			end
		end
		if G.hand.highlighted[1] then
			G.hand.highlighted[1].ability.cry_rigged = true
		end
		if G.consumeables.highlighted[1] then
			G.consumeables.highlighted[1].ability.cry_rigged = true
		end
		if G.pack_cards and G.pack_cards.highlighted[1] then
			G.pack_cards.highlighted[1].ability.cry_rigged = true
		end
	end,
}
local rigged = {
	object_type = "Sticker",
	atlas = "sticker",
	pos = { x = 5, y = 1 },
	key = "cry_rigged",
	no_sticker_sheet = true,
	prefix_config = { key = false },
	badge_colour = HEX("14b341"),
	draw = function(self, card) --don't draw shine
		G.shared_stickers[self.key].role.draw_major = card
		G.shared_stickers[self.key]:draw_shader("dissolve", nil, nil, nil, card.children.center)
	end,
}

local hook = {
	object_type = "Consumable",
	set = "Code",
	name = "cry-Hook",
	key = "hook",
	pos = {
		x = 0,
		y = 4,
	},
	config = {},
	cost = 4,
	atlas = "code",
	order = 14,
	can_use = function(self, card)
		return #G.jokers.highlighted == 2
	end,
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = { key = "cry_hooked", set = "Other", vars = { "hooked Joker" } }
	end,
	use = function(self, card, area, copier)
		G.jokers.highlighted[1].ability.cry_hooked = true
		G.jokers.highlighted[2].ability.cry_hooked = true
		G.jokers.highlighted[1].hook_id = G.jokers.highlighted[2].sort_id
		G.jokers.highlighted[2].hook_id = G.jokers.highlighted[1].sort_id
	end,
}
local hooked = {
	object_type = "Sticker",
	atlas = "sticker",
	pos = { x = 5, y = 3 },
	loc_vars = function(self, info_queue, card)
		local var
		if not card or not card.hook_id then
			var = "["..localize("k_joker").."]"
		else
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i].sort_id == card.hook_id then
					var = localize({ type = "name_text", set = "Joker", key = G.jokers.cards[i].config.center.key })
				end
			end
			var = var or "[no joker found - " .. (card.hook_id or "nil") .. "]"
		end
		return { vars = { var or "hooked Joker" } }
	end,
	key = "cry_hooked",
	no_sticker_sheet = true,
	prefix_config = { key = false },
	badge_colour = HEX("14b341"),
	draw = function(self, card) --don't draw shine
		G.shared_stickers[self.key].role.draw_major = card
		G.shared_stickers[self.key]:draw_shader("dissolve", nil, nil, nil, card.children.center)
	end,
}

local variable = {
	object_type = "Consumable",
	set = "Code",
	key = "variable",
	name = "cry-Variable",
	atlas = "code",
	pos = {
		x = 2,
		y = 1,
	},
	cost = 4,
	order = 8,
	config = { max_highlighted = 2, extra = { enteredrank = "" } },
	loc_vars = function(self, info_queue, card)
		return { vars = { self.config.max_highlighted } }
	end,
	use = function(self, card, area, copier)
		G.GAME.USING_CODE = true
		G.ENTERED_RANK = ""
		G.CHOOSE_RANK = UIBox({
			definition = create_UIBox_variable(card),
			config = {
				align = "cm",
				offset = { x = 0, y = 10 },
				major = G.ROOM_ATTACH,
				bond = "Weak",
				instance_type = "POPUP",
			},
		})
		G.CHOOSE_RANK.alignment.offset.y = 0
		G.ROOM.jiggle = G.ROOM.jiggle + 1
		G.CHOOSE_RANK:align_to_major()
	end,
}
local class = {
	object_type = "Consumable",
	set = "Code",
	key = "class",
	name = "cry-Class",
	atlas = "code",
	pos = {
		x = 4,
		y = 1,
	},
	cost = 4,
	order = 16,
	config = { max_highlighted = 1, extra = { enteredrank = "" } },
	loc_vars = function(self, info_queue, card)
		return { vars = { self.config.max_highlighted } }
	end,
	use = function(self, card, area, copier)
		G.GAME.USING_CODE = true
		G.ENTERED_ENH = ""
		G.CHOOSE_ENH = UIBox({
			definition = create_UIBox_class(card),
			config = {
				align = "cm",
				offset = { x = 0, y = 10 },
				major = G.ROOM_ATTACH,
				bond = "Weak",
				instance_type = "POPUP",
			},
		})
		G.CHOOSE_ENH.alignment.offset.y = 0
		G.ROOM.jiggle = G.ROOM.jiggle + 1
		G.CHOOSE_ENH:align_to_major()
	end,
}
local commit = {
	object_type = "Consumable",
	set = "Code",
	key = "commit",
	name = "cry-Commit",
	atlas = "code",
	pos = {
		x = 1,
		y = 2,
	},
	cost = 4,
	order = 31,
	can_use = function(self, card)
		return #G.jokers.highlighted == 1
			and not G.jokers.highlighted[1].ability.eternal
			and not (
				type(G.jokers.highlighted[1].config.center.rarity) == "number"
				and G.jokers.highlighted[1].config.center.rarity >= 5
			)
	end,
	use = function(self, card, area, copier)
		local deleted_joker_key = G.jokers.highlighted[1].config.center.key
		local rarity = G.jokers.highlighted[1].config.center.rarity
		local legendary = nil
		--please someone add a rarity api to steamodded
		if rarity == 1 then
			rarity = 0
		elseif rarity == 2 then
			rarity = 0.9
		elseif rarity == 3 then
			rarity = 0.99
		elseif rarity == 4 then
			rarity = nil
			legendary = true
		elseif rarity == "cry_epic" then
			rarity = 1
		end
		local _first_dissolve = nil
		G.E_MANAGER:add_event(Event({
			trigger = "before",
			delay = 0.75,
			func = function()
				G.jokers.highlighted[1]:start_dissolve(nil, _first_dissolve)
				_first_dissolve = true
				return true
			end,
		}))
		G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 0.4,
			func = function()
				play_sound("timpani")
				local card = create_card("Joker", G.jokers, legendary, rarity, nil, nil, nil, "cry_commit")
				card:add_to_deck()
				G.jokers:emplace(card)
				card:juice_up(0.3, 0.5)
				if card.config.center.key == deleted_joker_key then
					check_for_unlock({ type = "pr_unlock" })
				end
				return true
			end,
		}))
	end,
}
local merge = {
	object_type = "Consumable",
	set = "Code",
	key = "merge",
	name = "cry-Merge",
	atlas = "code",
	pos = {
		x = 0,
		y = 2,
	},
	cost = 4,
	order = 21,
	can_use = function(self, card)
		if #G.hand.highlighted ~= 1 + (card.area == G.hand and 1 or 0) then
			return false
		end
		if #G.consumeables.highlighted ~= 1 + (card.area == G.consumeables and 1 or 0) then
			return false
		end
		local n = 1
		if G.hand.highlighted[1] == card then
			n = 2
		end
		if G.hand.highlighted[n].ability.consumeable then
			return false
		end
		local m = 1
		if G.consumeables.highlighted[1] == card then
			m = 2
		end
		if G.consumeables.highlighted[m].ability.eternal or G.consumeables.highlighted[m].ability.set == "Unique" or not G.consumeables.highlighted[m].ability.consumeable then
			return false
		end
		return true
	end,
	use = function(self, card, area, copier)
		G.E_MANAGER:add_event(Event({
			trigger = "immediate",
			func = function()
				G.cry_mergearea1 =
					CardArea(G.play.T.x, G.play.T.y, G.play.T.w, G.play.T.h, { type = "play", card_limit = 5 })
				G.cry_mergearea2 =
					CardArea(G.play.T.x, G.play.T.y, G.play.T.w, G.play.T.h, { type = "play", card_limit = 5 })
				area:remove_from_highlighted(card)
				local key = G.consumeables.highlighted[1].config.center.key
				local c = G.consumeables.highlighted[1]
				local CARD = G.hand.highlighted[1]
				card:start_dissolve()
				play_sound("card1")
				G.consumeables:remove_from_highlighted(c)
				CARD.area = G.cry_mergearea1
				c.area = G.cry_mergearea2
				draw_card(G.hand, G.cry_mergearea1, 1, "up", true, CARD)
				draw_card(G.consumeables, G.cry_mergearea2, 1, "up", true, c)
				delay(0.2)
				CARD:flip()
				c:flip()
				delay(0.2)
				local percent = 0.85 + (1 - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0.2,
					func = function()
						play_sound("timpani")
						c:start_dissolve(nil, nil, 0)
						CARD:flip()
						CARD:set_ability(G.P_CENTERS[key], true, nil)
						play_sound("tarot2", percent)
						CARD:juice_up(0.3, 0.3)
						return true
					end,
				}))
				delay(0.5)
				draw_card(G.cry_mergearea1, G.hand, 1, "up", true, CARD)
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0.5,
					func = function()
						G.cry_mergearea2:remove_card(c)
						G.cry_mergearea2:remove()
						G.cry_mergearea1:remove()
						G.cry_mergearea1 = nil
						G.cry_mergearea2 = nil
						return true
					end,
				}))
				return true
			end,
		}))
	end,
}
local multiply = {
	object_type = "Consumable",
	set = "Code",
	key = "multiply",
	name = "cry-Multiply",
	atlas = "code",
	order = 24,
	pos = {
		x = 3,
		y = 2,
	},
	cost = 4,
	can_use = function(self, card)
		return #G.jokers.highlighted == 1 and not Card.no(G.jokers.highlighted[1], "immune_to_chemach", true) and not Card.no(G.jokers.highlighted[1], "immutable", true)
	end,
	use = function(self, card, area, copier)
		if not G.jokers.highlighted[1].cry_multiply then
			G.jokers.highlighted[1].cry_multiply = 1
		end
		G.jokers.highlighted[1].cry_multiply = G.jokers.highlighted[1].cry_multiply * 2
		cry_with_deck_effects(G.jokers.highlighted[1], function(card)
			cry_misprintize(card, { min = 2, max = 2 }, nil, true)
		end)
	end,
}
local divide = {
	object_type = "Consumable",
	set = "Code",
	key = "divide",
	name = "cry-Divide",
	atlas = "code",
	order = 23,
	pos = {
		x = 2,
		y = 2,
	},
	cost = 4,
	can_use = function(self, card)
		return G.STATE == G.STATES.SHOP
	end,
	can_bulk_use = true,
	use = function(self, card, area, copier)
		for i = 1, #G.shop_jokers.cards do
			local c = G.shop_jokers.cards[i]
			c.misprint_cost_fac = (c.misprint_cost_fac or 1) * 0.5
			c:set_cost()
		end
		for i = 1, #G.shop_booster.cards do
			local c = G.shop_booster.cards[i]
			c.misprint_cost_fac = (c.misprint_cost_fac or 1) * 0.5
			c:set_cost()
		end
		for i = 1, #G.shop_vouchers.cards do
			local c = G.shop_vouchers.cards[i]
			c.misprint_cost_fac = (c.misprint_cost_fac or 1) * 0.5
			c:set_cost()
		end
	end,
	bulk_use = function(self, card, area, copier, number)
		for i = 1, #G.shop_jokers.cards do
			local c = G.shop_jokers.cards[i]
			c.misprint_cost_fac = (c.misprint_cost_fac or 1) / (2 ^ number)
			c:set_cost()
		end
		for i = 1, #G.shop_booster.cards do
			local c = G.shop_booster.cards[i]
			c.misprint_cost_fac = (c.misprint_cost_fac or 1) / (2 ^ number)
			c:set_cost()
		end
		for i = 1, #G.shop_vouchers.cards do
			local c = G.shop_vouchers.cards[i]
			c.misprint_cost_fac = (c.misprint_cost_fac or 1) / (2 ^ number)
			c:set_cost()
		end
	end,
}
local delete = {
	object_type = "Consumable",
	set = "Code",
	key = "delete",
	name = "cry-Delete",
	atlas = "code",
	order = 18,
	pos = {
		x = 4,
		y = 2,
	},
	cost = 4,
	can_use = function(self, card)
		return G.STATE == G.STATES.SHOP
			and card.area == G.consumeables
			and #G.shop_jokers.highlighted + #G.shop_booster.highlighted + #G.shop_vouchers.highlighted == 1
			and G.shop_jokers.highlighted[1] ~= self
			and G.shop_booster.highlighted[1] ~= self
			and G.shop_vouchers.highlighted[1] ~= self
	end,
	use = function(self, card, area, copier)
		if not G.GAME.banned_keys then
			G.GAME.banned_keys = {}
		end -- i have no idea if this is always initialised already tbh
		local a = nil
		local c = nil
		if G.shop_jokers.highlighted[1] then
			a = G.shop_jokers
			c = G.shop_jokers.highlighted[1]
		end
		if G.shop_booster.highlighted[1] then
			a = G.shop_booster
			c = G.shop_booster.highlighted[1]
		end
		if G.shop_vouchers.highlighted[1] then
			a = G.shop_vouchers
			c = G.shop_vouchers.highlighted[1]
			if c.shop_voucher then
				G.GAME.current_round.voucher = nil
				G.GAME.current_round.cry_voucher_edition = nil
				G.GAME.current_round.cry_voucher_stickers =
					{ eternal = false, perishable = false, rental = false, pinned = false, banana = false }
			end
		end
		if c.config.center.rarity == "cry_exotic" then
			check_for_unlock({ type = "what_have_you_done" })
		end
		G.GAME.banned_keys[c.config.center.key] = true
		c:start_dissolve()
	end,
}
local spaghetti = {
	object_type = "Consumable",
	set = "Code",
	key = "spaghetti",
	name = "cry-Spaghetti",
	atlas = "code",
	order = 13,
	pos = {
		x = 5,
		y = 2,
	},
	cost = 4,
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.e_cry_glitched
		info_queue[#info_queue + 1] = { set = "Other", key = "food_jokers" }
	end,
	can_use = function(self, card)
		return true
	end,
	use = function(self, card, area, copier)
		local card = create_card(
			"Joker",
			G.jokers,
			nil,
			nil,
			nil,
			nil,
			pseudorandom_element(Cryptid.food, pseudoseed("cry_spaghetti"))
		)
		card:set_edition({
			cry_glitched = true,
		})
		card:add_to_deck()
		G.jokers:emplace(card)
	end,
}
local machinecode = {
	object_type = "Consumable",
	set = "Code",
	name = "cry-Machine Code",
	key = "machinecode",
	pos = { x = 0, y = 3 },
	cost = 3,
	atlas = "code",
	order = 19,
	can_use = function(self, card)
		return true
	end,
	can_bulk_use = true,
	use = function(self, card, area, copier)
		local card = create_card("Consumeables", G.consumables, nil, nil, nil, nil, nil, "cry_machinecode")
		card:set_edition({ cry_glitched = true })
		card:add_to_deck()
		G.consumeables:emplace(card)
	end,
}
local run = {
	object_type = "Consumable",
	set = "Code",
	name = "cry-Run",
	key = "run",
	pos = { x = 5, y = 0 },
	cost = 3,
	atlas = "code",
	order = 6,
	can_use = function(self, card)
		return G.GAME.blind and G.GAME.blind.in_blind
	end,
	can_bulk_use = true,
	use = function(self, card, area, copier)
		G.cry_runarea = CardArea(
			G.discard.T.x,
			G.discard.T.y,
			G.discard.T.w,
			G.discard.T.h,
			{ type = "discard", card_limit = 1e100 }
		)
		local hand_count = #G.hand.cards
		for i = 1, hand_count do
			draw_card(G.hand, G.cry_runarea, i * 100 / hand_count, "down", nil, nil, 0.07)
		end
		G.E_MANAGER:add_event(Event({
			trigger = "immediate",
			func = function()
				G.GAME.current_round.jokers_purchased = 0
				G.STATE = G.STATES.SHOP
				G.GAME.USING_CODE = true
				G.GAME.USING_RUN = true
				G.GAME.RUN_STATE_COMPLETE = 0
				G.GAME.shop_free = nil
				G.GAME.shop_d6ed = nil
				G.STATE_COMPLETE = false
				return true
			end,
		}))
	end,
}
local exploit = {
	object_type = "Consumable",
	set = "Code",
	key = "exploit",
	name = "cry-Exploit",
	atlas = "code",
	pos = {
		x = 1,
		y = 3,
	},
	cost = 4,
	order = 28,
	config = { extra = { enteredhand = "" } }, -- i don't think this ever uses config...?
	can_use = function(self, card)
		return true
	end,
	use = function(self, card, area, copier)
		G.GAME.USING_CODE = true
		G.ENTERED_HAND = ""
		G.CHOOSE_HAND = UIBox({
			definition = create_UIBox_exploit(card),
			config = {
				align = "cm",
				offset = { x = 0, y = 10 },
				major = G.ROOM_ATTACH,
				bond = "Weak",
				instance_type = "POPUP",
			},
		})
		G.CHOOSE_HAND.alignment.offset.y = 0
		G.ROOM.jiggle = G.ROOM.jiggle + 1
		G.CHOOSE_HAND:align_to_major()
	end,
}
local oboe = {
	object_type = "Consumable",
	set = "Code",
	key = "oboe",
	name = "cry-oboe",
	atlas = "code",
	order = 10,
	config = { extra = { choices = 1 } },
	pos = {
		x = 2,
		y = 3,
	},
	cost = 4,
	can_bulk_use = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.choices, (G.GAME and G.GAME.cry_oboe or 0) } }
	end,
	can_use = function(self, card)
		return true
	end,
	use = function(self, card, area, copier)
		G.GAME.cry_oboe = (G.GAME.cry_oboe or 0) + card.ability.extra.choices
	end,
	bulk_use = function(self, card, area, copier, number)
		G.GAME.cry_oboe = (G.GAME.cry_oboe or 0) + (card.ability.extra.choices * number)
	end,
}
local rework = {
	object_type = "Consumable",
	set = "Code",
	key = "rework",
	name = "cry-Rework",
	atlas = "code",
	order = 25,
	pos = {
		x = 3,
		y = 3,
	},
	cost = 4,
	loc_vars = function(self, info_queue)
		info_queue[#info_queue + 1] =
			{ set = "Tag", key = "tag_cry_rework", specific_vars = { "[edition]", "[joker]" } }
		return { vars = {} }
	end,
	can_use = function(self, card)
		--todo: nostalgic deck compat
		return #G.jokers.highlighted == 1 and not G.jokers.highlighted[1].ability.eternal
		and G.jokers.highlighted[1].ability.name ~= "cry-meteor"
		and G.jokers.highlighted[1].ability.name ~= "cry-exoplanet"
		and G.jokers.highlighted[1].ability.name ~= "cry-stardust"
	end,
	use = function(self, card, area, copier)
		local jkr = G.jokers.highlighted[1]
		local found_index = 1
		if jkr.edition then
			for i, v in ipairs(G.P_CENTER_POOLS.Edition) do
				if v.key == jkr.edition.key then
					found_index = i
					break
				end
			end
		end
		found_index = found_index + 1
		if found_index > #G.P_CENTER_POOLS.Edition then
			found_index = found_index - #G.P_CENTER_POOLS.Edition
		end
		local tag = Tag("tag_cry_rework")
		if not tag.ability then
			tag.ability = {}
		end
		tag.ability.rework_key = jkr.config.center.key
		tag.ability.rework_edition = G.P_CENTER_POOLS.Edition[found_index].key
		add_tag(tag)
		--SMODS.Tags.tag_cry_rework.apply(tag, {type = "store_joker_create"})
		G.E_MANAGER:add_event(Event({
			trigger = "before",
			delay = 0.75,
			func = function()
				jkr:start_dissolve()
				return true
			end,
		}))
	end,
}
local rework_tag = {
	object_type = "Tag",
	atlas = "tag_cry",
	name = "cry-Rework Tag",
	order = 19,
	pos = { x = 0, y = 3 },
	config = { type = "store_joker_create" },
	key = "rework",
	ability = { rework_edition = nil, rework_key = nil },
	apply = function(tag, context)
		if context.type == "store_joker_create" then
			local card = create_card("Joker", context.area, nil, nil, nil, nil, (tag.ability.rework_key or "j_scholar"))
			create_shop_card_ui(card, "Joker", context.area)
			card:set_edition((tag.ability.rework_edition or "e_foil"), true, nil, true)
			card.states.visible = false
			tag:yep("+", G.C.FILTER, function()
				card:start_materialize()
				return true
			end)
			tag.triggered = true
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.5,
				func = function()
					save_run() --fixes savescum bugs hopefully?
					return true
				end,
			}))
			return card
		end
	end,
	in_pool = function()
		return false
	end,
}

local automaton = {
	object_type = "Consumable",
	set = "Tarot",
	name = "cry-Automaton",
	key = "automaton",
	pos = { x = 5, y = 1 },
	config = { create = 1 },
	order = 5,
	atlas = "code",
	loc_vars = function(self, info_queue, card)
		return { vars = { self.config.create } }
	end,
	can_use = function(self, card)
		return #G.consumeables.cards < G.consumeables.config.card_limit or card.area == G.consumeables
	end,
	use = function(self, card, area, copier)
		for i = 1, math.min(card.ability.consumeable.create, G.consumeables.config.card_limit - #G.consumeables.cards) do
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.4,
				func = function()
					if G.consumeables.config.card_limit > #G.consumeables.cards then
						play_sound("timpani")
						local _card = create_card("Code", G.consumeables, nil, nil, nil, nil, nil, "cry_automaton")
						_card:add_to_deck()
						G.consumeables:emplace(_card)
						card:juice_up(0.3, 0.5)
					end
					return true
				end,
			}))
		end
		delay(0.6)
	end,
}

local green_seal = {
	object_type = "Seal",
	name = "cry-Green-Seal",
	key = "green",
	badge_colour = HEX("12f254"), --same as code cards
	atlas = "green_atlas",
	pos = { x = 0, y = 0 },

	calculate = function(self, card, context)
		if context.unscoring then
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				func = function()
					if G.consumeables.config.card_limit > #G.consumeables.cards then
						local c = create_card("Code", G.consumeables, nil, nil, nil, nil, nil, "cry_green_seal")
						c:add_to_deck()
						G.consumeables:emplace(c)
						card:juice_up()
					end
					return true
				end,
			}))
			return true
		end
	end,
}

local green_seal_sprite = {
	object_type = "Atlas",
	key = "green_atlas",
	path = "s_cry_green_seal.png",
	px = 71,
	py = 95,
}
local source = {
	object_type = "Consumable",
	set = "Spectral",
	name = "cry-Source",
	order = 9,
	key = "source",
	config = {
		-- This will add a tooltip.
		mod_conv = "cry_green_seal",
		-- Tooltip args
		max_highlighted = 1,
	},
	loc_vars = function(self, info_queue, center)
		-- Handle creating a tooltip with set args.
		info_queue[#info_queue + 1] = { set = "Other", key = "cry_green_seal" }
		return { vars = { center.ability.max_highlighted } }
	end,
	cost = 4,
	atlas = "atlasnotjokers",
	pos = { x = 2, y = 4 },
	use = function(self, card, area, copier) --Good enough
		for i = 1, #G.hand.highlighted do
			local highlighted = G.hand.highlighted[i]
			G.E_MANAGER:add_event(Event({
				func = function()
					play_sound("tarot1")
					highlighted:juice_up(0.3, 0.5)
					return true
				end,
			}))
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.1,
				func = function()
					if highlighted then
						highlighted:set_seal("cry_green")
					end
					return true
				end,
			}))
			delay(0.5)
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.2,
				func = function()
					G.hand:unhighlight_all()
					return true
				end,
			}))
		end
	end,
}
local pointer = {
	object_type = "Consumable",
	set = "Spectral",
	name = "cry-Pointer",
	key = "pointer",
	pos = { x = 4, y = 3 },
	hidden = true,
	soul_set = "Code",
	order = 41,
	atlas = "code",
	can_use = function(self, card)
		return true
	end,
	loc_vars = function(self, info_queue, center)
		return { vars = { (SMODS.Mods["jen"] or {}).can_load and "and OMEGA consumables " or "" } }
	end,
	use = function(self, card, area, copier)
		G.GAME.USING_CODE = true
		G.GAME.USING_POINTER = true
		G.ENTERED_CARD = ""
		G.CHOOSE_CARD = UIBox({
			definition = create_UIBox_pointer(card),
			config = {
				align = "cm",
				offset = { x = 0, y = 10 },
				major = G.ROOM_ATTACH,
				bond = "Weak",
				instance_type = "POPUP",
			},
		})
		G.CHOOSE_CARD.alignment.offset.y = 0
		G.ROOM.jiggle = G.ROOM.jiggle + 1
		G.CHOOSE_CARD:align_to_major()
	end,
}

local encoded = {
	object_type = "Back",
	name = "cry-Encoded",
	key = "encoded",
	order = 11,
	config = { cry_encoded = true, cry_encoded_downside = true },
	pos = { x = 2, y = 5 },
	atlas = "atlasdeck",
}

local source_deck = {
	object_type = "Back",
	name = "cry-Source Deck",
	key = "source_deck",
	order = 12,
	config = { cry_force_seal = "cry_green" },
	pos = { x = 3, y = 5 },
	loc_txt = {
		name = "Source Deck", --not localizing enhanced decks for now; they will be handled automatically later
		text = {
			"All cards have a {C:cry_code}Green Seal{}",
			"Cards cannot change seals",
		},
	},
	atlas = "atlasenhanced",
}

local CodeJoker = {
	object_type = "Joker",
	name = "cry-CodeJoker",
	key = "CodeJoker",
	pos = { x = 2, y = 4 },
	loc_vars = function(self, info_queue, center)
		info_queue[#info_queue + 1] = { key = "e_negative_consumable", set = "Edition", config = { extra = 1 } }
	end,
	rarity = "cry_epic",
	cost = 11,
	order = 109,
	blueprint_compat = true,
	atlas = "atlasepic",
	calculate = function(self, card, context)
		if context.setting_blind and not (context.blueprint_card or self).getting_sliced then
			play_sound("timpani")
			local card = create_card("Code", G.consumables, nil, nil, nil, nil)
			card:set_edition({
				negative = true,
			})
			card:add_to_deck()
			G.consumeables:emplace(card)
			card:juice_up(0.3, 0.5)
			return nil, true
		end
	end,
}

local copypaste = {
	object_type = "Joker",
	name = "cry-copypaste",
	key = "copypaste",
	pos = { x = 3, y = 4 },
	order = 110,
	immune_to_chemach = true,
	config = { extra = { odds = 2, ckt = 0 } },
	rarity = "cry_epic",
	cost = 14,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, center)
		return {
			vars = { "" .. (G.GAME and G.GAME.probabilities.normal or 1), (center and center.ability.extra.odds or 2) },
		}
	end,
	atlas = "atlasepic",
	calculate = function(self, card, context)
		if
			context.using_consumeable
			and context.consumeable.ability.set == "Code"
			and not context.consumeable.beginning_end
		then
			if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
				if pseudorandom("cry_copypaste_joker") < G.GAME.probabilities.normal / card.ability.extra.odds then
					G.E_MANAGER:add_event(Event({
						func = function()
							local cards = copy_card(context.consumeable)
							cards:add_to_deck()
							G.consumeables:emplace(cards)
							return true
						end,
					}))
					card_eval_status_text(
						context.blueprint_cards or card,
						"extra",
						nil,
						nil,
						nil,
						{ message = localize("k_copied_ex") }
					)
				end
			end
		end
	end,
}
local cut = {
	object_type = "Joker",
	name = "cry-cut",
	key = "cut",
	config = { extra = { Xmult = 1, Xmult_mod = 0.5 } },
	pos = { x = 2, y = 2 },
	rarity = 2,
	cost = 7,
	order = 108,
	blueprint_compat = true,
	perishable_compat = false,
	atlas = "atlasthree",
	calculate = function(self, card, context)
		if context.ending_shop then
			local destructable_codecard = {}
			for i = 1, #G.consumeables.cards do
				if
					G.consumeables.cards[i].ability.set == "Code"
					and not G.consumeables.cards[i].getting_sliced
					and not G.consumeables.cards[i].ability.eternal
				then
					destructable_codecard[#destructable_codecard + 1] = G.consumeables.cards[i]
				end
			end
			local codecard_to_destroy = #destructable_codecard > 0
					and pseudorandom_element(destructable_codecard, pseudoseed("cut"))
				or nil

			if codecard_to_destroy then
				codecard_to_destroy.getting_sliced = true
				card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_mod
				G.E_MANAGER:add_event(Event({
					func = function()
						(context.blueprint_card or card):juice_up(0.8, 0.8)
						codecard_to_destroy:start_dissolve({ G.C.RED }, nil, 1.6)
						return true
					end,
				}))
				if not (context.blueprint_card or self).getting_sliced then
					card_eval_status_text((context.blueprint_card or card), "extra", nil, nil, nil, {
						message = localize{type='variable',key='a_xmult',vars={number_format(to_big(card.ability.extra.Xmult))}}
					})
				end
				return nil, true
			end
		end
		if
			context.cardarea == G.jokers
			and (to_big(card.ability.extra.Xmult) > to_big(1))
			and not context.before
			and not context.after
		then
			return {
				message = localize{type='variable',key='a_xmult',vars={number_format(card.ability.extra.Xmult)}},
				Xmult_mod = card.ability.extra.Xmult,
				colour = G.C.MULT,
			}
		end
	end,
	loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.Xmult_mod, center.ability.extra.Xmult } }
	end,
}
local blender = {
	object_type = "Joker",
	name = "cry-blender",
	key = "blender",
	pos = { x = 3, y = 2 },
	rarity = 1,
	cost = 5,
	blueprint_compat = true,
	atlas = "atlasthree",
	order = 111,
	calculate = function(self, card, context)
		if
			context.using_consumeable
			and context.consumeable.ability.set == "Code"
			and not context.consumeable.beginning_end
		then
			if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
				local card = create_card("Consumeables", G.consumables, nil, nil, nil, nil, nil, "cry_blender")
				card:add_to_deck()
				G.consumeables:emplace(card)
			end
		end
	end,
}
local python = {
	object_type = "Joker",
	name = "cry-python",
	key = "python",
	config = { extra = { Xmult = 1, Xmult_mod = 0.15 } },
	pos = { x = 4, y = 2 },
	rarity = 2,
	cost = 7,
	blueprint_compat = true,
	perishable_compat = false,
	atlas = "atlasthree",
	order = 112,
	loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.Xmult_mod, center.ability.extra.Xmult } }
	end,
	calculate = function(self, card, context)
		if
			context.using_consumeable
			and context.consumeable.ability.set == "Code"
			and not context.consumeable.beginning_end
		then
			card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_mod
			G.E_MANAGER:add_event(Event({
				func = function()
					card_eval_status_text(
						card,
						"extra",
						nil,
						nil,
						nil,
						{
							message = localize({
								type = "variable",
								key = "a_xmult",
								vars = { card.ability.extra.Xmult },
							}),
						}
					)
					return true
				end,
			}))
			return
		end
		if
			context.cardarea == G.jokers
			and (to_big(card.ability.extra.Xmult) > to_big(1))
			and not context.before
			and not context.after
		then
			return {
				message = localize({ type = "variable", key = "a_xmult", vars = { card.ability.extra.Xmult } }),
				Xmult_mod = card.ability.extra.Xmult,
			}
		end
	end,
}

function create_UIBox_variable(card)
	G.E_MANAGER:add_event(Event({
		blockable = false,
		func = function()
			G.REFRESH_ALERTS = true
			return true
		end,
	}))
	local t = create_UIBox_generic_options({
		no_back = true,
		colour = HEX("04200c"),
		outline_colour = G.C.SECONDARY_SET.Code,
		contents = {
			{
				n = G.UIT.R,
				nodes = {
					create_text_input({
						colour = G.C.SET.Code,
						hooked_colour = darken(copy_table(G.C.SET.Code), 0.3),
						w = 4.5,
						h = 1,
						max_length = 16,
						extended_corpus = true,
						prompt_text = localize("cry_code_rank"),
						ref_table = G,
						ref_value = "ENTERED_RANK",
						keyboard_offset = 1,
					}),
				},
			},
			{
				n = G.UIT.R,
				nodes = {
					UIBox_button({
						colour = G.C.SET.Code,
						button = "variable_apply",
						label = { localize("cry_code_apply") },
						minw = 4.5,
						focus_args = { snap_to = true },
					}),
				},
			},
			{
				n = G.UIT.R,
				nodes = {
					UIBox_button({
						colour = G.C.RED,
						button = "variable_apply_previous",
						label = { localize("cry_code_apply_previous") },
						minw = 4.5,
						focus_args = { snap_to = true },
					}),
				},
			},
			{
				n = G.UIT.R,
				nodes = {
					UIBox_button({
						colour = G.C.RED,
						button = "variable_cancel",
						label = { localize("cry_code_cancel") },
						minw = 4.5,
						focus_args = { snap_to = true },
					}),
				},
			},
		},
	})
	return t
end

function create_UIBox_class(card)
	G.E_MANAGER:add_event(Event({
		blockable = false,
		func = function()
			G.REFRESH_ALERTS = true
			return true
		end,
	}))
	local t = create_UIBox_generic_options({
		no_back = true,
		colour = HEX("04200c"),
		outline_colour = G.C.SECONDARY_SET.Code,
		contents = {
			{
				n = G.UIT.R,
				nodes = {
					create_text_input({
						colour = G.C.SET.Code,
						hooked_colour = darken(copy_table(G.C.SET.Code), 0.3),
						w = 4.5,
						h = 1,
						max_length = 16,
						prompt_text = localize("cry_code_enh"),
						ref_table = G,
						ref_value = "ENTERED_ENH",
						keyboard_offset = 1,
					}),
				},
			},
			{
				n = G.UIT.R,
				nodes = {
					UIBox_button({
						colour = G.C.SET.Code,
						button = "class_apply",
						label = { localize("cry_code_apply") },
						minw = 4.5,
						focus_args = { snap_to = true },
					}),
				},
			},
			{
				n = G.UIT.R,
				nodes = {
					UIBox_button({
						colour = G.C.RED,
						button = "class_apply_previous",
						label = { localize("cry_code_apply_previous") },
						minw = 4.5,
						focus_args = { snap_to = true },
					}),
				},
			},
			{
				n = G.UIT.R,
				nodes = {
					UIBox_button({
						colour = G.C.RED,
						button = "class_cancel",
						label = { localize("cry_code_cancel") },
						minw = 4.5,
						focus_args = { snap_to = true },
					}),
				},
			},
		},
	})
	return t
end

function create_UIBox_exploit(card)
	G.E_MANAGER:add_event(Event({
		blockable = false,
		func = function()
			G.REFRESH_ALERTS = true
			return true
		end,
	}))
	local t = create_UIBox_generic_options({
		no_back = true,
		colour = HEX("04200c"),
		outline_colour = G.C.SECONDARY_SET.Code,
		contents = {
			{
				n = G.UIT.R,
				nodes = {
					create_text_input({
						colour = G.C.SET.Code,
						hooked_colour = darken(copy_table(G.C.SET.Code), 0.3),
						w = 4.5,
						h = 1,
						max_length = 24,
						extended_corpus = true,
						prompt_text = localize("cry_code_hand"),
						ref_table = G,
						ref_value = "ENTERED_HAND",
						keyboard_offset = 1,
					}),
				},
			},
			{
				n = G.UIT.R,
				nodes = {
					UIBox_button({
						colour = G.C.SET.Code,
						button = "exploit_apply",
						label = { localize("cry_code_exploit") },
						minw = 4.5,
						focus_args = { snap_to = true },
					}),
				},
			},
			{
				n = G.UIT.R,
				nodes = {
					UIBox_button({
						colour = G.C.RED,
						button = "exploit_apply_previous",
						label = { localize("cry_code_exploit_previous") },
						minw = 4.5,
						focus_args = { snap_to = true },
					}),
				},
			},
			{
				n = G.UIT.R,
				nodes = {
					UIBox_button({
						colour = G.C.RED,
						button = "exploit_cancel",
						label = { localize("cry_code_cancel") },
						minw = 4.5,
						focus_args = { snap_to = true },
					}),
				},
			},
		},
	})
	return t
end

function create_UIBox_crash(card)
	G.E_MANAGER:add_event(Event({
		blockable = false,
		func = function()
			G.REFRESH_ALERTS = true
			return true
		end,
	}))
	local t = create_UIBox_generic_options({
		no_back = true,
		colour = HEX("04200c"),
		outline_colour = G.C.SECONDARY_SET.Code,
		contents = {
			{
				n = G.UIT.R,
				nodes = {
					create_text_input({
						colour = G.C.SET.Code,
						hooked_colour = darken(copy_table(G.C.SET.Code), 0.3),
						w = 4.5,
						h = 1,
						max_length = 2500,
						extended_corpus = true,
						prompt_text = "???",
						ref_table = G,
						ref_value = "ENTERED_ACE",
						keyboard_offset = 1,
					}),
				},
			},
			{
				n = G.UIT.R,
				config = { align = "cm" },
				nodes = {
					UIBox_button({
						colour = G.C.SET.Code,
						button = "ca",
						label = { localize("cry_code_execute") },
						minw = 4.5,
						focus_args = { snap_to = true },
					}),
				},
			},
		},
	})
	return t
end

function create_UIBox_pointer(card)
	G.E_MANAGER:add_event(Event({
		blockable = false,
		func = function()
			G.REFRESH_ALERTS = true
			return true
		end,
	}))
	local t = create_UIBox_generic_options({
		no_back = true,
		colour = HEX("04200c"),
		outline_colour = G.C.SECONDARY_SET.Code,
		contents = {
			{
				n = G.UIT.R,
				nodes = {
					create_text_input({
						colour = G.C.SET.Code,
						hooked_colour = darken(copy_table(G.C.SET.Code), 0.3),
						w = 4.5,
						h = 1,
						max_length = 100,
						extended_corpus = true,
						prompt_text = localize("cry_code_enter_card"),
						ref_table = G,
						ref_value = "ENTERED_CARD",
						keyboard_offset = 1,
					}),
				},
			},
			{
				n = G.UIT.R,
				config = { align = "cm" },
				nodes = {
					UIBox_button({
						colour = G.C.SET.Code,
						button = "pointer_apply",
						label = { localize("cry_code_create") },
						minw = 4.5,
						focus_args = { snap_to = true },
					}),
				},
			},
			{
				n = G.UIT.R,
				config = { align = "cm" },
				nodes = {
					UIBox_button({
						colour = G.C.SET.Code,
						button = "your_collection",
						label = { localize("b_collection_cap") },
						minw = 4.5,
						focus_args = { snap_to = true },
					}),
				},
			},
			{
				n = G.UIT.R,
				config = { align = "cm" },
				nodes = {
					UIBox_button({
						colour = G.C.RED,
						button = "pointer_apply_previous",
						label = { localize("cry_code_create_previous") },
						minw = 4.5,
						focus_args = { snap_to = true },
					}),
				},
			},
			{
				n = G.UIT.R,
				config = { align = "cm" },
				nodes = {
					UIBox_button({
						colour = G.C.RED,
						button = "pointer_cancel",
						label = { localize("cry_code_cancel") },
						minw = 4.5,
						focus_args = { snap_to = true },
					}),
				},
			},
		},
	})
	return t
end

G.FUNCS.pointer_cancel = function()
	G.CHOOSE_CARD:remove()
	G.GAME.USING_CODE = false
	G.GAME.USING_POINTER = false
end

G.FUNCS.variable_apply_previous = function()
	if G.PREVIOUS_ENTERED_RANK then
		G.ENTERED_RANK = G.PREVIOUS_ENTERED_RANK or ""
	end
	G.FUNCS.variable_apply()
end

G.FUNCS.variable_apply = function()
	local rank_table = {
		{},
		{ "2", "Two", "II" },
		{ "3", "Three", "III" },
		{ "4", "Four", "IV" },
		{ "5", "Five", "V" },
		{ "6", "Six", "VI" },
		{ "7", "Seven", "VII" },
		{ "8", "Eight", "VIII" },
		{ "9", "Nine", "IX" },
		{ "10", "1O", "Ten", "X", "T" },
		{ "J", "Jack" },
		{ "Q", "Queen" },
		{ "K", "King" },
		{ "A", "Ace", "One" },
		{ "M" },
		{ "nil" },
	}

	local rank_suffix = nil

	for i, v in pairs(rank_table) do
		for j, k in pairs(v) do
			if string.lower(G.ENTERED_RANK) == string.lower(k) then
				rank_suffix = i
			end
		end
	end

	if rank_suffix then
		G.PREVIOUS_ENTERED_RANK = G.ENTERED_RANK
		G.GAME.USING_CODE = false
		if rank_suffix == 15 then
			check_for_unlock({ type = "cheat_used" })
			local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_jolly")
			card:add_to_deck()
			G.jokers:emplace(card)
		elseif rank_suffix == 16 then
			check_for_unlock({ type = "cheat_used" })
			local card = create_card("Code", G.consumeables, nil, nil, nil, nil, "c_cry_crash")
			card:add_to_deck()
			G.consumeables:emplace(card)
		elseif rank_suffix == 17 then
			check_for_unlock({ type = "cheat_used" })
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.4,
				func = function()
					play_sound("tarot1")
					return true
				end,
			}))
			for i = 1, #G.hand.highlighted do
				local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0.15,
					func = function()
						G.hand.highlighted[i]:flip()
						play_sound("card1", percent)
						G.hand.highlighted[i]:juice_up(0.3, 0.3)
						return true
					end,
				}))
			end
			delay(0.2)
			for i = 1, #G.hand.highlighted do
				local CARD = G.hand.highlighted[i]
				local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0.15,
					func = function()
						CARD:flip()
						CARD:set_ability(
							G.P_CENTERS[pseudorandom_element(G.P_CENTER_POOLS.Consumeables, pseudoseed("cry_variable")).key],
							true,
							nil
						)
						play_sound("tarot2", percent)
						CARD:juice_up(0.3, 0.3)
						return true
					end,
				}))
			end
		else
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.4,
				func = function()
					play_sound("tarot1")
					return true
				end,
			}))
			for i = 1, #G.hand.highlighted do
				local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0.15,
					func = function()
						G.hand.highlighted[i]:flip()
						play_sound("card1", percent)
						G.hand.highlighted[i]:juice_up(0.3, 0.3)
						return true
					end,
				}))
			end
			delay(0.2)
			for i = 1, #G.hand.highlighted do
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0.1,
					func = function()
						local card = G.hand.highlighted[i]
						local suit_prefix = string.sub(card.base.suit, 1, 1) .. "_"
						local r2suffix = nil
						if rank_suffix < 10 then
							r2suffix = tostring(rank_suffix)
						elseif rank_suffix == 10 then
							r2suffix = "T"
						elseif rank_suffix == 11 then
							r2suffix = "J"
						elseif rank_suffix == 12 then
							r2suffix = "Q"
						elseif rank_suffix == 13 then
							r2suffix = "K"
						elseif rank_suffix == 14 then
							r2suffix = "A"
						end
						card:set_base(G.P_CARDS[suit_prefix .. r2suffix])
						return true
					end,
				}))
			end
			for i = 1, #G.hand.highlighted do
				local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0.15,
					func = function()
						G.hand.highlighted[i]:flip()
						play_sound("tarot2", percent, 0.6)
						G.hand.highlighted[i]:juice_up(0.3, 0.3)
						return true
					end,
				}))
			end
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.2,
				func = function()
					G.hand:unhighlight_all()
					return true
				end,
			}))
			delay(0.5)
		end
		G.CHOOSE_RANK:remove()
	end
end

G.FUNCS.variable_cancel = function()
	G.CHOOSE_RANK:remove()
	G.GAME.USING_CODE = false
end

G.FUNCS.exploit_apply_previous = function()
	if G.PREVIOUS_ENTERED_HAND then
		G.ENTERED_HAND = G.PREVIOUS_ENTERED_HAND or ""
	end
	G.FUNCS.exploit_apply()
end
G.FUNCS.exploit_apply = function()
	local hand_table = {
		["High Card"] = { "high card", "high" },
		["Pair"] = { "pair", "2oak" },
		["Two Pair"] = { "two pair", "2 pair" },
		["Three of a Kind"] = { "three of a kind", "3oak", "trips" },
		["Straight"] = { "straight" },
		["Flush"] = { "flush" },
		["Full House"] = { "full house", "full" },
		["Four of a Kind"] = { "four of a kind", "4oak" },
		["Straight Flush"] = { "straight flush", "slush", "slushie", "slushy" },
		["Five of a Kind"] = { "five of a kind", "5oak" },
		["Flush House"] = { "flush house", "flouse" },
		["Flush Five"] = { "flush five", "fish" },
	}
	local current_hand = nil
	for k, v in pairs(SMODS.PokerHands) do
		local index = v.key
		local current_name = G.localization.misc.poker_hands[index]
		if not hand_table[v.key] then
			hand_table[v.key] = { current_name }
		end
	end
	for i, v in pairs(hand_table) do
		for j, k in pairs(v) do
			if string.lower(G.ENTERED_HAND) == string.lower(k) then
				current_hand = i
			end
		end
	end
	if current_hand and G.GAME.hands[current_hand].visible then
		G.PREVIOUS_ENTERED_HAND = G.ENTERED_HAND
		G.GAME.cry_exploit_override = current_hand
		G.FUNCS.exploit_cancel()
		return
	end
end

G.FUNCS.exploit_cancel = function()
	G.CHOOSE_HAND:remove()
	G.GAME.USING_CODE = false
end

G.FUNCS.exploit_info = function()
	local text = G.GAME.cry_exploit_override
	local disp_text = text
	local loc_disp_text = localize(disp_text, "poker_hands")
	return text, loc_disp_text, disp_text
end
G.FUNCS.class_apply_previous = function()
	if G.PREVIOUS_ENTERED_ENH then
		G.ENTERED_ENH = G.PREVIOUS_ENTERED_ENH or ""
	end
	G.FUNCS.class_apply()
end
--todo: mod support
G.FUNCS.class_apply = function()
	local enh_table = {
		m_bonus = { "bonus" },
		m_mult = { "mult", "red" },
		m_wild = { "wild", "suit" },
		m_glass = { "glass", "xmult" },
		m_steel = { "steel", "metal", "grey" },
		m_stone = { "stone", "chip", "chips" },
		m_gold = { "gold", "money", "yellow" },
		m_lucky = { "lucky", "rng" },
		m_cry_echo = { "echo", "retrigger", "retriggers" },
		ccd = { "ccd" },
		null = { "nil" },
	}

	local enh_suffix = nil

	for i, v in pairs(enh_table) do
		for j, k in pairs(v) do
			if string.lower(G.ENTERED_ENH) == string.lower(k) then
				enh_suffix = i
			end
		end
	end

	if enh_suffix then
		G.PREVIOUS_ENTERED_ENH = G.ENTERED_ENH
		G.GAME.USING_CODE = false
		if enh_suffix == "ccd" then
			check_for_unlock({ type = "cheat_used" })
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.4,
				func = function()
					play_sound("tarot1")
					return true
				end,
			}))
			for i = 1, #G.hand.highlighted do
				local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0.15,
					func = function()
						G.hand.highlighted[i]:flip()
						play_sound("card1", percent)
						G.hand.highlighted[i]:juice_up(0.3, 0.3)
						return true
					end,
				}))
			end
			delay(0.2)
			for i = 1, #G.hand.highlighted do
				local CARD = G.hand.highlighted[i]
				local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0.15,
					func = function()
						CARD:flip()
						CARD:set_ability(get_random_consumable("cry_class"), true, nil)
						play_sound("tarot2", percent)
						CARD:juice_up(0.3, 0.3)
						return true
					end,
				}))
			end
		elseif enh_suffix == "null" then
			check_for_unlock({ type = "cheat_used" })
			for i = #G.hand.highlighted, 1, -1 do
				local card = G.hand.highlighted[i]
				if card.ability.name == "Glass Card" then
					card:shatter()
				else
					card:start_dissolve(nil, i == #G.hand.highlighted)
				end
			end
			G.CHOOSE_ENH:remove()
			return
		else
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.4,
				func = function()
					play_sound("tarot1")
					return true
				end,
			}))
			for i = 1, #G.hand.highlighted do
				local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0.15,
					func = function()
						G.hand.highlighted[i]:flip()
						play_sound("card1", percent)
						G.hand.highlighted[i]:juice_up(0.3, 0.3)
						return true
					end,
				}))
			end
			delay(0.2)
			for i = 1, #G.hand.highlighted do
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0.1,
					func = function()
						G.hand.highlighted[i]:set_ability(G.P_CENTERS[enh_suffix])
						return true
					end,
				}))
			end
			for i = 1, #G.hand.highlighted do
				local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0.15,
					func = function()
						G.hand.highlighted[i]:flip()
						play_sound("tarot2", percent, 0.6)
						G.hand.highlighted[i]:juice_up(0.3, 0.3)
						return true
					end,
				}))
			end
		end
		G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 0.2,
			func = function()
				G.hand:unhighlight_all()
				return true
			end,
		}))
		delay(0.5)
		G.CHOOSE_ENH:remove()
	end
end

G.FUNCS.class_cancel = function()
	G.GAME.USING_CODE = false
	G.CHOOSE_ENH:remove()
end

G.FUNCS.ca = function()
	G.GAME.USING_CODE = false
	loadstring(G.ENTERED_ACE)() --Scary!
	glitched_intensity = 0
	G.SETTINGS.GRAPHICS.crt = 0
	check_for_unlock({ type = "ach_cry_used_crash" })
	G.CHOOSE_ACE:remove()
	G.ENTERED_ACE = nil
end
G.FUNCS.pointer_apply_previous = function()
	if G.PREVIOUS_ENTERED_CARD then
		G.ENTERED_CARD = G.PREVIOUS_ENTERED_CARD or ""
	end
	G.FUNCS.pointer_apply()
end

local aliases = {
	jimbo = "joker",
	greedy = "greedy joker",
	lusty = "lusty joker",
	wrathful = "wrathful joker",
	gluttonous = "gluttonous joker",
	jolly = "jolly joker",
	zany = "zany joker",
	mad = "mad joker",
	crazy = "crazy joker",
	droll = "droll joker",
	sly = "sly joker",
	wily = "wily joker",
	clever = "clever joker",
	devious = "devious joker",
	crafty = "crafty joker",
	half = "half joker",
	stencil = "joker stencil",
	dagger = "ceremonial dagger",
	chaos = "chaos the clown",
	fib = "fibonacci",
	scary = "scary face",
	abstract = "abstract joker",
	delayedgrat = "delayed gratification",
	banana = "gros michel",
	steven = "even steven",
	todd = "odd todd",
	bus = "ride the bus",
	faceless = "faceless joker",
	todo = "to do list",
	["to-do"] = "to do list",
	square = "square joker",
	seance = "séance",
	riffraff = "riff-raff",
	cloudnine = "cloud 9",
	trousers = "spare trousers",
	ancient = "ancient joker",
	mrbones = "mr. bones",
	smeared = "smeared joker",
	wee = "wee joker",
	oopsall6s = "oops! all 6s",
	all6s = "oops! all 6s",
	oa6 = "oops! all 6s",
	idol = "the idol",
	duo = "the duo",
	trio = "the trio",
	family = "the family",
	order = "the order",
	tribe = "the tribe",
	invisible = "invisible joker",
	driverslicense = "driver's license",
	burnt = "burnt joker",
	caino = "canio",
	house = "happy house",
	queensgambit = "queen's gambit",
	weefib = "weebonacci",
	interest = "compound interest",
	whip = "the whip",
	triplet = "triplet rhythm",
	pepper = "chili pepper",
	krusty = "krusty the clown",
	blurred = "blurred joker",
	gofp = "garden of forking paths",
	lutn = "light up the night",
	nsnm = "no sound, no memory",
	nosoundnomemory = "no sound, no memory",
	lath = "...like antennas to heaven",
	likeantennastoheaven = "...like antennas to heaven",
	consumeable = "consume-able",
	error = "j_cry_error",
	ap = "ap joker",
	rng = "rnjoker",
	filler = "the filler",
	duos = "the duos",
	home = "the home",
	nuts = "the nuts",
	quintet = "the quintet",
	unity = "the unity",
	swarm = "the swarm",
	crypto = "crypto coin",
	googol = "googol play card",
	googolplay = "googol play card",
	google = "googol play card",
	googleplay = "googol play card",
	googleplaycard = "googol play card",
	nostalgicgoogol = "nostalgic googol play card",
	nostalgicgoogolplay = "nostalgic googol play card",
	nostalgicgoogle = "nostalgic googol play card",
	nostalgicgoogleplay = "nostalgic googol play card",
	nostalgicgoogleplaycard = "nostalgic googol play card",
	oldgoogol = "nostalgic googol play card",
	oldgoogolplay = "nostalgic googol play card",
	oldgoogle = "nostalgic googol play card",
	oldgoogleplay = "nostalgic googol play card",
	oldgoogleplaycard = "nostalgic googol play card",
	localthunk = "supercell",
	["1fa"] = "one for all",
	crust = "crustulum",
	deathstar = "stella mortis",
	["jolly?"] = "jolly joker?",
	scrabble = "scrabble tile",
	["13"] = "tredecim",
	["overstock+"] = "overstock plus",
	directorscut = "director's cut",
	["3rs"] = "the 3 rs",
	fool = "the fool",
	magician = "the magician",
	priestess = "the high priestess",
	highpriestess = "the high priestess",
	empress = "the empress",
	emperor = "the emperor",
	hierophant = "the hierophant",
	lovers = "the lovers",
	chariot = "the chariot",
	hermit = "the hermit",
	wheeloffortune = "the wheel of fortune",
	hangedman = "the hanged man",
	devil = "the devil",
	tower = "the tower",
	star = "the star",
	moon = "the moon",
	sun = "the sun",
	world = "the world",
	automaton = "the automaton",
	eclipse = "c_cry_eclipse",
	x = "planet x",
	X = "planet x",
	pointer = "pointer://",
	payload = "://payload",
	reboot = "://reboot",
	revert = "://revert",
	crash = "://crash",
	semicolon = ";//",
	[";"] = ";//",
	malware = "://malware",
	seed = "://seed",
	variable = "://variable",
	class = "://class",
	commit = "://commit",
	merge = "://merge",
	multiply = "://multiply",
	divide = "://divide",
	delete = "://delete",
	machinecode = "://machinecode",
	run = "://run",
	exploit = "://exploit",
	offbyone = "://offbyone",
	rework = "://rework",
	spaghetti = "://spaghetti",
	topuptag = "top-up tag",
	gamblerstag = "gambler's tag",
	hook = "hook://",
	ox = "the ox",
	wall = "the wall",
	wheel = "the wheel",
	arm = "the arm",
	club = "the club",
	fish = "the fish",
	psychic = "the psychic",
	goad = "the goad",
	water = "the water",
	window = "the window",
	manacle = "the manacle",
	eye = "the eye",
	mouth = "the mouth",
	plant = "the plant",
	serpent = "the serpent",
	pillar = "the pillar",
	needle = "the needle",
	head = "the head",
	tooth = "the tooth",
	flint = "the flint",
	mark = "the mark",
	oldox = "nostalgic ox",
	oldhouse = "nostalgic house",
	oldarm = "nostalgic arm",
	oldfish = "nostalgic fish",
	oldmanacle = "nostalgic manacle",
	oldserpent = "nostalgic serpent",
	oldpillar = "nostalgic pillar",
	oldflint = "nostalgic flint",
	oldmark = "nostalgic mark",
	tax = "the tax",
	trick = "the trick",
	joke = "the joke",
	hammer = "the hammer",
	box = "the box",
	windmill = "the windmill",
	clock = "the clock",
	code = "code joker",
	copypaste = "copy/paste",
	translucent = "translucent joker",
	circulus = "circulus pistoris",
	macabre = "macabre joker",
	-- Jen's Almanac aliases
	freddy = "freddy snowshoe",
	paupovlin = "paupovlin revere",
	poppin = "paupovlin revere",
	jen = "jen walter",
	--should I add "reverse ___" prefixes for the reverse tarots?
	survivor = "the survivor",
	monk = "the monk",
	hunter = "the hunter",
	gourmand = "the gourmand",
	saint = "the saint",
	genius = "the genius",
	scientist = "the scientist",
	peasant = "the peasant",
	adversary = "the adversary",
	rivals = "the rivals",
	hitchhiker = "the hitchhiker",
	angel = "the angel",
	collapse = "the collapse",
	lowlaywoman = "the low laywoman",
	laywoman = "the low laywoman",
	servant = "the servant",
	extrovert = "the extrovert",
	discofpenury = "the disc of penury",
	flash = "the flash",
	eclipsespectral = "c_jen_reverse_moon",
	eclipsetorat = "c_jen_reverse_moon",
	darkness = "the darkness",
	void = "the void",
	topuptoken = "top-up token",
	sagittarius = "sagittarius a*",
	["sagitarius a*"] = "sagittarius a*", --minor spelling mistakes are forgiven
	sagitarius = "sagittarius a*", --minor spelling mistakes are forgiven
}
for k, v in pairs(aliases) do
	Cryptid.aliases[k] = v
end
G.FUNCS.pointer_apply = function()
	local function apply_lower(str)
		-- Remove content within {} and any remaining spaces
		str = str:gsub("%b{}", ""):gsub("%s+", "")
		--this weirdness allows you to get m and M separately
		if string.len(str) == 1 then
			return str
		end
		return string.lower(str)
	end
	local current_card
	local entered_card = G.ENTERED_CARD
	G.PREVIOUS_ENTERED_CARD = G.ENTERED_CARD
	local aliases = Cryptid.aliases
	if aliases[apply_lower(entered_card)] then
		entered_card = aliases[apply_lower(entered_card)]
	end
	for i, v in pairs(G.P_CENTERS) do
		if v.name and apply_lower(entered_card) == apply_lower(v.name) then
			current_card = i
		end
		if apply_lower(entered_card) == apply_lower(i) then
			current_card = i
		end
		if apply_lower(entered_card) == apply_lower(localize({ type = "name_text", set = v.set, key = i })) then
			current_card = i
		end
	end
	if current_card then
		local created = false
		if
			G.P_CENTERS[current_card].set == "Joker"
			and (G.P_CENTERS[current_card].rarity ~= "cry_exotic" or #SMODS.find_card("j_jen_p03") > 0)
			and (type(G.P_CENTERS[current_card].rarity) ~= "number" or G.P_CENTERS[current_card].rarity < 5)
		then
			local card = create_card("Joker", G.jokers, nil, nil, nil, nil, current_card)
			card:add_to_deck()
			G.jokers:emplace(card)
			created = true
		end
		if G.P_CENTERS[current_card].consumeable and G.P_CENTERS[current_card].set ~= "jen_omegaconsumable" then
			local card = create_card("Consumeable", G.consumeables, nil, nil, nil, nil, current_card)
			card:add_to_deck()
			G.consumeables:emplace(card)
			created = true
		end
		if G.P_CENTERS[current_card].set == "Voucher" then
			local area
			if G.STATE == G.STATES.HAND_PLAYED then
				if not G.redeemed_vouchers_during_hand then
					G.redeemed_vouchers_during_hand =
						CardArea(G.play.T.x, G.play.T.y, G.play.T.w, G.play.T.h, { type = "play", card_limit = 5 })
				end
				area = G.redeemed_vouchers_during_hand
			else
				area = G.play
			end
			local card = create_card("Voucher", area, nil, nil, nil, nil, current_card)
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
			created = true
		end
		if
			G.P_CENTERS[current_card].set == "Booster"
			and G.STATE ~= G.STATES.TAROT_PACK
			and G.STATE ~= G.STATES.SPECTRAL_PACK
			and G.STATE ~= G.STATES.STANDARD_PACK
			and G.STATE ~= G.STATES.BUFFOON_PACK
			and G.STATE ~= G.STATES.PLANET_PACK
			and G.STATE ~= G.STATES.SMODS_BOOSTER_OPENED
		then
			local card = create_card("Booster", G.hand, nil, nil, nil, nil, current_card)
			card.cost = 0
			card.from_tag = true
			G.FUNCS.use_card({ config = { ref_table = card } })
			card:start_materialize()
			created = true
		end
		if created then
			G.CHOOSE_CARD:remove()
			G.GAME.USING_CODE = false
			G.GAME.USING_POINTER = false
			return
		end
	end
	for i, v in pairs(G.P_TAGS) do
		if v.name and apply_lower(entered_card) == apply_lower(v.name) then
			current_card = i
		end
		if apply_lower(entered_card) == apply_lower(i) then
			current_card = i
		end
		if apply_lower(entered_card) == apply_lower(localize({ type = "name_text", set = v.set, key = i })) then
			current_card = i
		end
	end
	if current_card and not G.P_CENTERS[current_card] then
		local created = false
		local t = Tag(current_card, nil, "Big")
		add_tag(t)
		if current_card == "tag_orbital" then
			local _poker_hands = {}
			for k, v in pairs(G.GAME.hands) do
				if v.visible then
					_poker_hands[#_poker_hands + 1] = k
				end
			end
			t.ability.orbital_hand = pseudorandom_element(_poker_hands, pseudoseed("cry_pointer_orbital"))
		end
		if current_card == "tag_cry_rework" then
			--tbh this is the most unbalanced part of the card
			t.ability.rework_edition =
				pseudorandom_element(G.P_CENTER_POOLS.Edition, pseudoseed("cry_pointer_edition")).key
			t.ability.rework_key = pseudorandom_element(G.P_CENTER_POOLS.Joker, pseudoseed("cry_pointer_joker")).key
		end
		G.CHOOSE_CARD:remove()
		G.GAME.USING_CODE = false
		G.GAME.USING_POINTER = false
		return
	end
	for i, v in pairs(G.P_BLINDS) do
		if v.name and apply_lower(entered_card) == apply_lower(v.name) then
			current_card = i
		end
		if apply_lower(entered_card) == apply_lower(i) then
			current_card = i
		end
		if apply_lower(entered_card) == apply_lower(localize({ type = "name_text", set = "Blind", key = i })) then
			current_card = i
		end
	end
	if current_card and not G.P_CENTERS[current_card] and not G.P_TAGS[current_card] then
		local created = false
		if not G.GAME.blind or (G.GAME.blind.name == "" or not G.GAME.blind.blind_set) then
			--from debugplus
			local par = G.blind_select_opts.boss.parent
			G.GAME.round_resets.blind_choices.Boss = current_card

			G.blind_select_opts.boss:remove()
			G.blind_select_opts.boss = UIBox({
				T = { par.T.x, 0, 0, 0 },
				definition = {
					n = G.UIT.ROOT,
					config = {
						align = "cm",
						colour = G.C.CLEAR,
					},
					nodes = {
						UIBox_dyn_container(
							{ create_UIBox_blind_choice("Boss") },
							false,
							get_blind_main_colour("Boss"),
							mix_colours(G.C.BLACK, get_blind_main_colour("Boss"), 0.8)
						),
					},
				},
				config = {
					align = "bmi",
					offset = {
						x = 0,
						y = G.ROOM.T.y + 9,
					},
					major = par,
					xy_bond = "Weak",
				},
			})
			par.config.object = G.blind_select_opts.boss
			par.config.object:recalculate()
			G.blind_select_opts.boss.parent = par
			G.blind_select_opts.boss.alignment.offset.y = 0

			for i = 1, #G.GAME.tags do
				if G.GAME.tags[i]:apply_to_run({
					type = "new_blind_choice",
				}) then
					break
				end
			end
			created = true
		else
			G.GAME.blind:set_blind(G.P_BLINDS[current_card])
			ease_background_colour_blind(G.STATE)
			created = true
		end
		if created then
			G.CHOOSE_CARD:remove()
			G.GAME.USING_CODE = false
			G.GAME.USING_POINTER = false
		end
	end
end
crashes = {
	function()
		G:save_settings()
		G:save_progress()
		--instantly quit the game, no error log
		function love.errorhandler() end
		print(crash.crash.crash)
	end,
	function()
		G:save_settings()
		G:save_progress()
		--removes draw loop, you're frozen and can still weirdly interact with the game a bit
		function love.draw() end
	end,
	function()
		G:save_settings()
		G:save_progress()
		--by WilsonTheWolf and MathIsFun_, funky error screen with random funny message
		messages = {
			"Oops.",
			"Your cards have been TOASTED, extra crispy for your pleasure.",
			"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
			"What we have here is a certified whoopsidaisy",
			"Why don't you buy more jonkers? Are you stupid?",
			"lmao",
			"How about a game of YOU MUST DIE?",
			"Sorry, I was in the bathroom. What'd I mi'Where'd... Where is everyone?",
			"Peter? What are you doing? Cards. WHAT THE FUCK?",
			"what if it was called freaklatro",
			"4",
			"I SAWED THIS GAME IN HALF!",
			"is this rush hour 4",
			"You missed a semicolon on line 19742, you buffoon",
			"you are an idiot",
			"You do not recognise the cards in the deck.",
			":( Your P",
			"Assertion failed",
			"Play ULTRAKILL",
			"Play Nova Drift",
			"Play Balatro- wait",
			"what if instead of rush hour it was called kush hour and you just smoked a massive blunt",
			"death.fell.accident.water",
			"Balatro's innards were made outards",
			"i am going to club yrou",
			"But the biggest joker of them all, it was you all along!",
			"fission mailed successfully",
			"table index is nil",
			"index is nil table",
			"nil is index table",
			"nildex is in table",
			"I AM THE TABLE",
			"I'm never going back this casino agai-",
			"what did you think would happen?",
			"DO THE EARTHQUAKE! [screams]",
			"fuck you",
			"Screaming in the casino prank! AAAAAAAAAAAAAAAAAA",
			"https://www.youtube.com/watch?v=dQw4w9WgXcQ",
			"You musn't tear or crease it.",
			"Sure, but the point is to do it without making a hole.",
			"The end of all things! As was foretold in the prophecy!",
			"Do it again. It'd be funny",
			"",
			":3",
			"Looks like a skill issue to me.",
			"it turns out that card was ligma",
			"YouJustLostTheCasinoGame",
			"Nah fuck off",
			"attempt to call global your_mom (value too large)",
			"Killed by intentional game design",
			"attempt to index field 'attempt to call global to_big (too big)' (a nil value)",
			"what.avi",
			"The C",
			"Shoulda kept Chicot",
			"Maybe next time don't do that?",
			"[recursion]",
			"://SHART",
			"It's converging time.",
			"This is the last error message.",
		}
		function corruptString(str)
			-- replace each character with a random valid ascii character
			local newStr = ""
			local len
			if type(str) == "string" then
				len = #str
			else
				len = str
			end
			for i = 1, len do
				-- newStr = newStr .. string.char(math.random(33, 122))
				local c = math.random(33, 122)
				newStr = newStr .. string.char(c)
				if c == 92 then -- backslash
					newStr = newStr .. string.char(c)
				end
			end
			return newStr
		end

		function getDebugInfoForCrash()
			local info = "Additional Context:\nBalatro Version: " .. VERSION .. "\nModded Version: " .. MODDED_VERSION
			local major, minor, revision, codename = love.getVersion()
			info = info .. "\nLove2D Version: " .. corruptString(string.format("%d.%d.%d", major, minor, revision))

			local lovely_success, lovely = pcall(require, "lovely")
			if lovely_success then
				info = info .. "\nLovely Version: " .. corruptString(lovely.version)
			end
			if SMODS.mod_list then
				info = info .. "\nSteamodded Mods:"
				local enabled_mods = {}
				for _, v in ipairs(SMODS.mod_list) do
					if v.can_load then
						table.insert(enabled_mods, v)
					end
				end
				for k, v in ipairs(enabled_mods) do
					info = info
						.. "\n    "
						.. k
						.. ": "
						.. v.name
						.. " by "
						.. table.concat(v.author, ", ")
						.. " [ID: "
						.. v.id
						.. (v.priority ~= 0 and (", Priority: " .. v.priority) or "")
						.. (v.version and v.version ~= "0.0.0" and (", Version: " .. v.version) or "")
						.. "]"
					local debugInfo = v.debug_info
					if debugInfo then
						if type(debugInfo) == "string" then
							if #debugInfo ~= 0 then
								info = info .. "\n        " .. debugInfo
							end
						elseif type(debugInfo) == "table" then
							for kk, vv in pairs(debugInfo) do
								if type(vv) ~= "nil" then
									vv = tostring(vv)
								end
								if #vv ~= 0 then
									info = info .. "\n        " .. kk .. ": " .. vv
								end
							end
						end
					end
				end
			end
			return info
		end

		VERSION = corruptString(VERSION)
		MODDED_VERSION = corruptString(MODDED_VERSION)

		if SMODS.mod_list then
			for i, mod in ipairs(SMODS.mod_list) do
				mod.can_load = true
				mod.name = corruptString(mod.name)
				mod.id = corruptString(mod.id)
				mod.author = { corruptString(20) }
				mod.version = corruptString(mod.version)
				mod.debug_info = corruptString(math.random(5, 100))
			end
		end

		do
			local utf8 = require("utf8")
			local linesize = 100

			-- Modifed from https://love2d.org/wiki/love.errorhandler
			function love.errorhandler(msg)
				msg = tostring(msg)

				if not love.window or not love.graphics or not love.event then
					return
				end

				if not love.graphics.isCreated() or not love.window.isOpen() then
					local success, status = pcall(love.window.setMode, 800, 600)
					if not success or not status then
						return
					end
				end

				-- Reset state.
				if love.mouse then
					love.mouse.setVisible(true)
					love.mouse.setGrabbed(false)
					love.mouse.setRelativeMode(false)
					if love.mouse.isCursorSupported() then
						love.mouse.setCursor()
					end
				end
				if love.joystick then
					-- Stop all joystick vibrations.
					for i, v in ipairs(love.joystick.getJoysticks()) do
						v:setVibration()
					end
				end
				if love.audio then
					love.audio.stop()
				end

				love.graphics.reset()
				local font = love.graphics.setNewFont("resources/fonts/m6x11plus.ttf", 20)

				local background = { math.random() * 0.3, math.random() * 0.3, math.random() * 0.3 }
				love.graphics.clear(background)
				love.graphics.origin()

				local sanitizedmsg = {}
				for char in msg:gmatch(utf8.charpattern) do
					table.insert(sanitizedmsg, char)
				end
				sanitizedmsg = table.concat(sanitizedmsg)

				local err = {}

				table.insert(err, "Oops! The game crashed:")
				table.insert(err, sanitizedmsg)

				if #sanitizedmsg ~= #msg then
					table.insert(err, "Invalid UTF-8 string in error message.")
				end

				local success, msg = pcall(getDebugInfoForCrash)
				if success and msg then
					table.insert(err, "\n" .. msg)
				else
					table.insert(err, "\n" .. "Failed to get additional context :/")
				end

				local p = table.concat(err, "\n")

				p = p:gsub("\t", "")
				p = p:gsub('%[string "(.-)"%]', "%1")

				local scrollOffset = 0
				local endHeight = 0
				love.keyboard.setKeyRepeat(true)

				local function scrollDown(amt)
					if amt == nil then
						amt = 18
					end
					scrollOffset = scrollOffset + amt
					if scrollOffset > endHeight then
						scrollOffset = endHeight
					end
				end

				local function scrollUp(amt)
					if amt == nil then
						amt = 18
					end
					scrollOffset = scrollOffset - amt
					if scrollOffset < 0 then
						scrollOffset = 0
					end
				end

				local pos = 70
				local arrowSize = 20

				local function calcEndHeight()
					local font = love.graphics.getFont()
					local rw, lines = font:getWrap(p, love.graphics.getWidth() - pos * 2)
					local lineHeight = font:getHeight()
					local atBottom = scrollOffset == endHeight and scrollOffset ~= 0
					endHeight = #lines * lineHeight - love.graphics.getHeight() + pos * 2
					if endHeight < 0 then
						endHeight = 0
					end
					if scrollOffset > endHeight or atBottom then
						scrollOffset = endHeight
					end
				end

				local function draw()
					if not love.graphics.isActive() then
						return
					end
					love.graphics.clear(background)
					calcEndHeight()
					local time = love.timer.getTime()
					if not G.SETTINGS.reduced_motion then
						background = { math.random() * 0.3, math.random() * 0.3, math.random() * 0.3 }
						p = p .. "\n" .. corruptString(math.random(linesize - linesize / 2, linesize + linesize * 2))
						linesize = linesize + linesize / 25
					end
					love.graphics.printf(p, pos, pos - scrollOffset, love.graphics.getWidth() - pos * 2)
					if scrollOffset ~= endHeight then
						love.graphics.polygon(
							"fill",
							love.graphics.getWidth() - (pos / 2),
							love.graphics.getHeight() - arrowSize,
							love.graphics.getWidth() - (pos / 2) + arrowSize,
							love.graphics.getHeight() - (arrowSize * 2),
							love.graphics.getWidth() - (pos / 2) - arrowSize,
							love.graphics.getHeight() - (arrowSize * 2)
						)
					end
					if scrollOffset ~= 0 then
						love.graphics.polygon(
							"fill",
							love.graphics.getWidth() - (pos / 2),
							arrowSize,
							love.graphics.getWidth() - (pos / 2) + arrowSize,
							arrowSize * 2,
							love.graphics.getWidth() - (pos / 2) - arrowSize,
							arrowSize * 2
						)
					end
					love.graphics.present()
				end

				local fullErrorText = p
				local function copyToClipboard()
					if not love.system then
						return
					end
					love.system.setClipboardText(fullErrorText)
					p = p .. "\nCopied to clipboard!"
				end

				if G then
					-- Kill threads (makes restarting possible)
					if G.SOUND_MANAGER and G.SOUND_MANAGER.channel then
						G.SOUND_MANAGER.channel:push({
							type = "kill",
						})
					end
					if G.SAVE_MANAGER and G.SAVE_MANAGER.channel then
						G.SAVE_MANAGER.channel:push({
							type = "kill",
						})
					end
					if G.HTTP_MANAGER and G.HTTP_MANAGER.channel then
						G.HTTP_MANAGER.channel:push({
							type = "kill",
						})
					end
				end

				return function()
					love.event.pump()

					for e, a, b, c in love.event.poll() do
						if e == "quit" then
							return 1
						elseif e == "keypressed" and a == "escape" then
							return 1
						elseif e == "keypressed" and a == "c" and love.keyboard.isDown("lctrl", "rctrl") then
							copyToClipboard()
						elseif e == "keypressed" and a == "r" then
							return "restart"
						elseif e == "keypressed" and a == "down" then
							scrollDown()
						elseif e == "keypressed" and a == "up" then
							scrollUp()
						elseif e == "keypressed" and a == "pagedown" then
							scrollDown(love.graphics.getHeight())
						elseif e == "keypressed" and a == "pageup" then
							scrollUp(love.graphics.getHeight())
						elseif e == "keypressed" and a == "home" then
							scrollOffset = 0
						elseif e == "keypressed" and a == "end" then
							scrollOffset = endHeight
						elseif e == "wheelmoved" then
							scrollUp(b * 20)
						elseif e == "gamepadpressed" and b == "dpdown" then
							scrollDown()
						elseif e == "gamepadpressed" and b == "dpup" then
							scrollUp()
						elseif e == "gamepadpressed" and b == "a" then
							return "restart"
						elseif e == "gamepadpressed" and b == "x" then
							copyToClipboard()
						elseif e == "gamepadpressed" and (b == "b" or b == "back" or b == "start") then
							return 1
						elseif e == "touchpressed" then
							local name = love.window.getTitle()
							if #name == 0 or name == "Untitled" then
								name = "Game"
							end
							local buttons = { "OK", localize("cry_code_cancel"), "Restart" }
							if love.system then
								buttons[4] = "Copy to clipboard"
							end
							local pressed = love.window.showMessageBox("Quit " .. name .. "?", "", buttons)
							if pressed == 1 then
								return 1
							elseif pressed == 3 then
								return "restart"
							elseif pressed == 4 then
								copyToClipboard()
							end
						end
					end

					draw()

					if love.timer then
						love.timer.sleep(0.1)
					end
				end
			end
		end

		load("error(messages[math.random(1, #messages)])", corruptString(30), "t")()
	end,
	function()
		check_for_unlock({ type = "ach_cry_used_crash" })
		--fills screen with Crash cards
		glitched_intensity = 100
		G.SETTINGS.GRAPHICS.crt = 101
		G.E_MANAGER:add_event(
			Event({
				trigger = "immediate",
				blockable = false,
				no_delete = true,
				func = function()
					local c = create_card("Code", nil, nil, nil, nil, nil, "c_cry_crash")
					c.T.x = math.random(-G.CARD_W, G.TILE_W)
					c.T.y = math.random(-G.CARD_H, G.TILE_H)
					return false
				end,
			}),
			"other"
		)
	end,
	function()
		G:save_settings()
		G:save_progress()
		-- Fake lovely panic
		love.window.showMessageBox(
			"lovely-injector",
			'lovely-injector has crashed:\npanicked at crates/lovely-core/src/lib.rs:420:69:\nFailed to parse patch at "C:\\\\users\\\\jimbo\\\\AppData\\\\Roaming\\\\Balatro\\\\Mods\\\\Cryptid\\\\lovely.toml":\nError { inner: TomlError { message: "expected `.`, `=`", original: Some("'
				.. "\"According to all known laws of aviation, there is no way a bee should be able to fly.\\nIts wings are too small to get its fat little body off the ground.\\nThe bee, of course, flies anyway because bees don't care what humans think is impossible.\\nYellow, black. Yellow, black. Yellow, black. Yellow, black.\\nOoh, black and yellow!\\nLet's shake it up a little.\\nBarry! Breakfast is ready!\\nComing!\\nHang on a second.\\nHello?\\nBarry?\\nAdam?\\nCan you believe this is happening?\\nI can't.\\nI'll pick you up.\\nLooking sharp.\\nUse the stairs, Your father paid good money for those.\\nSorry. I'm excited.\\nHere's the graduate.\\nWe're very proud of you, son.\\nA perfect report card, all B's.\\nVery proud.\\nMa! I got a thing going here.\\nYou got lint on your fuzz.\\nOw! That's me!\\nWave to us! We'll be in row 118,000.\\nBye!\\nBarry, I told you, stop flying in the house!\\nHey, Adam.\\nHey, Barry.\\nIs that fuzz gel?\\nA little. Special day, graduation.\\nNever thought I'd make it.\\nThree days grade school, three days high school.\\nThose were awkward.\\nThree days college. I'm glad I took a day and hitchhiked around The Hive.\\nYou did come back different.\\nHi, Barry. Artie, growing a mustache? Looks good.\\nHear about Frankie?\\nYeah.\\nYou going to the funeral?\\nNo, I'm not going.\\nEverybody knows, sting someone, you die.\\nDon't waste it on a squirrel.\\nSuch a hothead.\\nI guess he could have just gotten out of the way.\\nI love this incorporating an amusement park into our day.\\nThat's why we don't need vacations.\\nBoy, quite a bit of pomp under the circumstances.\\nWell, Adam, today we are men.\\nWe are!\\nBee-men.\\nAmen!\\nHallelujah!\\nStudents, faculty, distinguished bees,\\nplease welcome Dean Buzzwell.\\nWelcome, New Hive City graduating class of 9:15.\\nThat concludes our ceremonies And begins your career at Honex Industries!\\nWill we pick our job today?\\nI heard it's just orientation.\\nHeads up! Here we go.\\nKeep your hands and antennas inside the tram at all times.\\nWonder what it'll be like?\\nA little scary.\\nWelcome to Honex, a division of Honesco and a part of the Hexagon Group.\\nThis is it!\\nWow.\\nWow.\\nWe know that you, as a bee, have worked your whole life to get to the point where you can work for your whole life.\\nHoney begins when our valiant Pollen Jocks bring the nectar to The Hive.\\nOur top-secret formula is automatically color-corrected, scent-adjusted and bubble-contoured into this soothing sweet syrup with its distinctive golden glow you know as... Honey!\\nThat girl was hot.\\nShe's my cousin!\\nShe is?\\nYes, we're all cousins.\\nRight. You're right.\\nAt Honex, we constantly strive to improve every aspect of bee existence.\\nThese bees are stress-testing a new helmet technology.\\nWhat do you think he makes?\\nNot enough.\\nHere we have our latest advancement, the Krelman.\\nWhat does that do?\\nCatches that little strand of honey that hangs after you pour it.\\nSaves us millions.\\nCan anyone work on the Krelman?\\nOf course. Most bee jobs are small ones.\\nBut bees know that every small job, if it's done well, means a lot.\\nBut choose carefully because you'll stay in the job you pick for the rest of your life.\\nThe same job the rest of your life? I didn't know that.\\nWhat's the difference?\\nYou'll be happy to know that bees, as a species, haven't had one day off in 27 million years.\\nSo you'll just work us to death?\\nWe'll sure try.\\nWow! That blew my mind!\\n\\\"What's the difference?\\\"\\nHow can you say that?\\nOne job forever?\\nThat's an insane choice to have to make.\\nI'm relieved. Now we only have to make one decision in life.\\nBut, Adam, how could they never have told us that?\\nWhy would you question anything? We're bees.\\nWe're the most perfectly functioning society on Earth.\\nYou ever think maybe things work a little too well here?\\nLike what? Give me one example.\\nI don't know. But you know what I'm talking about.\\nPlease clear the gate. Royal Nectar Force on approach.\\nWait a second. Check it out.\\nHey, those are Pollen Jocks!\\nWow.\\nI've never seen them this close.\\nThey know what it's like outside The Hive.\\nYeah, but some don't come back.\\nHey, Jocks!\\nHi, Jocks!\\nYou guys did great!\\nYou're monsters!\\nYou're sky freaks! I love it! I love it!\\nI wonder where they were.\\nI don't know.\\nTheir day's not planned.\\nOutside The Hive, flying who knows where, doing who knows what.\\nYou can't just decide to be a Pollen Jock. You have to be bred for that.\\nRight.\\nLook. That's more pollen than you and I will see in a lifetime.\\nIt's just a status symbol.\\nBees make too much of it.\\nPerhaps. Unless you're wearing it and the ladies see you wearing it.\\nThose ladies?\\nAren't they our cousins too?\\nDistant. Distant.\\nLook at these two.\\nCouple of Hive Harrys.\\nLet's have fun with them.\\nIt must be dangerous being a Pollen Jock.\\nYeah. Once a bear pinned me against a mushroom!\\nHe had a paw on my throat, and with the other, he was slapping me!\\nOh, my!\\nI never thought I'd knock him out.\\nWhat were you doing during this?\\nTrying to alert the authorities.\\nI can autograph that.\\nA little gusty out there today, wasn't it, comrades?\\nYeah. Gusty.\\nWe're hitting a sunflower patch six miles from here tomorrow.\\nSix miles, huh?\\nBarry!\\nA puddle jump for us, but maybe you're not up for it.\\nMaybe I am.\\nYou are not!\\nWe're going 0900 at J-Gate.\\nWhat do you think, buzzy-boy?\\nAre you bee enough?\\nI might be. It all depends on what 0900 means.\\nHey, Honex!\\nDad, you surprised me.\\nYou decide what you're interested in?\\nWell, there's a lot of choices.\\nBut you only get one.\\nDo you ever get bored doing the same job every day?\\nSon, let me tell you about stirring.\\nYou grab that stick, and you just move it around, and you stir it around.\\nYou get yourself into a rhythm.\\nIt's a beautiful thing.\\nYou know, Dad, the more I think about it,\\nmaybe the honey field just isn't right for me.\\nYou were thinking of what, making balloon animals?\\nThat's a bad job for a guy with a stinger.\\nJanet, your son's not sure he wants to go into honey!\\nBarry, you are so funny sometimes.\\nI'm not trying to be funny.\\nYou're not funny! You're going into honey. Our son, the stirrer!\\nYou're gonna be a stirrer?\\nNo one's listening to me!\\nWait till you see the sticks I have.\\nI could say anything right now.\\nI'm gonna get an ant tattoo!\\nLet's open some honey and celebrate!\\nMaybe I'll pierce my thorax. Shave my antennae. Shack up with a grasshopper. Get a gold tooth and call everybody \\\"dawg\\\"!\\nI'm so proud.\\nWe're starting work today!\\nToday's the day.\\nCome on! All the good jobs will be gone.\\nYeah, right.\\nPollen counting, stunt bee, pouring, stirrer, front desk, hair removal...\\nIs it still available?\\nHang on. Two left!\\nOne of them's yours! Congratulations!\\nStep to the side.\\nWhat'd you get?\\nPicking crud out. Stellar!\\nWow!\\nCouple of newbies?\\nYes, sir! Our first day! We are ready!\\nMake your choice.\\nYou want to go first?\\nNo, you go.\\nOh, my. What's available?\\nRestroom attendant's open, not for the reason you think.\\nAny chance of getting the Krelman?\\nSure, you're on.\\nI'm sorry, the Krelman just closed out.\\nWax monkey's always open.\\nThe Krelman opened up again.\\nWhat happened?\\nA bee died. Makes an opening. See? He's dead. Another dead one.\\nDeady. Deadified. Two more dead.\\nDead from the neck up. Dead from the neck down. That's life!\\nOh, this is so hard!\\nHeating, cooling, stunt bee, pourer, stirrer, humming, inspector number seven, lint coordinator, stripe supervisor, mite wrangler.\\nBarry, what do you think I should... Barry?\\nBarry!\\nAll right, we've got the sunflower patch in quadrant nine...\\nWhat happened to you?\\nWhere are you?\\nI'm going out.\\nOut? Out where?\\nOut there.\\nOh, no!\\nI have to, before I go to work for the rest of my life.\\nYou're gonna die! You're crazy! Hello?\\nAnother call coming in.\\nIf anyone's feeling brave, there's a Korean deli on 83rd that gets their roses today.\\nHey, guys.\\nLook at that.\\nIsn't that the kid we saw yesterday?\\nHold it, son, flight deck's restricted.\\nIt's OK, Lou. We're gonna take him up.\\nReally? Feeling lucky, are you?\\nSign here, here. Just initial that.\\nThank you.\\nOK.\\nYou got a rain advisory today, and as you all know, bees cannot fly in rain.\\nSo be careful. As always, watch your brooms, hockey sticks, dogs, birds, bears and bats.\\nAlso, I got a couple of reports of root beer being poured on us.\\nMurphy's in a home because of it, babbling like a cicada!\\nThat's awful.\\nAnd a reminder for you rookies, bee law number one, absolutely no talking to humans!\\n All right, launch positions!\\nBuzz, buzz, buzz, buzz! Buzz, buzz, buzz, buzz! Buzz, buzz, buzz, buzz!\\nBlack and yellow!\\nHello!\\nYou ready for this, hot shot?\\nYeah. Yeah, bring it on.\\nWind, check.\\nAntennae, check.\\nNectar pack, check.\\nWings, check.\\nStinger, check.\\nScared out of my shorts, check.\\nOK, ladies,\\nlet's move it out!\\nPound those petunias, you striped stem-suckers!\\nAll of you, drain those flowers!\\nWow! I'm out!\\nI can't believe I'm out!\\nSo blue.\\nI feel so fast and free!\\nBox kite!\\nWow!\\nFlowers!\\nThis is Blue Leader, We have roses visual.\\nBring it around 30 degrees and hold.\\nRoses!\\n30 degrees, roger. Bringing it around.\\nStand to the side, kid.\\nIt's got a bit of a kick.\\nThat is one nectar collector!\\nEver see pollination up close?\\nNo, sir.\\nI pick up some pollen here, sprinkle it over here. Maybe a dash over there, a pinch on that one.\\nSee that? It's a little bit of magic.\\nThat's amazing. Why do we do that?\\nThat's pollen power. More pollen, more flowers, more nectar, more honey for us.\\nCool.\\nI'm picking up a lot of bright yellow, Could be daisies, Don't we need those?\\nCopy that visual.\\nWait. One of these flowers seems to be on the move.\\nSay again? You're reporting a moving flower?\\nAffirmative.\\nThat was on the line!\\nThis is the coolest. What is it?\\nI don't know, but I'm loving this color.\\nIt smells good.\\nNot like a flower, but I like it.\\nYeah, fuzzy.\\nChemical-y.\\nCareful, guys. It's a little grabby.\\nMy sweet lord of bees!\\nCandy-brain, get off there!\\nProblem!\\nGuys!\\nThis could be bad.\\nAffirmative.\\nVery close.\\nGonna hurt.\\nMama's little boy.\\nYou are way out of position, rookie!\\nComing in at you like a missile!\\nHelp me!\\nI don't think these are flowers.\\nShould we tell him?\\nI think he knows.\\nWhat is this?!\\nMatch point!\\nYou can start packing up, honey, because you're about to eat it!\\nYowser!\\nGross.\\nThere's a bee in the car!\\nDo something!\\nI'm driving!\\nHi, bee.\\nHe's back here!\\nHe's going to sting me!\\nNobody move. If you don't move, he won't sting you. Freeze!\\nHe blinked!\\nSpray him, Granny!\\nWhat are you doing?!\\nWow... the tension level out here is unbelievable.\\nI gotta get home.\\nCan't fly in rain. Can't fly in rain. Can't fly in rain.\\nMayday! Mayday! Bee going down!\\nKen, could you close the window please?\\nKen, could you close the window please?\\nCheck out my new resume. I made it into a fold-out brochure. You see? Folds out.\\nOh, no. More humans. I don't need this.\\nWhat was that?\\nMaybe this time. This time. This time. This time! This time! This... Drapes!\\nThat is diabolical.\\nIt's fantastic. It's got all my special skills, even my top-ten favorite movies.\\nWhat's number one? Star Wars?\\nNah, I don't go for that... kind of stuff.\\nNo wonder we shouldn't talk to them. They're out of their minds.\\nWhen I leave a job interview, they're flabbergasted, can't believe what I say.\\nThere's the sun. Maybe that's a way out.\\nI don't remember the sun having a big 75 on it.\\nI predicted global warming. I could feel it getting hotter. At first I thought it was just me.\\nWait! Stop! Bee!\\nStand back. These are winter boots.\\nWait!\\nDon't kill him!\\nYou know I'm allergic to them! This thing could kill me!\\nWhy does his life have less value than yours?\\nWhy does his life have any less value than mine? Is that your statement?\\nI'm just saying all life has value. You don't know what he's capable of feeling.\\nMy brochure!\\nThere you go, little guy.\\nI'm not scared of him.It's an allergic thing.\\n Put that on your resume brochure.\\nMy whole face could puff up.\\nMake it one of your special skills.\\nKnocking someone out is also a special skill.\\nRight. Bye, Vanessa. Thanks.\\nVanessa, next week? Yogurt night?\\nSure, Ken. You know, whatever.\\nYou could put carob chips on there.\\nBye.\\nSupposed to be less calories.\\nBye.\\nI gotta say something. She saved my life. I gotta say something.\\nAll right, here it goes.\\nNah.\\nWhat would I say?\\nI could really get in trouble. It's a bee law. You're not supposed to talk to a human.\\nI can't believe I'm doing this. I've got to.\\nOh, I can't do it. Come on!\\nNo. Yes. No. Do it. I can't.\\nHow should I start it? \\\"You like jazz?\\\" No, that's no good.\\nHere she comes! Speak, you fool!\\nHi!\\nI'm sorry. You're talking.\\nYes, I know.\\nYou're talking!\\nI'm so sorry.\\nNo, it's OK. It's fine.\\nI know I'm dreaming. But I don't recall going to bed.\\nWell, I'm sure this is very disconcerting.\\nThis is a bit of a surprise to me. I mean, you're a bee!\\nI am. And I'm not supposed to be doing this, but they were all trying to kill me.\\nAnd if it wasn't for you... I had to thank you. It's just how I was raised.\\nThat was a little weird. I'm talking with a bee.\\nYeah.\\nI'm talking to a bee. And the bee is talking to me!\\nI just want to say I'm grateful.\\nI'll leave now.\\nWait! How did you learn to do that?\\nWhat?\\nThe talking thing.\\nSame way you did, I guess. \\\"Mama, Dada, honey.\\\" You pick it up.\\nThat's very funny.\\nYeah.\\nBees are funny. If we didn't laugh, we'd cry with what we have to deal with.\\nAnyway... Can I... get you something?\\nLike what?\\nI don't know. I mean... I don't know. Coffee?\\nI don't want to put you out.\\nIt's no trouble. It takes two minutes.\\nIt's just coffee.\\nI hate to impose.\\nDon't be ridiculous!\\nActually, I would love a cup.\\nHey, you want rum cake?\\nI shouldn't.\\nHave some.\\nNo, I can't.\\nCome on!\\nI'm trying to lose a couple micrograms.\\nWhere?\\nThese stripes don't help.\\nYou look great!\\nI don't know if you know anything about fashion.\\nAre you all right?\\nNo.\\nHe's making the tie in the cab as they're flying up Madison.\\nHe finally gets there.\\nHe runs up the steps into the church.\\nThe wedding is on.\\nAnd he says, \\\"Watermelon?\\nI thought you said Guatemalan.\\nWhy would I marry a watermelon?\\\"\\nIs that a bee joke?\\nThat's the kind of stuff we do.\\nYeah, different.\\nSo, what are you gonna do, Barry?\\nAbout work? I don't know.\\nI want to do my part for The Hive, but I can't do it the way they want.\\nI know how you feel.\\nYou do?\\nSure.\\nMy parents wanted me to be a lawyer or a doctor, but I wanted to be a florist.\\nReally?\\nMy only interest is flowers.\\nOur new queen was just elected with that same campaign slogan.\\nAnyway, if you look... There's my hive right there. See it?\\nYou're in Sheep Meadow!\\nYes! I'm right off the Turtle Pond!\\nNo way! I know that area. I lost a toe ring there once.\\nWhy do girls put rings on their toes?\\nWhy not?\\nIt's like putting a hat on your knee.\\nMaybe I'll try that.\\nYou all right, ma'am?\\nOh, yeah. Fine.\\nJust having two cups of coffee!\\nAnyway, this has been great.\\nThanks for the coffee.\\nYeah, it's no trouble.\\nSorry I couldn't finish it. If I did, I'd be up the rest of my life.\\nAre you...?\\nCan I take a piece of this with me?\\nSure! Here, have a crumb.\\nThanks!\\nYeah.\\nAll right. Well, then... I guess I'll see you around. Or not.\\nOK, Barry.\\nAnd thank you so much again... for before.\\nOh, that? That was nothing.\\nWell, not nothing, but... Anyway...\\nThis can't possibly work.\\nHe's all set to go.\\nWe may as well try it.\\nOK, Dave, pull the chute.\\nSounds amazing.\\nIt was amazing!\\nIt was the scariest, happiest moment of my life.\\nHumans! I can't believe you were with humans!\\nGiant, scary humans!\\nWhat were they like?\\nHuge and crazy. They talk crazy.\\nThey eat crazy giant things.\\nThey drive crazy.\\nDo they try and kill you, like on TV?\\nSome of them. But some of them don't.\\nHow'd you get back?\\nPoodle.\\nYou did it, and I'm glad. You saw whatever you wanted to see.\\nYou had your \\\"experience.\\\" Now you can pick out yourjob and be normal.\\nWell...\\nWell?\\nWell, I met someone.\\nYou did? Was she Bee-ish?\\nA wasp?! Your parents will kill you!\\nNo, no, no, not a wasp.\\nSpider?\\nI'm not attracted to spiders.\\nI know it's the hottest thing, with the eight legs and all. I can't get by that face.\\nSo who is she?\\nShe's... human.\\nNo, no. That's a bee law. You wouldn't break a bee law.\\nHer name's Vanessa.\\nOh, boy.\\nShe's so nice. And she's a florist!\\nOh, no! You're dating a human florist!\\nWe're not dating.\\nYou're flying outside The Hive, talking to humans that attack our homes with power washers and M-80s! One-eighth a stick of dynamite!\\nShe saved my life! And she understands me.\\nThis is over!\\nEat this.\\nThis is not over! What was that?\\nThey call it a crumb.\\nIt was so stingin' stripey!\\nAnd that's not what they eat.\\nThat's what falls off what they eat!\\nYou know what a Cinnabon is?\\nNo.\\nIt's bread and cinnamon and frosting. They heat it up...\\nSit down!\\n...really hot!\\nListen to me!\\nWe are not them! We're us.\\nThere's us and there's them!\\n\"), keys: [], span: Some(10..11)}}}",
			"error"
		)
		love.window.showMessageBox(
			"lovely-injector",
			"lovely-injector has crashed:\npanicked at library/cors/src/panicking.rs:221:5:\npanic in a function that cannot unwind",
			"error"
		)

		function love.errorhandler() end
		print(crash.crash.crash)
	end,
	function()
		--Arbitrary Code Execution
		glitched_intensity = 100
		G.SETTINGS.GRAPHICS.crt = 100
		G.GAME.USING_CODE = true
		G.ENTERED_ACE = ""
		G.CHOOSE_ACE = UIBox({
			definition = create_UIBox_crash(card),
			config = {
				align = "bmi",
				offset = { x = 0, y = G.ROOM.T.y + 29 },
				major = G.jokers,
				bond = "Weak",
				instance_type = "POPUP",
			},
		})
	end,
}

--for testing
-- crashes = {crashes[#crashes]}
-- crashes[1]()

local code_cards = {
	code,
	code_atlas,
	pack_atlas,
	pack1,
	pack2,
	packJ,
	packM,
	console,
	automaton,
	green_seal,
	green_seal_sprite,
	source,
	pointer,
	cut,
	blender,
	python,
	payload,
	reboot,
	revert,
	crash,
	semicolon,
	malware,
	seed,
	rigged,
	hook,
	hooked,
	variable,
	class,
	commit,
	merge,
	multiply,
	divide,
	delete,
	machinecode,
	run,
	exploit,
	oboe,
	rework,
	rework_tag,
}
if Cryptid.enabled["Misc."] then
	code_cards[#code_cards + 1] = spaghetti
end
if Cryptid.enabled["Enhanced Decks"] then
	code_cards[#code_cards + 1] = source_deck
end
if Cryptid.enabled["Epic Jokers"] then
	code_cards[#code_cards + 1] = encoded
	code_cards[#code_cards + 1] = CodeJoker
	code_cards[#code_cards + 1] = copypaste
end
return {
	name = "Code Cards",
	init = function()
		--allow Program Packs to let you keep the cards
		local G_UIDEF_use_and_sell_buttons_ref = G.UIDEF.use_and_sell_buttons
		function G.UIDEF.use_and_sell_buttons(card)
			if (card.area == G.pack_cards and G.pack_cards) and card.ability.consumeable then --Add a use button
				if card.ability.set == "Code" then
					return {
						n = G.UIT.ROOT,
						config = { padding = -0.1, colour = G.C.CLEAR },
						nodes = {
							{
								n = G.UIT.R,
								config = {
									ref_table = card,
									r = 0.08,
									padding = 0.1,
									align = "bm",
									minw = 0.5 * card.T.w - 0.15,
									minh = 0.7 * card.T.h,
									maxw = 0.7 * card.T.w - 0.15,
									hover = true,
									shadow = true,
									colour = G.C.UI.BACKGROUND_INACTIVE,
									one_press = true,
									button = "use_card",
									func = "can_reserve_card",
								},
								nodes = {
									{
										n = G.UIT.T,
										config = {
											text = localize("b_pull"),
											colour = G.C.UI.TEXT_LIGHT,
											scale = 0.55,
											shadow = true,
										},
									},
								},
							},
							{
								n = G.UIT.R,
								config = {
									ref_table = card,
									r = 0.08,
									padding = 0.1,
									align = "bm",
									minw = 0.5 * card.T.w - 0.15,
									maxw = 0.9 * card.T.w - 0.15,
									minh = 0.1 * card.T.h,
									hover = true,
									shadow = true,
									colour = G.C.UI.BACKGROUND_INACTIVE,
									one_press = true,
									button = "Do you know that this parameter does nothing?",
									func = "can_use_consumeable",
								},
								nodes = {
									{
										n = G.UIT.T,
										config = {
											text = localize("b_use"),
											colour = G.C.UI.TEXT_LIGHT,
											scale = 0.45,
											shadow = true,
										},
									},
								},
							},
							{ n = G.UIT.R, config = { align = "bm", w = 7.7 * card.T.w } },
							{ n = G.UIT.R, config = { align = "bm", w = 7.7 * card.T.w } },
							{ n = G.UIT.R, config = { align = "bm", w = 7.7 * card.T.w } },
							{ n = G.UIT.R, config = { align = "bm", w = 7.7 * card.T.w } },
							-- Betmma can't explain it, neither can I
						},
					}
				end
			end
			return G_UIDEF_use_and_sell_buttons_ref(card)
		end
		--Code from Betmma's Vouchers
		G.FUNCS.can_reserve_card = function(e)
			if #G.consumeables.cards < G.consumeables.config.card_limit then
				e.config.colour = G.C.GREEN
				e.config.button = "reserve_card"
			else
				e.config.colour = G.C.UI.BACKGROUND_INACTIVE
				e.config.button = nil
			end
		end
		G.FUNCS.reserve_card = function(e)
			local c1 = e.config.ref_table
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.1,
				func = function()
					c1.area:remove_card(c1)
					c1:add_to_deck()
					if c1.children.price then
						c1.children.price:remove()
					end
					c1.children.price = nil
					if c1.children.buy_button then
						c1.children.buy_button:remove()
					end
					c1.children.buy_button = nil
					remove_nils(c1.children)
					G.consumeables:emplace(c1)
					G.GAME.pack_choices = G.GAME.pack_choices - 1
					if G.GAME.pack_choices <= 0 then
						G.FUNCS.end_consumeable(nil, delay_fac)
					end
					return true
				end,
			}))
		end
		--Revert
		local sr = save_run
		function save_run()
			if G.GAME.round_resets.ante ~= G.GAME.cry_revert_ante then
				G.GAME.cry_revert_ante = G.GAME.round_resets.ante
				G.GAME.cry_revert = nil
				sr()
				G.GAME.cry_revert = STR_PACK(G.culled_table)
				sr()
			end
			sr()
		end
		--Semicolon - don't evaluate round
		local gfer = G.FUNCS.evaluate_round
		function G.FUNCS.evaluate_round()
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
				return gfer()
			end
		end
		--Multiply - reset Jokers at end of round
		local er = end_round
		function end_round()
			er()
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i].cry_multiply then
					m = G.jokers.cards[i].cry_multiply
					cry_with_deck_effects(G.jokers.cards[i], function(card)
						cry_misprintize(card, { min = 1 / m, max = 1 / m }, nil, true)
					end)
					G.jokers.cards[i].cry_multiply = nil
				end
			end
		end
		--some code to make typing more characters better
		G.FUNCS.text_input_key = function(args)
			args = args or {}
			local hook = G.CONTROLLER.text_input_hook
			if not hook.config.ref_table.extended_corpus then
				if args.key == "[" or args.key == "]" then
					return
				end
				if args.key == "0" then
					args.key = "o"
				end
			else
				if string.byte(args.key, 1) >= 128 then
					print(string.byte(args.key, 1))
					args.key = "?" --fix for lovely bugging out
				end
			end

			--shortcut to hook config
			local hook_config = G.CONTROLLER.text_input_hook.config.ref_table
			hook_config.orig_colour = hook_config.orig_colour or copy_table(hook_config.colour)

			args.key = args.key or "%"
			args.caps = args.caps or G.CONTROLLER.capslock or hook_config.all_caps --capitalize if caps lock or hook requires

			--Some special keys need to be mapped accordingly before passing through the corpus
			local keymap = {
				space = " ",
				backspace = "BACKSPACE",
				delete = "DELETE",
				["return"] = "RETURN",
				right = "RIGHT",
				left = "LEFT",
			}
			local corpus = "123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
				.. (hook.config.ref_table.extended_corpus and " 0!$&()<>?:{}+-=,.[]_" or "")

			if hook.config.ref_table.extended_corpus then
				local lower_ext = "1234567890-=;',./"
				local upper_ext = '!@#$%^&*()_+:"<>?'
				if args.caps then
					if args.key == "." then
						args.key = ">"
					end
					if args.key == "[" then
						args.key = "{"
					end
					if args.key == "]" then
						args.key = "}"
					end
					if args.key == "\\" then
						args.key = "|"
					end
				end

				pcall(function()
					if string.find(lower_ext, args.key) and args.caps then
						args.key = string.sub(string.sub(upper_ext, string.find(lower_ext, args.key)), 0, 1)
					end
				end)
			end
			local text = hook_config.text

			--set key to mapped key or upper if caps is true
			args.key = keymap[args.key] or (args.caps and string.upper(args.key) or args.key)

			--Start by setting the cursor position to the correct location
			TRANSPOSE_TEXT_INPUT(0)

			if string.len(text.ref_table[text.ref_value]) > 0 and args.key == "BACKSPACE" then --If not at start, remove preceding letter
				MODIFY_TEXT_INPUT({
					letter = "",
					text_table = text,
					pos = text.current_position,
					delete = true,
				})
				TRANSPOSE_TEXT_INPUT(-1)
			elseif string.len(text.ref_table[text.ref_value]) > 0 and args.key == "DELETE" then --if not at end, remove following letter
				MODIFY_TEXT_INPUT({
					letter = "",
					text_table = text,
					pos = text.current_position + 1,
					delete = true,
				})
				TRANSPOSE_TEXT_INPUT(0)
			elseif args.key == "RETURN" then --Release the hook
				if hook.config.ref_table.callback then
					hook.config.ref_table.callback()
				end
				hook.parent.parent.config.colour = hook_config.colour
				local temp_colour = copy_table(hook_config.orig_colour)
				hook_config.colour[1] = G.C.WHITE[1]
				hook_config.colour[2] = G.C.WHITE[2]
				hook_config.colour[3] = G.C.WHITE[3]
				ease_colour(hook_config.colour, temp_colour)
				G.CONTROLLER.text_input_hook = nil
			elseif args.key == "LEFT" then --Move cursor position to the left
				TRANSPOSE_TEXT_INPUT(-1)
			elseif args.key == "RIGHT" then --Move cursor position to the right
				TRANSPOSE_TEXT_INPUT(1)
			elseif
				hook_config.max_length > string.len(text.ref_table[text.ref_value])
				and (string.len(args.key) == 1)
				and (string.find(corpus, args.key, 1, true) or hook.config.ref_table.extended_corpus)
			then --check to make sure the key is in the valid corpus, add it to the string
				MODIFY_TEXT_INPUT({
					letter = args.key,
					text_table = text,
					pos = text.current_position + 1,
				})
				TRANSPOSE_TEXT_INPUT(1)
			end
		end

		--Machine Code rendering
		codechars2 = { "!", "'", ",", ".", ":", ";", "i", "l", "|", "¡", "¦", "ì", "í", "ı" }
		codechars4 = { " ", "(", ")", "[", "]", "j", "î", "ī", "ĭ" }
		codechars5 = { '"', "*", "<", ">", "{", "}", "¨", "°", "º", "×" }
		codechars6 = {
			"$",
			"%",
			"+",
			"-",
			"/",
			"0",
			"1",
			"2",
			"3",
			"4",
			"5",
			"6",
			"7",
			"8",
			"9",
			"=",
			"?",
			"A",
			"B",
			"C",
			"D",
			"E",
			"F",
			"G",
			"H",
			"I",
			"J",
			"K",
			"L",
			"N",
			"O",
			"P",
			"R",
			"S",
			"T",
			"U",
			"V",
			"Y",
			"Z",
			"\\",
			"^",
			"_",
			"a",
			"b",
			"c",
			"d",
			"e",
			"f",
			"g",
			"h",
			"k",
			"n",
			"o",
			"p",
			"q",
			"r",
			"s",
			"t",
			"u",
			"v",
			"y",
			"z",
			"~",
			"¢",
			"¥",
			"§",
			"¬",
			"±",
			"¿",
			"À",
			"Á",
			"Â",
			"Ã",
			"Ä",
			"Å",
			"Ç",
			"È",
			"É",
			"Ê",
			"Ë",
			"Ì",
			"Í",
			"Î",
			"Ï",
			"Ñ",
			"Ò",
			"Ó",
			"Ô",
			"Õ",
			"Ö",
			"Ù",
			"Ú",
			"Û",
			"Ü",
			"Ý",
			"Þ",
			"à",
			"á",
			"â",
			"ã",
			"ä",
			"å",
			"ç",
			"è",
			"é",
			"ê",
			"ë",
			"ï",
			"ñ",
			"ò",
			"ó",
			"ô",
			"õ",
			"ö",
			"÷",
			"ù",
			"ú",
			"û",
			"ü",
			"ý",
			"þ",
			"ÿ",
			"Ā",
			"ā",
			"Ă",
			"ă",
			"Ć",
			"ć",
			"Ē",
			"ē",
			"Ĕ",
			"ĕ",
			"Ğ",
			"ğ",
			"Ī",
			"Ĭ",
			"İ",
			"ł",
			"Ń",
			"ń",
			"Ō",
			"ō",
			"Ŏ",
			"ŏ",
			"Ś",
			"ś",
			"Ş",
			"ş",
			"Ū",
			"ū",
			"Ŭ",
			"ŭ",
			"Ÿ",
			"Ź",
			"ź",
			"Ż",
			"ż",
			"Ǔ",
			"ǔ",
			"μ",
		}
		codechars7 = { "#", "Q", "X", "x", "£", "ß", "Ą", "ą", "Đ", "đ", "Ę", "ę" }
		codechars8 = { "M", "W", "m", "w", "¤", "¶", "Ø", "ø", "Ł" }
		codechars9 = { "&", "@", "©", "«", "®", "»" }
		codechars10 = { "Æ", "æ", "Œ", "œ" }
		function randomchar(arr)
			return {
				n = G.UIT.O,
				config = {
					object = DynaText({
						string = arr,
						colours = { G.C.BLACK },
						pop_in_rate = 9999999,
						silent = true,
						random_element = true,
						pop_delay = 0.1,
						scale = 0.4,
						min_cycle_time = 0,
					}),
				},
			}
		end

		--Run - don't open packs in shop
		local gfco = G.FUNCS.can_open
		G.FUNCS.can_open = function(e)
			if G.GAME.USING_RUN then
				e.config.colour = G.C.UI.BACKGROUND_INACTIVE
				e.config.button = nil
			else
				gfco(e)
			end
		end
		local gfts = G.FUNCS.toggle_shop
		G.FUNCS.toggle_shop = function(e)
			gfts(e)
			if G.GAME.USING_RUN then
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0.5,
					func = function()
						G.GAME.USING_RUN = false
						G.GAME.USING_CODE = false
						return true
					end,
				}))
				local hand_count = #G.cry_runarea.cards
				for i = 1, hand_count do
					draw_card(G.cry_runarea, G.hand, i * 100 / hand_count, "up", true)
				end
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0.5,
					func = function()
						G.cry_runarea:remove()
						G.cry_runarea = nil
						G.STATE = G.STATES.SELECTING_HAND
						return true
					end,
				}))
			end
		end
		local gus = Game.update_shop
		function Game:update_shop(dt)
			gus(self, dt)
			if G.GAME.USING_RUN and G.STATE_COMPLETE and G.GAME.RUN_STATE_COMPLETE < 60 then
				G.shop.alignment.offset.y = -5.3
				G.GAME.RUN_STATE_COMPLETE = G.GAME.RUN_STATE_COMPLETE + 1
			end
		end
		local guis = G.UIDEF.shop
		function G.UIDEF.shop()
			local ret = guis()
			if G.GAME.USING_RUN then
				G.SHOP_SIGN:remove()
				G.SHOP_SIGN = {
					remove = function()
						return true
					end,
					alignment = { offset = { y = 0 } },
				}
			end
			return ret
		end
		--Pointer Patches
		local upd = Game.update
		cry_pointer_dt = 0
		function Game:update(dt)
			upd(self, dt)
			cry_pointer_dt = cry_pointer_dt + dt
			if G.P_CENTERS and G.P_CENTERS.c_cry_pointer and cry_pointer_dt > 0.5 then
				cry_pointer_dt = 0
				local obj = G.P_CENTERS.c_cry_pointer
				obj.pos.x = (obj.pos.x == 4) and 5 or 4
			end
			if not G.OVERLAY_MENU and not G.CHOOSE_CARD and G.GAME.USING_POINTER then
				G.CHOOSE_CARD = UIBox({
					definition = create_UIBox_pointer(card),
					config = {
						align = "cm",
						offset = { x = 0, y = 10 },
						major = G.ROOM_ATTACH,
						bond = "Weak",
						instance_type = "POPUP",
					},
				})
				G.CHOOSE_CARD.alignment.offset.y = 0
				G.ROOM.jiggle = G.ROOM.jiggle + 1
				G.CHOOSE_CARD:align_to_major()
			end
		end
		local yc = G.FUNCS.your_collection
		G.FUNCS.your_collection = function(e)
			if G.CHOOSE_CARD then
				G.CHOOSE_CARD:remove()
				G.CHOOSE_CARD = nil
			end
			yc(e)
		end
		--HOOK:// patches
		local cj = Card.calculate_joker
		function Card:calculate_joker(context)
			local ret, trig = cj(self, context)
			if
				(ret or trig)
				and self.ability.cry_hooked
				and not context.post_trigger
				and not context.cry_hook
				and not context.retrigger_joker_check
				and not context.megatrigger_check
			then
				context.cry_hook = true
				for i = 1, #G.jokers.cards do
					if G.jokers.cards[i].sort_id == self.hook_id then
						card_eval_status_text(
							G.jokers.cards[i],
							"extra",
							nil,
							nil,
							nil,
							{ message = localize("cry_hooked_ex"), colour = G.C.SET.Code }
						)
						cj(G.jokers.cards[i], context)
						--I tried a few things to get the color of messages to be green from the other joker, but they haven't worked :(
					end
				end
				context.cry_hook = nil
			end
			return ret, trig
		end
		--Encoded Deck patches
		local Backapply_to_runRef = Back.apply_to_run
		function Back.apply_to_run(self)
			Backapply_to_runRef(self)
			if self.effect.config.cry_encoded then
				G.E_MANAGER:add_event(Event({
					func = function()
						if G.jokers then
							local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_cry_CodeJoker")
							card:add_to_deck()
							card:start_materialize()
							G.jokers:emplace(card)
							local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_cry_copypaste")
							card:add_to_deck()
							card:start_materialize()
							G.jokers:emplace(card)
							return true
						end
					end,
				}))
			end
			if self.effect.config.cry_encoded_downside then
				G.GAME.joker_rate = 0
				G.GAME.planet_rate = 0
				G.GAME.tarot_rate = 0
				G.GAME.code_rate = 1e100
			end
		end
	end,
	items = code_cards,
}
