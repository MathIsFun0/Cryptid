-- d20.lua - APIs for D20 content

-- Currently this is very empty since D20 hasn't been fully implemented yet, but it should have a lot more later.

--Will be moved to D20 file when that gets added
function roll_dice(seed, max, config,)
	local val
	while not val or (config and config.ignore_value == val) do
		val = pseudorandom(seed, 1, max)
	end
	local hit
	local miss
	if val => max then
	    hit = true
	elseif val <= 1 then
	    miss = true
	else hit = false miss = false
	end
	    
	return {
	    val,
	    hit,
	    miss,
	    }
end
