require("love.system")
-- Currently crashes, I think SMODS.https module isn't loaded in the thread
loc_https = require("SMODS.https")

local last_update_time = 0
local initial = true
while true do
	if (os.time() - last_update_time >= 60) or initial then
		initial = false
		last_update_time = os.time()
		local resp, txt = loc_https.request(
			"https://discord.com/api/v10/invites/eUf9Ur6RyB?with_counts=true" .. "&v=" .. tostring(os.time())
		)
		if resp == 200 then
			love.thread.getChannel("member_count"):push(txt)
		else
			love.thread.getChannel("member_error"):push("Failed to get count: " .. resp)
		end
	end
end
