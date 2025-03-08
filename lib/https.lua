-- Update the Cryptid member count using HTTPS
local member_fallback = 24000
local https = require("SMODS.https")
local last_update_time = 0
local initial = true
local function apply_discord_member_count(code, body, headers)
	if not GLOBAL_cry_member_count then
		GLOBAL_cry_member_count = member_fallback
	end
	if body then
		GLOBAL_cry_member_count = string.match(body, '"approximate_member_count"%s*:%s*(%d+)')
	end
end
function Cryptid.update_member_count()
	if Cryptid_config.HTTPS then
		if (os.time() - last_update_time >= 60) or initial then
			initial = false
			last_update_time = os.time()
			https.asyncRequest(
				"https://discord.com/api/v10/invites/eUf9Ur6RyB?with_counts=true" .. "&v=" .. tostring(os.time()),
				apply_discord_member_count
			)
		end
	else
		-- Use a fallback value if HTTPS is disabled (you all are awesome)
		GLOBAL_cry_member_count = member_fallback
	end
end
