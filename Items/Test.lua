 if context.cardarea == G.play then
local eternalflame = {
	object_type = "Joker",
	name = "cry-eternalflame",
	key = "eternalflame",
	pos = {x = 0, y = 0},
	config = {extra = {extra = 0.1, x_mult = 1}},
	loc_txt = {
        name = 'Eternal Flame',
        text = {
			"This Joker gains {X:mult,C:white} X#1# {} Mult",
			"per {C:attention}card{} sold",
			"{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)"
		}
    },
	rarity = 3,
	cost = 9,
	discovered = true,
	blueprint_compat = true,loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.extra, center.ability.extra.x_mult}}
    end,
	atlas = "eternalflame",
	calculate = function(self, card, context)
        if context.cardarea == G.jokers and (card.ability.extra.x_mult > 1) and not context.before and not context.after then
            return {
                message = localize{type='variable',key='a_xmult',vars={card.ability.extra.x_mult}},
                Xmult_mod = card.ability.extra.x_mult
            }
        end
		if context.selling_card and not context.blueprint then
			card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.extra
			card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize{type = 'variable', key = 'a_xmult', vars = {card.ability.extra.x_mult}}})
			return {calculated = true}
		end
	end
}
local eternalflame_sprite = {
	object_type = "Atlas",
    key = "eternalflame",
    
    path = "j_cry_eternalflame.png",
    px = 71,
    py = 95
}
