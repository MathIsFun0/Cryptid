-- debug.lua - DebugPlus commands to assist with testing features

local success, dpAPI = pcall(require, "debugplus-api")

local logger = {
    log = print,
    debug = print,
    info = print,
    warn = print,
    error = print
}

if success and dpAPI.isVersionCompatible(0) then
    local debugplus = dpAPI.registerID("Cryptid")
    logger = debugplus.logger

    --todo work with multi-word strings
    debugplus.addCommand({
        name = "value",
        shortDesc = "Get/Edit Card Values",
        desc = "Lets you get or edit the values of the currently highlighted card",
        exec = function (args, rawArgs, dp)
            local unmodified_vals = {
                bonus = 0,
                perma_bonus = 0,
                extra_value = 0,
                p_dollars = 0,
                h_mult = 0,
                h_x_mult = 0,
                h_dollars = 0,
                h_size = 0,
                d_size = 0,
                hands_played_at_create = 0,
                mult = 0,
                x_mult = 1,
                e_mult = 0,
                ee_mult = 0,
                eee_mult = 0,
                x_chips = 0,
                e_chips = 0,
                ee_chips = 0,
                eee_chips = 0,
                t_mult = 0,
                t_chips = 0,
            }
            local ignore_vals = {
                name = true,
                set = true,
                order = true,
                consumeable = true
            }
            local hovered = G.CONTROLLER.hovering.target
            if hovered:is(Card) then
                if args[1] == "get" then
                    for k, v in pairs(hovered.ability) do
                        if (not ignore_vals[k]) and (not unmodified_vals[k] or unmodified_vals[k] ~= hovered.ability[k]) then
                            if k == "hyper_chips" or k == "hyper_mult" then
                                if hovered.ability[k][1] ~= 0 or hovered.ability[k][2] ~= 0 then
                                    print(k, hovered.ability[k][1], hovered.ability[k][2])
                                end
                            elseif type(hovered.ability[k]) == "table" then
                                for kk, vv in pairs(hovered.ability[k]) do
                                    print(k, kk, vv)
                                end
                            elseif hovered.ability[k] ~= "" then
                                print(k, hovered.ability[k])
                            end
                        end
                    end
                elseif args[1] == "set" or args[1] == "set_center" then
                    local root = hovered.ability
                    if args[1] == "set_center" then
                        root = hovered.config.center.config
                    end
                    local rootC
                    if hovered.ability.consumeable then
                        rootC = root.consumeable
                    end
                    for i = 2, #args-2 do
                        root = root[args[i]]
                        if rootC then rootC = rootC[args[i]] end
                    end
                    if tonumber(args[#args]) then --number
                        root[args[#args-1]] = tonumber(args[#args])
                        if rootC then rootC[args[#args-1]] = tonumber(args[#args]) end
                    elseif args[#args] == "true" then --bool
                        root[args[#args-1]] = true
                        if rootC then rootC[args[#args-1]] = true end
                    elseif args[#args] == "false" then
                        root[args[#args-1]] = false
                        if rootC then rootC[args[#args-1]] = false end
                    elseif args[#args][1] == "{" then --table
                        root[args[#args-1]] = loadstring("return "..args[#args])()
                        if rootC then rootC[args[#args-1]] = loadstring("return "..args[#args])() end
                    else
                        root[args[#args-1]] = args[#args]
                        if rootC then rootC[args[#args-1]] = args[#args] end
                    end
                    return "Value set successfully.", "INFO"
                else
                    error("Invalid argument. Use 'get' or 'set' or 'set_center'.")
                end
            end
        end
    })
end

logger.log("Hi")