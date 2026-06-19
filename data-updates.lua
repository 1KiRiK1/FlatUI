require("flat")
require("transparent")
require("inventory_size")
require("mod_compatibility")

local assets = "__FlatUI__/graphics/"
local gui_style = data.raw["gui-style"].default
local utility_sprites = data.raw["utility-sprites"].default

-- #region FUI_health_bar
if settings.startup["FUI_health_bar"].value then
    utility_sprites.health_bar_green_pip.filename = assets .. "health-bar-pips.png"
    utility_sprites.health_bar_yellow_pip.filename = assets .. "health-bar-pips.png"
    utility_sprites.health_bar_red_pip.filename = assets .. "health-bar-pips.png"
    utility_sprites.ghost_bar_pip.filename = assets .. "health-bar-pips.png"
    utility_sprites.bar_gray_pip.filename = assets .. "health-bar-pips.png"
    utility_sprites.shield_bar_pip.filename = assets .. "health-bar-pips.png"
end
--#endregion

-- #region FUI_cursor_boxes
if settings.startup["FUI_cursor_boxes"].value then
    -- cursor-boxes-32x32.png ------------------------------------------------------------------------------------------------------------
    -- x0
    utility_sprites.cursor_box.regular[1].sprite.filename = assets .. "cursor-boxes-32x32.png"
    -- x64
    utility_sprites.cursor_box.not_allowed[1].sprite.filename = assets .. "cursor-boxes-32x32.png"
    -- x128
    utility_sprites.cursor_box.electricity[1].sprite.filename = assets .. "cursor-boxes-32x32.png"
    utility_sprites.cursor_box.logistics[1].sprite.filename = assets .. "cursor-boxes-32x32.png"
    -- x192
    utility_sprites.cursor_box.pair[1].sprite.filename = assets .. "cursor-boxes-32x32.png"
    utility_sprites.cursor_box.copy[1].sprite.filename = assets .. "cursor-boxes-32x32.png"
    -- x256
    utility_sprites.cursor_box.train_visualization[1].sprite.filename = assets .. "cursor-boxes-32x32.png"
    -- x320
    utility_sprites.cursor_box.blueprint_snap_rectangle[1].sprite.filename = assets .. "cursor-boxes-32x32.png"
    -- cursor-boxes.png ------------------------------------------------------------------------------------------------------------
    -- y0
    utility_sprites.cursor_box.regular[2].sprite.filename = assets .. "cursor-boxes.png"
    utility_sprites.cursor_box.regular[3].sprite.filename = assets .. "cursor-boxes.png"
    utility_sprites.cursor_box.regular[4].sprite.filename = assets .. "cursor-boxes.png"
    utility_sprites.cursor_box.regular[5].sprite.filename = assets .. "cursor-boxes.png"
    utility_sprites.cursor_box.regular[6].sprite.filename = assets .. "cursor-boxes.png"
    -- y64
    utility_sprites.cursor_box.not_allowed[2].sprite.filename = assets .. "cursor-boxes.png"
    utility_sprites.cursor_box.not_allowed[3].sprite.filename = assets .. "cursor-boxes.png"
    utility_sprites.cursor_box.not_allowed[4].sprite.filename = assets .. "cursor-boxes.png"
    utility_sprites.cursor_box.not_allowed[5].sprite.filename = assets .. "cursor-boxes.png"
    utility_sprites.cursor_box.not_allowed[6].sprite.filename = assets .. "cursor-boxes.png"
    -- y128
    utility_sprites.cursor_box.electricity[2].sprite.filename = assets .. "cursor-boxes.png"
    utility_sprites.cursor_box.electricity[3].sprite.filename = assets .. "cursor-boxes.png"
    utility_sprites.cursor_box.electricity[4].sprite.filename = assets .. "cursor-boxes.png"
    utility_sprites.cursor_box.electricity[5].sprite.filename = assets .. "cursor-boxes.png"
    utility_sprites.cursor_box.electricity[6].sprite.filename = assets .. "cursor-boxes.png"

    utility_sprites.cursor_box.pair[2].sprite.filename = assets .. "cursor-boxes.png"
    utility_sprites.cursor_box.pair[3].sprite.filename = assets .. "cursor-boxes.png"
    utility_sprites.cursor_box.pair[4].sprite.filename = assets .. "cursor-boxes.png"
    utility_sprites.cursor_box.pair[5].sprite.filename = assets .. "cursor-boxes.png"
    utility_sprites.cursor_box.pair[6].sprite.filename = assets .. "cursor-boxes.png"

    utility_sprites.cursor_box.logistics[2].sprite.filename = assets .. "cursor-boxes.png"
    utility_sprites.cursor_box.logistics[3].sprite.filename = assets .. "cursor-boxes.png"
    utility_sprites.cursor_box.logistics[4].sprite.filename = assets .. "cursor-boxes.png"
    utility_sprites.cursor_box.logistics[5].sprite.filename = assets .. "cursor-boxes.png"
    utility_sprites.cursor_box.logistics[6].sprite.filename = assets .. "cursor-boxes.png"
    -- y192
    utility_sprites.cursor_box.copy[2].sprite.filename = assets .. "cursor-boxes.png"
    utility_sprites.cursor_box.copy[3].sprite.filename = assets .. "cursor-boxes.png"
    utility_sprites.cursor_box.copy[4].sprite.filename = assets .. "cursor-boxes.png"
    utility_sprites.cursor_box.copy[5].sprite.filename = assets .. "cursor-boxes.png"
    utility_sprites.cursor_box.copy[6].sprite.filename = assets .. "cursor-boxes.png"

    utility_sprites.cursor_box.train_visualization[2].sprite.filename = assets .. "cursor-boxes.png"
    utility_sprites.cursor_box.train_visualization[3].sprite.filename = assets .. "cursor-boxes.png"
    utility_sprites.cursor_box.train_visualization[4].sprite.filename = assets .. "cursor-boxes.png"
    utility_sprites.cursor_box.train_visualization[5].sprite.filename = assets .. "cursor-boxes.png"
    utility_sprites.cursor_box.train_visualization[6].sprite.filename = assets .. "cursor-boxes.png"
    -- y320
    utility_sprites.cursor_box.blueprint_snap_rectangle[2].sprite.filename = assets .. "cursor-boxes.png"
    utility_sprites.cursor_box.blueprint_snap_rectangle[3].sprite.filename = assets .. "cursor-boxes.png"
end
--#endregion

-- #region FUI_indication
if settings.startup["FUI_indication"].value then
    local arrow_tint = settings.startup["FUI_indication_arrow_tint"].value --[[@as Color]]
    utility_sprites.indication_arrow = {
        filename = assets .. "indication-arrow.png",
        priority = "extra-high-no-scale",
        flags = { "icon" },
        width = 64,
        height = 64,
        scale = 0.5,
        tint = arrow_tint
    }
    local line_tint = settings.startup["FUI_indication_line_tint"].value --[[@as Color]]
    utility_sprites.indication_line = {
        filename = assets .. "indication-line.png",
        priority = "extra-high-no-scale",
        flags = { "icon" },
        width = 64,
        height = 64,
        scale = 0.5,
        tint = line_tint
    }
end
--#endregion

-- #region FUI_alert_arrow
if settings.startup["FUI_alert_arrow"].value then 
    local scale = settings.startup["FUI_alert_arrow_scale"].value --[[@as double]]
    local tint = settings.startup["FUI_alert_arrow_tint"].value --[[@as Color]]
    utility_sprites.alert_arrow = {
        filename = assets .. "alert-arrow.png",
        size = 96,
        scale = scale,
        flags = { "gui-icon" },
        tint = tint
    }
end
--#endregion

-- #region FUI_underground_sprite
if settings.startup["FUI_underground_sprite"].value then
    utility_sprites.underground_pipe_connection.filename = assets .. "underground-lines.png"
    for name, wall in pairs(data.raw.wall) do
        if wall.connected_gate_visualization and wall.connected_gate_visualization.filename == "__core__/graphics/arrows/underground-lines.png" then
            data.raw.wall[name].connected_gate_visualization.filename = assets .. "underground-lines.png"
        end
    end
    for name, ubelt in pairs(data.raw["underground-belt"]) do
        if ubelt.underground_sprite and ubelt.underground_sprite.filename == "__core__/graphics/arrows/underground-lines.png" then
            data.raw["underground-belt"][name].underground_sprite.filename = assets .. "underground-lines.png"
        end
    end
    utility_sprites.underground_remove_belts.filename = assets .. "underground-lines-remove.png"
    utility_sprites.underground_remove_pipes.filename = assets .. "underground-lines-remove.png"
    for name, ubelt in pairs(data.raw["underground-belt"]) do
        if ubelt.underground_remove_belts_sprite and ubelt.underground_remove_belts_sprite.filename == "__core__/graphics/arrows/underground-lines-remove.png" then
            data.raw["underground-belt"][name].underground_remove_belts_sprite.filename = assets .. "underground-lines-remove.png"
        end
    end
    utility_sprites.max_distance_underground_remove_belts.filename = assets .. "max-distance-underground-lines-remove.png"
end
--#endregion

-- #region FUI_otherUI
if settings.startup["FUI_otherUI"].value then
    -- cancel.png ------------------------------------------------------------------------------------------------------------
    utility_sprites.deconstruction_mark.filename = assets .. "cancel.png"
    utility_sprites.rail_path_not_possible.filename = assets .. "cancel.png"
    -- rail-placement-indicators.png ------------------------------------------------------------------------------------------------------------
    utility_sprites.rail_signal_placement_indicator.filename = assets .. "rail-placement-indicators.png"
    utility_sprites.train_stop_placement_indicator.filename = assets .. "rail-placement-indicators.png"
    utility_sprites.placement_indicator_leg.filename = assets .. "rail-placement-indicators.png"
    utility_sprites.grey_rail_signal_placement_indicator.filename = assets .. "rail-placement-indicators.png"
    utility_sprites.grey_placement_indicator_leg.filename = assets .. "rail-placement-indicators.png"
    -- slot.png ------------------------------------------------------------------------------------------------------------
    utility_sprites.slot.filename = assets .. "slot.png"
    -- short-indication-line.png ------------------------------------------------------------------------------------------------------------
    utility_sprites.short_indication_line.filename = assets .. "short-indication-line.png"
    -- short-indication-line-green.png ------------------------------------------------------------------------------------------------------------
    utility_sprites.short_indication_line_green.filename = assets .. "short-indication-line-green.png"
    -- too-far.png ------------------------------------------------------------------------------------------------------------
    utility_sprites.too_far.filename = assets .. "too-far.png"
    -- no-recipe.png ------------------------------------------------------------------------------------------------------------
    utility_sprites.crafting_machine_recipe_not_unlocked.filename = assets .. "no-recipe.png"
    utility_sprites.filter_blacklist.filename = assets .. "no-recipe.png"
    -- speech_bubble ------------------------------------------------------------------------------------------------------------
    gui_style.speech_bubble.frame_style.graphical_set.filename = assets .. "hint-orange-box.png"
    gui_style.speech_bubble.arrow_graphical_set.top.filename = assets .. "hint-orange-arrow-up.png"
    gui_style.speech_bubble.arrow_graphical_set.bottom.filename = assets .. "hint-orange-arrow-down.png"
    gui_style.speech_bubble.arrow_graphical_set.right.filename = assets .. "hint-orange-arrow-right.png"
    gui_style.speech_bubble.arrow_graphical_set.left.filename = assets .. "hint-orange-arrow-left.png"
    -- gui-arrow ------------------------------------------------------------------------------------------------------------
    utility_sprites.medium_gui_arrow.filename = assets .. "gui-arrow-medium.png"
    utility_sprites.small_gui_arrow.filename = assets .. "gui-arrow-small.png"
    -- fluid-indication-arrow ------------------------------------------------------------------------------------------------------------
    utility_sprites.fluid_indication_arrow.filename = assets .. "fluid-indication-arrow.png"
    -- fluid-indication-arrow-both-ways ------------------------------------------------------------------------------------------------------------
    utility_sprites.fluid_indication_arrow_both_ways.filename = assets .. "fluid-indication-arrow-both-ways.png"
    -- rail-planner-indication-arrow ------------------------------------------------------------------------------------------------------------
    utility_sprites.rail_planner_indication_arrow.filename = assets .. "rail-planner-indication-arrow.png"
    -- rail-planner-indication-arrow-anchored ------------------------------------------------------------------------------------------------------------
    utility_sprites.rail_planner_indication_arrow_anchored.filename = assets .. "rail-planner-indication-arrow-anchored.png"
    -- rail-planner-indication-arrow-too-far ------------------------------------------------------------------------------------------------------------
    utility_sprites.rail_planner_indication_arrow_too_far.filename = assets .. "rail-planner-indication-arrow-too-far.png"
end
--#endregion