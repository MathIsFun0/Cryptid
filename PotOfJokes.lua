local potofjokes = SMODS.Joker:new(
	"Pot of Jokes", --name
	"cry_pot_of_jokes", --slug
	{extra = {h_size = 1, h_mod = 1}}, --config
	{x = 0, y = 0}, --spritePos
	{
        name = 'Pot of Jokes',
        text = {
            "{C:attention}+#1#{} hand size,",
            "increases by",
            "{C:blue}#2#{} every round"}
    },
	3, --rarity
	10, --cost
	true, --unlocked
	true, --discovered
	false, --blueprint_compat
	true, --eternal_compat
	nil, --effect
	'j_cry_pot_of_jokes' --atlas
)
function potofjokes.loc_def(center)
	return {center.ability.extra.h_size,center.ability.extra.h_mod}
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

local potofjokes_sprite = SMODS.Sprite:new("j_cry_pot_of_jokes", SMODS.findModByID("Cryptid").path, "j_cry_pot_of_jokes.png", 71, 95, "asset_atli")
return {potofjokes_sprite, potofjokes}