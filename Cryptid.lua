--- STEAMODDED HEADER
--- MOD_NAME: Cryptid
--- MOD_ID: Cryptid
--- PREFIX: cry
--- MOD_AUTHOR: [MathIsFun_, Balatro Discord]
--- MOD_DESCRIPTION: Adds unbalanced ideas to Balatro.
--- BADGE_COLOUR: 708b91
--- DEPENDENCIES: [Talisman]

----------------------------------------------
------------MOD CODE -------------------------

local mod_path = ''..SMODS.current_mod.path

-- Load Options
local config_file = {}
if NFS.read(mod_path.."/config.lua") then
    config_file = STR_UNPACK(NFS.read(mod_path.."/config.lua"))
    print(NFS.read(mod_path.."/config.lua"))
end

-- Custom Rarity setup (based on Relic-Jokers)
Game:set_globals()
G.C.RARITY["cry_exotic"] = HEX("708b91");
G.C.RARITY["cry_epic"] = HEX("571d91");
local ip = SMODS.insert_pool
function SMODS.insert_pool(pool, center, replace)
    if pool == nil then pool = {} end
    ip(pool, center, replace)
end
local get_badge_colourref = get_badge_colour
function get_badge_colour(key)
    local fromRef = get_badge_colourref(key)
    if key == 'cry_exotic' then return G.C.RARITY["cry_exotic"] end
    if key == 'cry_epic' then return G.C.RARITY["cry_epic"] end
    return fromRef
end

-- Midground sprites
local set_spritesref = Card.set_sprites
function Card:set_sprites(_center, _front)
    set_spritesref(self, _center, _front);
    if _center and _center.name == 'cry-Gateway' then
        self.children.floating_sprite = Sprite(self.T.x, self.T.y, self.T.w, self.T.h, G.ASSET_ATLAS[_center.atlas or _center.set], {x=2,y=0})
        self.children.floating_sprite.role.draw_major = self
        self.children.floating_sprite.states.hover.can = false
        self.children.floating_sprite.states.click.can = false
        self.children.floating_sprite2 = Sprite(self.T.x, self.T.y, self.T.w, self.T.h, G.ASSET_ATLAS[_center.atlas or _center.set], {x=1,y=0})
        self.children.floating_sprite2.role.draw_major = self
        self.children.floating_sprite2.states.hover.can = false
        self.children.floating_sprite2.states.click.can = false
    end
    if _center and _center.soul_pos and _center.soul_pos.extra then
        self.children.floating_sprite2 = Sprite(self.T.x, self.T.y, self.T.w, self.T.h, G.ASSET_ATLAS[_center.atlas or _center.set], _center.soul_pos.extra)
        self.children.floating_sprite2.role.draw_major = self
        self.children.floating_sprite2.states.hover.can = false
        self.children.floating_sprite2.states.click.can = false
    end
end

-- Joker Trigger Function
function cry_trigger_joker(joker, context)
  if not context.retrigger_joker then context.retrigger_joker = 0 end
  context.retrigger_joker = context.retrigger_joker + 1
  if context.retrigger_joker >= 1000 then return end
  local text,disp_text,poker_hands,scoring_hand,non_loc_disp_text = G.FUNCS.get_poker_hand_info(G.play.cards)
  local effects = eval_card(joker, context)
  local percent = 0.3
  local percent_delta = 0.08
  if effects.jokers then 
    local extras = {mult = false, hand_chips = false}
    if effects.jokers.mult_mod then mult = mod_mult(mult + effects.jokers.mult_mod);extras.mult = true end
    if effects.jokers.chip_mod then hand_chips = mod_chips(hand_chips + effects.jokers.chip_mod);extras.hand_chips = true end
    if effects.jokers.Xmult_mod then mult = mod_mult(mult*effects.jokers.Xmult_mod);extras.mult = true  end
    if effects.jokers.pow_mult_mod then mult = mod_mult(mult^effects.jokers.pow_mult_mod);extras.mult = true  end
    update_hand_text({delay = 0}, {chips = extras.hand_chips and hand_chips, mult = extras.mult and mult})
    card_eval_status_text(joker, 'jokers', nil, percent, nil, effects.jokers)
    if effects.jokers.Xmult_mod and effects.jokers.Xmult_mod ~= 1 and next(find_joker("cry-Exponentia")) then
      for _, v in pairs(find_joker("cry-Exponentia")) do
          v.ability.extra.pow_mult = v.ability.extra.pow_mult + v.ability.extra.pow_mult_mod
          card_eval_status_text(v, 'extra', nil, nil, nil, {message = "^"..v.ability.extra.pow_mult.." Mult"})
      end
    end
    percent = percent+percent_delta
  end
end

-- File loading based on Relic-Jokers
local files = NFS.getDirectoryItems(mod_path.."Items")
for _, file in ipairs(files) do
    print("Loading file "..file)
    local f, err = NFS.load(mod_path.."Items/"..file)
    if err then print("Error loading file: "..err) else
      local curr_obj = f()
      if config_file[curr_obj.name] == nil then config_file[curr_obj.name] = true end
      if config_file[curr_obj.name] then
          if curr_obj.init then curr_obj:init() end
          for _, item in ipairs(curr_obj.items) do
              if SMODS[item.object_type] then
                SMODS[item.object_type](item)
              else
                print("Error loading item "..item.key.." of unknown type "..item.object_type)
              end
          end
      end
    end
end

local G_FUNCS_options_ref = G.FUNCS.options
G.FUNCS.options = function(e)
  G_FUNCS_options_ref(e)
  NFS.write(mod_path.."/config.lua", STR_PACK(config_file))
end

function create_UIBox_settings()
    local tabs = {}
    tabs[#tabs+1] = {
      label = localize('b_set_game'),
      chosen = true,
      tab_definition_function = G.UIDEF.settings_tab,
      tab_definition_function_args = 'Game'
    }
    if G.F_VIDEO_SETTINGS then   tabs[#tabs+1] = {
        label = localize('b_set_video'),
        tab_definition_function = G.UIDEF.settings_tab,
        tab_definition_function_args = 'Video'
      }
    end
    tabs[#tabs+1] = {
      label = localize('b_set_graphics'),
      tab_definition_function = G.UIDEF.settings_tab,
      tab_definition_function_args = 'Graphics'
    }
    tabs[#tabs+1] = {
      label = localize('b_set_audio'),
      tab_definition_function = G.UIDEF.settings_tab,
      tab_definition_function_args = 'Audio'
    }
    tabs[#tabs+1] = {
    label = "Cryptid",
    tab_definition_function = function()
        cry_nodes = {{n=G.UIT.R, config={align = "cm"}, nodes={
            {n=G.UIT.O, config={object = DynaText({string = "Select features to enable (applies on game restart):", colours = {G.C.WHITE}, shadow = true, scale = 0.4})}},
          }}}
        for k, _ in pairs(config_file) do
            cry_nodes[#cry_nodes+1] = create_toggle({label = k, ref_table = config_file, ref_value = k})
        end
        return {
        n = G.UIT.ROOT,
        config = {
            emboss = 0.05,
            minh = 6,
            r = 0.1,
            minw = 10,
            align = "cm",
            padding = 0.2,
            colour = G.C.BLACK
        },
        nodes = cry_nodes
    }end
    }
  
    local t = create_UIBox_generic_options({back_func = 'options',contents = {create_tabs(
      {tabs = tabs,
      tab_h = 7.05,
      tab_alignment = 'tm',
      snap_to_nav = true}
      )}})
    return t
  end

-- We're modifying so much of this for Brown and Yellow Stake, Equilibrium Deck, etc. that it's fine to override...
function create_card(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
  local area = area or G.jokers
  local center = G.P_CENTERS.b_red
      

  --should pool be skipped with a forced key
  if not forced_key and soulable and (not G.GAME.banned_keys['c_soul']) then
      for _, v in ipairs(SMODS.Consumable.legendaries) do
          if (_type == v.type.key or _type == v.soul_set) and not (G.GAME.used_jokers[v.key] and not next(find_joker("Showman")) and not v.can_repeat_soul) then
              if pseudorandom('soul_'..v.key.._type..G.GAME.round_resets.ante) > (1 - v.soul_rate) then
                  forced_key = v.key
              end
          end
      end
          if (_type == 'Tarot' or _type == 'Spectral' or _type == 'Tarot_Planet') and
      not (G.GAME.used_jokers['c_soul'] and not next(find_joker("Showman")))  then
          if pseudorandom('soul_'.._type..G.GAME.round_resets.ante) > 0.997 then
              forced_key = 'c_soul'
          end
      end
      if (_type == 'Planet' or _type == 'Spectral') and
      not (G.GAME.used_jokers['c_black_hole'] and not next(find_joker("Showman")))  then 
          if pseudorandom('soul_'.._type..G.GAME.round_resets.ante) > 0.997 then
              forced_key = 'c_black_hole'
          end
      end
  end

  if _type == 'Base' then 
      forced_key = 'c_base'
  end



  if forced_key and not G.GAME.banned_keys[forced_key] then 
      center = G.P_CENTERS[forced_key]
      _type = (center.set ~= 'Default' and center.set or _type)
  else
      local _pool, _pool_key = get_current_pool(_type, _rarity, legendary, key_append)
      center = pseudorandom_element(_pool, pseudoseed(_pool_key))
      local it = 1
      while center == 'UNAVAILABLE' do
          it = it + 1
          center = pseudorandom_element(_pool, pseudoseed(_pool_key..'_resample'..it))
      end

      center = G.P_CENTERS[center]
  end

  local front = ((_type=='Base' or _type == 'Enhanced') and pseudorandom_element(G.P_CARDS, pseudoseed('front'..(key_append or '')..G.GAME.round_resets.ante))) or nil

  local card = Card(area.T.x + area.T.w/2, area.T.y, G.CARD_W*(center and center.set == 'Booster' and 1.27 or 1), G.CARD_H*(center and center.set == 'Booster' and 1.27 or 1), front, center,
  {bypass_discovery_center = area==G.shop_jokers or area == G.pack_cards or area == G.shop_vouchers or (G.shop_demo and area==G.shop_demo) or area==G.jokers or area==G.consumeables,
  bypass_discovery_ui = area==G.shop_jokers or area == G.pack_cards or area==G.shop_vouchers or (G.shop_demo and area==G.shop_demo),
  discover = area==G.jokers or area==G.consumeables, 
  bypass_back = G.GAME.selected_back.pos})
  if card.ability.consumeable and not skip_materialize then card:start_materialize() end

  if _type == 'Joker' or G.GAME.modifiers.cry_any_stickers then
      if G.GAME.modifiers.all_eternal then
          card:set_eternal(true)
      end
      if (area == G.shop_jokers) or (area == G.pack_cards) then 
          local eternal_perishable_poll = pseudorandom('cry_et'..(key_append or '')..G.GAME.round_resets.ante)
          if G.GAME.modifiers.enable_eternals_in_shop and eternal_perishable_poll > 0.7 then
              card:set_eternal(true)
          end
          if G.GAME.modifiers.enable_perishables_in_shop then
              if not G.GAME.modifiers.cry_eternal_perishable_compat and ((eternal_perishable_poll > 0.4) and (eternal_perishable_poll <= 0.7)) then
                  card:set_perishable(true)
              end
              if G.GAME.modifiers.cry_eternal_perishable_compat and pseudorandom('cry_per'..(key_append or '')..G.GAME.round_resets.ante) > 0.7 then
                  card:set_perishable(true)
              end
          end
          if G.GAME.modifiers.enable_rentals_in_shop and pseudorandom('cry_ssjr'..(key_append or '')..G.GAME.round_resets.ante) > 0.7 then
              card:set_rental(true)
          end
          if G.GAME.modifiers.cry_enable_pinned_in_shop and pseudorandom('cry_pin'..(key_append or '')..G.GAME.round_resets.ante) > 0.7 then
              card.pinned = true
          end
          if G.GAME.modifiers.cry_enable_flipped_in_shop and pseudorandom('cry_flip'..(key_append or '')..G.GAME.round_resets.ante) > 0.7 then
              card.cry_flipped = true
          end
      end
      if _type == 'Joker' then
          local edition = poll_edition('edi'..(key_append or '')..G.GAME.round_resets.ante)
          card:set_edition(edition)
          check_for_unlock({type = 'have_edition'})
      end
  end
  return card
end

SMODS.Atlas({
    key = "modicon",
    path = "cry_icon.png",
    px = 32,
    py = 32
}):register()
----------------------------------------------
------------MOD CODE END----------------------