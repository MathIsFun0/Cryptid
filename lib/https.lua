-- Update the Cryptid member count using HTTPS
function update_cry_member_count()
	if true then
		if not GLOBAL_cry_member_update_thread then
			-- start up the HTTPS thread if needed
			local file_data = assert(NFS.read(SMODS.Mods['Cryptid'].path.."https/thread.lua"))
			GLOBAL_cry_member_update_thread = love.thread.newThread(file_data)
			GLOBAL_cry_member_update_thread:start()
		end
		local old = GLOBAL_cry_member_count or 18500
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
		GLOBAL_cry_member_count = 18500
	end
end

function update_cry_misc_counts()
	if true then
		local join_ret = love.thread.getChannel("join_count"):pop()
		local m_ret = love.thread.getChannel("m_count"):pop()
		love.thread.getChannel("join_count"):clear()
		love.thread.getChannel("m_count"):clear()
		if join_ret then
			GLOBAL_cry_join_count = tonumber(join_ret)
		end
		if m_ret then
			GLOBAL_cry_m_chain, GLOBAL_cry_m_count = m_ret:match("%[(%d+),%s*(%d+)%]")
		end
	else
		GLOBAL_cry_join_count = 0
		GLOBAL_cry_m_count = 0
	end
end