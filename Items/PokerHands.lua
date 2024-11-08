local disc = function(self, card, badges)
	badges[#badges + 1] = create_badge('Circumstellar Disc', get_type_colour(self or card.config, card), nil, 1.2)
end

local nothingness = function(self, card, badges)
	badges[#badges + 1] = create_badge('          ', get_type_colour(self or card.config, card), nil, 1.2)
end

local moons = function(self, card, badges)
	badges[#badges + 1] = create_badge('Natural Satellites', get_type_colour(self or card.config, card), nil, 1.2)
end

local actualuniverse = function(self, card, badges)
	badges[#badges + 1] = create_badge('The Actual Fucking Universe', get_type_colour(self or card.config, card), nil, 1.2)
end

SMODS.PokerHand{
    key = 'Bulwark',
    visible = false,
    chips = 100,
    mult = 10,
    l_chips = 50,
    l_mult = 1,
    example = {
        { 'S_A',    true, 'm_stone' },
        { 'S_A',    true, 'm_stone' },
        { 'S_A',    true, 'm_stone' },
        { 'S_A',    true, 'm_stone' },
        { 'S_A',    true, 'm_stone' },
    },
    loc_txt = {
        ['en-us'] = {
            name = 'Bulwark',
            description = {
                '5 rankless, suitless cards played together.',
            }
        },
	['de'] = {
		name = 'Bollwerk',
        	description = {
                '5 ranglose, farbenlose Karten zusammen gespielt.',
            }
	}
    },
		evaluate = function(parts, hand)
		  local stones = {}
		  for i, card in ipairs(hand) do
		    if card.config.center_key == 'm_stone' or (card.config.center.no_rank and card.config.center.no_suit) then stones[#stones+1] = card end
		  end
		  return #stones >= 5 and {stones} or {}
		end,
}

SMODS.PokerHand{
    key = 'Clusterfuck',
    visible = false,
    chips = 200,
    mult = 19,
    l_chips = 40,
    l_mult = 4,
    example = {
        { 'S_A',    true },
        { 'C_K',    true },
        { 'H_J',    true },
        { 'S_T',    true },
        { 'D_9',    true },
        { 'D_8',    true },
        { 'S_6',    true },
        { 'C_5',    true },
    },
    loc_txt = {
        ['en-us'] = {
            name = 'Clusterfuck',
            description = {
                'At least 8 cards that do not',
                'contain a Pair, Flush, or Straight.',
            }
        },
	['de'] = {
		name = 'Clusterfuck',
        	description = {
                'Mindestens 8 Karten, welche nicht',
		'Paar, Flush oder Straße enthalten.'
            }
	}
    },
    evaluate = function(parts, hand)
    local other_hands = next(parts._flush) or next(parts._straight) or next(parts._all_pairs)
    if #hand > 7 then
      if not other_hands then return {hand} end
      end
    end,
}

SMODS.PokerHand{
    key = 'UltPair',
    visible = false,
    chips = 220,
    mult = 22,
    l_chips = 40,
    l_mult = 4,
    example = {
        { 'S_A',    true },
        { 'S_A',    true },
        { 'S_T',    true },
        { 'S_T',    true },
        { 'H_K',    true },
        { 'H_K',    true },
        { 'H_7',    true },
        { 'H_7',    true },
    },
    loc_txt = {
        ['en-us'] = {
            name = 'Ultimate Pair',
            description = {
                'Two Two Pairs, where each',
                'Two Pair is a single suit, for a',
								'total of two suits between them.',
            }
        },
	['de'] = {
	    name = 'Ultimatives Paar',
            description = {
                'Zwei zwei Paare, bei denen jedes',
		'von ihnen von einer Farbe ist,',
		'was insgesammt 2 Farben ergibt.'
            }
	}
    },
		evaluate = function(parts, hand)
		local scoring_pairs = {}
		local unique_suits = 0
		for suit, _ in pairs(SMODS.Suits) do
				local scoring_suit_pairs = {}
				for i = 1, #parts._2 do
						if parts._2[i][1]:is_suit(suit) and parts._2[i][2]:is_suit(suit) then
								scoring_suit_pairs[#scoring_suit_pairs+1] = i
						end
				end
				if #scoring_suit_pairs >= 2 then
						unique_suits = unique_suits + 1
						for i = 1, #scoring_suit_pairs do
								scoring_pairs[scoring_suit_pairs[i]] = (scoring_pairs[scoring_suit_pairs[i]] or 0) + 1
						end
				end
		end
		if unique_suits < 2 then return end
		local scored_cards = {}
		local sc_max = 0
		local sc_unique = 0
		for i = 1, #parts._2 do
				if scoring_pairs[i] then
						if scoring_pairs[i] > 1 then
								sc_unique = sc_unique + 1
						end
						sc_max = math.max(sc_max, scoring_pairs[i])
						scored_cards[#scored_cards+1] = parts._2[i][1]
						scored_cards[#scored_cards+1] = parts._2[i][2]
				end
		end
		if sc_max == #scored_cards/2 - 1 and sc_unique == 1 then
				return
		end
		if #scored_cards >= 8 then
			return {scored_cards}
		end
end,
}

SMODS.PokerHand{
    key = 'WholeDeck',
    visible = false,
    chips = 5200,
    mult = 520,
    l_chips = 520,
    l_mult = 52,
    example = {
        { 'S_A',    true },
                { 'H_A',    true },
                { 'C_A',    true },
                { 'D_A',    true },
                { 'S_K',    true },
                { 'H_K',    true },
                { 'C_K',    true },
                { 'D_K',    true },
                { 'S_Q',    true },
                { 'H_Q',    true },
                { 'C_Q',    true },
                { 'D_Q',    true },
                { 'S_J',    true },
                { 'H_J',    true },
                { 'C_J',    true },
                { 'D_J',    true },
                { 'S_T',    true },
                { 'H_T',    true },
                { 'C_T',    true },
                { 'D_T',    true },
                { 'S_9',    true },
                { 'H_9',    true },
                { 'C_9',    true },
                { 'D_9',    true },
                { 'S_8',    true },
                { 'H_8',    true },
                { 'C_8',    true },
                { 'D_8',    true },
                { 'S_7',    true },
                { 'H_7',    true },
                { 'C_7',    true },
                { 'D_7',    true },
                { 'S_6',    true },
                { 'H_6',    true },
                { 'C_6',    true },
                { 'D_6',    true },
                { 'S_5',    true },
                { 'H_5',    true },
                { 'C_5',    true },
                { 'D_5',    true },
                { 'S_4',    true },
                { 'H_4',    true },
                { 'C_4',    true },
                { 'D_4',    true },
                { 'S_3',    true },
                { 'H_3',    true },
                { 'C_3',    true },
                { 'D_3',    true },
                { 'S_2',    true },
                { 'H_2',    true },
                { 'C_2',    true },
                { 'D_2',    true },
    },
    loc_txt = {
        ['en-us'] = {
            name = 'The Entire Fucking Deck',
            description = {
                'A hand that contains every single',
                'card found in a 52-card deck.',
                                'Are you insane?',
            }
        }
    },
		evaluate = function(parts, hand)
		    if #hand >= 52 then
		        local deck_booleans = {}
		        local scored_cards = {}
		        for i = 1, 52 do
		            table.insert(deck_booleans, false)    -- i could write this out but nobody wants to see that
		        end
		        local wilds = {}
		        for i, card in ipairs(hand) do
		            if (card.config.center_key ~= 'm_wild' and not card.config.center.any_suit)
		            and (card.config.center_key ~= 'm_stone' and not card.config.center.no_rank) then    -- i don't know if these are different... this could be completely redundant but redundant is better than broken
		                local rank = card:get_id()
		                local suit = card.base.suit
		                local suit_int = 0
		                suit_table = {"Spades", "Hearts", "Clubs", "Diamonds"}
		                for i = 1, 4 do
		                    if suit == suit_table[i] then suit_int = i end
		                end
		                if suit_int > 0 then    -- check for custom rank here to prevent breakage?
		                    deck_booleans[suit_int+((rank-2)*4)] = true
		                    table.insert(scored_cards, card)
		                end
		            elseif (card.config.center_key == 'm_wild' or card.config.center.any_suit) then
		                table.insert(wilds, card)
		            end
		        end
		        for i, card in ipairs(wilds) do    -- this 100% breaks with custom ranks
		            local rank = card:get_id()
		            for i = 1, 4 do
		                if not array[i+((rank-2)*4)] then
		                    array[i+((rank-2)*4)] = true
		                    break
		                end
		            end
		            table.insert(scored_cards, card)
		        end
		        local entire_fucking_deck = true
		        for i = 1, #deck_booleans do
		            if deck_booleans[i] == false then entire_fucking_deck = false break end
		        end
		        if entire_fucking_deck == true then
		            return {scored_cards}
		        end
		    end
		    return
		end,
}

SMODS.Consumable{
    set = 'Planet',
    key = 'asteroidbelt',
    --! `h_` prefix was removed
    config = { hand_type = 'cry_Bulwark', softlock = true },
    pos = {x = 1, y = 5 },
    atlas = 'atlasnotjokers',
		aurinko = true,
    set_card_type_badge = disc,
    process_loc_text = function(self)
        --use another planet's loc txt instead
        local target_text = G.localization.descriptions[self.set]['c_mercury'].text
        SMODS.Consumable.process_loc_text(self)
        G.localization.descriptions[self.set][self.key].text = target_text
    end,
    generate_ui = 0,
    loc_txt = {
        ['en-us'] = {
            name = 'Asteroid Belt'
        },
	['de'] = {
            name = 'Asteroidengürtel'
        }
    }
}


SMODS.Consumable{
    set = 'Planet',
    key = 'void',
    --! `h_` prefix was removed
    config = { hand_type = 'cry_Clusterfuck', softlock = true },
    pos = {x = 0, y = 5 },
    atlas = 'atlasnotjokers',
		aurinko = true,
    set_card_type_badge = nothingness,
    process_loc_text = function(self)
        --use another planet's loc txt instead
        local target_text = G.localization.descriptions[self.set]['c_mercury'].text
        SMODS.Consumable.process_loc_text(self)
        G.localization.descriptions[self.set][self.key].text = target_text
    end,
    generate_ui = 0,
    loc_txt = {
        ['en-us'] = {
            name = 'Void'
        },
	['en-us'] = {
            name = 'Leere'
	}
    }
}

SMODS.Consumable{
    set = 'Planet',
    key = 'marsmoons',
    --! `h_` prefix was removed
    config = { hand_type = 'cry_UltPair', softlock = true },
    pos = {x = 2, y = 5 },
    atlas = 'atlasnotjokers',
		aurinko = true,
    set_card_type_badge = moons,
    process_loc_text = function(self)
        --use another planet's loc txt instead
        local target_text = G.localization.descriptions[self.set]['c_mercury'].text
        SMODS.Consumable.process_loc_text(self)
        G.localization.descriptions[self.set][self.key].text = target_text
    end,
    generate_ui = 0,
    loc_txt = {
        ['en-us'] = {
            name = 'Phobos & Deimos'
        },
	['de'] = {
            name = 'Phobos & Deimos'
        }
    }
}

SMODS.Consumable{
    set = 'Planet',
    key = 'universe',
    --! `h_` prefix was removed
    config = { hand_type = 'cry_WholeDeck', softlock = true },
    pos = {x = 4, y = 5 },
    atlas = 'atlasnotjokers',
		aurinko = true,
    set_card_type_badge = actualuniverse,
    process_loc_text = function(self)
        --use another planet's loc txt instead
        local target_text = G.localization.descriptions[self.set]['c_mercury'].text
        SMODS.Consumable.process_loc_text(self)
        G.localization.descriptions[self.set][self.key].text = target_text
    end,
    generate_ui = 0,
    loc_txt = {
        ['en-us'] = {
            name = 'The Universe In Its Fucking Entirety'
        }
    }
}

return {
	name = "PokerHands",
  items = { Bulwark, asteroidbelt, Clusterfuck, void, UltPair, marsmoons, WholeDeck, universe },
}
