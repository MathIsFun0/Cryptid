local cotton_candy = {
	object_type = "Joker",
	key = "cotton_candy",
	pos = { x = 2, y = 0 },
	rarity = "cry_candy",
	cost = 10,
	atlas = "atlasspooky",
	blueprint_compat = true,
	eternal_compat = false,
	perishable_compat = false,
	calculate = function(self, card, context)
		if context.selling_self then
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] == card then
					if i > 1 then
						G.jokers.cards[i-1]:set_edition{negative = true}
					end
					if i < #G.jokers.cards then
						G.jokers.cards[i+1]:set_edition{negative = true}
					end
				end
			end
		end
	end
}
local wrapped = {
	object_type = "Joker",
	key = "wrapped",
	pos = { x = 5, y = 0 },
	rarity = "cry_candy",
	cost = 10,
	atlas = "atlasspooky",
	eternal_compat = false,
	perishable_compat = false,
	immune_to_chemach = true,
	config = {extra = {rounds = 2}},
	loc_vars = function(self, info_queue, center)
		info_queue[#info_queue + 1] = { set = "Other", key = "food_jokers" }
		return { vars = { center.ability.extra.rounds } }
	end,
	calculate = function(self, card, context)
		if
			context.end_of_round
			and not context.blueprint
			and not context.individual
			and not context.repetition
			and not context.retrigger_joker
		then
			card.ability.extra.rounds = card.ability.extra.rounds - 1
			if card.ability.extra.rounds > 0 then
				return {
					message = { localize("cry_minus_round") },
					colour = G.C.FILTER,
				}
			else
				G.E_MANAGER:add_event(Event({
					func = function()
						play_sound("tarot1")
						card.T.r = -0.2
						card:juice_up(0.3, 0.4)
						card.states.drag.is = true
						card.children.center.pinch.x = true
						G.E_MANAGER:add_event(Event({
							trigger = "after",
							delay = 0.3,
							blockable = false,
							func = function()
								G.jokers:remove_card(card)
								card:remove()
								card = nil
								return true
							end,
						}))
						return true
					end,
				}))
				local card = create_card(
					"Joker",
					G.jokers,
					nil,
					nil,
					nil,
					nil,
					pseudorandom_element(Cryptid.food, pseudoseed("cry_wrapped"))
				)
				card:add_to_deck()
				G.jokers:emplace(card)
				return {
					message = localize("k_extinct_ex"),
					colour = G.C.FILTER,
				}
			end
		end
	end,
}
local choco_dice = {
	object_type = "Joker",
	key = "chocolate_dice",
	pos = { x = 1, y = 0 },
	rarity = 3,
	cost = 10,
	atlas = "atlasspooky",
	config = {extra = {roll = 0}},
	immutable = true,
	loc_vars = function(self, info_queue, center)
		if not center then --tooltip
		elseif not center.added_to_deck then
			for i = 1, 10 do
				info_queue[#info_queue + 1] = { set = "Other", key = "ev_cry_choco"..i }
			end
		else
			SMODS.Events["ev_cry_choco"..center.ability.extra.roll]:loc_vars(info_queue, center)
		end
		return { vars = { not center and "None" or center.ability.extra.roll == 0 and "None" or center.ability.extra.roll } }
	end,
	calculate = function(self, card, context)
		if context.end_of_round and not context.individual and not context.repetition and not context.blueprint and not context.retrigger_joker and G.GAME.blind.boss then
			--todo: check if duplicates of event are already started/finished
			SMODS.Events["ev_cry_choco"..card.ability.extra.roll]:finish()
			card.ability.extra.roll = roll_dice("cry_choco", 1, 10, {ignore_value = card.ability.extra.roll})
			SMODS.Events["ev_cry_choco"..card.ability.extra.roll]:start()
			return {
				message = tostring(card.ability.extra.roll),
				colour = G.C.GREEN
			}
		end
	end,
}
local choco_base_event = {
	object_type = "Event",
	key = "choco0"
}
local choco1 = {
	object_type = "Event",
	key = "choco1",
	loc_vars = function(self, info_queue, center)
		info_queue[#info_queue + 1] = { set = "Other", key = self.key } --todo specific_vars
		info_queue[#info_queue + 1] = { set = "Other", key = "cry_flickering_desc", specific_vars = {5} }
		info_queue[#info_queue + 1] = { set = "Joker", key = "j_cry_ghost", specific_vars = {G.GAME.probabilities.normal or 1,2,6}}
	end,
	start = function(self)
		G.GAME.events[self.key] = true
		local areas = {"jokers","deck","hand","play","discard"}
		for k, v in pairs(areas) do
			for i = 1, #G[v].cards do
				if pseudorandom(pseudoseed("cry_choco_possession")) < G.GAME.probabilities.normal / 3 then
					SMODS.Stickers.cry_flickering:apply(G[v].cards[i], true)
				end
			end
		end
		--create a ghost
		local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_cry_ghost")
		card:add_to_deck()
		G.jokers:emplace(card)
	end
}
local choco2 = {
	object_type = "Event",
	key = "choco2",
	--everything here is done with lovely patches or hooks, search for ev_cry_choco2
	calculate = function(self, context)
		if context.cash_out then
			G.GAME.current_round.rerolled = false
		end
	end
}
local choco3 = {
	object_type = "Event",
	key = "choco3",
	start = function(self)
		if not G.GAME.events[self.key] then
			G.GAME.events[self.key] = {potions = {}}
		end
		for i = 1, 3 do
			local card = create_card("Unique", G.consumeables, nil, nil, nil, nil, "c_cry_potion")
			card:add_to_deck()
			card.ability.random_event = pseudorandom(pseudoseed("cry_choco_witch"),1,3) --note: must be changed whenever new potion effects are added
			G.consumeables:emplace(card)
		end
	end,
	loc_vars = function(self, info_queue, center)
		info_queue[#info_queue + 1] = { set = "Other", key = self.key } --todo specific_vars
		info_queue[#info_queue + 1] = { set = "Unique", key = "c_cry_potion" } -- bugged rn
	end,
	finish = function(self)
		--Reverse all potion effects
		if G.GAME.events[self.key].potions[2] then
			G.GAME.starting_params.ante_scaling = G.GAME.starting_params.ante_scaling / (1.15^G.GAME.events[self.key].potions[2])
		end
		if G.GAME.events[self.key].potions[3] then
            G.GAME.round_resets.hands = G.GAME.round_resets.hands + G.GAME.events[self.key].potions[3]
            ease_hands_played(G.GAME.events[self.key].potions[3])
            G.GAME.round_resets.discards = G.GAME.round_resets.discards + G.GAME.events[self.key].potions[3]
            ease_discard(G.GAME.events[self.key].potions[3])
		end
		G.GAME.events[self.key] = nil
	end,
	calculate = function(self, context)
		--bug: if this event finishes and starts, every potion gets instantly destroyed
		--bug: crashes if all 3 are used on blind skip
		if context.pre_jokers and (context.skip_blind or (context.end_of_round and not context.individual and not context.repetition)) and not context.blueprint and not context.retrigger_joker then
			local num_potions = 0
			for i = 1, #G.consumeables.cards do
				if G.consumeables.cards[i].config.center.key == "c_cry_potion" then
					num_potions = num_potions+1
				end
			end
			if num_potions < 3 then
				G.E_MANAGER:add_event(Event({
					func = function()
						for i = #G.consumeables.cards, 1, -1 do
							if G.consumeables.cards[i].config.center.key == "c_cry_potion" then
								G.consumeables.cards[i]:start_dissolve()
							end
						end
						return true
					end
				}))
			else
				--these animations are still a bit goofy, idk why
				G.E_MANAGER:add_event(Event({
					func = function()
						for i = #G.consumeables.cards, 1, -1 do
							if G.consumeables.cards[i].config.center.key == "c_cry_potion" then
								G.consumeables.cards[i].config.center:use(G.consumeables.cards[i],G.consumeables)
								G.consumeables.cards[i]:start_dissolve()
							end
						end
						return true
					end
				}))
			end
		end
	end
	--todo: loc_vars potions
}
local potion = {
	object_type = "Consumable",
	set = "Unique",
	key = "potion",
	name = "cry-Potion",
	pos = { x = 0, y = 1 },
	config = { random_event = 1 },
	cost = 4,
	no_doe = true,
	no_ccd = true,
	immutable = true,
	atlas = "atlasspooky",
	can_use = function(self, card)
		return true
	end,
	use = function(self, card, area, copier)
		G.GAME.events.ev_cry_choco3.potions[card.ability.random_event] = (G.GAME.events.ev_cry_choco3.potions[card.ability.random_event] or 0)+1
		--Announce event
		G.E_MANAGER:add_event(Event({
			func = function()
				play_sound("timpani", 1)
				attention_text({
					scale = 1.4,
					text = localize("cry_potion"..card.ability.random_event),
					hold = 2,
					align = "cm",
					offset = { x = 0, y = -2.7 },
					major = G.play,
				})
				return true
			end
		}))
		if card.ability.random_event == 1 then -- -1 to all hand levels
			update_hand_text(
				{ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 },
				{ handname = localize("k_all_hands"), chips = "...", mult = "...", level = "" }
			)
			update_hand_text({ delay = 0 }, { mult = "-", StatusText = true })
			update_hand_text({ delay = 0 }, { chips = "-", StatusText = true })
			update_hand_text({ sound = "button", volume = 0.7, pitch = 0.9, delay = 0 }, { level = "+1" })
			delay(1.3)
			for k, v in pairs(G.GAME.hands) do
				level_up_hand(used_consumable, k, true, -1)
			end
			update_hand_text(
				{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
				{ mult = 0, chips = 0, handname = "", level = "" }
			)
		end
		if card.ability.random_event == 2 then -- X1.15 blind size
			G.GAME.starting_params.ante_scaling = G.GAME.starting_params.ante_scaling * 1.15
		end
		if card.ability.random_event == 3 then -- -1 Hand and Discard
            G.GAME.round_resets.hands = G.GAME.round_resets.hands - 1
            ease_hands_played(-1)
            G.GAME.round_resets.discards = G.GAME.round_resets.discards - 1
            ease_discard(-1)
		end
		delay(3)
	end,
}
local choco4 = { --lunar abyss
	object_type = "Event",
	key = "choco4",
	calculate = function(self, context)
		if context.pre_jokers and context.before and not context.repetition and not context.blueprint and not context.retrigger_joker then
			for i = 1, #G.play.cards do
				if pseudorandom(pseudoseed("cry_choco_lunar")) < G.GAME.probabilities.normal / 4 then
					local faces = {}
					for _, v in ipairs(SMODS.Rank.obj_buffer) do
						local r = SMODS.Ranks[v]
						if r.face then table.insert(faces, r) end
					end
					local _rank = pseudorandom_element(faces, pseudoseed('cry_choco_lunar_create')).card_key
					G.play.cards[i]:set_base(G.P_CARDS["C_".._rank])
				end
			end
		end
		if context.post_jokers and context.joker_main and not context.blueprint_card and not context.retrigger_joker then
			local faces = 0
			for i = 1, #G.play.cards do
				if G.play.cards[i]:is_face() then
					faces = faces + 1
				end
			end
			if faces > 1 then
				mult = mult / faces
				update_hand_text({ delay = 0 }, { mult = mult, chips = hand_chips })
			end
		end
	end
}
local choco5 = { --bloodsucker
	object_type = "Event",
	key = "choco5",
	calculate = function(self, context)
		if context.pre_jokers and context.before and not context.repetition and not context.blueprint and not context.retrigger_joker then
			for k, v in ipairs(context.scoring_hand) do
				if v.config.center ~= G.P_CENTERS.c_base and not v.debuff and not v.vampired then 
					v:set_ability(G.P_CENTERS.c_base, nil, true)
					v.vampired = true
					G.E_MANAGER:add_event(Event({
						func = function()
							v:juice_up()
							v.vampired = nil
							return true
						end
					})) 
				end
			end
		end
		if context.post_jokers and context.destroying_card and not context.blueprint and not context.retrigger_joker then
			if context.destroying_card:is_suit("Hearts") or context.destroying_card:is_suit("Diamonds") then
				if pseudorandom(pseudoseed("cry_choco_blood")) < G.GAME.probabilities.normal / 3 then
					context.destroying_card.will_shatter = true
					G.E_MANAGER:add_event(Event({
						func = function()
							context.destroying_card:start_dissolve()
							return true
						end
					}))
				end
			end
		end
	end
}
local choco6 = { --please take one
	object_type = "Event",
	key = "choco6",
	calculate = function(self, context)
		if context.pre_cash then
			G.E_MANAGER:add_event(Event({
				func = function()
					local key = get_pack('cry_take_one').key
					local card = Card(G.play.T.x + G.play.T.w/2 - G.CARD_W*1.27/2,
					G.play.T.y + G.play.T.h/2-G.CARD_H*1.27/2, G.CARD_W*1.27, G.CARD_H*1.27, G.P_CARDS.empty, G.P_CENTERS[key], {bypass_discovery_center = true, bypass_discovery_ui = true})
					card.cost = 0
					card.from_tag = true
					G.FUNCS.use_card({config = {ref_table = card}})
					card:start_materialize()
					pack_opened = true
					return true
				end
			}))
		end
		if context.setting_blind then
			pack_opened = nil
		end
	end
}
local choco7 = {
	object_type = "Event",
	key = "choco7",
	start = function(self)
		G.GAME.events[self.key] = true
		for i = 1, 3 do
			local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_cry_trick_or_treat")
			card:add_to_deck()
			G.jokers:emplace(card)
		end
		local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_cry_candy_basket")
		card:add_to_deck()
		G.jokers:emplace(card)
	end,
	calculate = function(self, context)
		if context.start_shop then
			local tag = Tag("tag_cry_rework")
			if not tag.ability then
				tag.ability = {}
			end
			tag.ability.rework_key = "j_cry_trick_or_treat"
			tag.ability.rework_edition = "e_base"
			add_tag(tag)
		end
	end
}
local choco8 = {
	object_type = "Event",
	key = "choco8",
	calculate = function(self, context)
		if context.cash_out then
			for i = 1, G.GAME.current_round.hands_left do
				local card = create_card("Joker", G.jokers, nil, "cry_candy", nil, nil, nil, "cry_choco8")
				card:add_to_deck()
				G.jokers:emplace(card)
			end
		end
	end
}
local choco9 = {
	object_type = "Event",
	key = "choco9",
	start = function(self)
		G.GAME.events[self.key] = true
		ease_dollars(10) --will already be X2 = 20
	end,
}
local ed = ease_dollars
function ease_dollars(mod, instant)
	if mod == 0 then return end
	if G.GAME.events.ev_cry_choco9 and mod > 0 then
		mod = mod * 2
	end
	return ed(mod, instant)
end
local choco10 = { --revered antique
	object_type = "Event",
	key = "choco10"
	--everything here is lovely patches or hooks
}
local spy = {
	object_type = "Joker",
	key = "spy",
	pos = { x = 0, y = 0 },
	rarity = 1,
	cost = 8,
	atlas = "atlasspooky",
	config = {x_mult = 0.5, extra = {secret_card = "", revealed = false}},
	immutable = true,
	loc_vars = function(self, info_queue, center)
		return { vars = { localize({ type = "name_text", set = "Joker", key = center.ability and center.ability.extra and center.ability.extra.secret_card }), center.ability.x_mult } }
	end,
	update = function(self, card, front)
		if card.ability.extra.secret_card == "" then
			secret_card = pseudorandom_element(G.P_CENTER_POOLS.Joker, pseudoseed("cry_spy" .. (card.area and card.area.config.collection and "_collection" or "")))
			card.ability.extra.secret_card = secret_card.key
			if not (card.area and card.area.config.collection) then
				card.pos = secret_card.pos
				card.config.center.rarity = secret_card.rarity
				card.cost = secret_card.cost
				card:set_sprites(G.P_CENTERS[card.ability.extra.secret_card])
				card.children.center:set_sprite_pos(secret_card.pos)
			end
		end
		if card.area and card.area.config.collection then
			card.config.center.rarity = "cry_cursed"
		end
	end,
	add_to_deck = function(self, card, from_debuff)
		G.jokers.config.card_limit = G.jokers.config.card_limit + 1
        card.ability.perishable = true
        card.ability.perish_tally = G.GAME.perishable_rounds
		card.config.center.rarity = "cry_cursed"
		card:set_sprites(card.config.center)
		card.ability.extra.revealed = true
	end,
	remove_from_deck = function(self, card, from_debuff)
		G.jokers.config.card_limit = G.jokers.config.card_limit - 1
	end,
	calculate = function(self, card, context)
		if context.cardarea == G.jokers and not context.before and not context.after then
			return {
				message = localize({ type = "variable", key = "a_xmult", vars = { card.ability.x_mult } }),
				Xmult_mod = card.ability.x_mult,
				colour = G.C.MULT,
			}
		end
	end,
	generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
		if card.ability.extra.revealed or (card.area and card.area.config.collection) then
			if card.area and card.area.config.collection then
				card:update(0.016)
			end
			local target = {
				type = 'descriptions',
				key = self.key,
				set = self.set,
				nodes = desc_nodes,
				vars =
					specific_vars or {}
			}
			local res = {}
			if self.loc_vars and type(self.loc_vars) == 'function' then
				res = self:loc_vars(info_queue, card) or {}
				target.vars = res.vars or target.vars
				target.key = res.key or target.key
				target.set = res.set or target.set
			end
			if desc_nodes == full_UI_table.main and not full_UI_table.name then
				full_UI_table.name = localize { type = 'name', set = target.set, key = target.key, nodes = full_UI_table.name }
			elseif desc_nodes ~= full_UI_table.main and not desc_nodes.name then
				desc_nodes.name = localize{type = 'name_text', key = target.key, set = target.set } 
			end
			if specific_vars and specific_vars.debuffed and not res.replace_debuff then
				target = { type = 'other', key = 'debuffed_' ..
				(specific_vars.playing_card and 'playing_card' or 'default'), nodes = desc_nodes }
			end
			if res.main_start then
				desc_nodes[#desc_nodes + 1] = res.main_start
			end
			localize(target)
			if res.main_end then
				desc_nodes[#desc_nodes + 1] = res.main_end
			end
		else
			local secret_card = cry_deep_copy(G.P_CENTERS[card.ability.extra.secret_card])
			secret_card.ability = secret_card.config
			local target = {
				type = 'descriptions',
				key = secret_card.key,
				set = secret_card.set,
				nodes = desc_nodes,
				vars =
					specific_vars or {}
			}
			local res = {}
			if secret_card.loc_vars and type(secret_card.loc_vars) == 'function' then
				res = secret_card:loc_vars(info_queue, secret_card) or {}
				target.vars = res.vars or target.vars
				target.key = res.key or target.key
				target.set = res.set or target.set
			end
			if desc_nodes == full_UI_table.main and not full_UI_table.name then
				full_UI_table.name = localize { type = 'name', set = target.set, key = target.key, nodes = full_UI_table.name }
			elseif desc_nodes ~= full_UI_table.main and not desc_nodes.name then
				desc_nodes.name = localize{type = 'name_text', key = target.key, set = target.set } 
			end
			if specific_vars and specific_vars.debuffed and not res.replace_debuff then
				target = { type = 'other', key = 'debuffed_' ..
				(specific_vars.playing_card and 'playing_card' or 'default'), nodes = desc_nodes }
			end
			if res.main_start then
				desc_nodes[#desc_nodes + 1] = res.main_start
			end
			localize(target)
			if res.main_end then
				desc_nodes[#desc_nodes + 1] = res.main_end
			end
		end
	end
}
local flickering = {
	object_type = "Sticker",
	atlas = "sticker",
	pos = { x = 5, y = 4 }, --placeholder
	key = "flickering",
	badge_colour = HEX("747474"),
	loc_vars = function(self, info_queue, card)
		return { vars = { 5, card.ability.flick_tally } }
	end,
	apply = function(self, card, val)
		if not card.ability.eternal or G.GAME.modifiers.cry_sticker_sheet then
			card.ability[self.key] = val
			if card.ability[self.key] then card.ability.flick_tally = 5 end
		end
	end,
	calculate = function(self, card, context)
		if card.ability.set == "Joker" then
			if context.post_trigger and context.other_joker == card then
				card.ability.flick_tally = card.ability.flick_tally - 1
				if card.ability.flick_tally > 0 then
					card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize{type='variable',key='a_remaining',vars={card.ability.flick_tally}},colour = G.C.FILTER, delay = 0.45})
				else
					card.will_shatter = true
					G.E_MANAGER:add_event(Event({
						func = function()
							card:start_dissolve()
							return true
						end
					}))
				end
			end
		elseif context.from_playing_card and not card.debuff and not context.repetition_only and context.ret then
			context.ret.jokers = nil
			if next(context.ret) ~= nil then
				card.ability.flick_tally = card.ability.flick_tally - 1
				if card.ability.flick_tally > 0 then
					card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize{type='variable',key='a_remaining',vars={card.ability.flick_tally}},colour = G.C.FILTER, delay = 0.45})
				else
					card.will_shatter = true
					G.E_MANAGER:add_event(Event({
						func = function()
							card:start_dissolve()
							return true
						end
					}))
				end
			end
		end
	end,
}
local trick_or_treat = {
	object_type = "Joker",
	key = "trick_or_treat",
	pos = { x = 2, y = 1 },
	rarity = 2,
	cost = 5,
	atlas = "atlasspooky",
	blueprint_compat = true,
	eternal_compat = false,
	perishable_compat = false,
	calculate = function(self, card, context)
		if context.selling_self then
			if pseudorandom(pseudoseed("cry_trick_or_treat")) < 3/4*G.GAME.probabilities.normal then
				for i = 1, 2 do
					local card = create_card("Joker", G.jokers, nil, "cry_candy", nil, nil, nil, "cry_trick_candy")
					card:add_to_deck()
					G.jokers:emplace(card)
				end
			else
				local card = create_card("Joker", G.jokers, nil, "cry_cursed", nil, nil, nil, "cry_trick_curse")
				card:add_to_deck()
				G.jokers:emplace(card)
			end
		end
	end,
	loc_vars = function(self, info_queue, center)
		return { vars = { 3 * G.GAME.probabilities.normal, 4 } }
	end,
}
local candy_basket = {
	object_type = "Joker",
	key = "candy_basket",
	pos = { x = 4, y = 0 },
	rarity = 2,
	cost = 6,
	atlas = "atlasspooky",
	blueprint_compat = false,
	eternal_compat = false,
	perishable_compat = false,
	config = {extra = {candies = 0, candy_mod = 0.5, candy_boss_mod = 2}},
	calculate = function(self, card, context)
		if context.selling_self then
			for i = 1, math.min(100, card.ability.extra.candies) do
				local card = create_card("Joker", G.jokers, nil, "cry_candy", nil, nil, nil, "cry_candy_basket")
				card:add_to_deck()
				G.jokers:emplace(card)
			end
		end
		if context.end_of_round and not context.individual and not context.repetition then
			candy_pre = math.floor(card.ability.extra.candies)
			card.ability.extra.candies = card.ability.extra.candies + card.ability.extra.candy_mod
			if G.GAME.blind.boss then
				card.ability.extra.candies = card.ability.extra.candies + card.ability.extra.candy_boss_mod
			end
			if math.floor(card.ability.extra.candies) > candy_pre then
				card_eval_status_text(card, "extra", nil, nil, nil, { message = localize("k_upgrade_ex") })
			end
		end
	end,
	loc_vars = function(self, info_queue, center)
		return { vars = { math.floor(center.ability.extra.candies), 2*center.ability.extra.candy_mod, center.ability.extra.candy_boss_mod} }
	end,
}
local blacklist = {
	object_type = "Joker",
	key = "blacklist",
	pos = { x = 0, y = 0 },
	rarity = "cry_cursed",
	cost = 0,
	atlas = "placeholders",
	config = {extra = {blacklist = {}}},
	blueprint_compat = false,
	eternal_compat = false,
	perishable_compat = false,
	calculate = function(self, card, context)
		if context.joker_main then
			local blacklist = false
			for i = 1, #G.play.cards do
				if G.play.cards[i]:get_id() == card.ability.extra.blacklist.id then
					blacklist = true
					break
				end
			end
			for i = 1, #G.hand.cards do
				if G.hand.cards[i]:get_id() == card.ability.extra.blacklist.id then
					blacklist = true
					break
				end
			end
			if blacklist then
				hand_chips = to_big(0)
				mult = to_big(0)
				update_hand_text({ delay = 0 }, { mult = mult, chips = hand_chips })
				return {
					message = localize("k_nope_ex"),
					colour = G.C.BLACK,
				}
			else
				for i = 1, #G.discard.cards do
					if G.discard.cards[i]:get_id() == card.ability.extra.blacklist.id then
						blacklist = true
						break
					end
				end
				for i = 1, #G.deck.cards do
					if G.deck.cards[i]:get_id() == card.ability.extra.blacklist.id then
						blacklist = true
						break
					end
				end
				if not blacklist then
					G.E_MANAGER:add_event(Event({
						func = function()
							card:start_dissolve()
							return true
						end
					}))
				end
			end
		end
	end,
	add_to_deck = function(self, card, from_debuff)
		card.ability.extra.blacklist = pseudorandom_element(SMODS.Ranks, pseudoseed("cry_blacklist"..G.GAME.round_resets.ante))
	end,
	loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.blacklist and center.ability.extra.blacklist.key or "Ace" } }
	end,
}
local ghost = {
	object_type = "Joker",
	key = "ghost",
	pos = { x = 3, y = 0 },
	config = {extra = {possess_rate = 2, destroy_rate = 6}},
	rarity = "cry_cursed",
	cost = 0,
	atlas = "atlasspooky",
	blueprint_compat = false,
	eternal_compat = false,
	perishable_compat = false,
	calculate = function(self, card, context)
		if context.end_of_round and not context.individual and not context.repetition and not context.blueprint and not context.retrigger_joker then
			if pseudorandom(pseudoseed("cry_ghost_destroy")) < G.GAME.probabilities.normal/card.ability.extra.destroy_rate then
				G.E_MANAGER:add_event(Event({
					func = function()
						card:start_dissolve()
						for i = 1, #G.jokers.cards do
							if G.jokers.cards[i].ability.cry_possessed then
								if G.jokers.cards[i].ability.eternal then
									G.jokers.cards[i].ability.cry_possessed = nil
								else
									G.jokers.cards[i]:start_dissolve()
								end
							end
						end
						return true
					end
				}))
				return
			end
			--todo: let multiple ghosts possess multiple jokers
			if pseudorandom(pseudoseed("cry_ghost_possess")) < G.GAME.probabilities.normal/card.ability.extra.possess_rate then
				for i = 1, #G.jokers.cards do
					G.jokers.cards[i].ability.cry_possessed = nil
				end
				local eligible_cards = {}
				for i = 1, #G.jokers.cards do
					if G.jokers.cards[i].config.center.key ~= "j_cry_ghost" then
						table.insert(eligible_cards, i)
					end
				end
				G.jokers.cards[pseudorandom_element(eligible_cards,pseudoseed("cry_ghost_possess_choice"))].ability.cry_possessed = true
				return
			end
		end
	end,
	loc_vars = function(self, info_queue, center)
		info_queue[#info_queue + 1] = { set = "Other", key = "cry_possessed"}
		return { vars = { G.GAME.probabilities.normal or 1, center.ability.extra.possess_rate, center.ability.extra.destroy_rate } }
	end,
}
local possessed = {
	object_type = "Sticker",
	atlas = "sticker",
	pos = { x = 2, y = 2 }, --todo
	key = "possessed",
	no_sticker_sheet = true,
	badge_colour = HEX("aaaaaa"),
}
local spookydeck = {
	object_type = "Back",
	key = "spooky",
	config = { cry_spooky = true, cry_curse_rate = 0.25 },
	pos = { x = 3, y = 1 },
	atlas = "atlasspooky",
}
local candy_dagger = {
    object_type = "Joker",
    name = "cry-Candy Dagger",
    key = "candy_dagger",
    pos = { x = 1, y = 0 },
    rarity = 2,
    cost = 8,
    atlas = "placeholders",
    blueprint_compat = true,
    calculate = function(self, card, context)
        local my_pos = nil
		for i = 1, #G.jokers.cards do
			if G.jokers.cards[i] == card then
				my_pos = i
				break
			end
		end
		if
			context.setting_blind
			and not (context.blueprint_card or self).getting_sliced
			and my_pos
			and G.jokers.cards[my_pos - 1]
			and not G.jokers.cards[my_pos - 1].ability.eternal
			and not G.jokers.cards[my_pos - 1].getting_sliced
		then
			local sliced_card = G.jokers.cards[my_pos - 1]
			sliced_card.getting_sliced = true
			if sliced_card.config.center.rarity == "cry_exotic" then
				check_for_unlock({ type = "what_have_you_done" })
			end
			G.GAME.joker_buffer = G.GAME.joker_buffer - 1
			G.E_MANAGER:add_event(Event({
				func = function()
					G.GAME.joker_buffer = 0
					card:juice_up(0.8, 0.8)
					sliced_card:start_dissolve({ HEX("57ecab") }, nil, 1.6)
					play_sound("slice1", 0.96 + math.random() * 0.08)
					return true
				end,
			}))
			card_eval_status_text(
				card,
				"extra",
				nil,
				nil,
				nil,
				{
					message = localize({
						type = "variable",
						key = "a_candy",
						vars = { 1 },
					}),
					colour = G.C.RARITY["cry_candy"],
					no_juice = true,
				}
			)
			local card = create_card("Joker", G.jokers, nil, "cry_candy", nil, nil, nil, "cry_candy_dagger")
			card:add_to_deck()
			G.jokers:emplace(card)
			return nil, true
		end
    end,
}
local candy_cane = {
    object_type = "Joker",
    key = "candy_cane",
    pos = { x = 1, y = 1 },
    rarity = "cry_candy",
	config = { extra = { rounds = 11, dollars = 4 } },
    cost = 10,
    atlas = "atlasspooky",
    blueprint_compat = true,
	loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.rounds, center.ability.extra.dollars } }
	end,
    calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if not context.other_card.candy_caned then
				context.other_card.candy_caned = true
				G.E_MANAGER:add_event(Event({
					func = function()
						context.other_card.candy_caned = nil
						return true
					end
				})) 
			else
				ease_dollars(card.ability.extra.dollars)
			end
		end
        if
			context.end_of_round
			and not context.blueprint
			and not context.individual
			and not context.repetition
			and not context.retrigger_joker
		then
			card.ability.extra.rounds = card.ability.extra.rounds - 1
			if card.ability.extra.rounds > 0 then
				return {
					message = { localize("cry_minus_round") },
					colour = G.C.FILTER,
				}
			else
				G.E_MANAGER:add_event(Event({
					func = function()
						play_sound("tarot1")
						card.T.r = -0.2
						card:juice_up(0.3, 0.4)
						card.states.drag.is = true
						card.children.center.pinch.x = true
						G.E_MANAGER:add_event(Event({
							trigger = "after",
							delay = 0.3,
							blockable = false,
							func = function()
								G.jokers:remove_card(card)
								card:remove()
								card = nil
								return true
							end,
						}))
						return true
					end,
				}))
				return {
					message = localize("k_extinct_ex"),
					colour = G.C.FILTER,
				}
			end
		end
    end,
}

local candy_buttons = {
	object_type = "Joker",
    key = "candy_buttons",
	name = "cry-candybuttons",
    pos = { x = 0, y = 0 },
    rarity = "cry_candy",
	config = { extra = { rerolls = 15 } },
    cost = 10,
    atlas = "placeholders",
    blueprint_compat = true,
	loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.rerolls } }
	end,
	calculate = function(self, card, context)
		if context.reroll_shop and not context.blueprint then
			card.ability.extra.rerolls = card.ability.extra.rerolls - 1
			if card.ability.extra.rerolls <= 0 then
				G.E_MANAGER:add_event(Event({
					func = function()
						play_sound("tarot1")
						card.T.r = -0.2
						card:juice_up(0.3, 0.4)
						card.states.drag.is = true
						card.children.center.pinch.x = true
						G.E_MANAGER:add_event(Event({
							trigger = "after",
							delay = 0.3,
							blockable = false,
							func = function()
								G.jokers:remove_card(card)
								card:remove()
								card = nil
								return true
							end,
						}))
						return true
					end,
				}))
				return {
					message = localize("k_extinct_ex"),
					colour = G.C.FILTER,
				}
			end
			return nil, true
		end
	end,
	add_to_deck = function(self, card, from_debuff)
		--This makes the reroll immediately after obtaining free because the game doesn't do that for some reason
		G.GAME.current_round.free_rerolls = G.GAME.current_round.free_rerolls + 1
		calculate_reroll_cost(true)
	end,
	remove_from_deck = function(self, card, from_debuff)
		calculate_reroll_cost(true)
	end,
}

local jawbreaker = {
	object_type = "Joker",
    key = "jawbreaker",
    pos = { x = 0, y = 0 },
    rarity = "cry_candy",
    cost = 10,
    atlas = "placeholders",
    blueprint_compat = false,
	calculate = function(self, card, context)
		if context.end_of_round and not context.individual and not context.repetition and G.GAME.blind.boss and not context.blueprint_card and not context.retrigger_joker then
			for i = 1, #G.jokers.cards do
				if not Card.no(G.jokers.cards[i], "immune_to_chemach", true) and not Card.no(G.jokers.cards[i], "immutable", true) then
					cry_with_deck_effects(G.jokers.cards[i], function(card)
						cry_misprintize(card, { min = 2, max = 2 }, nil, true)
					end)
				end
			end
			G.E_MANAGER:add_event(Event({
				func = function()
					play_sound("tarot1")
					card.T.r = -0.2
					card:juice_up(0.3, 0.4)
					card.states.drag.is = true
					card.children.center.pinch.x = true
					G.E_MANAGER:add_event(Event({
						trigger = "after",
						delay = 0.3,
						blockable = false,
						func = function()
							G.jokers:remove_card(card)
							card:remove()
							card = nil
							return true
						end,
					}))
					return true
				end,
			}))
			return {
				message = localize("k_extinct_ex"),
				colour = G.C.FILTER,
			}
		end
	end,
	add_to_deck = function(self, card, from_debuff)
		calculate_reroll_cost(true)
	end,
	remove_from_deck = function(self, card, from_debuff)
		calculate_reroll_cost(true)
	end,
}
local mellowcreme = {
	object_type = "Joker",
    key = "mellowcreme",
    pos = { x = 0, y = 0 },
    rarity = "cry_candy",
    cost = 10,
    atlas = "placeholders",
	config = {extra = {sell_mult = 4}},
	loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.sell_mult } }
	end,
    blueprint_compat = true,
	calculate = function(self, card, context)
		if context.selling_self then
			for k, v in ipairs(G.consumeables.cards) do
				if v.set_cost then 
					v.ability.extra_value = (v.ability.extra_value or 0) + (math.max(1, math.floor(v.cost/2)) + (v.ability.extra_value or 0))*(card.ability.extra.sell_mult-1)
					v:set_cost()
				end
			end
		end
	end,
}
local brittle = {
	object_type = "Joker",
    key = "brittle",
    pos = { x = 5, y = 1 },
    rarity = "cry_candy",
    cost = 10,
    atlas = "placeholders",
	config = {extra = {rounds = 9}},
	loc_vars = function(self, info_queue, center)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_stone
		info_queue[#info_queue + 1] = G.P_CENTERS.m_gold
		info_queue[#info_queue + 1] = G.P_CENTERS.m_steel
		return { vars = { center.ability.extra.rounds } }
	end,
    blueprint_compat = true,
	calculate = function(self, card, context)
		if context.cardarea == G.jokers and context.before and not context.blueprint_card and not context.retrigger_joker then
			local _card = context.scoring_hand[#context.scoring_hand]
			if not _card.brittled then
				card.ability.extra.rounds = card.ability.extra.rounds - 1
				local enhancement = pseudorandom_element({"m_stone", "m_gold", "m_steel"}, pseudoseed("cry_brittle"))
				_card.brittled = true
				_card:set_ability(G.P_CENTERS[enhancement], nil, true)
				G.E_MANAGER:add_event(Event({
					func = function()
						_card:juice_up()
						_card.brittled = nil
						return true
					end
				})) 
				if card.ability.extra.rounds > 0 then
					return nil, true
				else
					G.E_MANAGER:add_event(Event({
						func = function()
							play_sound("tarot1")
							card.T.r = -0.2
							card:juice_up(0.3, 0.4)
							card.states.drag.is = true
							card.children.center.pinch.x = true
							G.E_MANAGER:add_event(Event({
								trigger = "after",
								delay = 0.3,
								blockable = false,
								func = function()
									G.jokers:remove_card(card)
									card:remove()
									card = nil
									return true
								end,
							}))
							return true
						end,
					}))
					return {
						message = localize("k_extinct_ex"),
						colour = G.C.FILTER,
					}
				end
			end
		end
	end
}
local monopoly_money = {
	object_type = "Joker",
	key = "monopoly_money",
	name = "cry-Monopoly",
	pos = { x = 4, y = 1 },
	config = {extra = {fail_rate = 4}},
	rarity = "cry_cursed",
	cost = 0,
	atlas = "atlasspooky",
	blueprint_compat = false,
	eternal_compat = false,
	perishable_compat = false,
	calculate = function(self, card, context)
		if context.buying_card then
			if pseudorandom(pseudoseed("cry_monopoly")) < G.GAME.probabilities.normal/card.ability.extra.fail_rate then
				G.E_MANAGER:add_event(Event({
					func = function()
						context.card:start_dissolve()
						card_eval_status_text(card, 'extra', nil, nil, nil, {
							message = localize("k_nope_ex"),
							colour = G.C.BLACK,
						})
						return true
					end
				}))
			end
			return nil, true
		end
		if context.selling_self then
			G.E_MANAGER:add_event(Event({
				func = function()
					ease_dollars(math.floor(-0.5*G.GAME.dollars))
					return true
				end
			}))
			return nil, true
		end
	end,
	loc_vars = function(self, info_queue, center)
		return { vars = { G.GAME.probabilities.normal or 1, center.ability.extra.fail_rate} }
	end,
}
items = {
	cotton_candy,
	wrapped,
	choco_dice,
	choco_base_event,
	choco1,
	choco2,
	choco3,
	potion,
	choco4,
	choco5,
	choco6,
	choco7,
	choco8,
	choco9,
	choco10,
	spy,
	flickering,
	trick_or_treat,
	candy_basket,
	blacklist,
	ghost,
	possessed,
	spookydeck,
	candy_dagger,
	candy_cane,
	candy_buttons,
	jawbreaker,
	mellowcreme,
	brittle,
	monopoly_money
}
--order is temporary so we can more easily test these out
return { name = "Spooky", order = 1e300, init = function() 
	
	local sc = Card.set_cost
	function Card:set_cost()
		sc(self)
		if self.config and self.config.center and self.config.center.rarity == "cry_cursed" then
			self.sell_cost = 0
			self.sell_cost_label = 0
		end
	end
	
	--Really hacky patch to remove sell button for cursed jokers
	local G_UIDEF_use_and_sell_buttons_ref = G.UIDEF.use_and_sell_buttons
	function G.UIDEF.use_and_sell_buttons(card)
		local m = G_UIDEF_use_and_sell_buttons_ref(card)
		if card.area and card.area.config.type == 'joker' and card.config and card.config.center and card.config.center.rarity == "cry_cursed" and card.ability.name ~= "cry-Monopoly" then
			table.remove(m.nodes[1].nodes, 1)
		end
		if card.config and card.config.center and card.config.center.key == "c_cry_potion" then
			table.remove(m.nodes[1].nodes, 1)
		end
		return m
	end

	--track if rerolled
	local gfrs = G.FUNCS.reroll_shop
	G.FUNCS.reroll_shop = function(e)
		local ret = gfrs(e)
		G.GAME.current_round.rerolled = true
		return ret
	end
	local gfcr = G.FUNCS.can_reroll
	G.FUNCS.can_reroll = function(e)
		if G.GAME.events.ev_cry_choco2 and G.GAME.current_round.rerolled then
			e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        	e.config.button = nil
			return
		end
		return gfcr(e)
	end

	--candy gives $3
	local catd = Card.add_to_deck
	function Card:add_to_deck(debuff)
		if not debuff and self.config.center.rarity == "cry_candy" then
			if G.GAME.events.ev_cry_choco7 then
				ease_dollars(3)
			end
			if G.GAME.events.ev_cry_choco8 then
				local card = create_card(
					"Joker",
					G.jokers,
					nil,
					nil,
					nil,
					nil,
					pseudorandom_element(Cryptid.food, pseudoseed("cry_candy_rain"))
				)
				card:add_to_deck()
				G.jokers:emplace(card)
			end
		end
		return catd(self, debuff)
	end

	--antique can only be bought as last item
	local gfcb = G.FUNCS.can_buy
	function G.FUNCS.can_buy(e)
		if e.config.ref_table and e.config.ref_table.ability and e.config.ref_table.ability.cry_antique then
			if not (#G.shop_jokers.cards == 0 and #G.shop_booster.cards == 0 and #G.shop_vouchers.cards == 1) then
				e.config.colour = G.C.UI.BACKGROUND_INACTIVE
				e.config.button = nil
				return
			end
		end
		return gfcb(e)
	end

	local Backapply_to_runRef = Back.apply_to_run
		function Back.apply_to_run(self)
			Backapply_to_runRef(self)
			if self.effect.config.cry_spooky then
				G.GAME.modifiers.cry_spooky = true
				G.GAME.modifiers.cry_curse_rate = self.effect.config.cry_curse_rate	or 0.25
				G.E_MANAGER:add_event(Event({
					func = function()
						if G.jokers then
							local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_cry_chocolate_dice")
							card:add_to_deck()
							card:start_materialize()
							card:set_eternal(true)
							G.jokers:emplace(card)
							return true
						end
					end,
				}))
			end
		end
end, items = items }