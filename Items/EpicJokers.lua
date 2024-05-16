cry_enable_epics = false
local wee_fib = {
	object_type = "Joker",
	name = "cry-Wee Fibonacci",
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
	rarity = "cry_epic",
	cost = 12,
	discovered = true,
	blueprint_compat = true,
	perishable_compat = false,
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
}
local googol_play = {
	object_type = "Joker",
	name = "cry-Googol Play Card",
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
	rarity = "cry_epic",
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
}
local googol_play_sprite = {
	object_type = "Sprite",
    key = "googol_play",
    atlas = "asset_atlas",
    path = "j_cry_googol_play.png",
    px = 71,
    py = 95
}
local sync_catalyst = {
	object_type = "Joker",
	name = "cry-Sync Catalyst",
	key = "sync_catalyst",
	pos = {x = 0, y = 0},
	loc_txt = {
        name = 'Sync Catalyst',
        text = {
			"Balance {C:blue}Chips{} and",
			"{C:red}Mult{} when this Joker",
			"is triggered"
		}
    },
	rarity = "cry_epic",
	cost = 11,
	discovered = true,
	blueprint_compat = true,
	atlas = "sync_catalyst",
	calculate = function(self, context)
		if context.cardarea == G.jokers and not context.before and not context.after then
			local tot = hand_chips + mult
			hand_chips = mod_chips(math.floor(tot/2))
			mult = mod_mult(math.floor(tot/2))
			update_hand_text({delay = 0}, {mult = mult, chips = hand_chips})
			return {
				message = localize('k_balanced'),
				colour = {0.8, 0.45, 0.85, 1}
			}
		end
	end,
}
local sync_catalyst_sprite = {
	object_type = "Sprite",
    key = "sync_catalyst",
    atlas = "asset_atlas",
    path = "j_cry_sync_catalyst.png",
    px = 71,
    py = 95
}
local negative = {
	object_type = "Joker",
	name = "cry-Negative Joker",
	key = "negative",
	pos = {x = 0, y = 0},
	config = {extra = 3},
	loc_txt = {
        name = 'Negative Joker',
        text = {
			"{C:dark_edition}+#1#{} Joker slots"
		}
    },
	rarity = "cry_epic",
	cost = 12,
	discovered = true,
	blueprint_compat = false,
	atlas = "negative",
	loc_def = function(center)
		return {center.ability.extra}
	end,
}
local negative_sprite = {
	object_type = "Sprite",
    key = "negative",
    atlas = "asset_atlas",
    path = "j_cry_negative.png",
    px = 71,
    py = 95
}
local canvas = {
	object_type = "Joker",
	name = "Canvas",
	key = "canvas",
	pos = {x = 0, y = 0},
	config = {num_retriggers = 0},
	loc_txt = {
        name = 'Canvas',
        text = {
			"{C:attention}Retrigger{} all Jokers to the left",
			"once for {C:attention}every{} non-{C:blue}Common{} Joker",
			"to the right of this Joker"
		}
    },
	rarity = "cry_epic",
	cost = 12,
	discovered = true,
	blueprint_compat = true,
	atlas = "canvas",
	calculate = function(self, context)
		if context.cardarea == G.jokers and not context.before and not context.after and not context.remove_playing_cards and not context.debuffed_hand then
			if not context.blueprint then
				self.config.num_retriggers = 0
				local counting = false
				for i = 1, #G.jokers.cards do
					if self.T.x + self.T.w/2 < G.jokers.cards[i].T.x + G.jokers.cards[i].T.w/2 and G.jokers.cards[i].config.center.rarity ~= 1 then
						self.config.num_retriggers = self.config.num_retriggers + 1
					end
				end
			end
			print(self.config.num_retriggers)
			for i = 1, #G.jokers.cards do
				for n = 1, self.config.num_retriggers do
					if self.T.x + self.T.w/2 > G.jokers.cards[i].T.x + G.jokers.cards[i].T.w/2 then
						G.E_MANAGER:add_event(Event({
							func = function()
								self:juice_up(0.5, 0.5)
								return true
							end
						})) 
						local text,disp_text,poker_hands,scoring_hand,non_loc_disp_text = G.FUNCS.get_poker_hand_info(G.play.cards)
						local effects = eval_card(G.jokers.cards[i], context)
						local percent = 0.3
						local percent_delta = 0.08
						if effects.jokers then 
							local extras = {mult = false, hand_chips = false}
							if effects.jokers.mult_mod then mult = mod_mult(mult + effects.jokers.mult_mod);extras.mult = true end
							if effects.jokers.chip_mod then hand_chips = mod_chips(hand_chips + effects.jokers.chip_mod);extras.hand_chips = true end
							if effects.jokers.Xmult_mod then mult = mod_mult(mult*effects.jokers.Xmult_mod);extras.mult = true  end
							update_hand_text({delay = 0}, {chips = extras.hand_chips and hand_chips, mult = extras.mult and mult})
							card_eval_status_text(G.jokers.cards[i], 'jokers', nil, percent, nil, effects.jokers)
							percent = percent+percent_delta
						end
					end
				end
			end
		end
	end,
}
local canvas_sprite = {
	object_type = "Sprite",
    key = "canvas",
    atlas = "asset_atlas",
    path = "j_cry_canvas.png",
    px = 71,
    py = 95
}

return {name = "Epic Jokers", 
		init = function()
			--Negative Joker Patches
			local c_atd = Card.add_to_deck
			function Card:add_to_deck(from_debuff)
				if not self.added_to_deck and self.ability.name == "cry-Negative Joker" then
					G.jokers.config.card_limit = G.jokers.config.card_limit + self.ability.extra
				end
				return c_atd(self, from_debuff)
			end
			local c_rfd = Card.remove_from_deck
			function Card:remove_from_deck(from_debuff)
				if self.added_to_deck and self.ability.name == "cry-Negative Joker" then
					G.jokers.config.card_limit = G.jokers.config.card_limit - self.ability.extra
				end
				return c_rfd(self, from_debuff)
			end

			cry_enable_epics = true
			G.P_JOKER_RARITY_POOLS["cry_epic"] = {wee_fib, googol_play, sync_catalyst, negative, canvas}
		end,
		items = {googol_play_sprite, sync_catalyst_sprite, negative_sprite, canvas_sprite, wee_fib, googol_play, sync_catalyst, negative, canvas}}