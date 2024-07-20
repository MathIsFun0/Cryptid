--- STEAMODDED HEADER
--- MOD_NAME: Cryptid
--- MOD_ID: Cryptid
--- PREFIX: cry
--- MOD_AUTHOR: [MathIsFun_, Balatro Discord]
--- MOD_DESCRIPTION: Adds unbalanced ideas to Balatro.
--- BADGE_COLOUR: 708b91
--- DEPENDENCIES: [Talisman]
--- VERSION: 0.4.3a

----------------------------------------------
------------MOD CODE -------------------------

local mod_path = ''..SMODS.current_mod.path
-- Load Options
Cryptid_config = {["Cryptid"]={jimball_music = true}}
if NFS.read(mod_path.."/config.lua") then
    Cryptid_config = STR_UNPACK(NFS.read(mod_path.."/config.lua"))
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

local cj = Card.calculate_joker
function Card:calculate_joker(context)
    local ret = cj(self, context)
    --Make every Joker return a value when triggered
    if not ret then
        if context.selling_self then
            if self.ability.name == "Luchador" then ret = {calculated = true} end
            if self.ability.name == "Diet Cola" then ret = {calculated = true} end
            if self.ability.name == 'Invisible Joker' and (self.ability.invis_rounds >= self.ability.extra) and not context.blueprint then ret = {calculated = true} end
        end
        if context.selling_card and self.ability.name == 'Campfire' and not context.blueprint then ret = {calculated = true} end
        if context.reroll_shop and self.ability.name == 'Flash Card' and not context.blueprint then ret = {calculated = true} end
        if context.ending_shop and self.ability.name == 'Perkeo' then ret = {calculated = true} end
        if context.skip_blind and self.ability.name == 'Throwback' and not context.blueprint then ret = {calculated = true} end
        if context.skipping_booster and self.ability.name == 'Red Card' and not context.blueprint then ret = {calculated = true} end
        if context.playing_card_added and not self.getting_sliced and self.ability.name == 'Hologram' and (not context.blueprint) and context.cards and context.cards[1] then ret = {calculated = true} end
        if context.first_hand_drawn and self.ability.name == 'Certificate' then ret = {calculated = true} end
        if context.setting_blind and not self.getting_sliced then
            if self.ability.name == 'Chicot' and not context.blueprint and context.blind.boss and not self.getting_sliced then ret = {calculated = true} end
            if self.ability.name == 'Madness' and not context.blueprint and not context.blind.boss then ret = {calculated = true} end
            if self.ability.name == 'Burglar' and not (context.blueprint_card or self).getting_sliced then ret = {calculated = true} end
            if self.ability.name == 'Riff-raff' and not (context.blueprint_card or self).getting_sliced and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then ret = {calculated = true} end
            if self.ability.name == 'Cartomancer' and not (context.blueprint_card or self).getting_sliced and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then ret = {calculated = true} end
            if self.ability.name == 'Ceremonial Dagger' and not context.blueprint then ret = {calculated = true} end
            if self.ability.name == 'Marble Joker' and not (context.blueprint_card or self).getting_sliced then ret = {calculated = true} end
        end
        if context.destroying_card and not context.blueprint and self.ability.name == 'Sixth Sense' and #context.full_hand == 1 and context.full_hand[1]:get_id() == 6 and G.GAME.current_round.hands_played == 0 and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then ret = {calculated = true} end
        if context.cards_destroyed then
            if self.ability.name == 'Caino' and not context.blueprint then ret = {calculated = true} end
            --todo: Glass Joker
        end
        if context.remove_playing_cards then
            if self.ability.name == 'Caino' and not context.blueprint then ret = {calculated = true} end
            --todo: Glass Joker
        end
        if context.using_consumeable then
            --todo: Glass Joker
            if self.ability.name == 'Fortune Teller' and not context.blueprint and (context.consumeable.ability.set == "Tarot") then ret = {calculated = true} end
            if self.ability.name == 'Constellation' and not context.blueprint and context.consumeable.ability.set == 'Planet' then ret = {calculated = true} end
        end
        if context.pre_discard and self.ability.name == 'Burnt Joker' and G.GAME.current_round.discards_used <= 0 and not context.hook then ret = {calculated = true} end
        if self.ability.name == 'Faceless Joker' and context.full_hand and context.other_card == context.full_hand[#context.full_hand] then
            local face_cards = 0
            for k, v in ipairs(context.full_hand) do
                if v:is_face() then face_cards = face_cards + 1 end
            end
            if face_cards >= self.ability.extra.faces then
                ret = {calculated = true}
            end
        end
    end
    --Check for retrggering jokers
    if ret and not context.retrigger_joker and not context.retrigger_joker_check then
        if type(ret) ~= 'table' then ret = {joker_repetitions = {0}} end
        ret.joker_repetitions = {0}
        for i = 1, #G.jokers.cards do
            local check = G.jokers.cards[i]:calculate_joker{retrigger_joker_check = true, other_card = self}
            if type(check) == 'table' then 
                ret.joker_repetitions[i] = check and check.repetitions and check or 0
            else
                ret.joker_repetitions[i] = 0
            end
            if G.jokers.cards[i] == self and self.edition and self.edition.retriggers then
                local old_repetitions = ret.joker_repetitions[i] ~= 0 and ret.joker_repetitions[i].repetitions or 0
                local check = calculate_blurred(self)
                if check and check.repetitions then
                    check.repetitions = check.repetitions + old_repetitions
                    ret.joker_repetitions[i] = check
                end
            end

        end
    end
    return ret
end

-- File loading based on Relic-Jokers
local files = NFS.getDirectoryItems(mod_path.."Items")
for _, file in ipairs(files) do
    print("Loading file "..file)
    local f, err = NFS.load(mod_path.."Items/"..file)
    if err then print("Error loading file: "..err) else
      local curr_obj = f()
      if Cryptid_config[curr_obj.name] == nil then Cryptid_config[curr_obj.name] = true end
      if Cryptid_config[curr_obj.name] then
          if curr_obj.init then curr_obj:init() end
          for _, item in ipairs(curr_obj.items) do
              item.discovered = true
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
  NFS.write(mod_path.."/config.lua", STR_PACK(Cryptid_config))
end

if not SpectralPack then
    SpectralPack = {}
    local ct = create_tabs
    function create_tabs(args)
        if args and args.tab_h == 7.05 then
            args.tabs[#args.tabs+1] = {
                label = "Spectral Pack",
                tab_definition_function = function() return {
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
                    nodes = SpectralPack
                } end
            }
        end
        return ct(args)
    end
  end
  SpectralPack[#SpectralPack+1] = UIBox_button{ label = {"Cryptid"}, button = "cryptidMenu", colour = G.C.DARK_EDITION, minw = 5, minh = 0.7, scale = 0.6}
  G.FUNCS.cryptidMenu = function(e)
    local tabs = create_tabs({
        snap_to_nav = true,
        tabs = {
            {
                label = "Features",
                chosen = true,
                tab_definition_function = function()
                    cry_nodes = {{n=G.UIT.R, config={align = "cm"}, nodes={
                        {n=G.UIT.O, config={object = DynaText({string = "Select features to enable (applies on game restart):", colours = {G.C.WHITE}, shadow = true, scale = 0.4})}},
                      }}}
                    left_settings = {n=G.UIT.C, config={align = "tl", padding = 0.05}, nodes={}}
                    right_settings = {n=G.UIT.C, config={align = "tl", padding = 0.05}, nodes={}}
                    for k, _ in pairs(Cryptid_config) do
                        if k ~= "Cryptid" then
                            if #right_settings.nodes < #left_settings.nodes then
                                right_settings.nodes[# right_settings.nodes+1] = create_toggle({label = k, ref_table = Cryptid_config, ref_value = k})
                            else
                                left_settings.nodes[#left_settings.nodes+1] = create_toggle({label = k, ref_table = Cryptid_config, ref_value = k})
                            end
                        end
                    end
                    config = {n=G.UIT.R, config={align = "tm", padding = 0}, nodes={left_settings,right_settings}}
                    cry_nodes[#cry_nodes+1] = config
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
                }
                end
            },
            {
                label = "Options",
                tab_definition_function = function()
                    cry_nodes = {{n=G.UIT.R, config={align = "cm"}, nodes={
                        --{n=G.UIT.O, config={object = DynaText({string = "", colours = {G.C.WHITE}, shadow = true, scale = 0.4})}},
                      }}}
                    settings = {n=G.UIT.C, config={align = "tl", padding = 0.05}, nodes={}}
                    settings.nodes[#settings.nodes+1] = create_toggle({label = "Enable Jimball Music (Copyrighted)", ref_table = Cryptid_config.Cryptid, ref_value = "jimball_music"})
                    config = {n=G.UIT.R, config={align = "tm", padding = 0}, nodes={settings}}
                    cry_nodes[#cry_nodes+1] = config
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
                }
                end
            },
        }})
    G.FUNCS.overlay_menu{
            definition = create_UIBox_generic_options({
                back_func = "options",
                contents = {tabs}
            }),
        config = {offset = {x=0,y=10}}
    }
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

  local card = Card(area and (area.T.x + area.T.w/2) or 0, area and (area.T.y) or 0, G.CARD_W*(center and center.set == 'Booster' and 1.27 or 1), G.CARD_H*(center and center.set == 'Booster' and 1.27 or 1), front, center,
  {bypass_discovery_center = area==G.shop_jokers or area == G.pack_cards or area == G.shop_vouchers or (G.shop_demo and area==G.shop_demo) or area==G.jokers or area==G.consumeables,
  bypass_discovery_ui = area==G.shop_jokers or area == G.pack_cards or area==G.shop_vouchers or (G.shop_demo and area==G.shop_demo),
  discover = area==G.jokers or area==G.consumeables, 
  bypass_back = G.GAME.selected_back.pos})
  if front and G.GAME.modifiers.cry_force_suit then card:change_suit(G.GAME.modifiers.cry_force_suit) end
  if front and G.GAME.modifiers.cry_force_enhancement then card:set_ability(G.P_CENTERS[G.GAME.modifiers.cry_force_enhancement]) end
  if front and G.GAME.modifiers.cry_force_edition then card:set_edition({[G.GAME.modifiers.cry_force_edition]=true},true,true) end
  if front and G.GAME.modifiers.cry_force_seal then card:set_seal(G.GAME.modifiers.cry_force_seal) end
  if card.ability.consumeable and not skip_materialize then card:start_materialize() end

  if card.ability.name == "cry-Cube" then card:set_eternal(true) end
  if _type == 'Joker' or (G.GAME.modifiers.cry_any_stickers and not G.GAME.modifiers.cry_sticker_sheet) then
      if G.GAME.modifiers.all_eternal then
          card:set_eternal(true)
      end
      if G.GAME.modifiers.cry_all_perishable then
          card:set_perishable(true)
      end
      if G.GAME.modifiers.cry_all_rental then
          card:set_rental(true)
      end
      if G.GAME.modifiers.cry_all_pinned then
          card.pinned = true
      end
      if G.GAME.modifiers.cry_all_banana then
          card.ability.banana = true
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
          if not G.GAME.modifiers.cry_eternal_perishable_compat and G.GAME.modifiers.enable_banana and (pseudorandom('cry_banana'..(key_append or '')..G.GAME.round_resets.ante) > 0.7) and (eternal_perishable_poll <= 0.7) then
              card.ability.banana = true
          end
          if G.GAME.modifiers.cry_eternal_perishable_compat and G.GAME.modifiers.enable_banana and (pseudorandom('cry_banana'..(key_append or '')..G.GAME.round_resets.ante) > 0.7) then
              card.ability.banana = true
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
    
	if not (card.edition and (card.edition.cry_oversat or card.edition.cry_glitched)) then
		cry_misprintize(card)
	end
  return card
end


-- Make tags fit if there's more than 13 of them
local at = add_tag
function add_tag(tag)
    at(tag)
    if #G.HUD_tags > 13 then
        for i = 2, #G.HUD_tags do
            G.HUD_tags[i].config.offset.y = 0.9-0.9*13/#G.HUD_tags
        end
    end
end

local tr = Tag.remove
function Tag:remove()
    tr(self)
    if #G.HUD_tags >= 13 then
        for i = 2, #G.HUD_tags do
            G.HUD_tags[i].config.offset.y = 0.9-0.9*13/#G.HUD_tags
        end
    end
end

local nr = new_round
function new_round()
    G.hand:change_size(0)
    nr()
end

--Redefine these here because they're always used
if not Cryptid then Cryptid = {} end
Cryptid.base_values = {}
function cry_misprintize_tbl(name, tbl, clear, override)
    if tbl then
        for k, v in pairs(tbl) do
            if type(tbl[k]) ~= 'table' then
                if type(tbl[k]) == 'number' and not (k == 'id') and not (k == 'suit_nominal') and not (k == 'x_mult' and v == 1 and not tbl.override_x_mult_check) and not (k == "selected_d6_face") then --Temp fix, even if I did clamp the number to values that wouldn't crash the game, the fact that it did get randomized means that there's a higher chance for 1 or 6 than other values
                    if not Cryptid.base_values[name] then Cryptid.base_values[name] = {} end
                    if not Cryptid.base_values[name][k] then Cryptid.base_values[name][k] = tbl[k] end
                    tbl[k] = clear and Cryptid.base_values[name][k] or cry_format(Cryptid.base_values[name][k] * cry_log_random(pseudoseed('cry_misprint'..G.GAME.round_resets.ante),override and override.min or G.GAME.modifiers.cry_misprint_min,override and override.max or G.GAME.modifiers.cry_misprint_max),"%.2g")
                end
            else
                for _k, _v in pairs(tbl[k]) do
                    if type(tbl[k][_k]) == 'number' and not (_k == 'id') and not (_k == 'suit_nominal') and not (k == 'x_mult' and v == 1 and not tbl[k].override_x_mult_check) and not (k == "selected_d6_face") then --Refer to above
                        if not Cryptid.base_values[name] then Cryptid.base_values[name] = {} end
                        if not Cryptid.base_values[name][k] then Cryptid.base_values[name][k] = {} end
                        if not Cryptid.base_values[name][k][_k] then Cryptid.base_values[name][k][_k] = tbl[k][_k] end
                        tbl[k][_k] = clear and Cryptid.base_values[name][k][_k] or cry_format(Cryptid.base_values[name][k][_k] * cry_log_random(pseudoseed('cry_misprint'..G.GAME.round_resets.ante),override and override.min or G.GAME.modifiers.cry_misprint_min,override and override.max or G.GAME.modifiers.cry_misprint_max),"%.2g")
                    end
                end
            end
        end
    end
end
function cry_misprintize_val(val, override)
   if type(val) == 'number' then
    val = cry_format(val * cry_log_random(pseudoseed('cry_misprint'..G.GAME.round_resets.ante),override and override.min or G.GAME.modifiers.cry_misprint_min,override and override.max or G.GAME.modifiers.cry_misprint_max),"%.2g")
   end 
   return val
end
function cry_deep_copy(obj, seen)
    if type(obj) ~= 'table' then return obj end
    if seen and seen[obj] then return seen[obj] end
    local s = seen or {}
    local res = setmetatable({}, getmetatable(obj))
    s[obj] = res
    for k, v in pairs(obj) do res[cry_deep_copy(k, s)] = cry_deep_copy(v, s) end
    return res
end
function cry_misprintize(card, override, force_reset)
    if (not force_reset or G.GAME.modifiers.cry_jkr_misprint_mod) and (G.GAME.modifiers.cry_misprint_min or override or card.ability.set == "Joker") then
        if card.ability.set == "Enhanced" or card.ability.set == "Default" then
            --apparently there's a better way to do this with newer APIs, will look at it later
            card.config.center = cry_deep_copy(card.config.center)
            cry_misprintize_tbl(card.config.center_key.."_conf", card.config.center.config, nil, override)
            card:set_ability(card.config.center)
            card.base.nominal = cry_misprintize_val(card.base.nominal, override)
        elseif card.ability.set == "Joker" then 
            if G.GAME.modifiers.cry_jkr_misprint_mod then
                if not override then override = {} end
                override.min = override.min or G.GAME.modifiers.cry_misprint_min or 1
                override.max = override.max or G.GAME.modifiers.cry_misprint_max or 1
                override.min = override.min * G.GAME.modifiers.cry_jkr_misprint_mod
                override.max = override.max * G.GAME.modifiers.cry_jkr_misprint_mod
            end
            if G.GAME.modifiers.cry_misprint_min or override and override.min then
                cry_misprintize_tbl(card.config.center_key, card.ability, nil, override)
            end
        else
            cry_misprintize_tbl(card.config.center_key.."_conf", G.P_CENTERS[card.config.center_key].config, nil, override)
            cry_misprintize_tbl(card.config.center_key, card.ability, true)
            for k, v in pairs(G.P_CENTERS[card.config.center_key].config) do
                card.ability[k] = cry_deep_copy(v)
            end
        end
        if G.GAME.modifiers.cry_misprint_min then
            --card.cost = cry_format(card.cost / cry_log_random(pseudoseed('cry_misprint'..G.GAME.round_resets.ante),override and override.min or G.GAME.modifiers.cry_misprint_min,override and override.max or G.GAME.modifiers.cry_misprint_max),"%.2f")
            card.misprint_cost_fac = 1 / cry_log_random(pseudoseed('cry_misprint'..G.GAME.round_resets.ante),override and override.min or G.GAME.modifiers.cry_misprint_min,override and override.max or G.GAME.modifiers.cry_misprint_max)
            card:set_cost()
        end
    else
        cry_misprintize_tbl(card.config.center_key.."_conf", G.P_CENTERS[card.config.center_key].config, true)
        cry_misprintize_tbl(card.config.center_key, card.ability, true)
    end
end
function cry_log_random(seed,min,max)
    math.randomseed(seed)
    local lmin = math.log(min,2.718281828459045)
    local lmax = math.log(max,2.718281828459045)
    local poll = math.random()*(lmax-lmin)+lmin
    return math.exp(poll)
end
function cry_format(number, str)
    return tonumber(str:format((Big and to_big(number):to_number() or number)))
end
--use ID to work with glitched/misprint
function Card:get_nominal(mod)
	local mult = 1
	local rank_mult = 1
	if mod == 'suit' then mult = 1000000 end
	if self.ability.effect == 'Stone Card' or (self.config.center.no_suit and self.config.center.no_rank) then 
		mult = -10000
	elseif self.config.center.no_suit then
		mult = 0
	elseif self.config.center.no_rank then
		rank_mult = 0
	end
	return 10*(self.base.id or 0.1)*rank_mult + self.base.suit_nominal*mult + (self.base.suit_nominal_original or 0)*0.0001*mult + 10*self.base.face_nominal*rank_mult + 0.000001*self.unique_val
end

--Cryptid (the spectral) localization
local il = init_localization
function init_localization()
    il()
    if G.SETTINGS.language == 'en-us' then
        G.localization.descriptions.Spectral.c_cryptid.text[2] = "{C:attention}#2#{} selected card"
        G.localization.descriptions.Spectral.c_talisman.text[2] = "to {C:attention}#1#{} selected"
        G.localization.descriptions.Spectral.c_trance.text[2] = "to {C:attention}#1#{} selected"
        G.localization.descriptions.Spectral.c_medium.text[2] = "to {C:attention}#1#{} selected"
        G.localization.descriptions.Spectral.c_deja_vu.text[2] = "to {C:attention}#1#{} selected"
        G.localization.misc.labels.banana = "Banana"
    end
    G.localization.misc.v_text.ch_c_cry_all_perishable = {"All Jokers are {C:eternal}Perishable{}"}
    G.localization.misc.v_text.ch_c_cry_all_rental = {"All Jokers are {C:eternal}Rental{}"}
    G.localization.misc.v_text.ch_c_cry_all_pinned = {"All Jokers are {C:eternal}Pinned{}"}
    G.localization.misc.v_text.ch_c_cry_all_banana = {"All Jokers are {C:eternal}Banana{}"}
    G.localization.misc.v_text.ch_c_cry_rush_hour = {"All Boss Blinds are {C:attention}The Clock{} or {C:attention}Lavender Loop"}
    G.localization.misc.v_text.ch_c_cry_rush_hour_ii = {"All Blinds are {C:attention}The Clock{} or {C:attention}Lavender Loop"}
    G.localization.misc.v_text.ch_c_cry_rush_hour_iii = {"{C:attention}The Clock{} and {C:attention}Lavender Loop{} scale {C:attention}twice{} as fast"}
    G.localization.misc.v_text.ch_c_cry_no_tags = {"Skipping is {C:attention}disabled{}"}
end

function SMODS.current_mod.process_loc_text()
    G.localization.descriptions.Other.banana = {
        name = "Banana",
        text = {
            "{C:green}#1# in #2#{} chance of being",
            "destroyed each round"
        },
    }
end


-- Fix a CCD-related crash
local cuc = Card.can_use_consumeable
function Card:can_use_consumeable(any_state, skip_check)
    if not self.ability.consumeable then return false end
    return cuc(self, any_state, skip_check)
end

--make this always active to prevent crashes
function cry_apply_ante_tax()
    if G.GAME.modifiers.cry_ante_tax then
        local tax = math.max(0, math.min(G.GAME.modifiers.cry_ante_tax_max, math.floor(G.GAME.modifiers.cry_ante_tax*G.GAME.dollars)))
        ease_dollars(-1*tax)
        return true
    end
    return false
end

--Stickers and modifiers used by Challenges+Stakes
SMODS.Atlas({
    key = "sticker",
    path = "sticker_cry.png",
    px = 71,
    py = 95,
    inject = function(self)
        local file_path = type(self.path) == 'table' and
            (self.path[G.SETTINGS.language] or self.path['default'] or self.path['en-us']) or self.path
        if file_path == 'DEFAULT' then return end
        -- language specific sprites override fully defined sprites only if that language is set
        if self.language and not (G.SETTINGS.language == self.language) then return end
        if not self.language and self.obj_table[('%s_%s'):format(self.key, G.SETTINGS.language)] then return end
        self.full_path = (self.mod and self.mod.path or SMODS.path) ..
            'assets/' .. G.SETTINGS.GRAPHICS.texture_scaling .. 'x/' .. file_path
        local file_data = assert(NFS.newFileData(self.full_path),
            ('Failed to collect file data for Atlas %s'):format(self.key))
        self.image_data = assert(love.image.newImageData(file_data),
            ('Failed to initialize image data for Atlas %s'):format(self.key))
        self.image = love.graphics.newImage(self.image_data,
            { mipmaps = true, dpiscale = G.SETTINGS.GRAPHICS.texture_scaling })
        G[self.atlas_table][self.key_noloc or self.key] = self
        G.shared_sticker_banana = Sprite(0, 0, G.CARD_W, G.CARD_H, G[self.atlas_table][self.key_noloc or self.key], {x = 5,y = 2})
    end
})
function Card:set_perishable(_perishable) 
    self.ability.perishable = nil
    if (self.config.center.perishable_compat or G.GAME.modifiers.cry_any_stickers) and (not self.ability.eternal or G.GAME.modifiers.cry_eternal_perishable_compat) then 
        self.ability.perishable = true
        self.ability.perish_tally = G.GAME.perishable_rounds or 5
    end
end
function Card:set_eternal(_eternal)
    self.ability.eternal = nil
    if (self.config.center.eternal_compat or G.GAME.modifiers.cry_any_stickers) and (not self.ability.perishable or G.GAME.modifiers.cry_eternal_perishable_compat) then
        self.ability.eternal = _eternal
    end
end

--Register custom rarity pools
local is = SMODS.injectItems
function SMODS.injectItems()
    local m = is()
    G.P_JOKER_RARITY_POOLS.cry_epic = {}
    G.P_JOKER_RARITY_POOLS.cry_exotic = {}
    for k, v in pairs(G.P_CENTERS) do
        v.key = k
        if v.rarity and (v.rarity == 'cry_epic' or v.rarity == 'cry_exotic') and v.set == 'Joker' and not v.demo then 
            table.insert(G.P_JOKER_RARITY_POOLS[v.rarity], v)
        end
    end
    return m
end

--Gradients based on Balatrostuck code
local upd = Game.update
Cryptid.C = {
    EXOTIC = {HEX("708b91"),HEX("1e9eba")},
    TWILIGHT = {HEX("0800ff"),HEX("aa00ff")},
    VERDANT = {HEX("00ff22"),HEX("f4ff57")},
    EMBER = {HEX("ff0000"),HEX("ffae00")},
    DAWN = {HEX("00aaff"),HEX("ff00e3")},
    HORIZON = {HEX("c8fd09"),HEX("1ee7d9")},
    BLOSSOM = {HEX("ff09da"),HEX("ffd121")},
    AZURE = {HEX("0409ff"),HEX("63dcff")},
    ASCENDANT = {HEX("2e00f5"),HEX("e5001d")},
}
function Game:update(dt)
    upd(self,dt)
    local anim_timer = self.TIMERS.REAL*1.5
    local p = 0.5*(math.sin(anim_timer)+1)
    for k, c in pairs(Cryptid.C) do
        if not G.C["CRY_"..k] then G.C["CRY_"..k] = {0,0,0,0} end
        for i = 1, 4 do
            G.C["CRY_"..k][i] = c[1][i] * p + c[2][i] * (1-p)
        end
    end
    G.C.RARITY["cry_exotic"] = G.C.CRY_EXOTIC
end

SMODS.Sound({
    key = "e_mosaic",
    path = "e_mosaic.wav"
})
SMODS.Sound({
    key = "e_glitched",
    path = "e_glitched.wav"
})
SMODS.Sound({
    key = "e_oversaturated",
    path = "e_oversaturated.wav"
})
SMODS.Sound({
    key = "e_blur",
    path = "e_blur.wav"
})
SMODS.Sound({
    key = "Xchip",
    path = "MultiplicativeChips.wav"
})
SMODS.Sound({
    key = "^Mult",
    path = "ExponentialMult.wav"
})
SMODS.Sound({
    key = "^^Mult",
    path = "TetrationalMult.wav"
})
SMODS.Sound({
    key = "music-Jimball",
    path = "music-Jimball.wav"
})
SMODS.Atlas({
    key = "modicon",
    path = "cry_icon.png",
    px = 32,
    py = 32
}):register()
SMODS.Atlas({
    key = "atlasepic",
    path = "atlasepic.png",
    px = 71,
    py = 95
}):register()
SMODS.Atlas({
    key = "atlasone",
    path = "atlasone.png",
    px = 71,
    py = 95
}):register()
SMODS.Atlas({
    key = "atlastwo",
    path = "atlastwo.png",
    px = 71,
    py = 95
}):register()
SMODS.Atlas({
    key = "tag_cry",
    path = "tag_cry.png",
    px = 34,
    py = 34
}):register()
----------------------------------------------
------------MOD CODE END----------------------
