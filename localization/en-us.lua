--I couldn't get Meme Packs to work without crashing
--yes somehow that was harder than RNJoker
return {
    descriptions = {
        Back = {
            b_cry_antimatter = {
                name = "Antimatter Deck",
                text = {
                    "Applies the {C:legendary,E:1}upsides{}",
                    "of {C:attention}every{} deck",
                },
            },
            b_cry_beta = {
                name = "Nostalgic Deck",
                text = {
                    "{C:attention}Joker{} and {C:attention}Consumable{}",
                    "slots are {C:attention}combined",
                    "{C:attention}Nostalgic{} Blinds replace",
                    "their updated Blind"
                },
            },
            b_cry_blank = {
                name = "Blank Deck",
                text = {
                    "{C:inactive,E:1}Does nothing?",
                },
            },
            b_cry_CCD = {
                name = "CCD Deck",
                text = {
                    "Every card is also",
                    "a {C:attention}random{} consumable",
                },
            },
            b_cry_conveyor = {
                name = "Conveyor Deck",
                text = {
                    "Jokers may {C:attention}not{} be moved",
                    "At start of round,",
                    "{C:attention}duplicate{} rightmost Joker",
                    "and {C:attention}destroy{} leftmost Joker",
                },
            },
            b_cry_critical = {
                name = "Critical Deck",
                text = {
                    "After each hand played,",
                    "{C:green}#1# in 4{} chance for {X:dark_edition,C:white} ^2 {} Mult",
                    "{C:green}#1# in 8{} chance for {X:dark_edition,C:white} ^0.5 {} Mult",
                },
            },
            b_cry_encoded = {
                name = "Encoded Deck",
                text = {
                    "Start with a {C:cry_code,T:j_cry_CodeJoker}Code Joker{}",
                    "and a {C:cry_code,T:j_cry_copypaste}Copy/Paste{}",
                    "Only {C:cry_code}Code Cards{} appear in shop",
                },
            },
            b_cry_equilibrium = {
                name = "Deck of Equilibrium",
                text = {
                    "All cards have the",
                    "{C:attention}same chance{} of",
                    "appearing in shops,",
                    "start run with",
                    "{C:attention,T:v_overstock_plus}Overstock Plus",
                },
            },
            b_cry_glowing = {
                name = "Glowing Deck",
                text = {
                    "Multiply the values of",
                    "all Jokers by {X:dark_edition,C:white} X1.25 {}",
                    "when Boss Blind is defeated",
                    "{X:cry_jolly,C:white,s:0.8} Jolly#1#Open#1#Winner#1#-#1#wawa#1#person", --peak loc_vars right here
                },
            },
            b_cry_infinite = {
                name = "Infinite Deck",
                text = {
                    "You can select {C:attention}any",
                    "number of cards",
                    "{C:attention}+1{} hand size",
                },
            },
            b_cry_misprint = {
                name = "Misprint Deck",
                text = {
                    "Values of cards",
                    "and poker hands",
                    "are {C:attention}randomized",
                },
            },
            b_cry_redeemed = {
                name = "Redeemed Deck",
                text = {
                    "When a {C:attention}Voucher{} is purchased,",
                    "gain its {C:attention}extra tiers",
                },
            },
            b_cry_spooky = {
                name = "Spooky Deck",
                text = {
                    "Start with an {C:eternal}Eternal{} {C:attention,T:j_cry_chocolate_dice}Chocolate Die",
                    "After each {C:attention}Ante{}, create a",
                    "{C:cry_candy}Candy{} or {X:cry_cursed,C:white}Cursed{} Joker",
                }
            },
            b_cry_very_fair = {
                name = "Very Fair Deck",
                text = {
                    "{C:blue}-2{} hands, {C:red}-2{} discards",
                    "every round",
                    "{C:attention}Vouchers{} no longer",
                    "appear in the shop",
                },
            },
            b_cry_wormhole = {
                name = "Wormhole Deck",
                text = {
                    "Start with an {C:cry_exotic}Exotic{C:attention} Joker",
                    "Jokers are {C:attention}20X{} more",
                    "likely to be {C:dark_edition}Negative",
                    "{C:attention}-2{} Joker slots",
                },
            },
            b_cry_legendary = {
                name = "Legendary Deck",
                text = {
                    "Start with a {C:legendary}Legendary{C:legendary} Joker",
                    "{C:green}1 in 5{} chance to create another",
					"when Boss Blind is defeated {C:inactive}(must have room){}",
                },
            },
        },
        Blind = {
            bl_cry_box = {
                name = "The Box",
                text = {
                    "All Common Jokers",
                    "are debuffed",
                },
            },
            bl_cry_clock = {
                name = "The Clock",
                text = {
                    "+0.1X blind requirements every",
                    "3 seconds spent this ante",
                },
            },
            bl_cry_hammer = {
                name = "The Hammer",
                text = {
                    "All cards with odd",
                    "rank are debuffed",
                },
            },
            bl_cry_joke = {
                name = "The Joke",
                text = {
                    "If score is >2X requirements,",
                    "set ante to multiple of #1#",
                },
            },
            bl_cry_magic = {
                name = "The Magic",
                text = {
                    "All cards with even",
                    "rank are debuffed",
                },
            },
            bl_cry_lavender_loop = {
                name = "Lavender Loop",
                text = {
                    "1.25X blind requirements every",
                    "1.5 seconds spent this round",
                },
            },
            bl_cry_obsidian_orb = {
                name = "Obsidian Orb",
                text = {
                    "Applies abilities of",
                    "all defeated bosses",
                },
            },
            bl_cry_oldarm = {
                name = "Nostalgic Arm",
                text = {
                    "Must play 4",
                    "or fewer cards",
                },
            },
            bl_cry_oldfish = {
                name = "Nostalgic Fish",
                text = {
                    "All hands start",
                    "with 1 Mult",
                },
            },
            bl_cry_oldflint = {
                name = "Nostalgic Flint",
                text = {
                    "No Flushes",
                },
            },
            bl_cry_oldhouse = {
                name = "Nostalgic House",
                text = {
                    "No Full Houses",
                },
            },
            bl_cry_oldmanacle = {
                name = "Nostalgic Manacle",
                text = {
                    "Divide Mult by discards",
                },
            },
            bl_cry_oldmark = {
                name = "Nostalgic Mark",
                text = {
                    "No hands that",
                    "contain a Pair",
                },
            },
            bl_cry_oldox = {
                name = "Nostalgic Ox",
                text = {
                    "All hands start",
                    "with 0 Chips",
                },
            },
            bl_cry_oldpillar = {
                name = "Nostalgic Pillar",
                text = {
                    "No Straights",
                },
            },
            bl_cry_oldserpent = {
                name = "Nostalgic Serpent",
                text = {
                    "Divide Mult by level",
                    "of played poker hand",
                },
            },
            bl_cry_pin = {
                name = "The Pin",
                text = {
                    "Jokers with Epic or higher",
                    "rarity are debuffed",
                },
            },
            bl_cry_pinkbow = {
                name = "Pink Bow",
                text = {
                    "Randomize rank of cards",
                    "held in hand on play",
                },
            },
            bl_cry_sapphire_stamp = {
                name = "Sapphire Stamp",
                text = {
                    "Select an extra card, deselect",
                    "random card before scoring",
                },
            },
            bl_cry_shackle = {
                name = "The Shackle",
                text = {
                    "All Negative Jokers",
                    "are debuffed",
                },
            },
            bl_cry_striker = {
                name = "The Striker",
                text = {
                    "All Rare Jokers",
                    "are debuffed",
                },
            },
            bl_cry_tax = {
                name = "The Tax",
                text = {
                    "Score per hand capped at",
                    "0.4X blind requirements",
                },
            },
            bl_cry_tornado = {
                name = "Turquoise Tornado",
                text = {
                    "#1# in #2# chance for",
                    "played hand to not score",
                },
            },
            bl_cry_trick = {
                name = "The Trick",
                text = {
                    "After each hand, flip all",
                    "face-up cards held in hand",
                },
            },
            bl_cry_vermillion_virus = {
                name = "Vermillion Virus",
                text = {
                    "One random Joker",
                    "replaced every hand",
                },
            },
            bl_cry_windmill = {
                name = "The Windmill",
                text = {
                    "All Uncommon Jokers",
                    "are debuffed",
                },
            },
        },
        Code = {
            c_cry_class = {
                name = "://CLASS",
                text = {
                    "Convert {C:cry_code}#1#{} selected card",
                    "to a {C:cry_code}chosen{} enhancement",
                },
            },
            c_cry_commit = {
                name = "://COMMIT",
                text = {
                    "Destroy a {C:cry_code}selected{} Joker,",
                    "create a {C:cry_code}new{} Joker",
                    "of the {C:cry_code}same rarity",
                },
            },
            c_cry_crash = {
                name = "://CRASH",
                text = {
                    "{C:cry_code,E:1}Don't.",
                },
            },
            c_cry_delete = {
                name = "://DELETE",
                text = {
                    "{C:cry_code}Permanently{} remove a",
                    "{C:cry_code}selected{} shop item",
                    "{C:inactive,s:0.8}Item cannot appear again this run",
                },
            },
            c_cry_divide = {
                name = "://DIVIDE",
                text = {
                    "{C:cry_code}Halve{} all listed prices",
                    "in current shop",
                },
            },
            c_cry_exploit = {
                name = "://EXPLOIT",
                text = {
                    "The {C:cry_code}next{} hand played",
                    "is calculated as a",
                    "{C:cry_code}chosen{} poker hand",
                    "{C:inactive,s:0.8}Secret hands must be",
                    "{C:inactive,s:0.8}discovered to be valid",
                },
            },
            c_cry_hook = {
                name = "HOOK://",
                text = {
                    "Select two Jokers to become {C:cry_code}Hooked",
                    "{C:inactive,s:0.8}Only works properly if Jokers trigger in the same context,",
                    "{C:inactive,s:0.8}such as Joker and The Duo (both post-scoring)",
                },
            },
            c_cry_machinecode = {
                name = "://MACHINECODE",
                text = {
                    "",
                },
            },
            c_cry_malware = {
                name = "://MALWARE",
                text = { "Add {C:dark_edition}Glitched{} to all", "cards {C:cry_code}held in hand" },
            },
            c_cry_merge = {
                name = "://MERGE",
                text = {
                    "Merge a selected {C:cry_code}consumable",
                    "with a selected {C:cry_code}playing card",
                },
            },
            c_cry_multiply = {
                name = "://MULTIPLY",
                text = {
                    "{C:cry_code}Double{} all values of",
                    "a selected {C:cry_code}Joker{} until",
                    "end of round",
                },
            },
            c_cry_payload = {
                name = "://PAYLOAD",
                text = {
                    "Next defeated Blind",
                    "gives {C:cry_code}X#1#{} interest",
                },
            },
            c_cry_oboe = {
                name = "://OFFBYONE",
                text = {
                    "Next {C:cry_code}Booster Pack{} has",
                    "{C:cry_code}#1#{} extra card and",
                    "{C:cry_code}#1#{} extra choice",
                    "{C:inactive}(Currently {C:cry_code}+#2#{C:inactive})",
                },
            },
            c_cry_reboot = {
                name = "://REBOOT",
                text = {
                    "Replenish {C:blue}Hands{} and {C:red}Discards{},",
                    "return {C:cry_code}all{} cards to deck",
                    "and draw a {C:cry_code}new{} hand",
                },
            },
            c_cry_revert = {
                name = "://REVERT",
                text = {
                    "Set {C:cry_code}game state{} to",
                    "start of {C:cry_code}this Ante{}",
                },
            },
            c_cry_rework = {
                name = "://REWORK",
                text = {
                    "Destroy a {C:cry_code}selected{} Joker,",
                    "create a {C:cry_code}Rework Tag{} with",
                    "an {C:cry_code}upgraded{} edition",
                    "{C:inactive,s:0.8}Upgrades using order in the Collection",
                },
            },
            c_cry_run = {
                name = "://RUN",
                text = {
                    "Visit a {C:cry_code}shop",
                    "during a {C:cry_code}Blind",
                },
            },
            c_cry_seed = {
                name = "://SEED",
                text = {
                    "Select a Joker",
                    "or playing card",
                    "to become {C:cry_code}Rigged",
                },
            },
            c_cry_semicolon = {
                name = ";//",
                text = { "Ends current non-Boss {C:cry_code}Blind{}", "{C:cry_code}without{} cashing out" },
            },
            c_cry_spaghetti = {
                name = "://SPAGHETTI",
                text = {
                    "Create a {C:cry_code}Glitched",
                    "Food Joker",
                },
            },
            c_cry_variable = {
                name = "://VARIABLE",
                text = {
                    "Convert {C:cry_code}#1#{} selected cards",
                    "to a {C:cry_code}chosen{} rank",
                },
            },
        },
        Edition = {
            e_cry_astral = {
                name = "Astral",
                text = {
                    "{X:dark_edition,C:white}^#1#{} Mult",
                },
            },
            e_cry_blur = {
                name = "Blurred",
                text = {
                    "{C:attention}Retrigger{} this",
                    "card {C:attention}1{} time",
                    "{C:green}#1# in #2#{} chance",
                    "to retrigger {C:attention}#3#{}",
                    "additional time",
                },
            },
            e_cry_double_sided = {
                name = "Double-Sided",
                text = {
                    "This card can be",
                    "{C:attention}flipped{} to reveal",
                    "a different card",
                    "{C:inactive}(Blank side can be merged",
					"{C:inactive}with another card)",
                },
            },
            e_cry_glass = {
                name = "Fragile",
                label = "Fragile",
                text = {
                    "{C:white,X:mult} X#3# {} Mult",
                    "{C:green}#1# in #2#{} chance this",
                    "card isn't {C:red}destroyed",
                    "when triggered",
                },
            },
            e_cry_glitched = {
                name = "Glitched",
                text = {
                    "All values on this card",
                    "are {C:dark_edition}randomized{}",
                    "between {C:attention}X0.1{} and {C:attention}X10{}",
                    "{C:inactive}(If possible){}",
                },
            },
            e_cry_gold = {
                name = "Golden",
                label = "Golden",
                text = {
                    "Earn {C:money}$#1#{} when used",
                    "or triggered",
                },
            },
            e_cry_m = {
                name = "Jolly",
                text = {
                    "{C:mult}+#1#{} Mult",
                    "This card is feeling",
                    "rather {C:attention}jolly{}",
                },
            },
            e_cry_mosaic = {
                name = "Mosaic",
                text = {
                    "{X:chips,C:white} X#1# {} Chips",
                },
            },
            e_cry_noisy = {
                name = "Noisy",
                text = {
                    "???",
                },
            },
            e_cry_oversat = {
                name = "Oversaturated",
                text = {
                    "All values",
                    "on this card",
                    "are {C:attention}doubled{}",
                    "{C:inactive}(If possible)",
                },
            },
        },
        Enhanced = {
            m_cry_echo = {
                name = "Echo Card",
                text = {
                    "{C:green}#2# in #3#{} chance to",
                    "{C:attention}retrigger{} #1# additional",
                    "times when scored",
                },
            },
        },
        Joker = {
            j_cry_adroit = {
                name = "Adroit Joker",
                text = {
                    "{C:chips}+#1#{} Chips if played",
                    "hand contains",
                    "a {C:attention}#2#"
                }
            },
            j_cry_altgoogol = {
                name = "Nostalgic Googol Play Card",
                text = {
                    "Sell this card to create",
                    "{C:attention}2{} copies of the leftmost {C:attention}Joker{}",
                    "{C:inactive,s:0.8}Does not copy Nostalgic Googol Play Cards{}",
                },
            },
            j_cry_antennastoheaven = {
                name = "...Like Antennas to Heaven",
                text = {
                    "This Joker gains",
                    "{X:chips,C:white} X#1# {} Chips when each",
                    "played {C:attention}7{} or {C:attention}4{} is scored",
                    "{C:inactive}(Currently {X:chips,C:white}X#2# {C:inactive} Chips)",
                },
            },
            j_cry_apjoker = {
                name = "AP Joker",
                text = { "{X:mult,C:white} X#1# {} Mult against {C:attention}Boss Blinds{}" },
            },
            j_cry_big_cube = {
                name = "Big Cube",
                text = {
                    "{X:chips,C:white} X#1# {} Chips",
                },
            },
            j_cry_biggestm = {
                name = "Huge",
                text = {
                    "{X:mult,C:white} X#1# {} Mult until end",
                    "of round if {C:attention}poker hand{}",
                    "is a {C:attention}#2#{}",
                    "{C:inactive}(Currently {C:attention}#3#{}{C:inactive}){}",
                    "{C:inactive,s:0.8}not fat, just big boned.",
                },
            },
            j_cry_blacklist = {
                name = "Blacklist",
                text = {
                    "If a {C:attention}#1#{} is held in hand or played,",
                    "set {C:chips}Chips{} and {C:mult}Mult{} to 0",
                    "{C:red,E:2}self destructs{} if no {C:attention}#1#{} in deck",
                    "{C:inactive,s:0.8}Rank does not change"
                }
            },
            j_cry_blender = {
                name = "Blender",
                text = {
                    "Create a {C:attention}random{}",
                    "consumable when a",
                    "{C:cry_code}Code{} card is used",
                    "{C:inactive}(Must have room){}",
                },
            },
            j_cry_blurred = {
                name = "Blurred Joker",
                text = {
                    "Gain {C:blue}+#1#{} hand(s) when",
                    "{C:attention}Blind{} is selected",
                },
            },
            j_cry_bonk = {
                name = "Bonk",
                text = {
                    "Each {C:attention}Joker{} gives {C:chips}+#1#{} Chips",
                    "Increase amount by {C:chips}+#2#{} if",
                    "{C:attention} poker hand{} is a {C:attention}#3#{}",
                    "{C:inactive,s:0.8}Jolly Jokers give{} {C:chips,s:0.8}+#4#{} {C:inactive,s:0.8}Chips instead{}",
                },
            },
            j_cry_bonkers = {
                name = "Bonkers Joker",
                text = {
                    "{C:red}+#1#{} Mult if played",
                    "hand contains",
                    "a {C:attention}#2#"
                }
            },
            j_cry_bonusjoker = {
                name = "Bonus Joker",
                text = {
                    "{C:green}#1# in #2#{} chance for each",
                    "played {C:attention}Bonus{} card to increase",
                    "{C:attention}Joker{} or {C:attention}Consumable slots",
                    "by {C:dark_edition}1{} when scored",
                    "{C:red}Works twice per round",
                    "{C:inactive,s:0.8}(Equal chance for each){}",
                },
            },
            j_cry_booster = {
                name = "Booster Joker",
                text = {
                    "{C:attention}+#1#{} Booster Pack slot",
                    "available in shop",
                },
            },
            j_cry_boredom = {
                name = "Boredom",
                text = {
                    "{C:green}#1# in #2#{} chance to",
                    "{C:attention}retrigger{} each {C:attention}Joker{}",
                    "or {C:attention}played card{}",
                    "{C:inactive,s:0.8}Does not affect other Boredom{}",
                },
            },
            j_cry_brittle = {
                name = "Brittle Candy",
                text = {
                    "For the next {C:attention}#1#{} hands,",
                    "add {C:attention}Stone{}, {C:attention}Gold{}, or {C:attention}Steel{} to",
                    "the rightmost scoring card"
                }
            },
            j_cry_bubblem = {
                name = "Bubble M",
                text = {
                    "Create a {C:dark_edition}Foil {C:attention}Jolly Joker{}",
                    "if played hand contains",
                    "a {C:attention}#1#{}",
                    "{C:red,E:2}self destructs{}",
                },
            },
            j_cry_busdriver = {
                name = "Bus Driver",
                text = {
                    "{C:green}#1# in #3#{} chance",
                    "for {C:mult}+#2#{} Mult",
                    "{C:green}1 in 4{} chance",
                    "for {C:mult}-#2#{} Mult",
                },
            },
            j_cry_candy_basket = {
                name = "Candy Basket",
                text = {
                    "Sell this card to create {C:attention}#1#{} {C:cry_candy}Candies",
                    "{C:attention}+#2#{} {C:cry_candy}Candy{} every {C:attention}2{} Blinds defeated",
                    "{C:attention}+#3#{} {C:cry_candy}Candies{} when {C:attention}Boss Blind{} defeated"
                }
            },
            j_cry_candy_buttons = {
                name = "Candy Buttons",
                text = {
                    "The next {C:attention}#1#{} rerolls",
                    "cost {C:money}$1{}",
                }
            },
            j_cry_candy_cane = {
                name = "Candy Cane",
                text = {
                    "For the next {C:attention}#1#{} rounds,",
                    "playing cards give {C:money}$#2#",
                    "when {C:attention}retriggered"
                }
            },
            j_cry_candy_dagger = {
                name = "Candy Dagger",
                text = {
                    "When {C:attention}Blind{} is selected,",
                    "destroy Joker to the right",
                    "to create a {C:cry_candy}Candy{}",
                }
            },
            j_cry_canvas = {
                name = "Canvas",
                text = {
                    "{C:attention}Retrigger{} all {C:attention}Jokers{} to the left",
                    "once for {C:attention}every{} non-{C:blue}Common{C:attention} Joker{}",
                    "to the right of this Joker",
                },
            },
            j_cry_caramel = {
                name = "Caramel",
                text = {
                    "Each played card gives",
                    "{X:mult,C:white}X#1#{} Mult when scored",
                    "for the next {C:attention}#2#{} rounds",
                },
            },
            j_cry_chad = {
                name = "Chad",
                text = {
                    "Retrigger {C:attention}leftmost{} Joker",
                    "{C:attention}#1#{} additional time(s)",
                },
            },
            j_cry_chili_pepper = {
                name = "Chili Pepper",
                text = {
                    "This Joker gains {X:mult,C:white} X#2# {} Mult",
                    "at end of round,",
                    "{C:red,E:2}self destructs{} after {C:attention}#3#{} rounds",
                    "{C:inactive}(Currently{} {X:mult,C:white} X#1# {} {C:inactive}Mult){}",
                },
            },
            j_cry_chocolate_dice = {
                name = "Chocolate Die",
                text = {
                    "Roll a {C:green}d10{} when",
                    "{C:attention}Boss Blind{} defeated",
                    "to start an {C:cry_ascendant,E:1}event",
                    "{C:inactive}(Currently: #1#)"
                },
            },
            j_cry_circulus_pistoris = {
                name = "Circulus Pistoris",
                text = {
                    "{X:dark_edition,C:white}^#1#{} Chips and {X:dark_edition,C:white}^#1#{} Mult",
                    "if {C:attention}exactly{} #2#",
                    "hands remaining",
                },
            },
            j_cry_circus = {
                name = "Circus",
                text = {
                    "{C:red}Rare{} Jokers each give {X:mult,C:white} X#1# {} Mult",
                    "{C:cry_epic}Epic{} Jokers each give {X:mult,C:white} X#2# {} Mult",
                    "{C:legendary}Legendary{} Jokers each give {X:mult,C:white} X#3# {} Mult",
                    "{C:cry_exotic}Exotic{} Jokers each give {X:mult,C:white} X#4# {} Mult",
                },
            },
            j_cry_clash = {
                name = "The Clash",
                text = {
                    "{X:mult,C:white} X#1# {} Mult if played",
                    "hand contains",
                    "an {C:attention}#2#",
                },
            },
            j_cry_CodeJoker = {
                name = "Code Joker",
                text = {
                    "Create a {C:dark_edition}Negative{}",
                    "{C:cry_code}Code Card{} when",
                    "{C:attention}Blind{} is selected",
                },
            },
            j_cry_coin = {
                name = "Crypto Coin",
                text = {
                    "Earn between",
                    "{C:money}$#1#{} and {C:money}$#2#{} for",
                    "each Joker {C:attention}sold{}",
                },
            },
            j_cry_compound_interest = {
                name = "Compound Interest",
                text = {
                    "Earn {C:money}#1#%{} of total money",
                    "at end of round,",
                    "increases by {C:money}#2#%{} per",
                    "consecutive payout",
                },
            },
            j_cry_copypaste = {
                name = "Copy/Paste",
                text = {
                    "When a {C:cry_code}Code{} card is used,",
                    "{C:green}#1# in #2#{} chance to add a copy",
                    "to your consumable area",
                    "{C:inactive}(Must have room)",
                },
            },
            j_cry_cotton_candy = {
                name = "Cotton Candy",
                text = {
                    "When sold, adjacent",
                    "{C:attention}Jokers{} become {C:dark_edition}Negative{}"
                },
            },
            j_cry_crustulum = {
                name = "Crustulum",
                text = {
                    "This Joker gains {C:chips}+#2#{} Chips",
                    "per {C:attention}reroll{} in the shop",
                    "{C:green}All rerolls are free{}",
                    "{C:inactive}(Currently {C:chips}+#1#{C:inactive} chips)",
                },
            },
            j_cry_cryptidmoment = {
                name = "M Chain",
                text = {
                    "Sell this card to",
                    "add {C:money}$#1#{} of {C:attention}sell value{}",
                    "to every {C:attention}Joker{} card",
                },
            },
            j_cry_cube = {
                name = "Cube",
                text = {
                    "{C:chips}+#1#{} Chips",
                },
            },
            j_cry_curse_sob = {
                name = "Sob",
                text = {
                    "{C:edition,E:1}you cannot{} {C:cry_ascendant,E:1}run...{}",
                    "{C:edition,E:1}you cannot{} {C:cry_ascendant,E:1}hide...{}",
                    "{C:dark_edition,E:1}you cannot escape...{}",
                    "{C:inactive}(Must have room){}",
                },
            },
            j_cry_cursor = {
                name = "Cursor",
                text = {
                    "This Joker gains {C:chips}+#2#{} Chips",
                    "for each card {C:attention}purchased{}",
                    "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)",
                },
            },
            j_cry_cut = {
                name = "Cut",
                text = {
                    "This Joker destroys",
                    "a random {C:cry_code}Code{} card",
                    "and gains {X:mult,C:white} X#1# {} Mult",
                    "at the end of the {C:attention}shop{}",
                    "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)",
                },
            },
            j_cry_delirious = {
                name = "Delirious Joker",
                text = {
                    "{C:red}+#1#{} Mult if played",
                    "hand contains",
                    "a {C:attention}#2#"
                }
            },
            j_cry_discreet = {
                name = "Discreet Joker",
                text = {
                    "{C:chips}+#1#{} Chips if played",
                    "hand contains",
                    "a {C:attention}#2#"
                }
            },
            j_cry_doodlem = {
                name = "Doodle M",
                text = {
                    "Create 2 {C:dark_edition}Negative{} {C:attention}consumables{}",
                    "when {C:attention}Blind{} is selected",
                    "Create 1 more {C:attention}consumable",
                    "for each {C:attention}Jolly Joker{}",
                },
            },
            ["j_cry_Double Scale"] = {
                name = "Double Scale",
                text = {
                    "Scaling {C:attention}Jokers{}",
                    "scale {C:attention}quadratically",
                    "{C:inactive,s:0.8}(ex. +1, +3, +6, +10)",
                    "{C:inactive,s:0.8}(grows by +1, +2, +3)",
                },
            },
            j_cry_dropshot = {
                name = "Dropshot",
                text = {
                    "This Joker gains {X:mult,C:white} X#1# {} Mult for",
                    "each played, {C:attention}nonscoring{} {V:1}#2#{} card,",
                    "suit changes every round",
                    "{C:inactive}(Currently {X:mult,C:white} X#3# {C:inactive} Mult)",
                },
            },
            j_cry_dubious = {
                name = "Dubious Joker",
                text = {
                    "{C:chips}+#1#{} Chips if played",
                    "hand contains",
                    "a {C:attention}#2#"
                }
            },
            j_cry_duos = {
                name = "The Duos",
                text = {
                    "{X:mult,C:white} X#1# {} Mult if played",
                    "hand contains",
                    "a {C:attention}#2#",
                },
            },
            j_cry_duplicare = {
                name = 'Duplicare',
                text = {
                    "This Joker gains {X:mult,C:white} X#2# {} Mult",
                    "when a {C:attention}Joker{} or",
                    "playing card is scored",
                    "{C:inactive}(Currently {X:mult,C:white} X#1# {C:inactive} Mult)",
                }
            },
            j_cry_effarcire = {
                name = "Effarcire",
                text = {
                    "Draw {C:green}full deck{} to hand",
                    "when {C:attention}Blind{} is selected",
                    "{C:inactive,s:0.8}\"If you can't handle me at my 1x,",
                    "{C:inactive,s:0.8}you don't deserve me at my 2x\"",
                },
            },
            j_cry_energia = {
                name = "Energia",
                text = {
                    "When a {C:attention}Tag{} is acquired,",
                    "create {C:attention}#1#{} copies of it",
                    "and {C:attention}increase{} the number of",
                    "copies by {C:attention}#2#",
                },
            },
            j_cry_equilib = {
                name = "Ace Aequilibrium",
                text = {
                    "Jokers appear using the",
                    "order from the {C:attention}Collection{}",
                    "Create {C:attention}#1#{} {C:dark_edition}Negative{} Joker(s)",
                    "when hand is played",
                    "{C:cry_exotic,s:0.8}Exotic {C:inactive,s:0.8}or better Jokers cannot appear",
                    "{s:0.8}Last Joker Generated: {C:attention,s:0.8}#2#",
                },
            },
            j_cry_error = {
                name = "{C:red}ERR{}{C:dark_edition}O{}{C:red}R{}",
                text = {
                    "",
                },
            },
            j_cry_eternalflame = {
                name = "Eternal Flame",
                text = {
                    "This Joker gains {X:mult,C:white} X#1# {} Mult",
                    "for each card {C:attention}sold{}",
                    "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)",
                },
            },
            j_cry_exoplanet = {
                name = "Exoplanet",
                text = {
                    "{C:dark_edition}Holographic{} cards",
                    "each give {C:mult}+#1#{} Mult",
                },
            },
            j_cry_exponentia = {
                name = "Exponentia",
                text = {
                    "This Joker gains {X:dark_edition,C:white} ^#1# {} Mult",
                    "when {X:red,C:white} XMult {} is triggered",
                    "{C:inactive}(Currently {X:dark_edition,C:white} ^#2# {C:inactive} Mult)",
                },
            },
            j_cry_facile = {
                name = "Facile",
                text = {
                    "{X:dark_edition,C:white}^#1#{} Mult if",
                    "played cards are scored",
                    "{C:attention}#2#{} or fewer times",
                },
            },
            j_cry_filler = {
                name = "The Filler",
                text = {
                    "{X:mult,C:white} X#1# {} Mult if played",
                    "hand contains",
                    "a {C:attention}#2#",
                },
            },
            j_cry_fractal = {
                name = "Fractal Fingers",
                text = {
                    "{C:attention}+#1#{} card selection limit",
                },
            },
            j_cry_flip_side = {
                name = "On the Flip Side",
                text = {
                    "{C:dark_edition}Double-Sided{} Jokers use",
                    "their back side for effects",
                    "instead of the front side",
                    "{C:attention}Retrigger{} all {C:dark_edition}Double-Sided{} Jokers"
                },
            },
            j_cry_foodm = {
                name = "Fast Food M",
                text = {
                    "{C:mult}+#1#{} Mult",
                    "{C:red,E:2}self destructs{} in {C:attention}#2#{} round(s)",
                    "Increases by {C:attention}#3#{} round when",
                    "{C:attention}Jolly Joker{} is {C:attention}sold{}",
                    "{C:inactive,s:0.8}2 McDoubles, 2 McChickens{}",
                    "{C:inactive,s:0.8}Large Fries, 20 Piece & Large Cake{}",
                },
            },
            j_cry_foolhardy = {
                name = "Foolhardy Joker",
                text = {
                    "{C:red}+#1#{} Mult if played",
                    "hand contains",
                    "an {C:attention}#2#"
                }
            },
	    j_cry_formidiulosus = {
		    name = "Formidiulosus",
		    text = {
		    	"When a {X:cry_cursed,C:white}Cursed{} Joker is obtained, destroy it",
			"Creates {C:attention}#1#{} {C:dark_edition}Negative {C:cry_candy}Candies{} at end of shop",
			"Gains {X:dark_edition,C:white}^#2#{} Mult for each {C:cry_candy}Candy{} in possession",
			"{C:inactive}(Currently {X:dark_edition,C:white}^#3#{C:inactive} Mult)",
		    },
	    },
            j_cry_foxy = {
                name = "Foxy Joker",
                text = {
                    "{C:chips}+#1#{} Chips if played",
                    "hand contains",
                    "a {C:attention}#2#"
                }
            },
            j_cry_fspinner = {
                name = "Fidget Spinner",
                text = {
                    "This Joker gains {C:chips}+#2#{} Chips",
                    "if hand played is {C:attention}not{}",
                    "most played {C:attention}poker hand{}",
                    "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)",
                },
            },
            j_cry_fuckedup = {
                name = "Fucked-Up Joker",
                text = {
                    "{C:red}+#1#{} Mult if played",
                    "hand contains",
                    "a {C:attention}#2#"
                }
            },
            j_cry_gardenfork = {
                name = "Garden of Forking Paths",
                text = {
                    "Earn {C:money}$#1#{} if {C:attention}played hand{}",
                    "contains an {C:attention}Ace{} and a {C:attention}7{}",
                },
            },
            j_cry_gemino = {
                name = "Gemini",
                text = {
                    "{C:attention}Double{} all values",
                    "of leftmost {C:attention}Joker",
                    "at end of round",
                },
            },
            j_cry_ghost = {
                name = "Ghost",
                text = {
                    "At end of round:",
                    "{C:green}#1# in #2#{} chance to",
                    "{C:attention}possess{} a random {C:attention}Joker",
                    "{C:green}#1# in #3#{} chance to",
                    "{E:2,C:red}self destruct"
                }
            },
            j_cry_giggly = {
                name = "Absurd Joker",
                text = {
                    "{C:red}+#1#{} Mult if played",
                    "hand contains",
                    "a {C:attention}#2#"
                }
            },
            j_cry_goldjoker = {
                name = "Gold Joker",
                text = {
                    "Earn {C:money}#1#%{} of total",
                    "money at end of round",
                    "Payout increases by {C:money}#2#%{}",
                    "when each played {C:attention}Gold{}",
                    "card is scored",
                },
            },
            j_cry_googol_play = {
                name = "Googol Play Card",
                text = {
                    "{C:green}#1# in #2#{} chance for",
                    "{X:red,C:white} X#3# {} Mult",
                },
            },
            j_cry_happy = {
                name = ":D",
                text = {
                    "Create a random {C:attention}Joker{}",
                    "at end of round",
                    "Sell this card to",
                    "create a random {C:attention}Joker{}",
                    "{C:inactive}(Must have room){}",
                },
            },
            j_cry_happyhouse = {
                name = "Happy House",
                text = {
                    "{X:dark_edition,C:white}^#1#{} Mult only after",
                    "playing {C:attention}114{} hands{}",
                    "{C:inactive}(Currently #2#/114){}",
                    "{C:inactive,s:0.8}There is no place like home!{}",
                },
            },
            j_cry_home = {
                name = "The Home",
                text = {
                    "{X:mult,C:white} X#1# {} Mult if played",
                    "hand contains",
                    "a {C:attention}#2#",
                },
            },
            j_cry_hunger = {
                name = "Consume-able",
                text = {
                    "Earn {C:money}$#1#{} when",
                    "using a {C:attention}consumable{}",
                },
            },
            j_cry_iterum = {
                name = "Iterum",
                text = {
                    "Retrigger all cards played",
                    "{C:attention}#2#{} time(s),",
                    "each played card gives",
                    "{X:mult,C:white} X#1# {} Mult when scored",
                },
            },
            j_cry_jawbreaker = {
                name = "Jawbreaker",
                text = {
                    "When {C:attention}Boss Blind{} defeated,",
                    "{C:attention}double{} values of all Jokers",
                    "{E:2,C:red}self destructs{}",
                }
            },
            j_cry_jimball = {
                name = "Jimball",
                text = {
                    "This Joker gains {X:mult,C:white} X#1# {} Mult",
                    "per {C:attention}consecutive{} hand played",
                    "while playing your",
                    "most played {C:attention}poker hand",
                    "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)",
                },
            },
            j_cry_jollysus = {
                name = "Jolly Joker?",
                text = {
                    "Create a {C:dark_edition}Jolly{} Joker",
                    "when a Joker is {C:attention}sold{}",
                    "{C:red}Works once per round{}",
                    "{C:inactive}#1#{}",
                    "{C:inactive,s:0.8}Seems legit...{}",
                },
            },
            j_cry_kidnap = {
                name = "Kidnapping",
                text = {
                    "Earn {C:money}$#2#{} at end of round",
                    "Increase payout by {C:money}$#1#{}",
                    "when a {C:attention}Type Mult{} or",
                    "{C:attention}Type Chips{} Joker is sold",
                },
            },
            j_cry_kooky = {
                name = "Kooky Joker",
                text = {
                    "{C:red}+#1#{} Mult if played",
                    "hand contains",
                    "a {C:attention}#2#"
                }
            },
            j_cry_krustytheclown = {
                name = "Krusty the Clown",
                text = {
                    "This Joker gains",
                    "{X:mult,C:white} X#1# {} Mult when",
                    "each played {C:attention}card{} is scored",
                    "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)",
                },
            },
            j_cry_kscope = {
                name = "Kaleidoscope",
                text = {
                    "Add {C:dark_edition}Polychrome{} to",
                    "a random {C:attention}Joker{} when",
                    "{C:attention}Boss Blind{} is defeated",
                },
            },
            j_cry_lightupthenight = {
                name = "Light Up the Night",
                text = {
                    "Each played {C:attention}7{} or {C:attention}2{}",
                    "gives {X:mult,C:white}X#1#{} Mult when scored",
                },
            },
            j_cry_longboi = {
                name = "Monster",
                text = {
                    "Give future copies of",
                    "this Joker {X:mult,C:white}X#1#{} Mult",
                    "at end of round",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult){}",
                },
            },
            j_cry_loopy = {
                name = "Loopy",
                text = {
                    "{C:attention}Retrigger{} all Jokers",
                    "once for each {C:attention}Jolly{}",
                    "{C:attention}Joker{} sold this round",
                    "{C:inactive}(Currently{}{C:attention:} #1#{}{C:inactive} Retrigger(s)){}",
                    "{C:inactive,s:0.8}There wasn't enough room...{}",
                },
            },
            j_cry_lucky_joker = {
                name = "Lucky Joker",
                text = {
                    "Earn {C:money}$#1#{} every time a",
                    "{C:attention}Lucky{} card {C:green}successfully{}",
                    "triggers",
                },
            },
            j_cry_luigi = {
                name = "Luigi",
                text = {
                    "All Jokers give",
                    "{X:chips,C:white} X#1# {} Chips",
                },
            },
            j_cry_m = {
                name = "m",
                text = {
                    "This Joker gains {X:mult,C:white} X#1# {} Mult",
                    "when {C:attention}Jolly Joker{} is sold",
                    "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)",
                },
            },
            j_cry_M = {
                name = "M",
                text = {
                    "Create a {C:dark_edition}Negative{}",
                    "{C:attention}Jolly Joker{} when",
                    "{C:attention}Blind{} is selected",
                },
            },
            j_cry_macabre = {
                name = "Macabre Joker",
                text = {
                    "When {C:attention}Blind{} is selected,",
                    "destroys each {C:attention}Joker{} except",
                    "{C:legendary}M Jokers{} and {C:attention}Jolly Jokers{}",
                    "and create 1 {C:attention}Jolly Joker{}",
                    "for each destroyed card",
                },
            },
            j_cry_magnet = {
                name = "Fridge Magnet",
                text = {
                    "Earn {C:money}$#1#{} at end of round",
                    "This earns {X:money,C:white} X#2# {} if there are",
                    "{C:attention}#3#{} or fewer {C:attention}Joker{} cards",
                },
            },
            j_cry_manic = {
                name = "Manic Joker",
                text = {
                    "{C:red}+#1#{} Mult if played",
                    "hand contains",
                    "a {C:attention}#2#"
                }
            },
            j_cry_mario = {
                name = "Mario",
                text = {
                    "Retrigger all Jokers",
                    "{C:attention}#1#{} additional time(s)",
                },
            },
            j_cry_maximized = {
                name = "Maximized",
                text = {
                    "All {C:attention}face{} cards",
                    "are considered {C:attention}Kings{},",
                    "all {C:attention}numbered{} cards",
                    "are considered {C:attention}10s{}",
                },
            },
            j_cry_maze = {
                name = "Labyrinth",
                text = {
                    "All hands are considered the",
                    "{C:attention}first hand{} of each round,",
                    "all discards are considered the",
                    "{C:attention}first discard{} of each round",
                },
            },
            j_cry_Megg = {
                name = "Megg",
                text = {
                    "Sell this card to create",
                    "{C:attention}#2#{} Jolly #3#, increase",
                    "by {C:attention}#1#{} at end of round",
                },
            },
            j_cry_mellowcreme = {
                name = "Mellowcreme",
                text = {
                    "Sell this card to {C:attention}multiply",
                    "the sell value of all",
                    "{C:attention}consumables{} by {C:attention}X#1#"
                }
            },
            j_cry_membershipcard = {
                name = "Membership Card",
                text = {
                    "{X:mult,C:white}X#1#{} Mult for each member",
                    "in the {C:attention}Cryptid Discord{}",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
                    "{C:blue,s:0.7}https://discord.gg/eUf9Ur6RyB{}",
                },
            },
            j_cry_membershipcardtwo = {
                name = "Old Membership Card", --Could probably have a diff Name imo
                text = {
                    "{C:chips}+#1#{} Chips for each member",
                    "in the {C:attention}Cryptid Discord{}",
                    "{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)",
                    "{C:blue,s:0.7}https://discord.gg/eUf9Ur6RyB{}",
                },
            },
            j_cry_meteor = {
                name = "Meteor Shower",
                text = {
                    "{C:dark_edition}Foil{} cards each",
                    "give {C:chips}+#1#{} Chips",
                },
            },
            j_cry_mneon = {
                name = "Neon M",
                text = {
                    "Earn {C:money}$#2#{} at end of round",
                    "Increase payout by",
                    "{C:money}$#1#{} for each {C:attention}Jolly Joker{}",
                    "or {C:legendary}M Joker{} at",
                    "end of round",
                },
            },
            j_cry_mondrian = {
                name = "Mondrian",
                text = {
                    "This Joker gains {X:mult,C:white} X#1# {} Mult",
                    "if no {C:attention}discards{} were",
                    "used this round",
                    "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)",
                },
            },
            j_cry_monkey_dagger = {
                name = "Monkey Dagger",
                text = {
                    "When {C:attention}Blind{} is selected,",
                    "destroy Joker to the left",
                    "and permanently add {C:attention}ten times{}",
                    "its sell value to this {C:chips}Chips{}",
                    "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)",
                },
            },
            j_cry_monopoly_money = {
                name = "Monopoly Money",
                text = {
                    "{C:green}#1# in #2#{} chance to",
                    "{C:attention}destroy{} purchased items",
                    "Halves money when {C:attention}sold",
                }
            },
            j_cry_morse = {
                name = "Morse Code",
                text = {
                    "Earn {C:money}$#2#{} at end of round",
                    "Increase payout by {C:money}$#1#{} when",
                    "a card with an {C:attention}Edition{} is sold",
                },
            },
            j_cry_mprime = {
                name = "Tredecim",
                text = {
                    "Create an {C:legendary}M Joker{} at end of round",
                    "Each {C:attention}Jolly Joker{} or {C:legendary}M Joker",
                    "gives {X:dark_edition,C:white}^#1#{} Mult",
                    "Increase amount by {X:dark_edition,C:white}^#2#{}",
                    "when a {C:attention}Jolly Joker{} is {C:attention}sold",
                    "{C:inactive,s:0.8}(Tredecim excluded)",
                },
            },
            j_cry_mstack = {
                name = "M Stack",
                text = {
                    "Retrigger all cards played",
                    "once for every",
                    "{C:attention}#2#{} {C:inactive}[#3#]{} {C:attention}Jolly Jokers{} sold",
                    "{C:inactive}(Currently{}{C:attention:} #1#{}{C:inactive} retriggers){}",
                },
            },
            j_cry_multjoker = {
                name = "Mult Joker",
                text = {
                    "{C:green}#1# in #2#{} chance for each",
                    "played {C:attention}Mult{} card to create",
                    "a {C:spectral}Cryptid{} card when scored",
                    "{C:inactive}(Must have room)",
                },
            },
            j_cry_negative = {
                name = "Negative Joker",
                text = {
                    "{C:dark_edition}+#1#{C:attention} Joker{} slots",
                },
            },
            j_cry_nice = {
                name = "Nice",
                text = {
                    "{C:chips}+#1#{} Chips if played hand",
                    "contains a {C:attention}6{} and a {C:attention}9",
                    "{C:inactive,s:0.8}Nice.{}",
                },
            },
            j_cry_night = {
                name = "Night",
                text = {
                    "{X:dark_edition,C:white}^#1#{} Mult on final",
                    "hand of round",
                    "{E:2,C:red}self destructs{} on",
                    "final hand of round",
                },
            },
            j_cry_nosound = {
                name = "No Sound, No Memory",
                text = {
                    "Retrigger each played {C:attention}7{}",
                    "{C:attention:}#1#{} additional time(s)",
                },
            },
            j_cry_notebook = {
                name = "Notebook",
                text = {
                    "{C:green} #1# in #2#{} chance to gain {C:dark_edition}+1{} Joker",
                    "slot per {C:attention}reroll{} in the shop",
                    "{C:green}Always triggers{} if there are",
                    "{C:attention}#5#{} or more {C:attention}Jolly Jokers{}",
                    "{C:red}Works once per round{}",
                    "{C:inactive}(Currently {C:dark_edition}+#3#{}{C:inactive} and #4#){}",
                },
            },
            j_cry_number_blocks = {
                name = "Number Blocks",
                text = {
                    "Earn {C:money}$#1#{} at end of round",
                    "Increase payout by {C:money}$#2#{}",
                    "for each {C:attention}#3#{} held in hand,",
                    "rank changes every round",
                },
            },
            j_cry_nuts = {
                name = "The Nuts",
                text = {
                    "{X:mult,C:white} X#1# {} Mult if played",
                    "hand contains",
                    "a {C:attention}#2#",
                },
            },
            j_cry_nutty = {
                name = "Nutty Joker",
                text = {
                    "{C:red}+#1#{} Mult if played",
                    "hand contains",
                    "a {C:attention}#2#"
                }
            },
            j_cry_oldblueprint = {
                name = "Old Blueprint",
                text = {
                    "Copies ability of",
                    "{C:attention}Joker{} to the right",
                    "{C:green}#1# in #2#{} chance this",
                    "card is destroyed",
                    "at end of round",
                },
            },
            j_cry_oldcandy = {
                name = "Nostalgic Candy",
                text = {
                    "Sell this card to",
                    "permanently gain",
                    "{C:attention}+#1#{} hand size",
                },
            },
            j_cry_oldinvisible = {
                name = "Nostalgic Invisible Joker",
                text = {
                    "{C:attention}Duplicate{} a random",
                    "{C:attention}Joker{} every {C:attention}4",
                    "Joker cards sold",
                    "{s:0.8}Nostalgic Invisible Joker Excluded{}",
                    "{C:inactive}(Currently #1#/4){}",
                },
            },
            j_cry_panopticon = {
                name = "Panopticon",
                text = {
                    "All hands are considered the",
                    "{C:attention}last hand{} of each round", -- +$4
                },
            },
            j_cry_penetrating = {
                name = "Penetrating Joker",
                text = {
                    "{C:chips}+#1#{} Chips if played",
                    "hand contains",
                    "a {C:attention}#2#"
                }
            },
            j_cry_pickle = {
                name = "Pickle",
                text = {
                    "When {C:attention}Blind{} is skipped, create",
                    "{C:attention}#1#{} Tags, reduced by",
                    "{C:red}#2#{} when {C:attention}Blind{} is selected",
                },
            },
            j_cry_pirate_dagger = {
                name = "Pirate Dagger",
                text = {
                    "When {C:attention}Blind{} is selected,",
                    "destroy Joker to the right",
                    "and gain {C:attention}one-fourth{} of",
                    "its sell value as {X:chips,C:white} XChips {}",
                    "{C:inactive}(Currently {X:chips,C:white} X#1# {C:inactive} Chips)",
                },
            },
            j_cry_pot_of_jokes = {
                name = "Pot of Jokes",
                text = {
                    "{C:attention}#1#{} hand size,",
                    "increases by",
                    "{C:blue}#2#{} every round",
                },
            },
            j_cry_primus = {
                name = "Primus",
                text = {
                    "This Joker gains {X:dark_edition,C:white} ^#1# {} Mult",
                    "if all cards in played hand are",
                    "{C:attention}Aces{}, {C:attention}2s{}, {C:attention}3s{}, {C:attention}5s{}, or {C:attention}7s{}",
                    "{C:inactive}(Currently {X:dark_edition,C:white} ^#2# {C:inactive} Mult)",
                },
            },
            j_cry_python = {
                name = "Python",
                text = {
                    "This Joker gains",
                    "{X:mult,C:white} X#1# {} Mult when a",
                    "{C:cry_code}Code{} card is used",
                    "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)",
                },
            },
            j_cry_queens_gambit = {
                name = "Queen's Gambit",
                text = {
                    "If {C:attention}poker hand{} is a",
                    "{C:attention}Royal Flush{}, destroy scored",
                    "{C:attention}Queen{} and create a",
                    "{C:dark_edition}Negative {}{C:red}Rare{}{C:attention} Joker{}",
                },
            },
            j_cry_quintet = {
                name = "The Quintet",
                text = {
                    "{X:mult,C:white} X#1# {} Mult if played",
                    "hand contains",
                    "a {C:attention}#2#",
                },
            },
            j_cry_redbloon = {
                name = "Red Bloon",
                text = {
                    "Earn {C:money}$#1#{} in {C:attention}#2#{} round(s)",
                    "{C:red,E:2}self destructs{}",
                },
            },
            j_cry_redeo = {
                name = "Redeo",
                text = {
                    "{C:attention}-#1#{} Ante when",
                    "{C:money}$#2#{} {C:inactive}($#3#){} spent",
                    "{s:0.8}Requirements increase",
                    "{C:attention,s:0.8}exponentially{s:0.8} per use",
                    "{C:money,s:0.8}Next increase: {s:1,c:money}$#4#",
                },
            },
            j_cry_rescribere = {
                name = 'Rescribere',
                text = {
                    "When a {C:attention}Joker{} is sold,",
                    "add its effects to",
                    "every other Joker",
                    "{C:inactive,s:0.8}Does not affect other Rescribere{}"
                }
            },
            j_cry_reverse = {
                name = "Reverse Card",
                text = {
                    "Fill all empty Joker slots {C:inactive}(Max 100){}",
                    "with {C:dark_edition}Holographic{} {C:attention}Jolly Jokers{} if",
                    "{C:attention}discarded poker hand{} is a {C:attention}#1#{}",
                    "{C:red,E:2}self destructs{}",
                    "{C:inactive,s:0.8}The ULTIMATE comeback{}",
                },
            },
            j_cry_rnjoker = {
                name = "RNJoker",
                text = {
                    "Randomize abilities each {C:attention}Ante{}",
                },
            },
            j_cry_sacrifice = {
                name = "Sacrifice",
                text = {
                    "Create an {C:green}Uncommon{} Joker",
                    "and 3 {C:attention}Jolly Jokers{} when",
                    "a {C:spectral}Spectral{} card is used",
                    "{C:red}Works once per round{}",
                    "{C:inactive}#1#{}",
                },
            },
            j_cry_sapling = {
                name = "Sapling",
                text = {
                    "After scoring {C:attention}#2#{} {C:inactive}[#1#]{} Enhanced",
                    "cards, sell this card to",
                    "create an {C:cry_epic}Epic{} {C:attention}Joker{}",
                    "{C:inactive,s:0.8}Will create a {C:red,s:0.8}Rare{} {C:attention,s:0.8}Joker{}",
                    "{C:inactive,s:0.8}if {C:cry_epic,s:0.8}Epic{} {C:inactive,s:0.8}Jokers are disabled{}",
                },
            },
            j_cry_savvy = {
                name = "Savvy Joker",
                text = {
                    "{C:chips}+#1#{} Chips if played",
                    "hand contains",
                    "a {C:attention}#2#"
                }
            },
            j_cry_Scalae = {
                name = "Scalae",
                text = {
                    "Scaling {C:attention}Jokers{} scale",
                    "as a degree-{C:attention}#1#{} polynomial",
                    "raise degree by {C:attention}#2#{}",
                    "at end of round",
                    "{C:inactive,s:0.8}({C:attention,s:0.8}Scalae{C:inactive,s:0.8} excluded)",
                },
            },
            j_cry_scrabble = {
                name = "Scrabble Tile",
                text = {
                    "{C:green}#1# in #2#{} chance to create",
                    "a {C:dark_edition}Jolly {C:green}Uncommon{} Joker",
                    "when hand is played",
                },
            },
            j_cry_seal_the_deal = {
                name = "Seal the Deal",
                text = {
                    "Add a {C:attention}random seal{} to each card",
                    "scored on {C:attention}final hand{} of round",
                },
            },
            j_cry_shrewd = {
                name = "Shrewd Joker",
                text = {
                    "{C:chips}+#1#{} Chips if played",
                    "hand contains",
                    "a {C:attention}#2#"
                }
            },
            j_cry_silly = {
                name = "Silly Joker",
                text = {
                    "{C:red}+#1#{} Mult if played",
                    "hand contains",
                    "a {C:attention}#2#"
                }
            },
            j_cry_smallestm = {
                name = "Tiny",
                text = {
                    "Create a {C:cry_jolly}Double M",
                    "tag if {C:attention}poker hand{}",
                    "is a {C:attention}#1#{}",
                    "{C:inactive,s:0.8}ok so basically i'm very smol",
                },
            },
            j_cry_soccer = {
                name = "One for All", --changed the name from latin because this isn't exotic
                text = {
                    "{C:attention}+#1#{} Joker slot",
                    "{C:attention}+#1#{} Booster Pack slot",
                    "{C:attention}+#1#{} hand size",
                    "{C:attention}+#1#{} consumable slot",
                    "{C:attention}+#1#{} card in shop",
                },
            },
            j_cry_spaceglobe = {
                name = "Celestial Globe",
                text = {
                    "This Joker gains {X:chips,C:white}X#2#{} Chips",
                    "if {C:attention}poker hand{} is a {C:attention}#3#{},",
                    "Hand changes after increase{}",
                    "{C:inactive}(Currently{} {X:chips,C:white}X#1#{} {C:inactive}Chips){}",
                },
            },
            j_cry_speculo = {
                name = "Speculo",
                text = {
                    "Creates a {C:dark_edition}Negative{} copy",
                    "of a random {C:attention}Joker{}",
                    "at the end of the {C:attention}shop",
                    "{C:inactive,s:0.8}Does not copy other Speculo{}",
                },
            },
            j_cry_spy = {
                name = "Spy",
                text = {
                    "{X:mult,C:white} X#2# {} Mult, {C:dark_edition}+1{C:attention} Joker{} slot",
                    "{C:inactive}That #1# is a spy!",
                },
            },
            j_cry_stardust = {
                name = "Stardust",
                text = {
                    "{C:dark_edition}Polychrome{} cards",
                    "each give {X:mult,C:white}X#1#{} Mult",
                },
            },
            j_cry_stella_mortis = {
                name = "Stella Mortis",
                text = {
                    "This Joker destroys a",
                    "random {C:planet}Planet{} card",
                    "and gains {X:dark_edition,C:white} ^#1# {} Mult",
                    "at the end of the {C:attention}shop{}",
                    "{C:inactive}(Currently {X:dark_edition,C:white} ^#2# {C:inactive} Mult)",
                },
            },
            j_cry_stronghold = {
                name = "The Stronghold",
                text = {
                    "{X:mult,C:white} X#1# {} Mult if played",
                    "hand contains",
                    "a {C:attention}#2#",
                },
            },
            j_cry_subtle = {
                name = "Subtle Joker",
                text = {
                    "{C:chips}+#1#{} Chips if played",
                    "hand contains",
                    "a {C:attention}#2#"
                }
            },
            j_cry_supercell = {
                name = "Supercell",
                text = {
                    "{C:chips}+#1#{} Chips, {C:mult}+#1#{} Mult,",
                    "{X:chips,C:white}X#2#{} Chips, {X:mult,C:white}X#2#{} Mult",
                    "Earn {C:money}$#3#{} at",
                    "end of round",
                },
            },
            j_cry_sus = {
                name = "SUS",
                text = {
                    "At end of round, create",
                    "a {C:attention}copy{} of a random",
                    "card {C:attention}held in hand{},",
                    "destroy all others",
                    "{C:attention,s:0.8}Kings{s:0.8} of {C:hearts,s:0.8}Hearts{s:0.8} are prioritized",
                },
            },
            j_cry_swarm = {
                name = "The Swarm",
                text = {
                    "{X:mult,C:white} X#1# {} Mult if played",
                    "hand contains",
                    "a {C:attention}#2#",
                },
            },
            j_cry_sync_catalyst = {
                name = "Sync Catalyst",
                text = {
                    "Balances {C:chips}Chips{} and {C:mult}Mult{}",
                    "{C:inactive,s:0.8}Hey! I've seen this one before!",
                },
            },
            j_cry_tenebris = {
                name = "Tenebris",
                text = {
                    "{C:dark_edition}+#1#{C:attention} Joker{} slots",
                    "Earn {C:money}$#2#{} at end of round",
                },
            },
            j_cry_translucent = {
                name = "Translucent Joker",
                text = {
                    "Sell this card to create",
                    "a {C:attention}Banana Perishable{} copy",
                    "of a random {C:attention}Joker{}",
                    "{s:0.8,C:inactive}(Copy bypasses perish compat)",
                },
            },
            j_cry_treacherous = {
                name = "Treacherous Joker",
                text = {
                    "{C:chips}+#1#{} Chips if played",
                    "hand contains",
                    "an {C:attention}#2#"
                }
            },
            j_cry_trick_or_treat = {
                name = "Trick-or-Treat",
                text = {
                    "When {C:attention}sold{}:",
                    "{C:green}#1# in #2#{} chance to create {C:attention}2{} {C:cry_candy}Candies",
                    "Otherwise, create a {X:cry_cursed,C:white}Cursed{} Joker",
                    "{C:inactive}(Can overflow)"
                }
            },
            j_cry_tricksy = {
                name = "Tricksy Joker",
                text = {
                    "{C:chips}+#1#{} Chips if played",
                    "hand contains",
                    "a {C:attention}#2#"
                }
            },
            j_cry_triplet_rhythm = {
                name = "Triplet Rhythm",
                text = {
                    "{X:mult,C:white} X#1# {} Mult if scoring hand",
                    "contains {C:attention}exactly{} three {C:attention}3s",
                },
            },
            j_cry_unity = {
                name = "The Unity",
                text = {
                    "{X:mult,C:white} X#1# {} Mult if played",
                    "hand contains",
                    "a {C:attention}#2#",
                },
            },
            j_cry_universum = {
                name = "Universum",
                text = {
                    "{C:attention}Poker hands{} gain",
                    "{X:red,C:white} X#1# {} Mult and {X:blue,C:white} X#1# {} Chips",
                    "when leveled up",
                },
            },
            j_cry_unjust_dagger = {
                name = "Unjust Dagger",
                text = {
                    "When {C:attention}Blind{} is selected,",
                    "destroy Joker to the left",
                    "and gain {C:attention}one-fifth{} of",
                    "its sell value as {X:mult,C:white} XMult {}",
                    "{C:inactive}(Currently {X:mult,C:white} X#1# {C:inactive} Mult)",
                },
            },
            j_cry_verisimile = {
                name = "Non Verisimile",
                text = {
                    "When any probability",
                    "is {C:green}successfully{} triggered,",
                    "this Joker gains {X:red,C:white}XMult{}",
                    "equal to its listed {C:attention}odds",
                    "{C:inactive}(Currently {X:mult,C:white} X#1# {C:inactive} Mult)",
                },
            },
            j_cry_virgo = {
                name = "Virgo",
                text = {
                    "This Joker gains {C:money}$#1#{} of {C:attention}sell value{}",
                    "if {C:attention}poker hand{} contains a {C:attention}#2#{}",
                    "Sell this card to create a",
                    "{C:dark_edition}Polychrome{} {C:attention}Jolly Joker{} for",
                    "every {C:money}$4{} of {C:attention}sell value{} {C:inactive}(Min 1){}",
                },
            },
            j_cry_wacky = {
                name = "Wacky Joker",
                text = {
                    "{C:red}+#1#{} Mult if played",
                    "hand contains",
                    "a {C:attention}#2#"
                }
            },
            j_cry_waluigi = {
                name = "Waluigi",
                text = {
                    "All Jokers give",
                    "{X:mult,C:white} X#1# {} Mult",
                },
            },
            j_cry_wario = {
                name = "Wario",
                text = {
                    "All Jokers give",
                    "{C:money}$#1#{} when triggered",
                },
            },
            j_cry_wee_fib = {
                name = "Weebonacci",
                text = {
                    "This Joker gains",
                    "{C:mult}+#2#{} Mult when each played",
                    "{C:attention}Ace{}, {C:attention}2{}, {C:attention}3{}, {C:attention}5{}, or {C:attention}8{}",
                    "is scored",
                    "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)",
                },
            },
            j_cry_weegaming = {
                name = "2D",
                text = {
                    "Retrigger each played {C:attention}2{}", --wee gaming
                    "{C:attention:}#1#{} additional time(s)", --wee gaming?
                    "{C:inactive,s:0.8}Wee Gaming?{}",
                },
            },
            j_cry_wheelhope = {
                name = "Wheel of Hope",
                text = {
                    "This Joker gains",
                    "{X:mult,C:white} X#1# {} Mult when failing",
                    "a {C:attention}Wheel of Fortune{}",
                    "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)",
                },
            },
            j_cry_whip = {
                name = "The WHIP",
                text = {
                    "This Joker gains {X:mult,C:white} X#1# {} Mult",
                    "if {C:attention}played hand{} contains a",
                    "{C:attention}2{} and {C:attention}7{} of different suits",
                    "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)",
                },
            },
            j_cry_wrapped = {
                name = "Wrapped Candy",
                text = {
                    "Create a random {C:attention}Food Joker{}",
                    "in {C:attention}#1#{} round(s)",
                    "{C:red,E:2}self destructs{}",
                },
            },
            j_cry_wtf = {
                name = "The Fuck!?",
                text = {
                    "{X:mult,C:white} X#1# {} Mult if played",
                    "hand contains",
                    "a {C:attention}#2#",
                },
            },
        },
        Planet = {
            c_cry_Klubi = {
                name = "Klubi",
                text = {
                    "({V:1}lvl.#4#{})({V:2}lvl.#5#{})({V:3}lvl.#6#{})",
                    "Level up",
                    "{C:attention}#1#{},",
                    "{C:attention}#2#{},",
                    "and {C:attention}#3#{}",
                },
            },
            c_cry_Lapio = {
                name = "Lapio",
                text = {
                    "({V:1}lvl.#4#{})({V:2}lvl.#5#{})({V:3}lvl.#6#{})",
                    "Level up",
                    "{C:attention}#1#{},",
                    "{C:attention}#2#{},",
                    "and {C:attention}#3#{}",
                },
            },
            c_cry_Kaikki = {
                name = "Kaikki",
                text = {
                    "({V:1}lvl.#4#{})({V:2}lvl.#5#{})({V:3}lvl.#6#{})",
                    "Level up",
                    "{C:attention}#1#{},",
                    "{C:attention}#2#{},",
                    "and {C:attention}#3#{}",
                },
            },
            c_cry_nstar = {
                name = "Neutron Star",
                text = {
                    "Upgrade a random",
                    "poker hand by",
                    "{C:attention}1{} level for each",
                    "{C:attention}Neutron Star{} used",
                    "in this run",
                    "{C:inactive}(Currently{C:attention} #1#{C:inactive}){}",
                },
            },
            c_cry_planetlua = {
                name = "Planet.lua",
                text = {
                    "{C:green}#1# in #2#{} chance to",
                    "upgrade every",
                    "{C:legendary,E:1}poker hand{}",
                    "by {C:attention}1{} level",
                },
            },
            c_cry_Sydan = {
                name = "Sydan",
                text = {
                    "({V:1}lvl.#4#{})({V:2}lvl.#5#{})({V:3}lvl.#6#{})",
                    "Level up",
                    "{C:attention}#1#{},",
                    "{C:attention}#2#{},",
                    "and {C:attention}#3#{}",
                },
            },
            c_cry_Timantti = {
                name = "Timantti",
                text = {
                    "({V:1}lvl.#4#{})({V:2}lvl.#5#{})({V:3}lvl.#6#{})",
                    "Level up",
                    "{C:attention}#1#{},",
                    "{C:attention}#2#{},",
                    "and {C:attention}#3#{}",
                },
            },
        },
        Sleeve = {
            sleeve_cry_ccd_sleeve = {
                name = "CCD Sleeve",
                text = {
                    "Every card is also",
                    "a {C:attention}random{} consumable",
                },
            },
            sleeve_cry_conveyor_sleeve = {
                name = "Conveyor Sleeve",
                text = {
                    "Jokers may {C:attention}not{} be moved",
                    "At start of round,",
                    "{C:attention}duplicate{} rightmost Joker",
                    "and {C:attention}destroy{} leftmost Joker",
                },
            },
            sleeve_cry_critical_sleeve = {
                name = "Critical Sleeve",
                text = {
                    "After each hand played,",
                    "{C:green}1 in 4{} chance for {X:dark_edition,C:white} ^2 {} Mult",
                    "{C:green}1 in 8{} chance for {X:dark_edition,C:white} ^0.5 {} Mult",
                },
            },
            sleeve_cry_encoded_sleeve = {
                name = "Encoded Sleeve",
                text = {
                    "Start with a {C:cry_code,T:j_cry_CodeJoker}Code Joker{}",
                    "and a {C:cry_code,T:j_cry_copypaste}Copy/Paste{}",
                    "Only {C:cry_code}Code Cards{} appear in shop",
                },
            },
            sleeve_cry_equilibrium_sleeve = {
                name = "Balanced Sleeve",
                text = {
                    "All cards have the",
                    "{C:attention}same chance{} of",
                    "appearing in shops,",
                    "start run with",
                    "{C:attention,T:v_overstock_plus}+2 Shop Slots",
                },
            },
            sleeve_cry_infinite_sleeve = {
                name = "Unlimited Sleeve",
                text = {
                    "You can select {C:attention}any",
                    "number of cards",
                    --someone do the hand size thing for me
                },
            },
            sleeve_cry_misprint_sleeve = {
                name = "Misprinted Sleeve",
                text = {
                    "Values of cards",
                    "are {C:attention}randomized",
                },
            },
            sleeve_cry_redeemed_sleeve = {
                name = "Redeemed Sleeve",
                text = {
                    "When a {C:attention}Voucher{} is purchased,",
                    "gain its {C:attention}extra tiers",
                },
            },
            sleeve_cry_wormhole_sleeve = {
                name = "Wormhole Sleeve",
                text = {
                    "Start with an {C:cry_exotic}Exotic{C:attention} Joker",
                    "Jokers are {C:attention}20X{} more",
                    "likely to be {C:dark_edition}Negative",
                    "{C:attention}-2{} Joker slots",
                },
            },
			sleeve_cry_legendary_sleeve = {
                name = "Legendary Sleeve",
                text = {
                    "Start with an {C:legendary}Legendary{C:legendary} Joker",
                    "{C:green}1 in 5{} chance to create another",
					"when Boss Blind is defeated {C:inactive}(must have room){}",
                },
            },
        },
        Spectral = {
            c_cry_analog = {
                name = "Analog",
                text = {
                    "Create {C:attention}#1#{} copies of a",
                    "random {C:attention}Joker{}, destroy",
                    "all other Jokers, {C:attention}+#2#{} Ante",
                },
            },
            c_cry_gateway = {
                name = "Gateway",
                text = {
                    "Create a random",
                    "{C:cry_exotic,E:1}Exotic{C:attention} Joker{}, destroy",
                    "all other Jokers",
                },
            },
            c_cry_hammerspace = {
                name = "Hammerspace",
                text = {
                    "Apply random {C:attention}consumables{}",
                    "as if they were {C:dark_edition}Enhancements{}",
                    "to cards held in hand",
                },
            },
            c_cry_lock = {
                name = "Lock",
                text = {
                    "Remove {C:red}all{} stickers",
                    "from {C:red}all{} Jokers,",
                    "then apply {C:purple,E:1}Eternal{}",
                    "to a random {C:attention}Joker{}",
                },
            },
            c_cry_pointer = {
                name = "POINTER://",
                text = {
                    "Create a card",
                    "of {C:cry_code}your choice",
                    "{C:inactive,s:0.8}(Exotic Jokers #1#excluded)",
                },
            },
            c_cry_replica = {
                name = "Replica",
                text = {
                    "Convert all cards",
                    "held in hand",
                    "to a {C:attention}random{}",
                    "card held in hand",
                },
            },
            c_cry_source = {
                name = "Source",
                text = {
                    "Add a {C:cry_code}Green Seal{}",
                    "to {C:attention}#1#{} selected",
                    "card in your hand",
                },
            },
            c_cry_summoning = {
                name = "Summoning",
                text = {
                    "Create a random",
                    "{C:cry_epic}Epic{} {C:joker}Joker{}, destroy",
                    "one random {C:joker}Joker{}",
                },
            },
            c_cry_trade = {
                name = "Trade",
                text = {
                    "{C:attention}Lose{} a random Voucher,",
                    "gain {C:attention}2{} random Vouchers",
                },
            },
            c_cry_typhoon = {
                name = "Typhoon",
                text = {
                    "Add an {C:cry_azure}Azure Seal{}",
                    "to {C:attention}#1#{} selected",
                    "card in your hand",
                },
            },
            c_cry_vacuum = {
                name = "Vacuum",
                text = {
                    "Removes {C:red}all {C:green}modifications{}",
                    "from {C:red}all{} cards held in hand,",
                    "Earn {C:money}$#1#{} per {C:green}modification{} removed",
                    "{C:inactive,s:0.7}(ex. Enhancements, Seals, Editions)",
                },
            },
            c_cry_white_hole = {
                name = "White Hole",
                text = {
                    "{C:attention}Remove{} all hand levels,",
                    "upgrade {C:legendary,E:1}most played{} poker hand",
                    "by {C:attention}3{} for each removed level",
                },
            },
        },
        Stake = {
            stake_cry_pink = {
                name = "Pink Stake",
                colour = "Pink", --this is used for auto-generated sticker localization
                text = {
                    "Required score scales",
                    "faster for each {C:attention}Ante",
                },
            },
            stake_cry_brown = {
                name = "Brown Stake",
                colour = "Brown",
                text = {
                    "All {C:attention}stickers{} are compatible",
                    "with each other",
                },
            },
            stake_cry_yellow = {
                name = "Yellow Stake",
                colour = "Yellow",
                text = {
                    "{C:attention}Stickers{} can appear on",
                    "all purchasable items",
                },
            },
            stake_cry_jade = {
                name = "Jade Stake",
                colour = "Jade",
                text = {
                    "Cards can be drawn {C:attention}face down{}",
                },
            },
            stake_cry_cyan = {
                name = "Cyan Stake",
                colour = "Cyan",
                text = {
                    "{C:green}Uncommon{} and {C:red}Rare{} Jokers are",
                    "less likely to appear",
                },
            },
            stake_cry_gray = {
                name = "Gray Stake",
                colour = "Gray",
                text = {
                    "Rerolls increase by {C:attention}$2{} each",
                },
            },
            stake_cry_crimson = {
                name = "Crimson Stake",
                colour = "Crimson",
                text = {
                    "Vouchers restock on {C:attention}even{} Antes",
                },
            },
            stake_cry_diamond = {
                name = "Diamond Stake",
                colour = "Diamond",
                text = {
                    "Must beat Ante {C:attention}10{} to win",
                },
            },
            stake_cry_amber = {
                name = "Amber Stake",
                colour = "Amber",
                text = {
                    "{C:attention}-1{} Booster Pack slot",
                },
            },
            stake_cry_bronze = {
                name = "Bronze Stake",
                colour = "Bronze",
                text = {
                    "Vouchers are {C:attention}50%{} more expensive",
                },
            },
            stake_cry_quartz = {
                name = "Quartz Stake",
                colour = "Quartz",
                text = {
                    "Jokers can be {C:attention}Pinned{}",
                    "{s:0.8,C:inactive}(Stays pinned to the leftmost position){}",
                },
            },
            stake_cry_ruby = {
                name = "Ruby Stake",
                colour = "Ruby",
                text = {
                    "{C:attention}Big{} Blinds can become",
                    "{C:attention}Boss{} Blinds",
                },
            },
            stake_cry_glass = {
                name = "Glass Stake",
                colour = "Glass",
                text = {
                    "Cards can {C:attention}shatter{} when scored",
                },
            },
            stake_cry_sapphire = {
                name = "Sapphire Stake",
                colour = "Sapphire",
                text = {
                    "Lose {C:attention}25%{} of current money",
                    "at end of Ante",
                    "{s:0.8,C:inactive}(Up to $10){}",
                },
            },
            stake_cry_emerald = {
                name = "Emerald Stake",
                colour = "Emerald",
                text = {
                    "Cards, packs, and vouchers",
                    "can be {C:attention}face down{}",
                    "{s:0.8,C:inactive}(Unable to be viewed until purchased){}",
                },
            },
            stake_cry_platinum = {
                name = "Platinum Stake",
                colour = "Platinum",
                text = {
                    "Small Blinds are {C:attention}removed{}",
                },
            },
            stake_cry_twilight = {
                name = "Twilight Stake",
                colour = "Twilight",
                text = {
                    "Cards can be {C:attention}Banana{}",
                    "{s:0.8,C:inactive}(1 in 10 chance of being destroyed each round){}",
                },
            },
            stake_cry_verdant = {
                name = "Verdant Stake",
                colour = "Verdant",
                text = {
                    "Required score scales",
                    "faster for each {C:attention}Ante",
                },
            },
            stake_cry_ember = {
                name = "Ember Stake",
                colour = "Ember",
                text = {
                    "All items give no money when sold",
                },
            },
            stake_cry_dawn = {
                name = "Dawn Stake",
                colour = "Dawn",
                text = {
                    "Tarots and Spectrals target {C:attention}1",
                    "fewer card",
                    "{s:0.8,C:inactive}(Minimum of 1){}",
                },
            },
            stake_cry_horizon = {
                name = "Horizon Stake",
                colour = "Horizon",
                text = {
                    "When blind selected, add a",
                    "{C:attention}random card{} to deck",
                },
            },
            stake_cry_blossom = {
                name = "Blossom Stake",
                colour = "Blossom",
                text = {
                    "{C:attention}Final{} Boss Blinds can appear",
                    "in {C:attention}any{} Ante",
                },
            },
            stake_cry_azure = {
                name = "Azure Stake",
                colour = "Azure",
                text = {
                    "Values on Jokers are reduced",
                    "by {C:attention}20%{}",
                },
            },
            stake_cry_ascendant = {
                name = "Ascendant Stake",
                colour = "Ascendant",
                text = {
                    "{C:attention}-1{} Shop slot",
                },
            },
        },
        Tag = {
            tag_cry_astral = {
                name = "Astral Tag",
                text = {
                    "Next base edition shop",
                    "Joker is free and",
                    "becomes {C:dark_edition}Astral{}",
                },
            },
            tag_cry_banana = {
                name = "Banana Tag",
                text = {
                    "Creates {C:attention}#1#",
                    "{C:inactive}(Must have room){}",
                },
            },
            tag_cry_bettertop_up = {
                name = "Better Top-up Tag",
                text = {
                    "Creates up to {C:attention}#1#",
                    "{C:green}Uncommon{} Jokers",
                    "{C:inactive}(Must have room){}",
                },
            },
            tag_cry_better_voucher = {
                name = "Golden Voucher Tag",
                text = {
                    "Adds one Tier {C:attention}#1#{} Voucher",
                    "to the next shop",
                },
            },
            tag_cry_blur = {
                name = "Blurred Tag",
                text = {
                    "Next base edition shop",
                    "Joker is free and",
                    "becomes {C:dark_edition}Blurred{}",
                },
            },
            tag_cry_booster = {
                name = "Booster Tag",
                text = {
                    "Next {C:cry_code}Booster Pack{} has",
                    "{C:attention}double{} cards and",
                    "{C:attention}double{} choices",
                },
            },
            tag_cry_bundle = {
                name = "Bundle Tag",
                text = {
                    "Create a {C:attention}Standard Tag{}, {C:tarot}Charm Tag{},",
                    "{C:attention}Buffoon Tag{}, and {C:planet}Meteor Tag",
                },
            },
            tag_cry_cat = {
                name = "Cat Tag",
                text = { "Meow.", "{C:inactive}Level {C:dark_edition}#1#" },
            },
            tag_cry_console = {
                name = "Console Tag",
                text = {
                    "Gives a free",
                    "{C:cry_code}Program Pack",
                },
            },
            tag_cry_double_m = {
                name = "Double M Tag",
                text = {
                    "Shop has a",
                    "{C:dark_edition}Jolly {C:legendary}M Joker{}",
                },
            },
            tag_cry_empowered = {
                name = "Empowered Tag",
                text = {
                    "Gives a free {C:spectral}Spectral Pack",
                    "with {C:legendary,E:1}The Soul{} and {C:cry_exotic,E:1}Gateway{}",
                },
            },
            tag_cry_epic = {
                name = "Epic Tag",
                text = {
                    "Shop has a half-price",
                    "{C:cry_epic}Epic Joker",
                },
            },
            tag_cry_gambler = {
                name = "Gambler's Tag",
                text = {
                    "{C:green}#1# in #2#{} chance to create",
                    "an {C:cry_exotic,E:1}Empowered Tag",
                },
            },
            tag_cry_glass = {
                name = "Fragile Tag",
                text = {
                    "Next base edition shop",
                    "Joker is free and",
                    "becomes {C:dark_edition}Fragile{}",
                },
            },
            tag_cry_glitched = {
                name = "Glitched Tag",
                text = {
                    "Next base edition shop",
                    "Joker is free and",
                    "becomes {C:dark_edition}Glitched{}",
                },
            },
            tag_cry_gold = {
                name = "Golden Tag",
                text = {
                    "Next base edition shop",
                    "Joker is free and",
                    "becomes {C:dark_edition}Golden{}",
                },
            },
            tag_cry_gourmand = {
                name = "Gourmand Tag",
                text = {
                    "Shop has a free",
                    "{C:attention}Food Joker",
                },
            },
            tag_cry_loss = {
                name = "Loss",
                text = {
                    "Gives a free",
                    "{C:cry_ascendant}Meme Pack",
                },
            },
            tag_cry_m = {
                name = "Jolly Tag",
                text = {
                    "Next base edition shop",
                    "Joker is free and",
                    "becomes {C:dark_edition}Jolly{}",
                },
            },
            tag_cry_memory = {
                name = "Memory Tag",
                text = {
                    "Create {C:attention}#1#{} copies of",
                    "the last {C:attention}Tag{} used",
                    "during this run",
                    "{s:0.8,C:inactive}Copying Tags excluded",
                    "{s:0.8,C:inactive}Currently: {s:0.8,C:attention}#2#",
                },
            },
            tag_cry_mosaic = {
                name = "Mosaic Tag",
                text = {
                    "Next base edition shop",
                    "Joker is free and",
                    "becomes {C:dark_edition}Mosaic{}",
                },
            },
            tag_cry_oversat = {
                name = "Oversaturated Tag",
                text = {
                    "Next base edition shop",
                    "Joker is free and",
                    "becomes {C:dark_edition}Oversaturated{}",
                },
            },
            tag_cry_quadruple = {
                name = "Quadruple Tag",
                text = {
                    "Gives {C:attention}#1#{} copies of the",
                    "next selected {C:attention}Tag",
                    "{s:0.8,C:inactive}Copying Tags excluded",
                },
            },
            tag_cry_quintuple = {
                name = "Quintuple Tag",
                text = {
                    "Gives {C:attention}#1#{} copies of the",
                    "next selected {C:attention}Tag",
                    "{s:0.8,C:inactive}Copying Tags excluded",
                },
            },
            tag_cry_rework = {
                name = "Rework Tag",
                text = {
                    "Shop has a(n)",
                    "{C:dark_edition}#1# {C:cry_code}#2#",
                },
            },
            tag_cry_schematic = {
                name = "Schematic Tag",
                text = {
                    "Shop has a",
                    "{C:attention}Brainstorm",
                },
            },
            tag_cry_scope = {
                name = "Scope Tag",
                text = {
                    "{C:attention}+#1# {C:blue}hands{} and",
                    "{C:red}discards{} next round",
                },
            },
            tag_cry_triple = {
                name = "Triple Tag",
                text = {
                    "Gives {C:attention}#1#{} copies of the",
                    "next selected {C:attention}Tag",
                    "{s:0.8,C:inactive}Copying Tags excluded",
                },
            },
        },
        Tarot = {
            c_cry_automaton = {
                name = "The Automaton",
                text = {
                    "Creates up to {C:attention}#1#",
                    "random {C:cry_code}Code{} card",
                    "{C:inactive}(Must have room)",
                },
            },
            c_cry_eclipse = {
                name = "The Eclipse",
                text = {
                    "Enhances {C:attention}#1#{} selected card",
                    "into an {C:attention}Echo Card",
                },
            },
            c_cry_meld = {
                name = "Meld",
                text = {
                    "Select a {C:attention}Joker{} or",
                    "{C:attention}playing card{} to",
                    "become {C:dark_edition}Double-Sided",
                },
            },
            c_cry_theblessing = {
                name = "The Blessing",
                text = {
                    "Creates {C:attention}1{}",
                    "random {C:attention}consumable{}",
                    "{C:inactive}(Must have room){}",
                },
            },
        },
        Voucher = {
            v_cry_asteroglyph = {
                name = "Asteroglyph",
                text = {
                    "Set Ante to {C:attention}#1#{}",
                },
            },
            v_cry_blankcanvas = {
                name = "Blank Canvas",
                text = {
                    "{C:attention}+#1#{} hand size",
                },
            },
            v_cry_clone_machine = {
                name = "Clone Machine",
                text = {
                    "Double Tags become",
                    "{C:attention}Quintuple Tags{} and",
                    "are {C:attention}4X{} as common",
                },
            },
            v_cry_command_prompt = {
                name = "Command Prompt",
                text = {
                    "{C:cry_code}Code{} cards",
                    "can appear",
                    "in the {C:attention}shop{}",
                },
            },
            v_cry_copies = {
                name = "Copies",
                text = {
                    "Double Tags become",
                    "{C:attention}Triple Tags{} and are",
                    "{C:attention}2X{} as common",
                },
            },
            v_cry_curate = {
                name = "Curate",
                text = {
                    "All cards",
                    "appear with",
                    "an {C:dark_edition}Edition{}",
                },
            },
            v_cry_dexterity = {
                name = "Dexterity",
                text = {
                    "Permanently",
                    "gain {C:blue}+#1#{} hand(s)",
                    "each round",
                },
            },
            v_cry_double_down = {
                name = "Double Down",
                text = {
                    "After every round,",
                    "{X:dark_edition,C:white} X1.5 {} to all values",
                    "on the back of",
                    "{C:dark_edition}Double-Sided{} cards"
                },
            },
            v_cry_double_slit = {
                name = "Double Slit",
                text = {
                    "{C:attention}Meld{} can appear",
                    "in the shop and",
                    "Arcana Packs",
                },
            },
            v_cry_double_vision = {
                name = "Double Vision",
                text = {
                    "{C:dark_edition}Double-Sided{} cards appear",
                    "{C:attention}4X{} more frequently",
                },
            },
            v_cry_fabric = {
                name = "Universal Fabric",
                text = {
                    "{C:dark_edition}+#1#{} Joker slot(s)",
                },
            },
            v_cry_massproduct = {
                name = "Mass Production",
                text = {
                    "All cards and packs",
                    "in shop cost {C:attention}$1{}",
                },
            },
            v_cry_moneybean = {
                name = "Money Beanstalk",
                text = {
                    "Raise the cap on",
                    "interest earned in",
                    "each round to {C:money}$#1#{}",
                },
            },
            v_cry_overstock_multi = {
                name = "Multistock",
                text = {
                    "{C:attention}+#1#{} card slot(s) and",
                    "{C:attention}+#1#{} booster pack slot(s)",
                    "available in shop",
                },
            },
            v_cry_pacclimator = {
                name = "Planet Acclimator",
                text = {
                    "{C:planet}Planet{} cards appear",
                    "{C:attention}X#1#{} more frequently",
                    "in the shop",
                    "All future {C:planet}Planet{}",
                    "cards are {C:green}free{}",
                },
            },
            v_cry_pairamount_plus = {
                name = "Pairamount Plus",
                text = {
                    "{C:attention}Retrigger{} all M Jokers",
                    "once for every Pair",
                    "{C:attention}contained{} in played hand",
                },
            },
            v_cry_pairing = {
                name = "Pairing",
                text = {
                    "{C:attention}Retrigger{} all M Jokers",
                    "if played hand is a {C:attention}Pair",
                },
            },
            v_cry_quantum_computing = {
                name = "Quantum Computing",
                text = {
                    "{C:cry_code}Code{} cards can spawn",
                    "with {C:dark_edition}Negative{} edition",
                },
            },
            v_cry_repair_man = {
                name = "Repair Man",
                text = {
                    "{C:attention}Retrigger{} all M Jokers",
                    "if played hand contains a {C:attention}Pair",
                },
            },
            v_cry_rerollexchange = {
                name = "Reroll Exchange",
                text = {
                    "All rerolls",
                    "cost {C:attention}$2{}",
                },
            },
            v_cry_satellite_uplink = {
                name = "Satellite Uplink",
                text = {
                    "{C:cry_code}Code{} cards may",
                    "appear in any of",
                    "the {C:attention}Celestial Packs{}",
                },
            },
            v_cry_scope = {
                name = "Galactic Scope",
                text = {
                    "Create the {C:planet}Planet",
                    "card for played",
                    "{C:attention}poker hand{}",
                    "{C:inactive}(Must have room){}",
                },
            },
            v_cry_tacclimator = {
                name = "Tarot Acclimator",
                text = {
                    "{C:tarot}Tarot{} cards appear",
                    "{C:attention}X#1#{} more frequently",
                    "in the shop",
                    "All future {C:tarot}Tarot{}",
                    "cards are {C:green}free{}",
                },
            },
            v_cry_tag_printer = {
                name = "Tag Printer",
                text = {
                    "Double Tags become",
                    "{C:attention}Quadruple Tags{} and",
                    "are {C:attention}3X{} as common",
                },
            },
            v_cry_threers = {
                name = "The 3 Rs",
                text = {
                    "Permanently",
                    "gain {C:red}+#1#{} discard(s)",
                    "each round",
                },
            },
            v_cry_stickyhand = {
                name = "Sticky Hand",
                text = {
                    "{C:attention}+#1#{} card selection limit",
                },
            },
            v_cry_grapplinghook = {
                name = "Grappling Hook",
                text = {
                    "{C:attention}+#1#{} card selection limit",
                    "{C:inactive,s:0.7}You can do a lot more with this than you think.{}",
                },
            },
            v_cry_hyperspacetether = {
                name = "Hyperspace Tether",
                text = {
                    "{C:attention}+#1#{} card selection limit",
                    "{C:inactive,s:0.7}NOTE: Will have extra functionality later{}",
                },
            },
        },
        Other = {
            banana = {
                name = "Banana",
                text = {
                    "{C:green}#1# in #2#{} chance of being",
                    "destroyed each round",
                },
            },
            cry_rigged = {
                name = "Rigged",
                text = {
                    "All {C:cry_code}listed{} probabilities",
                    "are {C:cry_code}guaranteed",
                },
            },
            cry_hooked = {
                name = "Hooked",
                text = {
                    "When this Joker is {C:cry_code}triggered{},",
                    "trigger {C:cry_code}#1#",
                },
            },
            cry_flickering = {
                name = "Flickering",
                text = {
                    "Destroyed after",
                    "{C:attention}#1#{} triggers",
                    "{C:inactive}({C:attention}#2#{C:inactive} remaining)"
                },
            },
            cry_flickering_desc = { --used by choco dice
                name = "Flickering",
                text = {
                    "Destroyed after",
                    "{C:attention}#1#{} triggers",
                },
            },
            cry_possessed = {
                name = "Possessed",
                text = {
                    "{C:attention}Disables{} and {C:attention}reverses{}",
                    "effects, if possible",
                    "Destroyed along with {C:attention}Ghost"
                },
            },
            --todo? add candy jokers to list
            food_jokers = {
                name = "Food Jokers",
                text = {
                    "{s:0.8}Gros Michel, Egg, Ice Cream, Cavendish,",
                    "{s:0.8}Turtle Bean, Diet Cola, Popcorn, Ramen,",
                    "{s:0.8}Seltzer, Pickle, Chili Pepper, Caramel,",
                    "{s:0.8}Nostalgic Candy, Fast Food M, etc.",
                },
            },
            ev_cry_choco0 = {
                name = "",
                text = {
                    "Details of an active",
                    "{C:cry_ascendant,E:1}event{} will appear here"
                }
            },
            ev_cry_choco1 = {
                name = "1: Possession",
                text = {
                    "{C:attention}Jokers{} and playing cards have a",
                    "{C:green}1 in 3{} chance of gaining Flickering",
                    "Create a {C:attention}Ghost",
                    "{C:inactive,s:0.7}You've been possessed by a ghost, and your",
                    "{C:inactive,s:0.7}consciousness is flickering in and out."
                }
            },
            ev_cry_choco2 = {
                name = "2: Haunted House",
                text = {
                    "Prevents skipping {C:attention}Blind{}",
                    "One {C:attention}reroll{} allowed per shop",
                    "{C:attention}Voucher{} prices are doubled",
                    "{C:inactive,s:0.7}Spooky spirits have taken over! Don't touch",
                    "{C:inactive,s:0.7}anything and get out as soon as possible!",
                }
            },
            ev_cry_choco3 = {
                name = "3: Witch's Brews",
                text = {
                    "Create 3 {C:attention}Potions",
                    "Use one by the end of the {C:attention}Small Blind{},",
                    "or {C:attention}all{} maluses will be applied this {C:attention}Ante",
                    "{C:inactive,s:0.7}You have been kidnapped by a witch!",
                    "{C:inactive,s:0.7}She offers you three potions, watching you closely.",
                    "{C:inactive,s:0.7}Pick one, lest she makes the decision for you.",
                }
            },
            ev_cry_choco4 = {
                name = "4: Lunar Abyss",
                text = {
                    "Played cards have a {C:green}1 in 4{} chance",
                    "to turn into a random {C:club}Club{} face card",
                    "Divide {C:attention}Mult{} by number of played face cards",
                    "{C:inactive,s:0.7}Even a man who's pure at heart",
                    "{C:inactive,s:0.7}and says his prayers by night..."
                }
            },
            ev_cry_choco5 = {
                name = "5: Bloodsucker",
                text = {
                    "Remove {C:attention}Enhancements{} from all played cards",
                    "{C:green}1 in 3{} chance to destroy",
                    "{C:heart}Heart{} and {C:diamond}Diamond{} cards",
                    "{C:inactive,s:0.7}Be wary in the dead of night, for",
                    "{C:inactive,s:0.7,E:1}they in the shadows{C:inactive,s:0.7} seek to quench their thirst..."
                }
            },
            ev_cry_choco6 = {
                name = "6: Please Take One",
                text = {
                    "At {C:attention}end of round{}, open a",
                    "random {C:attention}Booster{} Pack",
                    "{C:inactive,s:0.7}As you stroll down the streets, you spot a",
                    "{C:inactive,s:0.7}box of various Booster Packs. Might as well grab one!"
                }
            },
            ev_cry_choco7 = {
                name = "7: Festive Atmosphere",
                text = {
                    "Create 3 {C:attention}Trick-or-Treat{} and 1 {C:attention}Candy Basket",
                    "Shops have a {C:attention}Trick-or-Treat{} each round",
                    "{C:cry_candy}Candies{} give {C:money}$3{} when obtained",
                    "{C:inactive,s:0.7}The entire neighbourhood is decorated for spooky endeavours,",
                    "{C:inactive,s:0.7}come indulge in the festive atmosphere!"
                }
            },
            ev_cry_choco8 = {
                name = "8: Candy Rain",
                text = {
                    "When {C:attention}Blind{} defeated, obtain 1 {C:cry_candy}Candy{}",
                    "per hand remaining; Obtain a {C:attention}Food Joker{}",
                    "when a {C:cry_candy}Candy{} is generated",
                    "{C:inactive,s:0.7}Candies rain from the sky! Quick,",
                    "{C:inactive,s:0.7,E:1}grab as much as you can!"
                }
            },
            ev_cry_choco9 = {
                name = "9: Ghostly Riches",
                text = {
                    "Gain {C:money}$20",
                    "All {C:money}money{} earned is {C:attention}doubled",
                    "{C:inactive,s:0.7}The spectre of a long-gone relative of yours",
                    "{C:inactive,s:0.7}visits you in the middle of the night!",
                    "{C:inactive,s:0.7}Without a word, they place a bag of money in your hands,",
                    "{C:inactive,s:0.7}smile warmly, and wave as they fade into the air.",
                }
            },
            ev_cry_choco10 = {
                name = "10: Revered Antique",
                text = {
                    "A {C:legendary}Legendary{} {C:attention}Joker{} appears",
                    "in the {C:attention}Voucher{} slot for {C:money}$50",
                    "Only buyable as {C:attention}last{} item in shop",
                    "{C:inactive,s:0.7}You've attracted the attention of a relic's spirit,",
                    "{C:inactive,s:0.7}but it won't be easy to quell.",
                }
            },
            cry_https_disabled = {
                name = "M",
                text = {
                    "{C:attention,s:0.7}Updating{s:0.7} is disabled by default ({C:attention,s:0.7}HTTPS Module{s:0.7})",
                },
            },
            --i am so sorry for this
            --actually some of this needs to be refactored at some point
            cry_eternal_booster = {
                name = "Eternal",
                text = {
                    "All cards in pack",
                    "are {C:attention}Eternal{}",
                },
            },
            cry_perishable_booster = {
                name = "Perishable",
                text = {
                    "All cards in pack",
                    "are {C:attention}Perishable{}",
                },
            },
            cry_rental_booster = {
                name = "Rental",
                text = {
                    "All cards in pack",
                    "are {C:attention}Rental{}",
                },
            },
            cry_pinned_booster = {
                name = "Pinned",
                text = {
                    "All cards in pack",
                    "are {C:attention}Pinned{}",
                },
            },
            cry_banana_booster = {
                name = "Banana",
                text = {
                    "All cards in pack",
                    "are {C:attention}Banana{}",
                },
            },
            cry_eternal_voucher = {
                name = "Eternal",
                text = {
                    "Can't be traded",
                },
            },
            cry_perishable_voucher = {
                name = "Perishable",
                text = {
                    "Debuffed after",
                    "{C:attention}#1#{} rounds",
                    "{C:inactive}({C:attention}#2#{C:inactive} remaining)",
                },
            },
            cry_rental_voucher = {
                name = "Rental",
                text = {
                    "Lose {C:money}$#1#{} at",
                    "end of round",
                },
            },
            cry_pinned_voucher = {
                name = "Pinned",
                text = {
                    "Remains in shop",
                    "until redeemed",
                },
            },
            cry_banana_voucher = {
                name = "Banana",
                text = {
                    "{C:green}#1# in #2#{} chance of being",
                    "unredeemed each round",
                },
            },
            cry_perishable_consumeable = {
                name = "Perishable",
                text = {
                    "Debuffed at",
                    "end of round",
                },
            },
            cry_rental_consumeable = {
                name = "Rental",
                text = {
                    "Lose {C:money}$#1#{} at end of",
                    "round, and on use",
                },
            },
            cry_pinned_consumeable = {
                name = "Pinned",
                text = {
                    "Can't use other",
                    "non-{C:attention}Pinned{} consumables",
                },
            },
            cry_banana_consumeable = {
                name = "Banana",
                text = {
                    "{C:green}#1# in #2#{} chance to do",
                    "nothing on use",
                },
            },
            p_cry_code_normal_1 = {
                name = "Program Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2#{C:cry_code} Code{} cards",
                },
            },
            p_cry_code_normal_2 = {
                name = "Program Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2#{C:cry_code} Code{} cards",
                },
            },
            p_cry_code_jumbo_1 = {
                name = "Jumbo Program Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2#{C:cry_code} Code{} cards",
                },
            },
            p_cry_code_mega_1 = {
                name = "Mega Program Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2#{C:cry_code} Code{} cards",
                },
            },
            p_cry_empowered = {
                name = "Spectral Pack [Empowered Tag]",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2#{C:spectral} Spectral{} cards",
                    "{s:0.8,C:inactive}(Generated by Empowered Tag)",
                },
            },
            p_cry_meme_1 = {
                name = "Meme Pack",
                text = {
                    "Choose {C:attention}#1#{} of",
                    "up to {C:attention}#2# Meme Jokers{}",
                },
            },
            p_cry_meme_two = {
                name = "Meme Pack",
                text = {
                    "Choose {C:attention}#1#{} of",
                    "up to {C:attention}#2# Meme Jokers{}",
                },
            },
            p_cry_meme_three = {
                name = "Meme Pack",
                text = {
                    "Choose {C:attention}#1#{} of",
                    "up to {C:attention}#2# Meme Jokers{}",
                },
            },
            undiscovered_code = {
                name = "Not Discovered",
                text = {
                    "Purchase or use",
                    "this card in an",
                    "unseeded run to",
                    "learn what it does"
                }
            },
            undiscovered_unique = {
                name = "Not Discovered",
                text = {
                    "Purchase or use",
                    "this card in an",
                    "unseeded run to",
                    "learn what it does"
                }
            },
            cry_green_seal = {
                name = "Green Seal",
                text = {
                    "Creates a {C:cry_code}Code{} card",
                    "when played and unscoring",
                    "{C:inactive}(Must have room)",
                },
            },
            cry_azure_seal = {
                name = "Azure Seal",
                text = {
                    "Create {C:attention}#1#{} {C:dark_edition}Negative{}",
                    "{C:planet}Planets{} for played",
                    "{C:attention}poker hand{}, then",
                    "{C:red}destroy{} this card",
                },
            },
        },
        Unique = {
            c_cry_potion = {
                name = "Potion",
                text = {
                    "Applies an unknown",
                    "{C:attention}malus{} when used",
                    "{C:inactive,s:0.7}Obtained from Chocolate Die"
                }
            }
        }
    },
    misc = {
        achievement_names = {
            ach_cry_ace_in_crash = "Pocket ACE",
            ach_cry_blurred_blurred_joker = "Legally Blind",
            ach_cry_bullet_hell = "Bullet Hell",
            ach_cry_break_infinity = "Break Infinity",
            ach_cry_cryptid_the_cryptid = "Cryptid the Cryptid",
            ach_cry_exodia = "Exodia",
            ach_cry_freak_house = "Freak House",
            ach_cry_googol_play_pass = "Googol Play Pass",
            ach_cry_haxxor = "H4xx0r",
            ach_cry_home_realtor = "Home Realtor",
            ach_cry_jokes_on_you = "Joke's on You, Pal!",
            ach_cry_niw_uoy = "!niW uoY",
            ach_cry_now_the_fun_begins = "Now the Fun Begins",
            ach_cry_patience_virtue = "Patience is a Virtue",
            ach_cry_perfectly_balanced = "Perfectly Balanced",
            ach_cry_pull_request = "Pull Request",
            ach_cry_traffic_jam = "Traffic Jam",
            ach_cry_ult_full_skip = "Ultimate Full Skip",
            ach_cry_used_crash = "We Told You Not To",
            ach_cry_what_have_you_done = "WHAT HAVE YOU DONE?!",
        },
        achievement_descriptions = {
            ach_cry_ace_in_crash = 'check_for_unlock({type = "ace_in_crash"})',
            ach_cry_blurred_blurred_joker = "Obtain Blurred Blurred Joker",
            ach_cry_bullet_hell = "Have 15 AP Jokers",
            ach_cry_break_infinity = "Score 1.79e308 Chips in a single hand",
            ach_cry_cryptid_the_cryptid = "Use Cryptid on Cryptid",
            ach_cry_exodia = "Have 5 Exotic Jokers",
            ach_cry_freak_house = "Play a Flush House consisting of 6s and 9s of Hearts whilst possessing Nice",
            ach_cry_googol_play_pass = "Rig a Googol Play Card",
            ach_cry_haxxor = "Use a cheat code",
            ach_cry_home_realtor = "Activate Happy House before Ante 8 (without DoE/Antimatter)",
            ach_cry_jokes_on_you = "Trigger The Joke's effect on Ante 1 and win the run",
            ach_cry_niw_uoy = "Reach Ante -8",
            ach_cry_now_the_fun_begins = "Obtain Canvas",
            ach_cry_patience_virtue = "Wait out Lavender Loop for 2 minutes before playing first hand and beat the blind",
            ach_cry_perfectly_balanced = "Beat Very Fair Deck on Ascendant Stake",
            ach_cry_pull_request = "Have ://COMMIT spawn the same Joker that it destroyed",
            ach_cry_traffic_jam = "Beat all Rush Hour challenges",
            ach_cry_ult_full_skip = "Win in 1 round",
            ach_cry_used_crash = "Use ://CRASH",
            ach_cry_what_have_you_done = "Delete or Sacrifice an Exotic Joker",
        },
        challenge_names = {
            c_cry_ballin = "Ballin'",
            c_cry_boss_rush = "Enter the Gungeon",
            c_cry_dagger_war = "Dagger War",
            c_cry_joker_poker = "Joker Poker",
            c_cry_onlycard = "Solo Card",
            c_cry_rng = "RNG",
            c_cry_rush_hour = "Rush Hour I",
            c_cry_rush_hour_ii = "Rush Hour II",
            c_cry_rush_hour_iii = "Rush Hour III",
            c_cry_sticker_sheet = "Sticker Sheet",
            c_cry_sticker_sheet_plus = "Sticker Sheet+",
        },
        dictionary = {
            --Settings Menu
            cry_set_features = "Features",
            cry_set_music = "Music",
            cry_set_enable_features = "Select features to enable (applies on game restart):",
            cry_feat_achievements = "Achievements",
            ["cry_feat_antimatter deck"] = "Antimatter Deck",
            cry_feat_blinds = "Blinds",
            cry_feat_challenges = "Challenges",
            ["cry_feat_code cards"] = "Code Cards",
            ["cry_feat_misc. decks"] = "Misc. Decks",
            ["cry_feat_https module"] = "HTTPS Module",
            ["cry_feat_timer mechanics"] = "Timer Mechanics",
            ["cry_feat_enhanced decks"] = "Enhanced Decks",
            ["cry_feat_epic jokers"] = "Epic Jokers",
            ["cry_feat_exotic jokers"] = "Exotic Jokers",
            ["cry_feat_m jokers"] = "M Jokers",
            cry_feat_menu = "Custom Main Menu",
            ["cry_feat_misc."] = "Misc.",
            ["cry_feat_misc. jokers"] = "Misc. Jokers",
            cry_feat_planets = "Planets",
            cry_feat_jokerdisplay = "JokerDisplay (Does Nothing)",
            cry_feat_tags = "Tags",
            cry_feat_sleeves = "Sleeves",
            cry_feat_spectrals = "Spectrals",
            cry_feat_spooky = "Spooky Update",
            ["cry_feat_more stakes"] = "Stakes",
            cry_feat_vouchers = "Vouchers",
            cry_mus_jimball = "Jimball (Funkytown by Lipps Inc. - Copyrighted)",
            cry_mus_code = "Code Cards (://LETS_BREAK_THE_GAME by HexaCryonic)",
            cry_mus_exotic = "Exotic Jokers (Joker in Latin by AlexZGreat)",
            cry_mus_high_score = "High Score (Final Boss [For Your Computer] by AlexZGreat)",

            k_cry_program_pack = "Program Pack",
            k_cry_meme_pack = "Meme Pack",

            cry_critical_hit_ex = "Critical Hit!",
            cry_critical_miss_ex = "Critical Miss!",

            cry_potion1 = "-1 to all Hand Levels",
            cry_potion2 = "X1.15 Blind size",
            cry_potion3 = "-1 Hand and Discard",

            cry_debuff_oldhouse = "No Full Houses",
            cry_debuff_oldarm = "Must play 4 or fewer cards",
            cry_debuff_oldpillar = "No Straights",
            cry_debuff_oldflint = "No Flushes",
            cry_debuff_oldmark = "No hands containing a Pair",
            cry_debuff_obsidian_orb = "Applies abilities of all defeated bosses",

            k_code = "Code",
            k_unique = "Unique",
            b_code_cards = "Code Cards",
            b_unique_cards = "Unique Cards",
            b_pull = "PULL",
            cry_hooked_ex = "Hooked!",
            k_end_blind = "End Blind",

            cry_code_rank = "ENTER RANK",
            cry_code_enh = "ENTER ENHANCEMENT",
            cry_code_hand = "ENTER POKER HAND",
            cry_code_enter_card = "ENTER A CARD",
            cry_code_apply = "APPLY",
            cry_code_apply_previous = "APPLY PREVIOUS",
            cry_code_exploit = "EXPLOIT",
            cry_code_exploit_previous = "EXPLOIT PREVIOUS",
            cry_code_create = "CREATE",
            cry_code_create_previous = "CREATE PREVIOUS",
            cry_code_execute = "EXECUTE",
            cry_code_cancel = "CANCEL",

            b_flip = "FLIP",
            b_merge = "MERGE",

            cry_hand_bulwark = "Bulwark",
            cry_hand_clusterfuck = "Clusterfuck",
            cry_hand_ultpair = "Ultimate Pair",

            cry_again_q = "Again?",
            cry_curse = "Curse",
            cry_curse_ex = "Curse!",
            cry_sobbing = "Help me...",
            cry_gaming = "Gaming",
            cry_gaming_ex = "Gaming!",
            cry_sus_ex = "Impostor!",
            cry_jolly_ex = "Jolly Up!",
            cry_m_minus = "m",
            cry_m = "M",
            cry_m_ex = "M!",
            cry_minus_round = "-1 Round",
            cry_plus_cryptid = "+1 Cryptid",
            cry_no_triggers = "No triggers left!",
            cry_unredeemed = "Unredeemed...",
            cry_active = "Active",
            cry_inactive = "Inactive",

            k_disable_music = "Disable Music",

            k_cry_epic = "Epic",
            k_cry_exotic = "Exotic",
            k_cry_candy = "Candy",
            k_cry_cursed  = "Cursed",

            cry_notif_jimball_1 = "Jimball",
            cry_notif_jimball_2 = "Copyright Notice",
            cry_notif_jimball_d1 = "Jimball plays the song \"Funkytown\",",
            cry_notif_jimball_d2 = "which is copyrighted and can't be",
            cry_notif_jimball_d3 = "used for streams and videos.",
        },
        labels = {
            food_jokers = "Food Jokers",
            banana = "Banana",
            code = "Code",
            unique = "Unique",
            cry_rigged = "Rigged",
            cry_hooked = "Hooked",
            cry_flickering = "Flickering",
            cry_possessed = "Possessed",

            cry_green_seal = "Green Seal",
            cry_azure_seal = "Azure Seal",

            cry_astral = "Astral",
            cry_blur = "Blurred",
            cry_double_sided = "Double-Sided",
            cry_glass = "Fragile",
            cry_glitched = "Glitched",
            cry_gold = "Golden",
            cry_m = "Jolly",
            cry_mosaic = "Mosaic",
            cry_noisy = "Noisy",
            cry_oversat = "Oversaturated",

            k_cry_epic = "Epic",
            k_cry_exotic = "Exotic",
            k_cry_candy = "Candy",
            k_cry_cursed  = "Cursed",
        },
        rnj_loc_txts = {
            stats = {
                plus_mult = { "{C:red}+#2#{} Mult" },
                plus_chips = { "{C:blue}+#2#{} Chips" },
                x_mult = { "{X:red,C:white} X#2#{} Mult" },
                x_chips = { "{X:blue,C:white} X#2#{} Chips" },
                h_size = { "{C:attention}+#2#{} Hand Size" },
                money = { "{C:money}+$#2#{} at payout" },
            },
            stats_inactive = {
                plus_mult = { "{C:inactive}(Currently {C:red}+#1#{C:inactive} Mult)" },
                plus_chips = { "{C:inactive}(Currently {C:blue}+#1#{C:inactive} Chips)" },
                x_mult = { "{C:inactive}(Currently {X:red,C:white} X#1# {C:inactive} Mult)" },
                x_chips = { "{C:inactive}(Currently {X:blue,C:white} X#1# {C:inactive} Chips)" },
                h_size = { "{C:inactive}(Currently {C:attention}+#1#{C:inactive} Hand Size)" },
                money = { "{C:inactive}(Currently {C:money}+$#1#{C:inactive})" },
            },
            actions = {
                make_joker = { "Create {C:attention}#2# Joker{}" },
                make_tarot = { "Create {C:attention}#2#{C:tarot} Tarot{} card" },
                make_planet = { "Create {C:attention}#2#{C:planet} Planet{} card" },
                make_spectral = { "Create {C:attention}#2#{C:spectral} Spectral{} card" },
                add_dollars = { "Earn {C:money}$#2#{}" },
            },
            contexts = {
                open_booster = { "when a {C:attention}Booster{} is opened" },
                buying_card = { "when a card is bought" },
                selling_self = { "when this card is sold" },
                selling_card = { "when a card is sold" },
                reroll_shop = { "on reroll" },
                ending_shop = { "at the end of the {C:attention}shop{}" },
                skip_blind = { "when a {C:attention}blind{} is skipped" },
                skipping_booster = { "when any {C:attention}Booster Pack{} is skipped" },
                playing_card_added = { "every time a {C:attention}playing card{} is added to your deck" },
                first_hand_drawn = { "when round begins" },
                setting_blind = { "when {C:attention}Blind{} is selected" },
                remove_playing_cards = { "when a card is destroyed" },
                using_consumeable = { "when a {C:attention}consumable{} card is used" },
                debuffed_hand = { "if played {C:attention}hand{} is not allowed" },
                pre_discard = { "before each discard" },
                discard = { "for each discarded card" },
                end_of_round = { "at end of {C:attention}round{}" },
                individual_play = { "for each card scored" },
                individual_hand_score = { "for each card held in hand during scoring" },
                individual_hand_end = { "for each card held in hand at end of {C:attention}round{}" },
                repetition_play = { "Retrigger played cards" },
                repetition_hand = { "Retrigger held in hand cards" },
                other_joker = { "per {C:attention}Joker{}" },
                before = { "before each {C:attention}hand{}" },
                after = { "after each {C:attention}hand{}" },
                joker_main = {},
            },
            conds = {
                buy_common = { "if it is a {C:blue}Common{} {C:attention}Joker{}" },
                buy_uncommon = { "if it is a {C:green}Uncommon{} {C:attention}Joker{}" },
                tarot = { "if card is a {C:tarot}Tarot{} card" },
                planet = { "if card is a {C:planet}Planet{} card" },
                spectral = { "if card is a {C:spectral}Spectral{} card" },
                joker = { "if card is a {C:attention}Joker{}" },
                suit = { "if card is a {V:1}#3#{}" },
                rank = { "if card is rank {C:attention}#3#{}" },
                face = { "if card is a {C:attention}face{} card" },
                boss = { "if {C:attention}blind{} is a {C:attention}Boss {C:attention}Blind{}" },
                non_boss = { "if {C:attention}blind{} is a {C:attention}Non-Boss {C:attention}Blind{}" },
                small = { "if {C:attention}blind{} is a {C:attention}Small {C:attention}Blind{}" },
                big = { "if {C:attention}blind{} is a {C:attention}Big {C:attention}Blind{}" },
                first = { "if it's the {C:attention}first {C:attention}hand{}" },
                last = { "if it's the {C:attention}last {C:attention}hand{}" },
                common = { "if it is a {C:blue}Common{} {C:attention}Joker{}" },
                uncommon = { "if it is an {C:green}Uncommon{} {C:attention}Joker{}" },
                rare = { "if it is a {C:red}Rare{} {C:attention}Joker{}" },
                poker_hand = { "if hand is a {C:attention}#3#{}" },
                or_more = { "if hand contains {C:attention}#3#{} or more cards" },
                or_less = { "if hand contains {C:attention}#3#{} or less cards" },
                hands_left = { "if #3# {C:blue}hands{} remaining at end of round" },
                discards_left = { "if #3# {C:red}discards{} remaining at end of round" },
                first_discard = { "if it's the {C:attention}first {C:attention}discard{}" },
                last_discard = { "if it's the {C:attention}last {C:attention}discard{}" },
                odds = { "with a {C:green}#4# {C:green}in {C:green}#3#{} chance" },
            },
        },
        v_dictionary = {
            a_xchips = {"X#1# Chips"},
            a_powmult = {"^#1# Mult"},
            a_powchips = {"^#1# Chips"},
            a_powmultchips = {"^#1# Mult+Chips"},
            a_round = {"+#1# Round"},
            a_candy = {"+#1# Candy"},
            a_xchips_minus = {"-X#1# Chips"},
            a_powmult_minus = {"-^#1# Mult"},
            a_powchips_minus = {"-^#1# Chips"},
            a_powmultchips_minus = {"-^#1# Mult+Chips"},
            a_round_minus = {"-#1# Round"},

            a_tag = {"#1# Tag"},
            a_tags = {"#1# Tags"},

            cry_sticker_name = {"#1# Sticker"},
            cry_sticker_desc = {
                "Used this Joker",
                "to win on #2##1#",
                "#2#Stake#3# difficulty"
            },

            cry_art = {"Art: #1#"},
            cry_code = {"Code: #1#"},
            cry_idea = {"Idea: #1#"}
        },
        v_text = {
            ch_c_cry_all_perishable = {"All Jokers are {C:eternal}Perishable{}"},
            ch_c_cry_all_rental = {"All Jokers are {C:eternal}Rental{}"},
            ch_c_cry_all_pinned = {"All Jokers are {C:eternal}Pinned{}"},
            ch_c_cry_all_banana = {"All Jokers are {C:eternal}Banana{}"},
            ch_c_all_rnj = {"All Jokers are {C:attention}RNJoker{}"},
            ch_c_cry_sticker_sheet_plus = {"All purchasable items have all stickers"},
            ch_c_cry_rush_hour = {"All Boss Blinds are {C:attention}The Clock{} or {C:attention}Lavender Loop"},
            ch_c_cry_rush_hour_ii = {"All Blinds are {C:attention}Boss Blinds{}"},
            ch_c_cry_rush_hour_iii = {"{C:attention}The Clock{} and {C:attention}Lavender Loop{} scale {C:attention}twice{} as fast"},
            ch_c_cry_no_tags = {"Skipping is {C:attention}disabled{}"},
            ch_c_cry_no_vouchers = {"{C:attention}Vouchers{} no longer appear in the shop"},
            ch_c_cry_no_boosters = {"{C:attention}Booster Packs{} no longer appear in the shop"},
            ch_c_cry_no_rerolls = {"Rerolling is {C:attention}disabled{}"},
            ch_c_cry_no_consumables = {"{C:attention}Consumables{} no longer appear"}
        },
        -- Thanks to many members of the community for contributing to all of these quips!
        -- There's too many to credit so just go here: https://discord.com/channels/1116389027176787968/1209506360987877408/1237971471146553406
        -- And here: https://discord.com/channels/1116389027176787968/1219749193204371456/1240468252325318667
        very_fair_quips = {
            { "L", "NO VOUCHERS", "FOR YOU" },
            { "BOZO", "DID YOU THINK I WOULD", "GIVE YOU A VOUCHER?" },
            { "NOPE!", "NO VOUCHERS HERE!", "(SLUMPAGE EDITION)" },
            { "SKILL ISSUE", "IMAGINE BEING GOOD ENOUGH", "FOR A VOUCHER" },
            { "JIMBO", "FROM MANAGEMENT", "FORGOT TO RESTOCK" },
            { "OOPS!", "NO VOUCHERS", "" },
            { "YOU JOKER,", "WHY ARE YOU LOOKING", "OVER HERE? LOL" },
            { "THE VOUCHER", "IS IN", "ANOTHER CASTLE" },
            { "$0", "BLANK VOUCHER", "(GET IT?)" },
            { "ERROR", "CANNOT DO ARITHMETIC ON A NIL VALUE", "(tier4vouchers.lua)" },
            { "100% OFF", "ON ALL VOUCHERS", "(SOMEONE ALREADY BOUGHT THEM)" },
            { "TRY AGAIN LATER", "HINT: YOU WON'T HAVE", "ENOUGH MONEY ANYWAYS" },
            { "HUH?", '"VOUCHER"?', "THAT'S NOT EVEN A WORD..." },
            { 'HOLD "R"', "TO RESTOCK", "ALL VOUCHERS" },
            { "DID YOU KNOW?", "PRESSING ALT+F4", "GIVES FREE VOUCHERS!" },
            { "SORRY,", "THERE ARE NO VOUCHERS", "DUE TO BUDGET CUTS" },
            { "CALL 1-600-JIMBO", "TO RATE YOUR", "VOUCHER EXPERIENCE" },
            { "DEFEAT", "ANTE 39 BOSS BLIND", "TO RESTOCK" },
            { "MAGIC TRICK", "I MADE THIS VOUCHER", "DISAPPEAR" },
            { "WHY IS A", "VOUCHER LIKE", "A WRITING DESK?" },
            { "WE HAVE RETRACTED", "YOUR VOUCHERS, THEY WOULD BE", "BETTER USED IN OTHER RUNS" },
            { "WHY DO THEY CALL IT VOUCHER", "WHEN MULT OUT THE HOT", "IN COLD EAT EAT THE CHIP" },
            { "SORRY", "THE VOUCHERS ARE EXPERIENCING", "VOUCHIFIA ABORTUS" },
            { "UNFORTUNATELY", "THE VOUCHRX REWRITE UPDATE", "HAS BEEN CANCELLED" },
            { "DEFEAT", "BOSS BLIND", "TO CHANGE NOTHING" },
            { "BIRDS ARE SINGING", "FLOWERS ARE BLOOMING", "KIDS LIKE YOU..." },
            { "WE ARE SORRY TO SAY", "ALL VOUCHERS HAVE BEEN RECALLED", "DUE TO SALMONELLA EXPOSURE" },
            { "VOUCHERS COULDN'T ARRIVE", "DUE TO SHOP LAYOUT BEING", "200% OVERBUDGET" },
            { "YOU LIKE", "BUYING VOUCHERS, DON'T YOU", "YOU'RE A VOUCHERBUYER" },
            { "VOUCHERS", "!E", "VOUCHER POOL" },
            { "THERE", "IS NO", "VOUCHER" },
            { "THERE IS", "NO SANTA", "AND THERE ARE NO VOUCHERS" },
            { "", "VOUCHERN'T", "" },
            { "YOU", "JUST LOST", "THE GAME" },
            { "CAN I OFFER YOU", "A NICE EGG", "IN THESE TRYING TIMES?" },
            { "GO TOUCH GRASS", "INSTEAD OF USING", "THIS DECK" },
            { "YOU COULD BE", "PLAYING ON BLUE DECK", "RIGHT NOW" },
            { "FREE EXOTICS", "GET THEM BEFORE ITS", "TOO LATE (sold out)" },
            { "PROVE THEM WRONG", "BUY BUYING AN INVISIBLE", "VOUCHER FOR $10" },
            { "", "no vouchers?", "" },
            { "see this ad?", "if you are, then it's working", "and you could have it for your own" },
            { "YOU'RE MISSING OUT ON", "AT LEAST 5 VOUCHERS RIGHT NOW", "tonktonktonktonktonk" },
            { "10", "20 NO VOUCHER XD", "30 GOTO 10" },
            { "VOUCHERS", "ARE A PREMIUM FEATURE", "$199.99 JOLLARS TO UNLOCK" },
            { "TRUE VOUCHERLESS!?!?", "ASCENDANT STAKE ONLY", "VERY FAIR DECK" },
            { "ENJOYING YOUR", "VOUCHER EXPERIENCE? GIVE US A", "FIVE STAR RATING ON JESTELP" },
            { "FREE VOUCHERS", "HOT VOUCHERS NEAR YOU", "GET VOUCHERS QUICK WITH THIS ONE TRICK" },
            { "INTRODUCING", "THE VERY FIRST TIER 0 VOUCHER!", "(coming to Cryptid 1.0 soon)" },
            { "A VOUCHER!", "IT'S JUST IMAGINARY", "WE IMAGINED YOU WOULD WANT IT, THAT IS" },
            { "TURN OFF ADBLOCKER", "WITHOUT ADS, WE WOULDN'T", "BE ABLE TO SELL YOU VOUCHERS" },
            { "IF YOU HAVE", "A PROBLEM WITH THIS", "EMAIL IT TO US AT NORESPONSE@JMAIL.COM" },
            { "NOT ENOUGH MONEY", "TO BUY THIS VOUCHER", "SO WHY WOULD WE PUT IT HERE?" },
            { "WANT A VOUCHER?", "WELL SHUT UP", "YOU CAN'T HAVE ANY LOL" },
            { "^$%& NO", "VOUCHERS ^%&% %&$^% FOR", "$%&%%$ %&$&*%$^ YOU" },
            { "A VOUCHER (TRUST)", "|\\/|", "|/\\|" },
            {
                "... --- ...",
                ".--. .-.. .- -.-- . .-. -.. . -.-. --- -.. . -.. -- --- .-. ... .",
                "-.-. --- -.. . - --- ..-. .. -. -.. .- ...- --- ..- -.-. .... . .-.",
            },
            { "RUN > NEW", "STARE AT NOTHING", "FOR AN HOUR OR TWO" },
            { "WE'RE VERY SORRY", "THE LAST GUY PANIC BOUGHT", "ALL THE VOUCHERS" },
            { "HOW IT FEELS", "TO BUY NO", "VOUCHERS" },
            { "JIMBO GOT A NAT 1", "AND DUMPED ALL THE", "VOUCHERS IN A DITCH" },
            { "ATTEMPT TO INDEX", "FIELD 'VOUCHER'", "(A NIL VALUE)" },
            {
                "OH YOU REALLY THOUGHT THAT READING ALL THESE LINES WOULD BRING YOUR VOUCHERS BACK?",
                "SORRY TO TELL YOU, BUT THIS DECK DOESN'T CONTAIN THE VOUCHERS YOU SEEK.",
                "THIS ABNORMALLY LONG TEXT IS HERE AND DESIGNED TO WASTE YOUR TIME AND EFFORT WHILE YOU READ IT.",
            },
            { "GO TO", "https://youtu.be/p7YXXieghto", "FOR FREE VOUCHERS" },
        }
    }
}
