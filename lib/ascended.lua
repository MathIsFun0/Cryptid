-- ascended.lua - Used for Ascended Hands

G.FUNCS.cry_asc_UI_set = function(e)
	if G.GAME.cry_exploit_override then
		e.config.object.colours = { darken(G.C.SECONDARY_SET.Code, 0.2) }
	else
		e.config.object.colours = { G.C.GOLD }
	end
	e.config.object:update_text()
end

-- Needed because get_poker_hand_info isnt called at the end of the road
local evaluateroundref = G.FUNCS.evaluate_round
function G.FUNCS.evaluate_round()
	evaluateroundref()
	-- This is just the easiest way to check if its gold because lua is annoying
	if G.C.UI_CHIPS[1] == G.C.GOLD[1] then
		ease_colour(G.C.UI_CHIPS, G.C.BLUE, 0.3)
		ease_colour(G.C.UI_MULT, G.C.RED, 0.3)
	end
end

-- this is a hook to make funny "x of a kind"/"flush x" display text
local pokerhandinforef = G.FUNCS.get_poker_hand_info
function G.FUNCS.get_poker_hand_info(_cards)
	local text, loc_disp_text, poker_hands, scoring_hand, disp_text = pokerhandinforef(_cards)
	-- Display text if played hand contains a Cluster and a Bulwark
	-- Not Ascended hand related but this hooks in the same spot so i'm lumping it here anyways muahahahahahaha
	if text == "cry_Clusterfuck" then
		if next(poker_hands["cry_Bulwark"]) then
			disp_text = "cry-Cluster Bulwark"
			loc_disp_text = localize(disp_text, "poker_hands")
		end
	end

	if G.SETTINGS.language == "en-us" then
		if #scoring_hand > 5 and (text == "Flush Five" or text == "Five of a Kind") then
			local rank_array = {}
			local county = 0
			for i = 1, #scoring_hand do
				local val = scoring_hand[i]:get_id()
				rank_array[val] = (rank_array[val] or 0) + 1
				if rank_array[val] > county then
					county = rank_array[val]
				end
			end
			local function create_num_chunk(int) -- maybe useful enough to not be local? but tbh this function is probably some common coding exercise
				if int >= 1000 then
					int = 999
				end
				local ones = {
					["1"] = "One",
					["2"] = "Two",
					["3"] = "Three",
					["4"] = "Four",
					["5"] = "Five",
					["6"] = "Six",
					["7"] = "Seven",
					["8"] = "Eight",
					["9"] = "Nine",
				}
				local tens = {
					["1"] = "Ten",
					["2"] = "Twenty",
					["3"] = "Thirty",
					["4"] = "Forty",
					["5"] = "Fifty",
					["6"] = "Sixty",
					["7"] = "Seventy",
					["8"] = "Eighty",
					["9"] = "Ninety",
				}
				local str_int = string.reverse(int .. "") -- ehhhh whatever
				local str_ret = ""
				for i = 1, string.len(str_int) do
					local place = str_int:sub(i, i)
					if place ~= "0" then
						if i == 1 then
							str_ret = ones[place]
						elseif i == 2 then
							if place == "1" and str_ret ~= "" then -- admittedly not my smartest moment, i dug myself into a hole here...
								if str_ret == "One" then
									str_ret = "Eleven"
								elseif str_ret == "Two" then
									str_ret = "Twelve"
								elseif str_ret == "Three" then
									str_ret = "Thirteen"
								elseif str_ret == "Five" then
									str_ret = "Fifteen"
								elseif str_ret == "Eight" then
									str_ret = "Eighteen"
								else
									str_ret = str_ret .. "teen"
								end
							else
								str_ret = tens[place] .. ((string.len(str_ret) > 0 and " " or "") .. str_ret)
							end
						elseif i == 3 then
							str_ret = ones[place]
								.. (" Hundred" .. ((string.len(str_ret) > 0 and " and " or "") .. str_ret))
						end -- this line is wild
					end
				end
				return str_ret
			end
			-- text gets stupid small at 100+ anyway
			loc_disp_text = (text == "Flush Five" and "Flush " or "")
				.. (
					(county < 1000 and create_num_chunk(county) or "Thousand")
					.. (text == "Five of a Kind" and " of a Kind" or "")
				)
		end
	end
	local hand_table = {
		["High Card"] = G.GAME.used_vouchers.v_cry_hyperspacetether and 1 or nil,
		["Pair"] = G.GAME.used_vouchers.v_cry_hyperspacetether and 2 or nil,
		["Two Pair"] = 4,
		["Three of a Kind"] = G.GAME.used_vouchers.v_cry_hyperspacetether and 3 or nil,
		["Straight"] = next(SMODS.find_card("j_four_fingers")) and Cryptid.gameset() ~= "modest" and 4 or 5,
		["Flush"] = next(SMODS.find_card("j_four_fingers")) and Cryptid.gameset() ~= "modest" and 4 or 5,
		["Full House"] = 5,
		["Four of a Kind"] = G.GAME.used_vouchers.v_cry_hyperspacetether and 4 or nil,
		["Straight Flush"] = next(SMODS.find_card("j_four_fingers")) and Cryptid.gameset() ~= "modest" and 4 or 5, --debatable
		["cry_Bulwark"] = 5,
		["Five of a Kind"] = 5,
		["Flush House"] = 5,
		["Flush Five"] = 5,
		["cry_Clusterfuck"] = 8,
		["cry_UltPair"] = 8,
		["cry_WholeDeck"] = 52,
	}
	-- Change mult and chips colors if hand is ascended
	if hand_table[text] and next(scoring_hand) and #scoring_hand > hand_table[text] then
		ease_colour(G.C.UI_CHIPS, copy_table(G.C.GOLD), 0.3)
		ease_colour(G.C.UI_MULT, copy_table(G.C.GOLD), 0.3)
	else
		ease_colour(G.C.UI_CHIPS, G.C.BLUE, 0.3)
		ease_colour(G.C.UI_MULT, G.C.RED, 0.3)
	end
	-- this is where all the logic for asc hands is. currently it's very simple but if you want more complex logic, here's the place to do it
	if hand_table[text] and Cryptid.enabled("set_cry_poker_hand_stuff") == true then
		G.GAME.current_round.current_hand.cry_asc_num = G.GAME.used_vouchers.v_cry_hyperspacetether
				and #_cards - hand_table[text]
			or #scoring_hand - hand_table[text]
	else
		G.GAME.current_round.current_hand.cry_asc_num = 0
	end

	G.GAME.current_round.current_hand.cry_asc_num = math.max(0, G.GAME.current_round.current_hand.cry_asc_num)
	if G.GAME.cry_exploit_override then
		G.GAME.current_round.current_hand.cry_asc_num = G.GAME.current_round.current_hand.cry_asc_num + 1
	end

	G.GAME.current_round.current_hand.cry_asc_num_text = (
		G.GAME.current_round.current_hand.cry_asc_num
		and (
			type(G.GAME.current_round.current_hand.cry_asc_num) == "table"
				and G.GAME.current_round.current_hand.cry_asc_num:gt(to_big(0))
			or G.GAME.current_round.current_hand.cry_asc_num > 0
		)
	)
			and " (+" .. G.GAME.current_round.current_hand.cry_asc_num .. ")"
		or ""
	return text, loc_disp_text, poker_hands, scoring_hand, disp_text
end
function Cryptid.ascend(num) -- edit this function at your leisure
	if Cryptid.enabled("set_cry_poker_hand_stuff") ~= true then
		return num
	end
	if Cryptid.gameset() == "modest" then
		-- x(1.1 + 0.05 per sol) base, each card gives + (0.1 + 0.05 per sol)
		if not G.GAME.current_round.current_hand.cry_asc_num then
			return num
		end
		if G.GAME.current_round.current_hand.cry_asc_num <= 0 then
			return num
		end
		return math.max(
			num,
			num
				* (
					1
					+ 0.1
					+ to_big(G.GAME.sunnumber or 0)
					+ to_big(
						(0.1 + (G.GAME.sunnumber or 0)) * to_big(G.GAME.current_round.current_hand.cry_asc_num or 0)
					)
				)
		)
	else
		return math.max(
			num,
			num * to_big((1.25 + (G.GAME.sunnumber or 0)) ^ to_big(G.GAME.current_round.current_hand.cry_asc_num or 0))
		)
	end
end
function Cryptid.pulse_flame(duration, intensity) -- duration is in seconds, intensity is in idfk honestly, but it increases pretty quickly
	G.cry_flame_override = G.cry_flame_override or {}
	G.cry_flame_override["duration"] = duration or 0.01
	G.cry_flame_override["intensity"] = intensity or 2
end
