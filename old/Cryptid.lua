--- STEAMODDED HEADER
--- MOD_NAME: Cryptid
--- MOD_ID: Cryptid
--- PREFIX: cry
--- MOD_AUTHOR: [MathIsFun_, Cryptid and Balatro Discords]
--- MOD_DESCRIPTION: Adds unbalanced ideas to Balatro.
--- BADGE_COLOUR: 708b91
--- DEPENDENCIES: [Talisman>=2.0.0-beta8, Steamodded>=1.0.0~ALPHA-1103a]
--- VERSION: 0.5.2~1108a
--- PRIORITY: 99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999

----------------------------------------------
------------MOD CODE -------------------------

-- Currently there's no rhyme or reason to how the contents of this file are organized. It's kind of just an "anything goes" sort of file.
-- If you're learning about Cryptid's codebase, the files in the Items folder are generally much more organized.

-- Enables debug features (I think this is currently useless.)
--Cryptid.debug = true

-- These files are going to be whittled away over time as more and more of this gets moved to the new rewrite.
-- Just letting you know in advance :)

-- Save the mod path permanently.
local mod_path = "" .. SMODS.current_mod.path
-- Load Options
Cryptid_config = SMODS.current_mod.config
-- This will save the current state even when settings are modified
Cryptid.enabled = copy_table(Cryptid_config)
--backwards compat moment
cry_enable_jokers = Cryptid.enabled["Misc. Jokers"]
cry_enable_epics = Cryptid.enabled["Epic Jokers"]
cry_enable_exotics = Cryptid.enabled["Exotic Jokers"]
cry_minvasion = Cryptid.enabled["M Jokers"]

-- Gradient isn't included since other logic seems to also handle it

--todo:  Calculations for Please Take One. Incredibly scuffed and should get moved to Spooky file later
local gure = Game.update_round_eval
function Game:update_round_eval(dt)
	if G.GAME.events.ev_cry_choco6 and not pack_opened and not G.STATE_COMPLETE then
		G.STATE_COMPLETE = true
		for k, v in pairs(SMODS.Events) do
			if G.GAME.events[k] then
				v:calculate({pre_cash = true})
			end
		end
	return end
	if G.GAME.events.ev_cry_choco6 and pack_opened and G.STATE_COMPLETE and not G.round_eval then G.STATE_COMPLETE = false; return end
	gure(self, dt)
end

--Changes main menu colors and stuff
if Cryptid.enabled["Menu"] then
	local oldfunc = Game.main_menu
	Game.main_menu = function(change_context)
		local ret = oldfunc(change_context)
        -- adds a Cryptid spectral to the main menu
		local newcard = create_card('Spectral',G.title_top, nil, nil, nil, nil, 'c_cryptid', 'elial1')
		-- recenter the title
        G.title_top.T.w = G.title_top.T.w*1.7675
		G.title_top.T.x = G.title_top.T.x - 0.8
		G.title_top:emplace(newcard)
        -- make the card look the same way as the title screen Ace of Spades
		newcard.T.w = newcard.T.w * 1.1*1.2
		newcard.T.h = newcard.T.h *1.1*1.2
		newcard.no_ui = true

        -- make the title screen use different background colors
		G.SPLASH_BACK:define_draw_steps({{
			shader = 'splash',
			send = {
				{name = 'time', ref_table = G.TIMERS, ref_value = 'REAL_SHADER'},
				{name = 'vort_speed', val = 0.4},
				{name = 'colour_1', ref_table = G.C, ref_value = 'CRY_EXOTIC'},
				{name = 'colour_2', ref_table = G.C, ref_value = 'DARK_EDITION'},
			}}})
		return ret
	end
end

--todo: move to Rigged
-- deal wirh Rigged on Consumables
local uc = Card.use_consumeable
function Card:use_consumeable(area, copier)
	local ggpn = G.GAME.probabilities.normal
	if self.ability.cry_rigged then
		G.GAME.probabilities.normal = 1e9
	end
	local ret = uc(self, area, copier)
	if self.ability.cry_rigged then
		G.GAME.probabilities.normal = ggpn
	end
	return ret
end

--todo: move to Exponentia
function exponentia_scale_mod(self, orig_scale_scale, orig_scale_base, new_scale_base)
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

--todo: move to Compound Interest
function compound_interest_scale_mod(self, orig_scale_scale, orig_scale_base, new_scale_base)
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

-- File loading based on Relic-Jokers
-- This is getting completely rewritten, so I'm just going to leave it here..l
local files = NFS.getDirectoryItems(mod_path .. "Items")
Cryptid.obj_buffer = {}
for _, file in ipairs(files) do
	print("Loading file " .. file)
	local f, err = SMODS.load_file("Items/" .. file)
	if err then
		print("Error loading file: " .. err)
	else
		local curr_obj = f()
		if curr_obj.name == "HTTPS Module" and Cryptid_config[curr_obj.name] == nil then
			Cryptid_config[curr_obj.name] = false
		end
		if Cryptid_config[curr_obj.name] == nil then
			Cryptid_config[curr_obj.name] = true
			Cryptid.enabled[curr_obj.name] = true
		end
		if Cryptid_config[curr_obj.name] then
			if curr_obj.init then
				curr_obj:init()
			end
			if not curr_obj.items then
				print("Warning: " .. file .. " has no items")
			else
				for _, item in ipairs(curr_obj.items) do
					if not item.order then
						item.order = 0
					end
					if curr_obj.order then
						item.order = item.order + curr_obj.order
					end
					if SMODS[item.object_type] then
						if not Cryptid.obj_buffer[item.object_type] then
							Cryptid.obj_buffer[item.object_type] = {}
						end
						Cryptid.obj_buffer[item.object_type][#Cryptid.obj_buffer[item.object_type] + 1] = item
					else
						print("Error loading item " .. item.key .. " of unknown type " .. item.object_type)
					end
				end
			end
		end
	end
end
for set, objs in pairs(Cryptid.obj_buffer) do
	table.sort(objs, function(a, b)
		return a.order < b.order
	end)
	for i = 1, #objs do
		if objs[i].post_process and type(objs[i].post_process) == "function" then
			objs[i]:post_process()
		end
		SMODS[set](objs[i])
	end
end
local cryptidTabs = function() return {
	{
		label = localize("cry_set_features"),
		chosen = true,
		tab_definition_function = function()
			cry_nodes = {
				{
					n = G.UIT.R,
					config = { align = "cm" },
					nodes = {
						{
							n = G.UIT.O,
							config = {
								object = DynaText({
									string = localize("cry_set_enable_features"),
									colours = { G.C.WHITE },
									shadow = true,
									scale = 0.4,
								}),
							},
						},
					},
				},
			}
			left_settings = { n = G.UIT.C, config = { align = "tl", padding = 0.05 }, nodes = {} }
			right_settings = { n = G.UIT.C, config = { align = "tl", padding = 0.05 }, nodes = {} }
			--todo: completely redesign this, make it possible to enable/disable individual items
			local ordered_config = {}
			for k, _ in pairs(Cryptid_config) do
				if localize("cry_feat_"..string.lower(k)) ~= "ERROR" and k ~= "JokerDisplay" then
					ordered_config[#ordered_config+1] = k
				end
			end
			table.sort(ordered_config)
			for _, k in ipairs(ordered_config) do
				if #right_settings.nodes < #left_settings.nodes then
					right_settings.nodes[#right_settings.nodes + 1] =
						create_toggle({ label = localize("cry_feat_"..string.lower(k)), ref_table = Cryptid_config, ref_value = k })
				else
					left_settings.nodes[#left_settings.nodes + 1] =
						create_toggle({ label = localize("cry_feat_"..string.lower(k)), ref_table = Cryptid_config, ref_value = k })
				end
			end
			config = { n = G.UIT.R, config = { align = "tm", padding = 0 }, nodes = { left_settings, right_settings } }
			cry_nodes[#cry_nodes + 1] = config
			return {
				n = G.UIT.ROOT,
				config = {
					emboss = 0.05,
					minh = 6,
					r = 0.1,
					minw = 10,
					align = "cm",
					padding = 0.2,
					colour = G.C.BLACK,
				},
				nodes = cry_nodes,
			}
		end,
	},
	{
		label = localize("cry_set_music"),
		tab_definition_function = function()
			-- TODO: Add a button here to reset all Cryptid achievements.
			-- If you want to do that now, add this to the SMODS.InjectItems in Steamodded/loader/loader.lua
			--[[fetch_achievements()
            for k, v in pairs(SMODS.Achievements) do
                G.SETTINGS.ACHIEVEMENTS_EARNED[k] = nil
                G.ACHIEVEMENTS[k].earned = nil
            end
            fetch_achievements()]]
			cry_nodes = {
				{
					n = G.UIT.R,
					config = { align = "cm" },
					nodes = {
						--{n=G.UIT.O, config={object = DynaText({string = "", colours = {G.C.WHITE}, shadow = true, scale = 0.4})}},
					},
				},
			}
			settings = { n = G.UIT.C, config = { align = "tl", padding = 0.05 }, nodes = {} }
			settings.nodes[#settings.nodes + 1] = create_toggle({
				label = localize("cry_mus_jimball"),
				ref_table = Cryptid_config.Cryptid,
				ref_value = "jimball_music",
			})
			settings.nodes[#settings.nodes + 1] = create_toggle({
				label = localize("cry_mus_code"),
				ref_table = Cryptid_config.Cryptid,
				ref_value = "code_music",
			})
			settings.nodes[#settings.nodes + 1] = create_toggle({
				label = localize("cry_mus_exotic"),
				ref_table = Cryptid_config.Cryptid,
				ref_value = "exotic_music",
			})
			settings.nodes[#settings.nodes + 1] = create_toggle({
				label = localize("cry_mus_high_score"),
				ref_table = Cryptid_config.Cryptid,
				ref_value = "big_music",
			})
			config = { n = G.UIT.R, config = { align = "tm", padding = 0 }, nodes = { settings } }
			cry_nodes[#cry_nodes + 1] = config
			return {
				n = G.UIT.ROOT,
				config = {
					emboss = 0.05,
					minh = 6,
					r = 0.1,
					minw = 10,
					align = "cm",
					padding = 0.2,
					colour = G.C.BLACK,
				},
				nodes = cry_nodes,
			}
		end,
	},
} end
G.FUNCS.cryptidMenu = function(e)
	local tabs = create_tabs({
		snap_to_nav = true,
		tabs = cryptidTabs(),
	})
	G.FUNCS.overlay_menu({
		definition = create_UIBox_generic_options({
			back_func = "options",
			contents = { tabs },
		}),
		config = { offset = { x = 0, y = 10 } },
	})
end

--[[SMODS.current_mod.config_tab = function()
    return {
        n = G.UIT.ROOT,
        config = {
            emboss = 0.05,
            minh = 6,
            r = 0.1,
            minw = 10,
            align = "cm",
            padding = 0.2,
            colour = G.C.BLACK
        },
        nodes = {UIBox_button{ label = {"Open Cryptid Config"}, button = "cryptidMenu", colour = G.C.DARK_EDITION, minw = 5, minh = 0.7, scale = 0.6}}
    }
end--]]
SMODS.current_mod.extra_tabs = cryptidTabs


--this needs to be changed when the new system is added
local jokers = {
	"j_gros_michel",
	"j_egg",
	"j_ice_cream",
	"j_cavendish",
	"j_turtle_bean",
	"j_diet_cola",
	"j_popcorn",
	"j_ramen",
	"j_selzer",
}
if Cryptid.enabled["Misc. Jokers"] then
	jokers[#jokers + 1] = "j_cry_pickle"
	jokers[#jokers + 1] = "j_cry_chili_pepper"
end
if Cryptid.enabled["Epic Jokers"] then
	jokers[#jokers + 1] = "j_cry_oldcandy"
	jokers[#jokers + 1] = "j_cry_caramel"
end
if Cryptid.enabled["M Jokers"] then
	jokers[#jokers + 1] = "j_cry_foodm"
end
if Cryptid.enabled["Spooky"] then
	jokers[#jokers + 1] = "j_cry_cotton_candy"
	jokers[#jokers + 1] = "j_cry_wrapped"
	jokers[#jokers + 1] = "j_cry_candy_cane"
	jokers[#jokers + 1] = "j_cry_candy_buttons"
	jokers[#jokers + 1] = "j_cry_jawbreaker"
	jokers[#jokers + 1] = "j_cry_mellowcreme"
	jokers[#jokers + 1] = "j_cry_brittle"
end
for i = 1, #jokers do
	Cryptid.food[#Cryptid.food+1] = jokers[i]
end

----------------------------------------------
------------MOD CODE END----------------------
