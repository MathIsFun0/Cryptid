local potofjokes = SMODS.Joker({
	name = "Pot of Jokes",
	key = "pot_of_jokes",
	config = {extra = {h_size = -2, h_mod = 1}},
	pos = {x = 0, y = 0},
	loc_txt = {
        name = 'Pot of Jokes',
        text = {
            "{C:attention}#1#{} hand size,",
            "increases by",
            "{C:blue}#2#{} every round"}
    },
	rarity = 3,
	cost = 10,
    discovered = true,
	blueprint_compat = true,
	atlas = 'pot_of_jokes'
})
function potofjokes.loc_def(center)
	return {center.ability.extra.h_size<0 and center.ability.extra.h_size or "+"..center.ability.extra.h_size,center.ability.extra.h_mod}
end

local c_atd = Card.add_to_deck
function Card:add_to_deck(from_debuff)
    if not self.added_to_deck and self.ability.name == "Pot of Jokes" then
        G.hand:change_size(self.ability.extra.h_size)
    end
    return c_atd(self, from_debuff)
end
local c_rfd = Card.remove_from_deck
function Card:remove_from_deck(from_debuff)
    if self.added_to_deck and self.ability.name == "Pot of Jokes" then
        G.hand:change_size(-self.ability.extra.h_size)
    end
    return c_rfd(self, from_debuff)
end
potofjokes.calculate = function(self, context)
    if context.end_of_round and not context.individual and not context.repetition and not context.blueprint then
        self.ability.extra.h_size = self.ability.extra.h_size + self.ability.extra.h_mod
        G.hand:change_size(self.ability.extra.h_mod)
        return {
            message = localize{type='variable',key='a_handsize',vars={self.ability.extra.h_mod}},
            colour = G.C.FILTER,
            card = self
        }
    end
end

local potofjokes_sprite = SMODS.Sprite({
    key = "pot_of_jokes",
    atlas = "asset_atlas",
    path = "j_cry_pot_of_jokes.png",
    px = 71,
    py = 95
})
return {potofjokes_sprite, potofjokes}