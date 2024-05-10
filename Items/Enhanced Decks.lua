local hierophant_deck = SMODS.Back({
    name = "The Hierophant's Deck",
    key = "hierophant_deck",
	config = {force_enhancement = "m_bonus"},
	pos = {x = 1, y = 1},
	loc_txt = {
        name = "The Hierophant's Deck",
        text = {
            "Start with a deck",
            "of {C:attention}Bonus Cards{}"
        }
    },
    atlas = "centers"
})
local empress_deck = SMODS.Back({
    name = "The Empress's Deck",
    key = "empress_deck",
	config = {force_enhancement = "m_mult"},
	pos = {x = 2, y = 1},
	loc_txt = {
        name = "The Empress's Deck",
        text = {
            "Start with a deck",
            "of {C:attention}Mult Cards{}"
        }
    },
    atlas = "centers"
})
local lovers_deck = SMODS.Back({
    name = "The Lovers' Deck",
    key = "lovers_deck",
	config = {force_enhancement = "m_wild"},
	pos = {x = 3, y = 1},
	loc_txt = {
        name = "The Lovers' Deck",
        text = {
            "Start with a deck",
            "of {C:attention}Wild Cards{}"
        }
    },
    atlas = "centers"
})
local justice_deck = SMODS.Back({
    name = "Deck of Justice",
    key = "justice_deck",
	config = {force_enhancement = "m_glass"},
	pos = {x = 5, y = 1},
	loc_txt = {
        name = "Deck of Justice",
        text = {
            "Start with a deck",
            "of {C:attention}Glass Cards{}"
        }
    },
    atlas = "centers"
})
local chariot_deck = SMODS.Back({
    name = "The Chariot's Deck",
    key = "chariot_deck",
	config = {force_enhancement = "m_steel"},
	pos = {x = 6, y = 1},
	loc_txt = {
        name = "The Chariot's Deck",
        text = {
            "Start with a deck",
            "of {C:attention}Steel Cards{}"
        }
    },
    atlas = "centers"
})
local tower_deck = SMODS.Back({
    name = "Stoner's Deck",
    key = "tower_deck",
	config = {force_enhancement = "m_stone"},
	pos = {x = 5, y = 0},
	loc_txt = {
        name = "Stoner's Deck",
        text = {
            "Start with a deck",
            "of {C:attention}Stone Cards{}"
        }
    },
    atlas = "centers"
})
local devil_deck = SMODS.Back({
    name = "The Devil's Deck",
    key = "devil_deck",
	config = {force_enhancement = "m_gold"},
	pos = {x = 6, y = 0},
	loc_txt = {
        name = "The Devil's Deck",
        text = {
            "Start with a deck",
            "of {C:attention}Gold Cards{}"
        }
    },
    atlas = "centers"
})
local magician_deck = SMODS.Back({
    name = "The Magician's Deck",
    key = "magician_deck",
	config = {force_enhancement = "m_lucky"},
	pos = {x = 4, y = 1},
	loc_txt = {
        name = "The Magician's Deck",
        text = {
            "Start with a deck",
            "of {C:attention}Lucky Cards{}"
        }
    },
    atlas = "centers"
})

local foil_deck = SMODS.Back({
    name = "Deck of Chips",
    key = "foil_deck",
	config = {force_edition = 'foil'},
	pos = {x = 0, y = 2},
	loc_txt = {
        name = "Deck of Chips",
        text = {
            "Start with a deck",
            "of {C:attention}Foil Cards{}"
        }
    },
    atlas = "centers"
})

local holo_deck = SMODS.Back({
    name = "Deck of Mult",
    key = "holo_deck",
	config = {force_edition = 'holo'},
	pos = {x = 0, y = 0},
	loc_txt = {
        name = "Deck of Mult",
        text = {
            "Start with a deck",
            "of {C:attention}Holographic Cards{}"
        }
    },
    atlas = "centers"
})

local poly_deck = SMODS.Back({
    name = "Deck of XMult",
    key = "poly_deck",
	config = {force_edition = 'polychrome'},
	pos = {x = 5, y = 2},
	loc_txt = {
        name = "Deck of XMult",
        text = {
            "Start with a deck",
            "of {C:attention}Polychrome Cards{}"
        }
    },
    atlas = "centers"
})
local talisman_deck = SMODS.Back({
    name = "Talisman Deck",
    key = "talisman_deck",
	config = {force_seal = 'Gold'},
	pos = {x = 1, y = 2},
	loc_txt = {
        name = "Talisman Deck",
        text = {
            "Start with a deck",
            "of {C:attention}Gold Seal Cards{}"
        }
    },
    atlas = "centers"
})
local deja_vu_deck = SMODS.Back({
    name = "Deja Vu Deck",
    key = "deja_vu_deck",
	config = {force_seal = 'Red'},
	pos = {x = 0, y = 0},
	loc_txt = {
        name = "Deja Vu Deck",
        text = {
            "Start with a deck",
            "of {C:attention}Red Seal Cards{}"
        }
    },
    atlas = "centers"
})
local trance_deck = SMODS.Back({
    name = "Trance Deck",
    key = "trance_deck",
	config = {force_seal = 'Blue'},
	pos = {x = 0, y = 2},
	loc_txt = {
        name = "Trance Deck",
        text = {
            "Start with a deck",
            "of {C:attention}Blue Seal Cards{}"
        }
    },
    atlas = "centers"
})
local medium_deck = SMODS.Back({
    name = "Medium Deck",
    key = "medium_deck",
	config = {force_seal = 'Purple'},
	pos = {x = 0, y = 3},
	loc_txt = {
        name = "Medium Deck",
        text = {
            "Start with a deck",
            "of {C:attention}Purple Seal Cards{}"
        }
    },
    atlas = "centers"
})
local eternal_deck = SMODS.Back({
    name = "Eternal Deck",
    key = "eternal_deck",
	config = {force_sticker = 'eternal'},
	pos = {x = 3, y = 3},
	loc_txt = {
        name = "Eternal Deck",
        text = {
            "Start with a deck",
            "of {C:attention}Eternal Cards{}"
        }
    },
    atlas = "centers"
})
local perishable_deck = SMODS.Back({
    name = "Perishable Deck",
    key = "perishable_deck",
	config = {force_sticker = 'perishable'},
	pos = {x = 2, y = 2},
	loc_txt = {
        name = "Perishable Deck",
        text = {
            "Start with a deck",
            "of {C:attention}Perishable Cards{}"
        }
    },
    atlas = "centers"
})

local rental_deck = SMODS.Back({
    name = "Rental Deck",
    key = "rental_deck",
	config = {force_sticker = 'rental'},
	pos = {x = 1, y = 2},
	loc_txt = {
        name = "Rental Deck",
        text = {
            "Start with a deck",
            "of {C:attention}Rental Cards{}"
        }
    },
    atlas = "centers"
})

local Backapply_to_runRef = Back.apply_to_run
function Back.apply_to_run(self)
	Backapply_to_runRef(self)

	if self.effect.config.force_enhancement then
		G.E_MANAGER:add_event(Event({
			func = function()
				for c = #G.playing_cards, 1, -1 do
                    G.playing_cards[c]:set_ability(G.P_CENTERS[self.effect.config.force_enhancement]);
				end

				return true
			end
		}))
	end
    if self.effect.config.force_edition then
		G.E_MANAGER:add_event(Event({
			func = function()
				for c = #G.playing_cards, 1, -1 do
                    local ed_table = {}
                    ed_table[self.effect.config.force_edition] = true
                    G.playing_cards[c]:set_edition(ed_table, true, true);
				end

				return true
			end
		}))
	end
	if self.effect.config.force_seal then
		G.E_MANAGER:add_event(Event({
			func = function()
				for c = #G.playing_cards, 1, -1 do
                    G.playing_cards[c]:set_seal(self.effect.config.force_seal, true);
				end
				return true
			end
		}))
	end
	if self.effect.config.force_sticker then
		G.E_MANAGER:add_event(Event({
			func = function()
				for c = #G.playing_cards, 1, -1 do
                    G.playing_cards[c].config.center.eternal_compat = true
                    G.playing_cards[c].config.center.perishable_compat = true
                    G.playing_cards[c]["set_"..self.effect.config.force_sticker](G.playing_cards[c],true);
				end
				return true
			end
		}))
	end
end

return {name = "Enhanced Decks", items = {hierophant_deck, empress_deck, lovers_deck, justice_deck, chariot_deck, tower_deck, devil_deck, magician_deck,
foil_deck, holo_deck, poly_deck,
talisman_deck, deja_vu_deck, trance_deck, medium_deck,
eternal_deck, perishable_deck, rental_deck}}