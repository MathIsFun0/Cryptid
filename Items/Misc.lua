--Edition code based on Bunco's Glitter Edition

local mosaic_shader = {
    object_type = "Shader",
    key = 'mosaic', 
    path = 'mosaic.fs'
}
local mosaic = {
    object_type = "Edition",
    key = "mosaic",
    weight = 0.8, --slightly rarer than Polychrome
    shader = "mosaic",
    in_shop = true,
    extra_cost = 6,
    config = {Xchips = 2.5},
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,
    loc_vars = function(self, info_queue)
        return {vars = {self.config.Xchips}}
    end,
    loc_txt = {
        name = "Mosaic",
        label = "Mosaic",
        text = {
            "{X:chips,C:white} X#1# {} Chips"
        }
    }
}
local oversat_shader = {
    object_type = "Shader",
    key = 'oversat', 
    path = 'oversat.fs'
}
local oversat = {
    object_type = "Edition",
    key = "oversat",
    weight = 1,
    shader = "oversat",
    in_shop = true,
    extra_cost = 5,
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,
    loc_txt = {
        name = "Oversaturated",
        label = "Oversaturated",
        text = {
            "All values are {C:attention}doubled{}"
        }
    }
}
return {name = "Misc.", 
        init = function()
            se = Card.set_edition
            function Card:set_edition(x,y,z)
                local was_oversat = self.edition and self.edition.cry_oversat
                se(self,x,y,z)
                if was_oversat then
                    cry_misprintize(self,nil,true)
                end
                if self.edition and self.edition.cry_oversat then
                    cry_misprintize(self, {min=2,max=2})
                end
            end
        end,
        items = {mosaic_shader, mosaic, oversat_shader, oversat}}