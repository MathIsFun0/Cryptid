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

-- It's easier to not override this, actually
function level_up_hand(card, hand, instant, amount)
    if next(find_joker("Universum")) then
        amount = amount or 1
        G.GAME.hands[hand].level = math.max(0, G.GAME.hands[hand].level + amount)
        G.GAME.hands[hand].mult = math.max(G.GAME.hands[hand].mult * math.pow(5, amount), 1)
        G.GAME.hands[hand].chips = math.max(G.GAME.hands[hand].chips * math.pow(5, amount), 0)
    else
        amount = amount or 1
        G.GAME.hands[hand].level = math.max(0, G.GAME.hands[hand].level + amount)
        G.GAME.hands[hand].mult = math.max(G.GAME.hands[hand].mult + G.GAME.hands[hand].l_mult*amount, 1)
        G.GAME.hands[hand].chips = math.max(G.GAME.hands[hand].chips + G.GAME.hands[hand].l_chips*amount, 0)
    end
    if not instant then 
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
            play_sound('tarot1')
            if card then card:juice_up(0.8, 0.5) end
            G.TAROT_INTERRUPT_PULSE = true
            return true end }))
        update_hand_text({delay = 0}, {mult = G.GAME.hands[hand].mult, StatusText = true})
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.9, func = function()
            play_sound('tarot1')
            if card then card:juice_up(0.8, 0.5) end
            return true end }))
        update_hand_text({delay = 0}, {chips = G.GAME.hands[hand].chips, StatusText = true})
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.9, func = function()
            play_sound('tarot1')
            if card then card:juice_up(0.8, 0.5) end
            G.TAROT_INTERRUPT_PULSE = nil
            return true end }))
        update_hand_text({sound = 'button', volume = 0.7, pitch = 0.9, delay = 0}, {level=G.GAME.hands[hand].level})
        delay(1.3)
    end
    G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = (function() check_for_unlock{type = 'upgrade_hand', hand = hand, level = G.GAME.hands[hand].level} return true end)
    }))
end

local uht = update_hand_text
function update_hand_text(config, vals)
    if next(find_joker("Universum")) and ((vals.chips and type(vals.chips) == 'number' and vals.chips > 0) or (vals.mult and type(vals.mult) == 'number' and vals.mult > 0)) then
        G.E_MANAGER:add_event(Event({--This is the Hand name text for the poker hand
        trigger = 'before',
        blockable = not config.immediate,
        delay = config.delay or 0.8,
        func = function()
            local col = G.C.GREEN
            if vals.chips and G.GAME.current_round.current_hand.chips ~= vals.chips then
                local delta = 'X'..(vals.chips / G.GAME.current_round.current_hand.chips)
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
                local delta = 'X'..(vals.mult / G.GAME.current_round.current_hand.mult)
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