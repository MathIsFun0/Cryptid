-- calculate.lua: modifications specifically for card calculation

-- deal with Rigged and Fragile when scoring a playing card
local ec = eval_card
function eval_card(card, context)
	if card.will_shatter then
		return {}, {}
	end
	-- Store old probability for later reference
	local ggpn = G.GAME.probabilities.normal
	if card.ability.cry_rigged then
		G.GAME.probabilities.normal = 1e9
	end
	local ret, post = ec(card, context)
	if card.ability.cry_rigged then
		G.GAME.probabilities.normal = ggpn
	end
	return ret, post
end

--some functions to minimize the load on calculate_joker itself
function Card:cry_copy_ability()
	local orig_ability = {}
	if self.ability then
		for i, j in pairs(self.ability) do
			if (type(j) == "table") and is_number(j) then
				orig_ability[i] = to_big(j)
			elseif type(j) == "table" then
				orig_ability[i] = {}
				for i2, j2 in pairs(j) do
					orig_ability[i][i2] = j2
				end
			else
				orig_ability[i] = j
			end
		end
	end
	return orig_ability
end
local cj = Card.calculate_joker

function Card:cry_double_scale_calc(orig_ability, in_context_scaling)
	if
		self.ability.name ~= "cry-happyhouse"
		and self.ability.name ~= "Acrobat"
		and self.ability.name ~= "cry-sapling"
		and self.ability.name ~= "cry-mstack"
		and self.ability.name ~= "cry-notebook"
		and self.ability.name ~= "Invisible Joker"
		and self.ability.name ~= "cry-Old Invisible Joker"
	then
		local jkr = self
		if jkr.ability and type(jkr.ability) == "table" then
			if not G.GAME.cry_double_scale[jkr.sort_id] or not G.GAME.cry_double_scale[jkr.sort_id].ability then
				if not G.GAME.cry_double_scale[jkr.sort_id] then
					G.GAME.cry_double_scale[jkr.sort_id] = { ability = { double_scale = true } }
				end
				for k, v in pairs(jkr.ability) do
					if type(jkr.ability[k]) ~= "table" then
						G.GAME.cry_double_scale[jkr.sort_id].ability[k] = v
					else
						G.GAME.cry_double_scale[jkr.sort_id].ability[k] = {}
						for _k, _v in pairs(jkr.ability[k]) do
							G.GAME.cry_double_scale[jkr.sort_id].ability[k][_k] = _v
						end
					end
				end
			end
			if G.GAME.cry_double_scale[jkr.sort_id] and not G.GAME.cry_double_scale[jkr.sort_id].scaler then
				local dbl_info = G.GAME.cry_double_scale[jkr.sort_id]
				if jkr.ability.name == "cry-Number Blocks" then
					dbl_info.base = { "extra", "money" }
					dbl_info.scaler = { "extra", "money_mod" }
					dbl_info.scaler_base = jkr.ability.extra.money_mod
					dbl_info.offset = 1
				end
				if jkr.ability.name == "cry-Exponentia" then
					dbl_info.base = { "extra", "Emult" }
					dbl_info.scaler = { "extra", "Emult_mod" }
					dbl_info.scaler_base = jkr.ability.extra.Emult_mod
					dbl_info.offset = 1
				end
				if jkr.ability.name == "cry-Redeo" then
					dbl_info.base = { "extra", "money_req" }
					dbl_info.scaler = { "extra", "money_mod" }
					dbl_info.scaler_base = jkr.ability.extra.money_mod
					dbl_info.offset = 1
				end
				if jkr.ability.name == "cry-Chili Pepper" then
					dbl_info.base = { "extra", "Xmult" }
					dbl_info.scaler = { "extra", "Xmult_mod" }
					dbl_info.scaler_base = jkr.ability.extra.Xmult_mod
					dbl_info.offset = 1
				end
				if jkr.ability.name == "cry-Scalae" then
					dbl_info.base = { "extra", "shadow_scale" }
					dbl_info.scaler = { "extra", "shadow_scale_mod" }
					dbl_info.scaler_base = jkr.ability.extra.scale_mod
					dbl_info.offset = 1
				end
				if jkr.ability.name == "cry-mprime" then
					dbl_info.base = { "extra", "mult" }
					dbl_info.scaler = { "extra", "bonus" }
					dbl_info.scaler_base = jkr.ability.extra.bonus
					dbl_info.offset = 1
				end
				if jkr.ability.name == "Yorick" then
					dbl_info.base = { "x_mult" }
					dbl_info.scaler = { "extra", "xmult" } --not kidding
					dbl_info.scaler_base = 1
					dbl_info.offset = 1
				end
				if jkr.ability.name == "Hologram" then
					dbl_info.base = { "x_mult" }
					dbl_info.scaler = { "extra" }
					dbl_info.scaler_base = jkr.ability.extra
					dbl_info.offset = 1
				end
				if jkr.ability.name == "Gift Card" then
					dbl_info.base = { "extra_value" }
					dbl_info.scaler = { "extra" }
					dbl_info.scaler_base = jkr.ability.extra
					dbl_info.offset = 1
				end
				if jkr.ability.name == "Throwback" then
					dbl_info.base = { "x_mult" }
					dbl_info.scaler = { "extra" }
					dbl_info.scaler_base = jkr.ability.x_mult or 1
					dbl_info.offset = 1
				end
				if jkr.ability.name == "Egg" then
					dbl_info.base = { "extra_value" }
					dbl_info.scaler = { "extra" }
					dbl_info.scaler_base = jkr.ability.extra
					dbl_info.offset = 1
				end
				local default_modifiers = {
					mult = 0,
					h_mult = 0,
					h_x_mult = 0,
					h_dollars = 0,
					p_dollars = 0,
					t_mult = 0,
					t_chips = 0,
					x_mult = 1,
					h_size = 0,
					d_size = 0,
				}
				for k, v in pairs(jkr.ability) do
					--extra_value is ignored because it can be scaled by Gift Card
					if
						k ~= "extra_value"
						and dbl_info.ability[k] ~= v
						and is_number(v)
						and is_number(dbl_info.ability[k])
					then
						dbl_info.base = { k }
						local predicted_mod = math.abs(to_number(to_big(v)) - to_number(to_big(dbl_info.ability[k])))
						local best_key = { "" }
						local best_coeff = 10 ^ 100
						for l, u in pairs(jkr.ability) do
							if not (default_modifiers[l] and default_modifiers[l] == u) then
								if l ~= k and is_number(u) then
									if
										to_number(to_big(predicted_mod / u)) >= 0.999
										and to_number(to_big(predicted_mod / u)) < to_number(to_big(best_coeff))
									then
										best_coeff = to_number(to_big(predicted_mod / u))
										best_key = { l }
									end
								end
								if type(jkr.ability[l]) == "table" then
									for _l, _u in pairs(jkr.ability[l]) do
										if
											is_number(_u)
											and to_number(to_big(predicted_mod / _u)) >= 0.999
											and to_number(to_big(predicted_mod / _u))
												< to_number(to_big(best_coeff))
										then
											best_coeff = to_number(to_big(predicted_mod / _u))
											best_key = { l, _l }
										end
									end
								end
							end
						end
						dbl_info.scaler = best_key
					end
					if
						type(jkr.ability[k]) == "table"
						and type(dbl_info.ability) == "table"
						and type(dbl_info.ability[k]) == "table"
					then
						for _k, _v in pairs(jkr.ability[k]) do
							if
								dbl_info.ability[k][_k] ~= _v
								and is_number(_v)
								and is_number(dbl_info.ability[k][_k])
							then
								dbl_info.base = { k, _k }
								local predicted_mod = math.abs(_v - dbl_info.ability[k][_k])
								local best_key = { "" }
								local best_coeff = 10 ^ 100
								for l, u in pairs(jkr.ability) do
									if is_number(u) and to_number(to_big(predicted_mod / u)) >= 0.999 then
										if to_number(to_big(predicted_mod / u)) < to_number(to_big(best_coeff)) then
											best_coeff = to_number(to_big(predicted_mod / u))
											best_key = { l }
										end
									end
									if type(jkr.ability[l]) == "table" then
										for _l, _u in pairs(jkr.ability[l]) do
											if
												(l ~= k or _l ~= _k)
												and is_number(_u)
												and to_number(to_big(predicted_mod / _u)) >= 0.999
											then
												if
													to_number(to_big(predicted_mod / _u))
													< to_number(to_big(best_coeff))
												then
													best_coeff = to_number(to_big(predicted_mod / _u))
													best_key = { l, _l }
												end
											end
										end
									end
								end
								dbl_info.scaler = best_key
							end
						end
					end
				end
				if dbl_info.scaler then
					dbl_info.scaler_base = #dbl_info.scaler == 2
							and orig_ability[dbl_info.scaler[1]][dbl_info.scaler[2]]
						or orig_ability[dbl_info.scaler[1]]
					dbl_info.offset = 1
				end
			end
		end
	end
	local orig_scale_base = nil
	local orig_scale_scale = nil
	if G.GAME.cry_double_scale[self.sort_id] and G.GAME.cry_double_scale[self.sort_id].scaler then
		local jkr = self
		local dbl_info = G.GAME.cry_double_scale[self.sort_id]
		if #dbl_info.base == 2 then
			if
				not (
					type(jkr.ability) ~= "table"
					or not orig_ability[dbl_info.base[1]]
					or type(orig_ability[dbl_info.base[1]]) ~= "table"
					or not orig_ability[dbl_info.base[1]][dbl_info.base[2]]
				)
			then
				orig_scale_base = orig_ability[dbl_info.base[1]][dbl_info.base[2]]
			end
		else
			if jkr.ability[dbl_info.base[1]] then
				orig_scale_base = orig_ability[dbl_info.base[1]]
			end
		end
		if #dbl_info.scaler == 2 then
			if
				not (
					not orig_ability[dbl_info.scaler[1]]
					or type(orig_ability[dbl_info.scaler[1]]) == "number"
					or not orig_ability[dbl_info.scaler[1]][dbl_info.scaler[2]]
				)
			then
				orig_scale_scale = orig_ability[dbl_info.scaler[1]][dbl_info.scaler[2]]
			end
		else
			if orig_ability[dbl_info.scaler[1]] then
				orig_scale_scale = orig_ability[dbl_info.scaler[1]]
			end
		end
	end

	if orig_scale_base and orig_scale_scale then
		local new_scale_base = nil
		local true_base = nil
		local jkr = self
		local dbl_info = G.GAME.cry_double_scale[self.sort_id]
		if #dbl_info.base == 2 then
			if
				not (
					type(jkr.ability) ~= "table"
					or not jkr.ability[dbl_info.base[1]]
					or type(jkr.ability[dbl_info.base[1]]) ~= "table"
					or not jkr.ability[dbl_info.base[1]][dbl_info.base[2]]
				)
			then
				new_scale_base = jkr.ability[dbl_info.base[1]][dbl_info.base[2]]
			end
		else
			if jkr.ability[dbl_info.base[1]] then
				new_scale_base = jkr.ability[dbl_info.base[1]]
			end
		end
		true_base = dbl_info.scaler_base
		if
			new_scale_base and ((to_big(math.abs(new_scale_base - orig_scale_base)) > to_big(0)) or in_context_scaling)
		then
			for i = 1, #G.jokers.cards do
				local obj = G.jokers.cards[i].config.center
				if obj.cry_scale_mod and type(obj.cry_scale_mod) == "function" then
					local ggpn = G.GAME.probabilities.normal
					if G.jokers.cards[i].ability.cry_rigged then
						G.GAME.probabilities.normal = 1e9
					end
					local o = obj:cry_scale_mod(
						G.jokers.cards[i],
						jkr,
						orig_scale_scale,
						true_base,
						orig_scale_base,
						new_scale_base
					)
					if G.jokers.cards[i].ability.cry_rigged then
						G.GAME.probabilities.normal = ggpn
					end
					if o then
						if #dbl_info.scaler == 2 then
							if
								not (
									not jkr.ability[dbl_info.scaler[1]]
									or not jkr.ability[dbl_info.scaler[1]][dbl_info.scaler[2]]
								)
							then
								jkr.ability[dbl_info.scaler[1]][dbl_info.scaler[2]] = o
								orig_scale_scale = o
							end
						else
							if jkr.ability[dbl_info.scaler[1]] then
								jkr.ability[dbl_info.scaler[1]] = o
								orig_scale_scale = o
							end
						end
						card_eval_status_text(
							G.jokers.cards[i],
							"extra",
							nil,
							nil,
							nil,
							{ message = localize("k_upgrade_ex") }
						)
					end
					local reps = {}
					for i2 = 1, #G.jokers.cards do
						local _card = G.jokers.cards[i2]
						local ggpn = G.GAME.probabilities.normal
						if _card.ability.cry_rigged then
							G.GAME.probabilities.normal = 1e9
						end
						local check =
							cj(G.jokers.cards[i2], { retrigger_joker_check = true, other_card = G.jokers.cards[i] })
						if _card.ability.cry_rigged then
							G.GAME.probabilities.normal = ggpn
						end
						if type(check) == "table" then
							reps[i2] = check and check.repetitions and check or 0
						else
							reps[i2] = 0
						end
						if
							G.jokers.cards[i2] == G.jokers.cards[i]
							and G.jokers.cards[i].edition
							and G.jokers.cards[i].edition.retriggers
						then
							local old_repetitions = reps[i] ~= 0 and reps[i].repetitions or 0
							local check = false --G.jokers.cards[i]:calculate_retriggers()
							if check and check.repetitions then
								check.repetitions = check.repetitions + old_repetitions
								reps[i] = check
							end
						end
					end
					for i0, j in ipairs(reps) do
						if (type(j) == "table") and j.repetitions and (j.repetitions > 0) then
							for r = 1, j.repetitions do
								card_eval_status_text(j.card, "jokers", nil, nil, nil, j)
								local ggpn = G.GAME.probabilities.normal
								if G.jokers.cards[i].ability.cry_rigged then
									G.GAME.probabilities.normal = 1e9
								end
								local o = obj:cry_scale_mod(
									G.jokers.cards[i],
									jkr,
									orig_scale_scale,
									true_base,
									orig_scale_base,
									new_scale_base
								)
								if G.jokers.cards[i].ability.cry_rigged then
									G.GAME.probabilities.normal = ggpn
								end
								if o then
									if #dbl_info.scaler == 2 then
										if
											not (
												not jkr.ability[dbl_info.scaler[1]]
												or not jkr.ability[dbl_info.scaler[1]][dbl_info.scaler[2]]
											)
										then
											jkr.ability[dbl_info.scaler[1]][dbl_info.scaler[2]] = o
											orig_scale_scale = o
										end
									else
										if jkr.ability[dbl_info.scaler[1]] then
											jkr.ability[dbl_info.scaler[1]] = o
											orig_scale_scale = o
										end
									end
									card_eval_status_text(
										G.jokers.cards[i],
										"extra",
										nil,
										nil,
										nil,
										{ message = localize("k_upgrade_ex") }
									)
								end
							end
						end
					end
				end
			end
		end
	end
end

local smcc = SMODS.calculate_context
function SMODS.calculate_context(context, return_table)
	for k, v in pairs(SMODS.Events) do
		if G.GAME.events and G.GAME.events[k] then
			context.pre_jokers = true
			v:calculate(context)
			context.pre_jokers = nil
		end
	end
	if context.using_consumeable then
		local _card = context.consumeable
		--calculate the joker effects
		local eval, post = eval_card(_card, context)
		local effects = { eval }
		for _, v in ipairs(post) do
			effects[#effects + 1] = v
		end

		if context.other_joker then
			for k, v in pairs(effects[1]) do
				v.other_card = _card
			end
		end
		if effects[1].retriggers then
			context.retrigger_joker = true
			for rt = 1, #effects[1].retriggers do
				context.retrigger_joker = effects[1].retriggers[rt].retrigger_card
				local rt_eval, rt_post = eval_card(_card, context)
				table.insert(effects, { effects[1].retriggers[rt] })
				table.insert(effects, rt_eval)
				for _, v in ipairs(rt_post) do
					effects[#effects + 1] = v
				end
			end
			context.retrigger_joker = false
		end
		if return_table then
			for _, v in ipairs(effects) do
				if v.jokers and not v.jokers.card then
					v.jokers.card = _card
				end
				return_table[#return_table + 1] = v
			end
		else
			SMODS.trigger_effects(effects, _card)
		end
	end
	local ret = smcc(context, return_table)
	for k, v in pairs(SMODS.Events) do
		if G.GAME.events and G.GAME.events[k] then
			context.post_jokers = true
			v:calculate(context)
			context.post_jokers = nil
		end
	end
	return ret
end

function Card:calculate_joker(context)
	local active_side = self
	if
		next(find_joker("cry-Flip Side"))
		and not context.dbl_side
		and self.edition
		and self.edition.cry_double_sided
	then
		self:init_dbl_side()
		active_side = self.dbl_side
		if context.callback then
			local m = context.callback
			context.callback = function(card, a, b)
				m(self, a, b)
			end
			context.dbl_side = true
		end
	end
	if active_side.will_shatter then
		return
	end
	local ggpn = G.GAME.probabilities.normal
	if not G.GAME.cry_double_scale then
		G.GAME.cry_double_scale = { double_scale = true } --doesn't really matter what's in here as long as there's something
	end
	if active_side.ability.cry_rigged then
		G.GAME.probabilities.normal = 1e9
	end
	local orig_ability = active_side:cry_copy_ability()
	local in_context_scaling = false
	local callback = context.callback
	if active_side.ability.cry_possessed then
		if
			not (
				(context.individual and not context.repetition)
				or context.joker_main
				or (context.other_joker and not context.post_trigger)
			)
		then
			return
		end
		context.callback = nil
	end
	local ret, trig = cj(active_side, context)
	if active_side.ability.cry_possessed and ret then
		if ret.mult_mod then
			ret.mult_mod = ret.mult_mod * -1
		end
		if ret.Xmult_mod then
			ret.Xmult_mod = ret.Xmult_mod ^ -1
		end
		if ret.mult then
			ret.mult = ret.mult * -1
		end
		if ret.x_mult then
			ret.x_mult = ret.x_mult ^ -1
		end
		ret.e_mult = nil
		ret.ee_mult = nil
		ret.eee_mult = nil
		ret.hyper_mult = nil
		ret.Emult_mod = nil
		ret.EEmult_mod = nil
		ret.EEEmult_mod = nil
		ret.hypermult_mod = nil
		if ret.chip_mod then
			ret.chip_mod = ret.chip_mod * -1
		end
		if ret.Xchip_mod then
			ret.Xchip_mod = ret.Xchip_mod ^ -1
		end
		if ret.chips then
			ret.chips = ret.chips * -1
		end
		if ret.x_chips then
			ret.x_chips = ret.x_chips ^ -1
		end
		ret.e_chips = nil
		ret.ee_chips = nil
		ret.eee_chips = nil
		ret.hyper_chips = nil
		ret.Echip_mod = nil
		ret.EEchip_mod = nil
		ret.EEEchip_mod = nil
		ret.hyperchip_mod = nil
		if ret.message then
			-- TODO - this is a hacky way to do this, but it works for now
			if type(ret.message) == "table" then
				ret.message = ret.message[1]
			end
			if ret.message:sub(1, 1) == "+" then
				ret.message = "-" .. ret.message:sub(2)
			elseif ret.message:sub(1, 1) == "X" then
				ret.message = "/" .. ret.message:sub(2)
			else
				ret.message = ret.message .. "?"
			end
		end
		callback(context.blueprint_card or self, ret, context.retrigger_joker)
	end
	if not context.blueprint and (active_side.ability.set == "Joker") and not active_side.debuff then
		if ret or trig then
			in_context_scaling = true
		end
	end
	if active_side.ability.cry_rigged then
		G.GAME.probabilities.normal = ggpn
	end
	active_side:cry_double_scale_calc(orig_ability, in_context_scaling)
	return ret, trig
end

function Cryptid.exponentia_scale_mod(self, orig_scale_scale, orig_scale_base, new_scale_base)
	local jkr = self
	local dbl_info = G.GAME.cry_double_scale[jkr.sort_id]
	if jkr.ability and type(jkr.ability) == "table" then
		if not G.GAME.cry_double_scale[jkr.sort_id] or not G.GAME.cry_double_scale[jkr.sort_id].ability then
			if not G.GAME.cry_double_scale[jkr.sort_id] then
				G.GAME.cry_double_scale[jkr.sort_id] = { ability = { double_scale = true } }
			end
			for k, v in pairs(jkr.ability) do
				if type(jkr.ability[k]) ~= "table" then
					G.GAME.cry_double_scale[jkr.sort_id].ability[k] = v
				else
					G.GAME.cry_double_scale[jkr.sort_id].ability[k] = {}
					for _k, _v in pairs(jkr.ability[k]) do
						G.GAME.cry_double_scale[jkr.sort_id].ability[k][_k] = _v
					end
				end
			end
		end
		if G.GAME.cry_double_scale[jkr.sort_id] and not G.GAME.cry_double_scale[jkr.sort_id].scaler then
			dbl_info.base = { "extra", "Emult" }
			dbl_info.scaler = { "extra", "Emult_mod" }
			dbl_info.scaler_base = jkr.ability.extra.Emult_mod
			dbl_info.offset = 1
		end
	end
	local true_base = dbl_info.scaler_base
	if true_base then
		for i = 1, #G.jokers.cards do
			local obj = G.jokers.cards[i].config.center
			if obj.cry_scale_mod and type(obj.cry_scale_mod) == "function" then
				local ggpn = G.GAME.probabilities.normal
				if G.jokers.cards[i].ability.cry_rigged then
					G.GAME.probabilities.normal = 1e9
				end
				local o = obj:cry_scale_mod(
					G.jokers.cards[i],
					jkr,
					orig_scale_scale,
					true_base,
					orig_scale_base,
					new_scale_base
				)
				if G.jokers.cards[i].ability.cry_rigged then
					G.GAME.probabilities.normal = ggpn
				end
				if o then
					if #dbl_info.scaler == 2 then
						if
							not (
								not jkr.ability[dbl_info.scaler[1]]
								or not jkr.ability[dbl_info.scaler[1]][dbl_info.scaler[2]]
							)
						then
							jkr.ability[dbl_info.scaler[1]][dbl_info.scaler[2]] = o
							orig_scale_scale = o
						end
					else
						if jkr.ability[dbl_info.scaler[1]] then
							jkr.ability[dbl_info.scaler[1]] = o
							orig_scale_scale = o
						end
					end
					card_eval_status_text(
						G.jokers.cards[i],
						"extra",
						nil,
						nil,
						nil,
						{ message = localize("k_upgrade_ex") }
					)
				end
				local reps = {}
				for i2 = 1, #G.jokers.cards do
					local _card = G.jokers.cards[i2]
					local ggpn = G.GAME.probabilities.normal
					if _card.ability.cry_rigged then
						G.GAME.probabilities.normal = 1e9
					end
					local check =
						cj(G.jokers.cards[i2], { retrigger_joker_check = true, other_card = G.jokers.cards[i] })
					if _card.ability.cry_rigged then
						G.GAME.probabilities.normal = ggpn
					end
					if type(check) == "table" then
						reps[i2] = check and check.repetitions and check or 0
					else
						reps[i2] = 0
					end
					if
						G.jokers.cards[i2] == G.jokers.cards[i]
						and G.jokers.cards[i].edition
						and G.jokers.cards[i].edition.retriggers
					then
						local old_repetitions = reps[i] ~= 0 and reps[i].repetitions or 0
						local check = false --G.jokers.cards[i]:calculate_retriggers()
						if check and check.repetitions then
							check.repetitions = check.repetitions + old_repetitions
							reps[i] = check
						end
					end
				end
				for i0, j in ipairs(reps) do
					if (type(j) == "table") and j.repetitions and (j.repetitions > 0) then
						for r = 1, j.repetitions do
							card_eval_status_text(j.card, "jokers", nil, nil, nil, j)
							local ggpn = G.GAME.probabilities.normal
							if G.jokers.cards[i].ability.cry_rigged then
								G.GAME.probabilities.normal = 1e9
							end
							local o = obj:cry_scale_mod(
								G.jokers.cards[i],
								jkr,
								orig_scale_scale,
								true_base,
								orig_scale_base,
								new_scale_base
							)
							if G.jokers.cards[i].ability.cry_rigged then
								G.GAME.probabilities.normal = ggpn
							end
							if o then
								if #dbl_info.scaler == 2 then
									if
										not (
											not jkr.ability[dbl_info.scaler[1]]
											or not jkr.ability[dbl_info.scaler[1]][dbl_info.scaler[2]]
										)
									then
										jkr.ability[dbl_info.scaler[1]][dbl_info.scaler[2]] = o
										orig_scale_scale = o
									end
								else
									if jkr.ability[dbl_info.scaler[1]] then
										jkr.ability[dbl_info.scaler[1]] = o
										orig_scale_scale = o
									end
								end
								card_eval_status_text(
									G.jokers.cards[i],
									"extra",
									nil,
									nil,
									nil,
									{ message = localize("k_upgrade_ex") }
								)
							end
						end
					end
				end
			end
		end
	end
end

function Cryptid.compound_interest_scale_mod(self, orig_scale_scale, orig_scale_base, new_scale_base)
	local jkr = self
	local dbl_info = G.GAME.cry_double_scale[jkr.sort_id]
	if jkr.ability and type(jkr.ability) == "table" then
		if not G.GAME.cry_double_scale[jkr.sort_id] or not G.GAME.cry_double_scale[jkr.sort_id].ability then
			if not G.GAME.cry_double_scale[jkr.sort_id] then
				G.GAME.cry_double_scale[jkr.sort_id] = { ability = { double_scale = true } }
			end
			for k, v in pairs(jkr.ability) do
				if type(jkr.ability[k]) ~= "table" then
					G.GAME.cry_double_scale[jkr.sort_id].ability[k] = v
				else
					G.GAME.cry_double_scale[jkr.sort_id].ability[k] = {}
					for _k, _v in pairs(jkr.ability[k]) do
						G.GAME.cry_double_scale[jkr.sort_id].ability[k][_k] = _v
					end
				end
			end
		end
		if G.GAME.cry_double_scale[jkr.sort_id] and not G.GAME.cry_double_scale[jkr.sort_id].scaler then
			dbl_info.base = { "extra", "percent" }
			dbl_info.scaler = { "extra", "percent_mod" }
			dbl_info.scaler_base = jkr.ability.extra.percent_mod
			dbl_info.offset = 1
		end
	end
	local true_base = dbl_info.scaler_base
	if true_base then
		for i = 1, #G.jokers.cards do
			local obj = G.jokers.cards[i].config.center
			if obj.cry_scale_mod and type(obj.cry_scale_mod) == "function" then
				local ggpn = G.GAME.probabilities.normal
				if G.jokers.cards[i].ability.cry_rigged then
					G.GAME.probabilities.normal = 1e9
				end
				local o = obj:cry_scale_mod(
					G.jokers.cards[i],
					jkr,
					orig_scale_scale,
					true_base,
					orig_scale_base,
					new_scale_base
				)
				if G.jokers.cards[i].ability.cry_rigged then
					G.GAME.probabilities.normal = ggpn
				end
				if o then
					if #dbl_info.scaler == 2 then
						if
							not (
								not jkr.ability[dbl_info.scaler[1]]
								or not jkr.ability[dbl_info.scaler[1]][dbl_info.scaler[2]]
							)
						then
							jkr.ability[dbl_info.scaler[1]][dbl_info.scaler[2]] = o
							orig_scale_scale = o
						end
					else
						if jkr.ability[dbl_info.scaler[1]] then
							jkr.ability[dbl_info.scaler[1]] = o
							orig_scale_scale = o
						end
					end
					card_eval_status_text(
						G.jokers.cards[i],
						"extra",
						nil,
						nil,
						nil,
						{ message = localize("k_upgrade_ex") }
					)
				end
				local reps = {}
				for i2 = 1, #G.jokers.cards do
					local _card = G.jokers.cards[i2]
					local ggpn = G.GAME.probabilities.normal
					if _card.ability.cry_rigged then
						G.GAME.probabilities.normal = 1e9
					end
					local check =
						cj(G.jokers.cards[i2], { retrigger_joker_check = true, other_card = G.jokers.cards[i] })
					if _card.ability.cry_rigged then
						G.GAME.probabilities.normal = ggpn
					end
					if type(check) == "table" then
						reps[i2] = check and check.repetitions and check or 0
					else
						reps[i2] = 0
					end
					if
						G.jokers.cards[i2] == G.jokers.cards[i]
						and G.jokers.cards[i].edition
						and G.jokers.cards[i].edition.retriggers
					then
						local old_repetitions = reps[i] ~= 0 and reps[i].repetitions or 0
						local check = false --G.jokers.cards[i]:calculate_retriggers()
						if check and check.repetitions then
							check.repetitions = check.repetitions + old_repetitions
							reps[i] = check
						end
					end
				end
				for i0, j in ipairs(reps) do
					if (type(j) == "table") and j.repetitions and (j.repetitions > 0) then
						for r = 1, j.repetitions do
							card_eval_status_text(j.card, "jokers", nil, nil, nil, j)
							local ggpn = G.GAME.probabilities.normal
							if G.jokers.cards[i].ability.cry_rigged then
								G.GAME.probabilities.normal = 1e9
							end
							local o = obj:cry_scale_mod(
								G.jokers.cards[i],
								jkr,
								orig_scale_scale,
								true_base,
								orig_scale_base,
								new_scale_base
							)
							if G.jokers.cards[i].ability.cry_rigged then
								G.GAME.probabilities.normal = ggpn
							end
							if o then
								if #dbl_info.scaler == 2 then
									if
										not (
											not jkr.ability[dbl_info.scaler[1]]
											or not jkr.ability[dbl_info.scaler[1]][dbl_info.scaler[2]]
										)
									then
										jkr.ability[dbl_info.scaler[1]][dbl_info.scaler[2]] = o
										orig_scale_scale = o
									end
								else
									if jkr.ability[dbl_info.scaler[1]] then
										jkr.ability[dbl_info.scaler[1]] = o
										orig_scale_scale = o
									end
								end
								card_eval_status_text(
									G.jokers.cards[i],
									"extra",
									nil,
									nil,
									nil,
									{ message = localize("k_upgrade_ex") }
								)
							end
						end
					end
				end
			end
		end
	end
end
