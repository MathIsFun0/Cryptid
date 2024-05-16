--- STEAMODDED HEADER
--- MOD_NAME: Cryptid
--- MOD_ID: Cryptid
--- PREFIX: cry
--- MOD_AUTHOR: [MathIsFun_, Balatro Discord]
--- MOD_DESCRIPTION: Adds unbalanced ideas to Balatro.
--- BADGE_COLOUR: 708b91
--- ICON_ATLAS: icon

----------------------------------------------
------------MOD CODE -------------------------

-- Load Options
local config_file = {}
if NFS.read(SMODS.current_mod.path.."/config.lua") then
    config_file = STR_UNPACK(NFS.read(SMODS.current_mod.path.."/config.lua"))
    print(NFS.read(SMODS.current_mod.path.."/config.lua"))
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
    if _center and _center.name == 'Gateway' then
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

-- File loading based on Relic-Jokers
local files = NFS.getDirectoryItems(SMODS.current_mod.path.."Items")
for _, file in ipairs(files) do
    local curr_obj = NFS.load(SMODS.current_mod.path.."Items/"..file)()
    if config_file[curr_obj.name] == nil then config_file[curr_obj.name] = true end
    if config_file[curr_obj.name] then
        if curr_obj.init then curr_obj:init() end
        for _, item in ipairs(curr_obj.items) do
            SMODS[item.object_type](item)
        end
    end
end

local G_FUNCS_options_ref = G.FUNCS.options
G.FUNCS.options = function(e)
  G_FUNCS_options_ref(e)
  NFS.write(SMODS.current_mod.path.."/config.lua", STR_PACK(config_file))
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

SMODS.Sprite({
    key = "icon",
    atlas = "asset_atlas",
    path = "cry_icon.png",
    px = 32,
    py = 32
}):register()
----------------------------------------------
------------MOD CODE END----------------------