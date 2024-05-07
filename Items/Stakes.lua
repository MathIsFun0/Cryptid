local testStake = SMODS.Stake({
	name = "Test Stake",
	key = "test",
	pos = {x = 4, y = 1},
	loc_txt = {
        name = 'Test Stake',
        text = {
        "Does nothing?"
        }
    },
    color = G.C.EDITION,
    shiny = true,
})
local testStake2 = SMODS.Stake({
	name = "Test Stake 2",
	key = "test2",
	pos = {x = 4, y = 1},
    above_stake = "stake_white",
	loc_txt = {
        name = 'Test Stake 2',
        text = {
        "Does nothing?"
        }
    },
    color = G.C.EDITION_DARK,
    shiny = true,
})


return {testStake, testStake2}