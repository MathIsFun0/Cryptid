--- STEAMODDED HEADER
--- MOD_NAME: Cryptid
--- MOD_ID: Cryptid
--- PREFIX: cry
--- MOD_AUTHOR: [MathIsFun_, Cryptid and Balatro Discords]
--- MOD_DESCRIPTION: Adds unbalanced ideas to Balatro.
--- BADGE_COLOUR: 708b91
--- DEPENDENCIES: [Talisman>=2.0.0-beta8, Steamodded>=1.0.0~ALPHA-1312c]
--- VERSION: 0.5.4~dev2
--- PRIORITY: 2147483647

----------------------------------------------
------------MOD CODE -------------------------

-- Welcome to the Cryptid source code!
-- This is the main file for the mod, where everything is loaded and initialized.
-- If you're looking for a specific feature, browse the Items folder to see how it is implemented.
-- If you're looking for a specific function, check the lib folder to see if it is there.

-- Initialize some important variables
if not Cryptid then
	Cryptid = {}
end
local mod_path = "" .. SMODS.current_mod.path -- this path changes when each mod is loaded, but the local variable will retain Cryptid's path
Cryptid_config = SMODS.current_mod.config
-- This will save the current state even when settings are modified
Cryptid.enabled = copy_table(Cryptid_config)

-- Enable optional features
SMODS.current_mod.optional_features = {
	retrigger_joker = true,
	post_trigger = true,
	-- Here are some other ones Steamodded has
	-- Cryptid doesn't use them YET, but these should be uncommented if Cryptid uses them
	--[[
	quantum_enhancements = true,
	-- These ones add new card areas that Steamodded will calculate through
	-- Might already be useful for sticker calc
	cardareas = {
		deck = true,
		discard = true,
	}
	]]
}

--Load Library Files
local files = NFS.getDirectoryItems(mod_path .. "lib")
for _, file in ipairs(files) do
	print("[CRYPTID] Loading library file " .. file)
	local f, err = SMODS.load_file("lib/" .. file)
	if err then
		error(err) --Steamodded actually does a really good job of displaying this info! So we don't need to do anything else.
	end
	f()
end
local function process_items(f, mod)
	local ret = f()
	if not ret.disabled then
		if ret.init then ret:init() end
		if ret.items then
			for _, item in ipairs(ret.items) do
				if mod then
					-- make the mod use its own prefixes
					item.prefix_config = {
						key = false,
						atlas = false,
					}
					if item.key then
						item.key = mod.prefix .. "_" .. item.key
					end
					if item.atlas then
						item.atlas = mod.prefix .. "_" .. item.atlas
					end
					-- this will also display the mod's own badge
					if not item.dependencies then item.dependencies = {} end
					item.dependencies[#item.dependencies + 1] = mod.id
				end
				if item.init then item:init() end
				--[[if not item.gameset_config then
					-- by default, disable on modest
					item.gameset_config = {
						modest = {disabled = true},
					}
				end--]]
				if G.PROFILES[G.SETTINGS.profile].all_unlocked then
					-- There's something a bit goofy about this, it shouldn't kick in this early
					item.alerted = true
					item.discovered = true
					item.unlocked = true
				end
				if not Cryptid.object_registry[item.object_type] then
					Cryptid.object_registry[item.object_type] = {}
				end
				if not item.take_ownership then
					if not item.order then
						item.order = 0
					end
					if ret.order then
						item.order = item.order + ret.order
					end
					if mod then
						item.order = item.order + 1e9
					end
					item.cry_order = item.order
					if not Cryptid.object_buffer[item.object_type] then
						Cryptid.object_buffer[item.object_type] = {}
					end
					Cryptid.object_buffer[item.object_type][#Cryptid.object_buffer[item.object_type] + 1] = item
				else
					item.key = SMODS[item.object_type].class_prefix .. "_" .. item.key
					SMODS[item.object_type].obj_table[item.key].mod = SMODS.Mods.Cryptid
					for k, v in pairs(item) do
						if k ~= "key" then
							SMODS[item.object_type].obj_table[item.key][k] = v
						end
					end
				end
				Cryptid.object_registry[item.object_type][item.key] = item
			end
		end
	end
end

Cryptid.object_registry = {}
Cryptid.object_buffer = {}
local files = NFS.getDirectoryItems(mod_path .. "items")
for _, file in ipairs(files) do
	print("[CRYPTID] Loading file " .. file)
	local f, err = SMODS.load_file("items/" .. file)
	if err then
		error(err) --Steamodded actually does a really good job of displaying this info! So we don't need to do anything else.
	end
	process_items(f)
end

-- Check for files in other mods
-- either in [Mod]/Cryptid.lua or [Mod]/Cryptid/*.lua
for _, mod in pairs(SMODS.Mods) do
	-- Note: Crashes with lone lua files
	if mod.path and mod.id ~= "Cryptid" then
		local path = mod.path
		local files = NFS.getDirectoryItems(path)
		for _, file in ipairs(files) do
			if file == "Cryptid.lua" then
				print("[CRYPTID] Loading Cryptid.lua from " .. mod.id)
				local f, err = SMODS.load_file("Cryptid.lua", mod.id)
				if err then
					error(err) --Steamodded actually does a really good job of displaying this info! So we don't need to do anything else.
				end
				process_items(f, mod)
			end
			if file == "Cryptid" then
				local files = NFS.getDirectoryItems(path .. "Cryptid")
				for _, file in ipairs(files) do
					print("[CRYPTID] Loading file " .. file .. " from " .. mod.id)
					local f, err = SMODS.load_file("Cryptid/" .. file, mod.id)
					if err then
						error(err) --Steamodded actually does a really good job of displaying this info! So we don't need to do anything else.
					end
					process_items(f, mod)
				end
			end
		end
	end
end

-- Register all items
for set, objs in pairs(Cryptid.object_buffer) do
	table.sort(objs, function(a, b)
		return a.order < b.order
	end)
	for i = 1, #objs do
		if objs[i].post_process and type(objs[i].post_process) == "function" then
			objs[i]:post_process()
		end
		Cryptid.post_process(objs[i])
		SMODS[set](objs[i])
	end
end
local inj = SMODS.injectItems
function SMODS.injectItems(...)
	inj(...)
	cry_update_obj_registry()
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
			config = { n = G.UIT.R, config = { align = "tm", padding = 0 }, nodes = { left_settings, right_settings } }
			cry_nodes[#cry_nodes + 1] = config
			cry_nodes[#cry_nodes + 1] = UIBox_button({button = 'your_collection_content_sets', label = {localize('b_content_sets')}, count = modsCollectionTally(G.P_CENTER_POOLS["Content Set"]),  minw = 5, minh = 1.7, scale = 0.6, id = 'your_collection_jokers'})

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
			settings.nodes[#settings.nodes + 1] = create_toggle({
				label = localize("cry_mus_alt_bg"),
				ref_table = Cryptid_config.Cryptid,
				ref_value = "alt_bg_music",
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
SMODS.current_mod.extra_tabs = cryptidTabs
