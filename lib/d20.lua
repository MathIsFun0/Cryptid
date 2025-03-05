-- d20.lua - APIs for D20 content

-- Currently this is very empty since D20 hasn't been fully implemented yet, but it should have a lot more later.

--Will be moved to D20 file when that gets added
function Cryptid.roll(seed, min, max, config)
	local val
	while not val or (config and config.ignore_value == val) do
		val = pseudorandom(seed, min, max)
	end
	return val
end
