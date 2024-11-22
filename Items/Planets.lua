local timantti = {
	object_type = "Consumable",
	set = "Planet",
	name = "cry-Timantti",
	key = "Timantti",
	pos = { x = 0, y = 2 },
	config = { hand_types = { "High Card", "Pair", "Two Pair" } },
	cost = 4,
	aurinko = true,
	atlas = "atlasnotjokers",
	order = 7,
	can_use = function(self, card)
		return true
	end,
	loc_vars = function(self, info_queue, center)
		local levelone = G.GAME.hands["High Card"].level or 1
		local leveltwo = G.GAME.hands["Pair"].level or 1
		local levelthree = G.GAME.hands["Two Pair"].level or 1
		local planetcolourone = G.C.HAND_LEVELS[math.min(levelone, 7)]
		local planetcolourtwo = G.C.HAND_LEVELS[math.min(leveltwo, 7)]
		local planetcolourthree = G.C.HAND_LEVELS[math.min(levelthree, 7)]
		if levelone == 1 or leveltwo == 1 or levelthree == 1 then --Level 1 colour is white (The background), so this sets it to black
			if levelone == 1 then
				planetcolourone = G.C.UI.TEXT_DARK
			end
			if leveltwo == 1 then
				planetcolourtwo = G.C.UI.TEXT_DARK
			end
			if levelthree == 1 then
				planetcolourthree = G.C.UI.TEXT_DARK
			end
		end
		return {
			vars = {
				localize("High Card", "poker_hands"),
				localize("Pair", "poker_hands"),
				localize("Two Pair", "poker_hands"),
				G.GAME.hands["High Card"].level,
				G.GAME.hands["Pair"].level,
				G.GAME.hands["Two Pair"].level,
				colours = { planetcolourone, planetcolourtwo, planetcolourthree },
			},
		}
	end,
	use = function(self, card, area, copier)
		suit_level_up(self, card, area, copier)
	end,
	bulk_use = function(self, card, area, copier, number)
		suit_level_up(self, card, area, copier, number)
	end,
	calculate = function(self, card, context)
		if
			G.GAME.used_vouchers.v_observatory
			and (
				context.scoring_name == "High Card"
				or context.scoring_name == "Pair"
				or context.scoring_name == "Two Pair"
			)
		then
			local value = G.P_CENTERS.v_observatory.config.extra
			return {
				message = localize({ type = "variable", key = "a_xmult", vars = { value } }),
				Xmult_mod = value,
			}
		end
	end,
}
local klubi = {
	object_type = "Consumable",
	set = "Planet",
	name = "cry-Klubi",
	key = "Klubi",
	pos = { x = 1, y = 2 },
	config = { hand_types = { "Three of a Kind", "Straight", "Flush" } },
	cost = 4,
	aurinko = true,
	atlas = "atlasnotjokers",
	order = 8,
	can_use = function(self, card)
		return true
	end,
	loc_vars = function(self, info_queue, center)
		local levelone = G.GAME.hands["Three of a Kind"].level or 1
		local leveltwo = G.GAME.hands["Straight"].level or 1
		local levelthree = G.GAME.hands["Flush"].level or 1
		local planetcolourone = G.C.HAND_LEVELS[math.min(levelone, 7)]
		local planetcolourtwo = G.C.HAND_LEVELS[math.min(leveltwo, 7)]
		local planetcolourthree = G.C.HAND_LEVELS[math.min(levelthree, 7)]
		if levelone == 1 or leveltwo == 1 or levelthree == 1 then --Level 1 colour is white (The background), so this sets it to black
			if levelone == 1 then
				planetcolourone = G.C.UI.TEXT_DARK
			end
			if leveltwo == 1 then
				planetcolourtwo = G.C.UI.TEXT_DARK
			end
			if levelthree == 1 then
				planetcolourthree = G.C.UI.TEXT_DARK
			end
		end
		return {
			vars = {
				localize("Three of a Kind", "poker_hands"),
				localize("Straight", "poker_hands"),
				localize("Flush", "poker_hands"),
				G.GAME.hands["Three of a Kind"].level,
				G.GAME.hands["Straight"].level,
				G.GAME.hands["Flush"].level,
				colours = { planetcolourone, planetcolourtwo, planetcolourthree },
			},
		}
	end,
	use = function(self, card, area, copier)
		suit_level_up(self, card, area, copier)
	end,
	bulk_use = function(self, card, area, copier, number)
		suit_level_up(self, card, area, copier, number)
	end,
	calculate = function(self, card, context)
		if
			G.GAME.used_vouchers.v_observatory
			and (
				context.scoring_name == "Three of a Kind"
				or context.scoring_name == "Straight"
				or context.scoring_name == "Flush"
			)
		then
			local value = G.P_CENTERS.v_observatory.config.extra
			return {
				message = localize({ type = "variable", key = "a_xmult", vars = { value } }),
				Xmult_mod = value,
			}
		end
	end,
}
local sydan = {
	object_type = "Consumable",
	set = "Planet",
	name = "cry-Sydan",
	key = "Sydan",
	pos = { x = 2, y = 2 },
	config = { hand_types = { "Full House", "Four of a Kind", "Straight Flush" } },
	cost = 4,
	aurinko = true,
	atlas = "atlasnotjokers",
	order = 9,
	can_use = function(self, card)
		return true
	end,
	loc_vars = function(self, info_queue, center)
		local levelone = G.GAME.hands["Full House"].level or 1
		local leveltwo = G.GAME.hands["Four of a Kind"].level or 1
		local levelthree = G.GAME.hands["Straight Flush"].level or 1
		local planetcolourone = G.C.HAND_LEVELS[math.min(levelone, 7)]
		local planetcolourtwo = G.C.HAND_LEVELS[math.min(leveltwo, 7)]
		local planetcolourthree = G.C.HAND_LEVELS[math.min(levelthree, 7)]
		if levelone == 1 or leveltwo == 1 or levelthree == 1 then --Level 1 colour is white (The background), so this sets it to black
			if levelone == 1 then
				planetcolourone = G.C.UI.TEXT_DARK
			end
			if leveltwo == 1 then
				planetcolourtwo = G.C.UI.TEXT_DARK
			end
			if levelthree == 1 then
				planetcolourthree = G.C.UI.TEXT_DARK
			end
		end
		return {
			vars = {
				localize("Full House", "poker_hands"),
				localize("Four of a Kind", "poker_hands"),
				localize("Straight Flush", "poker_hands"),
				G.GAME.hands["Full House"].level,
				G.GAME.hands["Four of a Kind"].level,
				G.GAME.hands["Straight Flush"].level,
				colours = { planetcolourone, planetcolourtwo, planetcolourthree },
			},
		}
	end,
	use = function(self, card, area, copier)
		suit_level_up(self, card, area, copier)
	end,
	bulk_use = function(self, card, area, copier, number)
		suit_level_up(self, card, area, copier, number)
	end,
	calculate = function(self, card, context)
		if
			G.GAME.used_vouchers.v_observatory
			and (
				context.scoring_name == "Full House"
				or context.scoring_name == "Four of a Kind"
				or context.scoring_name == "Straight Flush"
			)
		then
			local value = G.P_CENTERS.v_observatory.config.extra
			return {
				message = localize({ type = "variable", key = "a_xmult", vars = { value } }),
				Xmult_mod = value,
			}
		end
	end,
}
local lapio = {
	object_type = "Consumable",
	set = "Planet",
	name = "cry-Lapio",
	key = "Lapio",
	pos = { x = 3, y = 2 },
	config = { hand_types = { "Five of a Kind", "Flush House", "Flush Five" }, softlock = true },
	cost = 4,
	aurinko = true,
	atlas = "atlasnotjokers",
	order = 10,
	can_use = function(self, card)
		return true
	end,
	loc_vars = function(self, info_queue, center)
		local levelone = G.GAME.hands["Five of a Kind"].level or 1
		local leveltwo = G.GAME.hands["Flush House"].level or 1
		local levelthree = G.GAME.hands["Flush Five"].level or 1
		local planetcolourone = G.C.HAND_LEVELS[math.min(levelone, 7)]
		local planetcolourtwo = G.C.HAND_LEVELS[math.min(leveltwo, 7)]
		local planetcolourthree = G.C.HAND_LEVELS[math.min(levelthree, 7)]
		if levelone == 1 or leveltwo == 1 or levelthree == 1 then --Level 1 colour is white (The background), so this sets it to black
			if levelone == 1 then
				planetcolourone = G.C.UI.TEXT_DARK
			end
			if leveltwo == 1 then
				planetcolourtwo = G.C.UI.TEXT_DARK
			end
			if levelthree == 1 then
				planetcolourthree = G.C.UI.TEXT_DARK
			end
		end
		return {
			vars = {
				localize("Five of a Kind", "poker_hands"),
				localize("Flush House", "poker_hands"),
				localize("Flush Five", "poker_hands"),
				G.GAME.hands["Five of a Kind"].level,
				G.GAME.hands["Flush House"].level,
				G.GAME.hands["Flush Five"].level,
				colours = { planetcolourone, planetcolourtwo, planetcolourthree },
			},
		}
	end,
	use = function(self, card, area, copier)
		suit_level_up(self, card, area, copier)
	end,
	bulk_use = function(self, card, area, copier, number)
		suit_level_up(self, card, area, copier, number)
	end,
	calculate = function(self, card, context)
		if
			G.GAME.used_vouchers.v_observatory
			and (
				context.scoring_name == "Five of a Kind"
				or context.scoring_name == "Flush House"
				or context.scoring_name == "Flush Five"
			)
		then
			local value = G.P_CENTERS.v_observatory.config.extra
			return {
				message = localize({ type = "variable", key = "a_xmult", vars = { value } }),
				Xmult_mod = value,
			}
		end
	end,
}
local kaikki = {
    object_type = "Consumable",
    set = "Planet",
    name = "cry-Kaikki",
    key = "Kaikki",
    pos = { x = 3, y = 5 },
    config = { hand_types = { "cry_Bulwark", "cry_Clusterfuck", "cry_UltPair" }, softlock = true },
    cost = 4,
    aurinko = true,
    atlas = "atlasnotjokers",
    order = 11,
    can_use = function(self, card)
        return true
    end,
    loc_vars = function(self, info_queue, center)
        local levelone = G.GAME.hands["cry_Bulwark"].level or 1
        local leveltwo = G.GAME.hands["cry_Clusterfuck"].level or 1
        local levelthree = G.GAME.hands["cry_UltPair"].level or 1
        local planetcolourone = G.C.HAND_LEVELS[math.min(levelone, 7)]
        local planetcolourtwo = G.C.HAND_LEVELS[math.min(leveltwo, 7)]
        local planetcolourthree = G.C.HAND_LEVELS[math.min(levelthree, 7)]
        if levelone == 1 or leveltwo == 1 or levelthree == 1 then --Level 1 colour is white (The background), so this sets it to black
            if levelone == 1 then
                planetcolourone = G.C.UI.TEXT_DARK
            end
            if leveltwo == 1 then
                planetcolourtwo = G.C.UI.TEXT_DARK
            end
            if levelthree == 1 then
                planetcolourthree = G.C.UI.TEXT_DARK
            end
        end
        return {
            vars = {
                localize("cry_hand_bulwark"),
                localize("cry_hand_clusterfuck"),
                localize("cry_hand_ultpair"),
                G.GAME.hands["cry_Bulwark"].level,
                G.GAME.hands["cry_Clusterfuck"].level,
                G.GAME.hands["cry_UltPair"].level,
                colours = { planetcolourone, planetcolourtwo, planetcolourthree },
            },
        }
    end,
    use = function(self, card, area, copier)
        suit_level_up(self, card, area, copier)
    end,
    bulk_use = function(self, card, area, copier, number)
        suit_level_up(self, card, area, copier, number)
    end,
    calculate = function(self, card, context)
        if
            G.GAME.used_vouchers.v_observatory
            and (
                context.scoring_name == "cry_Bulwark"
                or context.scoring_name == "cry_Clusterfuck"
                or context.scoring_name == "cry_UltPair"
            )
        then
            local value = G.P_CENTERS.v_observatory.config.extra
            return {
                message = localize({ type = "variable", key = "a_xmult", vars = { value } }),
                Xmult_mod = value,
            }
        end
    end,
}
local planetlua = {
	object_type = "Consumable",
	set = "Planet",
	name = "cry-planetlua",
	key = "planetlua",
	config = { extra = { odds = 5 } },
	pos = { x = 4, y = 2 },
	cost = 4,
	aurinko = true,
	atlas = "atlasnotjokers",
	order = 1,
	loc_vars = function(self, info_queue, center)
		return { vars = { "" .. (G.GAME and G.GAME.probabilities.normal or 1), self.config.extra.odds } }
	end,
	can_use = function(self, card)
		return true
	end,
	use = function(self, card, area, copier)
		local used_consumable = copier or card
		if pseudorandom("planetlua") < G.GAME.probabilities.normal / card.ability.extra.odds then --Code "borrowed" from black hole
			update_hand_text(
				{ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 },
				{ handname = localize("k_all_hands"), chips = "...", mult = "...", level = "" }
			)
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.2,
				func = function()
					play_sound("tarot1")
					used_consumable:juice_up(0.8, 0.5)
					G.TAROT_INTERRUPT_PULSE = true
					return true
				end,
			}))
			update_hand_text({ delay = 0 }, { mult = "+", StatusText = true })
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.9,
				func = function()
					play_sound("tarot1")
					used_consumable:juice_up(0.8, 0.5)
					return true
				end,
			}))
			update_hand_text({ delay = 0 }, { chips = "+", StatusText = true })
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.9,
				func = function()
					play_sound("tarot1")
					used_consumable:juice_up(0.8, 0.5)
					G.TAROT_INTERRUPT_PULSE = nil
					return true
				end,
			}))
			update_hand_text({ sound = "button", volume = 0.7, pitch = 0.9, delay = 0 }, { level = "+1" })
			delay(1.3)
			for k, v in pairs(G.GAME.hands) do
				level_up_hand(used_consumable, k, true)
			end
			update_hand_text(
				{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
				{ mult = 0, chips = 0, handname = "", level = "" }
			)
		else
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.4,
				func = function() --"borrowed" from Wheel Of Fortune
					attention_text({
						text = localize("k_nope_ex"),
						scale = 1.3,
						hold = 1.4,
						major = used_consumable,
						backdrop_colour = G.C.SECONDARY_SET.Planet,
						align = (
							G.STATE == G.STATES.TAROT_PACK
							or G.STATE == G.STATES.SPECTRAL_PACK
							or G.STATE == G.STATES.SMODS_BOOSTER_OPENED
						)
								and "tm"
							or "cm",
						offset = {
							x = 0,
							y = (
								G.STATE == G.STATES.TAROT_PACK
								or G.STATE == G.STATES.SPECTRAL_PACK
								or G.STATE == G.STATES.SMODS_BOOSTER_OPENED
							)
									and -0.2
								or 0,
						},
						silent = true,
					})
					G.E_MANAGER:add_event(Event({
						trigger = "after",
						delay = 0.06 * G.SETTINGS.GAMESPEED,
						blockable = false,
						blocking = false,
						func = function()
							play_sound("tarot2", 0.76, 0.4)
							return true
						end,
					}))
					play_sound("tarot2", 1, 0.4)
					used_consumable:juice_up(0.3, 0.5)
					return true
				end,
			}))
		end
	end,
	bulk_use = function(self, card, area, copier, number)
		local used_consumable = copier or card
		local quota = 0
		for i = 1, number do
			quota = quota
				+ (pseudorandom("planetlua") < G.GAME.probabilities.normal / card.ability.extra.odds and 1 or 0)
		end
		if quota > 0 then
			update_hand_text(
				{ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 },
				{ handname = localize("k_all_hands"), chips = "...", mult = "...", level = "" }
			)
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.2,
				func = function()
					play_sound("tarot1")
					used_consumable:juice_up(0.8, 0.5)
					G.TAROT_INTERRUPT_PULSE = true
					return true
				end,
			}))
			update_hand_text({ delay = 0 }, { mult = "+", StatusText = true })
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.9,
				func = function()
					play_sound("tarot1")
					used_consumable:juice_up(0.8, 0.5)
					return true
				end,
			}))
			update_hand_text({ delay = 0 }, { chips = "+", StatusText = true })
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.9,
				func = function()
					play_sound("tarot1")
					used_consumable:juice_up(0.8, 0.5)
					G.TAROT_INTERRUPT_PULSE = nil
					return true
				end,
			}))
			update_hand_text({ sound = "button", volume = 0.7, pitch = 0.9, delay = 0 }, { level = "+" .. quota })
			delay(1.3)
			for k, v in pairs(G.GAME.hands) do
				level_up_hand(card, k, true, quota)
			end
			update_hand_text(
				{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
				{ mult = 0, chips = 0, handname = "", level = "" }
			)
		else
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.4,
				func = function()
					attention_text({
						text = localize("k_nope_ex"),
						scale = 1.3,
						hold = 1.4,
						major = used_consumable,
						backdrop_colour = G.C.SECONDARY_SET.Planet,
						align = (
							G.STATE == G.STATES.TAROT_PACK
							or G.STATE == G.STATES.SPECTRAL_PACK
							or G.STATE == G.STATES.SMODS_BOOSTER_OPENED
						)
								and "tm"
							or "cm",
						offset = {
							x = 0,
							y = (
								G.STATE == G.STATES.TAROT_PACK
								or G.STATE == G.STATES.SPECTRAL_PACK
								or G.STATE == G.STATES.SMODS_BOOSTER_OPENED
							)
									and -0.2
								or 0,
						},
						silent = true,
					})
					G.E_MANAGER:add_event(Event({
						trigger = "after",
						delay = 0.06 * G.SETTINGS.GAMESPEED,
						blockable = false,
						blocking = false,
						func = function()
							play_sound("tarot2", 0.76, 0.4)
							return true
						end,
					}))
					play_sound("tarot2", 1, 0.4)
					used_consumable:juice_up(0.3, 0.5)
					return true
				end,
			}))
		end
	end,
	calculate = function(self, card, context) --Observatory effect: (G.GAME.probabilities.normal) in (odds) chance for (G.P_CENTERS.v_observatory.config.extra) Mult
		if
			G.GAME.used_vouchers.v_observatory
			and (pseudorandom("nstar") < G.GAME.probabilities.normal / card.ability.extra.odds)
		then
			local value = G.P_CENTERS.v_observatory.config.extra
			return {
				message = localize({ type = "variable", key = "a_xmult", vars = { value } }),
				Xmult_mod = value,
			}
		end
	end,
}
local nstar = {
	object_type = "Consumable",
	set = "Planet",
	name = "cry-nstar",
	key = "nstar",
	pos = { x = 4, y = 1 },
	cost = 4,
	aurinko = true,
	atlas = "atlasnotjokers",
	order = 6,
	set_card_type_badge = function(self, card, badges)
		badges[1] = create_badge(localize("k_planet_q"), get_type_colour(self or card.config, card), nil, 1.2)
	end,
	can_use = function(self, card)
		return true
	end,
	loc_vars = function(self, info_queue, center)
		return { vars = { (G.GAME and G.GAME.neutronstarsusedinthisrun or 0) } }
	end,
	use = function(self, card, area, copier)
		local used_consumable = copier or card
		--Get amount of Neutron stars use this run or set to 0 if nil
		G.GAME.neutronstarsusedinthisrun = G.GAME.neutronstarsusedinthisrun or 0

		--Add +1 to amount of neutron stars used this run
		G.GAME.neutronstarsusedinthisrun = G.GAME.neutronstarsusedinthisrun + 1
		local neutronhand = neutronstarrandomhand() --Random poker hand
		update_hand_text(
			{ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 },
			{
				handname = localize(neutronhand, "poker_hands"),
				chips = G.GAME.hands[neutronhand].chips,
				mult = G.GAME.hands[neutronhand].mult,
				level = G.GAME.hands[neutronhand].level,
			}
		)
		--level up once for each neutron star used this run
		level_up_hand(used_consumable, neutronhand, nil, G.GAME.neutronstarsusedinthisrun)
		update_hand_text(
			{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
			{ mult = 0, chips = 0, handname = "", level = "" }
		)
	end,
	bulk_use = function(self, card, area, copier, number)
		local used_consumable = copier or card
		G.GAME.neutronstarsusedinthisrun = G.GAME.neutronstarsusedinthisrun or 0

		local handstolv = {}
		local neutronhand = "n/a"
		for i = 1, number do
			G.GAME.neutronstarsusedinthisrun = G.GAME.neutronstarsusedinthisrun + 1
			neutronhand = neutronstarrandomhand()
			handstolv[neutronhand] = (handstolv[neutronhand] or 0) + G.GAME.neutronstarsusedinthisrun
		end
		for k, v in pairs(handstolv) do
			update_hand_text(
				{ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 },
				{
					handname = localize(k, "poker_hands"),
					chips = G.GAME.hands[k].chips,
					mult = G.GAME.hands[k].mult,
					level = G.GAME.hands[k].level,
				}
			)
			card_eval_status_text(
				used_consumable,
				"extra",
				nil,
				nil,
				nil,
				{ message = "+" .. tostring(v), colour = G.C.BLUE }
			)
			level_up_hand(used_consumable, k, nil, v)
		end
		update_hand_text(
			{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
			{ mult = 0, chips = 0, handname = "", level = "" }
		)
		G.E_MANAGER:add_event(
			Event({
				trigger = "after",
				func = function()
					handstolv = nil
					return true
				end,
			})
		)
	end,
	calculate = function(self, card, context) --Observatory effect: X0.04 mult for each neutron star used this run
		if G.GAME.used_vouchers.v_observatory and G.GAME.neutronstarsusedinthisrun ~= nil then
			return {
				message = localize({
					type = "variable",
					key = "a_xmult",
					vars = { 1 + (0.04 * G.GAME.neutronstarsusedinthisrun) },
				}),
				Xmult_mod = 1 + (0.04 * G.GAME.neutronstarsusedinthisrun),
			}
		end
	end,
}
function suit_level_up(center, card, area, copier, number)
	local used_consumable = copier or card
	for _, v in pairs(card.config.center.config.hand_types) do
		update_hand_text(
			{ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 },
			{
				handname = localize(v, "poker_hands"),
				chips = G.GAME.hands[v].chips,
				mult = G.GAME.hands[v].mult,
				level = G.GAME.hands[v].level,
			}
		)
		level_up_hand(used_consumable, v, nil, number)
	end
	update_hand_text(
		{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
		{ mult = 0, chips = 0, handname = "", level = "" }
	)
end
function neutronstarrandomhand(ignore, seed, allowhidden)
	--From JenLib's get_random_hand
	local chosen_hand
	ignore = ignore or {}
	seed = seed or "randomhand"
	if type(ignore) ~= "table" then
		ignore = { ignore }
	end
	while true do
		chosen_hand = pseudorandom_element(G.handlist, pseudoseed(seed))
		if G.GAME.hands[chosen_hand].visible or allowhidden then
			local safe = true
			for _, v in pairs(ignore) do
				if v == chosen_hand then
					safe = false
				end
			end
			if safe then
				break
			end
		end
	end
	return chosen_hand
end
local planet_cards = { planetlua, nstar, timantti, klubi, sydan, lapio }
if Cryptid.enabled["Misc."] then
	planet_cards[#planet_cards + 1] = kaikki
end
if not (SMODS.Mods["jen"] or {}).can_load then
end
return { name = "Planets", init = function() end, items = planet_cards }
