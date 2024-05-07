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
        'loc_txt',
        'applied_stakes'
    },
    inject = function(self)
        local count = #G.P_CENTER_POOLS[self.set]+1
        if self.above_stake then
          count = G.P_STAKES[self.prefix.."_"..self.above_stake].stake_level+1
        end
        self.order = count
        self.stake_level = count
        for _, v in pairs(G.P_STAKES) do
          if v.stake_level >= self.stake_level then
            v.stake_level = v.stake_level + 1
            v.order = v.stake_level
          end
        end
        G.P_STAKES[self.key] = self
        G.P_CENTER_POOLS[self.set] = {}
        for _, v in pairs(G.P_STAKES) do
          SMODS.insert_pool(G.P_CENTER_POOLS[self.set], v)
        end
        table.sort(G.P_CENTER_POOLS[self.set], function(a,b) return a.stake_level < b.stake_level end)
        G.C.STAKES = {}
        for i = 1, #G.P_CENTER_POOLS[self.set] do
            G.C.STAKES[i] = G.P_CENTER_POOLS[self.set][i].color or G.C.WHITE
        end
        if next(self.loc_txt) then
          local applied_text = "{s:0.8}Applies "
          for _, v in pairs(self.applied_stakes) do
            applied_text = applied_text .. G.P_STAKES[self.prefix.."_"..v].name .. ", "
          end
          applied_text = applied_text:sub(1, -3)
          if (applied_text == "{s:0.8}Applie") then applied_text = "{s:0.8}" end
          self.loc_txt.text[#self.loc_txt.text+1] = applied_text
        end
    end,
    process_loc_text = function(self)
      -- empty loc_txt indicates there are existing values that shouldn't be changed
      if next(self.loc_txt) then
        SMODS.process_loc_text(G.localization.descriptions[self.set], self.key, self.loc_txt)
      end
    end,
    get_obj = function(self, key) return G.P_STAKES[key] end
}

function SMODS.setup_stake(i)
  if G.P_CENTER_POOLS['Stake'][i].modifiers then
    G.P_CENTER_POOLS['Stake'][i].modifiers()
  end
  if G.P_CENTER_POOLS['Stake'][i].applied_stakes then
    for _, v in pairs(G.P_CENTER_POOLS['Stake'][i].applied_stakes) do
      SMODS.setup_stake(G.P_STAKES["stake_"..v].stake_level)
    end
  end
end

function SMODS.applied_stakes_UI(i, stake_desc_rows)
  if G.P_CENTER_POOLS['Stake'][i].applied_stakes then
    for _, v in pairs(G.P_CENTER_POOLS['Stake'][i].applied_stakes) do
      if v ~= "white" then
        local i = G.P_STAKES["stake_"..v].stake_level
        local _stake_desc = {}
        local _stake_center = G.P_CENTER_POOLS.Stake[i]
        localize{type = 'descriptions', key = _stake_center.key, set = _stake_center.set, nodes = _stake_desc}
        local _full_desc = {}
        for k, v in ipairs(_stake_desc) do
          _full_desc[#_full_desc+1] = {n=G.UIT.R, config={align = "cm"}, nodes=v}
        end
        _full_desc[#_full_desc] = nil
        stake_desc_rows[#stake_desc_rows+1] = {n=G.UIT.R, config={align = "cm"}, nodes={
          {n=G.UIT.C, config={align = 'cm'}, nodes ={{n=G.UIT.C, config={align = "cm", colour = get_stake_col(i), r = 0.1, minh = 0.35, minw = 0.35, emboss = 0.05}, nodes={}}, {n=G.UIT.B, config={w=0.1,h=0.1}}}},
          {n=G.UIT.C, config={align = "cm", padding = 0.03, colour = G.C.WHITE, r = 0.1, minh = 0.7, minw = 4.8}, nodes=_full_desc},
        }}
        SMODS.applied_stakes_UI(G.P_STAKES["stake_"..v].stake_level, stake_desc_rows)
      end
    end
  end
end

--Register vanilla stakes
G.P_CENTER_POOLS['Stake'] = {}
G.P_STAKES = {}
SMODS.Stake({
	name = "White Stake",
	key = "stake_white",
  unlocked_stake = "red",
  unlocked = true,
  applied_stakes = {},
  omit_prefix = true,
	pos = {x = 0, y = 0},
  color = G.C.WHITE,
	loc_txt = {}
}):register()
SMODS.Stake({
	name = "Red Stake",
	key = "stake_red",
  unlocked_stake = "green",
  applied_stakes = {"white"},
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
	name = "Green Stake",
	key = "stake_green",
  unlocked_stake = "black",
  applied_stakes = {"red"},
  omit_prefix = true,
	pos = {x = 2, y = 0},
  modifiers = function()
    G.GAME.modifiers.scaling = 2
  end,
  color = G.C.GREEN,
	loc_txt = {}
}):register()
SMODS.Stake({
	name = "Black Stake",
	key = "stake_black",
  unlocked_stake = "blue",
  applied_stakes = {"green"},
  omit_prefix = true,
	pos = {x = 4, y = 0},
  modifiers = function()
    G.GAME.modifiers.enable_eternals_in_shop = true
  end,
  color = G.C.BLACK,
	loc_txt = {}
}):register()
SMODS.Stake({
	name = "Blue Stake",
	key = "stake_blue",
  unlocked_stake = "purple",
  applied_stakes = {"black"},
  omit_prefix = true,
	pos = {x = 3, y = 0},
  modifiers = function()
    G.GAME.starting_params.discards = G.GAME.starting_params.discards - 1
  end,
  color = G.C.BLUE,
	loc_txt = {}
}):register()
SMODS.Stake({
	name = "Purple Stake",
	key = "stake_purple",
  unlocked_stake = "orange",
  applied_stakes = {"blue"},
  omit_prefix = true,
	pos = {x = 0, y = 1},
  modifiers = function()
    G.GAME.modifiers.scaling = 3
  end,
  color = G.C.PURPLE,
	loc_txt = {}
}):register()
SMODS.Stake({
	name = "Orange Stake",
	key = "stake_orange",
  unlocked_stake = "gold",
  applied_stakes = {"purple"},
  omit_prefix = true,
	pos = {x = 1, y = 1},
  modifiers = function()
    G.GAME.modifiers.enable_perishables_in_shop = true
  end,
  color = G.C.ORANGE,
	loc_txt = {}
}):register()
SMODS.Stake({
	name = "Gold Stake",
	key = "stake_gold",
  applied_stakes = {"orange"},
  omit_prefix = true,
	pos = {x = 2, y = 1},
  modifiers = function()
    G.GAME.modifiers.enable_rentals_in_shop = true
  end,
  color = G.C.GOLD,
  shiny = true,
	loc_txt = {}
}):register()