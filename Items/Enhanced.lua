-- Enhanced has to be loaded near-last because of Jolly edition
-- Not localized for now - will be rewritten later

local atlasenhanced = {
	object_type = "Atlas",
	key = "atlasenhanced",
	path = "atlasdeck.png",
	px = 71,
	py = 95,
}

packs_to_add = { atlasenhanced }

local typed_decks = {
	--	{'mod_prefix',	'Type',			'Name of Deck',				'Name of Object',		'Object Key',		'Shader Name',		'Atlas',			'posX',	'posY',	'Flavour Text',           'Add Price Increase'},
	--	 eg. 'cry_' for	Edition,		Leave nil to construct								Usually matches		Leave nil to use	All three of these are used			Small subtext underneath  If true, editions
	--   Cryptid cards	Enhancement,	automatically from									name				object key as name	for custom deck backs				main text                 affect the price of
	--	 Leave empty	Seal,           object name											Used instead for	Should be nil for	Leave nil to use default                                      cards in shop
	--	 for vanilla	Sticker,															banned boss blind	non-shader objects	fallback
	--   				Suit                                   								on Suit decks
	--																						For stickers ONLY,
	--																						prefix must be included
	--																						if you use one
	--
	-- Vanilla
	{ "", "Enhancement", "The Hierophant's Deck", "Bonus", "bonus", nil, "atlasenhanced", 3, 3, "" },
	{ "", "Enhancement", "The Empress' Deck", "Mult", "mult", nil, "atlasenhanced", 2, 3, "" },
	{ "", "Enhancement", "The Lovers' Deck", "Wild", "wild", nil, "atlasenhanced", 5, 3, "" },
	{ "", "Enhancement", "Deck of Justice", "Glass", "glass", nil, "atlasenhanced", 4, 3, "" },
	{ "", "Enhancement", "The Chariot's Deck", "Steel", "steel", nil, nil, 6, 1, "" },
	{ "", "Enhancement", "Stoner's Deck", "Stone", "stone", nil, nil, 5, 0, "" },
	{ "", "Enhancement", "The Devil's Deck", "Gold", "gold", nil, nil, 6, 0, "" },
	{ "", "Enhancement", "The Magician's Deck", "Lucky", "lucky", nil, nil, 4, 1, "" },

	{ "", "Edition", "Deck of Chips", "Foil", "foil", nil, nil, 0, 2, "" },
	{ "", "Edition", "Deck of Mult", "Holographic", "holo", nil, nil, 0, 0, "" },
	{ "", "Edition", "Deck of XMult", "Polychrome", "polychrome", nil, nil, 5, 2, "" },
	{ "", "Edition", nil, "Negative", "negative", nil, nil, 5, 2, "" },

	{ "", "Seal", "Talisman Deck", "Gold", "Gold", nil, nil, 1, 2, "" },
	{ "", "Seal", "Déja Vu Deck", "Red", "Red", nil, nil, 0, 0, "" },
	{ "", "Seal", "Trance Deck", "Blue", "Blue", nil, "atlasenhanced", 2, 2, "" },
	{ "", "Seal", "Medium Deck", "Purple", "Purple", nil, "atlasenhanced", 1, 2, "" },

	{ "", "Sticker", nil, "Eternal", "eternal", nil, "atlasenhanced", 5, 2, "" },
	{ "", "Sticker", nil, "Perishable", "perishable", nil, "atlasenhanced", 0, 3, "" },
	{ "", "Sticker", nil, "Rental", "rental", nil, "atlasenhanced", 1, 3, "" },
	{ "", "Sticker", nil, "Pinned", "pinned", nil, "atlasenhanced", 0, 5, "" },

	{ "", "Suit", "Deck of the Stars", "Diamonds", "window", nil, "atlasenhanced", 2, 1, "" },
	{ "", "Suit", "Deck of the Sun", "Hearts", "head", nil, "atlasenhanced", 3, 1, "" },
	{ "", "Suit", "Deck of the World", "Spades", "goad", nil, "atlasenhanced", 4, 1, "" },
	{ "", "Suit", "Deck of the Moon", "Clubs", "club", nil, "atlasenhanced", 5, 1, "" },

	-- Cryptid
	-- todo: work with mod config better here

	{ "cry", "Enhancement", "The Eclipse's Deck", "Echo", "echo", nil, "atlasenhanced", 1, 5, "" },

	{ "cry", "Edition", nil, "Fragile", "glass", nil, nil, 5, 2, "" },
	{ "cry", "Edition", nil, "Golden", "gold", nil, nil, 5, 2, "" },
	{ "cry", "Edition", nil, "Noisy", "noisy", nil, nil, 5, 2, "" },
	{ "cry", "Edition", nil, "Astral", "astral", nil, nil, 5, 2, "" },
	{ "cry", "Edition", nil, "Blurred", "blur", nil, nil, 0, 0, "" },
	{ "cry", "Edition", nil, "Mosaic", "mosaic", nil, nil, 5, 2, "" },
	{ "cry", "Edition", nil, "Oversaturated", "oversat", nil, nil, 5, 2, "" },
	{
		"cry",
		"Edition",
		nil,
		"Glitched",
		"glitched",
		nil,
		nil,
		5,
		2,
		"Wait, isn't this just Misprint Deck?",
	},

	{ "cry", "Seal", "Typhoon Deck", "Azure", "azure", nil, nil, 0, 2, "" },

	{ "cry", "Sticker", nil, "Banana", "banana", nil, "atlasenhanced", 5, 4, "" },
}

if Cryptid.enabled["M Jokers"] then -- Crashes the game if M jokers are disabled if we don't add this separately
	table.insert(typed_decks, 31, { "cry", "Edition", "Meck", "Jolly", "m", nil, nil, 5, 2, "" })
end

for i = 1, #typed_decks do
	local deck = typed_decks[i]

	local shader = nil
	if deck[6] then
		shader = deck[1] .. "_" .. deck[6]
		if deck.no_prefix then
			shader = deck[6]
		end
	end

	local deck_name = deck[3]
	if not deck_name then
		deck_name = deck[4] .. " Deck"
	end

	local deck_internal_name = ""
	if deck[1] == "cry" then -- don't register eg. 'cry-cry-Typhoon Deck'
		deck_internal_name = "cry-" .. deck_name
	else -- eg. 'cry-jen-Blood Deck'
		deck_internal_name = "cry-" .. deck[1] .. "-" .. deck_name
	end

	local deck_key = ""
	if deck[1] == "cry" then
		deck_key = "cry" .. (deck[5] or deck[4]) .. "_deck"
	else
		deck_key = "cry" .. deck[1] .. "-" .. (deck[5] or deck[4]) .. "_deck"
	end

	local object_key = ""
	if deck[1] == "" or deck.no_prefix then -- vanilla doesn't have a prefix, don't add the _
		object_key = deck[5] or deck[4]
	else
		object_key = deck[1] .. "_" .. (deck[5] or deck[4])
	end

	local suit_key = ""
	if deck[1] == "" or deck.no_prefix then
		suit_key = deck[4]
	else
		suit_key = deck[1] .. "_" .. deck[4]
	end

	if deck[2] == "Edition" then
		local obj = {
			object_type = "Back",
			name = deck_internal_name,
			key = deck_key,
			config = { cry_force_edition = object_key, cry_force_edition_shader = shader },
			pos = { x = deck[8], y = deck[9] },
			loc_txt = {
				name = deck_name,
				text = {
					"All cards are {C:dark_edition,T:" .. object_key .. "}" .. deck[4] .. " Cards{}",
					"Cards cannot change editions",
					"{s:0.8,C:inactive}" .. deck[10],
				},
			},
		}
		if deck[7] then
			obj.atlas = deck[7]
			if string.find(deck[7], "_") then
				obj.prefix_config = { atlas = false }
			end
		end
		if not deck[11] then
			obj.config.cry_no_edition_price = true
		end
		packs_to_add[#packs_to_add + 1] = obj
	elseif deck[2] == "Enhancement" then
		local obj = {
			object_type = "Back",
			name = deck_internal_name,
			key = deck_key,
			config = { cry_force_enhancement = "m_" .. object_key },
			pos = { x = deck[8], y = deck[9] },
			loc_txt = {
				name = deck_name,
				text = {
					"All {C:attention}playing cards{}",
					"are {C:attention,T:m_" .. object_key .. "}" .. deck[4] .. " Cards{}",
					"Cards cannot change enhancements",
					"{s:0.8,C:inactive}" .. deck[10],
				},
			},
		}

		if deck[7] then
			obj.atlas = deck[7]
			if string.find(deck[7], "_") then
				obj.prefix_config = { atlas = false }
			end
		end
		packs_to_add[#packs_to_add + 1] = obj
	elseif deck[2] == "Seal" then
		local obj = {
			object_type = "Back",
			name = deck_internal_name,
			key = deck_key,
			config = { cry_force_seal = object_key },
			pos = { x = deck[8], y = deck[9] },
			loc_txt = {
				name = deck_name,
				text = {
					"All cards have a {C:dark_edition}" .. deck[4] .. " Seal{}",
					"Cards cannot change seals",
					"{s:0.8,C:inactive}" .. deck[10],
				},
			},
		}

		if deck[7] then
			obj.atlas = deck[7]
			if string.find(deck[7], "_") then
				obj.prefix_config = { atlas = false }
			end
		end
		packs_to_add[#packs_to_add + 1] = obj
	elseif deck[2] == "Sticker" then
		local obj = {
			object_type = "Back",
			name = deck_internal_name,
			key = deck_key,
			config = { cry_force_sticker = deck[5] }, -- stickers DON'T use object_key for SOME reason
			pos = { x = deck[8], y = deck[9] },
			loc_txt = {
				name = deck_name,
				text = {
					"All cards are {C:attention}" .. deck[4] .. "{}",
					"{s:0.8,C:inactive}" .. deck[10],
				},
			},
		}

		if deck[7] then
			obj.atlas = deck[7]
			if string.find(deck[7], "_") then
				obj.prefix_config = { atlas = false }
			end
		end
		packs_to_add[#packs_to_add + 1] = obj
	elseif deck[2] == "Suit" then
		local obj = {
			object_type = "Back",
			name = deck_internal_name,
			key = deck_key,
			config = { cry_force_suit = suit_key, cry_boss_blocked = deck[5] and { "bl_" .. object_key } },
			pos = { x = deck[8], y = deck[9] },
			loc_txt = {
				name = deck_name,
				text = {
					"All playing cards are {C:dark_edition}" .. deck[4] .. "{}",
					"and cannot change suits",
					deck[10] or "{s:0}",
					deck[5] and "{C:attention}The " .. string.upper(string.sub(deck[5], 1, 1)) .. string.sub(
						deck[5],
						2
					) .. "{} cannot appear", -- UGLY hack
				},
			},
		}

		if deck[7] then
			obj.atlas = deck[7]
			if string.find(deck[7], "_") then
				obj.prefix_config = { atlas = false }
			end
		end
		packs_to_add[#packs_to_add + 1] = obj
	end
end

return {
	name = "Enhanced Decks",
	init = function()
		local Backapply_to_runRef = Back.apply_to_run
		function Back.apply_to_run(self)
			Backapply_to_runRef(self)

			if self.effect.config.cry_force_enhancement then
				if self.effect.config.cry_force_enhancement ~= "random" then
					G.GAME.modifiers.cry_force_enhancement = self.effect.config.cry_force_enhancement
				end
				G.E_MANAGER:add_event(Event({
					func = function()
						for c = #G.playing_cards, 1, -1 do
							if self.effect.config.cry_force_enhancement == "random" then
								local enh = {}
								for i = 1, #G.P_CENTER_POOLS.Enhanced do
									enh[#enh + 1] = G.P_CENTER_POOLS.Enhanced[i]
								end
								enh[#enh + 1] = "CCD"
								local random_enhancement = pseudorandom_element(enh, pseudoseed("cry_ant_enhancement"))
								if random_enhancement.key and G.P_CENTERS[random_enhancement.key] then
									G.playing_cards[c]:set_ability(G.P_CENTERS[random_enhancement.key])
								else
									G.playing_cards[c]:set_ability(get_random_consumable("cry_ant_ccd", nil, true))
								end
							else
								G.playing_cards[c]:set_ability(G.P_CENTERS[self.effect.config.cry_force_enhancement])
							end
						end

						return true
					end,
				}))
			end
			if self.effect.config.cry_force_edition then
				if self.effect.config.cry_force_edition ~= "random" then
					G.GAME.modifiers.cry_force_edition = self.effect.config.cry_force_edition
				else
					G.GAME.modifiers.cry_force_random_edition = true
				end
				for k, v in pairs(G.P_TAGS) do
					if v.config and v.config.edition then
						G.GAME.banned_keys[k] = true
					end
				end
				G.E_MANAGER:add_event(Event({
					func = function()
						for c = #G.playing_cards, 1, -1 do
							local ed_table = {}
							if self.effect.config.cry_force_edition == "random" then
								local random_edition =
									pseudorandom_element(G.P_CENTER_POOLS.Edition, pseudoseed("cry_ant_edition"))
								while random_edition.key == "e_base" do
									random_edition =
										pseudorandom_element(G.P_CENTER_POOLS.Edition, pseudoseed("cry_ant_edition"))
								end
								ed_table[random_edition.key:sub(3)] = true
								G.playing_cards[c]:set_edition(ed_table, true, true)
							else
								ed_table[self.effect.config.cry_force_edition] = true
								G.playing_cards[c]:set_edition(ed_table, true, true)
							end
						end

						return true
					end,
				}))
			end
			if self.effect.config.cry_force_seal then
				if self.effect.config.cry_force_seal ~= "random" then
					G.GAME.modifiers.cry_force_seal = self.effect.config.cry_force_seal
				end
				G.E_MANAGER:add_event(Event({
					func = function()
						for c = #G.playing_cards, 1, -1 do
							if self.effect.config.cry_force_seal == "random" then
								local random_seal =
									pseudorandom_element(G.P_CENTER_POOLS.Seal, pseudoseed("cry_ant_seal"))
								G.playing_cards[c]:set_seal(random_seal.key, true)
							else
								G.playing_cards[c]:set_seal(self.effect.config.cry_force_seal, true)
							end
						end
						return true
					end,
				}))
			end
			if self.effect.config.cry_force_sticker then
				G.GAME.modifiers.cry_force_sticker = self.effect.config.cry_force_sticker
				G.E_MANAGER:add_event(Event({
					func = function()
						for c = #G.playing_cards, 1, -1 do
							G.playing_cards[c].config.center.eternal_compat = true
							G.playing_cards[c].config.center.perishable_compat = true
							if
								SMODS.Stickers[self.effect.config.cry_force_sticker]
								and SMODS.Stickers[self.effect.config.cry_force_sticker].apply
							then
								SMODS.Stickers[self.effect.config.cry_force_sticker]:apply(G.playing_cards[c], true)
							else
								G.playing_cards[c]["set_" .. self.effect.config.cry_force_sticker](
									G.playing_cards[c],
									true
								)
							end
						end
						return true
					end,
				}))
			end
			if self.effect.config.cry_force_suit then
				G.GAME.modifiers.cry_force_suit = self.effect.config.cry_force_suit
				G.E_MANAGER:add_event(Event({
					func = function()
						for c = #G.playing_cards, 1, -1 do
							G.playing_cards[c]:change_suit(self.effect.config.cry_force_suit)
						end
						return true
					end,
				}))
			end
			if self.effect.config.cry_boss_blocked then
				for _, v in pairs(self.effect.config.cry_boss_blocked) do
					G.GAME.bosses_used[v] = 1e308
				end
			end
			if self.effect.config.cry_no_edition_price then
				G.GAME.modifiers.cry_no_edition_price = true
			end
		end
		local sa = Card.set_ability
		function Card:set_ability(center, y, z)
			--adding immutable to cards because
			-- A they are hardcoded and unaffected by misprintize but still have a description that changes because of it
			-- B so they ignore misprintize in order to keep vanilla descripton accurate (ex hack shouldn't be able to trigger more than once)
			-- C so Gemini doesn't say they are compatible when they are not
			-- D Invisible Joker
			
			if center.name == "Fortune Teller" 
			or center.name == "Shoot the Moon" 
			or center.name == "Riff-raff" 
			or center.name == "Business Card"
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
			
			if center and center.set == "Enhanced" then
				return sa(
					self,
					(not self.no_forced_enhancement and G.GAME.modifiers.cry_force_enhancement) and G.P_CENTERS[G.GAME.modifiers.cry_force_enhancement]
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
				return se(self, (not self.no_forced_edition and G.GAME.modifiers.cry_force_edition) and { [G.GAME.modifiers.cry_force_edition] = true } or edition, y, z)
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
		local sc = Card.set_cost
		function Card:set_cost()
			if self.edition and G.GAME.modifiers.cry_no_edition_price then
				local m = cry_deep_copy(self.edition)
				self.edition = nil
				sc(self)
				self.edition = m
			else
				sc(self)
			end
		end
	end,
	order = 1000000,
	items = packs_to_add,
}
