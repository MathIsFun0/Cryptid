require "love.system"

-- mac/linux support?

local script_path = debug.getinfo(1, "S").source:sub(2)
local script_dir = script_path:match("(.*/)")

package.path = script_dir .. "?.lua;" .. package.path
package.cpath = script_dir .. "?.so;" .. package.cpath

local index_os = love.system.getOS()

if index_os == 'OS X' then
	loc_https = require("macos-https")
elseif index_os == 'Linux' then
	loc_https = require("linux-https")
else
	loc_https = require("https")
end

local last_update_time = 0
local initial = true
while true do
	if (os.time() - last_update_time >= 60) or initial then
		initial = nil
		last_update_time = os.time()
		local resp, txt = loc_https.request("https://discord.com/api/v10/invites/eUf9Ur6RyB?with_counts=true".."&v=" .. tostring(os.time()))
		if resp == 200 then
			love.thread.getChannel('member_count'):push(txt)
		else
			love.thread.getChannel('member_error'):push("Failed to get count: "..resp)
		end
	end
end