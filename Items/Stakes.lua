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
local amber = SMODS.Stake({
	name = "Amber Stake",
	key = "amber",
	pos = {x = 3, y = 1},
    atlas = "stake",
    applied_stakes = {"cry_diamond"},
	loc_txt = {
        name = "Amber Stake",
        text = {
        "{C:attention}-1{} Booster Pack slot",
        "{s:0.8,C:inactive}(Not yet implemented){}",
        }
    },
    shiny = true,
    color = HEX("feb900")
})
local bronze = SMODS.Stake({
	name = "Bronze Stake",
	key = "bronze",
	pos = {x = 4, y = 1},
    atlas = "stake",
    applied_stakes = {"cry_amber"},
	loc_txt = {
        name = "Bronze Stake",
        text = {
        "Vouchers are {C:attention}50%{} more expensive",
        "{s:0.8,C:inactive}(Not yet implemented){}",
        }
    },
    shiny = true,
    color = HEX("d27c37")
})
local quartz = SMODS.Stake({
	name = "Quartz Stake",
	key = "quartz",
	pos = {x = 0, y = 2},
    atlas = "stake",
    applied_stakes = {"cry_bronze"},
	loc_txt = {
        name = "Quartz Stake",
        text = {
        "Jokers can be {C:attention}Pinned{}",
        "{s:0.8,C:inactive}(Stays pinned to the leftmost position){}",
        "{s:0.8,C:inactive}(Not yet implemented){}",
        }
    },
    shiny = true,
    color = HEX("e8e8e8")
})
local ruby = SMODS.Stake({
	name = "Ruby Stake",
	key = "ruby",
	pos = {x = 1, y = 2},
    atlas = "stake",
    applied_stakes = {"cry_quartz"},
	loc_txt = {
        name = "Ruby Stake",
        text = {
        "{C:attention}Big{} Blinds can become",
        "{C:attention}Boss{} Blinds",
        "{s:0.8,C:inactive}(Not yet implemented){}",
        }
    },
    shiny = true,
    color = HEX("fc5f55")
})
local topaz = SMODS.Stake({
	name = "Topaz Stake",
	key = "topaz",
	pos = {x = 2, y = 2},
    atlas = "stake",
    applied_stakes = {"cry_ruby"},
	loc_txt = {
        name = "Topaz Stake",
        text = {
        "Blind rewards decreased by {C:attention}$2{}",
        "{s:0.8,C:inactive}(Not yet implemented){}",
        }
    },
    shiny = true,
    color = HEX("fcbb63")
})
local sapphire = SMODS.Stake({
	name = "Sapphire Stake",
	key = "sapphire",
	pos = {x = 3, y = 2},
    atlas = "stake",
    applied_stakes = {"cry_topaz"},
	loc_txt = {
        name = "Sapphire Stake",
        text = {
        "Lose {C:attention}25%{} of current money",
        "at end of Ante",
        "{s:0.8,C:inactive}(Up to $10){}",
        "{s:0.8,C:inactive}(Not yet implemented){}",
        }
    },
    shiny = true,
    color = HEX("3551fc")
})
local emerald = SMODS.Stake({
	name = "Emerald Stake",
	key = "emerald",
	pos = {x = 4, y = 2},
    atlas = "stake",
    applied_stakes = {"cry_sapphire"},
	loc_txt = {
        name = "Emerald Stake",
        text = {
        "Cards, packs, and vouchers",
        "can be {C:attention}face down{}",
        "{s:0.8,C:inactive}(Unable to be viewed until purchased){}",
        "{s:0.8,C:inactive}(Not yet implemented){}",
        }
    },
    shiny = true,
    color = HEX("06fc2c")
})
local platinum = SMODS.Stake({
	name = "Platinum Stake",
	key = "platinum",
	pos = {x = 0, y = 3},
    atlas = "stake",
    applied_stakes = {"cry_emerald"},
	loc_txt = {
        name = "Platinum Stake",
        text = {
        "Small Blinds are {C:attention}removed{}",
        "{s:0.8,C:inactive}(Not yet implemented){}",
        }
    },
    shiny = true,
    color = HEX("b0f6ff")
})

local stake_atlas = SMODS.Sprite({
    key = "stake",
    atlas = "asset_atlas",
    path = "stake_cry.png",
    px = 29,
    py = 29
})

return {stake_atlas, pink, brown, yellow, silver, cyan, gray, crimson, diamond,
        amber, bronze, quartz, ruby, topaz, sapphire, emerald, platinum}