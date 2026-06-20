local assets = "__FlatUI__/graphics/"
local distance_border = { filename = assets .. "distance_border.png", size = 32 }
local distance_no_border = { filename = assets .. "distance_no_border.png", size = 32 }
local distance_circle = { filename = assets .. "distance_circle.png", size = 128 }
---------------------------------------------------------------------
if settings.startup["FUI_ubelt_max_distance"].value then
    for _, entity in pairs(data.raw["underground-belt"]) do
        if entity.max_distance then
            local max_dist = entity.max_distance
            entity.radius_visualisation_specification = { sprite = distance_border, distance = 0.5, offset = { 0, -max_dist }, }
        end
    end
end
---------------------------------------------------------------------
if settings.startup["FUI_pipe_max_distance"].value then
    for _, entity in pairs(data.raw["pipe-to-ground"]) do
        if entity.fluid_box and entity.fluid_box.pipe_connections then
            local max_dist = nil
            for _, connection in pairs(entity.fluid_box.pipe_connections) do
                if connection.connection_type == "underground" and connection.max_underground_distance then
                    max_dist = connection.max_underground_distance
                    break
                end
            end
            if max_dist then
                entity.radius_visualisation_specification = { sprite = distance_border, distance = 0.5, offset = { 0, max_dist }, }
            end
        end
    end
end
---------------------------------------------------------------------
if settings.startup["FUI_lmine_radius"].value then
    for _, entity in pairs(data.raw["land-mine"]) do
        if entity.trigger_radius then
            local radius = entity.trigger_radius
            entity.radius_visualisation_specification = { sprite = distance_circle, distance = radius }
        end
    end
end
---------------------------------------------------------------------
if settings.startup["FUI_lamp_light_radius"].value then
    for _, entity in pairs(data.raw["lamp"]) do
        local light_radius = nil
        if entity.light and entity.light.size then
            light_radius = entity.light.size
        elseif entity.light_when_colored and entity.light_when_colored.size then
            light_radius = entity.light_when_colored.size
        end
        if light_radius then
            entity.radius_visualisation_specification = { sprite = distance_circle, distance = light_radius / 4, }
        end
    end
end
---------------------------------------------------------------------
if settings.startup["FUI_radar_radius"].value then
    for _, entity in pairs(data.raw["radar"]) do
        local radius_in_tiles = entity.max_distance_of_nearby_sector_revealed * 32
        entity.radius_visualisation_specification = { sprite = distance_no_border, distance = radius_in_tiles, }
    end
end