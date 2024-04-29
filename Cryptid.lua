--- STEAMODDED HEADER
--- MOD_NAME: Cryptid
--- MOD_ID: Cryptid
--- MOD_AUTHOR: [MathIsFun_, Balatro Discord]
--- MOD_DESCRIPTION: Adds unbalanced ideas to Balatro.
--- BADGE_COLOUR: 708b91

----------------------------------------------
------------MOD CODE -------------------------

_RELEASE_MODE = false

function SMODS.INIT.Cryptid()
    -- Custom Rarity setup (based on Relic-Jokers)
	G.localization.misc.dictionary.k_cry_exotic = "Exotic"
    Game:set_globals()
    G.C.RARITY["Exotic"] = HEX("708b91");
    local SMODS_inject_jokers_ref = SMODS.injectJokers
	function SMODS.injectJokers()
		G.P_JOKER_RARITY_POOLS["Exotic"] = {}
		SMODS_inject_jokers_ref()
	end
    local get_badge_colourref = get_badge_colour
	function get_badge_colour(key)
		local fromRef = get_badge_colourref(key)
	
		if key == 'cry_exotic' then return G.C.RARITY["Exotic"]
		else return fromRef end
	end

    -- Midground sprites
    local set_spritesref = Card.set_sprites
    function Card:set_sprites(_center, _front)
        set_spritesref(self, _center, _front);
        if _center and _center.soul_pos and _center.soul_pos.extra then
            self.children.floating_sprite2 = Sprite(self.T.x, self.T.y, self.T.w, self.T.h, G.ASSET_ATLAS[_center.atlas or _center.set], _center.soul_pos.extra)
            self.children.floating_sprite2.role.draw_major = self
            self.children.floating_sprite2.states.hover.can = false
            self.children.floating_sprite2.states.click.can = false
        end
    end

    -- Temporary full override, this is to get midground layers working
    function Card:draw(layer)
        layer = layer or 'both'
    
        self.hover_tilt = 1
        
        if not self.states.visible then return end
        
        if (layer == 'shadow' or layer == 'both') then
            self.ARGS.send_to_shader = self.ARGS.send_to_shader or {}
            self.ARGS.send_to_shader[1] = math.min(self.VT.r*3, 1) + G.TIMERS.REAL/(28) + (self.juice and self.juice.r*20 or 0) + self.tilt_var.amt
            self.ARGS.send_to_shader[2] = G.TIMERS.REAL
    
            for k, v in pairs(self.children) do
                v.VT.scale = self.VT.scale
            end
        end
    
        G.shared_shadow = self.sprite_facing == 'front' and self.children.center or self.children.back
    
        --Draw the shadow
        if not self.no_shadow and G.SETTINGS.GRAPHICS.shadows == 'On' and((layer == 'shadow' or layer == 'both') and (self.ability.effect ~= 'Glass Card' and not self.greyed) and ((self.area and self.area ~= G.discard and self.area.config.type ~= 'deck') or not self.area or self.states.drag.is)) then
            self.shadow_height = 0*(0.08 + 0.4*math.sqrt(self.velocity.x^2)) + ((((self.highlighted and self.area == G.play) or self.states.drag.is) and 0.35) or (self.area and self.area.config.type == 'title_2') and 0.04 or 0.1)
            G.shared_shadow:draw_shader('dissolve', self.shadow_height)
        end
    
        if (layer == 'card' or layer == 'both') and self.area ~= G.hand then 
            if self.children.focused_ui then self.children.focused_ui:draw() end
        end
        
        if (layer == 'card' or layer == 'both') then
            -- for all hover/tilting:
            self.tilt_var = self.tilt_var or {mx = 0, my = 0, dx = self.tilt_var.dx or 0, dy = self.tilt_var.dy or 0, amt = 0}
            local tilt_factor = 0.3
            if self.states.focus.is then
                self.tilt_var.mx, self.tilt_var.my = G.CONTROLLER.cursor_position.x + self.tilt_var.dx*self.T.w*G.TILESCALE*G.TILESIZE, G.CONTROLLER.cursor_position.y + self.tilt_var.dy*self.T.h*G.TILESCALE*G.TILESIZE
                self.tilt_var.amt = math.abs(self.hover_offset.y + self.hover_offset.x - 1 + self.tilt_var.dx + self.tilt_var.dy - 1)*tilt_factor
            elseif self.states.hover.is then
                self.tilt_var.mx, self.tilt_var.my = G.CONTROLLER.cursor_position.x, G.CONTROLLER.cursor_position.y
                self.tilt_var.amt = math.abs(self.hover_offset.y + self.hover_offset.x - 1)*tilt_factor
            elseif self.ambient_tilt then
                local tilt_angle = G.TIMERS.REAL*(1.56 + (self.ID/1.14212)%1) + self.ID/1.35122
                self.tilt_var.mx = ((0.5 + 0.5*self.ambient_tilt*math.cos(tilt_angle))*self.VT.w+self.VT.x+G.ROOM.T.x)*G.TILESIZE*G.TILESCALE
                self.tilt_var.my = ((0.5 + 0.5*self.ambient_tilt*math.sin(tilt_angle))*self.VT.h+self.VT.y+G.ROOM.T.y)*G.TILESIZE*G.TILESCALE
                self.tilt_var.amt = self.ambient_tilt*(0.5+math.cos(tilt_angle))*tilt_factor
            end
            --Any particles
            if self.children.particles then self.children.particles:draw() end
    
            --Draw any tags/buttons
            if self.children.price then self.children.price:draw() end
            if self.children.buy_button then
                if self.highlighted then
                    self.children.buy_button.states.visible = true
                    self.children.buy_button:draw()
                    if self.children.buy_and_use_button then 
                        self.children.buy_and_use_button:draw()
                    end
                else
                    self.children.buy_button.states.visible = false
                end
            end
            if self.children.use_button and self.highlighted then self.children.use_button:draw() end
    
            if self.vortex then
                if self.facing == 'back' then 
                    self.children.back:draw_shader('vortex')
                else
                    self.children.center:draw_shader('vortex')
                    if self.children.front then 
                        self.children.front:draw_shader('vortex')
                    end
                end
    
                love.graphics.setShader()
            elseif self.sprite_facing == 'front' then 
                --Draw the main part of the card
                if (self.edition and self.edition.negative) or (self.ability.name == 'Antimatter' and (self.config.center.discovered or self.bypass_discovery_center)) then
                    self.children.center:draw_shader('negative', nil, self.ARGS.send_to_shader)
                    if self.children.front and self.ability.effect ~= 'Stone Card' then
                        self.children.front:draw_shader('negative', nil, self.ARGS.send_to_shader)
                    end
                elseif not self.greyed then
                    self.children.center:draw_shader('dissolve')
                    --If the card has a front, draw that next
                    if self.children.front and self.ability.effect ~= 'Stone Card' then
                        self.children.front:draw_shader('dissolve')
                    end
                end
    
                --If the card is not yet discovered
                if not self.config.center.discovered and (self.ability.consumeable or self.config.center.unlocked) and not self.config.center.demo and not self.bypass_discovery_center then
                    local shared_sprite = (self.ability.set == 'Edition' or self.ability.set == 'Joker') and G.shared_undiscovered_joker or G.shared_undiscovered_tarot
                    local scale_mod = -0.05 + 0.05*math.sin(1.8*G.TIMERS.REAL)
                    local rotate_mod = 0.03*math.sin(1.219*G.TIMERS.REAL)
    
                    shared_sprite.role.draw_major = self
                    shared_sprite:draw_shader('dissolve', nil, nil, nil, self.children.center, scale_mod, rotate_mod)
                end
    
                if self.ability.name == 'Invisible Joker' and (self.config.center.discovered or self.bypass_discovery_center) then
                    self.children.center:draw_shader('voucher', nil, self.ARGS.send_to_shader)
                end
                
                --If the card has any edition/seal, add that here
                if self.edition or self.seal or self.ability.eternal or self.ability.rental or self.ability.perishable or self.sticker or self.ability.set == 'Spectral' or self.debuff or self.greyed or self.ability.name == 'The Soul' or self.ability.set == 'Voucher' or self.ability.set == 'Booster' or self.config.center.soul_pos or self.config.center.demo then
                    if (self.ability.set == 'Voucher' or self.config.center.demo) and (self.ability.name ~= 'Antimatter' or not (self.config.center.discovered or self.bypass_discovery_center)) then
                        self.children.center:draw_shader('voucher', nil, self.ARGS.send_to_shader)
                    end
                    if self.ability.set == 'Booster' or self.ability.set == 'Spectral' then
                        self.children.center:draw_shader('booster', nil, self.ARGS.send_to_shader)
                    end
                    if self.edition and self.edition.holo then
                        self.children.center:draw_shader('holo', nil, self.ARGS.send_to_shader)
                        if self.children.front and self.ability.effect ~= 'Stone Card' then
                            self.children.front:draw_shader('holo', nil, self.ARGS.send_to_shader)
                        end
                    end
                    if self.edition and self.edition.foil then
                        self.children.center:draw_shader('foil', nil, self.ARGS.send_to_shader)
                        if self.children.front and self.ability.effect ~= 'Stone Card' then
                            self.children.front:draw_shader('foil', nil, self.ARGS.send_to_shader)
                        end
                    end
                    if self.edition and self.edition.polychrome then
                        self.children.center:draw_shader('polychrome', nil, self.ARGS.send_to_shader)
                        if self.children.front and self.ability.effect ~= 'Stone Card' then
                            self.children.front:draw_shader('polychrome', nil, self.ARGS.send_to_shader)
                        end
                    end
                    if (self.edition and self.edition.negative) or (self.ability.name == 'Antimatter' and (self.config.center.discovered or self.bypass_discovery_center)) then
                        self.children.center:draw_shader('negative_shine', nil, self.ARGS.send_to_shader)
                    end
                    if self.seal then
                        G.shared_seals[self.seal].role.draw_major = self
                        G.shared_seals[self.seal]:draw_shader('dissolve', nil, nil, nil, self.children.center)
                        if self.seal == 'Gold' then G.shared_seals[self.seal]:draw_shader('voucher', nil, self.ARGS.send_to_shader, nil, self.children.center) end
                    end
                    if self.ability.eternal then
                        G.shared_sticker_eternal.role.draw_major = self
                        G.shared_sticker_eternal:draw_shader('dissolve', nil, nil, nil, self.children.center)
                        G.shared_sticker_eternal:draw_shader('voucher', nil, self.ARGS.send_to_shader, nil, self.children.center)
                    end
                    if self.ability.perishable then
                        G.shared_sticker_perishable.role.draw_major = self
                        G.shared_sticker_perishable:draw_shader('dissolve', nil, nil, nil, self.children.center)
                        G.shared_sticker_perishable:draw_shader('voucher', nil, self.ARGS.send_to_shader, nil, self.children.center)
                    end
                    if self.ability.rental then
                        G.shared_sticker_rental.role.draw_major = self
                        G.shared_sticker_rental:draw_shader('dissolve', nil, nil, nil, self.children.center)
                        G.shared_sticker_rental:draw_shader('voucher', nil, self.ARGS.send_to_shader, nil, self.children.center)
                    end
                    if self.sticker and G.shared_stickers[self.sticker] then
                        G.shared_stickers[self.sticker].role.draw_major = self
                        G.shared_stickers[self.sticker]:draw_shader('dissolve', nil, nil, nil, self.children.center)
                        G.shared_stickers[self.sticker]:draw_shader('voucher', nil, self.ARGS.send_to_shader, nil, self.children.center)
                    end
    
                    if self.ability.name == 'The Soul' and (self.config.center.discovered or self.bypass_discovery_center) then
                        local scale_mod = 0.05 + 0.05*math.sin(1.8*G.TIMERS.REAL) + 0.07*math.sin((G.TIMERS.REAL - math.floor(G.TIMERS.REAL))*math.pi*14)*(1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL)))^3
                        local rotate_mod = 0.1*math.sin(1.219*G.TIMERS.REAL) + 0.07*math.sin((G.TIMERS.REAL)*math.pi*5)*(1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL)))^2
        
                        G.shared_soul.role.draw_major = self
                        G.shared_soul:draw_shader('dissolve',0, nil, nil, self.children.center,scale_mod, rotate_mod,nil, 0.1 + 0.03*math.sin(1.8*G.TIMERS.REAL),nil, 0.6)
                        G.shared_soul:draw_shader('dissolve', nil, nil, nil, self.children.center, scale_mod, rotate_mod)
                    end
                    --changed part
                    if self.config.center.soul_pos and self.config.center.soul_pos.extra and (self.config.center.discovered or self.bypass_discovery_center) then
                        local scale_mod = 0.07 + 0.02*math.cos(1.8*G.TIMERS.REAL) + 0.00*math.cos((G.TIMERS.REAL - math.floor(G.TIMERS.REAL))*math.pi*14)*(1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL)))^3
                        local rotate_mod = 0.05*math.cos(1.219*G.TIMERS.REAL) + 0.00*math.cos((G.TIMERS.REAL)*math.pi*5)*(1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL)))^2
                        self.children.floating_sprite2:draw_shader('dissolve',0, nil, nil, self.children.center,scale_mod, rotate_mod,nil, 0.1 + 0.03*math.cos(1.8*G.TIMERS.REAL),nil, 0.6)
                        self.children.floating_sprite2:draw_shader('dissolve', nil, nil, nil, self.children.center, scale_mod, rotate_mod)
                        
                    end
    
                    if self.config.center.soul_pos and (self.config.center.discovered or self.bypass_discovery_center) then
                        local scale_mod = 0.07 + 0.02*math.sin(1.8*G.TIMERS.REAL) + 0.00*math.sin((G.TIMERS.REAL - math.floor(G.TIMERS.REAL))*math.pi*14)*(1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL)))^3
                        local rotate_mod = 0.05*math.sin(1.219*G.TIMERS.REAL) + 0.00*math.sin((G.TIMERS.REAL)*math.pi*5)*(1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL)))^2
        
                        if self.ability.name == 'Hologram' then
                            self.hover_tilt = self.hover_tilt*1.5
                            self.children.floating_sprite:draw_shader('hologram', nil, self.ARGS.send_to_shader, nil, self.children.center, 2*scale_mod, 2*rotate_mod)
                            self.hover_tilt = self.hover_tilt/1.5
                        else
                            self.children.floating_sprite:draw_shader('dissolve',0, nil, nil, self.children.center,scale_mod, rotate_mod,nil, 0.1 + 0.03*math.sin(1.8*G.TIMERS.REAL),nil, 0.6)
                            self.children.floating_sprite:draw_shader('dissolve', nil, nil, nil, self.children.center, scale_mod, rotate_mod)
                        end
                        
                    end
                    if self.debuff then
                        self.children.center:draw_shader('debuff', nil, self.ARGS.send_to_shader)
                        if self.children.front and self.ability.effect ~= 'Stone Card' then
                            self.children.front:draw_shader('debuff', nil, self.ARGS.send_to_shader)
                        end
                    end
                    if self.greyed then
                        self.children.center:draw_shader('played', nil, self.ARGS.send_to_shader)
                        if self.children.front and self.ability.effect ~= 'Stone Card' then
                            self.children.front:draw_shader('played', nil, self.ARGS.send_to_shader)
                        end
                    end
                end 
            elseif self.sprite_facing == 'back' then
                local overlay = G.C.WHITE
                if self.area and self.area.config.type == 'deck' and self.rank > 3 then
                    self.back_overlay = self.back_overlay or {}
                    self.back_overlay[1] = 0.5 + ((#self.area.cards - self.rank)%7)/50
                    self.back_overlay[2] = 0.5 + ((#self.area.cards - self.rank)%7)/50
                    self.back_overlay[3] = 0.5 + ((#self.area.cards - self.rank)%7)/50
                    self.back_overlay[4] = 1
                    overlay = self.back_overlay
                end
    
                if self.area and self.area.config.type == 'deck' then
                    self.children.back:draw(overlay)
                else
                    self.children.back:draw_shader('dissolve')
                end
    
                if self.sticker and G.shared_stickers[self.sticker] then
                    G.shared_stickers[self.sticker].role.draw_major = self
                    G.shared_stickers[self.sticker]:draw_shader('dissolve', nil, nil, true, self.children.center)
                    if self.sticker == 'Gold' then G.shared_stickers[self.sticker]:draw_shader('voucher', nil, self.ARGS.send_to_shader, true, self.children.center) end
                end
            end
    
            for k, v in pairs(self.children) do
                if k ~= 'focused_ui' and k ~= "front" and k ~= "back" and k ~= "soul_parts" and k ~= "center" and k ~= 'floating_sprite' and k ~= 'floating_sprite2' and k~= "shadow" and k~= "use_button" and k ~= 'buy_button' and k ~= 'buy_and_use_button' and k~= "debuff" and k ~= 'price' and k~= 'particles' and k ~= 'h_popup' then v:draw() end
            end
    
            if (layer == 'card' or layer == 'both') and self.area == G.hand then 
                if self.children.focused_ui then self.children.focused_ui:draw() end
            end
    
            add_to_drawhash(self)
            self:draw_boundingrect()
        end
    end

    -- File loading based on Relic-Jokers
    local files = NFS.getDirectoryItems(SMODS.findModByID("Cryptid").path.."Items")
    for _, file in ipairs(files) do
        local curr_obj = NFS.load(SMODS.findModByID("Cryptid").path.."Items/"..file)()
        for _, item in ipairs(curr_obj) do
            item:register()
        end
    end
end
----------------------------------------------
------------MOD CODE END----------------------