--- STEAMODDED HEADER
--- MOD_NAME: Cryptid
--- MOD_ID: Cryptid
--- MOD_AUTHOR: [MathIsFun_, Balatro Discord]
--- MOD_DESCRIPTION: Adds unbalanced ideas to Balatro.
--- BADGE_COLOUR: 708b91

----------------------------------------------
------------MOD CODE -------------------------

_RELEASE_MODE = false

function SMODS.INIT.Cryptid()
    -- Custom Rarity setup (based on Relic-Jokers)
	G.localization.misc.dictionary.k_cry_exotic = "Exotic"
    Game:set_globals()
    G.C.RARITY["Exotic"] = HEX("708b91");
    local SMODS_inject_jokers_ref = SMODS.injectJokers
	function SMODS.injectJokers()
		G.P_JOKER_RARITY_POOLS["Exotic"] = {}
		SMODS_inject_jokers_ref()
	end
    local get_badge_colourref = get_badge_colour
	function get_badge_colour(key)
		local fromRef = get_badge_colourref(key)
	
		if key == 'cry_exotic' then return G.C.RARITY["Exotic"]
		else return fromRef end
	end

    -- Midground sprites
    local set_spritesref = Card.set_sprites
    function Card:set_sprites(_center, _front)
        set_spritesref(self, _center, _front);
        if _center and _center.soul_pos and _center.soul_pos.extra then
            self.children.floating_sprite2 = Sprite(self.T.x, self.T.y, self.T.w, self.T.h, G.ASSET_ATLAS[_center.atlas or _center.set], _center.soul_pos.extra)
            self.children.floating_sprite2.role.draw_major = self
            self.children.floating_sprite2.states.hover.can = false
            self.children.floating_sprite2.states.click.can = false
        end
    end

    -- File loading based on Relic-Jokers
    local files = NFS.getDirectoryItems(SMODS.findModByID("Cryptid").path.."Items")
    for _, file in ipairs(files) do
        local curr_obj = NFS.load(SMODS.findModByID("Cryptid").path.."Items/"..file)()
        for _, item in ipairs(curr_obj) do
            item:register()
        end
    end
end
----------------------------------------------
------------MOD CODE END----------------------