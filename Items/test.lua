local cursor = {
    object_type = "Joker",
	name = "cry-Cursor",
	key = "cursor",
    config = {extra = {chips = 0, chip_mod = 5}},
	pos = {x = 0, y = 0},
	loc_txt = {
        name = 'Cursor',
        text = {
            "This Joker gains {C:chips}+#2#{} Chips",
            "per card {C:attention}purchased{}",
            "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)"
        }
    },
	rarity = 1,
	cost = 5,
	discovered = true,
    blueprint_compat = true,
	atlas = "cursor",
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.chips, center.ability.extra.chip_mod}}
    end,
    calculate = function(self, card, context)
        if context.buying_card and not context.blueprint then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize{type = 'variable', key = 'a_chips', vars = {card.ability.extra.chips}}, colour = G.C.CHIPS})
            return {calculated = true}
        end
        if context.cardarea == G.jokers and (card.ability.extra.chips > 0) and not context.before and not context.after then
            return {
                message = localize{type='variable',key='a_chips',vars={card.ability.extra.chips}},
                chip_mod = card.ability.extra.chips
            }
        end
    end
}
local jimball = {
	object_type = "Joker",
	name = "cry-Jimball",
	key = "jimball",
	pos = {x = 0, y = 0},
    config = {x_mult = 1, extra = 0.15},
	loc_txt = {
        name = 'Jimball',
        text = {
            "This Joker gains {X:mult,C:white} X#1# {} Mult",
            "per {C:attention}consecutive{} hand played",
            "while playing your",
            "most played {C:attention}poker hand",
            "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)"
		}
    },
	loc_vars = function(self, info_queue, center)
		return {vars = {center.ability.extra, center.ability.x_mult}}
    end,
	rarity = 3,
	cost = 10,
	discovered = true,
	blueprint_compat = true,
	calculate = function(self, card, context)
        if context.before and not context.blueprint then
            local reset = false
            local play_more_than = (G.GAME.hands[context.scoring_name].played or 0)
            for k, v in pairs(G.GAME.hands) do
                if k ~= context.scoring_name and v.played >= play_more_than and v.visible then
                    reset = true
                end
            end
            if reset then
                if card.ability.x_mult > 1 then
                    card.ability.x_mult = 1
                    return {
                        card = self,
                        message = localize('k_reset')
                    }
                end
            else
                card.ability.x_mult = card.ability.x_mult + card.ability.extra
            end
        end
	end,
	atlas = "jimball",
}
local jimball_sprite = {
	object_type = "Atlas",
    key = "jimball",
    path = "j_cry_jimball.png",
    px = 71,
    py = 95
}
