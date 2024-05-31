
local blank = {
    object_type = "Back",
    name = "cry-Blank",
    key = "blank",
	pos = {x = 0, y = 0},
	loc_txt = {
        name = "Blank Deck",
        text = {
            "{C:inactive,E:1}Does nothing?"
        }
    },
    atlas = "blank"
}
local blank_sprite = {
    object_type = "Atlas",
    key = "blank",
    path = "b_cry_blank.png",
    px = 71,
    py = 95
}
local antimatter = {
    object_type = "Back",
    name = "cry-Antimatter",
    key = "antimatter",
	config = {cry_antimatter = true,
        discards = 1, --Red Deck: 1
        hands = 1, --Blue Deck: 1
        dollars = 10, --Yellow Deck
        extra_hand_bonus = 2, extra_discard_bonus = 1, --Green Deck
        joker_slot = 1, --Black Deck: 1
        vouchers = {'v_crystal_ball', 'v_telescope', 'v_tarot_merchant', 'v_planet_merchant', 'v_overstock_norm', 'v_overstock_plus'}, --Vouchers from all decks
        consumables = {'c_fool', 'c_fool', 'c_hex'}, --Consumables from all decks
        spectral_rate = 2, --Ghost Deck
        remove_faces = true, --Abandoned Deck
        hand_size = 2, --Painted Deck
        randomize_rank_suit = true, --Erratic Deck
        cry_equilibrium = true, --Deck of Equilibrium
        cry_misprint_min = 1, cry_misprint_max = 10, --Misprint Deck
        cry_highlight_limit = 1e20, --Infinite Deck
        -- Enhanced Decks
        cry_force_enhancement = 'random',
        cry_force_edition = 'random',
        cry_force_seal = 'random',
        cry_boss_blocked = {"bl_goad", "bl_window", "bl_club", "bl_head"}
    },
	pos = {x = 0, y = 0},
	loc_txt = {
        name = "Antimatter Deck",
        text = {
            "Applies the {C:legendary,E:1}upsides{}",
            "of {C:attention}every{} deck"
        }
    },
    atlas = "antimatter"
}
local antimatter_sprite = {
    object_type = "Atlas",
    key = "antimatter",
    path = "b_cry_antimatter.png",
    px = 71,
    py = 95
}
return {name = "Antimatter Deck",
        init = function()
        end,
        items = {blank_sprite, antimatter_sprite, blank, antimatter}}