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
	-- blacklist certain jokers that we don't want to affect the scale rate of
	if
		self.ability.name == "cry-happyhouse"
		or self.ability.name == "Acrobat"
		or self.ability.name == "cry-sapling"
		or self.ability.name == "cry-mstack"
		or self.ability.name == "cry-notebook"
		or self.ability.name == "Invisible Joker"
		or self.ability.name == "cry-Old Invisible Joker"
	then
		return
	end
	if self.ability and type(self.ability) == "table" then
		-- if we've never defined a scale info table for this card ID, create a copy of its initial abilities
		-- also reset it if it's in the old format, to semi-support saves
		if
			not G.GAME.cry_double_scale[self.sort_id]
			or type(G.GAME.cry_double_scale[self.sort_id].scaler_base) == "number"
		then
			G.GAME.cry_double_scale[self.sort_id] = { ability = { double_scale = true } }
			for k, v in pairs(self.ability) do
				if type(self.ability[k]) ~= "table" then
					G.GAME.cry_double_scale[self.sort_id].ability[k] = v
				else
					G.GAME.cry_double_scale[self.sort_id].ability[k] = {}
					for _k, _v in pairs(self.ability[k]) do
						G.GAME.cry_double_scale[self.sort_id].ability[k][_k] = _v
					end
				end
			end
		end

		local dbl_info = G.GAME.cry_double_scale[self.sort_id]

		-- allow mods to define their own info if cryptid wouldn't be able to automatically detect it
		if type(self.config.center.cry_double_scale_info) == "function" then
			if not dbl_info.scaler then
				self.config.center:cry_double_scale_info(self, dbl_info)
			end
		-- handle some specific jokers manually
		elseif self.ability.name == "cry-Number Blocks" then
			dbl_info.base = { { "extra", "money" } }
			dbl_info.scaler = { { "extra", "money_mod" } }
			dbl_info.scaler_base = dbl_info.scaler_base or { self.ability.extra.money_mod }
		elseif self.ability.name == "cry-Redeo" then
			dbl_info.base = { { "extra", "money_req" } }
			dbl_info.scaler = { { "extra", "money_mod" } }
			dbl_info.scaler_base = dbl_info.scaler_base or { self.ability.extra.money_mod }
		elseif self.ability.name == "cry-Chili Pepper" then
			dbl_info.base = { { "extra", "Xmult" } }
			dbl_info.scaler = { { "extra", "Xmult_mod" } }
			dbl_info.scaler_base = dbl_info.scaler_base or { self.ability.extra.Xmult_mod }
		elseif self.ability.name == "cry-Scalae" then
			dbl_info.base = { { "extra", "scale" } }
			dbl_info.scaler = { { "extra", "scale_mod" } }
			dbl_info.scaler_base = dbl_info.scaler_base or { self.ability.extra.shadow_scale_mod }
		elseif self.ability.name == "cry-mprime" then
			dbl_info.base = { { "extra", "mult" } }
			dbl_info.scaler = { { "extra", "bonus" } }
			dbl_info.scaler_base = dbl_info.scaler_base or { self.ability.extra.bonus }
		elseif self.ability.name == "Yorick" then
			dbl_info.base = { { "x_mult" } }
			dbl_info.scaler = { { "extra", "xmult" } } --not kidding
			dbl_info.scaler_base = dbl_info.scaler_base or { 1 }
		elseif self.ability.name == "Hologram" then
			dbl_info.base = { { "x_mult" } }
			dbl_info.scaler = { { "extra" } }
			dbl_info.scaler_base = dbl_info.scaler_base or { self.ability.extra }
		elseif self.ability.name == "Gift Card" then
			dbl_info.base = { { "extra_value" } }
			dbl_info.scaler = { { "extra" } }
			dbl_info.scaler_base = dbl_info.scaler_base or { self.ability.extra }
		elseif self.ability.name == "Egg" then
			dbl_info.base = { { "extra_value" } }
			dbl_info.scaler = { { "extra" } }
			dbl_info.scaler_base = dbl_info.scaler_base or { self.ability.extra }
		-- ignore completely, we handle this separately
		elseif
			self.ability.name == "Throwback"
			or self.ability.name == "cry-Exponentia"
			or self.ability.name == "cry-Compound Interest"
		then
		-- now, we try to define any other jokers' scale info ourselves
		else
			-- initialize the tables we'll be using to store scale info in
			dbl_info.base = dbl_info.base or {} -- keys of values that are getting scaled
			dbl_info.scaler = dbl_info.scaler or {} -- keys of factors that increase those values
			dbl_info.scaler_base = dbl_info.scaler_base or {} -- the original value of the scale factor
			dbl_info.scaler_tracker = dbl_info.scaler_tracker or {} -- list of keys that we've written info for already_exists
			-- list of default calculation fields and their default state; we can skip these
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
			for k, v in pairs(self.ability) do
				if
					k ~= "extra_value" -- extra_value is ignored because it can be scaled by Gift Card
					and not dbl_info.scaler_tracker[k] -- skip if we've already tracked this field
					and dbl_info.ability[k] ~= v -- compare the original value against its current one to see if it has changed
					and is_number(v)
					and is_number(dbl_info.ability[k])
				then
					-- we found a new value that's changed since its initial creation
					-- now we want to figure out scaler info for it
					local info_i = #dbl_info.base + 1
					dbl_info.base[info_i] = { k }
					dbl_info.scaler_tracker[k] = true

					-- get the difference between the current value and the initial value
					-- we'll use this to determine which ability field is most likely the scaler
					local predicted_mod = math.abs(to_number(to_big(v)) - to_number(to_big(dbl_info.ability[k])))
					local best_key = { "" }
					local best_coeff = 10 ^ 100
					-- loop through each value in the ability table to find the best match
					-- start with extra because that's most likely to have the value we want in it
					if type(self.ability.extra) == "table" then
						for l, u in pairs(self.ability.extra) do
							if
								not dbl_info.scaler_tracker["extra/" .. l] -- skip if we've used this field before
								and is_number(u) -- and if it's not a number
								-- if the difference is extremely close, and we haven't found an even better match,
								-- then mark this as the best fit so far
								and to_number(to_big(predicted_mod / u)) >= 0.999
								and to_number(to_big(predicted_mod / u)) < to_number(to_big(best_coeff))
							then
								best_coeff = to_number(to_big(predicted_mod / u))
								best_key = { "extra", l }
							end
						end
					end
					-- then do the rest
					for l, u in pairs(self.ability) do
						-- skip the field if it's one of the default calc values, we know it's not the scaler
						if not (default_modifiers[l] and default_modifiers[l] == u) then
							if not dbl_info.scaler_tracker[l] and is_number(u) then
								-- if the difference is extremely close, and we haven't found an even better match,
								-- then mark this as the best fit so far
								if
									to_number(to_big(predicted_mod / u)) >= 0.999
									and to_number(to_big(predicted_mod / u)) < to_number(to_big(best_coeff))
								then
									best_coeff = to_number(to_big(predicted_mod / u))
									best_key = { l }
								end
							end
							if type(self.ability[l]) == "table" and l ~= "extra" then
								-- again but for values within other contained tables, excluding extra bc we checked that already
								for _l, _u in pairs(self.ability[l]) do
									if
										not dbl_info.scaler_tracker[l .. "/" .. _l]
										and is_number(_u)
										and to_number(to_big(predicted_mod / _u)) >= 0.999
										and to_number(to_big(predicted_mod / _u)) < to_number(to_big(best_coeff))
									then
										best_coeff = to_number(to_big(predicted_mod / _u))
										best_key = { l, _l }
									end
								end
							end
						end
					end
					dbl_info.scaler[info_i] = best_key
					local tracker_key = best_key[1]
					if #best_key == 2 then
						tracker_key = best_key[1] .. "/" .. best_key[2]
					end
					dbl_info.scaler_tracker[tracker_key] = true
				end
				-- again but for contained tables again
				if
					type(self.ability[k]) == "table"
					and type(dbl_info.ability) == "table"
					and type(dbl_info.ability[k]) == "table"
				then
					for _k, _v in pairs(self.ability[k]) do
						if
							not dbl_info.scaler_tracker[k .. "/" .. _k]
							and dbl_info.ability[k][_k] ~= _v
							and is_number(_v)
							and is_number(dbl_info.ability[k][_k])
						then
							local info_i = #dbl_info.base + 1
							dbl_info.base[info_i] = { k, _k }
							dbl_info.scaler_tracker[k .. "/" .. _k] = true

							local predicted_mod = math.abs(_v - dbl_info.ability[k][_k])
							local best_key = { "" }
							local best_coeff = 10 ^ 100
							for l, u in pairs(self.ability) do
								if
									not dbl_info.scaler_tracker[l]
									and is_number(u)
									and to_number(to_big(predicted_mod / u)) >= 0.999
								then
									if to_number(to_big(predicted_mod / u)) < to_number(to_big(best_coeff)) then
										best_coeff = to_number(to_big(predicted_mod / u))
										best_key = { l }
									end
								end
								if type(self.ability[l]) == "table" then
									-- Again!
									for _l, _u in pairs(self.ability[l]) do
										if
											not dbl_info.scaler_tracker[l .. "/" .. _l]
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
							dbl_info.scaler[info_i] = best_key
							local tracker_key = best_key[1]
							if #best_key == 2 then
								tracker_key = best_key[1] .. "/" .. best_key[2]
							end
							dbl_info.scaler_tracker[tracker_key] = true
						end
					end
				end
			end
			-- define the base values for any newly defined info
			for info_i = 1, #dbl_info.scaler do
				if not dbl_info.scaler_base[info_i] then
					dbl_info.scaler_base[info_i] = #dbl_info.scaler[info_i] == 2
							and orig_ability[dbl_info.scaler[info_i][1]][dbl_info.scaler[info_i][2]]
						or orig_ability[dbl_info.scaler[info_i][1]]
				end
			end
		end
	end

	-- now, if the joker has scaler info defined, do the actual double scale stuff
	if
		G.GAME.cry_double_scale[self.sort_id]
		and G.GAME.cry_double_scale[self.sort_id].scaler
		and #G.GAME.cry_double_scale[self.sort_id].scaler > 0
	then
		local dbl_info = G.GAME.cry_double_scale[self.sort_id]
		-- loop through each value in the scaler info and see what changed
		for info_i = 1, #dbl_info.scaler do
			-- get the original value of the variable and its scaling factor
			local orig_scale_base = nil
			local orig_scale_scale = nil
			if #dbl_info.base[info_i] == 2 then
				if -- bunch of safety checks
					not (
						type(self.ability) ~= "table"
						or not orig_ability[dbl_info.base[info_i][1]]
						or type(orig_ability[dbl_info.base[info_i][1]]) ~= "table"
						or not orig_ability[dbl_info.base[info_i][1]][dbl_info.base[info_i][2]]
					)
				then
					orig_scale_base = orig_ability[dbl_info.base[info_i][1]][dbl_info.base[info_i][2]]
				end
			else
				if self.ability[dbl_info.base[info_i][1]] then
					orig_scale_base = orig_ability[dbl_info.base[info_i][1]]
				end
			end
			if #dbl_info.scaler[info_i] == 2 then
				if
					not (
						not orig_ability[dbl_info.scaler[info_i][1]]
						or type(orig_ability[dbl_info.scaler[info_i][1]]) == "number"
						or not orig_ability[dbl_info.scaler[info_i][1]][dbl_info.scaler[info_i][2]]
					)
				then
					orig_scale_scale = orig_ability[dbl_info.scaler[info_i][1]][dbl_info.scaler[info_i][2]]
				end
			else
				if orig_ability[dbl_info.scaler[info_i][1]] then
					orig_scale_scale = orig_ability[dbl_info.scaler[info_i][1]]
				end
			end

			if orig_scale_base and orig_scale_scale then
				-- get the *current* value of the variable
				local new_scale_base = nil
				if #dbl_info.base[info_i] == 2 then
					if
						not (
							type(self.ability) ~= "table"
							or not self.ability[dbl_info.base[info_i][1]]
							or type(self.ability[dbl_info.base[info_i][1]]) ~= "table"
							or not self.ability[dbl_info.base[info_i][1]][dbl_info.base[info_i][2]]
						)
					then
						new_scale_base = self.ability[dbl_info.base[info_i][1]][dbl_info.base[info_i][2]]
					end
				else
					if self.ability[dbl_info.base[info_i][1]] then
						new_scale_base = self.ability[dbl_info.base[info_i][1]]
					end
				end
				local true_base = dbl_info.scaler_base[info_i]
				-- if the new value is different from the previous value, then it has been scaled
				if new_scale_base and (to_big(math.abs(new_scale_base - orig_scale_base)) > to_big(0)) then
					-- now, check for any jokers that affect scaling
					for i = 1, #G.jokers.cards do
						local obj = G.jokers.cards[i].config.center
						-- found one!
						if obj.cry_scale_mod and type(obj.cry_scale_mod) == "function" then
							-- rig the probabilities in case that matters for the joker's scaling function
							local ggpn = G.GAME.probabilities.normal
							if G.jokers.cards[i].ability.cry_rigged then
								G.GAME.probabilities.normal = 1e9
							end

							-- 'o' will be the new factor that the joker should scale by next time
							local o = obj:cry_scale_mod(
								G.jokers.cards[i],
								self,
								orig_scale_scale,
								true_base,
								orig_scale_base,
								new_scale_base
							)

							-- return probabilities to normal
							if G.jokers.cards[i].ability.cry_rigged then
								G.GAME.probabilities.normal = ggpn
							end

							-- the function returned a value, do the scale setting with it
							if o then
								-- set the scale factor field to 'o'
								if #dbl_info.scaler[info_i] == 2 then
									if
										not (
											not self.ability[dbl_info.scaler[info_i][1]]
											or not self.ability[dbl_info.scaler[info_i][1]][dbl_info.scaler[info_i][2]]
										)
									then
										self.ability[dbl_info.scaler[info_i][1]][dbl_info.scaler[info_i][2]] = o
										orig_scale_scale = o
									end
								else
									if self.ability[dbl_info.scaler[info_i][1]] then
										self.ability[dbl_info.scaler[info_i][1]] = o
										orig_scale_scale = o
									end
								end
								-- Upgrade!
								card_eval_status_text(
									G.jokers.cards[i],
									"extra",
									nil,
									nil,
									nil,
									{ message = localize("k_upgrade_ex") }
								)
							end

							-- now, let's check for repetitions on the scale-affecting jokers
							local reps = {}
							for j = 1, #G.jokers.cards do
								local ggpn = G.GAME.probabilities.normal
								if G.jokers.cards[j].ability.cry_rigged then
									G.GAME.probabilities.normal = 1e9
								end
								-- check if another joker is retriggering our scale-affecting joker
								local check = cj(
									G.jokers.cards[j],
									{ retrigger_joker_check = true, other_card = G.jokers.cards[i] }
								)
								if G.jokers.cards[j].ability.cry_rigged then
									G.GAME.probabilities.normal = ggpn
								end
								-- keep track of which joker retriggers the scale-joker
								if type(check) == "table" then
									reps[j] = check and check.repetitions and check or 0
								else
									reps[j] = 0
								end
								-- also check if the edition of the scale-joker will retrigger it
								if
									G.jokers.cards[j] == G.jokers.cards[i]
									and G.jokers.cards[i].edition
									and G.jokers.cards[i].edition.retriggers
								then
									local old_repetitions = reps[i] ~= 0 and reps[i].repetitions or 0
									-- never mind?
									local check = false --G.jokers.cards[i]:calculate_retriggers()
									if check and check.repetitions then
										check.repetitions = check.repetitions + old_repetitions
										reps[i] = check
									end
								end
							end
							-- loop through the repetitions now
							-- i changed 'j' to be the index instead of the value this isn't confusing at all
							for j, rep in pairs(reps) do
								if (type(rep) == "table") and rep.repetitions and (rep.repetitions > 0) then
									for r = 1, rep.repetitions do
										card_eval_status_text(rep.card, "jokers", nil, nil, nil, rep)
										-- now, same thing as before, apply the scale-joker
										local ggpn = G.GAME.probabilities.normal
										if G.jokers.cards[i].ability.cry_rigged then
											G.GAME.probabilities.normal = 1e9
										end
										local o = obj:cry_scale_mod(
											G.jokers.cards[i],
											self,
											orig_scale_scale,
											true_base,
											orig_scale_base,
											new_scale_base
										)
										if G.jokers.cards[i].ability.cry_rigged then
											G.GAME.probabilities.normal = ggpn
										end

										if o then
											if #dbl_info.scaler[info_i] == 2 then
												if
													not (
														not self.ability[dbl_info.scaler[info_i][1]]
														or not self.ability[dbl_info.scaler[info_i][1]][dbl_info.scaler[info_i][2]]
													)
												then
													self.ability[dbl_info.scaler[info_i][1]][dbl_info.scaler[info_i][2]] =
														o
													orig_scale_scale = o
												end
											else
												if self.ability[dbl_info.scaler[info_i][1]] then
													self.ability[dbl_info.scaler[info_i][1]] = o
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
	if
		(next(find_joker("cry-Scalae")) or next(find_joker("cry-Double Scale")))
		or (active_side.ability.name == "cry-Exponentia" or "cry-Compound Interest")
	then
		active_side:cry_double_scale_calc(orig_ability, in_context_scaling)
	end
	return ret, trig
end

-- used to manually apply scaling if it scales outside of a calculation
function Cryptid.apply_scale_mod(jkr, orig_scale_scale, orig_scale_base, new_scale_base, scaler_info)
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
		if
			G.GAME.cry_double_scale[jkr.sort_id]
			and scaler_info
			and (not G.GAME.cry_double_scale[jkr.sort_id].scaler or #G.GAME.cry_double_scale[jkr.sort_id].scaler == 0)
		then
			for k, v in pairs(scaler_info) do
				G.GAME.cry_double_scale[jkr.sort_id][k] = v
			end
		end
	end
	local dbl_info = G.GAME.cry_double_scale[jkr.sort_id]
	if not dbl_info then
		return
	end
	for info_i = 1, #dbl_info.scaler do
		local true_base = dbl_info.scaler_base[info_i]
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
					if #dbl_info.scaler[info_i] == 2 then
						if
							not (
								not jkr.ability[dbl_info.scaler[info_i][1]]
								or not jkr.ability[dbl_info.scaler[info_i][1]][dbl_info.scaler[info_i][2]]
							)
						then
							jkr.ability[dbl_info.scaler[info_i][1]][dbl_info.scaler[info_i][2]] = o
							orig_scale_scale = o
						end
					else
						if jkr.ability[dbl_info.scaler[info_i][1]] then
							jkr.ability[dbl_info.scaler[info_i][1]] = o
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
				for j = 1, #G.jokers.cards do
					local ggpn = G.GAME.probabilities.normal
					if G.jokers.cards[j].ability.cry_rigged then
						G.GAME.probabilities.normal = 1e9
					end
					local check =
						cj(G.jokers.cards[j], { retrigger_joker_check = true, other_card = G.jokers.cards[i] })
					if G.jokers.cards[j].ability.cry_rigged then
						G.GAME.probabilities.normal = ggpn
					end
					if type(check) == "table" then
						reps[j] = check and check.repetitions and check or 0
					else
						reps[j] = 0
					end
					if
						G.jokers.cards[j] == G.jokers.cards[i]
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
				for j, rep in pairs(reps) do
					if (type(rep) == "table") and rep.repetitions and (rep.repetitions > 0) then
						for r = 1, rep.repetitions do
							card_eval_status_text(rep.card, "jokers", nil, nil, nil, rep)
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
								if #dbl_info.scaler[info_i] == 2 then
									if
										not (
											not jkr.ability[dbl_info.scaler[info_i][1]]
											or not jkr.ability[dbl_info.scaler[info_i][1]][dbl_info.scaler[info_i][2]]
										)
									then
										jkr.ability[dbl_info.scaler[info_i][1]][dbl_info.scaler[info_i][2]] = o
										orig_scale_scale = o
									end
								else
									if jkr.ability[dbl_info.scaler[info_i][1]] then
										jkr.ability[dbl_info.scaler[info_i][1]] = o
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
