local dropshot = SMODS.Joker({
	name = "Dropshot",
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
	atlas = "dropshot"
})

function dropshot.loc_def(center)
	return {center.ability.extra.extra, localize(G.GAME.current_round.cry_dropshot_card.suit, 'suits_singular'), center.ability.extra.x_mult, colours = {G.C.SUITS[G.GAME.current_round.cry_dropshot_card.suit]}}
end

dropshot.calculate = function(self, context)
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
        G.GAME.current_round.cry_dropshot_card.suit = castle_card.base.suit
    end
end

local dropshot_sprite = SMODS.Sprite({
    key = "dropshot",
    atlas = "asset_atlas",
    path = "j_cry_dropshot.png",
    px = 71,
    py = 95
})
local maximized = SMODS.Joker({
	name = "Maximized",
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
})

local cgi_ref = Card.get_id
override_maximized = false
function Card:get_id()
    local id = cgi_ref(self)
    if (next(find_joker("Maximized")) and not override_maximized) then
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

local maximized_sprite = SMODS.Sprite({
    key = "maximized",
    atlas = "asset_atlas",
    path = "j_cry_maximized.png",
    px = 71,
    py = 95
})
local potofjokes = SMODS.Joker({
	name = "Pot of Jokes",
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
	atlas = 'pot_of_jokes'
})
function potofjokes.loc_def(center)
	return {center.ability.extra.h_size<0 and center.ability.extra.h_size or "+"..center.ability.extra.h_size,center.ability.extra.h_mod}
end

local c_atd = Card.add_to_deck
function Card:add_to_deck(from_debuff)
    if not self.added_to_deck and self.ability.name == "Pot of Jokes" then
        G.hand:change_size(self.ability.extra.h_size)
    end
    return c_atd(self, from_debuff)
end
local c_rfd = Card.remove_from_deck
function Card:remove_from_deck(from_debuff)
    if self.added_to_deck and self.ability.name == "Pot of Jokes" then
        G.hand:change_size(-self.ability.extra.h_size)
    end
    return c_rfd(self, from_debuff)
end
potofjokes.calculate = function(self, context)
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

local potofjokes_sprite = SMODS.Sprite({
    key = "pot_of_jokes",
    atlas = "asset_atlas",
    path = "j_cry_pot_of_jokes.png",
    px = 71,
    py = 95
})

local queensgambit = SMODS.Joker({
    name = "Queens Gambit",
    key = "queens_gambit",
    pos = {x = 0, y = 0},
    config = { extra = { mult = 0, x_mult = 2 , type = 'Straight Flush'}},
    loc_txt = {
        name = 'Queens Gambit',
        text = { "When a {C:attention}Royal Flush{} is played",
        "Destroy scored {C:attention}Queen{}",
        "and create a {C:dark_edition}Negative {}{C:red}Rare{}{C:attention} Joker{}"}
    },
    rarity = 3,
    cost = 10,
    discovered = true,
    atlas = "queens_gambit"
})

queensgambit.calculate = function(self, context)         
    if context.cardarea == G.jokers and context.before and not context.blueprint then
        local hasace = 0
        local hasten = 0
        for i = 1, #context.scoring_hand do
            if context.scoring_hand[i]:get_id() == 14 then hasace=1 
            elseif context.scoring_hand[i]:get_id() == 10 then hasten=1
            end
        end
            if next(context.poker_hands[self.ability.extra.type]) and hasace==1 and hasten==1 then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    func = function()
                        local card = create_card("Joker", G.jokers, nil, 0.99, nil, nil, nil, "wra")
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
                            if context.scoring_hand[i]:get_id() == 12 then
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

local queensgambit_sprite = SMODS.Sprite({
    key = "queens_gambit",
    atlas = "asset_atlas",
    path = "j_cry_queens_gambit.png",
    px = 71,
    py = 95

})


return {name = "Misc. Jokers", items = {dropshot_sprite, maximized_sprite, queensgambit_sprite, dropshot, maximized, potofjokes, queensgambit}}


