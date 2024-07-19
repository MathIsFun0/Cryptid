local atlasdeck = {
    object_type = "Atlas",
    key = "atlasdeck",
    path = "atlasdeck.png",
    px = 71,
    py = 95
}
local very_fair = {
    object_type = "Back",
    name = "Very Fair Deck",
    key = "very_fair",
	config = {hands = -2, discards = -2, cry_no_vouchers = true},
	pos = {x = 4, y = 0},
	loc_txt = {
        name = "Very Fair Deck",
        text = {
            "{C:blue}-2{} hands, {C:red}-2{} discards",
            "every round",
            "{C:attention}Vouchers{} no longer",
            "appear in the shop"
        }
    },
    --[[loc_vars = function(self, info_queue, center)
        return {vars = {center.effect.config.hands, center.effect.config.discards}}
    end,--]] --this doesn't work, will fix later
    atlas = "atlasdeck"
}

-- Thanks to many members of the community for contributing to all of these quips!
-- There's too many to credit so just go here: https://discord.com/channels/1116389027176787968/1209506360987877408/1237971471146553406
-- And here: https://discord.com/channels/1116389027176787968/1219749193204371456/1240468252325318667
very_fair_quips = {
    {"L", "NO VOUCHERS", "FOR YOU"},
    {"BOZO", "DID YOU THINK I WOULD", "GIVE YOU A VOUCHER?"},
    {"NOPE!", "NO VOUCHERS HERE!", "(SLUMPAGE EDITION)"},
    {"SKILL ISSUE", "IMAGINE BEING GOOD ENOUGH", "FOR A VOUCHER"},
    {"JIMBO", "FROM MANAGEMENT", "FORGOT TO RESTOCK"},
    {"OOPS!", "NO VOUCHERS", ""},
    {"YOU JOKER,", "WHY ARE YOU LOOKING", "OVER HERE? LOL"},
    {"THE VOUCHER", "IS IN", "ANOTHER CASTLE"},
    {"$0", "BLANK VOUCHER", "(GET IT?)"},
    {"ERROR", "CANNOT DO ARITHMETIC ON A NIL VALUE", "(tier4vouchers.lua)"},
    {"100% OFF", "ON ALL VOUCHERS", "(SOMEONE ALREADY BOUGHT THEM)"},
    {"TRY AGAIN LATER", "HINT: YOU WON'T HAVE", "ENOUGH MONEY ANYWAYS"},
    {"HUH?", "\"VOUCHER\"?", "THAT'S NOT EVEN A WORD..."},
    {"HOLD \"R\"", "TO RESTOCK", "ALL VOUCHERS"},
    {"DID YOU KNOW?", "PRESSING ALT+F4", "GIVES FREE VOUCHERS!"},
    {"SORRY,", "THERE ARE NO VOUCHERS", "DUE TO BUDGET CUTS"},
    {"CALL 1-600-JIMBO", "TO RATE YOUR", "VOUCHER EXPERIENCE"},
    {"DEFEAT", "ANTE 39 BOSS BLIND", "TO RESTOCK"},
    {"MAGIC TRICK", "I MADE THIS VOUCHER", "DISAPPEAR"},
    {"WHY IS A", "VOUCHER LIKE", "A WRITING DESK?"},
    {"WE HAVE RETRACTED", "YOUR VOUCHERS, THEY WOULD BE", "BETTER USED IN OTHER RUNS"},
    {"WHY DO THEY CALL IT VOUCHER", "WHEN MULT OUT THE HOT", "IN COLD EAT EAT THE CHIP"},
    {"SORRY", "THE VOUCHERS ARE EXPERIENCING", "VOUCHIFIA ABORTUS"},
    {"UNFORTUNATELY", "THE VOUCHRX REWRITE UPDATE", "HAS BEEN CANCELLED"},
    {"DEFEAT", "BOSS BLIND", "TO CHANGE NOTHING"},
    {"BIRDS ARE SINGING", "FLOWERS ARE BLOOMING", "KIDS LIKE YOU..."},
    {"WE ARE SORRY TO SAY", "ALL VOUCHERS HAVE BEEN RECALLED", "DUE TO SALMONELLA EXPOSURE"},
    {"VOUCHERS COULDN'T ARRIVE", "DUE TO SHOP LAYOUT BEING", "200% OVERBUDGET"},
    {"YOU LIKE", "BUYING VOUCHERS, DON'T YOU", "YOU'RE A VOUCHERBUYER"},
    {"VOUCHERS", "!E", "VOUCHER POOL"},
    {"THERE", "IS NO", "VOUCHER"},
    {"THERE IS", "NO SANTA", "AND THERE ARE NO VOUCHERS"},
    {"", "VOUCHERN'T", ""},
    {"YOU", "JUST LOST", "THE GAME"},
    {"CAN I OFFER YOU", "A NICE EGG", "IN THESE TRYING TIMES?"},
    {"GO TOUCH GRASS", "INSTEAD OF USING", "THIS DECK"},
    {"YOU COULD BE", "PLAYING ON BLUE DECK", "RIGHT NOW"},
    {"FREE EXOTICS", "GET THEM BEFORE ITS", "TOO LATE (sold out)"},
    {"PROVE THEM WRONG", "BUY BUYING AN INVISIBLE", "VOUCHER FOR $10"},
    {"", "no vouchers?", ""},
    {"see this ad?", "if you are, then it's working", "and you could have it for your own"},
    {"YOU'RE MISSING OUT ON", "AT LEAST 5 VOUCHERS RIGHT NOW", "tonktonktonktonktonk"},
    {"10", "20 NO VOUCHER XD", "30 GOTO 10"},
    {"VOUCHERS", "ARE A PREMIUM FEATURE", "$199.99 JOLLARS TO UNLOCK"},
    {"TRUE VOUCHERLESS!?!?", "ASCENDANT STAKE ONLY", "VERY FAIR DECK"},
    {"ENJOYING YOUR", "VOUCHER EXPERIENCE? GIVE US A", "FIVE STAR RATING ON JESTELP"},
    {"FREE VOUCHERS", "HOT VOUCHERS NEAR YOU", "GET VOUCHERS QUICK WITH THIS ONE TRICK"},
    {"INTRODUCING", "THE VERY FIRST TIER 0 VOUCHER!", "(coming to Cryptid 1.0 soon)"},
    {"A VOUCHER!", "IT'S JUST IMAGINARY", "WE IMAGINED YOU WOULD WANT IT, THAT IS"},
    {"TURN OFF ADBLOCKER", "WITHOUT ADS, WE WOULDN'T", "BE ABLE TO SELL YOU VOUCHERS"},
    {"IF YOU HAVE", "A PROBLEM WITH THIS", "EMAIL IT TO US AT NORESPONSE@JMAIL.COM"},
    {"NOT ENOUGH MONEY", "TO BUY THIS VOUCHER", "SO WHY WOULD WE PUT IT HERE?"},
    {"WANT A VOUCHER?", "WELL SHUT UP", "YOU CAN'T HAVE ANY LOL"},
    {"^$%& NO", "VOUCHERS ^%&% %&$^% FOR", "$%&%%$ %&$&*%$^ YOU"},
    {"A VOUCHER (TRUST)", "|\\/|", "|/\\|"},
    {"... --- ...", ".--. .-.. .- -.-- . .-. -.. . -.-. --- -.. . -.. -- --- .-. ... .", "-.-. --- -.. . - --- ..-. .. -. -.. .- ...- --- ..- -.-. .... . .-."},
    {"RUN > NEW", "STARE AT NOTHING", "FOR AN HOUR OR TWO"},
    {"WE'RE VERY SORRY", "THE LAST GUY PANIC BOUGHT", "ALL THE VOUCHERS"},
    {"HOW IT FEELS", "TO BUY NO", "VOUCHERS"},
    {"JIMBO GOT A NAT 1", "AND DUMPED ALL THE", "VOUCHERS IN A DITCH"},
    {"ATTEMPT TO INDEX", "FIELD 'VOUCHER'", "(A NIL VALUE)"},
    {"OH YOU REALLY THOUGHT THAT READING ALL THESE LINES WOULD BRING YOUR VOUCHERS BACK?", "SORRY TO TELL YOU, BUT THIS DECK DOESN'T CONTAIN THE VOUCHERS YOU SEEK.", "THIS ABNORMALLY LONG TEXT IS HERE AND DESIGNED TO WASTE YOUR TIME AND EFFORT WHILE YOU READ IT."},
    {"GO TO", "https://youtu.be/p7YXXieghto", "FOR FREE VOUCHERS"}
}
very_fair_quip = {}

local equilibrium = {
    object_type = "Back",
    name = "cry-Equilibrium",
    key = "equilibrium",
	config = {vouchers = {'v_overstock_norm','v_overstock_plus'}, cry_equilibrium = true},
	pos = {x = 0, y = 1},
	loc_txt = {
        name = "Deck of Equilibrium",
        text = {
            "All cards have the",
            "{C:attention}same chance{} of",
            "appearing in shops,",
            "start run with",
            "{C:attention,T:v_overstock_plus}Overstock Plus"
        }
    },
    atlas = "atlasdeck"
}
local misprint = {
    object_type = "Back",
    name = "cry-Misprint",
    key = "misprint",
	config = {cry_misprint_min = 0.1, cry_misprint_max = 10},
	pos = {x = 4, y = 2},
	loc_txt = {
        name = "Misprint Deck",
        text = {
            "Values of cards",
            "and poker hands",
            "are {C:attention}randomized"
        }
    },
    atlas = "atlasdeck"
}
local infinite = {
    object_type = "Back",
    name = "cry-Infinite",
    key = "infinite",
	config = {cry_highlight_limit = 1e20, hand_size = 1},
	pos = {x = 3, y = 0},
        atlas = "atlasdeck",
	loc_txt = {
        name = "Infinite Deck",
        text = {
            "You can select {C:attention}any",
            "number of cards",
            "{C:attention}+1{} hand size"
        }
    },
}
local conveyor = {
    object_type = "Back",
    name = "cry-Conveyor",
    key = "conveyor",
    config = {cry_conveyor = true},
    pos = {x = 1, y = 1},
    atlas = "atlasdeck",
    loc_txt = {
        name = "Conveyor Deck",
        text = {
            "Jokers may {C:attention}not{} be moved",
            "At start of round,",
            "{C:attention}duplicate{} rightmost Joker",
            "and {C:attention}destroy{} leftmost Joker"
        }
    }
}
local CCD = {
    object_type = "Back",
    name = "cry-CCD",
    key = "CCD",
    config = {cry_ccd = true},
    pos = {x = 0, y = 0},
    atlas = "atlasdeck",
    loc_txt = {
        name = "CCD Deck",
        text = {
            "Every card is also",
            "a {C:attention}random{} consumable"
        }
    }
}
local wormhole = {
    object_type = "Back",
    name = "cry-Wormhole",
    key = "wormhole",
    config = {cry_wormhole = true, cry_negative_rate = 20, joker_slot = -2},
    pos = {x = 3, y = 4},
    atlas = "atlasdeck",
    loc_txt = {
        name = "Wormhole Deck",
        text = {
            "Start with an {C:cry_exotic}Exotic{C:attention} Joker",
            "Jokers are {C:attention}20X{} more",
            "likely to be {C:dark_edition}Negative",
            "{C:attention}-2{} Joker slots"
        }
    }
}
local redeemed = {
    object_type = "Back",
    name = "cry-Redeemed",
    key = "redeemed",
    config = {cry_redeemed = true},
    pos = {x = 4, y = 4},
    atlas = "atlasdeck",
    loc_txt = {
        name = "Redeemed Deck",
        text = {
            "When a {C:attention}Voucher{} is purchased,",
            "gain its {C:attention}extra tiers"
        }
    }
}
local critical = {
    object_type = "Back",
    name = "cry-Critical",
    key = "critical",
    config = {cry_crit_rate = 0.25, cry_crit_miss_rate = 0.125},
    pos = {x = 5, y = 0},
    atlas = "atlasdeck",
    loc_txt = {
        name = "Critical Deck",
        text = {
            "After each hand played,",
            "{C:green}#1# in 4{} chance for {X:dark_edition,C:white} ^2 {} Mult",
            "{C:green}#1# in 8{} chance for {X:dark_edition,C:white} ^0.5 {} Mult",
        }
    },
    loc_vars = function(self, info_queue, center)
        return {vars = {G.GAME.probabilities.normal or 1}}
    end,
    trigger_effect = function(self, args)
        if args.context == "final_scoring_step" then
            local crit_poll = pseudorandom(pseudoseed("cry_critical"))
            crit_poll = crit_poll / (G.GAME.probabilities.normal or 1)
            if crit_poll < self.config.cry_crit_rate then
                args.mult = args.mult^2
                update_hand_text({delay = 0}, {mult = args.mult, chips = args.chips})
                G.E_MANAGER:add_event(Event({
                    func = (function()
                play_sound("cry_^Mult", 1)
                attention_text({
                    scale = 1.4, text = "Critical Hit!", hold = 2, align = 'cm', offset = {x = 0,y = -2.7},major = G.play
                })
                return true
                end)}))
            elseif crit_poll < self.config.cry_crit_rate + self.config.cry_crit_miss_rate then
                args.mult = args.mult^0.5
                update_hand_text({delay = 0}, {mult = args.mult, chips = args.chips})
                G.E_MANAGER:add_event(Event({
                    func = (function()
                play_sound("timpani", 1)
                attention_text({
                    scale = 1.4, text = "Critical Miss!", hold = 2, align = 'cm', offset = {x = 0,y = -2.7},major = G.play
                })
                return true
                end)}))
            end
            delay(0.6)
            return args.chips, args.mult
        end
    end
}
return {name = "Misc. Decks",
        init = function()
            local Backapply_to_runRef = Back.apply_to_run
            function Back.apply_to_run(self)
                Backapply_to_runRef(self)
                if self.effect.config.cry_no_vouchers then 
                    G.GAME.modifiers.cry_no_vouchers = true
                end
                if self.effect.config.cry_equilibrium then 
                    G.GAME.modifiers.cry_equilibrium = true
                end
                if self.effect.config.cry_conveyor then 
                    G.GAME.modifiers.cry_conveyor = true
                end
                if self.effect.config.cry_misprint_min then
                    G.GAME.modifiers.cry_misprint_min = self.effect.config.cry_misprint_min
                    G.GAME.modifiers.cry_misprint_max = self.effect.config.cry_misprint_max
                end
                if self.effect.config.cry_highlight_limit then
                    G.GAME.modifiers.cry_highlight_limit = self.effect.config.cry_highlight_limit
                end
                if self.effect.config.cry_ccd then
                    G.GAME.modifiers.cry_ccd = true
                end
                if self.effect.config.cry_wormhole then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            if G.jokers then
                                local card = create_card('Joker', G.jokers, nil, "cry_exotic", nil, nil, nil, 'cry_wormhole')
                                card:add_to_deck()
                                card:start_materialize()
                                G.jokers:emplace(card)
                                return true
                            end
                        end
                    }))
                end
                if self.effect.config.cry_negative_rate then
                    G.GAME.modifiers.cry_negative_rate = self.effect.config.cry_negative_rate
                end
                if self.effect.config.cry_redeemed then 
                    G.GAME.modifiers.cry_redeemed = true
                end
            end
            --equilibrium deck patches
            local gcp = get_current_pool
            function get_current_pool(t, r, l, a, override_equilibrium_effect)
                if G.GAME.modifiers.cry_equilibrium and not override_equilibrium_effect and (a == 'sho' or t == 'Voucher' or t == 'Booster') then 
                    if t ~= "Enhanced" and t ~= "Edition" and t ~= "Back" and t ~= "Tag" and t ~= "Seal" and t ~= "Stake" then
                        if not P_CRY_ITEMS then
                            P_CRY_ITEMS = {}
                            local valid_pools = {"Joker", "Consumeables", "Voucher", "Booster"}
                            for _, id in ipairs(valid_pools) do
                                for k, v in pairs(G.P_CENTER_POOLS[id]) do
					if not v.no_doe then
                                    		P_CRY_ITEMS[#P_CRY_ITEMS+1] = v.key
					end
                                end
                            end
                            for k, v in pairs(G.P_CARDS) do
				if not v.no_doe then
                        		P_CRY_ITEMS[#P_CRY_ITEMS+1] = v.key
				end
                            end
                        end
                        return P_CRY_ITEMS, "cry_equilibrium"..G.GAME.round_resets.ante
                    end
                end
                return gcp(t,r,l,a)
            end
            local gp = get_pack
            function get_pack(k, t)
                if G.GAME.modifiers.cry_equilibrium then
                    if not P_CRY_ITEMS then
                        P_CRY_ITEMS = {}
                        local valid_pools = {"Joker", "Consumeables", "Voucher", "Booster"}
                        for _, id in ipairs(valid_pools) do
                            for k, v in pairs(G.P_CENTER_POOLS[id]) do
				if not v.no_doe then
                                    	P_CRY_ITEMS[#P_CRY_ITEMS+1] = v.key
				end
                            end
                        end
                        for k, v in pairs(G.P_CARDS) do
				if not v.no_doe then
                                    	P_CRY_ITEMS[#P_CRY_ITEMS+1] = v.key
				end
                        end
                    end
                    return G.P_CENTERS[pseudorandom_element(P_CRY_ITEMS,pseudoseed('cry_equipackbrium'..G.GAME.round_resets.ante))]
                end
                return gp(k,t)
            end
            --wormhole deck patches
            SMODS.Edition:take_ownership('negative', {
                get_weight = function(self)
                    return self.weight*(G.GAME.modifiers.cry_negative_rate or 1)
                end,
            },true)
            --redeemed deck patches
            local cr = Card.redeem
            function Card:redeem()
                cr(self)
                if G.GAME.modifiers.cry_redeemed then
                    for k, v in pairs(G.P_CENTER_POOLS["Voucher"]) do
                        if v.requires and not G.GAME.used_vouchers[v] then
                            for _, vv in pairs(v.requires) do
                                if vv == self.config.center.key then
                                    --redeem extra voucher code based on Betmma's Vouchers
                                    local area
                                    if G.STATE == G.STATES.HAND_PLAYED then
                                        if not G.redeemed_vouchers_during_hand then
                                            G.redeemed_vouchers_during_hand = CardArea(
                                                G.play.T.x, G.play.T.y, G.play.T.w, G.play.T.h, 
                                                {type = 'play', card_limit = 5})
                                        end
                                        area = G.redeemed_vouchers_during_hand
                                    else
                                        area = G.play
                                    end
                                    local card = create_card('Voucher', area, nil, nil, nil, nil, v.key)
                                    card:start_materialize()
                                    area:emplace(card)
                                    card.cost=0
                                    card.shop_voucher=false
                                    local current_round_voucher=G.GAME.current_round.voucher
                                    card:redeem()
                                    G.GAME.current_round.voucher=current_round_voucher
                                    G.E_MANAGER:add_event(Event({
                                        trigger = 'after',
                                        delay =  0,
                                        func = function() 
                                            card:start_dissolve()
                                            return true
                                        end}))  
                                end
                            end
                        end
                    end
                end
            end
        end,
        items = {atlasdeck, very_fair, equilibrium, misprint, infinite, conveyor, CCD, wormhole, redeemed, critical}}
