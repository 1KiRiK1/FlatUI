local assets = "__FlatUI__/graphics/"
local gui_style = data.raw["gui-style"].default
local utility_sprites = data.raw["utility-sprites"].default

if settings.startup["FUI_UI_style"].value == "flat" then
    -- gui.png ------------------------------------------------------------------------------------------------------------
    gui_style.red_circuit_network_content_slot.default_graphical_set = { border = 1, filename = assets .. "gui-new.png", position = { 506, 378 }, size = 76 }
    gui_style.green_circuit_network_content_slot.default_graphical_set = { border = 1, filename = assets .. "gui-new.png", position = { 506, 138 }, size = 76 }
    gui_style.compact_red_slot.default_graphical_set = { border = 1, filename = assets .. "gui-new.png", position = { 506, 378 }, size = 76 }

    gui_style.red_slot.default_graphical_set.base.position = { 504, 376 }
    gui_style.red_slot.hovered_graphical_set.base.position = { 504, 456 }
    gui_style.red_slot.clicked_graphical_set.base.position = { 504, 536 }
    gui_style.red_slot.selected_graphical_set.base.position = { 504, 456 }

    gui_style.health_progressbar.bar = { filename = assets .. "gui-new.png", position = { 100, 586 }, size = { 1, 11 } }
    gui_style.health_progressbar.bar_background = { filename = assets .. "gui-new.png", position = { 101, 586 }, size = { 1, 13 } }

    gui_style.draggable_space.graphical_set.shadow = nil
    gui_style.draggable_space_in_train_schedule.graphical_set.glow = nil
    gui_style.draggable_space_in_temporary_train_station.graphical_set.shadow = nil
    gui_style.fulfilled_draggable_space_in_train_schedule.graphical_set.glow = nil
    gui_style.train_schedule_fulfilled_delete_button.default_graphical_set.shadow = nil
    gui_style.train_schedule_temporary_station_delete_button.default_graphical_set.shadow = nil
    gui_style.dark_button.default_graphical_set.shadow = nil

    gui_style.shortcut_bar_expand_button.width = 12
    gui_style.shortcut_bar_expand_button.default_graphical_set = { base = { position = { 0, 17 }, corner_size = 8 } }
    gui_style.shortcut_bar_expand_button.selected_graphical_set = nil
    gui_style.shortcut_bar_expand_button.selected_hovered_graphical_set = nil
    gui_style.shortcut_bar_expand_button.left_padding = 0
    gui_style.shortcut_bar_expand_button.right_padding = 0

    -- gui-new.png ------------------------------------------------------------------------------------------------------------
    gui_style.default_tileset = assets .. "gui-new.png"
    --gui_style.compilatron_gui_message.frame_style.graphical_set.filename = assets .. "gui-new.png" --не используется?
    --gui_style.compilatron_speech_bubble.frame_style.graphical_set.filename = assets .. "gui-new.png" --не используется?
    gui_style.removed_content_table.odd_row_graphical_set.filename = assets .. "gui-new.png"          --полосы в таблице
    gui_style.undelete_space_platforms_table.odd_row_graphical_set.filename = assets .. "gui-new.png" --полосы в таблице

    --utility_sprites.hint_arrow_up.filename = assets .. "gui-new.png" --не используется?
    --utility_sprites.hint_arrow_down.filename = assets .. "gui-new.png" --не используется?
    --utility_sprites.hint_arrow_right.filename = assets .. "gui-new.png" --не используется?
    --utility_sprites.hint_arrow_left.filename = assets .. "gui-new.png" --не используется?
    --utility_sprites.equipment_slot.filename = assets .. "gui-new.png" --без изменений
    --utility_sprites.equipment_collision.filename = assets .. "gui-new.png" --без изменений

    utility_sprites.achievement_label.layers[1].filename = assets .. "gui-new.png"           --ачивки, желтый
    utility_sprites.achievement_label_completed.layers[1].filename = assets .. "gui-new.png" --ачивки, зеленый
    utility_sprites.achievement_label_failed.layers[1].filename = assets .. "gui-new.png"    --ачивки, красный
    utility_sprites.gradient.filename = assets .. "gui-new.png"                              --градиент в окне просмотра сущности
    utility_sprites.output_console_gradient.filename = assets .. "gui-new.png"               --градиент в консоли

    gui_style.browse_games_gui_toggle_favorite_on_button.default_graphical_set.filename = assets .. "gui-new.png"
    gui_style.browse_games_gui_toggle_favorite_on_button.hovered_graphical_set.filename = assets .. "gui-new.png"
    gui_style.browse_games_gui_toggle_favorite_on_button.clicked_graphical_set.filename = assets .. "gui-new.png"
    gui_style.browse_games_gui_toggle_favorite_on_button.disabled_graphical_set.filename = assets .. "gui-new.png"
    gui_style.browse_games_gui_toggle_favorite_off_button.default_graphical_set.filename = assets .. "gui-new.png"
    gui_style.browse_games_gui_toggle_favorite_off_button.hovered_graphical_set.filename = assets .. "gui-new.png"
    gui_style.browse_games_gui_toggle_favorite_off_button.clicked_graphical_set.filename = assets .. "gui-new.png"
    gui_style.browse_games_gui_toggle_favorite_off_button.disabled_graphical_set.filename = assets .. "gui-new.png"

    -- status.png ------------------------------------------------------------------------------------------------------------
    utility_sprites.status_working.filename = assets .. "status.png"
    utility_sprites.status_not_working.filename = assets .. "status.png"
    utility_sprites.status_yellow.filename = assets .. "status.png"
    utility_sprites.status_blue.filename = assets .. "status.png"
    utility_sprites.status_inactive.filename = assets .. "status.png"

    gui_style.electric_satisfaction_in_description_progressbar = { type = "progressbar_style", parent = "electric_satisfaction_progressbar" }
end