local oldcandy = {
    object_type = "Joker",
	name = "cry-oldcandy",
	key = "oldcandy",
	config = {extra = {h_mod = 1},
	pos = {x = 0, y = 0},
	loc_txt = {
        name = 'Nostalgic Candy',
        text = {
            "Increase hand size by {C:attention}#1#{} when sold,",
			},
	},
	rarity = "cry_epic",
	cost = 6,
	discovered = true,
	atlas = 'oldcandy',
	calculate = function(self, card, context)
	if context.selling_self and not context.retrigger_joker and not context.blueprint then
            G.hand:change_size(card.ability.extra.h_mod)
        end
end,
local oldcandy = {
    object_type = "Atlas",
    key = "oldcandy",
    
    path = "j_cry_oldcandy.png",
    px = 71,
    py = 95
}
