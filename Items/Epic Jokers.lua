enable_epics = true
local wee_fib = SMODS.Joker({
	name = "Wee Fibonacci",
	key = "wee_fib",
	config = {extra = {mult = 0, mult_mod = 4}},
	pos = {x = 1, y = 5},
	loc_txt = {
        name = 'Wee Fibonacci',
        text = {
		"This Joker gains",
		"{C:mult}+#2#{} Mult for each scored",
		"{C:attention}Ace{}, {C:attention}2{}, {C:attention}3{}, {C:attention}5{}, or {C:attention}8{}",
		"{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)"}
    },
	rarity = "Epic",
	cost = 15,
	discovered = true,
	blueprint_compat = true,
	loc_def = function(center)
		return {center.ability.extra.mult,center.ability.extra.mult_mod}
	end,
	calculate = function(self, context)
		if context.cardarea == G.play and context.individual and not context.blueprint then
			local rank = SMODS.Ranks[context.other_card.base.value].key
			if rank == "Ace" or rank == "2" or rank == "3" or rank == "5" or rank == "8" then
				self.ability.extra.mult = self.ability.extra.mult + self.ability.extra.mult_mod
				
				return {
					extra = {focus = self, message = localize('k_upgrade_ex')},
					card = self,
					colour = G.C.MULT
				}
			end
		end
		if context.cardarea == G.jokers and (self.ability.extra.mult > 0) and not context.before and not context.after then
			return {
				message = localize{type='variable',key='a_mult',vars={self.ability.extra.mult}},
				mult_mod = self.ability.extra.mult, 
				colour = G.C.MULT
			}
		end
	end,
})
local googol_play = SMODS.Joker({
	name = "Googol Play Card",
	key = "googol_play",
	config = {extra = {Xmult = 1e100, odds = 10}},
	pos = {x = 0, y = 0},
	loc_txt = {
        name = 'Googol Play Card',
        text = {
			"{C:green}#1# in #2#{} chance for",
			"{X:red,C:white} X1e100 {} Mult"
		}
    },
	rarity = "Epic",
	cost = 10,
	discovered = true,
	blueprint_compat = true,
	atlas = "googol_play",
	soul_pos = {x = 2, y = 0, extra = {x = 1, y = 0}},
	loc_def = function(center)
		return {''..(G.GAME and G.GAME.probabilities.normal or 1), center.ability.extra.odds}
	end,
	calculate = function(self, context)
		if context.cardarea == G.jokers and not context.before and not context.after and pseudorandom('cry_googol_play') < G.GAME.probabilities.normal/self.ability.extra.odds then
			return {
				message = localize{type='variable',key='a_xmult',vars={self.ability.extra.Xmult}},
				Xmult_mod = self.ability.extra.Xmult
			}
		end
	end,
})
local googol_play_sprite = SMODS.Sprite({
    key = "googol_play",
    atlas = "asset_atlas",
    path = "j_cry_googol_play.png",
    px = 71,
    py = 95
})

G.P_JOKER_RARITY_POOLS["Epic"] = {wee_fib, googol_play}
return {name = "Epic Jokers", items = {wee_fib, googol_play}}