local testStake = SMODS.Stake({
	name = "Test Stake",
	key = "test",
	pos = {x = 4, y = 1},
    applied_stakes = {"blue", "blue", "blue", "cry_test2"},
	loc_txt = {
        name = 'Test Stake',
        text = {
        "Does nothing? (Test Stake 1)"
        }
    },
    color = G.C.EDITION,
    shiny = true,
})
local testStake2 = SMODS.Stake({
	name = "Test Stake 2",
	key = "test2",
    unlocked_stake = "cry_test",
    applied_stakes = {},
	pos = {x = 4, y = 1},
    above_stake = "white",
	loc_txt = {
        name = 'Test Stake 2',
        text = {
        "Does nothing? (Test Stake 2)"
        }
    },
    color = G.C.DARK_EDITION,
    shiny = true,
})


return {testStake2, testStake}