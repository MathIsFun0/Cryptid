local pink = SMODS.Stake({
	name = "Pink Stake",
	key = "pink",
	pos = {x = 0, y = 0},
    atlas = "stake",
    applied_stakes = {"gold"},
	loc_txt = {
        name = "Pink Stake",
        text = {
        "Required score scales",
        "faster for each {C:attention}Ante",
        "{s:0.8,C:inactive}(Not yet implemented){}"
        }
    },
    color = HEX("ff5ee6")
})
local brown = SMODS.Stake({
	name = "Brown Stake",
	key = "brown",
	pos = {x = 1, y = 0},
    atlas = "stake",
    applied_stakes = {"cry_pink"},
	loc_txt = {
        name = "Brown Stake",
        text = {
        "All {C:attention}stickers{} are compatible",
        "with each other",
        "{s:0.8,C:inactive}(Not yet implemented){}"
        }
    },
    color = HEX("883200")
})
local yellow = SMODS.Stake({
	name = "Yellow Stake",
	key = "yellow",
	pos = {x = 2, y = 0},
    atlas = "stake",
    applied_stakes = {"cry_brown"},
	loc_txt = {
        name = "Yellow Stake",
        text = {
        "{C:attention}Stickers{} can appear on",
        "all purchasable items",
        "{s:0.8,C:inactive}(Not yet implemented){}",
        }
    },
    color = HEX("f7ff1f")
})
local silver = SMODS.Stake({
	name = "Silver Stake",
	key = "silver",
	pos = {x = 3, y = 0},
    atlas = "stake",
    applied_stakes = {"cry_yellow"},
	loc_txt = {
        name = "Silver Stake",
        text = {
        "{C:attention}Final{} Boss Blinds can appear",
        "after Ante 4",
        "{s:0.8,C:inactive}(Not yet implemented){}",
        }
    },
    shiny = true,
    color = HEX("bbbbbb")
})
local cyan = SMODS.Stake({
	name = "Cyan Stake",
	key = "cyan",
	pos = {x = 4, y = 0},
    atlas = "stake",
    applied_stakes = {"cry_silver"},
	loc_txt = {
        name = "Cyan Stake",
        text = {
        "{C:green}Uncommon{} and {C:red}Rare{} Jokers are",
        "less likely to appear",
        "{s:0.8,C:inactive}(Not yet implemented){}",
        }
    },
    color = HEX("39ffcc")
})
local gray = SMODS.Stake({
	name = "Gray Stake",
	key = "gray",
	pos = {x = 0, y = 1},
    atlas = "stake",
    applied_stakes = {"cry_cyan"},
	loc_txt = {
        name = "Gray Stake",
        text = {
        "Rerolls increase by {C:attention}$2{} each",
        "{s:0.8,C:inactive}(Not yet implemented){}",
        }
    },
    color = HEX("999999")
})
local crimson = SMODS.Stake({
	name = "Crimson Stake",
	key = "crimson",
	pos = {x = 1, y = 1},
    atlas = "stake",
    applied_stakes = {"cry_gray"},
	loc_txt = {
        name = "Crimson Stake",
        text = {
        "Vouchers restock every {C:attention}2{} Antes",
        "{s:0.8,C:inactive}(Not yet implemented){}",
        }
    },
    color = HEX("800000")
})
local diamond = SMODS.Stake({
	name = "Diamond Stake",
	key = "diamond",
	pos = {x = 2, y = 1},
    atlas = "stake",
    applied_stakes = {"cry_crimson"},
	loc_txt = {
        name = "Diamond Stake",
        text = {
        "Must beat Ante {C:attention}10{} to win",
        "{s:0.8,C:inactive}(Not yet implemented){}",
        }
    },
    shiny = true,
    color = HEX("88e5d9")
})

local stake_atlas = SMODS.Sprite({
    key = "stake",
    atlas = "asset_atlas",
    path = "stake_cry.png",
    px = 29,
    py = 29
})

return {stake_atlas, pink, brown, yellow, silver, cyan, gray, crimson, diamond}