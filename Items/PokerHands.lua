local disc = function(self, card, badges)
	badges[#badges + 1] = create_badge('Circumstellar Disc', get_type_colour(self or card.config, card), nil, 1.2)
end

local nothingness = function(self, card, badges)
	badges[#badges + 1] = create_badge('          ', get_type_colour(self or card.config, card), nil, 1.2)
end

local moons = function(self, card, badges)
	badges[#badges + 1] = create_badge('Natural Satellites', get_type_colour(self or card.config, card), nil, 1.2)
end

local actualuniverse = function(self, card, badges)
	badges[#badges + 1] = create_badge('The Actual Fucking Universe', get_type_colour(self or card.config, card), nil, 1.2)
end

SMODS.Consumable{
    set = 'Planet',
    key = 'asteroidbelt',
    --! `h_` prefix was removed
    config = { hand_type = 'cry_Bulwark', softlock = true },
    pos = {x = 1, y = 5 },
    atlas = 'atlasnotjokers',
		aurinko = true,
    set_card_type_badge = disc,
    process_loc_text = function(self)
        --use another planet's loc txt instead
        local target_text = G.localization.descriptions[self.set]['c_mercury'].text
        SMODS.Consumable.process_loc_text(self)
        G.localization.descriptions[self.set][self.key].text = target_text
    end,
    generate_ui = 0,
    loc_txt = {
        ['en-us'] = {
            name = 'Asteroid Belt'
        },
	['de'] = {
            name = 'Asteroidengürtel'
        }
    }
}


SMODS.Consumable{
    set = 'Planet',
    key = 'void',
    --! `h_` prefix was removed
    config = { hand_type = 'cry_Clusterfuck', softlock = true },
    pos = {x = 0, y = 5 },
    atlas = 'atlasnotjokers',
		aurinko = true,
    set_card_type_badge = nothingness,
    process_loc_text = function(self)
        --use another planet's loc txt instead
        local target_text = G.localization.descriptions[self.set]['c_mercury'].text
        SMODS.Consumable.process_loc_text(self)
        G.localization.descriptions[self.set][self.key].text = target_text
    end,
    generate_ui = 0,
    loc_txt = {
        ['en-us'] = {
            name = 'Void'
        },
        ['de'] = {
                name = 'Leere'
        }
    }
}

SMODS.Consumable{
    set = 'Planet',
    key = 'marsmoons',
    --! `h_` prefix was removed
    config = { hand_type = 'cry_UltPair', softlock = true },
    pos = {x = 2, y = 5 },
    atlas = 'atlasnotjokers',
		aurinko = true,
    set_card_type_badge = moons,
    process_loc_text = function(self)
        --use another planet's loc txt instead
        local target_text = G.localization.descriptions[self.set]['c_mercury'].text
        SMODS.Consumable.process_loc_text(self)
        G.localization.descriptions[self.set][self.key].text = target_text
    end,
    generate_ui = 0,
    loc_txt = {
        ['en-us'] = {
            name = 'Phobos & Deimos'
        },
	['de'] = {
            name = 'Phobos & Deimos'
        }
    }
}

SMODS.Consumable{
    set = 'Planet',
    key = 'universe',
    --! `h_` prefix was removed
    config = { hand_type = 'cry_WholeDeck', softlock = true },
    pos = {x = 4, y = 5 },
    atlas = 'atlasnotjokers',
		aurinko = true,
    set_card_type_badge = actualuniverse,
    process_loc_text = function(self)
        --use another planet's loc txt instead
        local target_text = G.localization.descriptions[self.set]['c_mercury'].text
        SMODS.Consumable.process_loc_text(self)
        G.localization.descriptions[self.set][self.key].text = target_text
    end,
    generate_ui = 0,
    loc_txt = {
        ['en-us'] = {
            name = 'The Universe In Its Fucking Entirety'
        }
    }
}

return {
	name = "PokerHands",
  items = { Bulwark, asteroidbelt, Clusterfuck, void, UltPair, marsmoons, WholeDeck, universe },
}
