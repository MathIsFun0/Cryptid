local iterum = SMODS.Joker:new(
	"Iterum", --name
	"cry_iterum", --slug
	{extra = {x_mult = 1.5, repetitions = 1}}, --config
	{x = 0, y = 0}, --spritePos
	{
        name = 'Iterum',
        text = {
        "Retrigger all cards played {C:attention}#2#{} time(s),",
        "each played card gives",
        "{X:mult,C:white} X#1# {} Mult when scored"}
    },
	"Exotic", --rarity
	50, --cost
	true, --unlocked
	true, --discovered
	true, --blueprint_compat
	true, --eternal_compat
	nil, --effect
	'j_cry_iterum', --atlas
	{x = 1, y = 0, extra = {x = 2, y = 0}} --soul_pos
)
function iterum.loc_def(center)
	if center.ability.name == 'Iterum' then
		return {center.ability.extra.x_mult,center.ability.extra.repetitions}
	end
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

local iterum_sprite = SMODS.Sprite:new("j_cry_iterum", SMODS.findModByID("Cryptid").path, "j_cry_iterum.png", 71, 95, "asset_atli")

return {iterum_sprite, iterum}