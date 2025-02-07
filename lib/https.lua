-- Update the Cryptid member count using HTTPS
function update_cry_member_count()
	if Cryptid.enabled["HTTPS Module"] == true and Cryptid.mod_path then
		if not GLOBAL_cry_member_update_thread then
			-- start up the HTTPS thread if needed
			local file_data = assert(NFS.newFileData(Cryptid.mod_path .. "https/thread.lua"))
			GLOBAL_cry_member_update_thread = love.thread.newThread(file_data)
			GLOBAL_cry_member_update_thread:start()
		end
		local old = GLOBAL_cry_member_count or 5624
		-- get the HTTPS thread's value for Cryptid members
		local ret = love.thread.getChannel("member_count"):pop()
		if ret then
			GLOBAL_cry_member_count = string.match(ret, '"approximate_member_count"%s*:%s*(%d+)') -- string matching a json is odd but should be fine?
		end
		if not GLOBAL_cry_member_count then
			GLOBAL_cry_member_count = old
			-- Something failed, print the error
			local error = love.thread.getChannel("member_error"):pop()
			if error then
				sendDebugMessage(error)
			end
		end
	else
		-- Use a fallback value if HTTPS is disabled (you all are awesome)
		GLOBAL_cry_member_count = 20000
	end
end
