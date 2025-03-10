-- cross-mod.lua - Used for compatibility and content with other mods

--For Double Scale/Scalae, modify Green Joker to use one variable
SMODS.Joker:take_ownership("green_joker", {
	config = { extra = 1, mult = 0 },
	name = "cry-Green Joker", --will prevent old calculation code from working
	loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra, center.ability.extra, center.ability.mult } }
	end,
	calculate = function(self, card, context)
		if
			context.discard
			and not context.blueprint
			and context.other_card == context.full_hand[#context.full_hand]
		then
			local prev_mult = card.ability.mult
			card.ability.mult = math.max(0, card.ability.mult - card.ability.extra)
			if card.ability.mult ~= prev_mult then
				return {
					message = localize({
						type = "variable",
						key = "a_mult_minus",
						vars = { card.ability.extra },
					}),
					colour = G.C.RED,
					card = card,
				}
			end
		end
		if context.cardarea == G.jokers and context.before and not context.blueprint then
			card.ability.mult = card.ability.mult + card.ability.extra
			return {
				card = card,
				message = localize({ type = "variable", key = "a_mult", vars = { card.ability.extra } }),
			}
		end
		if context.joker_main then
			return {
				message = localize({ type = "variable", key = "a_mult", vars = { card.ability.mult } }),
				mult_mod = card.ability.mult,
			}
		end
	end,
	loc_txt = {},
}, true)

--Top Gear from The World End with Jimbo has several conflicts with Cryptid items
--Namely, It overrides the edition that edition jokers spawn with, and doesn't work correctly with edition decks
--I'm taking ownership of this, overiding it, and making an implementaion that is compatible with Cryptid

--Unrelated but kind of related side note: this prevents top gear from showing up in collection, not sure what's up with that
--Is it due to how TWEWJ is Coded? Is it an issue with Steamodded itself? Might be worth looking into, just sayin

if (SMODS.Mods["TWEWY"] or {}).can_load then
	SMODS.Joker:take_ownership("twewy_topGear", {
		name = "Cry-topGear",
		--Stop Top Gear's Old code from working by overriding these
		add_to_deck = function(self, card, from_debuff) end,
		remove_from_deck = function(self, card, from_debuff) end,
		rarity = 3,
		loc_txt = {
			name = "Top Gear",
			text = {
				"All {C:blue}Common{C:attention} Jokers{}",
				"are {C:dark_edition}Polychrome{}",
			},
		},
	})
end

--Make Ortalab's Locked jokers not show up on Deck of Equilibrium and Antimatter Deck
if (SMODS.Mods["ortalab"] or {}).can_load then
	for i = 1, 150 do
		print(i)
		SMODS.Joker:take_ownership("ortalab_temp_" .. i, {
			name = "Cry-skibidi",
			no_doe = true,
		})
	end
end

--Requires Malverk Mod
if (SMODS.Mods["malverk"] or {}).can_load then
	AltTexture({
		key = "jolly_jokers",
		set = "Joker",
		path = "jolly.png",
		loc_txt = {
			name = "Jolly Jokers",
		},
	})
	TexturePack({ -- HD Texture Pack
		key = "jolly_texture",
		textures = {
			"cry_jolly_jokers",
		},
		loc_txt = {
			name = "Jolly",
			text = {
				"Jolly Jokers",
				"Art by B",
			},
		},
	})
end

--Make extra modifiers display on the Next Ante Preview
if (SMODS.Mods["AntePreview"] or {}).can_load then
	local predict_hook = predict_next_ante
	function predict_next_ante()
		local small = "bl_small"
		local big = "bl_big"
		if G.GAME.modifiers.cry_big_boss_rate and pseudorandom("cry_big_boss") < G.GAME.modifiers.cry_big_boss_rate then
			big = get_new_boss()
		elseif G.GAME.modifiers.cry_rush_hour_ii then
			small = get_new_boss()
			big = get_new_boss()
		end
		local predictions = predict_hook()
		if G.GAME.modifiers.cry_no_tags then
			for _, pred in pairs(predictions) do
				pred.tag = nil
			end
		end
		predictions.Small.blind = small
		predictions.Big.blind = big
		if G.P_BLINDS[predictions.Small.blind].boss then
			G.GAME.bosses_used[predictions.Small.blind] = G.GAME.bosses_used[predictions.Small.blind] - 1
		end
		if G.P_BLINDS[predictions.Big.blind].boss then
			G.GAME.bosses_used[predictions.Big.blind] = G.GAME.bosses_used[predictions.Big.blind] - 1
		end
		if G.GAME.modifiers.cry_no_small_blind then
			predictions.Small = nil
		end
		return predictions
	end
end
