--- STEAMODDED HEADER
--- MOD_NAME: Cryptid
--- MOD_ID: Cryptid
--- PREFIX: cry
--- MOD_AUTHOR: [MathIsFun_, Balatro Discord]
--- MOD_DESCRIPTION: Adds unbalanced ideas to Balatro.
--- BADGE_COLOUR: 708b91
--- DEPENDENCIES: [Talisman]
--- VERSION: 0.4.3d

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

function cry_debuff_voucher(center)	-- sorry for all the mess here... 
                local center_table = {
                    name = center and center.name,
                    extra = center and center.config.extra
                }
                local obj = center or self.config.center
                if center_table.name == 'Overstock' or center_table.name == 'Overstock Plus' then
                    G.E_MANAGER:add_event(Event({func = function()
                        change_shop_size(-1)
                        return true end }))
                end
                if center_table.name == 'Tarot Merchant' or center_table.name == 'Tarot Tycoon' then
                    G.E_MANAGER:add_event(Event({func = function()
                        G.GAME.tarot_rate = G.GAME.tarot_rate / center_table.extra
                        return true end }))
                end
                if center_table.name == 'Planet Merchant' or center_table.name == 'Planet Tycoon' then
                    G.E_MANAGER:add_event(Event({func = function()
                        G.GAME.planet_rate = G.GAME.planet_rate / center_table.extra
                        return true end }))
                end
                if center_table.name == 'Hone' or center_table.name == 'Glow Up' then
                    G.E_MANAGER:add_event(Event({func = function()
                        G.GAME.edition_rate = G.GAME.edition_rate / center_table.extra
                        return true end }))
                end
                if center_table.name == 'Magic Trick' then
                    G.E_MANAGER:add_event(Event({func = function()
                        G.GAME.playing_card_rate = 0
                        return true end }))
                end
                if center_table.name == 'Crystal Ball' then
                    G.E_MANAGER:add_event(Event({func = function()
                        G.consumeables.config.card_limit = G.consumeables.config.card_limit - 1
                        return true end }))
                end
                if center_table.name == 'Clearance Sale' then
                    G.E_MANAGER:add_event(Event({func = function()
                        G.GAME.discount_percent = 0
                        for k, v in pairs(G.I.CARD) do
                            if v.set_cost then v:set_cost() end
                        end
                        return true end }))
                end
                if center_table.name == 'Liquidation' then
                    G.E_MANAGER:add_event(Event({func = function()
                        G.GAME.discount_percent = G.P_CENTERS.v_clearance_sale.extra
                        for k, v in pairs(G.I.CARD) do
                            if v.set_cost then v:set_cost() end
                        end
                        return true end }))
                end
                if center_table.name == 'Reroll Surplus' or center_table.name == 'Reroll Glut' then
                    G.E_MANAGER:add_event(Event({func = function()
                        G.GAME.round_resets.reroll_cost = G.GAME.round_resets.reroll_cost + self.ability.extra
                        G.GAME.current_round.reroll_cost = math.max(0, G.GAME.current_round.reroll_cost + self.ability.extra)
                        return true end }))
                end
                if center_table.name == 'Seed Money' then
                    G.E_MANAGER:add_event(Event({func = function()
                        G.GAME.interest_cap = 25 --note: does not account for potential deck effects
                        return true end }))
                end
                if center_table.name == 'Money Tree' then
                    G.E_MANAGER:add_event(Event({func = function()
                        G.GAME.interest_cap = G.P_CENTERS.v_seed_money.extra
                        return true end }))
                end
                if center_table.name == 'Grabber' or center_table.name == 'Nacho Tong' then
                    G.GAME.round_resets.hands = G.GAME.round_resets.hands - center_table.extra
                    ease_hands_played(-center_table.extra)
                end
                if center_table.name == 'Paint Brush' or center_table.name == 'Palette' then
                    G.hand:change_size(-1)
                end
                if center_table.name == 'Wasteful' or center_table.name == 'Recyclomancy' then
                    G.GAME.round_resets.discards = G.GAME.round_resets.discards - center_table.extra
                    ease_discard(-center_table.extra)
                end
                if center_table.name == 'Antimatter' then
                    G.E_MANAGER:add_event(Event({func = function()
                        if G.jokers then 
                            G.jokers.config.card_limit = G.jokers.config.card_limit - 1
                        end
                        return true end }))
                end
                if center_table.name == 'Hieroglyph' or center_table.name == 'Petroglyph' then
                    ease_ante(center_table.extra)
                    G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante
                    G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante+center_table.extra
            
                    if center_table.name == 'Hieroglyph' then
                        G.GAME.round_resets.hands = G.GAME.round_resets.hands + center_table.extra
                        ease_hands_played(center_table.extra)
                    end
                    if center_table.name == 'Petroglyph' then
                        G.GAME.round_resets.discards = G.GAME.round_resets.discards + center_table.extra
                        ease_discard(center_table.extra)
                    end
                end
end

function cry_edition_to_table(edition)
	if edition == 'negative' then return {negative = true}
	elseif edition == 'polychrome' then return {polychrome = true}
	elseif edition == 'holo' then return {holo = true}
	elseif edition == 'foil' then return {foil = true}
	elseif edition == 'cry_blur' then return {cry_blur = true}
	elseif edition == 'cry_astral' then return {cry_astral = true}
	elseif edition == 'cry_mosaic' then return {cry_mosaic = true}
	elseif edition == 'cry_glitched' then return {cry_glitched = true}
	elseif edition == 'cry_oversat' then return {cry_oversat = true}
	end
end

function cry_poll_random_edition()
	local editions = {{foil = true}, {holo = true}, {polychrome = true}, {negative = true}} -- still todo: modded edition support
	if Cryptid_config["Misc."] then
		editions[#editions+1] = {cry_astral = true}
		editions[#editions+1] = {cry_mosaic = true}
		editions[#editions+1] = {cry_oversat = true}
		editions[#editions+1] = {cry_glitched = true}
 		editions[#editions+1] = {cry_blur = true}
	end
	local random_edition = pseudorandom_element(editions, pseudoseed('cry_ant_edition'))
	return random_edition
end

function cry_voucher_debuffed(name)	-- simple function but idk
	if G.GAME.voucher_sticker_index and G.GAME.voucher_sticker_index.perishable[name] then
		if G.GAME.voucher_sticker_index.perishable[name] == 0 then
			return true
		end
	end
	return false
end

function cry_voucher_pinned(name)
	if G.GAME.voucher_sticker_index then
		if G.GAME.voucher_sticker_index.pinned[name] then
			return true
		end
	end
	return false
end

function cry_get_next_voucher_edition()	-- currently only for editions + sticker decks, can be modified if voucher stickering/editioning becomes more important
	if G.GAME.modifiers.cry_force_edition then
		return cry_edition_to_table(G.GAME.modifiers.cry_force_edition)
	elseif G.GAME.modifiers.cry_force_random_edition then
		return cry_poll_random_edition()
	end
end
function cry_get_next_voucher_stickers()
	local ret = {eternal = false, perishable = false, rental = false, pinned = false, banana = false}
	if G.GAME.modifiers.cry_force_sticker == 'eternal' or G.GAME.modifiers.cry_sticker_sheet_plus then
		ret.eternal = true
	end
	if G.GAME.modifiers.cry_force_sticker == 'perishable' or G.GAME.modifiers.cry_sticker_sheet_plus then
		ret.perishable = true
	end
	if G.GAME.modifiers.cry_force_sticker == 'rental' or G.GAME.modifiers.cry_sticker_sheet_plus then
		ret.rental = true
	end
	if G.GAME.modifiers.cry_force_sticker == 'pinned' or G.GAME.modifiers.cry_sticker_sheet_plus then
		ret.pinned = true
	end
	if G.GAME.modifiers.cry_force_sticker == 'banana' or G.GAME.modifiers.cry_sticker_sheet_plus then
		ret.banana = true
	end
	return ret
end

function Card:cry_calculate_consumeable_rental()
	if self.ability.rental then
		ease_dollars(-G.GAME.cry_consumeable_rental_rate)
		card_eval_status_text(self, 'dollars', -G.GAME.cry_consumeable_rental_rate)
	end
end

function Card:cry_calculate_consumeable_perishable()
	if self.ability.perishable and self.ability.perish_tally > 0 then
		self.ability.perish_tally = 0
		card_eval_status_text(self, 'extra', nil, nil, nil, {message = localize('k_disabled_ex'),colour = G.C.FILTER, delay = 0.45})
		self:set_debuff()
	end
end

local ec = eval_card
function eval_card(card, context)
    local ggpn = G.GAME.probabilities.normal
    if card.ability.cry_rigged then
        G.GAME.probabilities.normal = 1e300
    end
    local ret = ec(card, context)
    if card.ability.cry_rigged then
        G.GAME.probabilities.normal = ggpn
    end
    return ret
end
local uc = Card.use_consumeable
function Card:use_consumeable(area,copier)
    local ggpn = G.GAME.probabilities.normal
    if self.ability.cry_rigged then
        G.GAME.probabilities.normal = 1e300
    end
    local ret = uc(self, area, copier)
    if self.ability.cry_rigged then
        G.GAME.probabilities.normal = ggpn
    end
    return ret
end
local cj = Card.calculate_joker
function Card:calculate_joker(context)
    local ggpn = G.GAME.probabilities.normal
    if self.ability.cry_rigged then
        G.GAME.probabilities.normal = 1e300
    end
    local ret = cj(self, context)
    if self.ability.cry_rigged then
        G.GAME.probabilities.normal = ggpn
    end
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
          if not curr_obj.items then
            print("Warning: "..file.." has no items")
          else
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
  local cryptidTabs = {
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
}
  G.FUNCS.cryptidMenu = function(e)
    local tabs = create_tabs({
        snap_to_nav = true,
        tabs = cryptidTabs})
    G.FUNCS.overlay_menu{
            definition = create_UIBox_generic_options({
                back_func = "options",
                contents = {tabs}
            }),
        config = {offset = {x=0,y=10}}
    }
  end

--[[SMODS.current_mod.config_tab = function()
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
        nodes = {UIBox_button{ label = {"Open Cryptid Config"}, button = "cryptidMenu", colour = G.C.DARK_EDITION, minw = 5, minh = 0.7, scale = 0.6}}
    }
end--]]
SMODS.current_mod.extra_tabs = function() return cryptidTabs end

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

  if G.GAME.modifiers.cry_force_sticker == 'eternal' or (G.GAME.modifiers.cry_sticker_sheet_plus and not ((_type=='Base' or _type=='Enhanced') and not ((area == G.shop_jokers) or (area == G.pack_cards)))) then	-- wow that is long
      card:set_eternal(true)
      card.ability.eternal = true
  end
  if G.GAME.modifiers.cry_force_sticker == 'perishable' or (G.GAME.modifiers.cry_sticker_sheet_plus and not ((_type=='Base' or _type=='Enhanced') and not ((area == G.shop_jokers) or (area == G.pack_cards)))) then
      card:set_perishable(true)
      card.ability.perishable = true
  end
  if G.GAME.modifiers.cry_force_sticker == 'rental' or (G.GAME.modifiers.cry_sticker_sheet_plus and not ((_type=='Base' or _type=='Enhanced') and not ((area == G.shop_jokers) or (area == G.pack_cards)))) then
      card:set_rental(true)
      card.ability.rental = true
  end
  if G.GAME.modifiers.cry_force_sticker == 'pinned' or (G.GAME.modifiers.cry_sticker_sheet_plus and not ((_type=='Base' or _type=='Enhanced') and not ((area == G.shop_jokers) or (area == G.pack_cards)))) then
      card.pinned = true
  end
  if G.GAME.modifiers.cry_force_sticker == 'banana' or 
(G.GAME.modifiers.cry_sticker_sheet_plus and not ((_type=='Base' or _type=='Enhanced') and not ((area == G.shop_jokers) or (area == G.pack_cards)))) then
      card.ability.banana = true
  end
  if G.GAME.modifiers.cry_sticker_sheet_plus and not (_type=='Base' or _type=='Enhanced') then
      for k, v in pairs(SMODS.Stickers) do
          v:set_sticker(card, true)
      end
  end


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
	  if G.GAME.modifiers.cry_sticker_sheet then
              for k, v in pairs(SMODS.Stickers) do
                  v:set_sticker(card, true)
              end
          end
          if G.GAME.modifiers.cry_enable_flipped_in_shop and pseudorandom('cry_flip'..(key_append or '')..G.GAME.round_resets.ante) > 0.7 then
              card.cry_flipped = true
          end
      end
      if _type == 'Joker' and not G.GAME.modifiers.cry_force_edition == 'random' then
          local edition = poll_edition('edi'..(key_append or '')..G.GAME.round_resets.ante)
          card:set_edition(edition)
          check_for_unlock({type = 'have_edition'})
      end
  end
  if G.GAME.modifiers.cry_force_edition and (not G.GAME.modifiers.cry_force_random_edition) and area ~= G.pack_cards then
      card:set_edition(nil, true)
  end
  if G.GAME.modifiers.cry_force_random_edition and area ~= G.pack_cards then
      local edition = cry_poll_random_edition()
      card:set_edition(edition, true)
  end
  if not (card.edition and (card.edition.cry_oversat or card.edition.cry_glitched)) then
      cry_misprintize(card)
  end
  if card.ability.consumeable and card.pinned then	-- counterpart is in Sticker.toml
      G.GAME.cry_pinned_consumeables = G.GAME.cry_pinned_consumeables + 1
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
        if G.GAME.modifiers.cry_jkr_misprint_mod and card.ability.set == "Joker" then
            if not override then override = {} end
            override.min = override.min or G.GAME.modifiers.cry_misprint_min or 1
            override.max = override.max or G.GAME.modifiers.cry_misprint_max or 1
            override.min = override.min * G.GAME.modifiers.cry_jkr_misprint_mod
            override.max = override.max * G.GAME.modifiers.cry_jkr_misprint_mod
        end
        if G.GAME.modifiers.cry_misprint_min or override and override.min then
            cry_misprintize_tbl(card.config.center_key, card.ability, nil, override)
        end
        if G.GAME.modifiers.cry_misprint_min then
            --card.cost = cry_format(card.cost / cry_log_random(pseudoseed('cry_misprint'..G.GAME.round_resets.ante),override and override.min or G.GAME.modifiers.cry_misprint_min,override and override.max or G.GAME.modifiers.cry_misprint_max),"%.2f")
            card.misprint_cost_fac = 1 / cry_log_random(pseudoseed('cry_misprint'..G.GAME.round_resets.ante),override and override.min or G.GAME.modifiers.cry_misprint_min,override and override.max or G.GAME.modifiers.cry_misprint_max)
            card:set_cost()
        end
    else
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
    end
    G.localization.misc.v_text.ch_c_cry_all_perishable = {"All Jokers are {C:eternal}Perishable{}"}
    G.localization.misc.v_text.ch_c_cry_all_rental = {"All Jokers are {C:eternal}Rental{}"}
    G.localization.misc.v_text.ch_c_cry_all_pinned = {"All Jokers are {C:eternal}Pinned{}"}
    G.localization.misc.v_text.ch_c_cry_all_banana = {"All Jokers are {C:eternal}Banana{}"}
    G.localization.misc.v_text.ch_c_cry_sticker_sheet_plus = {"All purchasable items have all stickers"}
    G.localization.misc.v_text.ch_c_cry_rush_hour = {"All Boss Blinds are {C:attention}The Clock{} or {C:attention}Lavender Loop"}
    G.localization.misc.v_text.ch_c_cry_rush_hour_ii = {"All Blinds are {C:attention}The Clock{} or {C:attention}Lavender Loop"}
    G.localization.misc.v_text.ch_c_cry_rush_hour_iii = {"{C:attention}The Clock{} and {C:attention}Lavender Loop{} scale {C:attention}twice{} as fast"}
    G.localization.misc.v_text.ch_c_cry_no_tags = {"Skipping is {C:attention}disabled{}"}
    G.localization.misc.dictionary.k_cry_program_pack = "Program Pack"
    G.localization.misc.labels.banana = "Banana"
    G.localization.misc.labels.cry_rigged = "Rigged"
end

function SMODS.current_mod.process_loc_text()
    G.localization.descriptions.Other.banana = {
        name = "Banana",
        text = {
            "{C:green}#1# in #2#{} chance of being",
            "destroyed each round"
        },
    }
    G.localization.descriptions.Other.cry_rigged = {
        name = "Rigged",
        text = {
            "All {C:cry_code}probabilities",
            "are {C:cry_code}guaranteed"
        },
    }
								-- i am so sorry for this
    G.localization.descriptions.Other.cry_eternal_booster = {
        name = "Eternal",
        text = {
            "All cards in pack",
            "are {C:attention}Eternal{}"
        },
    }
    G.localization.descriptions.Other.cry_perishable_booster = {
        name = "Perishable",
        text = {
            "All cards in pack",
            "are {C:attention}Perishable{}"
        },
    }
    G.localization.descriptions.Other.cry_rental_booster = {
        name = "Rental",
        text = {
            "All cards in pack",
            "are {C:attention}Rental{}"
        },
    }
    G.localization.descriptions.Other.cry_pinned_booster = {
        name = "Pinned",
        text = {
            "All cards in pack",
            "are {C:attention}Pinned{}"
        },
    }
    G.localization.descriptions.Other.cry_banana_booster = {
        name = "Banana",
        text = {
            "All cards in pack",
            "are {C:attention}Banana{}"
        },
    }
    G.localization.descriptions.Other.cry_eternal_voucher = {
        name = "Eternal",
        text = {
            "Can't be traded"
        },
    }
    G.localization.descriptions.Other.cry_perishable_voucher = {
        name = "Perishable",
        text = {
            "Debuffed after",
            "{C:attention}#1#{} rounds",
	    "{C:inactive}({C:attention}#2#{C:inactive} remaining)"
        },
    }
    G.localization.descriptions.Other.cry_rental_voucher = {
        name = "Rental",
        text = {
            "Lose {C:money}$#1#{} at",
            "end of round"
        },
    }
    G.localization.descriptions.Other.cry_pinned_voucher = {
        name = "Pinned",
        text = {
            "Remains in shop",
	    "until redeemed",
        },
    }
    G.localization.descriptions.Other.cry_banana_voucher = {
        name = "Banana",
        text = {
            "{C:green}#1# in #2#{} chance of being",
            "unredeemed each round"
        },
    }
    G.localization.descriptions.Other.cry_perishable_consumeable = {
        name = "Perishable",
        text = {
            "Debuffed at",
            "end of round"
        },
    }
    G.localization.descriptions.Other.cry_rental_consumeable = {
        name = "Rental",
        text = {
            "Lose {C:money}$#1#{} at end of",
            "round, and on use"
        },
    }
    G.localization.descriptions.Other.cry_pinned_consumeable = {
        name = "Pinned",
        text = {
            "Can't use other",
            "non-{C:attention}Pinned{} consumables"
        },
    }
    G.localization.descriptions.Other.cry_banana_consumeable = {
        name = "Banana",
        text = {
            "{C:green}#1# in #2#{} chance to do",
            "nothing on use"
        },
    }
end

--Used to check to play the exotic music
function cry_has_exotic()
    if G.jokers then
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i].config.center.rarity == "cry_exotic" then
                return true
            end
        end
    end
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
	G.shared_sticker_pinned = Sprite(0, 0, G.CARD_W, G.CARD_H, G[self.atlas_table][self.key_noloc or self.key], {x = 5,y = 0})
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
    path = "e_mosaic.ogg"
})
SMODS.Sound({
    key = "e_glitched",
    path = "e_glitched.ogg"
})
SMODS.Sound({
    key = "e_oversaturated",
    path = "e_oversaturated.ogg"
})
SMODS.Sound({
    key = "e_blur",
    path = "e_blur.ogg"
})
SMODS.Sound({
    key = "music-Jimball",
    path = "Jimball.ogg",
    select_music_track = function()
        return next(find_joker('cry-Jimball')) and Cryptid_config.Cryptid.jimball_music
    end
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
