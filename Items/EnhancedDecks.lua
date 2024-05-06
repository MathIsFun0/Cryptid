local hierophant_deck = SMODS.Back({
    name = "The Hierophant's Deck",
    key = "hierophant_deck",
	config = {force_edition = "m_bonus"},
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
	config = {force_edition = "m_mult"},
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
	config = {force_edition = "m_wild"},
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
	config = {force_edition = "m_glass"},
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
	config = {force_edition = "m_steel"},
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
	config = {force_edition = "m_stone"},
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
	config = {force_edition = "m_gold"},
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
	config = {force_edition = "m_lucky"},
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

local Backapply_to_runRef = Back.apply_to_run
function Back.apply_to_run(self)
	Backapply_to_runRef(self)

	if self.effect.config.force_edition then
		G.E_MANAGER:add_event(Event({
			func = function()
				for c = #G.playing_cards, 1, -1 do
                    G.playing_cards[c]:set_ability(G.P_CENTERS[self.effect.config.force_edition]);
				end

				return true
			end
		}))
	end
end

return {hierophant_deck, empress_deck, lovers_deck, justice_deck, chariot_deck, tower_deck, devil_deck, magician_deck}