-- Stake API
SMODS.Stakes = {}
SMODS.Stake = SMODS.GameObject:extend {
    obj_table = SMODS.Stakes,
    obj_buffer = {},
    prefix = 'stake',
    unlocked = false,
    set = 'Stake',
    required_params = {
        'name',
        'pos',
        'loc_txt'
    },
    inject = function(self)
        local count = #G.P_CENTER_POOLS[self.set]+1
        if self.above_stake then
          count = G.P_STAKES[self.above_stake].stake_level+1
          print(count)
        end
        self.order = count
        self.stake_level = count
        for _, v in pairs(G.P_STAKES) do
          if v.stake_level >= self.stake_level then
            v.stake_level = v.stake_level + 1
            v.order = v.order + 1
          end
        end
        for _, v in pairs(G.P_CENTER_POOLS[self.set]) do
          if v.stake_level >= self.stake_level then
            v.stake_level = v.stake_level + 1
            v.order = v.order + 1
          end
        end
        SMODS.insert_pool(G.P_CENTER_POOLS[self.set], self)
        table.sort(G.P_CENTER_POOLS[self.set], function(a,b) return a.stake_level < b.stake_level end)
        G.P_STAKES[self.key] = self
        G.C.STAKES = {}
        for i = 1, #G.P_CENTER_POOLS[self.set] do
            G.C.STAKES[i] = G.P_CENTER_POOLS[self.set][i].color or G.C.WHITE
        end
    end,
    process_loc_text = function(self)
      -- empty loc_txt indicates there are existing values that shouldn't be changed
      if next(self.loc_txt) then
        self.loc_txt.text[#self.loc_txt.text+1] = "{s:0.8}Applies all previous Stakes"
        SMODS.process_loc_text(G.localization.descriptions[self.set], self.key, self.loc_txt)
      end
    end,
    get_obj = function(self, key) return G.P_STAKES[key] end
}

function SMODS.setup_stakes()
  for i = 1, G.GAME.stake do
    if G.P_CENTER_POOLS['Stake'][i].modifiers then
      G.P_CENTER_POOLS['Stake'][i].modifiers()
    end
  end
end

--Register vanilla stakes
G.P_CENTER_POOLS['Stake'] = {}
G.P_STAKES = {}
SMODS.Stake({
	name = "White Chip",
	key = "stake_white",
  omit_prefix = true,
	pos = {x = 0, y = 0},
  color = G.C.WHITE,
	loc_txt = {}
}):register()
SMODS.Stake({
	name = "Red Chip",
	key = "stake_red",
  omit_prefix = true,
	pos = {x = 1, y = 0},
  modifiers = function()
    G.GAME.modifiers.no_blind_reward = G.GAME.modifiers.no_blind_reward or {}
    G.GAME.modifiers.no_blind_reward.Small = true
  end,
  color = G.C.RED,
	loc_txt = {}
}):register()
SMODS.Stake({
	name = "Green Chip",
	key = "stake_green",
  omit_prefix = true,
	pos = {x = 2, y = 0},
  modifiers = function()
    G.GAME.modifiers.scaling = 2
  end,
  color = G.C.GREEN,
	loc_txt = {}
}):register()
SMODS.Stake({
	name = "Black Chip",
	key = "stake_black",
  omit_prefix = true,
	pos = {x = 4, y = 0},
  modifiers = function()
    G.GAME.modifiers.enable_eternals_in_shop = true
  end,
  color = G.C.BLACK,
	loc_txt = {}
}):register()
SMODS.Stake({
	name = "Blue Chip",
	key = "stake_blue",
  omit_prefix = true,
	pos = {x = 3, y = 0},
  modifiers = function()
    G.GAME.starting_params.discards = G.GAME.starting_params.discards - 1
  end,
  color = G.C.BLUE,
	loc_txt = {}
}):register()
SMODS.Stake({
	name = "Purple Chip",
	key = "stake_purple",
  omit_prefix = true,
	pos = {x = 0, y = 1},
  modifiers = function()
    G.GAME.modifiers.scaling = 3
  end,
  color = G.C.PURPLE,
	loc_txt = {}
}):register()
SMODS.Stake({
	name = "Orange Chip",
	key = "stake_orange",
  omit_prefix = true,
	pos = {x = 1, y = 1},
  modifiers = function()
    G.GAME.modifiers.enable_perishables_in_shop = true
  end,
  color = G.C.ORANGE,
	loc_txt = {}
}):register()
SMODS.Stake({
	name = "Gold Chip",
	key = "stake_gold",
  omit_prefix = true,
	pos = {x = 2, y = 1},
  modifiers = function()
    G.GAME.modifiers.enable_rentals_in_shop = true
  end,
  color = G.C.GOLD,
  shiny = true,
	loc_txt = {}
}):register()