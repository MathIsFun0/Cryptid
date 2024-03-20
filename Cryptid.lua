--- MOD_NAME: Cryptid
--- MOD_ID: Cryptid
--- MOD_AUTHOR: [MathIsFun_, Balatro Discord]
--- MOD_DESCRIPTION: Adds unbalanced ideas to the game.

----------------------------------------------
------------MOD CODE -------------------------

_RELEASE_MODE = false

-- Allows Jokers to have custom atlases (credit to Steamodded!)
local set_spritesref = Card.set_sprites
function Card:set_sprites(_center, _front)
    set_spritesref(self, _center, _front);
    if _center then
        if _center.set then
            if (_center.set == 'Joker' or _center.consumeable or _center.set == 'Voucher') and _center.atlas then
                self.children.center.atlas = G.ASSET_ATLAS
                [(_center.atlas or (_center.set == 'Joker' or _center.consumeable or _center.set == 'Voucher') and _center.set) or 'centers']
                self.children.center:set_sprite_pos(_center.pos)
            end
        end
    end
    if _front then
        self.children.front.atlas = G.ASSET_ATLAS[_front.atlas] or
        G.ASSET_ATLAS[G.SETTINGS.colourblind_option and _front.card_atlas_high_contrast or _front.card_atlas_low_contrast] or
        G.ASSET_ATLAS["cards_" .. (G.SETTINGS.colourblind_option and 2 or 1)]
        self.children.front:set_sprite_pos(self.config.card.pos)
    end
end

-- Joker logic
local calculate_jokerref = Card.calculate_joker
function Card.calculate_joker(self, context)
        if self.ability.set == "Joker" and not self.debuff then
                if context.repetition then
                        if context.cardarea == G.play then
                                if self.ability.name == 'Iterum' then
                                        return {
                                            message = localize('k_again_ex'),
                                            repetitions = 1,
                                            card = self
                                        }
                                end
                        end
                elseif context.individual then
                        if context.cardarea == G.play then
                                if self.ability.name == 'Iterum' then
                                        return {
                                            x_mult = self.ability.extra,
                                            colour = G.C.RED,
                                            card = self
                                        }
                                end
                        end
                end
        end
        return calculate_jokerref(self, context)
end

-- UIBox garbage / Copied from LushMod. Thanks luscious!
local generate_UIBox_ability_tableref = Card.generate_UIBox_ability_table
function Card.generate_UIBox_ability_table(self)
  local card_type, hide_desc = self.ability.set or "None", nil
  local loc_vars = nil
  local main_start, main_end = nil, nil
  local no_badge = nil

  if self.config.center.unlocked == false and not self.bypass_lock then    -- For everyting that is locked
  elseif card_type == 'Undiscovered' and not self.bypass_discovery_ui then -- Any Joker or tarot/planet/voucher that is not yet discovered
  elseif self.debuff then
  elseif card_type == 'Default' or card_type == 'Enhanced' then
  elseif self.ability.set == 'Joker' then
      local customJoker = false

      if self.ability.name == 'Iterum' then
        customJoker = true
        loc_vars = {self.ability.extra}
      end

      if customJoker then
          local badges = {}
          if (card_type ~= 'Locked' and card_type ~= 'Undiscovered' and card_type ~= 'Default') or self.debuff then
              badges.card_type = card_type
          end
          if self.ability.set == 'Joker' and self.bypass_discovery_ui and (not no_badge) then
              badges.force_rarity = true
          end
          if self.edition then
              if self.edition.type == 'negative' and self.ability.consumeable then
                  badges[#badges + 1] = 'negative_consumable'
              else
                  badges[#badges + 1] = (self.edition.type == 'holo' and 'holographic' or self.edition.type)
              end
          end
          if self.seal then
              badges[#badges + 1] = string.lower(self.seal) .. '_seal'
          end
          if self.ability.eternal then
              badges[#badges + 1] = 'eternal'
          end
          if self.pinned then
              badges[#badges + 1] = 'pinned_left'
          end

          if self.sticker then
              loc_vars = loc_vars or {};
              loc_vars.sticker = self.sticker
          end

          local center = self.config.center
          return generate_card_ui(center, nil, loc_vars, card_type, badges, hide_desc, main_start, main_end)
      end
  end
  return generate_UIBox_ability_tableref(self)
end

-- Overriding Spectrals display to add more spectrals
function create_UIBox_your_collection_spectrals()
  local deck_tables = {}

  G.your_collection = {}
  for j = 1, 2 do
    G.your_collection[j] = CardArea(
      G.ROOM.T.x + 0.2*G.ROOM.T.w/2,G.ROOM.T.h,
      (5.25)*G.CARD_W,
      1*G.CARD_H, 
      {card_limit = 5, type = 'title', highlight_limit = 0, collection = true})
    table.insert(deck_tables, 
    {n=G.UIT.R, config={align = "cm", padding = 0, no_fill = true}, nodes={
      {n=G.UIT.O, config={object = G.your_collection[j]}}
    }}
    )
  end

    for j = 1, #G.your_collection do
      for i = 1, 5 do
      local center = G.P_CENTER_POOLS["Spectral"][i+(j-1)*5]
      
      local card = Card(G.your_collection[j].T.x + G.your_collection[j].T.w/2, G.your_collection[j].T.y, G.CARD_W, G.CARD_H, nil, center)
      card:start_materialize(nil, i>1 or j>1)
      G.your_collection[j]:emplace(card)
    end
  end

  local spectral_options = {}
  for i = 1, math.floor(#G.P_CENTER_POOLS.Tarot/9) do
    table.insert(spectral_options, localize('k_page')..' '..tostring(i)..'/'..tostring(math.floor(#G.P_CENTER_POOLS.Spectral/9)))
  end

  INIT_COLLECTION_CARD_ALERTS()
  
  local t = create_UIBox_generic_options({ back_func = 'your_collection', contents = {
            {n=G.UIT.R, config={align = "cm", minw = 2.5, padding = 0.1, r = 0.1, colour = G.C.BLACK, emboss = 0.05}, nodes=deck_tables},
            {n=G.UIT.R, config={align = "cm", padding = 0}, nodes={
              create_option_cycle({options = spectral_options, w = 4.5, cycle_shoulders = true, opt_callback = 'your_collection_spectral_page', focus_args = {snap_to = true, nav = 'wide'},current_option = 1, colour = G.C.RED, no_pips = true})
            }},
          }})
  return t
end
G.FUNCS.your_collection_spectral_page = function(args)
  if not args or not args.cycle_config then return end
  for j = 1, #G.your_collection do
    for i = #G.your_collection[j].cards,1, -1 do
      local c = G.your_collection[j]:remove_card(G.your_collection[j].cards[i])
      c:remove()
      c = nil
    end
  end
  
  for j = 1, #G.your_collection do
    for i = 1, 5 do
      local center = G.P_CENTER_POOLS["Spectral"][i+(j-1)*5+ (10*(args.cycle_config.current_option - 1))]
      if not center then break end
      local card = Card(G.your_collection[j].T.x + G.your_collection[j].T.w/2, G.your_collection[j].T.y, G.CARD_W, G.CARD_H, G.P_CARDS.empty, center)
      card:start_materialize(nil, i>1 or j>1)
      G.your_collection[j]:emplace(card)
    end
  end
  INIT_COLLECTION_CARD_ALERTS()
end
----------------------------------------------
------------MOD CODE END----------------------