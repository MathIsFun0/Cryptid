-- ui.lua - Code used for new UI elements/changes in Cryptid

-- Add/modify Steamodded Draw Steps to work with Cryptid

-- Edition Decks
SMODS.DrawStep({
	key = "back_edition",
	order = 5,
	func = function(self)
		if Cryptid.safe_get(self, "area", "config", "type") == "deck" then
			local currentBack = self.params.viewed_back and G.GAME.viewed_back or G.GAME.selected_back
			if currentBack.effect.config.cry_force_edition and not currentBack.effect.config.cry_antimatter then
				if currentBack.effect.config.cry_force_edition_shader then
					self.children.back:draw_shader(
						currentBack.effect.config.cry_force_edition_shader,
						nil,
						self.ARGS.send_to_shader,
						true
					)
				else
					self.children.back:draw_shader(
						currentBack.effect.config.cry_force_edition,
						nil,
						self.ARGS.send_to_shader,
						true
					)
				end
			end
			if
				currentBack.effect.config.cry_force_seal
				and not currentBack.effect.config.hide_seal
				and not currentBack.effect.config.cry_antimatter
			then
				G.shared_seals[currentBack.effect.config.cry_force_seal]:draw_shader(
					"dissolve",
					nil,
					nil,
					true,
					self.children.center
				)
				if currentBack.effect.config.cry_force_seal == "Gold" then
					G.shared_seals[currentBack.effect.config.cry_force_seal]:draw_shader(
						"voucher",
						nil,
						self.ARGS.send_to_shader,
						true,
						self.children.center
					)
				end
			end
			if currentBack.effect.config.cry_force_sticker and not currentBack.effect.config.cry_antimatter then
				for k, v in pairs(SMODS.Stickers) do
					if currentBack.effect.config.cry_force_sticker == v.key then
						if v and v.draw and type(v.draw) == "function" then
							v:draw(self)
						else
							G.shared_stickers[v.key].role.draw_major = self
							G.shared_stickers[v.key]:draw_shader("dissolve", nil, nil, true, self.children.center)
							G.shared_stickers[v.key]:draw_shader(
								"voucher",
								nil,
								self.ARGS.send_to_shader,
								true,
								self.children.center
							)
						end
					end
				end
			end
			if
				currentBack.effect.config.cry_antimatter
				or currentBack.effect.config.cry_force_edition == "negative"
			then
				self.children.back:draw_shader("negative", nil, self.ARGS.send_to_shader, true)
				self.children.center:draw_shader("negative_shine", nil, self.ARGS.send_to_shader, true)
			end
			if currentBack.effect.center.edeck_type then
				local edition, enhancement, sticker, suit, seal = Cryptid.enhanced_deck_info(currentBack)
				local sprite = Cryptid.edeck_atlas_update(currentBack.effect.center)
				self.children.back.atlas = G.ASSET_ATLAS[sprite.atlas] or self.children.back.atlas
				self.children.back.sprite_pos = sprite.pos
				self.children.back:reset()
				if currentBack.effect.center.edeck_type == "edition" then
					self.children.back:draw_shader(edition, nil, self.ARGS.send_to_shader, true)
					if edition == "negative" then
						self.children.back:draw_shader("negative", nil, self.ARGS.send_to_shader, true)
						self.children.center:draw_shader("negative_shine", nil, self.ARGS.send_to_shader, true)
					end
				end
				if currentBack.effect.center.edeck_type == "seal" then
					G.shared_seals[seal]:draw_shader("dissolve", nil, nil, true, self.children.center)
					if seal == "Gold" then
						G.shared_seals[seal]:draw_shader(
							"voucher",
							nil,
							self.ARGS.send_to_shader,
							true,
							self.children.center
						)
					end
				end
				if currentBack.effect.center.edeck_type == "sticker" then
					for k, v in pairs(SMODS.Stickers) do
						if sticker == v.key then
							if v and v.draw and type(v.draw) == "function" then
								v:draw(self)
							else
								G.shared_stickers[v.key].role.draw_major = self
								G.shared_stickers[v.key]:draw_shader("dissolve", nil, nil, true, self.children.center)
								G.shared_stickers[v.key]:draw_shader(
									"voucher",
									nil,
									self.ARGS.send_to_shader,
									true,
									self.children.center
								)
							end
						end
					end
				end
			end
		end
	end,
	conditions = { vortex = false, facing = "back" },
})
-- Third Layer
SMODS.DrawStep({
	key = "floating_sprite2",
	order = 59,
	func = function(self)
		if self.ability.name == "cry-Gateway" and (self.config.center.discovered or self.bypass_discovery_center) then
			local scale_mod2 = 0.07 -- + 0.02*math.cos(1.8*G.TIMERS.REAL) + 0.00*math.cos((G.TIMERS.REAL - math.floor(G.TIMERS.REAL))*math.pi*14)*(1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL)))^3
			local rotate_mod2 = 0 --0.05*math.cos(1.219*G.TIMERS.REAL) + 0.00*math.cos((G.TIMERS.REAL)*math.pi*5)*(1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL)))^2
			self.children.floating_sprite2:draw_shader(
				"dissolve",
				0,
				nil,
				nil,
				self.children.center,
				scale_mod2,
				rotate_mod2,
				nil,
				0.1 --[[ + 0.03*math.cos(1.8*G.TIMERS.REAL)--]],
				nil,
				0.6
			)
			self.children.floating_sprite2:draw_shader(
				"dissolve",
				nil,
				nil,
				nil,
				self.children.center,
				scale_mod2,
				rotate_mod2
			)

			local scale_mod = 0.05
				+ 0.05 * math.sin(1.8 * G.TIMERS.REAL)
				+ 0.07
					* math.sin((G.TIMERS.REAL - math.floor(G.TIMERS.REAL)) * math.pi * 14)
					* (1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL))) ^ 3
			local rotate_mod = 0.1 * math.sin(1.219 * G.TIMERS.REAL)
				+ 0.07
					* math.sin(G.TIMERS.REAL * math.pi * 5)
					* (1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL))) ^ 2

			self.children.floating_sprite.role.draw_major = self
			self.children.floating_sprite:draw_shader(
				"dissolve",
				0,
				nil,
				nil,
				self.children.center,
				scale_mod,
				rotate_mod,
				nil,
				0.1 + 0.03 * math.sin(1.8 * G.TIMERS.REAL),
				nil,
				0.6
			)
			self.children.floating_sprite:draw_shader(
				"dissolve",
				nil,
				nil,
				nil,
				self.children.center,
				scale_mod,
				rotate_mod
			)
		end
		if
			self.config.center.soul_pos
			and self.config.center.soul_pos.extra
			and (self.config.center.discovered or self.bypass_discovery_center)
		then
			local scale_mod = 0.07 -- + 0.02*math.cos(1.8*G.TIMERS.REAL) + 0.00*math.cos((G.TIMERS.REAL - math.floor(G.TIMERS.REAL))*math.pi*14)*(1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL)))^3
			local rotate_mod = 0 --0.05*math.cos(1.219*G.TIMERS.REAL) + 0.00*math.cos((G.TIMERS.REAL)*math.pi*5)*(1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL)))^2
			self.children.floating_sprite2:draw_shader(
				"dissolve",
				0,
				nil,
				nil,
				self.children.center,
				scale_mod,
				rotate_mod,
				nil,
				0.1 --[[ + 0.03*math.cos(1.8*G.TIMERS.REAL)--]],
				nil,
				0.6
			)
			self.children.floating_sprite2:draw_shader(
				"dissolve",
				nil,
				nil,
				nil,
				self.children.center,
				scale_mod,
				rotate_mod
			)
		end
	end,
	conditions = { vortex = false, facing = "front" },
})
SMODS.draw_ignore_keys.floating_sprite2 = true
