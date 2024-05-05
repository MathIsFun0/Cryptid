local iterum = SMODS.Joker({
	name = "Iterum",
	key = "iterum",
	config = {extra = {x_mult = 1.5, repetitions = 1}},
	pos = {x = 0, y = 0},
	loc_txt = {
        name = 'Iterum',
        text = {
        "Retrigger all cards played {C:attention}#2#{} time(s),",
        "each played card gives",
        "{X:mult,C:white} X#1# {} Mult when scored"}
    },
	rarity = "Exotic",
	cost = 50,
	discovered = true,
	blueprint_compat = true,
	atlas = 'iterum',
	soul_pos = {x = 1, y = 0, extra = {x = 2, y = 0}}
})
function iterum.loc_def(center)
	return {center.ability.extra.x_mult,center.ability.extra.repetitions}
end

iterum.calculate = function(self, context)
    if context.repetition then
        if context.cardarea == G.play then
            return {
                message = localize('k_again_ex'),
                repetitions = self.ability.extra.repetitions,
                card = self
            }
        end
    elseif context.individual then
        if context.cardarea == G.play then
            return {
                x_mult = self.ability.extra.x_mult,
                colour = G.C.RED,
                card = self
            }
        end
    end
end

local iterum_sprite = SMODS.Sprite({
    key = "iterum",
    atlas = "asset_atlas",
    path = "j_cry_iterum.png",
    px = 71,
    py = 95
})

return {iterum_sprite, iterum}