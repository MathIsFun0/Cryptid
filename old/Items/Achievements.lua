local achievement_atlas = {
	object_type = "Atlas",
	key = "achievements",
	path = "cry_achievements.png",
	px = 66,
	py = 66,
}

local break_infinity = {
	object_type = "Achievement",
	key = "break_infinity",
	order = 1,
	bypass_all_unlocked = true,
	atlas = "cry_achievements",
	--reset_on_startup = true,
	unlock_condition = function(self, args)
		if args.type == "chip_score" and to_big(args.chips) >= to_big(2) ^ to_big(1024) then
			return true
		end
	end,
}

local used_crash = {
	object_type = "Achievement",
	key = "used_crash",
	order = 2,
	bypass_all_unlocked = true,
	atlas = "cry_achievements",
	--reset_on_startup = true,
	unlock_condition = function(self, args)
		if
			args.type == "ach_cry_used_crash"
			and G.PROFILES[G.SETTINGS.profile].consumeable_usage["c_cry_crash"]
			and G.PROFILES[G.SETTINGS.profile].consumeable_usage["c_cry_crash"].count > 0
		then
			return true
		end
	end,
}

local haxxor = {
	object_type = "Achievement",
	key = "haxxor",
	order = 3,
	bypass_all_unlocked = true,
	atlas = "cry_achievements",
	--reset_on_startup = true,
	unlock_condition = function(self, args)
		if args.type == "cheat_used" then
			return true
		end
	end,
}

local googol_play_pass = {
	object_type = "Achievement",
	key = "googol_play_pass",
	order = 4,
	bypass_all_unlocked = true,
	atlas = "cry_achievements",
	--reset_on_startup = true,
	unlock_condition = function(self, args)
		if args.type == "googol_play_rigged" then
			return true
		end
	end,
}

local bullet_hell = {
	object_type = "Achievement",
	key = "bullet_hell",
	order = 5,
	bypass_all_unlocked = true,
	atlas = "cry_achievements",
	--reset_on_startup = true,
	unlock_condition = function(self, args)
		if args.type == "modify_jokers" then
			local ap_joker_count = 0

			if G.jokers then
				for i = 1, #G.jokers.cards do
					if G.jokers.cards[i].config.center.key == "j_cry_apjoker" then
						ap_joker_count = ap_joker_count + 1
					end
				end
			end

			if ap_joker_count >= 15 then
				return true
			end
		end
	end,
}

local what_have_you_done = {
	object_type = "Achievement",
	key = "what_have_you_done",
	order = 6,
	bypass_all_unlocked = true,
	atlas = "cry_achievements",
	--reset_on_startup = true,
	unlock_condition = function(self, args)
		if args.type == "what_have_you_done" then
			return true
		end
	end,
}

local cryptid_the_cryptid = {
	object_type = "Achievement",
	key = "cryptid_the_cryptid",
	order = 7,
	bypass_all_unlocked = true,
	atlas = "cry_achievements",
	--reset_on_startup = true,
	unlock_condition = function(self, args)
		if args.type == "cryptid_the_cryptid" then
			return true
		end
	end,
}

local niw_uoy = {
	object_type = "Achievement",
	key = "niw_uoy",
	order = 8,
	bypass_all_unlocked = true,
	atlas = "cry_achievements",
	--reset_on_startup = true,
	unlock_condition = function(self, args)
		if args.type == "ante_up" and args.ante <= -8 then
			return true
		end
	end,
}

local jokes_on_you = {
	object_type = "Achievement",
	key = "jokes_on_you",
	order = 9,
	bypass_all_unlocked = true,
	atlas = "cry_achievements",
	--reset_on_startup = true,
	unlock_condition = function(self, args) --NOTE: Might be buggy due to G.GAME saving
		if args.type == "win" and G.GAME.cry_ach_conditions.the_jokes_on_you_triggered == true then
			return true
		end
	end,
}

local now_the_fun_begins = {
	object_type = "Achievement",
	key = "now_the_fun_begins",
	order = 10,
	bypass_all_unlocked = true,
	atlas = "cry_achievements",
	--reset_on_startup = true,
	unlock_condition = function(self, args)
		if args.type == "modify_jokers" then
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i].config.center.key == "j_cry_canvas" then
					return true
				end
			end
		end
	end,
}

local blurred_blurred_joker = {
	object_type = "Achievement",
	key = "blurred_blurred_joker",
	order = 11,
	bypass_all_unlocked = true,
	atlas = "cry_achievements",
	--reset_on_startup = true,
	unlock_condition = function(self, args)
		if args.type == "modify_jokers" then
			for i = 1, #G.jokers.cards do
				if
					G.jokers.cards[i].config.center.key == "j_cry_blurred"
					and (G.jokers.cards[i].edition and G.jokers.cards[i].edition.cry_blur)
				then
					return true
				end
			end
		end
	end,
}

local exodia = {
	object_type = "Achievement",
	key = "exodia",
	order = 12,
	bypass_all_unlocked = true,
	atlas = "cry_achievements",
	--reset_on_startup = true,
	unlock_condition = function(self, args)
		if args.type == "modify_jokers" then
			local exotic_count = 0

			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i].config.center.rarity == "cry_exotic" then
					exotic_count = exotic_count + 1
				end
			end

			if exotic_count >= 5 then
				return true
			end
		end
	end,
}

local freak_house = {
	object_type = "Achievement",
	key = "freak_house",
	order = 13,
	bypass_all_unlocked = true,
	atlas = "cry_achievements",
	--reset_on_startup = true,
	unlock_condition = function(self, args) -- NOTE: I hate doing checks like this. Unscuff later
		if args.type == "hand" then
			-- Do you have Nice
			local has_nice
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i].config.center.key == "j_cry_nice" then
					has_nice = true
				end
			end

			--Is it a hearts flush house
			local total_6s = 0
			local total_9s = 0
			local total_hearts = 0
			for k, v in ipairs(args.scoring_hand) do
				if v:is_suit("Hearts", nil, true) then
					total_hearts = total_hearts + 1
				end
				if v:get_id() == 6 then
					total_6s = total_6s + 1
				elseif v:get_id() == 9 then
					total_9s = total_9s + 1
				end
			end

			if
				has_nice
				and ((total_6s == 3 and total_9s == 2) or (total_6s == 2 and total_9s == 3))
				and total_hearts == 5
				and args.disp_text == "Flush House"
			then
				return true
			end
		end
	end,
}

local ult_full_skip = {
	object_type = "Achievement",
	key = "ult_full_skip",
	order = 14,
	bypass_all_unlocked = true,
	atlas = "cry_achievements",
	--reset_on_startup = true,
	unlock_condition = function(self, args)
		if args.type == "win" and G.GAME.round == 1 then
			return true
		end
	end,
}

local patience_virtue = {
	object_type = "Achievement",
	key = "patience_virtue",
	order = 15,
	bypass_all_unlocked = true,
	hidden_text = true,
	pos = { x = 2, y = 0 },
	atlas = "cry_achievements",
	--reset_on_startup = true,
	unlock_condition = function(self, args)
		if args.type == "round_win" then
			if
				G.GAME.blind.config.blind.key == "bl_cry_lavender_loop"
				and G.GAME.cry_ach_conditions.patience_virtue_earnable == true
			then
				return true
			end
			if G.GAME.cry_ach_conditions.patience_virtue_earnable then
				G.GAME.cry_ach_conditions.patience_virtue_earnable = nil
			end
			if G.GAME.cry_ach_conditions.patience_virtue_timer then
				G.GAME.cry_ach_conditions.patience_virtue_timer = nil
			end
		end
	end,
}

local pull_request = {
	object_type = "Achievement",
	key = "pull_request",
	order = 16,
	bypass_all_unlocked = true,
	hidden_text = true,
	pos = { x = 2, y = 0 },
	atlas = "cry_achievements",
	--reset_on_startup = true,
	unlock_condition = function(self, args)
		if args.type == "pr_unlock" then
			return true
		end
	end,
}

local ace_through_crash = {
	object_type = "Achievement",
	key = "ace_in_crash",
	order = 17,
	bypass_all_unlocked = true,
	pos = { x = 2, y = 0 },
	atlas = "cry_achievements",
	--reset_on_startup = true,
	unlock_condition = function(self, args)
		if args.type == "ace_in_crash" then
			return true
		end
	end,
}

local home_realtor = {
	object_type = "Achievement",
	key = "home_realtor",
	order = 18,
	bypass_all_unlocked = true,
	hidden_text = true,
	pos = { x = 2, y = 0 },
	atlas = "cry_achievements",
	--reset_on_startup = true,
	unlock_condition = function(self, args)
		--todo: check for doe/antimatter sleeves
		if args.type == "home_realtor" then
			return true
		end
	end,
}

local traffic_jam = {
	object_type = "Achievement",
	key = "traffic_jam",
	order = 19,
	bypass_all_unlocked = true,
	hidden_text = true,
	pos = { x = 2, y = 0 },
	atlas = "cry_achievements",
	--reset_on_startup = true,
	unlock_condition = function(self, args)
		if args.type == "win_challenge" or args.type == "win_challenge_startup" then
			local rush_hours_beaten = 0

			if G.PROFILES[G.SETTINGS.profile].challenge_progress.completed["c_cry_rush_hour"] then
				rush_hours_beaten = rush_hours_beaten + 1
			end
			if G.PROFILES[G.SETTINGS.profile].challenge_progress.completed["c_cry_rush_hour_ii"] then
				rush_hours_beaten = rush_hours_beaten + 1
			end
			if G.PROFILES[G.SETTINGS.profile].challenge_progress.completed["c_cry_rush_hour_iii"] then
				rush_hours_beaten = rush_hours_beaten + 1
			end

			if rush_hours_beaten == 3 then
				return true
			end
		end
	end,
}

local perfectly_balanced = {
	object_type = "Achievement",
	key = "perfectly_balanced",
	order = 20,
	bypass_all_unlocked = true,
	hidden_text = true,
	pos = { x = 2, y = 0 },
	atlas = "cry_achievements",
	--reset_on_startup = true,
	unlock_condition = function(self, args)
		if args.type == "win_stake" or args.type == "win_stake_startup" then
			if
				(G.GAME.selected_back.effect.center.key == "b_cry_very_fair" and G.GAME.stake == 32)
				or get_deck_win_stake("b_cry_very_fair") == 32
			then
				return true
			end
		end
	end,
}

-- TODO: Add new Achievements.
-- Current Ideas (Normal):
-- Cry: Win a run with only Sob and Obelisk
-- Overtuned: Have any Glitched item give either 100x or 0.01x its original values
-- Current Ideas (Platinum):

-- Implemented (Normal)
-- Break Infinity: Score more than 1.57e308 in one hand
-- H4xx0r: Use a cheat code
-- We Told You Not To: Use ://CRASH
-- Googol Play Pass: Rig a Googol Play Card
-- Bullet Hell: Have 15 copies of AP Joker
-- !niW uoY: Reach Ante -8
-- Now the Fun Begins: Obtain Canvas
-- Exodia: Have 5 Exotic Jokers
-- WHAT HAVE YOU DONE: Delete or Sacrifice an Exotic Joker
-- Joke's on You, Pal!: Trigger The Joke's effect on Ante 1 and win the run
-- Freak House: Play a Flush House consisting of 6s and 9s of Hearts whilst possessing Nice
-- Ultimate Full Skip: Win in 1 round
-- Legally Blind: Obtain a Blurred Blurred Joker
-- Cryptid the Cryptid: Use Cryptid on Cryptid
-- Implemented (Platinum)
-- Patience is a Virtue: Wait out Lavender Loop for 2 minutes before playing first hand and beat it
-- Pull Request: Have ://COMMIT spawn the same Joker that it destroyed
-- Pocket ACE: Only unlockable through using ACE to unlock
-- Home Realtor: Activate Happy House before Ante 8 (without DoE/Antimatter)
-- Traffic Jam: Win all Rush Hour challenges
-- Perfectly Balanced: Beat Very Fair Deck on Ascendant Stake

local achievement_objects = {
	achievement_atlas,
	break_infinity,
	bullet_hell,
	cryptid_the_cryptid,
	now_the_fun_begins,
	blurred_blurred_joker,
	exodia,
	what_have_you_done,
	used_crash,
	haxxor,
	googol_play_pass,
	pull_request,
	niw_uoy,
	jokes_on_you,
	freak_house,
	ult_full_skip,
	patience_virtue,
	ace_through_crash,
	home_realtor,
	traffic_jam,
	perfectly_balanced,
}
return { name = "Achievements", init = function() end, items = achievement_objects }
