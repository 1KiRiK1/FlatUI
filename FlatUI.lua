local assets = "__FlatUI__/graphics/"
if settings.startup["FUI_UI_style"].value == "flat" then
    -- gui.png ------------------------------------------------------------------------------------------------------------
    data.raw["gui-style"].default.red_circuit_network_content_slot.default_graphical_set = { border = 1, filename = assets .. "gui-new.png", position = { 506, 378 }, size = 76 }
    data.raw["gui-style"].default.green_circuit_network_content_slot.default_graphical_set = { border = 1, filename = assets .. "gui-new.png", position = { 506, 138 }, size = 76 }
    data.raw["gui-style"].default.compact_red_slot.default_graphical_set = { border = 1, filename = assets .. "gui-new.png", position = { 506, 378 }, size = 76 }

    data.raw["gui-style"].default.red_slot.default_graphical_set.base.position = { 504, 376 }
    data.raw["gui-style"].default.red_slot.hovered_graphical_set.base.position = { 504, 456 }
    data.raw["gui-style"].default.red_slot.clicked_graphical_set.base.position = { 504, 536 }
    data.raw["gui-style"].default.red_slot.selected_graphical_set.base.position = { 504, 456 }

    data.raw["gui-style"].default.health_progressbar.bar = {filename = assets .. "gui-new.png", position = {100, 586}, size = {1, 11} }
    data.raw["gui-style"].default.health_progressbar.bar_background = { filename = assets .. "gui-new.png", position = {101, 586}, size = {1, 13}}

    data.raw["gui-style"].default.draggable_space.graphical_set.shadow = nil
    data.raw["gui-style"].default.draggable_space_in_train_schedule.graphical_set.glow = nil
    data.raw["gui-style"].default.draggable_space_in_temporary_train_station.graphical_set.shadow = nil
    data.raw["gui-style"].default.fulfilled_draggable_space_in_train_schedule.graphical_set.glow = nil
    data.raw["gui-style"].default.train_schedule_fulfilled_delete_button.default_graphical_set.shadow = nil
    data.raw["gui-style"].default.train_schedule_temporary_station_delete_button.default_graphical_set.shadow = nil
    data.raw["gui-style"].default.dark_button.default_graphical_set.shadow = nil

    data.raw["gui-style"].default.shortcut_bar_expand_button.width = 12
    data.raw["gui-style"].default.shortcut_bar_expand_button.default_graphical_set = { base = {position = {0, 17}, corner_size = 8}}
    data.raw["gui-style"].default.shortcut_bar_expand_button.selected_graphical_set = nil
    data.raw["gui-style"].default.shortcut_bar_expand_button.selected_hovered_graphical_set = nil
    data.raw["gui-style"].default.shortcut_bar_expand_button.left_padding = 0
    data.raw["gui-style"].default.shortcut_bar_expand_button.right_padding = 0
    -- gui-new.png ------------------------------------------------------------------------------------------------------------
    data.raw["gui-style"].default.default_tileset = assets .. "gui-new.png"
    --data.raw["gui-style"].default.compilatron_gui_message.frame_style.graphical_set.filename = assets .. "gui-new.png" --не используется?
    --data.raw["gui-style"].default.compilatron_speech_bubble.frame_style.graphical_set.filename = assets .. "gui-new.png" --не используется?
    data.raw["gui-style"].default.removed_content_table.odd_row_graphical_set.filename = assets .. "gui-new.png" --полосы в таблице
    data.raw["gui-style"].default.undelete_space_platforms_table.odd_row_graphical_set.filename = assets .. "gui-new.png" --полосы в таблице
    --data.raw["utility-sprites"].default.hint_arrow_up.filename = assets .. "gui-new.png" --не используется?
    --data.raw["utility-sprites"].default.hint_arrow_down.filename = assets .. "gui-new.png" --не используется?
    --data.raw["utility-sprites"].default.hint_arrow_right.filename = assets .. "gui-new.png" --не используется?
    --data.raw["utility-sprites"].default.hint_arrow_left.filename = assets .. "gui-new.png" --не используется?
    --data.raw["utility-sprites"].default.equipment_slot.filename = assets .. "gui-new.png" --без изменений
    --data.raw["utility-sprites"].default.equipment_collision.filename = assets .. "gui-new.png" --без изменений
    data.raw["utility-sprites"].default.achievement_label.layers[1].filename = assets .. "gui-new.png" --ачивки, желтый
    data.raw["utility-sprites"].default.achievement_label_completed.layers[1].filename = assets .. "gui-new.png" --ачивки, зеленый
    data.raw["utility-sprites"].default.achievement_label_failed.layers[1].filename = assets .. "gui-new.png" --ачивки, красный
    data.raw["utility-sprites"].default.gradient.filename = assets .. "gui-new.png" --градиент в окне просмотра сущности
    data.raw["utility-sprites"].default.output_console_gradient.filename = assets .. "gui-new.png" --градиент в консоли
    --звездочки
    data.raw["gui-style"].default.browse_games_gui_toggle_favorite_on_button.default_graphical_set.filename = assets .. "gui-new.png"
    data.raw["gui-style"].default.browse_games_gui_toggle_favorite_on_button.hovered_graphical_set.filename = assets .. "gui-new.png"
    data.raw["gui-style"].default.browse_games_gui_toggle_favorite_on_button.clicked_graphical_set.filename = assets .. "gui-new.png"
    data.raw["gui-style"].default.browse_games_gui_toggle_favorite_on_button.disabled_graphical_set.filename = assets .. "gui-new.png"
    data.raw["gui-style"].default.browse_games_gui_toggle_favorite_off_button.default_graphical_set.filename = assets .. "gui-new.png"
    data.raw["gui-style"].default.browse_games_gui_toggle_favorite_off_button.hovered_graphical_set.filename = assets .. "gui-new.png"
    data.raw["gui-style"].default.browse_games_gui_toggle_favorite_off_button.clicked_graphical_set.filename = assets .. "gui-new.png"
    data.raw["gui-style"].default.browse_games_gui_toggle_favorite_off_button.disabled_graphical_set.filename = assets .. "gui-new.png"
    -- status.png ------------------------------------------------------------------------------------------------------------
    data.raw["utility-sprites"].default.status_working.filename = assets .. "status.png"
    data.raw["utility-sprites"].default.status_not_working.filename = assets .. "status.png"
    data.raw["utility-sprites"].default.status_yellow.filename = assets .. "status.png"
    data.raw["utility-sprites"].default.status_blue.filename = assets .. "status.png"
    data.raw["utility-sprites"].default.status_inactive.filename = assets .. "status.png"

    data.raw["gui-style"].default.electric_satisfaction_in_description_progressbar = {type = "progressbar_style", parent = "electric_satisfaction_progressbar"}
end
-- health-bar-pips.png ------------------------------------------------------------------------------------------------------------
if (settings.startup["FUI_health_bar"].value) then
    data.raw["utility-sprites"].default.health_bar_green_pip.filename = assets .. "health-bar-pips.png"
    data.raw["utility-sprites"].default.health_bar_yellow_pip.filename = assets .. "health-bar-pips.png"
    data.raw["utility-sprites"].default.health_bar_red_pip.filename = assets .. "health-bar-pips.png"
    data.raw["utility-sprites"].default.ghost_bar_pip.filename = assets .. "health-bar-pips.png"
    data.raw["utility-sprites"].default.bar_gray_pip.filename = assets .. "health-bar-pips.png"
    data.raw["utility-sprites"].default.shield_bar_pip.filename = assets .. "health-bar-pips.png"
end
-- cursor-boxes-32x32.png ------------------------------------------------------------------------------------------------------------
if (settings.startup["FUI_cursor_boxes"].value) then
    -- x0
    data.raw["utility-sprites"].default.cursor_box.regular[1].sprite.filename = assets ..
        "cursor-boxes-32x32.png" -- обычное выделение, желтый
    -- x64
    data.raw["utility-sprites"].default.cursor_box.not_allowed[1].sprite.filename = assets ..
        "cursor-boxes-32x32.png" -- не доступен, красный
    -- x128
    data.raw["utility-sprites"].default.cursor_box.electricity[1].sprite.filename = assets .. "cursor-boxes-32x32.png"
    data.raw["utility-sprites"].default.cursor_box.logistics[1].sprite.filename = assets .. "cursor-boxes-32x32.png"
    -- x192
    data.raw["utility-sprites"].default.cursor_box.pair[1].sprite.filename = assets .. "cursor-boxes-32x32.png"
    data.raw["utility-sprites"].default.cursor_box.copy[1].sprite.filename = assets .. "cursor-boxes-32x32.png"
    --data.raw["utility-sprites"].default.cursor_box.spidertron_remote_selected[1].sprite.filename = assets .. "cursor-boxes-32x32.png"
    -- x256
    --data.raw["utility-sprites"].default.cursor_box.multiplayer_selection[1].sprite.filename = assets .. "cursor-boxes-32x32.png"
    data.raw["utility-sprites"].default.cursor_box.train_visualization[1].sprite.filename = assets ..
        "cursor-boxes-32x32.png"
    -- x320
    data.raw["utility-sprites"].default.cursor_box.blueprint_snap_rectangle[1].sprite.filename = assets ..
        "cursor-boxes-32x32.png"
    -- x384
    --data.raw["utility-sprites"].default.cursor_box.spidertron_remote_to_be_selected[1].sprite.filename = assets .. "cursor-boxes-32x32.png"

    --data.raw.thruster.thruster.placeable_position_visualization.filename = assets .. "cursor-boxes-32x32.png"

    --data.raw["offshore-pump"]["offshore-pump"].placeable_position_visualization.filename = assets .. "cursor-boxes-32x32.png"
    --data.raw["offshore-pump"]["offshore-pump"].placeable_position_visualization.x = 384

    -- cursor-boxes.png ------------------------------------------------------------------------------------------------------------
    -- от меньшего уголка к большему
    -- y0
    data.raw["utility-sprites"].default.cursor_box.regular[2].sprite.filename = assets .. "cursor-boxes.png"
    data.raw["utility-sprites"].default.cursor_box.regular[3].sprite.filename = assets .. "cursor-boxes.png"
    data.raw["utility-sprites"].default.cursor_box.regular[4].sprite.filename = assets .. "cursor-boxes.png"
    data.raw["utility-sprites"].default.cursor_box.regular[5].sprite.filename = assets .. "cursor-boxes.png"
    data.raw["utility-sprites"].default.cursor_box.regular[6].sprite.filename = assets .. "cursor-boxes.png"
    -- y64
    data.raw["utility-sprites"].default.cursor_box.not_allowed[2].sprite.filename = assets .. "cursor-boxes.png"
    data.raw["utility-sprites"].default.cursor_box.not_allowed[3].sprite.filename = assets .. "cursor-boxes.png"
    data.raw["utility-sprites"].default.cursor_box.not_allowed[4].sprite.filename = assets .. "cursor-boxes.png"
    data.raw["utility-sprites"].default.cursor_box.not_allowed[5].sprite.filename = assets .. "cursor-boxes.png"
    data.raw["utility-sprites"].default.cursor_box.not_allowed[6].sprite.filename = assets .. "cursor-boxes.png"
    -- y128
    data.raw["utility-sprites"].default.cursor_box.electricity[2].sprite.filename = assets .. "cursor-boxes.png"
    data.raw["utility-sprites"].default.cursor_box.electricity[3].sprite.filename = assets .. "cursor-boxes.png"
    data.raw["utility-sprites"].default.cursor_box.electricity[4].sprite.filename = assets .. "cursor-boxes.png"
    data.raw["utility-sprites"].default.cursor_box.electricity[5].sprite.filename = assets .. "cursor-boxes.png"
    data.raw["utility-sprites"].default.cursor_box.electricity[6].sprite.filename = assets .. "cursor-boxes.png"

    data.raw["utility-sprites"].default.cursor_box.pair[2].sprite.filename = assets .. "cursor-boxes.png"
    data.raw["utility-sprites"].default.cursor_box.pair[3].sprite.filename = assets .. "cursor-boxes.png"
    data.raw["utility-sprites"].default.cursor_box.pair[4].sprite.filename = assets .. "cursor-boxes.png"
    data.raw["utility-sprites"].default.cursor_box.pair[5].sprite.filename = assets .. "cursor-boxes.png"
    data.raw["utility-sprites"].default.cursor_box.pair[6].sprite.filename = assets .. "cursor-boxes.png"

    data.raw["utility-sprites"].default.cursor_box.logistics[2].sprite.filename = assets .. "cursor-boxes.png"
    data.raw["utility-sprites"].default.cursor_box.logistics[3].sprite.filename = assets .. "cursor-boxes.png"
    data.raw["utility-sprites"].default.cursor_box.logistics[4].sprite.filename = assets .. "cursor-boxes.png"
    data.raw["utility-sprites"].default.cursor_box.logistics[5].sprite.filename = assets .. "cursor-boxes.png"
    data.raw["utility-sprites"].default.cursor_box.logistics[6].sprite.filename = assets .. "cursor-boxes.png"
    -- y192
    data.raw["utility-sprites"].default.cursor_box.copy[2].sprite.filename = assets .. "cursor-boxes.png"
    data.raw["utility-sprites"].default.cursor_box.copy[3].sprite.filename = assets .. "cursor-boxes.png"
    data.raw["utility-sprites"].default.cursor_box.copy[4].sprite.filename = assets .. "cursor-boxes.png"
    data.raw["utility-sprites"].default.cursor_box.copy[5].sprite.filename = assets .. "cursor-boxes.png"
    data.raw["utility-sprites"].default.cursor_box.copy[6].sprite.filename = assets .. "cursor-boxes.png"

    --data.raw["utility-sprites"].default.cursor_box.spidertron_remote_selected[2].sprite.filename = "__core__/graphics/cursor-boxes.png"
    --data.raw["utility-sprites"].default.cursor_box.spidertron_remote_selected[3].sprite.filename = "__core__/graphics/cursor-boxes.png"
    --data.raw["utility-sprites"].default.cursor_box.spidertron_remote_selected[4].sprite.filename = "__core__/graphics/cursor-boxes.png"
    --data.raw["utility-sprites"].default.cursor_box.spidertron_remote_selected[5].sprite.filename = "__core__/graphics/cursor-boxes.png"
    --data.raw["utility-sprites"].default.cursor_box.spidertron_remote_selected[6].sprite.filename = "__core__/graphics/cursor-boxes.png"
    -- y256
    --data.raw["utility-sprites"].default.cursor_box.multiplayer_selection[2].sprite.filename = "__core__/graphics/cursor-boxes.png"
    --data.raw["utility-sprites"].default.cursor_box.multiplayer_selection[3].sprite.filename = "__core__/graphics/cursor-boxes.png"
    --data.raw["utility-sprites"].default.cursor_box.multiplayer_selection[4].sprite.filename = "__core__/graphics/cursor-boxes.png"
    --data.raw["utility-sprites"].default.cursor_box.multiplayer_selection[5].sprite.filename = "__core__/graphics/cursor-boxes.png"
    --data.raw["utility-sprites"].default.cursor_box.multiplayer_selection[6].sprite.filename = "__core__/graphics/cursor-boxes.png"

    data.raw["utility-sprites"].default.cursor_box.train_visualization[2].sprite.filename = assets .. "cursor-boxes.png"
    data.raw["utility-sprites"].default.cursor_box.train_visualization[3].sprite.filename = assets .. "cursor-boxes.png"
    data.raw["utility-sprites"].default.cursor_box.train_visualization[4].sprite.filename = assets .. "cursor-boxes.png"
    data.raw["utility-sprites"].default.cursor_box.train_visualization[5].sprite.filename = assets .. "cursor-boxes.png"
    data.raw["utility-sprites"].default.cursor_box.train_visualization[6].sprite.filename = assets .. "cursor-boxes.png"
    -- y324
    data.raw["utility-sprites"].default.cursor_box.blueprint_snap_rectangle[2].sprite.filename = assets ..
        "cursor-boxes.png"
    data.raw["utility-sprites"].default.cursor_box.blueprint_snap_rectangle[3].sprite.filename = assets ..
        "cursor-boxes.png"
    -- y384
    --data.raw["utility-sprites"].default.cursor_box.spidertron_remote_to_be_selected[2].sprite.filename = "__core__/graphics/cursor-boxes.png"
    --data.raw["utility-sprites"].default.cursor_box.spidertron_remote_to_be_selected[3].sprite.filename = "__core__/graphics/cursor-boxes.png"
    --data.raw["utility-sprites"].default.cursor_box.spidertron_remote_to_be_selected[4].sprite.filename = "__core__/graphics/cursor-boxes.png"
    --data.raw["utility-sprites"].default.cursor_box.spidertron_remote_to_be_selected[5].sprite.filename = "__core__/graphics/cursor-boxes.png"
    --data.raw["utility-sprites"].default.cursor_box.spidertron_remote_to_be_selected[6].sprite.filename = "__core__/graphics/cursor-boxes.png"
end
-- indication-arrow.png ------------------------------------------------------------------------------------------------------------
if (settings.startup["FUI_indication"].value) then
    local tint = settings.startup["FUI_indication_arrow_tint"].value --[[@as Color]]
    data.raw["utility-sprites"].default.indication_arrow = { filename = assets .. "indication-arrow.png", priority = "extra-high-no-scale", flags = { "icon" }, width = 64, height = 64, scale = 0.5, tint = tint }
    -- indication-line.png ------------------------------------------------------------------------------------------------------------
    local tint = settings.startup["FUI_indication_line_tint"].value --[[@as Color]]
    data.raw["utility-sprites"].default.indication_line = { filename = assets .. "indication-line.png", priority = "extra-high-no-scale", flags = { "icon" }, width = 64, height = 64, scale = 0.5, tint = tint }
end
-- alert-arrow.png ------------------------------------------------------------------------------------------------------------
if (settings.startup["FUI_alert_arrow"].value) then
    local scale = settings.startup["FUI_alert_arrow_scale"].value --[[@as double]]
    local tint = settings.startup["FUI_alert_arrow_tint"].value --[[@as Color]]
    data.raw["utility-sprites"]["default"].alert_arrow = { filename = assets .. "alert-arrow.png", size = 96, scale = scale, flags = { "gui-icon" }, tint = tint }
end
if (settings.startup["FUI_underground_sprite"].value) then
    -- underground-lines.png ------------------------------------------------------------------------------------------------------------
    data.raw["utility-sprites"].default.underground_pipe_connection.filename = assets .. "underground-lines.png"
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
    -- underground-lines-remove.png ------------------------------------------------------------------------------------------------------------
    data.raw["utility-sprites"].default.underground_remove_belts.filename = assets .. "underground-lines-remove.png"
    data.raw["utility-sprites"].default.underground_remove_pipes.filename = assets .. "underground-lines-remove.png"
    for name, ubelt in pairs(data.raw["underground-belt"]) do
        if ubelt.underground_remove_belts_sprite and ubelt.underground_remove_belts_sprite.filename == "__core__/graphics/arrows/underground-lines-remove.png" then
            data.raw["underground-belt"][name].underground_remove_belts_sprite.filename = assets .. "underground-lines-remove.png"
        end
    end
    -- max-distance-underground-lines-remove.png ------------------------------------------------------------------------------------------------------------
    data.raw["utility-sprites"].default.max_distance_underground_remove_belts.filename = assets .. "max-distance-underground-lines-remove.png"
end

if (settings.startup["FUI_otherUI"].value) then
    -- cancel.png ------------------------------------------------------------------------------------------------------------
    data.raw["utility-sprites"].default.deconstruction_mark.filename = assets .. "cancel.png"
    data.raw["utility-sprites"].default.rail_path_not_possible.filename = assets .. "cancel.png"
    -- rail-placement-indicators.png ------------------------------------------------------------------------------------------------------------
    data.raw["utility-sprites"].default.rail_signal_placement_indicator.filename = assets .. "rail-placement-indicators.png"
    data.raw["utility-sprites"].default.train_stop_placement_indicator.filename = assets .. "rail-placement-indicators.png"
    data.raw["utility-sprites"].default.placement_indicator_leg.filename = assets .. "rail-placement-indicators.png"
    data.raw["utility-sprites"].default.grey_rail_signal_placement_indicator.filename = assets .. "rail-placement-indicators.png"
    data.raw["utility-sprites"].default.grey_placement_indicator_leg.filename = assets .. "rail-placement-indicators.png"
    -- slot.png ------------------------------------------------------------------------------------------------------------
    data.raw["utility-sprites"].default.slot.filename = assets .. "slot.png"
    -- short-indication-line.png ------------------------------------------------------------------------------------------------------------
    data.raw["utility-sprites"].default.short_indication_line.filename = assets .. "short-indication-line.png"
    -- short-indication-line-green.png ------------------------------------------------------------------------------------------------------------
    data.raw["utility-sprites"].default.short_indication_line_green.filename = assets .. "short-indication-line-green.png"
    -- too-far.png ------------------------------------------------------------------------------------------------------------
    data.raw["utility-sprites"].default.too_far.filename = assets .. "too-far.png"
    -- no-recipe.png ------------------------------------------------------------------------------------------------------------
    data.raw["utility-sprites"].default.crafting_machine_recipe_not_unlocked.filename = assets .. "no-recipe.png"
    data.raw["utility-sprites"].default.filter_blacklist.filename = assets .. "no-recipe.png"
    -- speech_bubble ------------------------------------------------------------------------------------------------------------
    data.raw["gui-style"].default.speech_bubble.frame_style.graphical_set.filename = assets .. "hint-orange-box.png"
    data.raw["gui-style"].default.speech_bubble.arrow_graphical_set.top.filename = assets .. "hint-orange-arrow-up.png"
    data.raw["gui-style"].default.speech_bubble.arrow_graphical_set.bottom.filename = assets .. "hint-orange-arrow-down.png"
    data.raw["gui-style"].default.speech_bubble.arrow_graphical_set.right.filename = assets .. "hint-orange-arrow-right.png"
    data.raw["gui-style"].default.speech_bubble.arrow_graphical_set.left.filename = assets .. "hint-orange-arrow-left.png"
    -- gui-arrow ------------------------------------------------------------------------------------------------------------
    data.raw["utility-sprites"].default.medium_gui_arrow.filename = assets .. "gui-arrow-medium.png"
    data.raw["utility-sprites"].default.small_gui_arrow.filename = assets .. "gui-arrow-small.png"
    -- fluid-indication-arrow ------------------------------------------------------------------------------------------------------------
    data.raw["utility-sprites"].default.fluid_indication_arrow.filename = assets .. "fluid-indication-arrow.png"
    -- fluid-indication-arrow-both-ways ------------------------------------------------------------------------------------------------------------
    data.raw["utility-sprites"].default.fluid_indication_arrow_both_ways.filename = assets .. "fluid-indication-arrow-both-ways.png"
    -- rail-planner-indication-arrow ------------------------------------------------------------------------------------------------------------
    data.raw["utility-sprites"].default.rail_planner_indication_arrow.filename = assets .. "rail-planner-indication-arrow.png"
    -- rail-planner-indication-arrow-anchored ------------------------------------------------------------------------------------------------------------
    data.raw["utility-sprites"].default.rail_planner_indication_arrow_anchored.filename = assets .. "rail-planner-indication-arrow-anchored.png"
    -- rail-planner-indication-arrow-too-far ------------------------------------------------------------------------------------------------------------
    data.raw["utility-sprites"].default.rail_planner_indication_arrow_too_far.filename = assets .. "rail-planner-indication-arrow-too-far.png"
end