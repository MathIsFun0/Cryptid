local sticker_sheet = {
    object_type = "Challenge",
    key = "sticker_sheet",
	rules = {
        custom = {
            {id = 'all_eternal'},
            {id = 'cry_all_perishable'},
            {id = 'cry_all_rental'},
            {id = 'cry_all_pinned'},
            {id = 'cry_eternal_perishable_compat'},
            {id = 'cry_any_stickers'},
        },
        modifiers = {}
    },
	loc_txt = "Sticker Sheet"
}
local ballin = {
    object_type = "Challenge",
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
    deck = {enhancement = 'm_stone'},
	loc_txt = "Ballin'"
}
local rush_hour = {
    object_type = "Challenge",
    key = "rush_hour",
	loc_txt = "Rush Hour",
    rules = {
        custom = {
            {id = 'cry_rush_hour'} --this just explains the rule
        },
        modifiers = {}
    },
    restrictions = {
        banned_other = {}
    }
}

return {name = "Challenges", 
        init = function()
        end,
        items = {sticker_sheet, ballin, rush_hour}}