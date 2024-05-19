local dropshot = {
    object_type = "Joker",
	name = "cry-Dropshot",
	key = "dropshot",
    config = {extra = {extra = 0.2, x_mult = 1}},
	pos = {x = 0, y = 0},
	loc_txt = {
        name = 'Dropshot',
        text = {
        "This Joker gains {X:mult,C:white} X#1# {} Mult",
		"per played, nonscoring {V:1}#2#{} card,",
		"suit changes every round",
        "{C:inactive}(Currently {X:mult,C:white} X#3# {C:inactive} Mult)"
        }
    },
	rarity = 3,
	cost = 8,
	discovered = true,
	atlas = "dropshot",
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.extra, localize(G.GAME.current_round.cry_dropshot_card.suit, 'suits_singular'), center.ability.extra.x_mult, colours = {G.C.SUITS[G.GAME.current_round.cry_dropshot_card.suit]}}}
    end,
    calculate = function(self, context)
        if context.cardarea == G.jokers and context.before and not context.blueprint then
            cards = 0
            for k, v in ipairs(context.scoring_hand) do
                v.cry_dropshot_incompat = true
            end
            for k, v in ipairs(context.full_hand) do
                if not v.cry_dropshot_incompat and v:is_suit(G.GAME.current_round.cry_dropshot_card.suit)then
                    cards = cards + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            v:juice_up()
                            return true
                        end
                    })) 
                end
            end
            for k, v in ipairs(context.scoring_hand) do
                v.cry_dropshot_incompat = nil
            end
            if cards > 0 then 
                self.ability.extra.x_mult = self.ability.extra.x_mult + cards * self.ability.extra.extra
                card_eval_status_text(self, 'extra', nil, nil, nil, {message = localize{type = 'variable', key = 'a_xmult', vars = {self.ability.extra.x_mult}}})
            end
        end
        if context.cardarea == G.jokers and (self.ability.extra.x_mult > 1) and not context.before and not context.after then
            return {
                message = localize{type='variable',key='a_xmult',vars={self.ability.extra.x_mult}},
                Xmult_mod = self.ability.extra.x_mult
            }
        end
    end
}
local dropshot_sprite = {
    object_type = "Atlas",
    key = "dropshot",
    
    path = "j_cry_dropshot.png",
    px = 71,
    py = 95
}
local maximized = {
    object_type = "Joker",
	name = "cry-Maximized",
	key = "maximized",
	pos = {x = 0, y = 0},
	loc_txt = {
        name = 'Maximized',
        text = {
        "All {C:attention}face{} cards",
		"are considered {C:attention}Kings{},",
        "all {C:attention}numbered{} cards",
		"are considered {C:attention}10s{}"
        }
    },
	rarity = 3,
	cost = 10,
	discovered = true,
	atlas = "maximized"
}
local maximized_sprite = {
    object_type = "Atlas",
    key = "maximized",
    
    path = "j_cry_maximized.png",
    px = 71,
    py = 95
}
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
	blueprint_compat = true,
	atlas = 'pot_of_jokes',
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.h_size<0 and center.ability.extra.h_size or "+"..center.ability.extra.h_size,center.ability.extra.h_mod}}
    end,
    calculate = function(self, context)
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
}
local potofjokes_sprite = {
    object_type = "Atlas",
    key = "pot_of_jokes",
    
    path = "j_cry_pot_of_jokes.png",
    px = 71,
    py = 95
}
local queensgambit = {
    object_type = "Joker",
    name = "cry-Queen's Gambit",
    key = "queens_gambit",
    pos = {x = 0, y = 0},
    config = { extra = { mult = 0, x_mult = 2 , type = 'Straight Flush'}},
    loc_txt = {
        name = 'Queen\'s Gambit',
        text = { "If {C:attention}poker hand{} is a",
        "{C:attention}Royal Flush{}, destroy scored",
        "{C:attention}Queen{} and create a",
        "{C:dark_edition}Negative {}{C:red}Rare{}{C:attention} Joker{}"}
    },
    rarity = 3,
    cost = 10,
    discovered = true,
    atlas = "queens_gambit",
    calculate = function(self, context)
        if context.cardarea == G.jokers and context.before and not context.blueprint then
            if next(context.poker_hands[self.ability.extra.type]) and G.GAME.current_round.current_hand.handname == "Royal Flush" then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    func = function()
                        local card = create_card("Joker", G.jokers, nil, 0.99, nil, nil, nil, "cry_gambit")
                        card:set_edition({
                            negative = true
                        })
                        card:add_to_deck()
                        G.jokers:emplace(card)
                        card:start_materialize()
                        return true
                    end
                }))

                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    func = function()
                        for i = 1, #context.scoring_hand do
                            if SMODS.Ranks[context.scoring_hand[i].base.value].key == "Queen" then
                                local card_to_destroy = context.scoring_hand[i]
                                card_to_destroy.getting_sliced = true
                                card_to_destroy:start_dissolve()
                                return true
                            end
                        end
                    end
                }))
                return {
                    message = localize('k_plus_joker'),
                    colour = G.C.RED
                }
            end 
        end
    end
}
local queensgambit_sprite = {
    object_type = "Atlas",
    key = "queens_gambit",
    
    path = "j_cry_queens_gambit.png",
    px = 71,
    py = 95
}
local wee_fib = {
	object_type = "Joker",
	name = "cry-Wee Fibonacci",
	key = "wee_fib",
	config = {extra = {mult = 0, mult_mod = 3}},
	pos = {x = 1, y = 5},
	loc_txt = {
        name = 'Wee Fibonacci',
        text = {
		"This Joker gains",
		"{C:mult}+#2#{} Mult for each scored",
		"{C:attention}Ace{}, {C:attention}2{}, {C:attention}3{}, {C:attention}5{}, or {C:attention}8{}",
		"{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)"}
    },
	rarity = 3,
	cost = 12,
	discovered = true,
	blueprint_compat = true,
	perishable_compat = false,
	loc_vars = function(self, info_queue, center)
		return {vars = {center.ability.extra.mult,center.ability.extra.mult_mod}}
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


return {name = "Misc. Jokers", 
        init = function()
            --Dropshot Patches
            local gigo = Game.init_game_object;
            function Game:init_game_object()
                local g = gigo(self)
                g.current_round.cry_dropshot_card = {suit = 'Spades'}
                return g
            end
            local rcc = reset_castle_card;
            function reset_castle_card()
                rcc()
                G.GAME.current_round.cry_dropshot_card.suit = 'Spades'
                local valid_castle_cards = {}
                for k, v in ipairs(G.playing_cards) do
                    if v.ability.effect ~= 'Stone Card' then
                        valid_castle_cards[#valid_castle_cards+1] = v
                    end
                end
                if valid_castle_cards[1] then 
                    local castle_card = pseudorandom_element(valid_castle_cards, pseudoseed('cry_dro'..G.GAME.round_resets.ante))
                    if not G.GAME.current_round.cry_dropshot_card then
                        G.GAME.current_round.cry_dropshot_card = {}
                    end
                    G.GAME.current_round.cry_dropshot_card.suit = castle_card.base.suit
                end
            end

            --Maximized Patches
            local cgi_ref = Card.get_id
            override_maximized = false
            function Card:get_id()
                local id = cgi_ref(self)
                if (next(find_joker("cry-Maximized")) and not override_maximized) then
                    if (id >= 2 and id <= 10) then id = 10 end
                    if (id >= 11 and id <= 13 or next(find_joker("Pareidolia"))) then id = 13 end
                end
                return id
            end
            --Fix issues with View Deck and Maximized
            local gui_vd = G.UIDEF.view_deck
            function G.UIDEF.view_deck(unplayed_only)
                override_maximized = true
                local ret_value = gui_vd(unplayed_only)
                override_maximized = false
                return ret_value
            end

            --Pot of Jokes Patches
            local c_atd = Card.add_to_deck
            function Card:add_to_deck(from_debuff)
                if not self.added_to_deck and self.ability.name == "cry-Pot of Jokes" then
                    G.hand:change_size(self.ability.extra.h_size)
                end
                return c_atd(self, from_debuff)
            end
            local c_rfd = Card.remove_from_deck
            function Card:remove_from_deck(from_debuff)
                if self.added_to_deck and self.ability.name == "cry-Pot of Jokes" then
                    G.hand:change_size(-self.ability.extra.h_size)
                end
                return c_rfd(self, from_debuff)
            end
        end,
        items = {dropshot_sprite, maximized_sprite, potofjokes_sprite, queensgambit_sprite, dropshot, maximized, potofjokes, queensgambit, wee_fib}}
