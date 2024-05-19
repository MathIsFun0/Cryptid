cry_enable_epics = false
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
	loc_vars = function(self, info_queue, center)
		return {vars = {''..(G.GAME and G.GAME.probabilities.normal or 1), center.ability.extra.odds}}
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
	object_type = "Atlas",
    key = "googol_play",
    
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
	object_type = "Atlas",
    key = "sync_catalyst",
    
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
	loc_vars = function(self, info_queue, center)
		return {vars = {center.ability.extra}}
	end,
	add_to_deck = function(card, from_debuff)
		G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra
	end,
	remove_from_deck = function(card, from_debuff)
		G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra
	end
}
local negative_sprite = {
	object_type = "Atlas",
    key = "negative",
    
    path = "j_cry_negative.png",
    px = 71,
    py = 95
}
local canvas = {
	object_type = "Joker",
	name = "cry-Canvas",
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
	cost = 15,
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
			if not context.retrigger_joker then
				for i = 1, #G.jokers.cards do
					for n = 1, self.config.num_retriggers do
						if self.T.x + self.T.w/2 > G.jokers.cards[i].T.x + G.jokers.cards[i].T.w/2 then
							G.E_MANAGER:add_event(Event({
								trigger = 'immediate',
								func = function()
									self:juice_up(0.5, 0.5)
									return true
								end
							})) 
							cry_trigger_joker(G.jokers.cards[i],context)
						end
					end
				end
			end
		end
	end,
}
local canvas_sprite = {
	object_type = "Atlas",
    key = "canvas",
    
    path = "j_cry_canvas.png",
    px = 71,
    py = 95
}
local error_joker = {
	object_type = "Joker",
	name = "cry-Error",
	key = "error",
	pos = {x = 0, y = 0},
	config = {extra = {sell_rounds = 0, active = false}},
	loc_txt = {
        name = 'ERROR',
        text = {
			""
		}
    },
	rarity = "cry_epic",
	cost = 1,
	discovered = true,
	blueprint_compat = false,
	atlas = "error",
	calculate = function(self, context)
		if context.end_of_round and not context.blueprint and not context.repetition then
			if self.ability.extra.sell_rounds == 0 and not self.ability.extra.active then
				self.ability.extra.sell_rounds = pseudorandom("cry_error", 1, 10)
			end
			self.ability.extra.sell_rounds = self.ability.extra.sell_rounds - 1;
			if self.ability.extra.sell_rounds == 0 then
				self.ability.extra.active = true
				local eval = function(card) return not card.REMOVED end
				juice_card_until(self, eval, true)
			end
			return {
				message = "???",
				colour = G.C.BLACK
			}
		end
		if context.selling_self and self.ability.extra.active then
			local eval = function(card) return (card.ability.loyalty_remaining == 0) and not G.RESET_JIGGLES end
                                    juice_card_until(self, eval, true)
			local jokers = {}
			for i=1, #G.jokers.cards do 
				if G.jokers.cards[i].ability.name ~= "cry-Error" then
					jokers[#jokers+1] = G.jokers.cards[i]
				end
			end
			for i = 1, #jokers do
				local card = copy_card(jokers[i]	)
				card:set_edition({
					negative = true
				})
				card:add_to_deck()
				G.jokers:emplace(card)
			end
		end
	end
}
local error_sprite = {
	object_type = "Atlas",
    key = "error",
    
    path = "j_cry_error.png",
    px = 71,
    py = 95
}
local m = {
	object_type = "Joker",
	name = "cry-m",
	key = "m",
	pos = {x = 0, y = 0},
	config = {extra = {extra = 13, x_mult = 1}, t_mult = 8, type = 'Pair'},
	loc_txt = {
        name = 'm',
        text = {
			"This Joker gains {X:mult,C:white} X#1# {} Mult",
			"when {C:attention}Jolly Joker{} is sold",
			"{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)"
		}
    },
	rarity = "cry_epic",
	cost = 13,
	discovered = true,
	blueprint_compat = true,loc_vars = function(self, info_queue, center)
		info_queue[#info_queue+1] = { set = 'Joker', key = 'j_jolly', specific_vars = {self.config.t_mult, self.config.type} }
        return {vars = {center.ability.extra.extra, center.ability.extra.x_mult}}
    end,
	atlas = "m",
	calculate = function(self, context)
        if context.cardarea == G.jokers and (self.ability.extra.x_mult > 1) and not context.before and not context.after then
            return {
                message = localize{type='variable',key='a_xmult',vars={self.ability.extra.x_mult}},
                Xmult_mod = self.ability.extra.x_mult
            }
        end
		if context.selling_card and context.card.ability.name == "Jolly Joker" then
			self.ability.extra.x_mult = self.ability.extra.x_mult + self.ability.extra.extra
			card_eval_status_text(self, 'extra', nil, nil, nil, {message = localize{type = 'variable', key = 'a_xmult', vars = {self.ability.extra.x_mult}}})
		end
	end
}
local m_sprite = {
	object_type = "Atlas",
    key = "m",
    
    path = "j_cry_m.png",
    px = 71,
    py = 95
}
local boredom = {
	object_type = "Joker",
	name = "cry-Boredom",
	key = "boredom",
	pos = {x = 0, y = 0},
	config = {extra = {odds = 2}},
	loc_txt = {
        name = 'Boredom',
        text = {
			"{C:green}#1# in #2#{} chance to",
			"{C:attention}retrigger{} each Joker",
			"or played card"
		}
    },
	rarity = "cry_epic",
	cost = 12,
	discovered = true,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, center)
		return {vars = {''..(G.GAME and G.GAME.probabilities.normal or 1), center.ability.extra.odds}}
    end,
	atlas = "boredom",
	calculate = function(self, context)
        if context.cardarea == G.jokers and not context.before and not context.after and not context.retrigger_joker then
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i].ability.name ~= "cry-Boredom" and pseudorandom("cry_boredom_joker") < G.GAME.probabilities.normal/self.ability.extra.odds then
					G.E_MANAGER:add_event(Event({
						trigger = 'immediate',
						func = function()
							self:juice_up(0.5, 0.5)
							return true
						end
					})) 
					cry_trigger_joker(G.jokers.cards[i],context)
				end
			end
        end
		if context.repetition and context.cardarea == G.play then
			if pseudorandom("cry_boredom_joker") < G.GAME.probabilities.normal/self.ability.extra.odds then
				return {
					message = localize('k_again_ex'),
					repetitions = 1,
					card = self
				}
			end
		end
	end
}
local boredom_sprite = {
	object_type = "Atlas",
    key = "boredom",
    
    path = "j_cry_boredom.png",
    px = 71,
    py = 95
}
return {name = "Epic Jokers", 
		init = function()
			
			--Error Patches
			cry_error_operators = {"+","-","X","/","^","=",">","<","m"}
			cry_error_numbers = {"0","1","2","3","4","5","6","7","8","9","10","69","404","420","-1","0.5","m","nan","inf","nil","pi","1e9","???"}
			cry_error_msgs = {
				{string = 'rand()', colour = G.C.RARITY["cry_exotic"]},
				{string = 'm', colour = G.C.UI.TEXT_DARK},
				{string = 'Chips', colour = G.C.CHIPS},
				{string = 'Mult', colour = G.C.MULT},
				{string = 'Jokers', colour = G.C.FILTER},
				{string = 'dollars', colour = G.C.FILTER},
				{string = 'hands', colour = G.C.FILTER},
				{string = 'slots', colour = G.C.FILTER},
				{string = 'Antes', colour = G.C.FILTER},
				{string = 'ERROR', colour = G.C.UI.TEXT_INACTIVE},
				{string = 'Tarots', colour = G.C.SECONDARY_SET.Tarot},
				{string = 'Planets', colour = G.C.SECONDARY_SET.Planet},
				{string = 'Specls', colour = G.C.SECONDARY_SET.Spectral},
				{string = "#@"..(G.deck and G.deck.cards[1] and G.deck.cards[#G.deck.cards].base.id or 11)..(G.deck and G.deck.cards[1] and G.deck.cards[#G.deck.cards].base.suit:sub(1,1) or 'D'), colour = G.C.RED},
			}

			cry_enable_epics = true
			G.P_JOKER_RARITY_POOLS["cry_epic"] = {googol_play, sync_catalyst, negative, canvas, error_joker, m, boredom}
		end,
		items = {googol_play_sprite, sync_catalyst_sprite, negative_sprite, canvas_sprite, error_sprite, m_sprite, boredom_sprite, googol_play, sync_catalyst, negative, canvas, error_joker, m, boredom}}