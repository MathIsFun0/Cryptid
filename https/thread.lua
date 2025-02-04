require "love.system"

local index_os = love.system.getOS()

if index_os == 'OS X' then
	loc_https = require("macos-https")
elseif index_os == 'Linux' then
	loc_https = require("linux-https")
else
	loc_https = require("https")
end

local last_update_time = 0
local gist_update_time = 0
local initial = true
local gist_initial = true
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
	if (os.time() - gist_update_time >= 1) or gist_initial then	-- gist is fast and shouldn't get rate limited... i hope
		gist_initial = nil
		gist_update_time = os.time()
		
		local join_resp, join_txt = loc_https.request("https://gist.githubusercontent.com/Toneblock/e8fe8fa766052e521cf7e500569d0a34/raw/join.txt".."?v=" .. tostring(os.time()))
		local m_resp, m_txt = loc_https.request("https://gist.githubusercontent.com/Toneblock/e8fe8fa766052e521cf7e500569d0a34/raw/m.txt".."?v=" .. tostring(os.time()))
		
		-- lmao wtf am i doing here... i'm just copypasting code
		
		if join_resp == 200 then
			love.thread.getChannel('join_count'):push(join_txt)
		end
		if m_resp == 200 then
			love.thread.getChannel('m_count'):push(m_txt)
		end
	end
end