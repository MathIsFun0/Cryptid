-- Update the Cryptid member count using HTTPS
local member_fallback = 29332
local succ, https = pcall(require, "SMODS.https")
local last_update_time = 0
local initial = true
Cryptid.member_count = member_fallback
if not succ then
	sendErrorMessage("HTTP module could not be loaded. " .. tostring(https), "Cryptid")
end

local function apply_discord_member_count(code, body, headers)
	if body then
		Cryptid.member_count = string.match(body, '"approximate_member_count"%s*:%s*(%d+)') or Cryptid.member_count
	end
end
function Cryptid.update_member_count()
	if Cryptid_config.HTTPS and https and https.asyncRequest then
		if (os.time() - last_update_time >= 60) or initial then
			initial = false
			last_update_time = os.time()
			https.asyncRequest(
				"https://discord.com/api/v10/invites/eUf9Ur6RyB?with_counts=true" .. "&v=" .. tostring(os.time()),
				apply_discord_member_count
			)
		end
	end --you all are awesome :)
end
