local maximized = SMODS.Joker:new(
	"Maximized", --name
	"cry_maximized", --slug
	{}, --config
	{x = 0, y = 0}, --spritePos
	{
        name = 'Maximized',
        text = {
        "All {C:attention}face{} cards",
		"are considered {C:attention}Kings{},",
        "all {C:attention}numbered{} cards",
		"are considered {C:attention}10s{}"
        }
    },
	3, --rarity
	10, --cost
	true, --unlocked
	true, --discovered
	true, --blueprint_compat
	true, --eternal_compat
	nil, --effect
	'j_cry_maximized' --atlas
)

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

local maximized_sprite = SMODS.Sprite:new("j_cry_maximized", SMODS.findModByID("Cryptid").path, "j_cry_maximized.png", 71, 95, "asset_atli")

return {maximized_sprite, maximized}