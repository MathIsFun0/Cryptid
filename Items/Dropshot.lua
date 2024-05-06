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

return {dropshot_sprite, dropshot}