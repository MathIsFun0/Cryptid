local sticker_sheet = {
    object_type = "Challenge",
    key = "sticker_sheet",
	rules = {
        custom = {
            {id = 'all_eternal'},
            {id = 'cry_all_perishable'},
            {id = 'cry_all_rental'},
            {id = 'cry_all_pinned'},
            {id = 'cry_all_banana'},
            {id = 'cry_eternal_perishable_compat'},
            {id = 'cry_any_stickers'},
            {id = 'cry_sticker_sheet'},
        },
        modifiers = {}
    },
    restrictions = {
        banned_cards = {},
        banned_other = {}
    },
    deck = {
        type = 'Challenge Deck',
    },
	loc_txt = "Sticker Sheet"
}
local sticker_sheet_plus = {
    object_type = "Challenge",
    key = "sticker_sheet_plus",
	rules = {
        custom = {
            {id = 'cry_sticker_sheet_plus'},
            {id = 'cry_eternal_perishable_compat'},
        },
        modifiers = {}
    },
    restrictions = {
        banned_cards = {},
        banned_other = {}
    },
    deck = {
        type = 'Challenge Deck',
    },
	loc_txt = "Sticker Sheet+"
}
local ballin = {
    object_type = "Challenge",
    loc_txt = "Ballin",
    key = "ballin",
	rules = {
        custom = {},
        modifiers = {
            {id = 'joker_slots', value = 3}
        }
    },
    jokers = {
        {id = 'j_cry_jimball',eternal=true}
    },
    deck = {
        type = 'Challenge Deck',enhancement = 'm_stone'},
    restrictions = {
        banned_cards = {
            {id = 'j_vampire'},
            {id = 'c_magician'},
	    {id = 'c_empress'},
	    {id = 'c_heirophant'},
	    {id = 'c_lovers'},
	    {id = 'c_chariot'},
	    {id = 'c_justice'},	
	    {id = 'c_devil'},
	    {id = 'c_tower'},
	    {id = 'c_familiar'},
	    {id = 'c_grim'},
	    {id = 'c_incantation'}			
        },
        banned_other = {}
    }
}
local rush_hour = {
    object_type = "Challenge",
    key = "rush_hour",
	loc_txt = "Rush Hour I",
    rules = {
        custom = {
            {id = 'cry_rush_hour'} --this just explains the rule
        },
        modifiers = {}
    },
    deck = {
        type = 'Challenge Deck',
    },
    restrictions = {
        banned_cards = {
            {id = 'j_luchador'},
            {id = 'j_chicot'}
        },
        banned_other = {}
    }
}
local rush_hour_ii = {
    object_type = "Challenge",
    key = "rush_hour_ii",
	loc_txt = "Rush Hour II",
    rules = {
        custom = {
            {id = 'cry_rush_hour'},
            {id = 'cry_rush_hour_ii'},
            {id = 'cry_no_tags'}
        },
        modifiers = {}
    },
    deck = {
        type = 'Challenge Deck',
    },
    restrictions = {
        banned_cards = {
            {id = 'j_luchador'},
            {id = 'j_chicot'},
            {id = 'j_throwback'},
            {id = 'j_diet_cola'},
            {id = 'v_directors_cut'},
            {id = 'v_retcon'},
        },
        banned_other = {}
    }
}

local rush_hour_iii = {
    object_type = "Challenge",
    key = "rush_hour_iii",
	loc_txt = "Rush Hour III",
    rules = {
        custom = {
            {id = 'cry_rush_hour'},
            {id = 'cry_rush_hour_ii'},
            {id = 'cry_rush_hour_iii'},
            {id = 'cry_no_tags'}
        },
        modifiers = {}
    },
    jokers = {
        {id = 'j_hit_the_road',eternal=true,edition='negative'}
    },
    deck = {
        type = 'Challenge Deck',
        cards = {{s='D',r='2',},{s='D',r='3',},{s='D',r='4',},{s='D',r='5',},{s='D',r='6',},{s='D',r='7',},{s='D',r='8',},{s='D',r='9',},{s='D',r='T',},{s='D',r='J',},{s='D',r='J',},{s='D',r='Q',},{s='D',r='K',},{s='D',r='A',},{s='C',r='2',},{s='C',r='3',},{s='C',r='4',},{s='C',r='5',},{s='C',r='6',},{s='C',r='7',},{s='C',r='8',},{s='C',r='9',},{s='C',r='T',},{s='C',r='J',},{s='C',r='J',},{s='C',r='Q',},{s='C',r='K',},{s='C',r='A',},{s='H',r='2',},{s='H',r='3',},{s='H',r='4',},{s='H',r='5',},{s='H',r='6',},{s='H',r='7',},{s='H',r='8',},{s='H',r='9',},{s='H',r='T',},{s='H',r='J',},{s='H',r='J',},{s='H',r='Q',},{s='H',r='K',},{s='H',r='A',},{s='S',r='2',},{s='S',r='3',},{s='S',r='4',},{s='S',r='5',},{s='S',r='6',},{s='S',r='7',},{s='S',r='8',},{s='S',r='9',},{s='S',r='T',},{s='S',r='J',},{s='S',r='J',},{s='S',r='Q',},{s='S',r='K',},{s='S',r='A',},}
    },
    restrictions = {
        banned_cards = {
            {id = 'j_luchador'},
            {id = 'j_chicot'},
            {id = 'j_throwback'},
            {id = 'j_diet_cola'},
            {id = 'v_directors_cut'},
            {id = 'v_retcon'},
        },
        banned_other = {}
    }
}
local boss_rush = {
    object_type = "Challenge",
    key = "boss_rush",
	loc_txt = "Enter the Gungeon",
    rules = {
        custom = {
            {id = 'cry_rush_hour_ii'},
            {id = 'cry_no_tags'}
        },
        modifiers = {}
    },
    jokers = {
        {id = 'j_cry_apjoker',eternal=true}
    },
    deck = {
        type = 'Challenge Deck',
    },
    restrictions = {
        banned_cards = {
            {id = 'j_luchador'},
            {id = 'j_chicot'},
            {id = 'j_throwback'},
            {id = 'j_diet_cola'},
            {id = 'v_directors_cut'},
            {id = 'v_retcon'},
        },
        banned_other = {}
    }
}
local rng = {
    object_type = "Challenge",
    key = "rng",
	loc_txt = "RNG",
    rules = {
        custom = {
            {id = 'all_rnj'}
        },
        modifiers = {}
    },
    jokers = {
    },
    deck = {
        type = 'Challenge Deck',
    },
    restrictions = {
	banned_tags = {},
        banned_cards = {},
        banned_other = {}
    }
}
local dagger_war = {
    object_type = "Challenge",
    key = "dagger_war",
    rules = {
        custom = {},
        modifiers = {}
    },
    restrictions = {
        banned_cards = {},
        banned_other = {}
    },
    jokers = {
	{id = 'j_cry_cryptidmoment',edition = 'negative'},
	{id = 'j_cry_cryptidmoment',edition = 'negative'},
        {id = 'j_gift',edition = 'negative'},
        {id = 'j_gift',edition = 'negative'},
	{id = 'j_ceremonial',eternal=true},
        {id = 'j_cry_unjust_dagger',eternal=true},
        {id = 'j_cry_monkey_dagger',eternal=true},
        {id = 'j_cry_pirate_dagger',eternal=true},
    },
    deck = {
        type = 'Challenge Deck'
    },
    loc_txt = "Dagger War"
}
--Add banned cards when specific features are enabled here
if Cryptid.enabled["Misc."] then
    ballin.restrictions.banned_cards[#ballin.restrictions.banned_cards+1] = {id = 'c_cry_eclipse'}
    rng.restrictions.banned_tags[#rng.restrictions.banned_tags+1] = {id = 'tag_cry_schematic'}
end
if Cryptid.enabled["Misc. Jokers"] then
    rush_hour_ii.restrictions.banned_cards[#rush_hour_ii.restrictions.banned_cards+1] = {id = 'j_cry_pickle'}
    rush_hour_iii.restrictions.banned_cards[#rush_hour_iii.restrictions.banned_cards+1] = {id = 'j_cry_pickle'}
    boss_rush.restrictions.banned_cards[#boss_rush.restrictions.banned_cards+1] = {id = 'j_cry_pickle'}
end
if Cryptid.enabled["Code Cards"] then
    ballin.restrictions.banned_cards[#ballin.restrictions.banned_cards+1] = {id = 'c_cry_class'}
    rng.restrictions.banned_cards[#rng.restrictions.banned_cards+1] = {id = 'c_cry_delete'}
    rng.restrictions.banned_cards[#rng.restrictions.banned_cards+1] = {id = 'c_cry_spaghetti'}
    rng.restrictions.banned_cards[#rng.restrictions.banned_cards+1] = {id = 'c_cry_pointer'}
end
if Cryptid.enabled["Spectrals"] then
    sticker_sheet.restrictions.banned_cards[#sticker_sheet.restrictions.banned_cards+1] = {id = 'c_cry_lock'}
    sticker_sheet_plus.restrictions.banned_cards[#sticker_sheet_plus.restrictions.banned_cards+1] = {id = 'c_cry_lock'}
    dagger_war.restrictions.banned_cards[#dagger_war.restrictions.banned_cards+1] = {id = 'c_cry_lock'}
end
if Cryptid.enabled["Vouchers"] then
    rush_hour_ii.restrictions.banned_cards[#rush_hour_ii.restrictions.banned_cards+1] = {id = 'v_cry_copies'}
    rush_hour_iii.restrictions.banned_cards[#rush_hour_iii.restrictions.banned_cards+1] = {id = 'v_cry_copies'}
    boss_rush.restrictions.banned_cards[#boss_rush.restrictions.banned_cards+1] = {id = 'v_cry_copies'}
    rush_hour_ii.restrictions.banned_cards[#rush_hour_ii.restrictions.banned_cards+1] = {id = 'v_cry_tag_printer'}
    rush_hour_iii.restrictions.banned_cards[#rush_hour_iii.restrictions.banned_cards+1] = {id = 'v_cry_tag_printer'}
    boss_rush.restrictions.banned_cards[#boss_rush.restrictions.banned_cards+1] = {id = 'v_cry_tag_printer'}
    rush_hour_ii.restrictions.banned_cards[#rush_hour_ii.restrictions.banned_cards+1] = {id = 'v_cry_clone_machine'}
    rush_hour_iii.restrictions.banned_cards[#rush_hour_iii.restrictions.banned_cards+1] = {id = 'v_cry_clone_machine'}
    boss_rush.restrictions.banned_cards[#boss_rush.restrictions.banned_cards+1] = {id = 'v_cry_clone_machine'}
end
--end of banned cards
local challenges = {sticker_sheet, sticker_sheet_plus}
if Cryptid.enabled["Misc. Jokers"] then 
    challenges[#challenges+1] = ballin 
    challenges[#challenges+1] = boss_rush
    challenges[#challenges+1] = rng
    challenges[#challenges+1] = dagger_war
end
if Cryptid.enabled["Blinds"] and Cryptid.enabled["Timer Mechanics"] then
    challenges[#challenges+1] = rush_hour
    challenges[#challenges+1] = rush_hour_ii
    challenges[#challenges+1] = rush_hour_iii
end

for k, v in pairs(G.P_CENTERS) do
    if v.set == "Joker" then
        if not v.perishable_compat or not v.eternal_compat then
            sticker_sheet.restrictions.banned_cards[#sticker_sheet.restrictions.banned_cards+1] = {id = k}
            sticker_sheet_plus.restrictions.banned_cards[#sticker_sheet_plus.restrictions.banned_cards+1] = {id = k}
        end
    end
end

return {name = "Challenges", 
        init = function()
        end,
        items = challenges}
