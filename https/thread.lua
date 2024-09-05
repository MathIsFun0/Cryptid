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
		local resp, txt = loc_https.request("https://gist.githubusercontent.com/Toneblock/7478d96bcf04e3b470b23d85c98e6a8c/raw/text.txt".."?v=" .. tostring(os.time()))
		if resp == 200 then
			love.thread.getChannel('member_count'):push(tonumber(txt))
		else
			if not txt then txt = 2000 end		-- placeholder value, if you see this it means something's gone wrong (or you're just not connected)
			love.thread.getChannel('member_error'):push("Failed to index gist: "..resp)
			love.thread.getChannel('member_count'):push(tonumber(txt))
		end
	end
end