-- misprintize.lua - functions for card value randomization

--Redefine these here because they're always used
Cryptid.base_values = {}

Cryptid.misprintize_value_blacklist = {
	perish_tally = false,
	id = false,
	suit_nominal = false,
	base_nominal = false,
	face_nominal = false,
	qty = false,
	h_x_chips = false,
	d_size = false,
	h_size = false,
	selected_d6_face = false,
	-- TARGET: Misprintize Value Blacklist (format: key = false, )
}

function Cryptid.calculate_misprint(initial, min, max, grow_type, pow_level)
	local big_initial = (type(initial) ~= "table" and to_big(initial)) or initial
	local big_min = (type(min) ~= "table" and to_big(min)) or min
	local big_max = (type(max) ~= "table" and to_big(max)) or max

	local grow = Cryptid.log_random(pseudoseed("cry_misprint" .. G.GAME.round_resets.ante), big_min, big_max)

	local calc = big_initial
	if not grow_type then
		calc = calc * grow
	elseif grow_type == "+" then
		calc = calc + grow
	elseif grow_type == "-" then
		calc = calc - grow
	elseif grow_type == "/" then
		calc = calc / grow
	elseif grow_type == "^" then
		pow_level = pow_level or 1
		if pow_level == 1 then
			calc = calc ^ grow
		else
			local function hyper(level, base, height)
				local big_base = (type(base) ~= "table" and to_big(base)) or base
				local big_height = (type(height) ~= "table" and to_big(height)) or height

				if height == 1 then
					return big_base
				elseif level == 1 then
					return big_base ^ big_height
				else
					local inner = hyper(level, base, height - 1)
					return hyper(level - 1, base, inner)
				end
			end

			calc = hyper(pow_level, calc, grow)
		end
	end

	if calc > to_big(-1e100) and calc < to_big(1e100) then
		calc = to_number(calc)
	end

	return calc
end

function Cryptid.misprintize_tbl(name, ref_tbl, ref_value, clear, override, stack, big, grow_type, pow_level)
	local prob_max = 1e69 -- funny number
	local max_slots = 100
	local max_booster_slots = 25

	local function num_too_big(initial, min, max, limit)
		return (
			to_big(initial) > to_big(max_slots)
			or to_big(min) > to_big(max_slots)
			or to_big(max) > to_big(max_slots)
		)
	end

	if name and ref_tbl and ref_value then
		local tbl = Cryptid.deep_copy(ref_tbl[ref_value])

		local function can_misprintize_value(k, v)
			if
				(k == "x_mult" and v == 1 and not tbl.override_x_mult_check)
				or (k == "x_chips" and v == 1 and not tbl.override_x_chips_check)
			then
				return false
			end
		
			return Cryptid.misprintize_value_blacklist[k] or true
		end

		for k, v in pairs(tbl) do
			if (type(tbl[k]) ~= "table") or is_number(tbl[k]) then
				if is_number(tbl[k]) and can_misprintize_value(k, tbl[k]) then
					if not Cryptid.base_values[name] then
						Cryptid.base_values[name] = {}
					end
					if not Cryptid.base_values[name][k] then
						Cryptid.base_values[name][k] = tbl[k]
					end

					local initial = (stack and tbl[k] or Cryptid.base_values[name][k])
					local min = override and override.min or G.GAME.modifiers.cry_misprint_min
					local max = override and override.max or G.GAME.modifiers.cry_misprint_max

					if
						(
							k == "cry_prob"
							-- Hack for vanilla jokers that use the extra field to describe their odds
							or (
								(
									name == "j_8_ball"
									or name == "j_business"
									or name == "j_space"
									or name == "j_hallucination"
								) and k == "extra"
							)
						) 
						and num_too_big(initial, min, max, prob_max)
					then
						initial = Cryptid.base_values[name][k] * prob_max
						min = 1
						max = 1
					end

					tbl[k] = Cryptid.sanity_check(
						clear and Cryptid.base_values[name][k]
							or cry_format(Cryptid.calculate_misprint(initial, min, max, grow_type, pow_level), "%.2g"),
						big
					)
				end
			elseif
				not (k == "immutable")
				and not (k == "colour")
			then
				for _k, _v in pairs(tbl[k]) do
					if
						is_number(tbl[k][_k])
						and not (_k == "d_size")
						and not (_k == "h_size")
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

						local initial = (stack and tbl[k][_k] or Cryptid.base_values[name][k][_k])
						local min = override and override.min or G.GAME.modifiers.cry_misprint_min
						local max = override and override.max or G.GAME.modifiers.cry_misprint_max

						if
							(_k == "odds")
							and (
								to_big(initial) > to_big(prob_max)
								or to_big(min) > to_big(prob_max)
								or to_big(max) > to_big(prob_max)
							)
						then
							-- print('\t\t\t got "odds"')
							initial = Cryptid.base_values[name][k][_k] * prob_max
							min = 1
							max = 1
						end

						if
							(
								k == "slots"
								-- Hack for jokers that give slots
								and (name == "j_cry_tenebris" or name == "j_cry_negative")
							) and num_too_big(initial, min, max, max_slots)
						then
							initial = max_slots
							min = 1
							max = 1
						end

						if
							(
								k == "booster_slots"
								-- Hack for jokers that give booster_slots
								and (name == "j_cry_booster")
							) and num_too_big(initial, min, max, max_booster_slots)
						then
							initial = max_booster_slots
							min = 1
							max = 1
						end

						tbl[k][_k] = Cryptid.sanity_check(
							clear and Cryptid.base_values[name][k][_k]
								or cry_format(Cryptid.calculate_misprint(initial, min, max), "%.2g"),
							big
						)
					end
				end
			end
		end
		ref_tbl[ref_value] = tbl
	end
end
function Cryptid.misprintize_val(val, override, big, grow_type, pow_level)
	if is_number(val) then
		val = Cryptid.sanity_check(
			cry_format(
				Cryptid.calculate_misprint(
					val,
					override and override.min or G.GAME.modifiers.cry_misprint_min,
					override and override.max or G.GAME.modifiers.cry_misprint_max,
					grow_type,
					pow_level
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
	if type(val) == "table" then
		if val > to_big(1e300) then
			return 1e300
		end
		if val < to_big(-1e300) then
			return -1e300
		end
		return to_number(val)
	end
	return val
end
function Cryptid.misprintize(card, override, force_reset, stack, grow_type, pow_level)
	if Card.no(card, "immutable", true) then
		force_reset = true
	end
	--infinifusion compat
	if card.infinifusion then
		if card.config.center == card.infinifusion_center or card.config.center.key == "j_infus_fused" then
			calculate_infinifusion(card, nil, function(i)
				Cryptid.misprintize(card, override, force_reset, stack, grow_type, pow_level)
			end)
		end
	end
	if
		(not force_reset or G.GAME.modifiers.cry_jkr_misprint_mod)
			and (G.GAME.modifiers.cry_misprint_min or override or card.ability.set == "Joker")
			and not stack
		or not Card.no(card, "immutable", true)
	then
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
				Cryptid.is_card_big(card),
				grow_type,
				pow_level
			)
			if card.base then
				Cryptid.misprintize_tbl(
					card.config.card_key,
					card,
					"base",
					nil,
					override,
					stack,
					Cryptid.is_card_big(card),
					grow_type,
					pow_level
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
		Cryptid.misprintize_tbl(
			card.config.center_key,
			card,
			"ability",
			true,
			nil,
			nil,
			Cryptid.is_card_big(card),
			grow_type,
			pow_level
		)
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
