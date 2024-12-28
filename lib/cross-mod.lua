-- cross-mod.lua - Used for compatibility and content with other mods

--Top Gear from The World End with Jimbo has several conflicts with Cryptid items
--Namely, It overrides the edition that edition jokers spawn with, and doesn't work correctly with edition decks
--I'm taking ownership of this, overiding it, and making an implementaion that is compatible with Cryptid

--Unrelated but kind of related side note: this prevents top gear from showing up in collection, not sure what's up with that
--Is it due to how TWEWJ is Coded? Is it an issue with Steamodded itself? Might be worth looking into, just sayin

if (SMODS.Mods["TWEWY"] or {}).can_load then
	SMODS.Joker:take_ownership("twewy_topGear", {
		name = "Cry-topGear",
		--Stop Top Gear's Old code from working by overriding these
		add_to_deck = function(self, card, from_debuff) end,
		remove_from_deck = function(self, card, from_debuff) end,
		rarity = 3,
		loc_txt = {
			name = "Top Gear",
			text = {
				"All {C:blue}Common{C:attention} Jokers{}",
				"are {C:dark_edition}Polychrome{}",
			},
		},
	})
end

--Make Ortalab's Locked jokers not show up on Deck of Equilibrium and Antimatter Deck
if (SMODS.Mods["ortalab"] or {}).can_load then
	for i = 1, 150 do
		print(i)
		SMODS.Joker:take_ownership('ortalab_temp_' .. i, {
			name = "Cry-skibidi",
			no_doe = true
		})
	end
end

--Requires Malverk Mod
if (SMODS.Mods["malverk"] or {}).can_load then
	AltTexture({
    		key = 'jolly_jokers',
    		set = 'Joker',
    		path = 'jolly.png',
    		loc_txt = {
        		name = 'Jolly Jokers'
    		}
	})
	TexturePack{ -- HD Texture Pack
    		key = 'jolly_texture',
    		textures = {
        		'cry_jolly_jokers',
    		},
    		loc_txt = {
       			name = 'Jolly',
        		text = {
            			'Jolly Jokers',
            			'Art by B'
        		}
    		}
	}
end