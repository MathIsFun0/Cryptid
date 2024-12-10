local d20 = {
	object_type = "Joker",
	key = "d20",
	pos = { x = 0, y = 0 },
	rarity = 3,
	cost = 10,
	order = 132,
	atlas = "atlasd20",
	config = {extra = {rollmult = 0, multiply = 1}},
	loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.rollmult, center.ability.extra.multiply } }
	end,
	calculate = function(self, card, context)
		if context.joker_main and not context.before and not context.after then
			local rollnum = roll_dice("cry_d20", 20, {ignore_value = card.ability.extra.rollmult})
			center.ability.extra.rollmult = rollnum.val
			if rollnum.hit == true then
				return {
					message = localize({ type = "variable", key = "a_xmult", vars = { 2 * card.ability.extra.multiply } }),
					Xmult_mod = 2 * card.ability.extra.multiply,
					colour = G.C.MULT,
				}
			elseif rollnum.miss == true then
				return {
					message = localize({ type = "variable", key = "a_xmult", vars = { 0.5 / card.ability.extra.multiply } }),
					Xmult_mod = 0.5 / card.ability.extra.multiply,
					colour = G.C.MULT,
				}
			else 
				return {
					message = localize({ type = "variable", key = "a_mult", vars = { card.ability.extra.rollmult } }),
					card.ability.extra.rollmult,
					colour = G.C.MULT,
				}
			}
		end
	end,
}
