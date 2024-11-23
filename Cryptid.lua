--- STEAMODDED HEADER
--- MOD_NAME: Cryptid
--- MOD_ID: Cryptid
--- PREFIX: cry
--- MOD_AUTHOR: [MathIsFun_, Cryptid and Balatro Discords]
--- MOD_DESCRIPTION: Adds unbalanced ideas to Balatro.
--- BADGE_COLOUR: 708b91
--- DEPENDENCIES: [Talisman>=2.0.0-beta8, Steamodded>=1.0.0~ALPHA-1103a]
--- VERSION: 0.5.2-REFACTOR~1121a
--- PRIORITY: 99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999

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

-- A list of content sets. These can be toggled individually to determine what types of content are enabled.
-- Consider it like the old file system, but with more flexibility.
Cryptid.CONTENT_SETS = {
	M = "m",
	DAGGER = "dagger",
	ULTRAVIOLENCE = "ultraviolence",
	MUSHROOM_KINGDOM = "mushroom_kingdom",
	CODE = "code",
	FOOD = "food",
	CELESTIALS = "celestials",
	D20 = "d20",
}