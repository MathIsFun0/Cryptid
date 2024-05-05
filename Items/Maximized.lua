local maximized = SMODS.Joker({
	name = "Maximized",
	key = "maximized",
	pos = {x = 0, y = 0},
	loc_txt = {
        name = 'Maximized',
        text = {
        "All {C:attention}face{} cards",
		"are considered {C:attention}Kings{},",
        "all {C:attention}numbered{} cards",
		"are considered {C:attention}10s{}"
        }
    },
	rarity = 3,
	cost = 10,
	discovered = true,
	atlas = "maximized"
})

local cgi_ref = Card.get_id
override_maximized = false
function Card:get_id()
    local id = cgi_ref(self)
    if (next(find_joker("Maximized")) and not override_maximized) then
        if (id >= 2 and id <= 10) then id = 10 end
        if (id >= 11 and id <= 13 or next(find_joker("Pareidolia"))) then id = 13 end
    end
	return id
end

--Fix issues with View Deck and Maximized
local gui_vd = G.UIDEF.view_deck
function G.UIDEF.view_deck(unplayed_only)
	override_maximized = true
	local ret_value = gui_vd(unplayed_only)
	override_maximized = false
	return ret_value
end

local maximized_sprite = SMODS.Sprite({
    key = "maximized",
    atlas = "asset_atlas",
    path = "j_cry_maximized.png",
    px = 71,
    py = 95
})

return {maximized_sprite, maximized}