-- event.lua - Adds SMODS Event class
-- Used for Jokers like Chocolate Die

SMODS.Events = {}
SMODS.Event = SMODS.GameObject:extend({
	obj_table = SMODS.Events,
	obj_buffer = {},
	required_params = {
		"key",
	},
	inject = function() end,
	set = "Other",
	class_prefix = "ev",
	-- This should be called to start an event.
	start = function(self)
		G.GAME.events[self.key] = true
	end,
	-- This should be called to finish an event.
	finish = function(self)
		G.GAME.events[self.key] = nil
	end,
	-- Runs once before and after jokers, as well as a few special cases
	calculate = function(self, context) end,
	-- used for Chocolate Die tooltips, can maybe be repurposed later
	loc_vars = function(self, info_queue, center)
		info_queue[#info_queue + 1] = { set = "Other", key = self.key }
	end,
})

--Calculate events on cash out
local gfco = G.FUNCS.cash_out
G.FUNCS.cash_out = function(e)
	local ret = gfco(e)
	SMODS.calculate_context({ cash_out = true })
	return ret
end

-- Calculate events on start of shop
local guis = G.UIDEF.shop
G.UIDEF.shop = function(e)
	local ret = guis(e)
	SMODS.calculate_context({ start_shop = true })
	return ret
end
