local atlasenhanced = {
	object_type = "Atlas",
	key = "atlasenhanced",
	path = "atlasdeck.png",
	px = 71,
	py = 95,
}
local atlasedition = {
	object_type = "Atlas",
	key = "atlaseditiondeck",
	path = "atlaseditiondeck.png",
	px = 71,
	py = 95,
}

Cryptid.edeck_sprites = {
	edition = {
		order = 1,
		default = { atlas = "centers", pos = { x = 5, y = 2 } },
		foil = { atlas = "cry_atlaseditiondeck", pos = { x = 0, y = 0 } },
		holo = { atlas = "cry_atlaseditiondeck", pos = { x = 1, y = 0 } },
		polychrome = { atlas = "cry_atlaseditiondeck", pos = { x = 2, y = 0 } },
		negative = { atlas = "cry_atlaseditiondeck", pos = { x = 3, y = 0 } },
		cry_mosaic = { atlas = "cry_atlaseditiondeck", pos = { x = 0, y = 1 } },
		cry_oversat = { atlas = "cry_atlaseditiondeck", pos = { x = 1, y = 1 } },
		cry_glass = { atlas = "cry_atlaseditiondeck", pos = { x = 2, y = 1 } },
		cry_gold = { atlas = "cry_atlaseditiondeck", pos = { x = 3, y = 1 } },
		cry_blur = { atlas = "cry_atlaseditiondeck", pos = { x = 0, y = 2 } },
		cry_noisy = { atlas = "cry_atlaseditiondeck", pos = { x = 1, y = 2 } },
		cry_astral = { atlas = "cry_atlaseditiondeck", pos = { x = 2, y = 2 } },
		cry_m = { atlas = "cry_atlaseditiondeck", pos = { x = 3, y = 2 } },
	},
	enhancement = {
		order = 2,
		default = { atlas = "centers", pos = { x = 5, y = 2 } },
		m_bonus = { atlas = "cry_atlasenhanced", pos = { x = 3, y = 3 } },
		m_mult = { atlas = "cry_atlasenhanced", pos = { x = 2, y = 3 } },
		m_wild = { atlas = "cry_atlasenhanced", pos = { x = 5, y = 3 } },
		m_glass = { atlas = "cry_atlasenhanced", pos = { x = 4, y = 3 } },
		m_steel = { atlas = "centers", pos = { x = 6, y = 1 } },
		m_stone = { atlas = "centers", pos = { x = 5, y = 0 } },
		m_gold = { atlas = "centers", pos = { x = 6, y = 0 } },
		m_lucky = { atlas = "centers", pos = { x = 4, y = 1 } },
		m_cry_echo = { atlas = "cry_atlasenhanced", pos = { x = 1, y = 5 } },
		m_cry_light = { atlas = "cry_misc", pos = { x = 0, y = 3 } },
	},
	sticker = {
		order = 3,
		default = { atlas = "centers", pos = { x = 5, y = 2 } },
		eternal = { atlas = "cry_atlasenhanced", pos = { x = 5, y = 2 } },
		perishable = { atlas = "cry_atlasenhanced", pos = { x = 0, y = 3 } },
		rental = { atlas = "cry_atlasenhanced", pos = { x = 1, y = 3 } },
		pinned = { atlas = "cry_atlasenhanced", pos = { x = 0, y = 5 } },
		banana = { atlas = "cry_atlasenhanced", pos = { x = 5, y = 4 } },
		cry_rigged = { atlas = "cry_atlasenhanced", pos = { x = 3, y = 6 } },
	},
	suit = {
		order = 4,
		default = { atlas = "centers", pos = { x = 5, y = 2 } },
		Diamonds = { atlas = "cry_atlasenhanced", pos = { x = 2, y = 1 } },
		Hearts = { atlas = "cry_atlasenhanced", pos = { x = 3, y = 1 } },
		Spades = { atlas = "cry_atlasenhanced", pos = { x = 4, y = 1 } },
		Clubs = { atlas = "cry_atlasenhanced", pos = { x = 5, y = 1 } },
	},
	seal = {
		order = 5,
		default = { atlas = "centers", pos = { x = 5, y = 2 } },
		Gold = { atlas = "centers", pos = { x = 1, y = 2 } },
		Red = { atlas = "centers", pos = { x = 0, y = 0 } },
		Blue = { atlas = "cry_atlasenhanced", pos = { x = 2, y = 2 } },
		Purple = { atlas = "cry_atlasenhanced", pos = { x = 1, y = 2 } },
		cry_azure = { atlas = "centers", pos = { x = 0, y = 2 } },
		cry_green = { atlas = "cry_atlasenhanced", pos = { x = 3, y = 5 } },
	},
}

cry_edeck_atlas_update = function(self)
	local sprite = Cryptid.edeck_sprites[self.edeck_type]
	if not sprite then
		error(self.edeck_type)
	end
	local enh_info = { cry_get_enchanced_deck_info(self) }
	sprite = sprite[enh_info[sprite.order]] or sprite.default
	self.atlas, self.pos = sprite.atlas, sprite.pos
	return sprite
end

local e_deck = {
	object_type = "Back",
	dependencies = {
		items = {
			"set_cry_deck",
		},
	},
	name = "cry-Edition Deck",
	key = "e_deck",
	order = 17,
	pos = { x = 5, y = 2 },
	loc_vars = function(self, info_queue, center)
		local aaa = cry_get_enchanced_deck_info(self)
		return { vars = { localize({ type = "name_text", set = "Edition", key = "e_" .. aaa }) } }
	end,
	edeck_type = "edition",
	config = { cry_no_edition_price = true },
	apply = function(self)
		local aaa = cry_get_enchanced_deck_info(self)
		G.GAME.modifiers.cry_force_edition = aaa
		--Ban Edition tags (They will never redeem)
		for k, v in pairs(G.P_TAGS) do
			if v.config and v.config.edition then
				G.GAME.banned_keys[k] = true
			end
		end
		G.E_MANAGER:add_event(Event({
			func = function()
				for c = #G.playing_cards, 1, -1 do
					G.playing_cards[c]:set_edition(aaa, true, true)
				end
				return true
			end,
		}))
	end,
}
local et_deck = {
	object_type = "Back",
	dependencies = {
		items = {
			"set_cry_deck",
		},
	},
	name = "cry-Enhancement Deck",
	key = "et_deck",
	order = 18,
	pos = { x = 5, y = 2 },
	edeck_type = "enhancement",
	config = {},
	loc_vars = function(self, info_queue, center)
		local _, bbb = cry_get_enchanced_deck_info(self)
		return { vars = { localize({ type = "name_text", set = "Enhanced", key = bbb }) } }
	end,
	apply = function(self)
		local aaa, bbb = cry_get_enchanced_deck_info(self)
		G.GAME.modifiers.cry_force_enhancement = bbb
		G.E_MANAGER:add_event(Event({
			func = function()
				for c = #G.playing_cards, 1, -1 do
					G.playing_cards[c]:set_ability(G.P_CENTERS[bbb])
				end
				return true
			end,
		}))
	end,
	draw = cry_edeck_draw,
}
local sk_deck = {
	object_type = "Back",
	dependencies = {
		items = {
			"set_cry_deck",
		},
	},
	name = "cry-Sticker Deck",
	key = "sk_deck",
	order = 19,
	pos = { x = 5, y = 2 },
	edeck_type = "sticker",
	config = {},
	loc_vars = function(self, info_queue, center)
		local _, _, ccc = cry_get_enchanced_deck_info(self)
		if ccc == "pinned" then
			ccc = "pinned_left"
		end
		return { vars = { localize({ type = "name_text", set = "Other", key = ccc }) } }
	end,
	apply = function(self)
		local aaa, bbb, ccc = cry_get_enchanced_deck_info(self)
		G.GAME.modifiers.cry_force_sticker = ccc
		G.E_MANAGER:add_event(Event({
			func = function()
				for c = #G.playing_cards, 1, -1 do
					G.playing_cards[c].config.center.eternal_compat = true
					G.playing_cards[c].config.center.perishable_compat = true
					if SMODS.Stickers[ccc] and SMODS.Stickers[ccc].apply then
						SMODS.Stickers[ccc]:apply(G.playing_cards[c], true)
					else
						G.playing_cards[c]["set_" .. ccc](G.playing_cards[c], true)
					end
				end
				return true
			end,
		}))
	end,
}
local st_deck = {
	object_type = "Back",
	dependencies = {
		items = {
			"set_cry_deck",
		},
	},
	name = "cry-Suit Deck",
	key = "st_deck",
	config = {},
	order = 20,
	pos = { x = 5, y = 2 },
	edeck_type = "suit",
	loc_vars = function(self, info_queue, center)
		local _, _, _, ddd = cry_get_enchanced_deck_info(self)
		return { vars = { localize(ddd, "suits_plural") } }
	end,
	apply = function(self)
		local aaa, bbb, ccc, ddd = cry_get_enchanced_deck_info(self)
		if ddd == "Spades" then
			G.GAME.bosses_used["bl_goad"] = 1e308
		elseif ddd == "Hearts" then
			G.GAME.bosses_used["bl_head"] = 1e308
		elseif ddd == "Clubs" then
			G.GAME.bosses_used["bl_club"] = 1e308
		elseif ddd == "Diamonds" then
			G.GAME.bosses_used["bl_window"] = 1e308
		end
		G.GAME.modifiers.cry_force_suit = ddd
		G.E_MANAGER:add_event(Event({
			func = function()
				for c = #G.playing_cards, 1, -1 do
					G.playing_cards[c]:change_suit(ddd)
				end
				return true
			end,
		}))
	end,
}
local sl_deck = {
	object_type = "Back",
	dependencies = {
		items = {
			"set_cry_deck",
		},
	},
	name = "cry-Seal Deck",
	key = "sl_deck",
	order = 21,
	pos = { x = 5, y = 2 },
	config = {},
	edeck_type = "seal",
	loc_vars = function(self, info_queue, center)
		local _, _, _, _, eee = cry_get_enchanced_deck_info(self)
		return { vars = { localize({ type = "name_text", set = "Other", key = eee:lower() .. "_seal" }) } }
	end,
	apply = function(self)
		local aaa, bbb, ccc, ddd, eee = cry_get_enchanced_deck_info(self)
		G.GAME.modifiers.cry_force_seal = eee
		G.E_MANAGER:add_event(Event({
			func = function()
				for c = #G.playing_cards, 1, -1 do
					G.playing_cards[c]:set_seal(eee, true)
				end
				return true
			end,
		}))
	end,
}

return {
	name = "Enhanced Decks",
	init = function()
		local sa = Card.set_ability
		function Card:set_ability(center, y, z)
			--adding immutable to cards because
			-- A they are hardcoded and unaffected by misprintize but still have a description that changes because of it
			-- B so they ignore misprintize in order to keep vanilla descripton accurate (ex hack shouldn't be able to trigger more than once)
			-- C so Gemini doesn't say they are compatible when they are not
			-- D Invisible Joker

			if
				center.name == "Fortune Teller"
				or center.name == "Shoot the Moon"
				or center.name == "Riff-raff"
				or center.name == "Chaos the Clown"
				or center.name == "Dusk"
				or center.name == "Mime"
				or center.name == "Hack"
				or center.name == "Sock and Buskin"
				or center.name == "Invisible Joker"
				or center.name == "Swashbuckler"
				or center.name == "Smeared Joker"
				or center.name == "Certificate"
				or center.name == "Mr. Bones"
				or center.name == "Diet Cola"
				or center.name == "Luchador"
				or center.name == "Midas Mask"
				or center.name == "Shortcut"
				or center.name == "Seance"
				or center.name == "Superposition"
				or center.name == "Sixth Sense"
				or center.name == "DNA"
				or center.name == "Splash"
				or center.name == "Supernova"
				or center.name == "Pareidolia"
				or center.name == "Raised Fist"
				or center.name == "Marble Joker"
				or center.name == "Four Fingers"
				or center.name == "Joker Stencil"
				or center.name == "Showman"
				or center.name == "Blueprint"
				or center.name == "Oops! All 6s"
				or center.name == "Brainstorm"
				or center.name == "Cartomancer"
				or center.name == "Astronomer"
				or center.name == "Burnt Joker"
				or center.name == "Chicot"
				or center.name == "Perkeo"
			then
				self.config.center.immutable = true
			end
			if safe_get(center, "name") == "Default Base" then -- scuffed
				return sa(
					self,
					(not self.no_forced_enhancement and G.GAME.modifiers.cry_force_enhancement)
							and G.P_CENTERS[G.GAME.modifiers.cry_force_enhancement]
						or center,
					y,
					z
				)
			else
				return sa(self, center, y, z)
			end
		end
		local se = Card.set_edition
		function Card:set_edition(edition, y, z, force)
			if not force then
				return se(
					self,
					(not self.no_forced_edition and G.GAME.modifiers.cry_force_edition)
							and { [G.GAME.modifiers.cry_force_edition] = true }
						or edition,
					y,
					z
				)
			end
			return se(self, edition, y, z)
		end
		local ss = Card.set_seal
		function Card:set_seal(seal, y, z)
			return ss(self, not self.no_forced_seal and G.GAME.modifiers.cry_force_seal or seal, y, z)
		end
		local cs = Card.change_suit
		function Card:change_suit(new_suit)
			return cs(self, not self.no_forced_suit and G.GAME.modifiers.cry_force_suit or new_suit)
		end
		local ccl = Card.click
		function Card:click()
			ccl(self)
			if
				Galdur
					and safe_get(Galdur, "run_setup", "current_page") == 1
					and (self.edeck_select or (self.area == safe_get(Galdur, "run_setup", "selected_deck_area") and safe_get(
						self,
						"config",
						"center",
						"edeck_type"
					)))
				or not Galdur
					and (safe_get(G.GAME, "viewed_back", "effect", "center", "edeck_type") and (self.back == "viewed_back" or self.edeck_select))
			then
				if self.edeck_select then
					G.PROFILES[G.SETTINGS.profile]["cry_edeck_" .. self.config.center.edeck_type] = self.edeck_select
				end
				cry_enhancement_config_UI(Galdur and self.config.center or G.GAME.viewed_back.effect.center)
			end
		end
		function cry_enhancement_config_UI(center)
			if not center.edeck_type then
				return
			end
			G.SETTINGS.paused = true
			G.your_collection = {}
			G.your_collection[1] = CardArea(
				G.ROOM.T.x + 0.2 * G.ROOM.T.w / 2,
				G.ROOM.T.h,
				5.3 * G.CARD_W,
				1.03 * G.CARD_H,
				{ card_limit = 5, type = "title", highlight_limit = 0, collection = true }
			)
			local deck_tables = {
				n = G.UIT.R,
				config = { align = "cm", padding = 0, no_fill = true },
				nodes = {
					{ n = G.UIT.O, config = { object = G.your_collection[1] } },
				},
			}

			local pool_table = {
				edition = G.P_CENTER_POOLS.Edition,
				enhancement = G.P_CENTER_POOLS.Enhanced,
				sticker = SMODS.Stickers,
				suit = SMODS.Suits,
				seal = G.P_SEALS,
			}
			local editions = {}
			for _, v in pairs(pool_table[center.edeck_type]) do
				if v.key ~= "e_base" and not v.no_edeck then
					editions[#editions + 1] = (center.edeck_type == "edition" and v.key:sub(3)) or v.key
				end
			end

			for i = 1, #editions do
				local _center = cry_deep_copy(center)
				_center.config["cry_force_" .. center.edeck_type] = editions[i]
				cry_edeck_atlas_update(_center)
				local card = create_generic_card(_center)
				card.edeck_select = editions[i]
				G.your_collection[1]:emplace(card)
			end

			INIT_COLLECTION_CARD_ALERTS()

			local t = create_UIBox_generic_options({
				--infotip = localize("cry_gameset_explanation"),
				back_func = "setup_run",
				snap_back = true,
				contents = {
					{
						n = G.UIT.R,
						config = { align = "cm", minw = 2.5, padding = 0.1, r = 0.1, colour = G.C.BLACK, emboss = 0.05 },
						nodes = { deck_tables },
					},
				},
			})
			G.FUNCS.overlay_menu({
				definition = t,
			})
		end
	end,
	items = { e_deck, et_deck, sk_deck, st_deck, sl_deck, atlasenhanced, atlasedition },
}
