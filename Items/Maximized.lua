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
function Card:get_id()
    local id = cgi_ref(self)
    if (next(find_joker("Maximized"))) then
        if (id >= 2 and id <= 10) then id = 10 end
        if (id >= 11 and id <= 13) then id = 13 end
    end
	return id
end


local maximized_sprite = SMODS.Sprite:new("j_cry_maximized", SMODS.findModByID("Cryptid").path, "j_cry_maximized.png", 71, 95, "asset_atli")

return {maximized_sprite, maximized}