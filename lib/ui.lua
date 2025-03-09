-- ui.lua - Code used for new UI elements/changes in Cryptid

-- Add/modify Steamodded Draw Steps to work with Cryptid

-- Edition Decks
SMODS.DrawStep({
	key = "back_edition",
	order = 5,
	func = function(self)
		if Cryptid.safe_get(self, "area", "config", "type") == "deck" then
			-- following here is a horrendous mod compatability line
			local currentBack = not self.params.galdur_selector
					and ((Galdur and Galdur.config.use and type(self.params.galdur_back) == "table" and self.params.galdur_back) or type(
						self.params.viewed_back
					) == "table" and self.params.viewed_back or (self.params.viewed_back and G.GAME.viewed_back or G.GAME.selected_back))
				or Back(G.P_CENTERS["b_red"])
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

-- Make hover UI collidable - so we can detect collision and display tooltips
local m = Card.move
function Card:move(dt)
	m(self, dt)
	if self.children.h_popup then
		self.children.h_popup.states.collide.can = true
		if not self:force_popup() and not self.states.hover.is then
			self.children.h_popup:remove()
			self.children.h_popup = nil
		end
	end
end

-- This defines when we should show a card's description even when it's not hovered
function Card:force_popup()
	-- Must be selected
	if self.highlighted then
		-- Remove all popups in the pause menu (collection excluded)
		if G.SETTINGS.paused and not self.area.config.collection then
			return false
		end
		-- Playing cards
		if
			self.config.center.set == "Default"
			or self.config.center.set == "Base"
			or self.config.center.set == "Enhanced"
		then
			return false
		end
		-- Incantation mod compat
		if SMODS.Mods["incantation"] and self.area == G.consumeables then
			return false
		end
		-- Other areas where it doesn't work well
		if self.area == G.pack_cards then
			return false
		end
		return true
	end
end

-- Hacky hook to make cards selectable in the collection
-- Unfortunately this doesn't play nicely with gameset UI
local cainit = CardArea.init
function CardArea:init(X, Y, W, H, config)
	if config.collection then
		config.highlight_limit = config.card_limit
	end
	return cainit(self, X, Y, W, H, config)
end

-- Allow highlighting in the collection
local cach = CardArea.can_highlight
function CardArea:can_highlight(card)
	if self.config.collection then
		return true
	end
	return cach(self)
end

-- Prevent hover UI from being redrawn
local ch = Card.hover
function Card:hover()
	if self.children.h_popup then
		return
	end
	ch(self)
end
