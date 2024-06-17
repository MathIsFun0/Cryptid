if context.selling_self and card.ability.extra.active and not context.retrigger_joker and not context.blueprint then
local potofjokes = {
    object_type = "Joker",
	name = "cry-Pot of Jokes",
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
	atlas = 'pot_of_jokes',
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.h_size<0 and center.ability.extra.h_size or "+"..center.ability.extra.h_size,center.ability.extra.h_mod}}
    end,
    calculate = function(self, card, context)
        if context.end_of_round and not context.individual and not context.repetition and not context.blueprint then
            card.ability.extra.h_size = card.ability.extra.h_size + card.ability.extra.h_mod
            G.hand:change_size(card.ability.extra.h_mod)
            return {
                message = localize{type='variable',key='a_handsize',vars={card.ability.extra.h_mod}},
                colour = G.C.FILTER,
                card = card
            }
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        G.hand:change_size(card.ability.extra.h_size)
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-card.ability.extra.h_size)
    end
}
local potofjokes_sprite = {
    object_type = "Atlas",
    key = "pot_of_jokes",
    
    path = "j_cry_pot_of_jokes.png",
    px = 71,
    py = 95
}
