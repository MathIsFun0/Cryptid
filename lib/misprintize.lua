-- misprintize.lua - functions for card value randomization

--Redefine these here because they're always used
Cryptid.base_values = {}
function Cryptid.misprintize_tbl(name, ref_tbl, ref_value, clear, override, stack, big)
	if name and ref_tbl and ref_value then
		tbl = Cryptid.deep_copy(ref_tbl[ref_value])
		for k, v in pairs(tbl) do
			if (type(tbl[k]) ~= "table") or is_number(tbl[k]) then
				if
					is_number(tbl[k])
					and not (k == "perish_tally")
					and not (k == "id")
					and not (k == "colour")
					and not (k == "suit_nominal")
					and not (k == "base_nominal")
					and not (k == "face_nominal")
					and not (k == "qty")
					and not (k == "x_mult" and v == 1 and not tbl.override_x_mult_check)
					and not (k == "selected_d6_face")
				then --Temp fix, even if I did clamp the number to values that wouldn't crash the game, the fact that it did get randomized means that there's a higher chance for 1 or 6 than other values
					if not Cryptid.base_values[name] then
						Cryptid.base_values[name] = {}
					end
					if not Cryptid.base_values[name][k] then
						Cryptid.base_values[name][k] = tbl[k]
					end
					tbl[k] = Cryptid.sanity_check(
						clear and Cryptid.base_values[name][k]
							or cry_format(
								(stack and tbl[k] or Cryptid.base_values[name][k])
									* Cryptid.log_random(
										pseudoseed("cry_misprint" .. G.GAME.round_resets.ante),
										override and override.min or G.GAME.modifiers.cry_misprint_min,
										override and override.max or G.GAME.modifiers.cry_misprint_max
									),
								"%.2g"
							),
						big
					)
				end
			elseif not (k == "immutable") then
				for _k, _v in pairs(tbl[k]) do
					if
						is_number(tbl[k][_k])
						and not (_k == "id")
						and not (k == "colour")
						and not (_k == "suit_nominal")
						and not (_k == "base_nominal")
						and not (_k == "face_nominal")
						and not (_k == "qty")
						and not (k == "x_mult" and v == 1 and not tbl[k].override_x_mult_check)
						and not (_k == "selected_d6_face")
					then --Refer to above
						if not Cryptid.base_values[name] then
							Cryptid.base_values[name] = {}
						end
						if not Cryptid.base_values[name][k] then
							Cryptid.base_values[name][k] = {}
						end
						if not Cryptid.base_values[name][k][_k] then
							Cryptid.base_values[name][k][_k] = tbl[k][_k]
						end
						tbl[k][_k] = Cryptid.sanity_check(
							clear and Cryptid.base_values[name][k][_k]
								or cry_format(
									(stack and tbl[k][_k] or Cryptid.base_values[name][k][_k])
										* Cryptid.log_random(
											pseudoseed("cry_misprint" .. G.GAME.round_resets.ante),
											override and override.min or G.GAME.modifiers.cry_misprint_min,
											override and override.max or G.GAME.modifiers.cry_misprint_max
										),
									"%.2g"
								),
							big
						)
					end
				end
			end
		end
		ref_tbl[ref_value] = tbl
	end
end
function Cryptid.misprintize_val(val, override, big)
	if is_number(val) then
		val = Cryptid.sanity_check(
			cry_format(
				val
					* Cryptid.log_random(
						pseudoseed("cry_misprint" .. G.GAME.round_resets.ante),
						override and override.min or G.GAME.modifiers.cry_misprint_min,
						override and override.max or G.GAME.modifiers.cry_misprint_max
					),
				"%.2g"
			),
			big
		)
	end
	return val
end
function Cryptid.sanity_check(val, is_big)
	if is_big then
		if not val or type(val) == "number" and (val ~= val or val > 1e300 or val < -1e300) then
			val = 1e300
		end
		if type(val) == "table" then
			return val
		end
		if val > 1e100 or val < -1e100 then
			return to_big(val)
		end
	end
	if not val or type(val) == "number" and (val ~= val or val > 1e300 or val < -1e300) then
		return 1e300
	end
	return val
end
function Cryptid.misprintize(card, override, force_reset, stack)
	if Card.no(card, "immutable", true) then
		force_reset = true
	end
	--infinifusion compat
	if card.infinifusion then
		if card.config.center == card.infinifusion_center or card.config.center.key == "j_infus_fused" then
			calculate_infinifusion(card, nil, function(i)
				Cryptid.misprintize(card, override, force_reset, stack)
			end)
		end
	end
	if
		(not force_reset or G.GAME.modifiers.cry_jkr_misprint_mod)
			and (G.GAME.modifiers.cry_misprint_min or override or card.ability.set == "Joker")
			and not stack
		or not Card.no(card, "immutable", true)
	then
		if card.ability.name == "Ace Aequilibrium" then
			return
		end
		if G.GAME.modifiers.cry_jkr_misprint_mod and card.ability.set == "Joker" then
			if not override then
				override = {}
			end
			override.min = override.min or G.GAME.modifiers.cry_misprint_min or 1
			override.max = override.max or G.GAME.modifiers.cry_misprint_max or 1
			override.min = override.min * G.GAME.modifiers.cry_jkr_misprint_mod
			override.max = override.max * G.GAME.modifiers.cry_jkr_misprint_mod
		end
		if G.GAME.modifiers.cry_misprint_min or override and override.min then
			Cryptid.misprintize_tbl(
				card.config.center_key,
				card,
				"ability",
				nil,
				override,
				stack,
				Cryptid.is_card_big(card)
			)
			if card.base then
				Cryptid.misprintize_tbl(
					card.config.card_key,
					card,
					"base",
					nil,
					override,
					stack,
					Cryptid.is_card_big(card)
				)
			end
		end
		if G.GAME.modifiers.cry_misprint_min then
			--card.cost = cry_format(card.cost / Cryptid.log_random(pseudoseed('cry_misprint'..G.GAME.round_resets.ante),override and override.min or G.GAME.modifiers.cry_misprint_min,override and override.max or G.GAME.modifiers.cry_misprint_max),"%.2f")
			card.misprint_cost_fac = 1
				/ Cryptid.log_random(
					pseudoseed("cry_misprint" .. G.GAME.round_resets.ante),
					override and override.min or G.GAME.modifiers.cry_misprint_min,
					override and override.max or G.GAME.modifiers.cry_misprint_max
				)
			card:set_cost()
		end
	else
		Cryptid.misprintize_tbl(card.config.center_key, card, "ability", true, nil, nil, Cryptid.is_card_big(card))
	end
	if card.ability.consumeable then
		for k, v in pairs(card.ability.consumeable) do
			card.ability.consumeable[k] = Cryptid.deep_copy(card.ability[k])
		end
	end
end
function Cryptid.log_random(seed, min, max)
	math.randomseed(seed)
	local lmin = math.log(min, 2.718281828459045)
	local lmax = math.log(max, 2.718281828459045)
	local poll = math.random() * (lmax - lmin) + lmin
	return math.exp(poll)
end
function cry_format(number, str)
	if math.abs(to_big(number)) >= to_big(1e300) then
		return number
	end
	return tonumber(str:format((Big and to_number(to_big(number)) or number)))
end
--use ID to work with glitched/misprint
function Card:get_nominal(mod)
	local mult = 1
	local rank_mult = 1
	if mod == "suit" then
		mult = 1000000
	end
	if self.ability.effect == "Stone Card" or (self.config.center.no_suit and self.config.center.no_rank) then
		mult = -10000
	elseif self.config.center.no_suit then
		mult = 0
	elseif self.config.center.no_rank then
		rank_mult = 0
	end
	return 10 * (self.base.id or 0.1) * rank_mult
		+ self.base.suit_nominal * mult
		+ (self.base.suit_nominal_original or 0) * 0.0001 * mult
		+ 10 * self.base.face_nominal * rank_mult
		+ 0.000001 * self.unique_val
end
