-- content.lua - adds SMODS objects for content that should always be loaded

SMODS.Rarity({
	key = "exotic",
	loc_txt = {},
	badge_colour = HEX("708b91"),
})

SMODS.Rarity({
	key = "epic",
	loc_txt = {},
	badge_colour = HEX("571d91"),
	default_weight = 0.003,
	pools = { ["Joker"] = true },
	get_weight = function(self, weight, object_type)
		-- The game shouldn't try generating Epic Jokers when they are disabled
		if Cryptid_config["Epic Jokers"] then
			return 0.003
		else
			return 0
		end
	end,
})

SMODS.Rarity({
	key = "candy",
	loc_txt = {},
	badge_colour = HEX("e91ff0"),
})

SMODS.Rarity({
	key = "cursed",
	loc_txt = {},
	badge_colour = HEX("474931"),
})

--Add Unique consumable set - used for unique consumables that aren't normally obtained (e.g. Potion)
SMODS.ConsumableType{
	key = "Unique",
	primary_colour = G.C.MONEY,
	secondary_colour = G.C.MONEY,
	collection_rows = { 4, 4 },
	shop_rate = 0.0,
	loc_txt = {},
	default = "c_cry_potion",
	can_stack = false,
	can_divide = false,
}

--Stickers and modifiers used by Challenges+Stakes
SMODS.Atlas({
	key = "sticker",
	path = "sticker_cry.png",
	px = 71,
	py = 95,
	inject = function(self)
		local file_path = type(self.path) == "table"
				and (self.path[G.SETTINGS.language] or self.path["default"] or self.path["en-us"])
			or self.path
		if file_path == "DEFAULT" then
			return
		end
		-- language specific sprites override fully defined sprites only if that language is set
		if self.language and not (G.SETTINGS.language == self.language) then
			return
		end
		if not self.language and self.obj_table[("%s_%s"):format(self.key, G.SETTINGS.language)] then
			return
		end
		self.full_path = (self.mod and self.mod.path or SMODS.path)
			.. "assets/"
			.. G.SETTINGS.GRAPHICS.texture_scaling
			.. "x/"
			.. file_path
		local file_data =
			assert(NFS.newFileData(self.full_path), ("Failed to collect file data for Atlas %s"):format(self.key))
		self.image_data = assert(
			love.image.newImageData(file_data),
			("Failed to initialize image data for Atlas %s"):format(self.key)
		)
		self.image =
			love.graphics.newImage(self.image_data, { mipmaps = true, dpiscale = G.SETTINGS.GRAPHICS.texture_scaling })
		G[self.atlas_table][self.key_noloc or self.key] = self
		G.shared_sticker_banana =
			Sprite(0, 0, G.CARD_W, G.CARD_H, G[self.atlas_table][self.key_noloc or self.key], { x = 5, y = 2 })
		G.shared_sticker_pinned =
			Sprite(0, 0, G.CARD_W, G.CARD_H, G[self.atlas_table][self.key_noloc or self.key], { x = 5, y = 0 })
	end,
})
SMODS.Sound({
	key = "meow1",
	path = "meow1.ogg",
})
SMODS.Sound({
	key = "meow2",
	path = "meow2.ogg",
})
SMODS.Sound({
	key = "meow3",
	path = "meow3.ogg",
})
SMODS.Sound({
	key = "meow4",
	path = "meow4.ogg",
})
SMODS.Sound({
	key = "e_mosaic",
	path = "e_mosaic.ogg",
})
SMODS.Sound({
	key = "e_glitched",
	path = "e_glitched.ogg",
})
SMODS.Sound({
	key = "e_oversaturated",
	path = "e_oversaturated.ogg",
})
SMODS.Sound({
	key = "e_blur",
	path = "e_blur.ogg",
})
SMODS.Sound({
	key = "e_double_sided",
	path = "e_double_sided.ogg",
})
SMODS.Sound({
	key = "e_jolly",
	path = "e_jolly.ogg",
})
SMODS.Sound({
	key = "e_noisy",
	path = "e_noisy.ogg",
})
SMODS.Sound({
	key = "e_fragile",
	path = "e_fragile.ogg",
})
SMODS.Sound({
	key = "e_golden",
	path = "e_golden.ogg",
})
SMODS.Sound({
	key = "studiofromhelsinki",
	path = "studiofromhelsinki.ogg",
})
SMODS.Sound({
	key = "music_jimball",
	path = "music_jimball.ogg",
	sync = false,
	pitch = 1,
	select_music_track = function()
		return next(find_joker("cry-Jimball")) and Cryptid_config.Cryptid and Cryptid_config.Cryptid.jimball_music and 1.57e308
	end,
})
SMODS.Sound({
	key = "music_code",
	path = "music_code.ogg",
	select_music_track = function()
		return Cryptid_config.Cryptid and Cryptid_config.Cryptid.code_music
			and (
				(
					G.pack_cards
					and G.pack_cards.cards
					and G.pack_cards.cards[1]
					and G.pack_cards.cards[1].ability.set == "Code"
				) or (G.GAME and G.GAME.USING_CODE)
			)
	end,
})
SMODS.Sound({
	key = "music_big",
	path = "music_big.ogg",
	select_music_track = function()
		return Cryptid_config.Cryptid and Cryptid_config.Cryptid.big_music and to_big(G.GAME.round_scores["hand"].amt) > to_big(10) ^ 1000000
	end,
})
--Used to check to play the exotic music
function cry_has_exotic()
	if G.jokers then
		for i = 1, #G.jokers.cards do
			if G.jokers.cards[i].config.center.rarity == "cry_exotic" then
				return true
			end
		end
	end
end
SMODS.Sound({
	key = "music_exotic",
	path = "music_exotic.ogg",
	volume = 0.4,
	select_music_track = function()
		return Cryptid_config.Cryptid and Cryptid_config.Cryptid.exotic_music and cry_has_exotic()
	end,
})
SMODS.Sound({
	key = "music_mainline",
	path = "music_mainline.ogg",
	volume = 0.7,
	sync = {
		cry_music_modest = true,
		cry_music_madness = true
	},
	pitch = 1,
	select_music_track = function()
		return G.STAGE == G.STAGES.MAIN_MENU and G.selectedGameset ~= "modest" and G.selectedGameset ~= "madness"
	end,
})
SMODS.Sound({
	key = "music_madness",
	path = "music_madness.ogg",
	volume = 0.7,
	sync = {
		cry_music_modest = true,
		cry_music_mainline = true
	},
	pitch = 1,
	select_music_track = function()
		return G.STAGE == G.STAGES.MAIN_MENU and G.selectedGameset == "madness"
	end,
})
SMODS.Sound({
	key = "music_modest",
	path = "music_modest.ogg",
	volume = 0.7,
	sync = {
		cry_music_mainline = true,
		cry_music_madness = true
	},
	pitch = 1,
	select_music_track = function()
		return G.STAGE == G.STAGES.MAIN_MENU and G.selectedGameset == "modest"
	end,
})
SMODS.Atlas({
	key = "modicon",
	path = "cry_icon.png",
	px = 32,
	py = 32,
})
SMODS.Atlas({
	key = "gameset",
	path = "cry_gameset.png",
	px = 39,
	py = 39,
})
SMODS.Atlas({
	key = "placeholders",
	path = "placeholders.png",
	px = 71,
	py = 95,
})
SMODS.Atlas({
	key = "atlasepic",
	path = "atlasepic.png",
	px = 71,
	py = 95,
})
SMODS.Atlas({
	key = "atlasone",
	path = "atlasone.png",
	px = 71,
	py = 95,
})
SMODS.Atlas({
	key = "atlastwo",
	path = "atlastwo.png",
	px = 71,
	py = 95,
})
SMODS.Atlas({
	key = "atlasthree",
	path = "atlasthree.png",
	px = 71,
	py = 95,
})
SMODS.Atlas({
	key = "atlasspooky",
	path = "atlasspooky.png",
	px = 71,
	py = 95,
})
SMODS.Atlas({
	key = "atlasexotic",
	path = "atlasexotic.png",
	px = 71,
	py = 95,
})
SMODS.Atlas({
	key = "atlasnotjokers", --this is easier to spell then consumables
	path = "atlasnotjokers.png",
	px = 71,
	py = 95,
})
SMODS.Atlas({
	key = "tag_cry",
	path = "tag_cry.png",
	px = 34,
	py = 34,
})
--Enchancements, seals, other misc things etc
SMODS.Atlas({
	key = "cry_misc",
	path = "cry_misc.png",
	px = 71,
	py = 95,
})