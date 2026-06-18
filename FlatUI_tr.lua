local assets = "__FlatUI__/graphics/"
local gui_tr = "__FlatUI__/graphics/gui-new_tr.png"
local m_color = settings.startup["FUI_main_color"].value --[[@as Color]]
local a_color
local shadow_tint = { 0, 0, 0, 0.8 }
local nothing = { base = { position = { 0, 0 }, corner_size = 8 } }
---------------------------------------------------------------------------------------------------------------
-- h, s, l, r, g, b, are all in range [0, 1]
local min, max, abs = math.min, math.max, math.abs

local function rgb2hsv(r, g, b)
    local M, m = max(r, g, b), min(r, g, b)
    local C = M - m
    local K = 1.0 / (6.0 * C)
    local h = 0.0
    if C ~= 0.0 then
        if M == r then
            h = ((g - b) * K) % 1.0
        elseif M == g then
            h = (b - r) * K + 1.0 / 3.0
        else
            h = (r - g) * K + 2.0 / 3.0
        end
    end
    return h, M == 0.0 and 0.0 or C / M, M
end

local function hsv2rgb(h, s, v)
    local C = v * s
    local m = v - C
    local r, g, b = m, m, m
    if h == h then
        local h_ = (h % 1.0) * 6
        local X = C * (1 - abs(h_ % 2 - 1))
        C, X = C + m, X + m
        if h_ < 1 then
            r, g, b = C, X, m
        elseif h_ < 2 then
            r, g, b = X, C, m
        elseif h_ < 3 then
            r, g, b = m, C, X
        elseif h_ < 4 then
            r, g, b = m, X, C
        elseif h_ < 5 then
            r, g, b = X, m, C
        else
            r, g, b = C, m, X
        end
    end
    return r, g, b
end
---------------------------------------------------------------------------------------------------------------
if settings.startup["FUI_set_add_color"].value == "Custom" then
    a_color = settings.startup["FUI_additional_color"].value --[[@as Color]]
elseif settings.startup["FUI_set_add_color"].value == "White" then
    a_color = { r = 255, g = 255, b = 255, a = 255 }
elseif settings.startup["FUI_set_add_color"].value == "Grey" then
    a_color = { r = 128, g = 128, b = 128, a = 255 }
elseif settings.startup["FUI_set_add_color"].value == "Red" then
    a_color = { r = 255, g = 0, b = 0, a = 255 }
elseif settings.startup["FUI_set_add_color"].value == "Orange_red" then
    a_color = { r = 255, g = 69, b = 0, a = 255 }
elseif settings.startup["FUI_set_add_color"].value == "Orange" then
    a_color = { r = 255, g = 165, b = 0, a = 255 }
elseif settings.startup["FUI_set_add_color"].value == "Yellow_orange" then
    a_color = { r = 255, g = 200, b = 0, a = 255 }
elseif settings.startup["FUI_set_add_color"].value == "Yellow" then
    a_color = { r = 255, g = 255, b = 0, a = 255 }
elseif settings.startup["FUI_set_add_color"].value == "Yellow_green" then
    a_color = { r = 173, g = 255, b = 47, a = 255 }
elseif settings.startup["FUI_set_add_color"].value == "Green" then
    a_color = { r = 0, g = 255, b = 0, a = 255 }
elseif settings.startup["FUI_set_add_color"].value == "Green_cyan" then
    a_color = { r = 0, g = 255, b = 127, a = 255 }
elseif settings.startup["FUI_set_add_color"].value == "Cyan" then
    a_color = { r = 0, g = 255, b = 255, a = 255 }
elseif settings.startup["FUI_set_add_color"].value == "Blue_cyan" then
    a_color = { r = 0, g = 191, b = 255, a = 255 }
elseif settings.startup["FUI_set_add_color"].value == "Blue" then
    a_color = { r = 0, g = 0, b = 255, a = 255 }
elseif settings.startup["FUI_set_add_color"].value == "Blue_violet" then
    a_color = { r = 75, g = 0, b = 255, a = 255 }
elseif settings.startup["FUI_set_add_color"].value == "Violet" then
    a_color = { r = 128, g = 0, b = 128, a = 255 }
elseif settings.startup["FUI_set_add_color"].value == "Factorio_orange" then
    a_color = { r = 251, g = 169, b = 47, a = 255 }
end
---------------------------------------------------------------------------------------------------------------
local a_color_hsv = { rgb2hsv(a_color.r / 255, a_color.g / 255, a_color.b / 255) }
if a_color_hsv[3] > 0.8 then
    a_color_hsv[3] = 1
elseif a_color_hsv[3] < 0.8 then
    a_color_hsv[3] = 0.9
end
local al_color = { hsv2rgb(a_color_hsv[1], a_color_hsv[2], a_color_hsv[3]) }
---------------------------------------------------------------------------------------------------------------
function ApplyAlphaToColor (color, alpha)
    if color.r > 1 or color.g > 1 or color.b > 1 then
        return { color.r, color.g, color.b, alpha }
    else
        return { color.r, color.g, color.b, alpha / 255 }
    end
end
---------------------------------------------------------------------------------------------------------------
--log("---------------------------------------------------------------------------------------------------------------")
--log(serpent.block(m_color))
--log(serpent.block(a_color))
--log(serpent.block(al_color))
--log("---------------------------------------------------------------------------------------------------------------")
---------------------------------------------------------------------------------------------------------------
if settings.startup["FUI_UI_style"].value == "transparent" then
    data.raw["gui-style"].default.red_circuit_network_content_slot.default_graphical_set = { border = 1, filename = gui_tr, position = { 506, 378 }, size = 76 }
    data.raw["gui-style"].default.green_circuit_network_content_slot.default_graphical_set = { border = 1, filename = gui_tr, position = { 506, 138 }, size = 76 }
    data.raw["gui-style"].default.compact_red_slot.default_graphical_set = { border = 1, filename = gui_tr, position = { 506, 378 }, size = 76 }

    data.raw["gui-style"].default.red_slot.default_graphical_set.base.position = { 504, 376 }
    data.raw["gui-style"].default.red_slot.hovered_graphical_set.base.position = { 504, 456 }
    data.raw["gui-style"].default.red_slot.clicked_graphical_set.base.position = { 504, 536 }
    data.raw["gui-style"].default.red_slot.selected_graphical_set.base.position = { 504, 456 }

    data.raw["gui-style"].default.health_progressbar.bar = { filename = gui_tr, position = { 100, 586 }, size = { 1, 11 } }
    data.raw["gui-style"].default.health_progressbar.bar_background = { filename = gui_tr, position = { 101, 586 }, size = { 1, 13 } }

    data.raw["gui-style"].default.draggable_space.graphical_set.shadow = nil
    data.raw["gui-style"].default.draggable_space_in_train_schedule.graphical_set.glow = nil
    data.raw["gui-style"].default.draggable_space_in_temporary_train_station.graphical_set.base.tint = a_color
    data.raw["gui-style"].default.draggable_space_in_temporary_train_station.graphical_set.shadow = nil
    data.raw["gui-style"].default.fulfilled_draggable_space_in_train_schedule.graphical_set.glow = nil
    data.raw["gui-style"].default.train_schedule_fulfilled_delete_button.default_graphical_set.shadow = nil
    data.raw["gui-style"].default.dark_button.default_graphical_set.shadow = nil
    data.raw["gui-style"].default.train_schedule_partially_fullfilled_condition_frame.graphical_set.shadow = nil
    data.raw["gui-style"].default.partially_fulfilled_draggable_space_in_train_schedule.graphical_set.glow = nil
    data.raw["gui-style"].default.train_schedule_partially_fulfilled_delete_button.default_graphical_set.shadow = nil

---------------------------------------------------------------------------------------------------------------
    data.raw["gui-style"].default.default_tileset = gui_tr
    --data.raw["gui-style"].default.compilatron_gui_message.frame_style.graphical_set.filename = gui_tr --не используется?
    --data.raw["gui-style"].default.compilatron_speech_bubble.frame_style.graphical_set.filename = gui_tr --не используется?
    data.raw["gui-style"].default.removed_content_table.odd_row_graphical_set.filename = gui_tr --полосы в таблице
    data.raw["gui-style"].default.undelete_space_platforms_table.odd_row_graphical_set.filename = gui_tr --полосы в таблице
    --data.raw["utility-sprites"].default.hint_arrow_up.filename = gui_tr --не используется?
    --data.raw["utility-sprites"].default.hint_arrow_down.filename = gui_tr --не используется?
    --data.raw["utility-sprites"].default.hint_arrow_right.filename = gui_tr --не используется?
    --data.raw["utility-sprites"].default.hint_arrow_left.filename = gui_tr --не используется?
    --data.raw["utility-sprites"].default.equipment_slot.filename = gui_tr --без изменений
    --data.raw["utility-sprites"].default.equipment_collision.filename = gui_tr --без изменений
    data.raw["utility-sprites"].default.achievement_label.layers[1].filename = gui_tr           --ачивки, желтый
    data.raw["utility-sprites"].default.achievement_label_completed.layers[1].filename = gui_tr --ачивки, зеленый
    data.raw["utility-sprites"].default.achievement_label_failed.layers[1].filename = gui_tr    --ачивки, красный
    data.raw["utility-sprites"].default.gradient.filename = gui_tr                              --градиент в окне просмотра сущности
    data.raw["utility-sprites"].default.output_console_gradient.filename = gui_tr               --градиент в консоли
    --звездочки
    data.raw["gui-style"].default.browse_games_gui_toggle_favorite_on_button.default_graphical_set.filename = gui_tr
    data.raw["gui-style"].default.browse_games_gui_toggle_favorite_on_button.hovered_graphical_set.filename = gui_tr
    data.raw["gui-style"].default.browse_games_gui_toggle_favorite_on_button.clicked_graphical_set.filename = gui_tr
    data.raw["gui-style"].default.browse_games_gui_toggle_favorite_on_button.disabled_graphical_set.filename = gui_tr
    data.raw["gui-style"].default.browse_games_gui_toggle_favorite_off_button.default_graphical_set.filename = gui_tr
    data.raw["gui-style"].default.browse_games_gui_toggle_favorite_off_button.hovered_graphical_set.filename = gui_tr
    data.raw["gui-style"].default.browse_games_gui_toggle_favorite_off_button.clicked_graphical_set.filename = gui_tr
    data.raw["gui-style"].default.browse_games_gui_toggle_favorite_off_button.disabled_graphical_set.filename = gui_tr
    -- status.png ------------------------------------------------------------------------------------------------------------
    data.raw["utility-sprites"].default.status_working.filename = assets .. "status.png"
    data.raw["utility-sprites"].default.status_not_working.filename = assets .. "status.png"
    data.raw["utility-sprites"].default.status_yellow.filename = assets .. "status.png"
    data.raw["utility-sprites"].default.status_blue.filename = assets .. "status.png"
    data.raw["utility-sprites"].default.status_inactive.filename = assets .. "status.png"
    ------------------------------------------------------------------------------------------------------------
    data.raw["gui-style"].default.frame.graphical_set = {
        base = { corner_size = 8, position = { 0, 634 }, tint = m_color, background_blur = true },
        glow = { corner_size = 8, position = { 17, 634 }, tint = a_color, draw_type = "inner" },
        shadow = { corner_size = 8, position = { 34, 634 }, tint = { 0, 0, 0, 0.8 }, draw_type = "outer" }
    }
    data.raw["gui-style"].default.character_gui_left_side.graphical_set = {
        base = {
            left_top = { position = { 0, 634 }, size = { 8, 8 } },
            left = { position = { 0, 642 }, size = { 8, 1 } },
            left_bottom = { position = { 0, 643 }, size = { 8, 8 } },
            top = { position = { 8, 634 }, size = { 1, 8 } },
            bottom = { position = { 8, 643 }, size = { 1, 8 } },
            center = { position = { 8, 642 }, size = { 1, 1 } },
            tint = m_color,
            background_blur = true
        },
        glow = {
            left_top = { position = { 17, 634 }, size = { 8, 8 } },
            left = { position = { 17, 642 }, size = { 8, 1 } },
            left_bottom = { position = { 17, 643 }, size = { 8, 8 } },
            top = { position = { 25, 634 }, size = { 1, 8 } },
            bottom = { position = { 25, 643 }, size = { 1, 8 } },
            center = { position = { 25, 642 }, size = { 1, 1 } },
            tint = a_color,
            draw_type = "inner"
        },
        shadow = {
            top = { position = { 34 + 8, 634 }, size = { 1, 8 } },
            left_top = { position = { 34, 634 }, size = { 8, 8 } },
            left = { position = { 34, 642 }, size = { 8, 1 } },
            left_bottom = { position = { 34, 643 }, size = { 8, 8 } },
            bottom = { position = { 34 + 8, 643 }, size = { 1, 8 } },
            center = { position = { 34 + 8, 634 + 8 }, size = { 1, 1 } },
            tint = { 0, 0, 0, 0.8 },
            draw_type = "outer"
        }
    }
    data.raw["gui-style"].default.frame_without_left_side.graphical_set = {
        base = {
            right_top = { position = { 9, 634 }, size = { 8, 8 } },
            right = { position = { 9, 642 }, size = { 8, 1 } },
            right_bottom = { position = { 9, 643 }, size = { 8, 8 } },
            top = { position = { 8, 634 }, size = { 1, 8 } },
            bottom = { position = { 8, 643 }, size = { 1, 8 } },
            center = { position = { 8, 642 }, size = { 1, 1 } },
            tint = m_color,
            background_blur = true
        },
        glow = {
            right_top = { position = { 26, 634 }, size = { 8, 8 } },
            right = { position = { 26, 642 }, size = { 8, 1 } },
            right_bottom = { position = { 26, 643 }, size = { 8, 8 } },
            top = { position = { 25, 634 }, size = { 1, 8 } },
            bottom = { position = { 25, 643 }, size = { 1, 8 } },
            center = { position = { 25, 642 }, size = { 1, 1 } },
            tint = a_color,
            draw_type = "inner"
        },
        shadow = {
            top = { position = { 34 + 8, 634 }, size = { 1, 8 } },
            right_top = { position = { 34 + 9, 634 }, size = { 8, 8 } },
            right = { position = { 34 + 9, 634 + 8 }, size = { 8, 1 } },
            right_bottom = { position = { 34 + 9, 634 + 9 }, size = { 8, 8 } },
            bottom = { position = { 34 + 9, 634 + 9 }, size = { 1, 8 } },
            center = { position = { 34 + 8, 634 + 8 }, size = { 1, 1 } },
            tint = { 0, 0, 0, 0.8 },
            draw_type = "outer"
        }
    }
    data.raw["gui-style"].default.frame_without_left_and_right_side.graphical_set = {
        base =
        {
            top = { position = { 8, 634 }, size = { 1, 8 } },
            bottom = { position = { 8, 643 }, size = { 1, 8 } },
            center = { position = { 8, 642 }, size = { 1, 1 } },
            tint = m_color,
            background_blur = true
        },
        glow = {
            top = { position = { 25, 634 }, size = { 1, 8 } },
            bottom = { position = { 25, 643 }, size = { 1, 8 } },
            center = { position = { 25, 642 }, size = { 1, 1 } },
            tint = a_color,
            draw_type = "inner"
        },
        shadow = {
            top = { position = { 34 + 8, 634 }, size = { 1, 8 } },
            bottom = { position = { 34 + 9, 634 + 9 }, size = { 1, 8 } },
            center = { position = { 34 + 8, 634 + 8 }, size = { 1, 1 } },
            tint = { 0, 0, 0, 0.8 },
            draw_type = "outer"
        }
    }
    data.raw["gui-style"].default.inside_shallow_frame.graphical_set = { base = { position = { 17, 0 }, corner_size = 8, draw_type = "outer", tint = a_color } }
    data.raw["gui-style"].default.subheader_frame.graphical_set = { base = { corner_size = 8, position = { 0, 634 }, tint = m_color, background_blur = true } }
    data.raw["gui-style"].default.repeated_subheader_frame.graphical_set = { base = { corner_size = 8, position = { 0, 634 }, tint = m_color, background_blur = true } }

    data.raw["gui-style"].default.deep_frame_in_shallow_frame.graphical_set = { base = { position = { 85, 0 }, corner_size = 8, draw_type = "outer", tint = a_color } }
    data.raw["gui-style"].default.scroll_pane.graphical_set = { base = { position = { 17, 0 }, corner_size = 8, draw_type = "outer", tint = a_color } }
    data.raw["gui-style"].default.deep_scroll_pane.graphical_set = { base = { position = { 85, 0 }, corner_size = 8, draw_type = "outer", tint = a_color } }
    data.raw["gui-style"].default.technology_gui_outer_frame.graphical_set = { base = { corner_size = 8, position = { 51, 634 }, tint = m_color, background_blur = true } }
    data.raw["gui-style"].default.frame_around_top.graphical_set = { base = { corner_size = 8, position = { 51, 634 }, tint = m_color, background_blur = true } }
    data.raw["gui-style"].default.frame_around_bottom.graphical_set = { base = { corner_size = 8, position = { 51, 634 }, tint = m_color, background_blur = true } }
    data.raw["gui-style"].default.frame_around_left.graphical_set = { base = { corner_size = 8, position = { 51, 634 }, tint = m_color, background_blur = true } }
    data.raw["gui-style"].default.frame_around_right.graphical_set = { base = { corner_size = 8, position = { 51, 634 }, tint = m_color, background_blur = true } }
    data.raw["gui-style"].default.frame_around_center.graphical_set = {
        base = { corner_size = 8, position = { 68, 634 }, draw_type = "outer", tint = m_color, background_blur = true },
        glow = { corner_size = 8, position = { 17, 0 }, draw_type = "outer", tint = a_color }
    }
    data.raw["gui-style"].default.shallow_frame.graphical_set = {
        base = { position = { 85, 634 }, corner_size = 8, tint = m_color },
        glow = { position = { 17, 634 }, corner_size = 8, draw_type = "inner", tint = a_color }
    }

    data.raw["gui-style"].default.tooltip_frame.graphical_set = {
        base = { corner_size = 8, position = { 0, 634 }, tint = m_color, background_blur = true },
        glow = { corner_size = 8, position = { 17, 634 }, tint = a_color, draw_type = "inner" },
        shadow = { corner_size = 8, position = { 34, 634 }, tint = { 0, 0, 0, 0.8 }, draw_type = "outer" }
    }
    data.raw["gui-style"].default.tooltip_panel_background.graphical_set = {
        base = { corner_size = 8, position = { 0, 634 }, tint = m_color, background_blur = true },
        glow = { corner_size = 8, position = { 17, 634 }, tint = a_color, draw_type = "inner" },
        shadow = { corner_size = 8, position = { 34, 634 }, tint = { 0, 0, 0, 0.8 }, draw_type = "outer" }
    }
    data.raw["gui-style"].default.tooltip_title_frame_light.graphical_set = {
        base = { corner_size = 8, position = { 0, 634 }, tint = a_color, background_blur = true },
        glow = { corner_size = 8, position = { 17, 634 }, tint = a_color, draw_type = "inner" },
        shadow = { corner_size = 8, position = { 34, 634 }, tint = { 0, 0, 0, 0.8 }, draw_type = "outer" }
    }

    data.raw["gui-style"].default.line.border = {
        border_width = 8,
        vertical_line = { position = { 0, 40 }, size = { 8, 1 }, tint = a_color },
        horizontal_line = { position = { 8, 40 }, size = { 1, 8 }, tint = a_color },
        top_right_corner = { position = { 16, 40 }, size = { 8, 8 }, tint = a_color },
        bottom_right_corner = { position = { 24, 40 }, size = { 8, 8 }, tint = a_color },
        bottom_left_corner = { position = { 32, 40 }, size = { 8, 8 }, tint = a_color },
        top_left_coner = { position = { 40, 40 }, size = { 8, 8 }, tint = a_color },
        top_t = { position = { 64, 40 }, size = { 8, 8 }, tint = a_color },
        right_t = { position = { 72, 40 }, size = { 8, 8 }, tint = a_color },
        bottom_t = { position = { 48, 40 }, size = { 8, 8 }, tint = a_color },
        left_t = { position = { 56, 40 }, size = { 8, 8 }, tint = a_color },
        cross = { position = { 80, 40 }, size = { 8, 8 }, tint = a_color },
        top_end = { position = { 88, 40 }, size = { 8, 8 }, tint = a_color },
        right_end = { position = { 96, 40 }, size = { 8, 8 }, tint = a_color },
        bottom_end = { position = { 104, 40 }, size = { 8, 8 }, tint = a_color },
        left_end = { position = { 112, 40 }, size = { 8, 8 }, tint = a_color }
    }
    data.raw["gui-style"].default.bordered_frame.border = {
        border_width = 8,
        vertical_line = { position = { 0, 40 }, size = { 8, 1 }, tint = a_color },
        horizontal_line = { position = { 8, 40 }, size = { 1, 8 }, tint = a_color },
        top_right_corner = { position = { 16, 40 }, size = { 8, 8 }, tint = a_color },
        bottom_right_corner = { position = { 24, 40 }, size = { 8, 8 }, tint = a_color },
        bottom_left_corner = { position = { 32, 40 }, size = { 8, 8 }, tint = a_color },
        top_left_coner = { position = { 40, 40 }, size = { 8, 8 }, tint = a_color },
        top_t = { position = { 64, 40 }, size = { 8, 8 }, tint = a_color },
        right_t = { position = { 72, 40 }, size = { 8, 8 }, tint = a_color },
        bottom_t = { position = { 48, 40 }, size = { 8, 8 }, tint = a_color },
        left_t = { position = { 56, 40 }, size = { 8, 8 }, tint = a_color },
        cross = { position = { 80, 40 }, size = { 8, 8 }, tint = a_color },
        top_end = { position = { 88, 40 }, size = { 8, 8 }, tint = a_color },
        right_end = { position = { 96, 40 }, size = { 8, 8 }, tint = a_color },
        bottom_end = { position = { 104, 40 }, size = { 8, 8 }, tint = a_color },
        left_end = { position = { 112, 40 }, size = { 8, 8 }, tint = a_color }
    }
    data.raw["gui-style"].default.bordered_table.border = {
        border_width = 8,
        vertical_line = { position = { 0, 40 }, size = { 8, 1 }, tint = a_color },
        horizontal_line = { position = { 8, 40 }, size = { 1, 8 }, tint = a_color },
        top_right_corner = { position = { 16, 40 }, size = { 8, 8 }, tint = a_color },
        bottom_right_corner = { position = { 24, 40 }, size = { 8, 8 }, tint = a_color },
        bottom_left_corner = { position = { 32, 40 }, size = { 8, 8 }, tint = a_color },
        top_left_coner = { position = { 40, 40 }, size = { 8, 8 }, tint = a_color },
        top_t = { position = { 64, 40 }, size = { 8, 8 }, tint = a_color },
        right_t = { position = { 72, 40 }, size = { 8, 8 }, tint = a_color },
        bottom_t = { position = { 48, 40 }, size = { 8, 8 }, tint = a_color },
        left_t = { position = { 56, 40 }, size = { 8, 8 }, tint = a_color },
        cross = { position = { 80, 40 }, size = { 8, 8 }, tint = a_color },
        top_end = { position = { 88, 40 }, size = { 8, 8 }, tint = a_color },
        right_end = { position = { 96, 40 }, size = { 8, 8 }, tint = a_color },
        bottom_end = { position = { 104, 40 }, size = { 8, 8 }, tint = a_color },
        left_end = { position = { 112, 40 }, size = { 8, 8 }, tint = a_color }
    }


    data.raw["gui-style"].default.slot_button.default_graphical_set = { base = { border = 4, position = { 0, 736 }, size = 80 } }
    data.raw["gui-style"].default.slot_button.hovered_graphical_set = {
        base = { border = 4, position = { 80, 736 }, size = 80, tint = al_color },
        glow = {
            position = { 240, 736 },
            corner_size = 16,
            tint = a_color,
            top_outer_border_shift = 4,
            bottom_outer_border_shift = -4,
            left_outer_border_shift = 4,
            right_outer_border_shift = -4,
            draw_type = "outer"
        }
    }
    data.raw["gui-style"].default.slot_button.clicked_graphical_set = { base = { border = 4, position = { 160, 736 }, size = 80, tint = al_color } }
    data.raw["gui-style"].default.slot_button.selected_graphical_set = { base = { border = 4, position = { 80, 736 }, size = 80, tint = al_color } }
    data.raw["gui-style"].default.slot_button.selected_hovered_graphical_set = {
        base = { border = 4, position = { 80, 736 }, size = 80, tint = al_color },
        glow = {
            position = { 240, 736 },
            corner_size = 16,
            tint = a_color,
            top_outer_border_shift = 4,
            bottom_outer_border_shift = -4,
            left_outer_border_shift = 4,
            right_outer_border_shift = -4,
            draw_type = "outer"
        }
    }
    data.raw["gui-style"].default.slot_button.selected_clicked_graphical_set = { base = { border = 4, position = { 160, 736 }, size = 80, tint = al_color } }
    data.raw["gui-style"].default.slot_button.pie_progress_color = ApplyAlphaToColor (a_color, 120)

    data.raw["gui-style"].default.quick_bar_page_button.default_graphical_set = { base = { position = { 312, 744 }, corner_size = 8 } }
    data.raw["gui-style"].default.quick_bar_page_button.hovered_graphical_set = {
        base = { position = { 346, 744 }, corner_size = 8, tint = a_color },
        glow = {
            position = { 280, 736 },
            corner_size = 16,
            tint = a_color,
            top_outer_border_shift = 4,
            bottom_outer_border_shift = -4,
            left_outer_border_shift = 4,
            right_outer_border_shift = -4,
            draw_type = "outer"
        }
    }
    data.raw["gui-style"].default.quick_bar_page_button.clicked_graphical_set = { base = { position = { 363, 744 }, corner_size = 8, tint = a_color } }
    data.raw["gui-style"].default.quick_bar_page_button.disabled_graphical_set = { base = { position = { 329, 744 }, corner_size = 8 } }

    data.raw["gui-style"].default.slot_sized_button.default_graphical_set = { base = { position = { 312, 744 }, corner_size = 8 } }
    data.raw["gui-style"].default.slot_sized_button.disabled_graphical_set = { base = { position = { 329, 744 }, corner_size = 8 } }
    data.raw["gui-style"].default.slot_sized_button.hovered_graphical_set = {
        base = { position = { 346, 744 }, corner_size = 8, tint = a_color },
        glow = {
            position = { 280, 736 },
            corner_size = 16,
            tint = a_color,
            top_outer_border_shift = 4,
            bottom_outer_border_shift = -4,
            left_outer_border_shift = 4,
            right_outer_border_shift = -4,
            draw_type = "outer"
        }
    }
    data.raw["gui-style"].default.slot_sized_button.clicked_graphical_set = { base = { position = { 363, 744 }, corner_size = 8, tint = a_color } }
    data.raw["gui-style"].default.slot_sized_button.selected_graphical_set = { base = { position = { 363, 744 }, corner_size = 8, tint = a_color } }
    data.raw["gui-style"].default.slot_sized_button.selected_hovered_graphical_set = {
        base = { position = { 346, 744 }, corner_size = 8, tint = a_color },
        glow = {
            position = { 280, 736 },
            corner_size = 16,
            tint = a_color,
            top_outer_border_shift = 4,
            bottom_outer_border_shift = -4,
            left_outer_border_shift = 4,
            right_outer_border_shift = -4,
            draw_type = "outer"
        }
    }

    data.raw["gui-style"].default.slot_sized_button_blue.default_graphical_set = { base = { position = { 312, 760 }, corner_size = 8 } }
    data.raw["gui-style"].default.slot_sized_button_blue.disabled_graphical_set = { base = { position = { 329, 760 }, corner_size = 8 } }
    data.raw["gui-style"].default.slot_sized_button_blue.hovered_graphical_set = {
        base = { position = { 346, 760 }, corner_size = 8 },
        glow = {
            position = { 280, 736 },
            corner_size = 16,
            tint = { 0, 175, 255, 255 },
            top_outer_border_shift = 4,
            bottom_outer_border_shift = -4,
            left_outer_border_shift = 4,
            right_outer_border_shift = -4,
            draw_type = "outer"
        }
    }
    data.raw["gui-style"].default.slot_sized_button_blue.clicked_graphical_set = { base = { position = { 363, 760 }, corner_size = 8 } }

    data.raw["gui-style"].default.slot_sized_button_red.default_graphical_set = { base = { position = { 312, 776 }, corner_size = 8 } }
    data.raw["gui-style"].default.slot_sized_button_red.disabled_graphical_set = { base = { position = { 329, 776 }, corner_size = 8 } }
    data.raw["gui-style"].default.slot_sized_button_red.hovered_graphical_set = {
        base = { position = { 346, 776 }, corner_size = 8 },
        glow = {
            position = { 280, 736 },
            corner_size = 16,
            tint = { 255, 0, 2, 255 },
            top_outer_border_shift = 4,
            bottom_outer_border_shift = -4,
            left_outer_border_shift = 4,
            right_outer_border_shift = -4,
            draw_type = "outer"
        }
    }
    data.raw["gui-style"].default.slot_sized_button_red.clicked_graphical_set = { base = { position = { 363, 776 }, corner_size = 8 } }

    data.raw["gui-style"].default.slot_sized_button_green.default_graphical_set = { base = { position = { 312, 792 }, corner_size = 8 } }
    data.raw["gui-style"].default.slot_sized_button_green.disabled_graphical_set = { base = { position = { 329, 792 }, corner_size = 8 } }
    data.raw["gui-style"].default.slot_sized_button_green.hovered_graphical_set = {
        base = { position = { 346, 792 }, corner_size = 8 },
        glow = {
            position = { 280, 736 },
            corner_size = 16,
            tint = { 24, 255, 0, 255 },
            top_outer_border_shift = 4,
            bottom_outer_border_shift = -4,
            left_outer_border_shift = 4,
            right_outer_border_shift = -4,
            draw_type = "outer"
        }
    }
    data.raw["gui-style"].default.slot_sized_button_green.clicked_graphical_set = { base = { position = { 363, 792 }, corner_size = 8 } }

    data.raw["gui-style"].default.slot.default_graphical_set = { base = { border = 4, position = { 0, 424 }, size = 80 } }
    data.raw["gui-style"].default.slot.hovered_graphical_set = { base = { border = 4, position = { 80, 424 }, size = 80, tint = al_color } }
    data.raw["gui-style"].default.slot.clicked_graphical_set = { base = { border = 4, position = { 160, 424 }, size = 80, tint = al_color } }
    data.raw["gui-style"].default.slot.pie_progress_color = ApplyAlphaToColor (a_color, 120)

    data.raw["gui-style"].default.tool_equip_ammo_slot.default_graphical_set = nil
    data.raw["gui-style"].default.tool_equip_ammo_slot.hovered_graphical_set = nil
    data.raw["gui-style"].default.tool_equip_ammo_slot.clicked_graphical_set = nil
    data.raw["gui-style"].default.tool_equip_ammo_slot.selected_graphical_set = { base = {border = 4, position = {160, 504}, size = 80} }
    data.raw["gui-style"].default.tool_equip_ammo_slot.selected_hovered_graphical_set = { base = {border = 4, position = {160, 504}, size = 80} }
    data.raw["gui-style"].default.tool_equip_ammo_slot.selected_clicked_graphical_set = { base = {border = 4, position = {160, 504}, size = 80} }

    data.raw["gui-style"].default.crafting_queue_slot.default_graphical_set = { position = { 312, 744 }, corner_size = 8 }
    data.raw["gui-style"].default.crafting_queue_slot.hovered_graphical_set = { base = { position = { 346, 744 }, corner_size = 8, tint = a_color } }
    data.raw["gui-style"].default.crafting_queue_slot.clicked_graphical_set = { base = { position = { 363, 744 }, corner_size = 8, tint = a_color } }
    data.raw["gui-style"].default.crafting_queue_slot.pie_progress_color = ApplyAlphaToColor (a_color, 120)

    data.raw["gui-style"].default.promised_crafting_queue_slot.default_graphical_set = { position = { 312, 744 }, corner_size = 8, tint = { 150, 150, 150 } }
    data.raw["gui-style"].default.promised_crafting_queue_slot.hovered_graphical_set = { base = { position = { 346, 744 }, corner_size = 8, tint = a_color } }
    data.raw["gui-style"].default.promised_crafting_queue_slot.clicked_graphical_set = { base = { position = { 363, 744 }, corner_size = 8, tint = a_color } }

    data.raw["gui-style"].default.button.default_graphical_set = {
        base = { position = { 85, 634 }, corner_size = 8, tint = m_color },
        glow = { position = { 17, 634 }, corner_size = 8, draw_type = "inner", tint = a_color }
    }
    data.raw["gui-style"].default.button.hovered_graphical_set = {
        base = { position = { 34, 17 }, corner_size = 8, tint = al_color },
        glow = { position = { 200, 128 }, corner_size = 8, tint = al_color, draw_type = "outer" }
    }
    data.raw["gui-style"].default.button.clicked_graphical_set = { base = { position = { 51, 17 }, corner_size = 8, tint = al_color } }
    data.raw["gui-style"].default.button.disabled_graphical_set = { base = { position = { 17, 17 }, corner_size = 8 } }
    data.raw["gui-style"].default.button.selected_graphical_set = { base = { position = { 225, 17 }, corner_size = 8, tint = al_color } }
    data.raw["gui-style"].default.button.selected_hovered_graphical_set = { base = { position = { 369, 17 }, corner_size = 8, tint = al_color } }
    data.raw["gui-style"].default.button.selected_clicked_graphical_set = { base = { position = { 352, 17 }, corner_size = 8, tint = al_color } }

    data.raw["gui-style"].default.menu_button.default_graphical_set = {
        base = { position = { 51, 634 }, corner_size = 8, tint = m_color },
        glow = { position = { 119, 634 }, corner_size = 8, tint = a_color }
    }

    data.raw["gui-style"].default.mod_gui_button.default_graphical_set = { base = { position = { 312, 744 }, corner_size = 8 } }
    data.raw["gui-style"].default.mod_gui_button.hovered_graphical_set = {
        base = { position = { 346, 744 }, corner_size = 8, tint = a_color },
        glow = {
            position = { 280, 736 },
            corner_size = 16,
            tint = a_color,
            top_outer_border_shift = 4,
            bottom_outer_border_shift = -4,
            left_outer_border_shift = 4,
            right_outer_border_shift = -4,
            draw_type = "outer"
        }
    }
    data.raw["gui-style"].default.mod_gui_button.clicked_graphical_set = { base = { position = { 363, 744 }, corner_size = 8, tint = a_color } }
    data.raw["gui-style"].default.mod_gui_button.selected_graphical_set = { base = { position = { 363, 744 }, corner_size = 8, tint = a_color } }
    data.raw["gui-style"].default.mod_gui_button.selected_hovered_graphical_set = {
        base = { position = { 346, 744 }, corner_size = 8, tint = a_color },
        glow = {
            position = { 280, 736 },
            corner_size = 16,
            tint = a_color,
            top_outer_border_shift = 4,
            bottom_outer_border_shift = -4,
            left_outer_border_shift = 4,
            right_outer_border_shift = -4,
            draw_type = "outer"
        }
    }

    data.raw["gui-style"].default.back_button.default_graphical_set = {
        base = {
            left = { position = { 0, 232 }, size = { 24, 64 } },
            right_top = { position = { 9, 17 }, size = 8 },
            right = { position = { 9, 17 + 8 }, size = { 8, 1 } },
            right_bottom = { position = { 9, 17 + 9 }, size = 8 },
            center = { position = { 24, 232 }, size = { 1, 64 } }
        },
        glow = {
            left = { position = { 490, 656 }, size = { 24, 64 } },
            right_top = { position = { 17 + 9, 634 }, size = 8 },
            right = { position = { 17 + 9, 634 + 8 }, size = { 8, 1 } },
            right_bottom = { position = { 17 + 9, 634 + 9 }, size = 8 },
            center = { position = { 490 + 24, 656 }, size = { 1, 64 } },
            tint = al_color
        }
    }
    data.raw["gui-style"].default.back_button.hovered_graphical_set.base.tint = al_color
    data.raw["gui-style"].default.back_button.hovered_graphical_set.glow.tint = al_color
    data.raw["gui-style"].default.back_button.clicked_graphical_set.base.tint = al_color
    data.raw["gui-style"].default.back_button.disabled_graphical_set.glow = nil

    data.raw["gui-style"].default.forward_button.default_graphical_set = {
        base = {
            right = { position = { 24, 232 }, size = { 24, 64 } },
            left_top = { position = { 0, 17 }, size = 8 },
            left = { position = { 0, 25 }, size = { 8, 1 } },
            left_bottom = { position = { 0, 26 }, size = 8 },
            center = { position = { 24, 232 }, size = { 1, 64 } }
        },
        glow = {
            right = { position = { 514, 656 }, size = { 24, 64 } },
            left_top = { position = { 17, 634 }, size = 8 },
            left = { position = { 17, 634+8 }, size = { 8, 1 } },
            left_bottom = { position = { 17, 634+9 }, size = 8 },
            center = { position = { 514, 656 }, size = { 1, 64 } },
            draw_type = "inner",
            tint = al_color
        }
    }
    data.raw["gui-style"].default.forward_button.hovered_graphical_set.base.tint = al_color
    data.raw["gui-style"].default.forward_button.hovered_graphical_set.glow.tint = al_color
    data.raw["gui-style"].default.forward_button.clicked_graphical_set.base.tint = al_color
    data.raw["gui-style"].default.forward_button.disabled_graphical_set.glow = nil

    data.raw["gui-style"].default.tips_and_tricks_notification_button.default_graphical_set = {
        base = {
            right = { position = { 24, 232 }, size = { 24, 64 } },
            left_top = { position = { 0, 17 }, size = 8 },
            left = { position = { 0, 25 }, size = { 8, 1 } },
            left_bottom = { position = { 0, 26 }, size = 8 },
            center = { position = { 24, 232 }, size = { 1, 64 } }
        },
        shadow = {
            right = { position = { 336, 424 }, size = { 32, 80 } },
            left_top = { position = { 34, 634 }, size = 8 },
            left = { position = { 34, 634+8 }, size = { 8, 1 } },
            left_bottom = { position = { 34, 634+9 }, size = 8 },
            center = { position = { 336, 424 }, size = { 1, 64 } },
            right_outer_border_shift = -12,
            draw_type = "outer",
            tint = shadow_tint,
        }
    }
    data.raw["gui-style"].default.tips_and_tricks_notification_button.hovered_graphical_set.base.tint = al_color
    data.raw["gui-style"].default.tips_and_tricks_notification_button.hovered_graphical_set.glow.tint = al_color
    data.raw["gui-style"].default.tips_and_tricks_notification_button.clicked_graphical_set.base.tint = al_color
    data.raw["gui-style"].default.tips_and_tricks_notification_button.disabled_graphical_set.glow = nil

    data.raw["gui-style"].default.slot_button_in_shallow_frame.default_graphical_set = {
        base = { position = { 85, 634 }, corner_size = 8, tint = m_color },
        glow = { position = { 17, 634 }, corner_size = 8, draw_type = "inner", tint = a_color }
    }
    data.raw["gui-style"].default.slot_button_in_shallow_frame.hovered_graphical_set = {
        base = { position = { 85, 634 }, corner_size = 8, tint = al_color },
        glow = { corner_size = 8, position = { 34, 634 }, tint = al_color, draw_type = "outer" }
    }
    data.raw["gui-style"].default.slot_button_in_shallow_frame.clicked_graphical_set = { base = { position = { 51, 634 }, corner_size = 8, tint = al_color } }
    data.raw["gui-style"].default.slot_button_in_shallow_frame.selected_graphical_set = { base = { position = { 51, 634 }, corner_size = 8, tint = al_color } }
    data.raw["gui-style"].default.slot_button_in_shallow_frame.selected_hovered_graphical_set = { base = { position = { 51, 634 }, corner_size = 8, tint = al_color } }
    data.raw["gui-style"].default.slot_button_in_shallow_frame.selected_clicked_graphical_set = { base = { position = { 51, 634 }, corner_size = 8, tint = al_color } }
    data.raw["gui-style"].default.slot_button_in_shallow_frame.disabled_graphical_set = {
        base = { position = { 51, 634 }, corner_size = 8, tint = m_color },
        glow = { position = { 17, 634 }, corner_size = 8, tint = { 0, 0, 0 } }
    }

    data.raw["gui-style"].default.decider_combinator_signal_select_button.default_graphical_set = nil
    data.raw["gui-style"].default.decider_combinator_signal_select_button.hovered_graphical_set = nil
    data.raw["gui-style"].default.decider_combinator_signal_select_button.clicked_graphical_set = nil

    data.raw["gui-style"].default.dark_rounded_button.default_graphical_set = {
        base = { position = { 85, 634 }, corner_size = 8, tint = m_color },
        glow = { position = { 17, 634 }, corner_size = 8, draw_type = "inner", tint = a_color }
    }
    data.raw["gui-style"].default.dark_rounded_button.hovered_graphical_set = {
        base = { position = { 85, 634 }, corner_size = 8, tint = al_color },
        glow = { corner_size = 8, position = { 34, 634 }, tint = al_color, draw_type = "outer" }
    }
    data.raw["gui-style"].default.dark_rounded_button.clicked_graphical_set = { base = { position = { 51, 634 }, corner_size = 8, tint = al_color } }

    data.raw["gui-style"].default.train_schedule_condition_time_selection_button.default_graphical_set = {
        base = { position = { 85, 634 }, corner_size = 8, tint = m_color },
        glow = { position = { 17, 634 }, corner_size = 8, draw_type = "inner", tint = a_color }
    }
    data.raw["gui-style"].default.train_schedule_delete_button.default_graphical_set = { base = { position = { 17, 634 }, corner_size = 8, draw_type = "inner", tint = a_color } }
    --data.raw["gui-style"].default.train_schedule_temporary_station_frame.graphical_set = {
    --    base = { position = { 85, 634 }, corner_size = 8, tint = a_color },
    --    glow = { position = { 17, 634 }, corner_size = 8, draw_type = "inner", tint = al_color }
    --}
    data.raw["gui-style"].default.train_schedule_temporary_station_delete_button.default_graphical_set = {
        base = { position = { 85, 634 }, corner_size = 8, tint = a_color },
        glow = { position = { 17, 634 }, corner_size = 8, draw_type = "inner", tint = al_color }
    }

    data.raw["gui-style"].default.button_with_shadow.default_graphical_set = {
        base = { position = { 85, 634 }, corner_size = 8, tint = m_color },
        glow = { position = { 17, 634 }, corner_size = 8, draw_type = "inner", tint = a_color }
    }
    data.raw["gui-style"].default.button_with_shadow.hovered_graphical_set = {
        base = { position = { 34, 17 }, corner_size = 8, tint = al_color },
        glow = { position = { 200, 128 }, corner_size = 8, tint = al_color, draw_type = "outer" }
    }
    data.raw["gui-style"].default.button_with_shadow.clicked_graphical_set = { base = { position = { 51, 17 }, corner_size = 8, tint = al_color } }

    data.raw["gui-style"].default.frame_button.default_graphical_set = { base = { position = { 0, 0 }, corner_size = 8 } }
    data.raw["gui-style"].default.frame_button.hovered_graphical_set = {
        base = { position = { 34, 17 }, corner_size = 8, tint = al_color },
        glow = { position = { 200, 128 }, corner_size = 8, tint = al_color, draw_type = "outer" }
    }
    data.raw["gui-style"].default.frame_button.clicked_graphical_set = { base = { position = { 51, 17 }, corner_size = 8, tint = al_color } }
    data.raw["gui-style"].default.frame_button.disabled_graphical_set = { base = { position = { 0, 0 }, corner_size = 8 } }
    data.raw["gui-style"].default.frame_button.selected_graphical_set = { base = { position = { 51, 634 }, corner_size = 8, tint = al_color } }
    data.raw["gui-style"].default.frame_button.selected_hovered_graphical_set = { base = { position = { 51, 634 }, corner_size = 8, tint = al_color } }

    data.raw["gui-style"].default.shortcut_bar_expand_button.width = 12
    --data.raw["gui-style"].default.shortcut_bar_expand_button.invert_colors_of_picture_when_hovered_or_toggled = false
    data.raw["gui-style"].default.shortcut_bar_expand_button.default_graphical_set = { base = { position = { 0, 17 }, corner_size = 8 } }
    data.raw["gui-style"].default.shortcut_bar_expand_button.selected_graphical_set = { base = { position = { 51, 634 }, corner_size = 8, tint = al_color } }
    data.raw["gui-style"].default.shortcut_bar_expand_button.selected_hovered_graphical_set = { base = { position = { 51, 634 }, corner_size = 8, tint = al_color } }
    data.raw["gui-style"].default.shortcut_bar_expand_button.left_padding = 0
    data.raw["gui-style"].default.shortcut_bar_expand_button.right_padding = 0

    data.raw["gui-style"].default.textbox.default_background = {
        base = { position = { 85, 634 }, corner_size = 8, tint = m_color },
        shadow = { position = { 17, 634 }, corner_size = 8, draw_type = "inner", tint = al_color }
    }
    data.raw["gui-style"].default.textbox.active_background = {
        base = { position = { 51, 634 }, corner_size = 8, tint = { m_color.r, m_color.g, m_color.b, a = 0.7 } },
        shadow = { position = { 136, 634 }, corner_size = 8, tint = al_color },
    }
    data.raw["gui-style"].default.textbox.game_controller_hovered_background = {
        base = { position = { 85, 634 }, corner_size = 8, tint = { m_color.r, m_color.g, m_color.b, a = 0.8 } },
        shadow = { position = { 17, 634 }, corner_size = 8, tint = al_color },
    }
    data.raw["gui-style"].default.textbox.disabled_background = {
        base = { position = { 51, 634 }, corner_size = 8, tint = m_color },
        shadow = { position = { 17, 634 }, corner_size = 8, tint = { 0, 0, 0 } }
    }
    data.raw["gui-style"].default.textbox.selection_background_color = al_color


    data.raw["gui-style"].default.train_schedule_comparison_type_frame.graphical_set                                = { base = { position = { 0, 0 }, corner_size = 8 } }

    data.raw["gui-style"].default.circuit_condition_comparator_dropdown.button_style.default_graphical_set          = {
        base = { position = { 85, 634 }, corner_size = 8, tint = m_color },
        glow = { position = { 17, 634 }, corner_size = 8, draw_type = "inner", tint = a_color }
    }
    data.raw["gui-style"].default.circuit_condition_comparator_dropdown.button_style.hovered_graphical_set          = {
        base = { position = { 85, 634 }, corner_size = 8, tint = al_color },
        glow = { corner_size = 8, position = { 34, 634 }, tint = al_color, draw_type = "outer" }
    }
    data.raw["gui-style"].default.circuit_condition_comparator_dropdown.button_style.clicked_graphical_set          = { base = { position = { 51, 634 }, corner_size = 8, tint = al_color } }
    data.raw["gui-style"].default.circuit_condition_comparator_dropdown.button_style.disabled_graphical_set         = {
        base = { position = { 51, 634 }, corner_size = 8, tint = m_color },
        glow = { position = { 17, 634 }, corner_size = 8, tint = { 0, 0, 0 } }
    }
    data.raw["gui-style"].default.circuit_condition_comparator_dropdown.button_style.selected_graphical_set         = { base = { position = { 51, 634 }, corner_size = 8, tint = al_color } }
    data.raw["gui-style"].default.circuit_condition_comparator_dropdown.button_style.selected_hovered_graphical_set = { base = { position = { 51, 634 }, corner_size = 8, tint = al_color } }
    data.raw["gui-style"].default.circuit_condition_comparator_dropdown.button_style.selected_clicked_graphical_set = { base = { position = { 51, 634 }, corner_size = 8, tint = al_color } }

    data.raw["gui-style"].default.circuit_condition_comparator_dropdown.button_style.default_font_color             = { 200, 200, 200 }

    data.raw["gui-style"].default.list_box_item.default_graphical_set = {
        base = { position = { 51, 634 }, corner_size = 8, tint = { r = m_color.r, m_color.g, m_color.b, a = 0.9 } },
        glow = { position = { 17, 634 }, corner_size = 8, draw_type = "inner", tint = a_color }
    }
    data.raw["gui-style"].default.list_box_item.hovered_graphical_set = {
        base = { position = { 85, 634 }, corner_size = 8, tint = al_color },
        glow = { corner_size = 8, position = { 34, 634 }, tint = al_color, draw_type = "outer" }
    }
    data.raw["gui-style"].default.list_box_item.clicked_graphical_set = { base = { position = { 51, 634 }, corner_size = 8, tint = al_color } }
    data.raw["gui-style"].default.list_box_item.disabled_graphical_set = {
        base = { position = { 51, 634 }, corner_size = 8, tint = m_color },
        glow = { position = { 17, 634 }, corner_size = 8, tint = { 0, 0, 0 } }
    }

    data.raw["gui-style"].default.decider_combinator_fulfilled_signal_select_button.default_graphical_set           = {
        base = { position = { 85, 634 }, corner_size = 8, tint = m_color },
        glow = { position = { 17, 634 }, corner_size = 8, draw_type = "inner", tint = { 0, 0, 0 } }
    }
    data.raw["gui-style"].default.decider_combinator_fulfilled_signal_select_button.hovered_graphical_set           = {
        base = { position = { 85, 634 }, corner_size = 8, tint = al_color },
        glow = { corner_size = 8, position = { 34, 634 }, tint = al_color, draw_type = "outer" }
    }
    data.raw["gui-style"].default.decider_combinator_fulfilled_signal_select_button.clicked_graphical_set           = { base = { position = { 51, 634 }, corner_size = 8, tint = al_color } }

    data.raw["gui-style"].default.train_schedule_fulfilled_item_select_button.default_graphical_set                 = {
        base = { position = { 85, 634 }, corner_size = 8, tint = m_color },
        glow = { position = { 17, 634 }, corner_size = 8, draw_type = "inner", tint = { 0, 0, 0 } }
    }
    data.raw["gui-style"].default.train_schedule_fulfilled_item_select_button.hovered_graphical_set                 = {
        base = { position = { 85, 634 }, corner_size = 8, tint = al_color },
        glow = { corner_size = 8, position = { 34, 634 }, tint = al_color, draw_type = "outer" }
    }
    data.raw["gui-style"].default.train_schedule_fulfilled_item_select_button.clicked_graphical_set                 = { base = { position = { 51, 634 }, corner_size = 8, tint = al_color } }


    data.raw["gui-style"].default.vertical_scrollbar.thumb_button_style.hovered_graphical_set = { base = { position = { 85, 634 }, corner_size = 8, tint = al_color } }
    data.raw["gui-style"].default.vertical_scrollbar.thumb_button_style.clicked_graphical_set = { base = { position = { 51, 634 }, corner_size = 8, tint = al_color } }
    data.raw["gui-style"].default.horizontal_scrollbar.thumb_button_style.hovered_graphical_set = { base = { position = { 85, 634 }, corner_size = 8, tint = al_color } }
    data.raw["gui-style"].default.horizontal_scrollbar.thumb_button_style.clicked_graphical_set = { base = { position = { 51, 634 }, corner_size = 8, tint = al_color } }


    data.raw["gui-style"].default.radiobutton.default_graphical_set = {
        base = { position = { 0, 160 }, size = { 24, 24 }, tint = m_color },
        glow = { position = { 24, 160 }, size = { 24, 24 }, tint = al_color }
    }
    data.raw["gui-style"].default.radiobutton.hovered_graphical_set = { base = { position = { 72, 160 }, size = { 24, 24 }, tint = al_color } }
    data.raw["gui-style"].default.radiobutton.clicked_graphical_set = { base = { position = { 48, 160 }, size = { 24, 24 }, tint = al_color } }
    data.raw["gui-style"].default.radiobutton.disabled_graphical_set = {
        base = { position = { 0, 160 }, size = { 24, 24 }, tint = m_color },
        glow = { position = { 24, 160 }, size = { 24, 24 }, draw_type = "inner", tint = { 0, 0, 0 } }
    }
    data.raw["gui-style"].default.radiobutton.selected_graphical_set = {
        base = { position = { 0, 160 }, size = { 24, 24 }, tint = al_color },
        glow = { position = { 24, 160 }, size = { 24, 24 }, tint = al_color }
    }
    data.raw["gui-style"].default.radiobutton.selected_hovered_graphical_set = { base = { position = { 72, 160 }, size = { 24, 24 }, tint = al_color } }
    data.raw["gui-style"].default.radiobutton.selected_clicked_graphical_set = { base = { position = { 48, 160 }, size = { 24, 24 }, tint = al_color } }

    data.raw["gui-style"].default.checkbox.default_graphical_set = {
        base = { position = { 0, 132 }, size = { 28, 28 }, tint = m_color },
        glow = { position = { 28, 132 }, size = { 28, 28 }, tint = al_color }
    }
    data.raw["gui-style"].default.checkbox.hovered_graphical_set = {
        base = { position = { 84, 132 }, size = { 28, 28 }, tint = al_color },
        glow = { position = { 34, 634 }, corner_size = 8, tint = al_color, draw_type = "outer" },
    }
    data.raw["gui-style"].default.checkbox.clicked_graphical_set = { base = { position = { 56, 132 }, size = { 28, 28 }, tint = a_color } }
    data.raw["gui-style"].default.checkbox.disabled_graphical_set = {
        base = { position = { 0, 132 }, size = { 28, 28 }, tint = m_color },
        glow = { position = { 28, 132 }, size = { 28, 28 }, tint = { 0, 0, 0 } }
    }
    data.raw["gui-style"].default.checkbox.selected_graphical_set = {
        base = { position = { 0, 132 }, size = { 28, 28 }, tint = a_color },
        glow = { position = { 28, 132 }, size = { 28, 28 }, tint = al_color }
    }
    data.raw["gui-style"].default.checkbox.selected_hovered_graphical_set = {
        base = { position = { 84, 132 }, size = { 28, 28 }, tint = al_color },
        glow = { position = { 34, 634 }, corner_size = 8, tint = al_color, draw_type = "outer" },
    }
    data.raw["gui-style"].default.checkbox.selected_clicked_graphical_set = { base = { position = { 56, 132 }, size = { 28, 28 }, tint = a_color } }
    --data.raw["gui-style"].default.checkbox.checkmark.tint = al_color

    data.raw["gui-style"].default.switch.default_background = { position = { 0, 96 }, size = { 64, 32 }, tint = a_color }
    data.raw["gui-style"].default.switch.hover_background = { position = { 64, 96 }, size = { 64, 32 }, tint = al_color }
    data.raw["gui-style"].default.switch.disabled_background = { position = { 0, 96 }, size = { 64, 32 }, tint = m_color }
    data.raw["gui-style"].default.switch.button.default_graphical_set = { base = { position = { 128, 96 }, size = 28 } }
    data.raw["gui-style"].default.switch.button.hovered_graphical_set = { base = { position = { 156, 96 }, size = 28, tint = al_color } }
    data.raw["gui-style"].default.switch.button.clicked_graphical_set = { base = { position = { 184, 96 }, size = 28, tint = al_color } }
    data.raw["gui-style"].default.switch.button.disabled_graphical_set = { base = { position = { 128, 96 }, size = 28, tint = m_color } }

    data.raw["gui-style"].default.slider.full_bar = {
        base = { position = { 0, 634 }, corner_size = 8, tint = a_color },
        shadow = { position = { 17, 634 }, corner_size = 8, tint = al_color }
    }
    data.raw["gui-style"].default.slider.full_bar_disabled = { base = { position = { 90, 72 }, corner_size = 8 } }
    data.raw["gui-style"].default.slider.button.default_graphical_set = { base = { position = { 64, 48 }, size = { 40, 24 } } }
    data.raw["gui-style"].default.slider.button.hovered_graphical_set = {
        base = { position = { 144, 48 }, size = { 40, 24 }, tint = al_color },
        glow = { position = { 200, 128 }, corner_size = 8, tint = al_color, draw_type = "outer" }
    }
    data.raw["gui-style"].default.slider.button.clicked_graphical_set = { base = { position = { 184, 48 }, size = { 40, 24 }, tint = al_color } }
    data.raw["gui-style"].default.slider.button.disabled_graphical_set = { base = { position = { 104, 48 }, size = { 40, 24 } } }
    data.raw["gui-style"].default.slider.notch = { base = {position = {143, 200}, size = {4, 16}, tint = a_color} }

    data.raw["gui-style"].default.double_slider.full_bar = {
        base = { position = { 0, 634 }, corner_size = 8, tint = a_color },
        shadow = { position = { 17, 634 }, corner_size = 8, tint = al_color }
    }
    data.raw["gui-style"].default.double_slider.full_bar_disabled = { base = { position = { 90, 72 }, corner_size = 8 } }
    data.raw["gui-style"].default.double_slider.notch = { base = {position = {143, 200}, size = {4, 16}, tint = a_color} }
    
    data.raw["gui-style"].default.left_slider_button.default_graphical_set = { base = { position = { 64, 48 }, size = { 40, 24 } } }
    data.raw["gui-style"].default.left_slider_button.hovered_graphical_set = {
        base = { position = { 144, 48 }, size = { 40, 24 }, tint = al_color },
        glow = { position = { 200, 128 }, corner_size = 8, tint = al_color, draw_type = "outer" }
    }
    data.raw["gui-style"].default.left_slider_button.clicked_graphical_set = { base = { position = { 184, 48 }, size = { 40, 24 }, tint = al_color } }
    data.raw["gui-style"].default.left_slider_button.disabled_graphical_set = { base = { position = { 104, 48 }, size = { 40, 24 } } }

    data.raw["gui-style"].default.right_slider_button.default_graphical_set = { base = { position = { 64, 48 }, size = { 40, 24 } } }
    data.raw["gui-style"].default.right_slider_button.hovered_graphical_set = {
        base = { position = { 144, 48 }, size = { 40, 24 }, tint = al_color },
        glow = { position = { 200, 128 }, corner_size = 8, tint = al_color, draw_type = "outer" }
    }
    data.raw["gui-style"].default.right_slider_button.clicked_graphical_set = { base = { position = { 184, 48 }, size = { 40, 24 }, tint = al_color } }
    data.raw["gui-style"].default.right_slider_button.disabled_graphical_set = { base = { position = { 104, 48 }, size = { 40, 24 } } }

    data.raw["gui-style"].default.tab.default_graphical_set = {
        base = { position = { 85, 634 }, corner_size = 8, tint = m_color },
        glow = { position = { 17, 634 }, corner_size = 8, draw_type = "inner", tint = a_color }
    }
    data.raw["gui-style"].default.tab.selected_graphical_set = { base = { position = { 225, 17 }, corner_size = 8, tint = al_color } }
    data.raw["gui-style"].default.tab.hovered_graphical_set = {
        base = { position = { 34, 17 }, corner_size = 8, tint = al_color },
        glow = { position = { 200, 128 }, corner_size = 8, tint = al_color, draw_type = "outer" }
    }
    data.raw["gui-style"].default.tab.game_controller_selected_hovered_graphical_set = { base = { position = { 225, 17 }, corner_size = 8, tint = al_color } }
    data.raw["gui-style"].default.tab.clicked_graphical_set = { base = { position = { 51, 17 }, corner_size = 8, tint = al_color } }
    data.raw["gui-style"].default.tab.disabled_graphical_set = { base = { position = { 17, 17 }, corner_size = 8 } }
    --data.raw["gui-style"].default.tab.default_badge_graphical_set = { base = { position = { 0, 0 }, corner_size = 8 } }
    --data.raw["gui-style"].default.tab.selected_badge_graphical_set = { base = { position = { 0, 0 }, corner_size = 8 } }
    --data.raw["gui-style"].default.tab.hover_badge_graphical_set = { base = { position = { 0, 0 }, corner_size = 8 } }
    --data.raw["gui-style"].default.tab.press_badge_graphical_set = { base = { position = { 0, 0 }, corner_size = 8 } }
    --data.raw["gui-style"].default.tab.disabled_badge_graphical_set = { base = { position = { 0, 0 }, corner_size = 8 } }
    data.raw["gui-style"].default.tab.increase_height_when_selected = false

    data.raw["gui-style"].default.filter_group_slot_tab.default_graphical_set = { base = { position = { 314, 746 }, corner_size = 6 } }
    data.raw["gui-style"].default.filter_group_slot_tab.selected_graphical_set = { base = { position = { 365, 746 }, corner_size = 6, tint = a_color } }
    data.raw["gui-style"].default.filter_group_slot_tab.disabled_graphical_set = { base = { position = { 331, 746 }, corner_size = 6 } }

    data.raw["gui-style"].default.filter_group_tab.default_graphical_set = { base = { position = { 314, 746 }, corner_size = 6 } }
    data.raw["gui-style"].default.filter_group_tab.selected_graphical_set = { base = { position = { 365, 746 }, corner_size = 6, tint = a_color } }
    data.raw["gui-style"].default.filter_group_tab.hovered_graphical_set = { base = { position = { 348, 746 }, corner_size = 6, tint = a_color } }
    data.raw["gui-style"].default.filter_group_tab.clicked_graphical_set = { base = { position = { 365, 746 }, corner_size = 6 } }
    data.raw["gui-style"].default.filter_group_tab.disabled_graphical_set = { base = { position = { 331, 746 }, corner_size = 6 } }
    data.raw["gui-style"].default.filter_group_tab.override_graphics_on_edges = false
    data.raw["gui-style"].default.filter_group_tab.left_edge_selected_graphical_set = { base = { position = { 0, 0 }, corner_size = 8 } }
    data.raw["gui-style"].default.filter_group_tab.right_edge_selected_graphical_set = { base = { position = { 0, 0 }, corner_size = 8 } }

    data.raw["gui-style"].default.filter_group_button_tab_slightly_larger.default_graphical_set = { base = { position = { 314, 746 }, corner_size = 6 } }
    data.raw["gui-style"].default.filter_group_button_tab_slightly_larger.selected_graphical_set = { base = { position = { 365, 746 }, corner_size = 6, tint = a_color } }
    data.raw["gui-style"].default.filter_group_button_tab_slightly_larger.disabled_graphical_set = { base = { position = { 331, 746 }, corner_size = 6 } }
    data.raw["gui-style"].default.filter_group_button_tab_slightly_larger.selected_hovered_graphical_set = { base = { position = { 365, 746 }, corner_size = 6, tint = a_color } }
    data.raw["gui-style"].default.filter_group_button_tab_slightly_larger.selected_clicked_graphical_set = { base = { position = { 365, 746 }, corner_size = 6, tint = al_color } }
    
    data.raw["gui-style"].default.choose_chat_icon_button.hovered_graphical_set = {
        base = { position = { 85, 634 }, corner_size = 8, tint = al_color },
        glow = { position = { 34, 634 }, corner_size = 8, tint = al_color, draw_type = "outer" }
    }
    data.raw["gui-style"].default.choose_chat_icon_button.clicked_graphical_set = { base = { position = { 51, 17 }, corner_size = 8, tint = al_color } }
    data.raw["gui-style"].default.choose_chat_icon_in_textbox_button.hovered_graphical_set = {
        base = { position = { 85, 634 }, corner_size = 8, tint = al_color },
        glow = { position = { 34, 634 }, corner_size = 8, tint = al_color, draw_type = "outer" }
    }
    data.raw["gui-style"].default.choose_chat_icon_in_textbox_button.clicked_graphical_set = { base = { position = { 51, 17 }, corner_size = 8, tint = al_color } }

    --data.raw["gui-style"].default.table_with_selection.default_row_graphical_set = {position = {208, 17},  corner_size = 8}
    data.raw["gui-style"].default.table_with_selection.hovered_graphical_set = { position = { 369, 17 }, corner_size = 8, tint = al_color }
    data.raw["gui-style"].default.table_with_selection.clicked_graphical_set = { position = { 51, 17 }, corner_size = 8, tint = al_color }
    data.raw["gui-style"].default.table_with_selection.selected_graphical_set = { position = { 51, 17 }, corner_size = 8, tint = al_color }
    data.raw["gui-style"].default.table_with_selection.selected_hovered_graphical_set = { position = { 369, 17 }, corner_size = 8, tint = al_color }
    data.raw["gui-style"].default.table_with_selection.selected_clicked_graphical_set = { position = { 352, 17 }, corner_size = 8, tint = al_color }

    data.raw["gui-style"].default.rounded_button.default_graphical_set = nil
    data.raw["gui-style"].default.rounded_button.hovered_graphical_set = nil
    data.raw["gui-style"].default.rounded_button.clicked_graphical_set = nil
    data.raw["gui-style"].default.rounded_button.disabled_graphical_set = nil
    data.raw["gui-style"].default.rounded_button.selected_graphical_set = nil
    data.raw["gui-style"].default.rounded_button.selected_hovered_graphical_set = nil
    data.raw["gui-style"].default.rounded_button.selected_clicked_graphical_set = nil

    data.raw["gui-style"].default.electric_satisfaction_in_description_progressbar = {type = "progressbar_style", parent = "electric_satisfaction_progressbar"}

if mods["flib"] then
    data.raw["gui-style"].default.flib_slot_button_default.default_graphical_set = { base = { border = 4, position = { 0, 736 }, size = 80 } }
    data.raw["gui-style"].default.flib_slot_button_default.hovered_graphical_set = {
        base = { border = 4, position = { 80, 736 }, size = 80, tint = al_color },
        glow = {
            position = { 240, 736 },
            corner_size = 16,
            tint = a_color,
            top_outer_border_shift = 4,
            bottom_outer_border_shift = -4,
            left_outer_border_shift = 4,
            right_outer_border_shift = -4,
            draw_type = "outer"
        }
    }
    data.raw["gui-style"].default.flib_slot_button_default.clicked_graphical_set = { base = { border = 4, position = { 160, 736 }, size = 80, tint = al_color } }
    data.raw["gui-style"].default.flib_slot_button_default.selected_graphical_set = { base = { border = 4, position = { 80, 736 }, size = 80, tint = al_color } }
    data.raw["gui-style"].default.flib_slot_button_default.selected_hovered_graphical_set = {
        base = { border = 4, position = { 80, 736 }, size = 80, tint = al_color },
        glow = {
            position = { 240, 736 },
            corner_size = 16,
            tint = a_color,
            top_outer_border_shift = 4,
            bottom_outer_border_shift = -4,
            left_outer_border_shift = 4,
            right_outer_border_shift = -4,
            draw_type = "outer"
        }
    }
    data.raw["gui-style"].default.flib_slot_button_default.selected_clicked_graphical_set = { base = { border = 4, position = { 160, 736 }, size = 80, tint = al_color } }

function set_flib_slot_button(color, tint1, tint2)
    local string = "flib_slot_button_" .. color
    data.raw["gui-style"].default[string].default_graphical_set = { base = { border = 4, position = { 80, 736 }, size = 80, tint = tint1 } }
    data.raw["gui-style"].default[string].hovered_graphical_set = {
        base = { border = 4, position = { 80, 736 }, size = 80, tint = tint2 },
        glow = {
            position = { 240, 736 },
            corner_size = 16,
            tint = tint2,
            top_outer_border_shift = 4,
            bottom_outer_border_shift = -4,
            left_outer_border_shift = 4,
            right_outer_border_shift = -4,
            draw_type = "outer"
        }
    }
    data.raw["gui-style"].default[string].clicked_graphical_set = { base = { border = 4, position = { 160, 736 }, size = 80, tint = tint2 } }
    data.raw["gui-style"].default[string].selected_graphical_set = { base = { border = 4, position = { 80, 736 }, size = 80, tint = tint2 } }
    data.raw["gui-style"].default[string].selected_hovered_graphical_set = {
        base = { border = 4, position = { 80, 736 }, size = 80, tint = tint2 },
        glow = {
            position = { 240, 736 },
            corner_size = 16,
            tint = tint2,
            top_outer_border_shift = 4,
            bottom_outer_border_shift = -4,
            left_outer_border_shift = 4,
            right_outer_border_shift = -4,
            draw_type = "outer"
        }
    }
    data.raw["gui-style"].default[string].selected_clicked_graphical_set = { base = { border = 4, position = { 160, 736 }, size = 80, tint = tint2 } }
end

set_flib_slot_button("red", {210, 60, 60}, {225, 105, 105})
set_flib_slot_button("green", {100, 220, 70}, {130, 225, 105} )
set_flib_slot_button("blue", {70, 130, 220}, {90, 145, 230} )
set_flib_slot_button("pink", {190, 70, 220}, {200, 105, 225} )
set_flib_slot_button("cyan", {70, 220, 220}, {110, 230, 230} )
set_flib_slot_button("yellow", {220, 220, 70}, {230, 230, 110} )
end

if mods["factoryplanner"] then
    data.raw["gui-style"].default.fp_button_frame.selected_graphical_set = nil
    data.raw["gui-style"].default.fp_button_frame.selected_hovered_graphical_set = nil
    data.raw["gui-style"].default.fp_button_frame.selected_clicked_graphical_set = nil
    data.raw["gui-style"].default.fp_table_production.odd_row_graphical_set  = { position = { 8, 642 }, size = 1, tint = m_color }
    if settings.startup["FUI_invert_color"].value then
        data.raw.sprite.fp_panel.filename = "__core__/graphics/icons/mip/expand-panel-white.png"
        data.raw.sprite.fp_archive.invert_colors = true
        data.raw.sprite.fp_fold_out_subfloors.invert_colors = true
        data.raw.sprite.fp_default.invert_colors = true
        data.raw.sprite.fp_default_all.invert_colors = true
        data.raw.sprite.flib_settings_black.invert_colors = true
    end
end

if mods["informatron"] then
    data.raw["gui-style"].default.informatron_menu_button.default_graphical_set = {
        base = { position = { 85, 634 }, corner_size = 8, tint = m_color },
        glow = { position = { 17, 634 }, corner_size = 8, draw_type = "inner", tint = a_color }
    }
    data.raw["gui-style"].default.informatron_menu_button.clicked_graphical_set = { base = { position = { 51, 17 }, corner_size = 8, tint = al_color } }
    data.raw["gui-style"].default.informatron_menu_button.hovered_graphical_set = { base = { position = { 369, 17 }, corner_size = 8, tint = al_color } }
    data.raw["gui-style"].default.informatron_menu_button.disabled_graphical_set = { base = { position = { 17, 17 }, corner_size = 8 } }

    data.raw["gui-style"].default.informatron_menu_button_selected.default_graphical_set = { base = { position = { 225, 17 }, corner_size = 8, tint = al_color } }
data.raw["gui-style"].default.informatron_menu_button_selected.hovered_graphical_set = { base = { position = { 369, 17 }, corner_size = 8, tint = al_color } }
end

end

if settings.startup["FUI_invert_color"].value then
    data.raw["gui-style"].default.button.default_font_color = { 230, 230, 230 }
    data.raw["gui-style"].default.button.disabled_font_color = { 100, 100, 100 }
    data.raw["gui-style"].default.tab.default_font_color = { 230, 230, 230 }

    data.raw["gui-style"].default.dialog_button.default_font_color = { 230, 230, 230 }
    data.raw["gui-style"].default.menu_button.default_font_color = { 230, 230, 230 }
    data.raw["gui-style"].default.menu_button.hovered_font_color = { 30, 30, 30 }
    data.raw["gui-style"].default.menu_button.clicked_font_color = { 30, 30, 30 }
    data.raw["gui-style"].default.menu_button_continue.default_font_color = { 30, 30, 30 }
    data.raw["gui-style"].default.textbox.font_color = { 255, 255, 255 }
    data.raw["gui-style"].default.textbox.selection_background_color = al_color

    data.raw["gui-style"].default.tool_button.invert_colors_of_picture_when_hovered_or_toggled = true
    data.raw["gui-style"].default.train_schedule_action_button.invert_colors_of_picture_when_hovered_or_toggled = true

    data.raw["gui-style"].default.tool_button.invert_colors_of_picture_when_disabled = false
    data.raw["gui-style"].default.train_schedule_action_button.invert_colors_of_picture_when_hovered_or_toggled = true
    --data.raw["gui-style"].default.checkbox.checkmark.invert_colors = true
    --data.raw["gui-style"].default.black_checkbox.font_color = { 30, 30, 30 } -- black checkbox inherits from checkbox so this inverts the above invert
    
    data.raw["utility-sprites"].default.rename_icon.invert_colors = true
    data.raw["utility-sprites"].default.map_exchange_string.invert_colors = true
    data.raw["utility-sprites"].default.list_view.invert_colors = true
    data.raw["utility-sprites"].default.grid_view.invert_colors = true
    data.raw["utility-sprites"].default.slots_view.invert_colors = true
    data.raw["utility-sprites"].default.copy.invert_colors = true
    data.raw["utility-sprites"].default.sort_by_time.invert_colors = true
    data.raw["utility-sprites"].default.sync_mods.invert_colors = true
    data.raw["utility-sprites"].default.sort_by_name.invert_colors = true

    data.raw["gui-style"].default.dropdown.icon.invert_colors = true
    data.raw["utility-sprites"].default.move_tag.invert_colors = true
    data.raw["utility-sprites"].default.color_picker.invert_colors = true
    data.raw["utility-sprites"].default.play.invert_colors = true
    data.raw["utility-sprites"].default.dropdown.invert_colors = true
    data.raw["utility-sprites"].default.not_available_black.invert_colors = false
    data.raw["utility-sprites"].default.select_icon_black.invert_colors = false
    data.raw["utility-sprites"].default.editor_pause.invert_colors = true
    data.raw["utility-sprites"].default.editor_play.invert_colors = true
    data.raw["utility-sprites"].default.center.invert_colors = true
    data.raw["utility-sprites"].default.shuffle.invert_colors = true
    data.raw["utility-sprites"].default.import.invert_colors = true
    data.raw["utility-sprites"].default.export.invert_colors = true
    data.raw["utility-sprites"].default.refresh.invert_colors = true

    data.raw["utility-sprites"].default.search_icon.invert_colors = true
    data.raw["utility-sprites"].default.bookmark.invert_colors = true
    data.raw["utility-sprites"].default.mod_dependency_arrow.invert_colors = true
    data.raw["utility-sprites"].default.backward_arrow_black.invert_colors = true
    data.raw["utility-sprites"].default.forward_arrow_black.invert_colors = true
    data.raw["utility-sprites"].default.track_button.invert_colors = true
    data.raw["utility-sprites"].default.import_slot.invert_colors = true
    data.raw["utility-sprites"].default.clone.invert_colors = true
    data.raw["utility-sprites"].default.export_slot.invert_colors = true

    data.raw["utility-sprites"].default.equipment_grid_small.invert_colors = false
    data.raw["utility-sprites"].default.map.invert_colors = true

end