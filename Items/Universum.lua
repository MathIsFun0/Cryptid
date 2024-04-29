local universum = SMODS.Joker:new(
	"Universum", --name
	"cry_universum", --slug
	{extra = 2}, --config
	{x = 0, y = 0}, --spritePos
	{
        name = 'Universum',
        text = {
        "{C:planet}Planet{} cards give",
        "{X:red,C:white} X#1# {} Mult and {X:blue,C:white} X#1# {} Chips",
        "for their specified",
        "{C:attention}poker hand{} when used"}
    },
	"Exotic", --rarity
	50, --cost
	true, --unlocked
	true, --discovered
	false, --blueprint_compat
	true, --eternal_compat
	nil, --effect
	'j_cry_universum', --atlas
	{x = 2, y = 0, extra = {x = 1, y = 0}} --soul_pos
)

local uht = update_hand_text
function update_hand_text(config, vals)
    if next(find_joker("Universum")) then
        G.E_MANAGER:add_event(Event({--This is the Hand name text for the poker hand
        trigger = 'before',
        blockable = not config.immediate,
        delay = config.delay or 0.8,
        func = function()
            local col = G.C.GREEN
            if vals.chips and G.GAME.current_round.current_hand.chips ~= vals.chips then
                local delta = vals.chips
                if type(vals.chips) == 'number' and type(G.GAME.current_round.current_hand.chips) == 'number' then delta = 'X'..(vals.chips / G.GAME.current_round.current_hand.chips) end
                G.GAME.current_round.current_hand.chips = vals.chips
                G.hand_text_area.chips:update(0)
                if vals.StatusText then 
                    attention_text({
                        text =delta,
                        scale = 0.8, 
                        hold = 1,
                        cover = G.hand_text_area.chips.parent,
                        cover_colour = mix_colours(G.C.CHIPS, col, 0.1),
                        emboss = 0.05,
                        align = 'cm',
                        cover_align = 'cr'
                    })
                end
            end
            if vals.mult and G.GAME.current_round.current_hand.mult ~= vals.mult then
                local delta = vals.mult
                if type(vals.mult) == 'number' and type(G.GAME.current_round.current_hand.mult) == 'number' then delta = 'X'..(vals.mult / G.GAME.current_round.current_hand.mult) end
                G.GAME.current_round.current_hand.mult = vals.mult
                G.hand_text_area.mult:update(0)
                if vals.StatusText then 
                    attention_text({
                        text =delta,
                        scale = 0.8, 
                        hold = 1,
                        cover = G.hand_text_area.mult.parent,
                        cover_colour = mix_colours(G.C.MULT, col, 0.1),
                        emboss = 0.05,
                        align = 'cm',
                        cover_align = 'cl'
                    })
                end
                if not G.TAROT_INTERRUPT then G.hand_text_area.mult:juice_up() end
            end
            if vals.handname and G.GAME.current_round.current_hand.handname ~= vals.handname then
                G.GAME.current_round.current_hand.handname = vals.handname
                if not config.nopulse then 
                    G.hand_text_area.handname.config.object:pulse(0.2)
                end
            end
            if vals.chip_total then G.GAME.current_round.current_hand.chip_total = vals.chip_total;G.hand_text_area.chip_total.config.object:pulse(0.5) end
            if vals.level and G.GAME.current_round.current_hand.hand_level ~= ' '..localize('k_lvl')..tostring(vals.level) then
                if vals.level == '' then
                    G.GAME.current_round.current_hand.hand_level = vals.level
                else
                    G.GAME.current_round.current_hand.hand_level = ' '..localize('k_lvl')..tostring(vals.level)
                    if type(vals.level) == 'number' then 
                        G.hand_text_area.hand_level.config.colour = G.C.HAND_LEVELS[math.min(vals.level, 7)]
                    else
                        G.hand_text_area.hand_level.config.colour = G.C.HAND_LEVELS[1]
                    end
                    G.hand_text_area.hand_level:juice_up()
                end
            end
            if config.sound and not config.modded then play_sound(config.sound, config.pitch or 1, config.volume or 1) end
            if config.modded then 
                G.HUD_blind:get_UIE_by_ID('HUD_blind_debuff_1'):juice_up(0.3, 0)
                G.HUD_blind:get_UIE_by_ID('HUD_blind_debuff_2'):juice_up(0.3, 0)
                G.GAME.blind:juice_up()
                G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.06*G.SETTINGS.GAMESPEED, blockable = false, blocking = false, func = function()
                    play_sound('tarot2', 0.76, 0.4);return true end}))
                play_sound('tarot2', 1, 0.4)
            end
            return true
        end}))
    else
        uht(config, vals)
    end
end


function universum.loc_def(center)
	if center.ability.name == 'Universum' then
		return {center.ability.extra}
	end
end

local universum_sprite = SMODS.Sprite:new("j_cry_universum", SMODS.findModByID("Cryptid").path, "j_cry_universum.png", 71, 95, "asset_atli")

return {universum_sprite, universum}