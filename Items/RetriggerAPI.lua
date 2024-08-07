local cj = Card.calculate_joker
function Card:calculate_joker(context, callback, retrigger, no_retrigger_anim)
    local ret, triggered = cj(self, context)
    --Check for retrggering jokers
    if (ret or triggered) and context and not context.retrigger_joker and not context.retrigger_joker_check then
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
                local check = self:calculate_joker_retriggers()
                if check and check.repetitions then
                    check.repetitions = check.repetitions + old_repetitions
                    ret.joker_repetitions[i] = check
                end
            end
        end
        --do the retriggers
        for z = 1, #ret.joker_repetitions do
            if type(ret.joker_repetitions[z]) == 'table' and ret.joker_repetitions[z].repetitions then
                for r = 1, ret.joker_repetitions[z].repetitions do
                if percent then percent = percent+percent_delta end
                context.retrigger_joker = ret.joker_repetitions[z].card
                local _ret, _triggered = self:calculate_joker(context, callback, ret.joker_repetitions[z])
                if (_ret or _triggered) and not no_retrigger_anim then card_eval_status_text(ret.joker_repetitions[z].card, 'jokers', nil, nil, nil, ret.joker_repetitions[z]) end
                end
            end
        end
    end
    if callback and type(callback) == 'function' then callback(ret, retrigger) end
    return ret, triggered
end
function Card:calculate_joker_retriggers()
    return calculate_blurred(self)
end
function eval_card(card, context, callback)
    context = context or {}
    local ret = {}

    if context.repetition_only then
        local seals = card:calculate_seal(context)
        if seals then
            ret.seals = seals
        end
        return ret
    end
    
    if context.cardarea == G.play then
        local chips = card:get_chip_bonus()
        if chips > 0 then 
            ret.chips = chips
        end

        local mult = card:get_chip_mult()
        if mult > 0 then 
            ret.mult = mult
        end

        local x_mult = card:get_chip_x_mult(context)
        if x_mult > 0 then 
            ret.x_mult = x_mult
        end

        local p_dollars = card:get_p_dollars()
        if p_dollars > 0 then 
            ret.p_dollars = p_dollars
        end

        local jokers = card:calculate_joker(context, callback)
        if jokers then 
            ret.jokers = jokers
        end

        local edition = card:get_edition(context)
        if edition then 
            ret.edition = edition
        end
    end

    if context.cardarea == G.hand then
        local h_mult = card:get_chip_h_mult()
        if h_mult > 0 then 
            ret.h_mult = h_mult
        end

        local h_x_mult = card:get_chip_h_x_mult()
        if h_x_mult > 0 then 
            ret.x_mult = h_x_mult
        end

        local jokers = card:calculate_joker(context, callback)
        if jokers then 
            ret.jokers = jokers
        end
    end

    if context.cardarea == G.jokers or context.card == G.consumeables then
        local jokers = nil
        if context.edition then
            jokers = card:get_edition(context)
        elseif context.other_joker then
            jokers = context.other_joker:calculate_joker(context, callback)
        else
            jokers = card:calculate_joker(context, callback)
        end
        if jokers then 
            ret.jokers = jokers
        end
    end

    return ret
end
return {name = "Retrigger API"} --dummy metadata, just to separate this out