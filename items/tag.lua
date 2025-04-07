local cat = {
	cry_credits = {
		idea = {
			"Catman",
		},
		art = {
			"5381",
		},
		code = {
			"Math",
		},
	},
	object_type = "Tag",
	dependencies = {
		items = {
			"set_cry_tag",
		},
	},
	atlas = "tag_cry",
	pos = { x = 0, y = 2 },
	config = { level = 1 },
	key = "cat",
	name = "cry-Cat Tag",
	order = 12,
	loc_vars = function(self, info_queue, tag)
		return { vars = { tag.ability.level or 1 } }
	end,
}
local epic_tag = {
	cry_credits = {
		idea = {
			"Jevonn",
		},
		art = {
			"Math",
		},
		code = {
			"Math",
		},
	},
	object_type = "Tag",
	dependencies = {
		items = {
			"set_cry_tag",
			"set_cry_epic",
		},
	},
	atlas = "tag_cry",
	pos = { x = 3, y = 0 },
	name = "cry-Epic Tag",
	order = 1,
	min_ante = 2,
	requires = "j_cry_googol_play",
	config = { type = "store_joker_create" },
	key = "epic",
	apply = function(self, tag, context)
		if context.type == "store_joker_create" then
			local rares_in_posession = { 0 }
			for k, v in ipairs(G.jokers.cards) do
				if v.config.center.rarity == "cry_epic" and not rares_in_posession[v.config.center.key] then
					rares_in_posession[1] = rares_in_posession[1] + 1
					rares_in_posession[v.config.center.key] = true
				end
			end
			local card
			if #G.P_JOKER_RARITY_POOLS.cry_epic > rares_in_posession[1] then
				card = create_card("Joker", context.area, nil, "cry_epic", nil, nil, nil, "cry_eta")
				create_shop_card_ui(card, "Joker", context.area)
				card.states.visible = false
				tag:yep("+", G.C.RARITY.cry_epic, function()
					card:start_materialize()
					card.misprint_cost_fac = 0.5
					card:set_cost()
					return true
				end)
			else
				tag:nope()
			end
			tag.triggered = true
			return card
		end
	end,
}
local schematic = {
	cry_credits = {
		idea = {
			"Jevonn",
		},
		art = {
			"Jevonn",
		},
		code = {
			"Jevonn",
		},
	},
	object_type = "Tag",
	dependencies = {
		items = {
			"set_cry_tag",
		},
	},
	atlas = "tag_cry",
	pos = { x = 1, y = 2 },
	name = "cry-Schematic Tag",
	order = 24,
	requires = "j_brainstorm",
	config = { type = "store_joker_create" },
	key = "schematic",
	loc_vars = function(self, info_queue)
		info_queue[#info_queue + 1] = { set = "Joker", key = "j_brainstorm" }
		return { vars = {} }
	end,
	apply = function(self, tag, context)
		if context.type == "store_joker_create" then
			local card
			if not G.GAME.banned_keys["j_brainstorm"] then
				card = create_card("Joker", context.area, nil, nil, nil, nil, "j_brainstorm")
				create_shop_card_ui(card, "Joker", context.area)
				card.states.visible = false
				tag:yep("+", G.C.RED, function()
					card:start_materialize()
					card:set_cost()
					return true
				end)
			else
				tag:nope()
			end
			tag.triggered = true
			return card
		end
	end,
	in_pool = function()
		if G.GAME.used_jokers["j_brainstorm"] and not next(find_joker("Showman")) then
			return false
		end
		if G.GAME.banned_keys["j_brainstorm"] then
			return false
		end
		return true
	end,
}
local empoweredPack = {
	cry_credits = {
		idea = {
			"Mystic Misclick",
			"Mjiojio",
		},
		art = {
			"Jevonn",
		},
		code = {
			"Math",
		},
	},
	object_type = "Booster",
	dependencies = {
		items = {
			"set_cry_tag",
			"tag_cry_empowered",
		},
	},
	name = "cry-Empowered Pack",
	key = "empowered",
	kind = "Spectral",
	no_doe = true,
	atlas = "pack",
	pos = { x = 3, y = 1 },
	config = { extra = 2, choose = 1 },
	cost = 0,
	weight = 0,
	order = 8,
	draw_hand = true,
	update_pack = SMODS.Booster.update_pack,
	loc_vars = SMODS.Booster.loc_vars,
	ease_background_colour = function(self)
		ease_background_colour_blind(G.STATES.SPECTRAL_PACK)
	end,
	create_UIBox = function(self)
		return create_UIBox_spectral_pack()
	end,
	particles = function(self)
		G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
			timer = 0.015,
			scale = 0.1,
			initialize = true,
			lifespan = 3,
			speed = 0.2,
			padding = -1,
			attach = G.ROOM_ATTACH,
			colours = { G.C.WHITE, lighten(G.C.GOLD, 0.2) },
			fill = true,
		})
		G.booster_pack_sparkles.fade_alpha = 1
		G.booster_pack_sparkles:fade(1, 0)
	end,
	create_card = function(self, card, i)
		if
			i % 2 == 1
			and Cryptid.enabled("c_cry_gateway") == true
			and not G.GAME.banned_keys["c_cry_gateway"]
			and not (G.GAME.used_jokers["c_cry_gateway"] and not next(find_joker("Showman")))
		then
			return create_card("Spectral", G.pack_cards, nil, nil, true, true, "c_cry_gateway")
		elseif
			not (G.GAME.used_jokers["c_soul"] and not next(find_joker("Showman"))) and not G.GAME.banned_keys["c_soul"]
		then
			return create_card("Spectral", G.pack_cards, nil, nil, true, true, "c_soul")
		else
			return create_card("Spectral", G.pack_cards, nil, nil, true, true)
		end
	end,
	group_key = "k_spectral_pack",
	cry_digital_hallucinations = {
		colour = G.C.SECONDARY_SET.Spectral,
		loc_key = "k_plus_spectral",
		create = function()
			local ccard
			if pseudorandom(pseudoseed("diha")) < 0.5 then
				ccard = create_card("Spectral", G.consumeables, nil, nil, true, true, "c_soul")
			else
				ccard = create_card("Spectral", G.consumeables, nil, nil, true, true, "c_cry_gateway")
			end
			ccard:set_edition({ negative = true }, true)
			ccard:add_to_deck()
			G.consumeables:emplace(ccard)
		end,
	},
}
local empowered = {
	cry_credits = {
		idea = {
			"Mystic Misclick",
			"Mjiojio",
		},
		art = {
			"5381",
		},
		code = {
			"Math",
		},
	},
	object_type = "Tag",
	dependencies = {
		items = {
			"set_cry_tag",
			"set_cry_exotic",
			"c_cry_gateway",
		},
	},
	name = "cry-Empowered Tag",
	order = 18,
	atlas = "tag_cry",
	pos = { x = 1, y = 0 },
	config = { type = "new_blind_choice" },
	key = "empowered",
	loc_vars = function(self, info_queue)
		info_queue[#info_queue + 1] = G.P_CENTERS.p_spectral_normal_1
		info_queue[#info_queue + 1] = { set = "Spectral", key = "c_soul" }
		if Cryptid.enabled("c_cry_gateway") then
			info_queue[#info_queue + 1] = { set = "Spectral", key = "c_cry_gateway" }
		end
		return { vars = {} }
	end,
	apply = function(self, tag, context)
		if context.type == "new_blind_choice" then
			local lock = tag.ID
			G.CONTROLLER.locks[lock] = true
			tag:yep("+", G.C.SECONDARY_SET.Spectral, function()
				local key = "p_cry_empowered"
				local card = Card(
					G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2,
					G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2,
					G.CARD_W * 1.27,
					G.CARD_H * 1.27,
					G.P_CARDS.empty,
					G.P_CENTERS[key],
					{ bypass_discovery_center = true, bypass_discovery_ui = true }
				)
				card.cost = 0
				card.from_tag = true
				G.FUNCS.use_card({ config = { ref_table = card } })
				if G.GAME.modifiers.cry_force_edition and not G.GAME.modifiers.cry_force_random_edition then
					card:set_edition(nil, true, true)
				elseif G.GAME.modifiers.cry_force_random_edition then
					local edition = Cryptid.poll_random_edition()
					card:set_edition(edition, true, true)
				end
				card:start_materialize()
				G.CONTROLLER.locks[lock] = nil
				return true
			end)
			tag.triggered = true
			return true
		end
	end,
	in_pool = function()
		return false
	end,
}
local gambler = {
	cry_credits = {
		idea = {
			"Catman",
		},
		art = {
			"SpoofyGuy",
		},
		code = {
			"Math",
		},
	},
	object_type = "Tag",
	dependencies = {
		items = {
			"set_cry_tag",
			"tag_cry_empowered",
		},
	},
	name = "cry-Gamblecore",
	order = 13,
	atlas = "tag_cry",
	pos = { x = 2, y = 0 },
	config = { type = "new_blind_choice", odds = 4 },
	min_ante = 2,
	key = "gambler",
	loc_vars = function(self, info_queue)
		info_queue[#info_queue + 1] = { set = "Tag", key = "tag_cry_empowered" }
		return { vars = { G.GAME.probabilities.normal or 1, self.config.odds } }
	end,
	apply = function(self, tag, context)
		if context.type == "new_blind_choice" then
			if pseudorandom("cry_gambler_tag") < G.GAME.probabilities.normal / tag.config.odds then
				local lock = tag.ID
				G.CONTROLLER.locks[lock] = true
				tag:yep("+", G.C.SECONDARY_SET.Spectral, function()
					local emp = Tag("tag_cry_empowered")
					if tag.ability.shiny then -- good fucking luck
						emp.ability.shiny = Cryptid.is_shiny()
					end
					add_tag(emp)
					tag.triggered = true
					emp:apply_to_run({ type = "new_blind_choice" })
					G.CONTROLLER.locks[lock] = nil
					return true
				end)
			else
				tag:nope()
				tag.triggered = true
				for i = 1, #G.GAME.tags do
					if G.GAME.tags[i] ~= tag then
						if G.GAME.tags[i]:apply_to_run({ type = "new_blind_choice" }) then
							break
						end
					end
				end
			end
			tag.triggered = true
			return true
		end
	end,
}
local bundle = {
	cry_credits = {
		idea = {
			"Mystic Misclick",
		},
		art = {
			"5381",
		},
		code = {
			"Math",
		},
	},
	object_type = "Tag",
	dependencies = {
		items = {
			"set_cry_tag",
		},
	},
	name = "cry-Bundle Tag",
	order = 16,
	atlas = "tag_cry",
	pos = { x = 0, y = 0 },
	config = { type = "new_blind_choice" },
	key = "bundle",
	min_ante = 2,
	loc_vars = function(self, info_queue)
		info_queue[#info_queue + 1] = { set = "Tag", key = "tag_standard" }
		info_queue[#info_queue + 1] = { set = "Tag", key = "tag_charm" }
		info_queue[#info_queue + 1] = { set = "Tag", key = "tag_meteor" }
		info_queue[#info_queue + 1] = { set = "Tag", key = "tag_buffoon" }
		return { vars = {} }
	end,
	apply = function(self, tag, context)
		if context.type == "new_blind_choice" then
			local lock = tag.ID
			G.CONTROLLER.locks[lock] = true
			tag:yep("+", G.C.ATTENTION, function()
				local tags = { "standard", "charm", "meteor", "buffoon" }
				for i, v in ipairs(tags) do
					local _tag = Tag("tag_" .. v)
					_tag.ability.shiny = Cryptid.is_shiny()
					add_tag(_tag)
					if i == 1 then
						tag.triggered = true
						_tag:apply_to_run({ type = "new_blind_choice" })
					end
				end
				G.CONTROLLER.locks[lock] = nil
				return true
			end)
			tag.triggered = true
			return true
		end
	end,
}
local memory = {
	cry_credits = {
		idea = {
			"y_not_tony",
		},
		art = {
			"5381",
		},
		code = {
			"Math",
		},
	},
	object_type = "Tag",
	dependencies = {
		items = {
			"set_cry_tag",
		},
	},
	atlas = "tag_cry",
	pos = { x = 3, y = 1 },
	name = "cry-Memory Tag",
	order = 15,
	config = { type = "immediate", num = 2 },
	key = "memory",
	loc_vars = function(self, info_queue)
		if G.GAME.cry_last_tag_used then
			_c = G.P_TAGS[G.GAME.cry_last_tag_used]
		end
		local loc_tag = _c and localize({ type = "name_text", key = G.GAME.cry_last_tag_used, set = _c.set })
			or localize("k_none")
		return { vars = { self.config.num, loc_tag } }
	end,
	preview_ui = function(self, tag)
		if G.GAME.cry_last_tag_used then
			local last_tag = Tag(G.GAME.cry_last_tag_used, true)
			last_tag.ability.orbital_hand = G.GAME.cry_memory_orbital
			local tag_sprite
			_, tag_sprite = last_tag:generate_UI(0.4)
			return {
				n = G.UIT.C,
				nodes = {
					{
						n = G.UIT.R,
						nodes = {
							{ n = G.UIT.T, config = { text = ">", colour = G.C.WHITE, scale = 0.4 } },
							{ n = G.UIT.O, config = { object = tag_sprite } },
							G.P_TAGS[G.GAME.cry_last_tag_used].preview_ui
								and G.P_TAGS[G.GAME.cry_last_tag_used]:preview_ui(last_tag),
						},
					},
				},
			}
		end
	end,
	apply = function(self, tag, context)
		if context.type == "immediate" and G.GAME.cry_last_tag_used then
			local lock = tag.ID
			G.CONTROLLER.locks[lock] = true
			tag:yep("+", G.C.ATTENTION, function()
				for i = 1, 2 do
					local t = Tag(G.GAME.cry_last_tag_used)
					t.ability.orbital_hand = G.GAME.cry_memory_orbital
					add_tag(t)
				end
				G.CONTROLLER.locks[lock] = nil
				return true
			end)
			tag.triggered = true
			return true
		end
	end,
	in_pool = function()
		return G.GAME.cry_last_tag_used and true
	end,
	init = function(self)
		--store last tag used
		local tapr = Tag.apply_to_run
		function Tag:apply_to_run(x)
			local ret = tapr(self, x)
			if
				self.triggered
				and self.key ~= "tag_double"
				and self.key ~= "tag_cry_memory"
				and self.key ~= "tag_cry_triple"
				and self.key ~= "tag_cry_quadruple"
				and self.key ~= "tag_cry_quintuple"
				and self.key ~= "tag_ortalab_rewind"
			then
				G.GAME.cry_last_tag_used = self.key
				G.GAME.cry_memory_orbital = self.ability.orbital_hand
			end
			return ret
		end
	end,
}
local glitched_tag = {
	cry_credits = {
		idea = {
			"Jevonn",
		},
		art = {
			"Jevonn",
		},
		code = {
			"Jevonn",
		},
	},
	object_type = "Tag",
	dependencies = {
		items = {
			"set_cry_tag",
			"e_cry_glitched",
		},
	},
	atlas = "tag_cry",
	pos = { x = 5, y = 0 },
	name = "cry-Glitched Tag",
	order = 2,
	config = { type = "store_joker_modify", edition = "cry_glitched" },
	key = "glitched",
	min_ante = 1,
	requires = "e_cry_glitched",
	loc_vars = function(self, info_queue)
		info_queue[#info_queue + 1] = G.P_CENTERS.e_cry_glitched
		return { vars = {} }
	end,
	apply = function(self, tag, context)
		if context.type == "store_joker_modify" then
			local _applied = nil
			if Cryptid.forced_edition() then
				tag:nope()
			end
			if not context.card.edition and not context.card.temp_edition and context.card.ability.set == "Joker" then
				local lock = tag.ID
				G.CONTROLLER.locks[lock] = true
				context.card.temp_edition = true
				tag:yep("+", G.C.DARK_EDITION, function()
					context.card:set_edition({ cry_glitched = true }, true)
					context.card.ability.couponed = true
					context.card:set_cost()
					context.card.temp_edition = nil
					G.CONTROLLER.locks[lock] = nil
					return true
				end)
				_applied = true
				tag.triggered = true
			end
		end
	end,
}
local oversat_tag = {
	cry_credits = {
		idea = {
			"Jevonn",
		},
		art = {
			"Jevonn",
		},
		code = {
			"Jevonn",
		},
	},
	object_type = "Tag",
	dependencies = {
		items = {
			"set_cry_tag",
			"e_cry_oversat",
		},
	},
	atlas = "tag_cry",
	pos = { x = 7, y = 1 },
	name = "cry-Oversaturated Tag",
	order = 4,
	config = { type = "store_joker_modify", edition = "cry_oversat" },
	key = "oversat",
	requires = "e_cry_oversat",
	min_ante = 2,
	loc_vars = function(self, info_queue)
		info_queue[#info_queue + 1] = G.P_CENTERS.e_cry_oversat
		return { vars = {} }
	end,
	apply = function(self, tag, context)
		if context.type == "store_joker_modify" then
			local _applied = nil
			if Cryptid.forced_edition() then
				tag:nope()
			end
			if not context.card.edition and not context.card.temp_edition and context.card.ability.set == "Joker" then
				local lock = tag.ID
				G.CONTROLLER.locks[lock] = true
				context.card.temp_edition = true
				tag:yep("+", G.C.DARK_EDITION, function()
					context.card:set_edition({ cry_oversat = true }, true)
					context.card.ability.couponed = true
					context.card:set_cost()
					context.card.temp_edition = nil
					G.CONTROLLER.locks[lock] = nil
					return true
				end)
				_applied = true
				tag.triggered = true
			end
		end
	end,
}
local mosaic_tag = {
	cry_credits = {
		idea = {
			"Jevonn",
		},
		art = {
			"Jevonn",
		},
		code = {
			"Jevonn",
		},
	},
	object_type = "Tag",
	dependencies = {
		items = {
			"set_cry_tag",
			"e_cry_mosaic",
		},
	},
	atlas = "tag_cry",
	pos = { x = 5, y = 1 },
	name = "cry-Mosaic Tag",
	order = 3,
	config = { type = "store_joker_modify", edition = "cry_mosaic" },
	key = "mosaic",
	requires = "e_cry_mosaic",
	min_ante = 2,
	loc_vars = function(self, info_queue)
		info_queue[#info_queue + 1] = G.P_CENTERS.e_cry_mosaic
		return { vars = {} }
	end,
	apply = function(self, tag, context)
		if context.type == "store_joker_modify" then
			local _applied = nil
			if Cryptid.forced_edition() then
				tag:nope()
			end
			if not context.card.edition and not context.card.temp_edition and context.card.ability.set == "Joker" then
				local lock = tag.ID
				G.CONTROLLER.locks[lock] = true
				context.card.temp_edition = true
				tag:yep("+", G.C.DARK_EDITION, function()
					context.card:set_edition({ cry_mosaic = true }, true)
					context.card.ability.couponed = true
					context.card:set_cost()
					context.card.temp_edition = nil
					G.CONTROLLER.locks[lock] = nil
					return true
				end)
				_applied = true
				tag.triggered = true
			end
		end
	end,
}
local gold_tag = {
	cry_credits = {
		idea = {
			"Jevonn",
		},
		art = {
			"Jevonn",
		},
		code = {
			"Jevonn",
		},
	},
	object_type = "Tag",
	dependencies = {
		items = {
			"set_cry_tag",
			"e_cry_gold",
		},
	},
	atlas = "tag_cry",
	pos = { x = 6, y = 0 },
	name = "cry-Golden Tag",
	order = 6,
	config = { type = "store_joker_modify", edition = "cry_gold" },
	key = "gold",
	requires = "e_cry_gold",
	min_ante = 3,
	loc_vars = function(self, info_queue)
		info_queue[#info_queue + 1] = G.P_CENTERS.e_cry_gold
		return { vars = {} }
	end,
	apply = function(self, tag, context)
		if context.type == "store_joker_modify" then
			local _applied = nil
			if Cryptid.forced_edition() then
				tag:nope()
			end
			if not context.card.edition and not context.card.temp_edition and context.card.ability.set == "Joker" then
				local lock = tag.ID
				G.CONTROLLER.locks[lock] = true
				context.card.temp_edition = true
				tag:yep("+", G.C.DARK_EDITION, function()
					context.card:set_edition({ cry_gold = true }, true)
					context.card.ability.couponed = true
					context.card:set_cost()
					context.card.temp_edition = nil
					G.CONTROLLER.locks[lock] = nil
					return true
				end)
				_applied = true
				tag.triggered = true
			end
		end
	end,
}
local glass_tag = {
	cry_credits = {
		idea = {
			"Jevonn",
		},
		art = {
			"Jevonn",
		},
		code = {
			"Jevonn",
		},
	},
	object_type = "Tag",
	dependencies = {
		items = {
			"set_cry_tag",
			"e_cry_glass",
		},
	},
	atlas = "tag_cry",
	pos = { x = 4, y = 0 },
	name = "cry-Glass Tag",
	order = 5,
	config = { type = "store_joker_modify", edition = "cry_glass" },
	key = "glass",
	requires = "e_cry_glass",
	min_ante = 3,
	loc_vars = function(self, info_queue)
		info_queue[#info_queue + 1] = G.P_CENTERS.e_cry_glass
		return { vars = {} }
	end,
	apply = function(self, tag, context)
		if context.type == "store_joker_modify" then
			local _applied = nil
			if Cryptid.forced_edition() then
				tag:nope()
			end
			if not context.card.edition and not context.card.temp_edition and context.card.ability.set == "Joker" then
				local lock = tag.ID
				G.CONTROLLER.locks[lock] = true
				context.card.temp_edition = true
				tag:yep("+", G.C.DARK_EDITION, function()
					context.card:set_edition({ cry_glass = true }, true)
					context.card.ability.couponed = true
					context.card:set_cost()
					context.card.temp_edition = nil
					G.CONTROLLER.locks[lock] = nil
					return true
				end)
				_applied = true
				tag.triggered = true
			end
		end
	end,
}
local blur_tag = {
	cry_credits = {
		idea = {
			"Jevonn",
		},
		art = {
			"Jevonn",
		},
		code = {
			"Jevonn",
		},
	},
	object_type = "Tag",
	dependencies = {
		items = {
			"set_cry_tag",
			"e_cry_blur",
		},
	},
	atlas = "tag_cry",
	pos = { x = 7, y = 0 },
	name = "cry-Blurred Tag",
	order = 7,
	config = { type = "store_joker_modify", edition = "cry_blur" },
	key = "blur",
	requires = "e_cry_blur",
	min_ante = 3,
	loc_vars = function(self, info_queue)
		info_queue[#info_queue + 1] = G.P_CENTERS.e_cry_blur
		return { vars = {} }
	end,
	apply = function(self, tag, context)
		if context.type == "store_joker_modify" then
			local _applied = nil
			if Cryptid.forced_edition() then
				tag:nope()
			end
			if not context.card.edition and not context.card.temp_edition and context.card.ability.set == "Joker" then
				local lock = tag.ID
				G.CONTROLLER.locks[lock] = true
				context.card.temp_edition = true
				tag:yep("+", G.C.DARK_EDITION, function()
					context.card:set_edition({ cry_blur = true }, true)
					context.card.ability.couponed = true
					context.card:set_cost()
					context.card.temp_edition = nil
					G.CONTROLLER.locks[lock] = nil
					return true
				end)
				_applied = true
				tag.triggered = true
			end
		end
	end,
}
--order 8 reserved for Noisy tag (if it ever has a shader / comes into existence)
local astral_tag = {
	cry_credits = {
		idea = {
			"Jevonn",
		},
		art = {
			"Jevonn",
		},
		code = {
			"Jevonn",
		},
	},
	object_type = "Tag",
	dependencies = {
		items = {
			"set_cry_tag",
			"e_cry_astral",
		},
	},
	atlas = "tag_cry",
	pos = { x = 6, y = 1 },
	name = "cry-Astral Tag",
	order = 9,
	config = { type = "store_joker_modify", edition = "cry_astral" },
	key = "astral",
	requires = "e_cry_astral",
	min_ante = 9,
	loc_vars = function(self, info_queue)
		info_queue[#info_queue + 1] = G.P_CENTERS.e_cry_astral
		return { vars = {} }
	end,
	apply = function(self, tag, context)
		if context.type == "store_joker_modify" then
			local _applied = nil
			if Cryptid.forced_edition() then
				tag:nope()
			end
			if not context.card.edition and not context.card.temp_edition and context.card.ability.set == "Joker" then
				local lock = tag.ID
				G.CONTROLLER.locks[lock] = true
				context.card.temp_edition = true
				tag:yep("+", G.C.DARK_EDITION, function()
					context.card:set_edition({ cry_astral = true }, true)
					context.card.ability.couponed = true
					context.card:set_cost()
					context.card.temp_edition = nil
					G.CONTROLLER.locks[lock] = nil
					return true
				end)
				_applied = true
				tag.triggered = true
			end
		end
	end,
}
local m_tag = {
	cry_credits = {
		idea = {
			"Jevonn",
		},
		art = {
			"Jevonn",
		},
		code = {
			"Jevonn",
		},
	},
	object_type = "Tag",
	dependencies = {
		items = {
			"set_cry_tag",
			"e_cry_m",
		},
	},
	atlas = "tag_cry",
	pos = { x = 4, y = 1 },
	name = "cry-Jolly Tag",
	order = 10,
	config = { type = "store_joker_modify", edition = "cry_m" },
	key = "m",
	requires = "e_cry_m",
	min_ante = 1,
	loc_vars = function(self, info_queue)
		info_queue[#info_queue + 1] = G.P_CENTERS.e_cry_m
		return { vars = {} }
	end,
	apply = function(self, tag, context)
		if context.type == "store_joker_modify" then
			local _applied = nil
			if Cryptid.forced_edition() then
				tag:nope()
			end
			if not context.card.edition and not context.card.temp_edition and context.card.ability.set == "Joker" then
				local lock = tag.ID
				G.CONTROLLER.locks[lock] = true
				context.card.temp_edition = true
				tag:yep("M", G.C.DARK_EDITION, function()
					context.card:set_edition({ cry_m = true }, true)
					context.card.ability.couponed = true
					context.card:set_cost()
					context.card.temp_edition = nil
					G.CONTROLLER.locks[lock] = nil
					return true
				end)
				_applied = true
				tag.triggered = true
			end
		end
	end,
}
local double_m_tag = {
	cry_credits = {
		idea = {
			"Jevonn",
		},
		art = {
			"Jevonn",
		},
		code = {
			"Jevonn",
		},
	},
	object_type = "Tag",
	dependencies = {
		items = {
			"set_cry_tag",
			"set_cry_m",
			"e_cry_m",
		},
	},
	atlas = "tag_cry",
	pos = { x = 7, y = 2 },
	name = "cry-Double M Tag",
	order = 11,
	config = { type = "store_joker_create", edition = "cry_m" },
	key = "double_m",
	requires = "j_cry_smallestm",
	loc_vars = function(self, info_queue)
		info_queue[#info_queue + 1] = G.P_CENTERS.e_cry_m
		return { vars = {} }
	end,
	apply = function(self, tag, context)
		if context.type == "store_joker_create" then
			local card
			card = create_card("M", context.area, nil, nil, nil, nil, nil, pseudoseed("M_is_love_M_is_life"))
			card:set_edition({
				cry_m = true,
			})
			create_shop_card_ui(card, "Joker", context.area)
			card.states.visible = false
			tag:yep("MM", G.C.CRY_JOLLY, function()
				card:start_materialize()
				card.ability.couponed = true
				card:set_cost()
				return true
			end)
			tag.triggered = true
			return card
		end
	end,
	in_pool = function()
		return false
	end,
}
local banana = {
	cry_credits = {
		idea = {
			"Jevonn",
		},
		art = {
			"Jevonn",
		},
		code = {
			"Jevonn",
		},
	},
	object_type = "Tag",
	dependencies = {
		items = {
			"set_cry_tag",
		},
	},
	name = "cry-Banana Tag",
	order = 27,
	atlas = "tag_cry",
	pos = { x = 5, y = 2 },
	config = { type = "immediate" },
	key = "banana",
	loc_vars = function(self, info_queue)
		local banana
		if G.GAME.pool_flags.gros_michel_extinct == true then
			banana = localize({
				type = "name_text",
				set = "Joker",
				key = G.P_CENTER_POOLS["Joker"][61].key,
			})
			info_queue[#info_queue + 1] = {
				set = "Joker",
				key = "j_cavendish",
				specific_vars = { 3, G.GAME.probabilities.normal or 1, 1000 },
			}
		else
			banana = localize({
				type = "name_text",
				set = "Joker",
				key = G.P_CENTER_POOLS["Joker"][38].key,
			})
			info_queue[#info_queue + 1] = {
				set = "Joker",
				key = "j_gros_michel",
				specific_vars = { 15, G.GAME.probabilities.normal or 1, 6 },
			}
		end
		return { vars = { banana } }
	end,
	min_ante = 2,
	apply = function(self, tag, context)
		if context.type == "immediate" then
			if G.jokers and #G.jokers.cards < G.jokers.config.card_limit then
				local lock = tag.ID
				G.CONTROLLER.locks[lock] = true
				tag:yep("+", G.C.PURPLE, function()
					if G.jokers and #G.jokers.cards < G.jokers.config.card_limit then --Needs another check here because that's how tags work :D:D:D:D:D:D:D
						if G.GAME.pool_flags.gros_michel_extinct == true then
							local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_cavendish")
							card:add_to_deck()
							G.jokers:emplace(card)
						else
							local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_gros_michel")
							card:add_to_deck()
							G.jokers:emplace(card)
						end
					end
					G.CONTROLLER.locks[lock] = nil
					return true
				end)
			else
				tag:nope()
			end
			tag.triggered = true
			return true
		end
	end,
}
local scope = {
	cry_credits = {
		idea = {
			"Jevonn",
		},
		art = {
			"Jevonn",
		},
		code = {
			"Jevonn",
		},
	},
	object_type = "Tag",
	dependencies = {
		items = {
			"set_cry_tag",
		},
	},
	atlas = "tag_cry",
	pos = { x = 6, y = 2 },
	name = "cry-Scope Tag",
	order = 23,
	config = { type = "round_start_bonus", num = 2 },
	key = "scope",
	min_ante = 2,
	loc_vars = function(self, info_queue)
		return { vars = { self.config.num } }
	end,
	apply = function(self, tag, context)
		if context.type == "round_start_bonus" then
			tag:yep("+", G.C.BLUE, function()
				return true
			end)
			ease_hands_played(tag.config.num)
			ease_discard(tag.config.num)
			tag.triggered = true
			return true
		end
	end,
}
local loss = {
	cry_credits = {
		idea = {
			"Jevonn",
		},
		art = {
			"Jevonn",
		},
		code = {
			"Jevonn",
		},
	},
	object_type = "Tag",
	dependencies = {
		items = {
			"set_cry_tag",
			"p_cry_meme_1",
		},
	},
	atlas = "tag_cry",
	pos = { x = 1, y = 3 },
	name = "cry-Loss Tag",
	order = 25,
	config = { type = "new_blind_choice" },
	key = "loss",
	min_ante = 2,
	loc_vars = function(self, info_queue)
		info_queue[#info_queue + 1] = { set = "Other", key = "p_cry_meme_1", specific_vars = { 2, 5 } }
		return { vars = {} }
	end,
	apply = function(self, tag, context)
		if context.type == "new_blind_choice" then
			local lock = tag.ID
			G.CONTROLLER.locks[lock] = true
			tag:yep("+", G.C.SECONDARY_SET.Spectral, function()
				local key = "p_cry_meme_1"
				local card = Card(
					G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2,
					G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2,
					G.CARD_W * 1.27,
					G.CARD_H * 1.27,
					G.P_CARDS.empty,
					G.P_CENTERS[key],
					{ bypass_discovery_center = true, bypass_discovery_ui = true }
				)
				card.cost = 0
				card.from_tag = true
				G.FUNCS.use_card({ config = { ref_table = card } })
				if G.GAME.modifiers.cry_force_edition and not G.GAME.modifiers.cry_force_random_edition then
					card:set_edition(nil, true, true)
				elseif G.GAME.modifiers.cry_force_random_edition then
					local edition = Cryptid.poll_random_edition()
					card:set_edition(edition, true, true)
				end
				card:start_materialize()
				G.CONTROLLER.locks[lock] = nil
				return true
			end)
			tag.triggered = true
			return true
		end
	end,
}
local gourmand = {
	cry_credits = {
		idea = {
			"Personthateatcheese",
		},
		art = {
			"Personthateatcheese",
		},
		code = {
			"Jevonn",
		},
	},
	object_type = "Tag",
	dependencies = {
		items = {
			"set_cry_tag",
		},
	},
	atlas = "tag_cry",
	pos = { x = 2, y = 3 },
	name = "cry-Gourmand Tag",
	order = 17,
	config = { type = "store_joker_create" },
	key = "gourmand",
	loc_vars = function(self, info_queue)
		info_queue[#info_queue + 1] = { set = "Other", key = "food_jokers" }
		return { vars = {} }
	end,
	apply = function(self, tag, context)
		if context.type == "store_joker_create" then
			local card = create_card("Food", context.area, nil, nil, nil, nil, nil, "cry_gourmand")
			create_shop_card_ui(card, "Joker", context.area)
			card.states.visible = false
			tag:yep("+", G.C.GREEN, function()
				card:start_materialize()
				card.ability.couponed = true
				card:set_cost()
				return true
			end)
			tag.triggered = true
			return card
		end
	end,
}
local better_top_up = {
	cry_credits = {
		idea = {
			"Mjiojio",
		},
		art = {
			"Jevonn",
		},
		code = {
			"Jevonn",
		},
	},
	object_type = "Tag",
	dependencies = {
		items = {
			"set_cry_tag",
		},
	},
	name = "cry-Better Top-up Tag",
	order = 15,
	atlas = "tag_cry",
	pos = { x = 4, y = 3 },
	config = { type = "immediate", spawn_jokers = 2 },
	key = "bettertop_up",
	loc_vars = function(self, info_queue)
		return { vars = { self.config.spawn_jokers } }
	end,
	min_ante = 5,
	apply = function(self, tag, context)
		if context.type == "immediate" then
			if G.jokers and #G.jokers.cards < G.jokers.config.card_limit then
				local lock = tag.ID
				G.CONTROLLER.locks[lock] = true
				tag:yep("+", G.C.GREEN, function()
					for i = 1, tag.config.spawn_jokers do
						if G.jokers and #G.jokers.cards < G.jokers.config.card_limit then
							local card = create_card("Joker", G.jokers, nil, 0.8, nil, nil, nil, "bettertop")
							card:add_to_deck()
							G.jokers:emplace(card)
						end
					end
					G.CONTROLLER.locks[lock] = nil
					return true
				end)
			else
				tag:nope()
			end
			tag.triggered = true
			return true
		end
	end,
}
local better_voucher = {
	cry_credits = {
		idea = {
			"Mystic Misclick",
		},
		art = {
			"Mystic Misclick",
		},
		code = {
			"Jevonn",
		},
	},
	object_type = "Tag",
	dependencies = {
		items = {
			"set_cry_tag",
			"set_cry_tier3",
		},
	},
	atlas = "tag_cry",
	pos = { x = 3, y = 3 },
	name = "cry-Golden Voucher Tag",
	order = 14,
	config = { type = "voucher_add" },
	min_ante = 4,
	key = "better_voucher",
	loc_vars = function(self, info_queue)
		return { vars = { (SMODS.Mods["Tier3Sub"] and 4 or 3) } }
	end,
	apply = function(self, tag, context)
		if context.type == "voucher_add" then
			tag:yep("+", G.C.SECONDARY_SET.Voucher, function()
				G.ARGS.voucher_tag = G.ARGS.voucher_tag or {}
				local voucher_key = Cryptid.next_tier3_key(true)
				G.ARGS.voucher_tag[voucher_key] = true
				G.shop_vouchers.config.card_limit = G.shop_vouchers.config.card_limit + 1
				local card = Card(
					G.shop_vouchers.T.x + G.shop_vouchers.T.w / 2,
					G.shop_vouchers.T.y,
					G.CARD_W,
					G.CARD_H,
					G.P_CARDS.empty,
					G.P_CENTERS[voucher_key],
					{ bypass_discovery_center = true, bypass_discovery_ui = true }
				)
				Cryptid.misprintize(card)
				create_shop_card_ui(card, "Voucher", G.shop_vouchers)
				card:start_materialize()
				if G.GAME.modifiers.cry_force_edition and not G.GAME.modifiers.cry_force_random_edition then
					card:set_edition(nil, true)
				elseif G.GAME.modifiers.cry_force_random_edition then
					local edition = Cryptid.poll_random_edition()
					card:set_edition(edition, true)
				end

				if G.GAME.modifiers.cry_force_sticker == "eternal" or G.GAME.modifiers.cry_sticker_sheet_plus then
					card:set_eternal(true)
					card.ability.eternal = true
				end
				if G.GAME.modifiers.cry_force_sticker == "perishable" or G.GAME.modifiers.cry_sticker_sheet_plus then
					card:set_perishable(true)
					card.ability.perishable = true
				end
				if G.GAME.modifiers.cry_force_sticker == "rental" or G.GAME.modifiers.cry_sticker_sheet_plus then
					card:set_rental(true)
					card.ability.rental = true
				end
				if G.GAME.modifiers.cry_force_sticker == "pinned" or G.GAME.modifiers.cry_sticker_sheet_plus then
					card.pinned = true
				end
				if G.GAME.modifiers.cry_force_sticker == "banana" or G.GAME.modifiers.cry_sticker_sheet_plus then
					card.ability.banana = true
				end
				if G.GAME.modifiers.cry_sticker_sheet_plus then
					if G.GAME.modifiers.cry_sticker_sheet then
						for k, v in pairs(SMODS.Stickers) do
							v:set_sticker(card, true)
						end
					end
				end
				G.shop_vouchers:emplace(card)
				G.ARGS.voucher_tag = nil
				return true
			end)
			tag.triggered = true
		end
	end,
}
local booster = {
	cry_credits = {
		idea = {
			"Watermelon Lover",
		},
		art = {
			"Maw",
		},
		code = {
			"Jevonn",
		},
	},
	object_type = "Tag",
	dependencies = {
		items = {
			"set_cry_tag",
		},
	},
	name = "cry-Booster Tag",
	order = 28,
	atlas = "tag_cry",
	pos = { x = 5, y = 3 },
	config = { type = "immediate" },
	key = "booster",
	loc_vars = function(self, info_queue)
		return { vars = {} }
	end,
	min_ante = 4,
	apply = function(self, tag, context)
		if context.type == "immediate" then
			local lock = tag.ID
			G.CONTROLLER.locks[lock] = true
			tag:yep("+", G.C.BLUE, function()
				G.GAME.boostertag = (G.GAME.boostertag or 0) + 1
				G.CONTROLLER.locks[lock] = nil
				return true
			end)
			tag.triggered = true
			return true
		end
	end,
}
local tagitems = {
	cat,
	empoweredPack,
	empowered,
	gambler,
	bundle,
	memory,
	schematic,
	banana,
	scope,
	gourmand,
	better_top_up,
	booster,
	better_voucher,
	epic_tag,
	glitched_tag,
	oversat_tag,
	mosaic_tag,
	gold_tag,
	glass_tag,
	blur_tag,
	astral_tag,
	loss,
	m_tag,
	double_m_tag,
}
return {
	name = "Tags",
	init = function() end,
	items = tagitems,
}
