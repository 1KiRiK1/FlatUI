local assets = "__FlatUI__/graphics/"
local gui_tr = "__FlatUI__/graphics/gui-new_tr.png"
local gui_style = data.raw["gui-style"].default
local utility_sprites = data.raw["utility-sprites"].default
local shadow_tint = { 0, 0, 0, 0.8 }
-- local nothing = { base = { position = { 0, 0 }, corner_size = 8 } }
---------------------------------------------------------------------
-- #region functions rgb2hsv hsv2rgb
---------------------------------------------------------------------
local function rgb2hsv(r, g, b)
    local M, m = math.max(r, g, b), math.min(r, g, b)
    local C = M - m
    local h = 0
    if C ~= 0 then
        local K = 1 / (6 * C)
        if M == r then
            h = ((g - b) * K) % 1
        elseif M == g then
            h = (b - r) * K + 1 / 3
        else
            h = (r - g) * K + 2 / 3
        end
    end
    return h, (M == 0 and 0 or C / M), M
end
local function hsv2rgb(h, s, v)
    local C = v * s
    local m = v - C
    local r, g, b = m, m, m
    if h == h then
        local h_ = (h % 1) * 6
        local X = C * (1 - math.abs(h_ % 2 - 1))
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
--#endregion
---------------------------------------------------------------------
-- #region function apply_alpha_to_color
---------------------------------------------------------------------
local function apply_alpha_to_color(color, alpha)
    if color.r > 1 or color.g > 1 or color.b > 1 then
        return { r = color.r, g = color.g, b = color.b, a = alpha }
    else
        return { r = color.r, g = color.g, b = color.b, a = alpha / 255 }
    end
end
--#endregion
---------------------------------------------------------------------
-- #region get colors
---------------------------------------------------------------------
local main_color = settings.startup["FUI_main_color"].value --[[@as Color]]
local COLOR_PRESETS = {
    White = { r = 255, g = 255, b = 255, a = 255 },
    Grey = { r = 128, g = 128, b = 128, a = 255 },
    Red = { r = 255, g = 0, b = 0, a = 255 },
    Orange_red = { r = 255, g = 69, b = 0, a = 255 },
    Orange = { r = 255, g = 165, b = 0, a = 255 },
    Yellow_orange = { r = 255, g = 200, b = 0, a = 255 },
    Yellow = { r = 255, g = 255, b = 0, a = 255 },
    Yellow_green = { r = 173, g = 255, b = 47, a = 255 },
    Green = { r = 0, g = 255, b = 0, a = 255 },
    Green_cyan = { r = 0, g = 255, b = 127, a = 255 },
    Cyan = { r = 0, g = 255, b = 255, a = 255 },
    Blue_cyan = { r = 0, g = 191, b = 255, a = 255 },
    Blue = { r = 0, g = 0, b = 255, a = 255 },
    Blue_violet = { r = 75, g = 0, b = 255, a = 255 },
    Violet = { r = 128, g = 0, b = 128, a = 255 },
    Factorio_orange = { r = 251, g = 169, b = 47, a = 255 },
}
local accent_color
if settings.startup["FUI_set_add_color"].value == "Custom" then
    accent_color = settings.startup["FUI_additional_color"].value --[[@as Color]]
else
    accent_color = COLOR_PRESETS[settings.startup["FUI_set_add_color"].value] or COLOR_PRESETS.Factorio_orange
end
local h, s, v = rgb2hsv(accent_color.r / 255, accent_color.g / 255, accent_color.b / 255)
v = v > 0.8 and 1.0 or 0.9
local light_accent = { hsv2rgb(h, s, v) }
--#endregion
---------------------------------------------------------------------
-- #region FUI_UI_style
---------------------------------------------------------------------
if settings.startup["FUI_UI_style"].value == "transparent" then
    gui_style.red_circuit_network_content_slot.default_graphical_set = { border = 1, filename = gui_tr, position = { 506, 378 }, size = 76 }
    gui_style.green_circuit_network_content_slot.default_graphical_set = { border = 1, filename = gui_tr, position = { 506, 138 }, size = 76 }
    gui_style.compact_red_slot.default_graphical_set = { border = 1, filename = gui_tr, position = { 506, 378 }, size = 76 }

    gui_style.red_slot.default_graphical_set.base.position = { 504, 376 }
    gui_style.red_slot.hovered_graphical_set.base.position = { 504, 456 }
    gui_style.red_slot.clicked_graphical_set.base.position = { 504, 536 }
    gui_style.red_slot.selected_graphical_set.base.position = { 504, 456 }

    gui_style.health_progressbar.bar = { filename = gui_tr, position = { 100, 586 }, size = { 1, 11 } }
    gui_style.health_progressbar.bar_background = { filename = gui_tr, position = { 101, 586 }, size = { 1, 13 } }

    gui_style.draggable_space.graphical_set.shadow = nil
    gui_style.draggable_space_in_train_schedule.graphical_set.glow = nil
    gui_style.draggable_space_in_temporary_train_station.graphical_set.base.tint = accent_color
    gui_style.draggable_space_in_temporary_train_station.graphical_set.shadow = nil
    gui_style.fulfilled_draggable_space_in_train_schedule.graphical_set.glow = nil
    gui_style.train_schedule_fulfilled_delete_button.default_graphical_set.shadow = nil
    gui_style.dark_button.default_graphical_set.shadow = nil
    gui_style.train_schedule_partially_fullfilled_condition_frame.graphical_set.shadow = nil
    gui_style.partially_fulfilled_draggable_space_in_train_schedule.graphical_set.glow = nil
    gui_style.train_schedule_partially_fulfilled_delete_button.default_graphical_set.shadow = nil

    gui_style.default_tileset = gui_tr
    gui_style.removed_content_table.odd_row_graphical_set.filename = gui_tr
    gui_style.undelete_space_platforms_table.odd_row_graphical_set.filename = gui_tr

    gui_style.completed_achievement_frame.graphical_set.base.background_blur = true
    utility_sprites.achievement_label.layers[1].filename = gui_tr
    utility_sprites.achievement_label_completed.layers[1].filename = gui_tr
    utility_sprites.achievement_label_failed.layers[1].filename = gui_tr
    utility_sprites.gradient.filename = gui_tr
    utility_sprites.output_console_gradient.filename = gui_tr

    gui_style.browse_games_gui_toggle_favorite_on_button.default_graphical_set.filename = gui_tr
    gui_style.browse_games_gui_toggle_favorite_on_button.hovered_graphical_set.filename = gui_tr
    gui_style.browse_games_gui_toggle_favorite_on_button.clicked_graphical_set.filename = gui_tr
    gui_style.browse_games_gui_toggle_favorite_on_button.disabled_graphical_set.filename = gui_tr
    gui_style.browse_games_gui_toggle_favorite_off_button.default_graphical_set.filename = gui_tr
    gui_style.browse_games_gui_toggle_favorite_off_button.hovered_graphical_set.filename = gui_tr
    gui_style.browse_games_gui_toggle_favorite_off_button.clicked_graphical_set.filename = gui_tr
    gui_style.browse_games_gui_toggle_favorite_off_button.disabled_graphical_set.filename = gui_tr

    utility_sprites.status_working.filename = assets .. "status.png"
    utility_sprites.status_not_working.filename = assets .. "status.png"
    utility_sprites.status_yellow.filename = assets .. "status.png"
    utility_sprites.status_blue.filename = assets .. "status.png"
    utility_sprites.status_inactive.filename = assets .. "status.png"

    gui_style.electric_satisfaction_in_description_progressbar = { type = "progressbar_style", parent = "electric_satisfaction_progressbar" }
    -- #region frame
    gui_style.frame.graphical_set = {
        base = { corner_size = 8, position = { 0, 634 }, tint = main_color, background_blur = true },
        glow = { corner_size = 8, position = { 17, 634 }, tint = accent_color, draw_type = "inner" },
        shadow = { corner_size = 8, position = { 34, 634 }, tint = shadow_tint, draw_type = "outer" }
    }

    gui_style.character_gui_left_side.graphical_set = {
        base = {
            left_top = { position = { 0, 634 }, size = { 8, 8 } },
            left = { position = { 0, 642 }, size = { 8, 1 } },
            left_bottom = { position = { 0, 643 }, size = { 8, 8 } },
            top = { position = { 8, 634 }, size = { 1, 8 } },
            bottom = { position = { 8, 643 }, size = { 1, 8 } },
            center = { position = { 8, 642 }, size = { 1, 1 } },
            tint = main_color,
            background_blur = true
        },
        glow = {
            left_top = { position = { 17, 634 }, size = { 8, 8 } },
            left = { position = { 17, 642 }, size = { 8, 1 } },
            left_bottom = { position = { 17, 643 }, size = { 8, 8 } },
            top = { position = { 25, 634 }, size = { 1, 8 } },
            bottom = { position = { 25, 643 }, size = { 1, 8 } },
            center = { position = { 25, 642 }, size = { 1, 1 } },
            tint = accent_color,
            draw_type = "inner"
        },
        shadow = {
            top = { position = { 34 + 8, 634 }, size = { 1, 8 } },
            left_top = { position = { 34, 634 }, size = { 8, 8 } },
            left = { position = { 34, 642 }, size = { 8, 1 } },
            left_bottom = { position = { 34, 643 }, size = { 8, 8 } },
            bottom = { position = { 34 + 8, 643 }, size = { 1, 8 } },
            center = { position = { 34 + 8, 634 + 8 }, size = { 1, 1 } },
            tint = shadow_tint,
            draw_type = "outer"
        }
    }

    gui_style.frame_without_left_side.graphical_set = {
        base = {
            right_top = { position = { 9, 634 }, size = { 8, 8 } },
            right = { position = { 9, 642 }, size = { 8, 1 } },
            right_bottom = { position = { 9, 643 }, size = { 8, 8 } },
            top = { position = { 8, 634 }, size = { 1, 8 } },
            bottom = { position = { 8, 643 }, size = { 1, 8 } },
            center = { position = { 8, 642 }, size = { 1, 1 } },
            tint = main_color,
            background_blur = true
        },
        glow = {
            right_top = { position = { 26, 634 }, size = { 8, 8 } },
            right = { position = { 26, 642 }, size = { 8, 1 } },
            right_bottom = { position = { 26, 643 }, size = { 8, 8 } },
            top = { position = { 25, 634 }, size = { 1, 8 } },
            bottom = { position = { 25, 643 }, size = { 1, 8 } },
            center = { position = { 25, 642 }, size = { 1, 1 } },
            tint = accent_color,
            draw_type = "inner"
        },
        shadow = {
            top = { position = { 34 + 8, 634 }, size = { 1, 8 } },
            right_top = { position = { 34 + 9, 634 }, size = { 8, 8 } },
            right = { position = { 34 + 9, 634 + 8 }, size = { 8, 1 } },
            right_bottom = { position = { 34 + 9, 634 + 9 }, size = { 8, 8 } },
            bottom = { position = { 34 + 9, 634 + 9 }, size = { 1, 8 } },
            center = { position = { 34 + 8, 634 + 8 }, size = { 1, 1 } },
            tint = shadow_tint,
            draw_type = "outer"
        }
    }

    gui_style.frame_without_left_and_right_side.graphical_set = {
        base = {
            top = { position = { 8, 634 }, size = { 1, 8 } },
            bottom = { position = { 8, 643 }, size = { 1, 8 } },
            center = { position = { 8, 642 }, size = { 1, 1 } },
            tint = main_color,
            background_blur = true
        },
        glow = {
            top = { position = { 25, 634 }, size = { 1, 8 } },
            bottom = { position = { 25, 643 }, size = { 1, 8 } },
            center = { position = { 25, 642 }, size = { 1, 1 } },
            tint = accent_color,
            draw_type = "inner"
        },
        shadow = {
            top = { position = { 34 + 8, 634 }, size = { 1, 8 } },
            bottom = { position = { 34 + 9, 634 + 9 }, size = { 1, 8 } },
            center = { position = { 34 + 8, 634 + 8 }, size = { 1, 1 } },
            tint = shadow_tint,
            draw_type = "outer"
        }
    }

    gui_style.frame_tabbed_pane.tab_content_frame.graphical_set = {
        base = {
            right = { position = { 9, 642 }, size = { 8, 1 } },
            right_bottom = { position = { 9, 643 }, size = { 8, 8 } },
            bottom = { position = { 8, 643 }, size = { 1, 8 } },
            center = { position = { 8, 642 }, size = { 1, 1 } },
            tint = main_color,
            background_blur = true
        },
        glow = {
            right = { position = { 26, 642 }, size = { 8, 1 } },
            right_bottom = { position = { 26, 643 }, size = { 8, 8 } },
            bottom = { position = { 25, 643 }, size = { 1, 8 } },
            center = { position = { 25, 642 }, size = { 1, 1 } },
            tint = accent_color,
            draw_type = "inner"
        },
        shadow = {
            right = { position = { 34 + 9, 634 + 8 }, size = { 8, 1 } },
            right_bottom = { position = { 34 + 9, 634 + 9 }, size = { 8, 8 } },
            bottom = { position = { 34 + 9, 634 + 9 }, size = { 1, 8 } },
            center = { position = { 34 + 8, 634 + 8 }, size = { 1, 1 } },
            tint = shadow_tint,
            draw_type = "outer"
        }
    }
    gui_style.frame_tabbed_pane_corner.graphical_set = {
        base = {
            top = { position = { 8, 634 }, size = { 1, 8 } },
            center = { position = { 8, 642 }, size = { 1, 1 } },
            tint = main_color,
            background_blur = true
        },
        glow = {
            top = { position = { 25, 634 }, size = { 1, 8 } },
            center = { position = { 25, 642 }, size = { 1, 1 } },
            tint = accent_color,
            draw_type = "inner"
        },
        shadow = {
            top = { position = { 34 + 8, 634 }, size = { 1, 8 } },
            center = { position = { 34 + 8, 634 + 8 }, size = { 1, 1 } },
            tint = shadow_tint,
            draw_type = "outer"
        }
    }
    gui_style.frame_tabbed_pane_frame_header.graphical_set = {
        base = {
            right_top = { position = { 9, 634 }, size = { 8, 8 } },
            right = { position = { 9, 642 }, size = { 8, 1 } },
            top = { position = { 8, 634 }, size = { 1, 8 } },
            center = { position = { 8, 642 }, size = { 1, 1 } },
            tint = main_color,
            background_blur = true
        },
        glow = {
            right_top = { position = { 26, 634 }, size = { 8, 8 } },
            right = { position = { 26, 642 }, size = { 8, 1 } },
            top = { position = { 25, 634 }, size = { 1, 8 } },
            center = { position = { 25, 642 }, size = { 1, 1 } },
            tint = accent_color,
            draw_type = "inner"
        },
        shadow = {
            top = { position = { 34 + 8, 634 }, size = { 1, 8 } },
            right_top = { position = { 34 + 9, 634 }, size = { 8, 8 } },
            right = { position = { 34 + 9, 634 + 8 }, size = { 8, 1 } },
            center = { position = { 34 + 8, 634 + 8 }, size = { 1, 1 } },
            tint = shadow_tint,
            draw_type = "outer"
        }
    }
    gui_style.frame_tab.default_graphical_set = {
        base = { border = 4, position = { 80, 736 }, size = 80, tint = main_color, background_blur = true },
        glow = {
            position = { 240, 736 },
            corner_size = 16,
            tint = accent_color,
            top_outer_border_shift = 4,
            bottom_outer_border_shift = -4,
            left_outer_border_shift = 4,
            right_outer_border_shift = -4,
            draw_type = "outer"
        }
    }
    gui_style.frame_tab.selected_graphical_set = {
        base = { border = 4, position = { 80, 736 }, size = 80, tint = light_accent },
        glow = {
            position = { 240, 736 },
            corner_size = 16,
            tint = accent_color,
            top_outer_border_shift = 4,
            bottom_outer_border_shift = -4,
            left_outer_border_shift = 4,
            right_outer_border_shift = -4,
            draw_type = "outer"
        }
    }

    gui_style.inside_shallow_frame.graphical_set = { base = { position = { 17, 0 }, corner_size = 8, draw_type = "outer", tint = accent_color } }
    gui_style.subheader_frame.graphical_set = { base = { corner_size = 8, position = { 0, 634 }, tint = main_color, background_blur = true } }
    gui_style.repeated_subheader_frame.graphical_set = { base = { corner_size = 8, position = { 0, 634 }, tint = main_color, background_blur = true } }

    gui_style.deep_frame_in_shallow_frame.graphical_set = { base = { position = { 85, 0 }, corner_size = 8, draw_type = "outer", tint = accent_color } }
    gui_style.scroll_pane.graphical_set = { base = { position = { 17, 0 }, corner_size = 8, draw_type = "outer", tint = accent_color } }
    gui_style.deep_scroll_pane.graphical_set = { base = { position = { 85, 0 }, corner_size = 8, draw_type = "outer", tint = accent_color } }

    gui_style.technology_gui_outer_frame.graphical_set = { base = { corner_size = 8, position = { 51, 634 }, tint = main_color, background_blur = true } }
    gui_style.frame_around_top.graphical_set = { base = { corner_size = 8, position = { 51, 634 }, tint = main_color, background_blur = true } }
    gui_style.frame_around_bottom.graphical_set = { base = { corner_size = 8, position = { 51, 634 }, tint = main_color, background_blur = true } }
    gui_style.frame_around_left.graphical_set = { base = { corner_size = 8, position = { 51, 634 }, tint = main_color, background_blur = true } }
    gui_style.frame_around_right.graphical_set = { base = { corner_size = 8, position = { 51, 634 }, tint = main_color, background_blur = true } }

    gui_style.frame_around_center.graphical_set = {
        base = { corner_size = 8, position = { 68, 634 }, draw_type = "outer", tint = main_color, background_blur = true },
        glow = { corner_size = 8, position = { 17, 0 }, draw_type = "outer", tint = accent_color }
    }

    gui_style.shallow_frame.graphical_set = {
        base = { position = { 85, 634 }, corner_size = 8, tint = main_color },
        glow = { position = { 17, 634 }, corner_size = 8, draw_type = "inner", tint = accent_color }
    }

    gui_style.tooltip_frame.graphical_set = {
        base = { corner_size = 8, position = { 0, 634 }, tint = main_color, background_blur = true },
        glow = { corner_size = 8, position = { 17, 634 }, tint = accent_color, draw_type = "inner" },
        shadow = { corner_size = 8, position = { 34, 634 }, tint = shadow_tint, draw_type = "outer" }
    }

    gui_style.tooltip_panel_background.graphical_set = {
        base = { corner_size = 8, position = { 0, 634 }, tint = main_color, background_blur = true },
        glow = { corner_size = 8, position = { 17, 634 }, tint = accent_color, draw_type = "inner" },
        shadow = { corner_size = 8, position = { 34, 634 }, tint = shadow_tint, draw_type = "outer" }
    }

    gui_style.tooltip_title_frame_light.graphical_set = {
        base = { corner_size = 8, position = { 0, 634 }, tint = accent_color, background_blur = true },
        glow = { corner_size = 8, position = { 17, 634 }, tint = accent_color, draw_type = "inner" },
        shadow = { corner_size = 8, position = { 34, 634 }, tint = shadow_tint, draw_type = "outer" }
    }

    local border_config = {
        border_width = 8,
        vertical_line = { position = { 0, 40 }, size = { 8, 1 }, tint = accent_color },
        horizontal_line = { position = { 8, 40 }, size = { 1, 8 }, tint = accent_color },
        top_right_corner = { position = { 16, 40 }, size = { 8, 8 }, tint = accent_color },
        bottom_right_corner = { position = { 24, 40 }, size = { 8, 8 }, tint = accent_color },
        bottom_left_corner = { position = { 32, 40 }, size = { 8, 8 }, tint = accent_color },
        top_left_coner = { position = { 40, 40 }, size = { 8, 8 }, tint = accent_color },
        top_t = { position = { 64, 40 }, size = { 8, 8 }, tint = accent_color },
        right_t = { position = { 72, 40 }, size = { 8, 8 }, tint = accent_color },
        bottom_t = { position = { 48, 40 }, size = { 8, 8 }, tint = accent_color },
        left_t = { position = { 56, 40 }, size = { 8, 8 }, tint = accent_color },
        cross = { position = { 80, 40 }, size = { 8, 8 }, tint = accent_color },
        top_end = { position = { 88, 40 }, size = { 8, 8 }, tint = accent_color },
        right_end = { position = { 96, 40 }, size = { 8, 8 }, tint = accent_color },
        bottom_end = { position = { 104, 40 }, size = { 8, 8 }, tint = accent_color },
        left_end = { position = { 112, 40 }, size = { 8, 8 }, tint = accent_color }
    }

    gui_style.line.border = border_config
    gui_style.bordered_frame.border = border_config
    gui_style.bordered_table.border = border_config
    --#endregion
    --#region button
    gui_style.slot_button.default_graphical_set = { base = { border = 4, position = { 0, 736 }, size = 80 } }
    gui_style.slot_button.hovered_graphical_set = {
        base = { border = 4, position = { 80, 736 }, size = 80, tint = light_accent },
        glow = {
            position = { 240, 736 },
            corner_size = 16,
            tint = accent_color,
            top_outer_border_shift = 4,
            bottom_outer_border_shift = -4,
            left_outer_border_shift = 4,
            right_outer_border_shift = -4,
            draw_type = "outer"
        }
    }
    gui_style.slot_button.clicked_graphical_set = { base = { border = 4, position = { 160, 736 }, size = 80, tint = light_accent } }
    gui_style.slot_button.selected_graphical_set = { base = { border = 4, position = { 80, 736 }, size = 80, tint = light_accent } }
    gui_style.slot_button.selected_hovered_graphical_set = {
        base = { border = 4, position = { 80, 736 }, size = 80, tint = light_accent },
        glow = {
            position = { 240, 736 },
            corner_size = 16,
            tint = accent_color,
            top_outer_border_shift = 4,
            bottom_outer_border_shift = -4,
            left_outer_border_shift = 4,
            right_outer_border_shift = -4,
            draw_type = "outer"
        }
    }
    gui_style.slot_button.selected_clicked_graphical_set = { base = { border = 4, position = { 160, 736 }, size = 80, tint = light_accent } }
    gui_style.slot_button.pie_progress_color = apply_alpha_to_color(accent_color, 120)

    gui_style.yellow_slot_button.disabled_graphical_set = { base = { position = { 195, 72 }, corner_size = 8, tint = { 100, 60, 0 } } }
    gui_style.red_slot_button.disabled_graphical_set = { base = { position = { 195, 72 }, corner_size = 8, tint = { 85, 0, 0 } } }

    local glow_config = {
        position = { 280, 736 },
        corner_size = 16,
        tint = accent_color,
        top_outer_border_shift = 4,
        bottom_outer_border_shift = -4,
        left_outer_border_shift = 4,
        right_outer_border_shift = -4,
        draw_type = "outer"
    }

    gui_style.quick_bar_page_button.default_graphical_set = { base = { position = { 312, 744 }, corner_size = 8 } }
    gui_style.quick_bar_page_button.hovered_graphical_set = {
        base = { position = { 346, 744 }, corner_size = 8, tint = accent_color },
        glow = glow_config
    }
    gui_style.quick_bar_page_button.clicked_graphical_set = { base = { position = { 363, 744 }, corner_size = 8, tint = accent_color } }
    gui_style.quick_bar_page_button.disabled_graphical_set = { base = { position = { 329, 744 }, corner_size = 8 } }

    gui_style.slot_sized_button.default_graphical_set = { base = { position = { 312, 744 }, corner_size = 8 } }
    gui_style.slot_sized_button.disabled_graphical_set = { base = { position = { 329, 744 }, corner_size = 8 } }
    gui_style.slot_sized_button.hovered_graphical_set = {
        base = { position = { 346, 744 }, corner_size = 8, tint = accent_color },
        glow = glow_config
    }
    gui_style.slot_sized_button.clicked_graphical_set = { base = { position = { 363, 744 }, corner_size = 8, tint = accent_color } }
    gui_style.slot_sized_button.selected_graphical_set = { base = { position = { 363, 744 }, corner_size = 8, tint = accent_color } }
    gui_style.slot_sized_button.selected_hovered_graphical_set = {
        base = { position = { 346, 744 }, corner_size = 8, tint = accent_color },
        glow = glow_config
    }

    gui_style.slot_sized_button_blue.default_graphical_set = { base = { position = { 312, 760 }, corner_size = 8 } }
    gui_style.slot_sized_button_blue.disabled_graphical_set = { base = { position = { 329, 760 }, corner_size = 8 } }
    gui_style.slot_sized_button_blue.hovered_graphical_set = {
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
    gui_style.slot_sized_button_blue.clicked_graphical_set = { base = { position = { 363, 760 }, corner_size = 8 } }

    gui_style.slot_sized_button_red.default_graphical_set = { base = { position = { 312, 776 }, corner_size = 8 } }
    gui_style.slot_sized_button_red.disabled_graphical_set = { base = { position = { 329, 776 }, corner_size = 8 } }
    gui_style.slot_sized_button_red.hovered_graphical_set = {
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
    gui_style.slot_sized_button_red.clicked_graphical_set = { base = { position = { 363, 776 }, corner_size = 8 } }

    gui_style.slot_sized_button_green.default_graphical_set = { base = { position = { 312, 792 }, corner_size = 8 } }
    gui_style.slot_sized_button_green.disabled_graphical_set = { base = { position = { 329, 792 }, corner_size = 8 } }
    gui_style.slot_sized_button_green.hovered_graphical_set = {
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
    gui_style.slot_sized_button_green.clicked_graphical_set = { base = { position = { 363, 792 }, corner_size = 8 } }

    gui_style.button.default_graphical_set = {
        base = { position = { 85, 634 }, corner_size = 8, tint = main_color },
        glow = { position = { 17, 634 }, corner_size = 8, draw_type = "inner", tint = accent_color }
    }
    gui_style.button.hovered_graphical_set = {
        base = { position = { 34, 17 }, corner_size = 8, tint = light_accent },
        glow = { position = { 200, 128 }, corner_size = 8, tint = light_accent, draw_type = "outer" }
    }
    gui_style.button.clicked_graphical_set = { base = { position = { 51, 17 }, corner_size = 8, tint = light_accent } }
    gui_style.button.disabled_graphical_set = { base = { position = { 17, 17 }, corner_size = 8 } }
    gui_style.button.selected_graphical_set = { base = { position = { 225, 17 }, corner_size = 8, tint = light_accent } }
    gui_style.button.selected_hovered_graphical_set = { base = { position = { 369, 17 }, corner_size = 8, tint = light_accent } }
    gui_style.button.selected_clicked_graphical_set = { base = { position = { 352, 17 }, corner_size = 8, tint = light_accent } }

    gui_style.menu_button.default_graphical_set = {
        base = { position = { 51, 634 }, corner_size = 8, tint = main_color },
        glow = { position = { 119, 634 }, corner_size = 8, tint = accent_color }
    }

    gui_style.mod_gui_button.default_graphical_set = { base = { position = { 312, 744 }, corner_size = 8 } }
    gui_style.mod_gui_button.hovered_graphical_set = {
        base = { position = { 346, 744 }, corner_size = 8, tint = accent_color },
        glow = glow_config
    }
    gui_style.mod_gui_button.clicked_graphical_set = { base = { position = { 363, 744 }, corner_size = 8, tint = accent_color } }
    gui_style.mod_gui_button.selected_graphical_set = { base = { position = { 363, 744 }, corner_size = 8, tint = accent_color } }
    gui_style.mod_gui_button.selected_hovered_graphical_set = {
        base = { position = { 346, 744 }, corner_size = 8, tint = accent_color },
        glow = glow_config
    }

    gui_style.back_button.default_graphical_set = {
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
            tint = light_accent
        }
    }
    gui_style.back_button.hovered_graphical_set.base.tint = light_accent
    gui_style.back_button.hovered_graphical_set.glow.tint = light_accent
    gui_style.back_button.clicked_graphical_set.base.tint = light_accent
    gui_style.back_button.disabled_graphical_set.glow = nil

    gui_style.forward_button.default_graphical_set = {
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
            left = { position = { 17, 634 + 8 }, size = { 8, 1 } },
            left_bottom = { position = { 17, 634 + 9 }, size = 8 },
            center = { position = { 514, 656 }, size = { 1, 64 } },
            draw_type = "inner",
            tint = light_accent
        }
    }
    gui_style.forward_button.hovered_graphical_set.base.tint = light_accent
    gui_style.forward_button.hovered_graphical_set.glow.tint = light_accent
    gui_style.forward_button.clicked_graphical_set.base.tint = light_accent
    gui_style.forward_button.disabled_graphical_set.glow = nil

    gui_style.tips_and_tricks_notification_button.default_graphical_set = {
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
            left = { position = { 34, 634 + 8 }, size = { 8, 1 } },
            left_bottom = { position = { 34, 634 + 9 }, size = 8 },
            center = { position = { 336, 424 }, size = { 1, 64 } },
            right_outer_border_shift = -12,
            draw_type = "outer",
            tint = shadow_tint,
        }
    }
    gui_style.tips_and_tricks_notification_button.hovered_graphical_set.base.tint = light_accent
    gui_style.tips_and_tricks_notification_button.hovered_graphical_set.glow.tint = light_accent
    gui_style.tips_and_tricks_notification_button.clicked_graphical_set.base.tint = light_accent
    gui_style.tips_and_tricks_notification_button.disabled_graphical_set.glow = nil

    gui_style.slot_button_in_shallow_frame.default_graphical_set = {
        base = { position = { 85, 634 }, corner_size = 8, tint = main_color },
        glow = { position = { 17, 634 }, corner_size = 8, draw_type = "inner", tint = accent_color }
    }
    gui_style.slot_button_in_shallow_frame.hovered_graphical_set = {
        base = { position = { 85, 634 }, corner_size = 8, tint = light_accent },
        glow = { corner_size = 8, position = { 34, 634 }, tint = light_accent, draw_type = "outer" }
    }
    gui_style.slot_button_in_shallow_frame.clicked_graphical_set = { base = { position = { 51, 634 }, corner_size = 8, tint = light_accent } }
    gui_style.slot_button_in_shallow_frame.selected_graphical_set = { base = { position = { 51, 634 }, corner_size = 8, tint = light_accent } }
    gui_style.slot_button_in_shallow_frame.selected_hovered_graphical_set = { base = { position = { 51, 634 }, corner_size = 8, tint = light_accent } }
    gui_style.slot_button_in_shallow_frame.selected_clicked_graphical_set = { base = { position = { 51, 634 }, corner_size = 8, tint = light_accent } }
    gui_style.slot_button_in_shallow_frame.disabled_graphical_set = {
        base = { position = { 51, 634 }, corner_size = 8, tint = main_color },
        glow = { position = { 17, 634 }, corner_size = 8, tint = { 0, 0, 0 } }
    }

    gui_style.decider_combinator_signal_select_button.default_graphical_set = nil
    gui_style.decider_combinator_signal_select_button.hovered_graphical_set = nil
    gui_style.decider_combinator_signal_select_button.clicked_graphical_set = nil

    gui_style.dark_rounded_button.default_graphical_set = {
        base = { position = { 85, 634 }, corner_size = 8, tint = main_color },
        glow = { position = { 17, 634 }, corner_size = 8, draw_type = "inner", tint = accent_color }
    }
    gui_style.dark_rounded_button.hovered_graphical_set = {
        base = { position = { 85, 634 }, corner_size = 8, tint = light_accent },
        glow = { corner_size = 8, position = { 34, 634 }, tint = light_accent, draw_type = "outer" }
    }
    gui_style.dark_rounded_button.clicked_graphical_set = { base = { position = { 51, 634 }, corner_size = 8, tint = light_accent } }

    gui_style.train_schedule_condition_time_selection_button.default_graphical_set = {
        base = { position = { 85, 634 }, corner_size = 8, tint = main_color },
        glow = { position = { 17, 634 }, corner_size = 8, draw_type = "inner", tint = accent_color }
    }
    gui_style.train_schedule_delete_button.default_graphical_set = { base = { position = { 17, 634 }, corner_size = 8, draw_type = "inner", tint = accent_color } }
    gui_style.train_schedule_temporary_station_delete_button.default_graphical_set = {
        base = { position = { 85, 634 }, corner_size = 8, tint = accent_color },
        glow = { position = { 17, 634 }, corner_size = 8, draw_type = "inner", tint = light_accent }
    }

    gui_style.button_with_shadow.default_graphical_set = {
        base = { position = { 85, 634 }, corner_size = 8, tint = main_color },
        glow = { position = { 17, 634 }, corner_size = 8, draw_type = "inner", tint = accent_color }
    }
    gui_style.button_with_shadow.hovered_graphical_set = {
        base = { position = { 34, 17 }, corner_size = 8, tint = light_accent },
        glow = { position = { 200, 128 }, corner_size = 8, tint = light_accent, draw_type = "outer" }
    }
    gui_style.button_with_shadow.clicked_graphical_set = { base = { position = { 51, 17 }, corner_size = 8, tint = light_accent } }

    gui_style.frame_button.default_graphical_set = { base = { position = { 0, 0 }, corner_size = 8 } }
    gui_style.frame_button.hovered_graphical_set = {
        base = { position = { 34, 17 }, corner_size = 8, tint = light_accent },
        glow = { position = { 200, 128 }, corner_size = 8, tint = light_accent, draw_type = "outer" }
    }
    gui_style.frame_button.clicked_graphical_set = { base = { position = { 51, 17 }, corner_size = 8, tint = light_accent } }
    gui_style.frame_button.disabled_graphical_set = { base = { position = { 0, 0 }, corner_size = 8 } }
    gui_style.frame_button.selected_graphical_set = { base = { position = { 51, 634 }, corner_size = 8, tint = light_accent } }
    gui_style.frame_button.selected_hovered_graphical_set = { base = { position = { 51, 634 }, corner_size = 8, tint = light_accent } }

    gui_style.shortcut_bar_expand_button.width = 12
    gui_style.shortcut_bar_expand_button.default_graphical_set = { base = { position = { 0, 17 }, corner_size = 8 } }
    gui_style.shortcut_bar_expand_button.selected_graphical_set = { base = { position = { 51, 634 }, corner_size = 8, tint = light_accent } }
    gui_style.shortcut_bar_expand_button.selected_hovered_graphical_set = { base = { position = { 51, 634 }, corner_size = 8, tint = light_accent } }
    gui_style.shortcut_bar_expand_button.left_padding = 0
    gui_style.shortcut_bar_expand_button.right_padding = 0

    gui_style.rounded_button.default_graphical_set = nil
    gui_style.rounded_button.hovered_graphical_set = nil
    gui_style.rounded_button.clicked_graphical_set = nil
    gui_style.rounded_button.disabled_graphical_set = nil
    gui_style.rounded_button.selected_graphical_set = nil
    gui_style.rounded_button.selected_hovered_graphical_set = nil
    gui_style.rounded_button.selected_clicked_graphical_set = nil

    --#endregion

    --#region slot
    gui_style.slot.default_graphical_set = { base = { border = 4, position = { 0, 424 }, size = 80 } }
    gui_style.slot.hovered_graphical_set = { base = { border = 4, position = { 80, 424 }, size = 80, tint = light_accent } }
    gui_style.slot.clicked_graphical_set = { base = { border = 4, position = { 160, 424 }, size = 80, tint = light_accent } }
    gui_style.slot.pie_progress_color = apply_alpha_to_color(accent_color, 120)

    gui_style.tool_equip_ammo_slot.default_graphical_set = nil
    gui_style.tool_equip_ammo_slot.hovered_graphical_set = nil
    gui_style.tool_equip_ammo_slot.clicked_graphical_set = nil
    gui_style.tool_equip_ammo_slot.selected_graphical_set = { base = { border = 4, position = { 160, 504 }, size = 80 } }
    gui_style.tool_equip_ammo_slot.selected_hovered_graphical_set = { base = { border = 4, position = { 160, 504 }, size = 80 } }
    gui_style.tool_equip_ammo_slot.selected_clicked_graphical_set = { base = { border = 4, position = { 160, 504 }, size = 80 } }

    gui_style.crafting_queue_slot.default_graphical_set = { position = { 312, 744 }, corner_size = 8 }
    gui_style.crafting_queue_slot.hovered_graphical_set = { base = { position = { 346, 744 }, corner_size = 8, tint = accent_color } }
    gui_style.crafting_queue_slot.clicked_graphical_set = { base = { position = { 363, 744 }, corner_size = 8, tint = accent_color } }
    gui_style.crafting_queue_slot.pie_progress_color = apply_alpha_to_color(accent_color, 120)

    gui_style.promised_crafting_queue_slot.default_graphical_set = { position = { 312, 744 }, corner_size = 8, tint = { 150, 150, 150 } }
    gui_style.promised_crafting_queue_slot.hovered_graphical_set = { base = { position = { 346, 744 }, corner_size = 8, tint = accent_color } }
    gui_style.promised_crafting_queue_slot.clicked_graphical_set = { base = { position = { 363, 744 }, corner_size = 8, tint = accent_color } }
    --#endregion

    --#region textbox
    gui_style.textbox.default_background = {
        base = { position = { 85, 634 }, corner_size = 8, tint = main_color },
        shadow = { position = { 17, 634 }, corner_size = 8, draw_type = "inner", tint = light_accent }
    }
    gui_style.textbox.active_background = {
        base = { position = { 51, 634 }, corner_size = 8, tint = { main_color.r, main_color.g, main_color.b, a = 0.7 } },
        shadow = { position = { 136, 634 }, corner_size = 8, tint = light_accent },
    }
    gui_style.textbox.game_controller_hovered_background = {
        base = { position = { 85, 634 }, corner_size = 8, tint = { main_color.r, main_color.g, main_color.b, a = 0.8 } },
        shadow = { position = { 17, 634 }, corner_size = 8, tint = light_accent },
    }
    gui_style.textbox.disabled_background = {
        base = { position = { 51, 634 }, corner_size = 8, tint = main_color },
        shadow = { position = { 17, 634 }, corner_size = 8, tint = { 0, 0, 0 } }
    }
    gui_style.textbox.selection_background_color = light_accent
    --#endregion

    --#region dropdown
    gui_style.train_schedule_comparison_type_frame.graphical_set = { base = { position = { 0, 0 }, corner_size = 8 } }

    gui_style.circuit_condition_comparator_dropdown.button_style.default_graphical_set = {
        base = { position = { 85, 634 }, corner_size = 8, tint = main_color },
        glow = { position = { 17, 634 }, corner_size = 8, draw_type = "inner", tint = accent_color }
    }
    gui_style.circuit_condition_comparator_dropdown.button_style.hovered_graphical_set = {
        base = { position = { 85, 634 }, corner_size = 8, tint = light_accent },
        glow = { corner_size = 8, position = { 34, 634 }, tint = light_accent, draw_type = "outer" }
    }
    gui_style.circuit_condition_comparator_dropdown.button_style.clicked_graphical_set = { base = { position = { 51, 634 }, corner_size = 8, tint = light_accent } }
    gui_style.circuit_condition_comparator_dropdown.button_style.disabled_graphical_set = {
        base = { position = { 51, 634 }, corner_size = 8, tint = main_color },
        glow = { position = { 17, 634 }, corner_size = 8, tint = { 0, 0, 0 } }
    }
    gui_style.circuit_condition_comparator_dropdown.button_style.selected_graphical_set = { base = { position = { 51, 634 }, corner_size = 8, tint = light_accent } }
    gui_style.circuit_condition_comparator_dropdown.button_style.selected_hovered_graphical_set = { base = { position = { 51, 634 }, corner_size = 8, tint = light_accent } }
    gui_style.circuit_condition_comparator_dropdown.button_style.selected_clicked_graphical_set = { base = { position = { 51, 634 }, corner_size = 8, tint = light_accent } }
    gui_style.circuit_condition_comparator_dropdown.button_style.default_font_color = { 200, 200, 200 }

    gui_style.list_box_item.default_graphical_set = {
        base = { position = { 51, 634 }, corner_size = 8, tint = { r = main_color.r, main_color.g, main_color.b, a = 0.9 } },
        glow = { position = { 17, 634 }, corner_size = 8, draw_type = "inner", tint = accent_color }
    }
    gui_style.list_box_item.hovered_graphical_set = {
        base = { position = { 85, 634 }, corner_size = 8, tint = light_accent },
        glow = { corner_size = 8, position = { 34, 634 }, tint = light_accent, draw_type = "outer" }
    }
    gui_style.list_box_item.clicked_graphical_set = { base = { position = { 51, 634 }, corner_size = 8, tint = light_accent } }
    gui_style.list_box_item.disabled_graphical_set = {
        base = { position = { 51, 634 }, corner_size = 8, tint = main_color },
        glow = { position = { 17, 634 }, corner_size = 8, tint = { 0, 0, 0 } }
    }

    gui_style.decider_combinator_fulfilled_signal_select_button.default_graphical_set = {
        base = { position = { 85, 634 }, corner_size = 8, tint = main_color },
        glow = { position = { 17, 634 }, corner_size = 8, draw_type = "inner", tint = { 0, 0, 0 } }
    }
    gui_style.decider_combinator_fulfilled_signal_select_button.hovered_graphical_set = {
        base = { position = { 85, 634 }, corner_size = 8, tint = light_accent },
        glow = { corner_size = 8, position = { 34, 634 }, tint = light_accent, draw_type = "outer" }
    }
    gui_style.decider_combinator_fulfilled_signal_select_button.clicked_graphical_set = { base = { position = { 51, 634 }, corner_size = 8, tint = light_accent } }

    gui_style.train_schedule_fulfilled_item_select_button.default_graphical_set = {
        base = { position = { 85, 634 }, corner_size = 8, tint = main_color },
        glow = { position = { 17, 634 }, corner_size = 8, draw_type = "inner", tint = { 0, 0, 0 } }
    }
    gui_style.train_schedule_fulfilled_item_select_button.hovered_graphical_set = {
        base = { position = { 85, 634 }, corner_size = 8, tint = light_accent },
        glow = { corner_size = 8, position = { 34, 634 }, tint = light_accent, draw_type = "outer" }
    }
    gui_style.train_schedule_fulfilled_item_select_button.clicked_graphical_set = { base = { position = { 51, 634 }, corner_size = 8, tint = light_accent } }
    --#endregion

    --#region scrollbar
    gui_style.vertical_scrollbar.thumb_button_style.hovered_graphical_set = { base = { position = { 85, 634 }, corner_size = 8, tint = light_accent } }
    gui_style.vertical_scrollbar.thumb_button_style.clicked_graphical_set = { base = { position = { 51, 634 }, corner_size = 8, tint = light_accent } }
    gui_style.horizontal_scrollbar.thumb_button_style.hovered_graphical_set = { base = { position = { 85, 634 }, corner_size = 8, tint = light_accent } }
    gui_style.horizontal_scrollbar.thumb_button_style.clicked_graphical_set = { base = { position = { 51, 634 }, corner_size = 8, tint = light_accent } }
    --#endregion

    --#region radiobutton
    gui_style.radiobutton.default_graphical_set = {
        base = { position = { 0, 160 }, size = { 24, 24 }, tint = main_color },
        glow = { position = { 24, 160 }, size = { 24, 24 }, tint = light_accent }
    }
    gui_style.radiobutton.hovered_graphical_set = { base = { position = { 72, 160 }, size = { 24, 24 }, tint = light_accent } }
    gui_style.radiobutton.clicked_graphical_set = { base = { position = { 48, 160 }, size = { 24, 24 }, tint = light_accent } }
    gui_style.radiobutton.disabled_graphical_set = {
        base = { position = { 0, 160 }, size = { 24, 24 }, tint = main_color },
        glow = { position = { 24, 160 }, size = { 24, 24 }, draw_type = "inner", tint = { 0, 0, 0 } }
    }
    gui_style.radiobutton.selected_graphical_set = {
        base = { position = { 0, 160 }, size = { 24, 24 }, tint = light_accent },
        glow = { position = { 24, 160 }, size = { 24, 24 }, tint = light_accent }
    }
    gui_style.radiobutton.selected_hovered_graphical_set = { base = { position = { 72, 160 }, size = { 24, 24 }, tint = light_accent } }
    gui_style.radiobutton.selected_clicked_graphical_set = { base = { position = { 48, 160 }, size = { 24, 24 }, tint = light_accent } }
    --#endregion

    --#region checkbox
    gui_style.checkbox.default_graphical_set = {
        base = { position = { 0, 132 }, size = { 28, 28 }, tint = main_color },
        glow = { position = { 28, 132 }, size = { 28, 28 }, tint = light_accent }
    }
    gui_style.checkbox.hovered_graphical_set = {
        base = { position = { 84, 132 }, size = { 28, 28 }, tint = light_accent },
        glow = { position = { 34, 634 }, corner_size = 8, tint = light_accent, draw_type = "outer" },
    }
    gui_style.checkbox.clicked_graphical_set = { base = { position = { 56, 132 }, size = { 28, 28 }, tint = accent_color } }
    gui_style.checkbox.disabled_graphical_set = {
        base = { position = { 0, 132 }, size = { 28, 28 }, tint = main_color },
        glow = { position = { 28, 132 }, size = { 28, 28 }, tint = { 0, 0, 0 } }
    }
    gui_style.checkbox.selected_graphical_set = {
        base = { position = { 0, 132 }, size = { 28, 28 }, tint = accent_color },
        glow = { position = { 28, 132 }, size = { 28, 28 }, tint = light_accent }
    }
    gui_style.checkbox.selected_hovered_graphical_set = {
        base = { position = { 84, 132 }, size = { 28, 28 }, tint = light_accent },
        glow = { position = { 34, 634 }, corner_size = 8, tint = light_accent, draw_type = "outer" },
    }
    gui_style.checkbox.selected_clicked_graphical_set = { base = { position = { 56, 132 }, size = { 28, 28 }, tint = accent_color } }
    --#endregion

    --#region switch
    gui_style.switch.default_background = { position = { 0, 96 }, size = { 64, 32 }, tint = accent_color }
    gui_style.switch.hover_background = { position = { 64, 96 }, size = { 64, 32 }, tint = light_accent }
    gui_style.switch.disabled_background = { position = { 0, 96 }, size = { 64, 32 }, tint = main_color }
    gui_style.switch.button.default_graphical_set = { base = { position = { 128, 96 }, size = 28 } }
    gui_style.switch.button.hovered_graphical_set = { base = { position = { 156, 96 }, size = 28, tint = light_accent } }
    gui_style.switch.button.clicked_graphical_set = { base = { position = { 184, 96 }, size = 28, tint = light_accent } }
    gui_style.switch.button.disabled_graphical_set = { base = { position = { 128, 96 }, size = 28, tint = main_color } }
    --#endregion

    --#region slider
    gui_style.slider.full_bar = {
        base = { position = { 0, 634 }, corner_size = 8, tint = accent_color },
        shadow = { position = { 17, 634 }, corner_size = 8, tint = light_accent }
    }
    gui_style.slider.full_bar_disabled = { base = { position = { 90, 72 }, corner_size = 8 } }
    gui_style.slider.button.default_graphical_set = { base = { position = { 64, 48 }, size = { 40, 24 } } }
    gui_style.slider.button.hovered_graphical_set = {
        base = { position = { 144, 48 }, size = { 40, 24 }, tint = light_accent },
        glow = { position = { 200, 128 }, corner_size = 8, tint = light_accent, draw_type = "outer" }
    }
    gui_style.slider.button.clicked_graphical_set = { base = { position = { 184, 48 }, size = { 40, 24 }, tint = light_accent } }
    gui_style.slider.button.disabled_graphical_set = { base = { position = { 104, 48 }, size = { 40, 24 } } }
    gui_style.slider.notch = { base = { position = { 143, 200 }, size = { 4, 16 }, tint = accent_color } }

    gui_style.double_slider.full_bar = {
        base = { position = { 0, 634 }, corner_size = 8, tint = accent_color },
        shadow = { position = { 17, 634 }, corner_size = 8, tint = light_accent }
    }
    gui_style.double_slider.full_bar_disabled = { base = { position = { 90, 72 }, corner_size = 8 } }
    gui_style.double_slider.notch = { base = { position = { 143, 200 }, size = { 4, 16 }, tint = accent_color } }

    gui_style.left_slider_button.default_graphical_set = { base = { position = { 64, 48 }, size = { 40, 24 } } }
    gui_style.left_slider_button.hovered_graphical_set = {
        base = { position = { 144, 48 }, size = { 40, 24 }, tint = light_accent },
        glow = { position = { 200, 128 }, corner_size = 8, tint = light_accent, draw_type = "outer" }
    }
    gui_style.left_slider_button.clicked_graphical_set = { base = { position = { 184, 48 }, size = { 40, 24 }, tint = light_accent } }
    gui_style.left_slider_button.disabled_graphical_set = { base = { position = { 104, 48 }, size = { 40, 24 } } }

    gui_style.right_slider_button.default_graphical_set = { base = { position = { 64, 48 }, size = { 40, 24 } } }
    gui_style.right_slider_button.hovered_graphical_set = {
        base = { position = { 144, 48 }, size = { 40, 24 }, tint = light_accent },
        glow = { position = { 200, 128 }, corner_size = 8, tint = light_accent, draw_type = "outer" }
    }
    gui_style.right_slider_button.clicked_graphical_set = { base = { position = { 184, 48 }, size = { 40, 24 }, tint = light_accent } }
    gui_style.right_slider_button.disabled_graphical_set = { base = { position = { 104, 48 }, size = { 40, 24 } } }
    --#endregion

    --#region tab
    gui_style.tab.default_graphical_set = {
        base = { position = { 85, 634 }, corner_size = 8, tint = main_color },
        glow = { position = { 17, 634 }, corner_size = 8, draw_type = "inner", tint = accent_color }
    }
    gui_style.tab.selected_graphical_set = { base = { position = { 225, 17 }, corner_size = 8, tint = light_accent } }
    gui_style.tab.hovered_graphical_set = {
        base = { position = { 34, 17 }, corner_size = 8, tint = light_accent },
        glow = { position = { 200, 128 }, corner_size = 8, tint = light_accent, draw_type = "outer" }
    }
    gui_style.tab.game_controller_selected_hovered_graphical_set = { base = { position = { 225, 17 }, corner_size = 8, tint = light_accent } }
    gui_style.tab.clicked_graphical_set = { base = { position = { 51, 17 }, corner_size = 8, tint = light_accent } }
    gui_style.tab.disabled_graphical_set = { base = { position = { 17, 17 }, corner_size = 8 } }
    gui_style.tab.increase_height_when_selected = false
    --#endregion

    --#region filter_group
    gui_style.filter_group_slot_tab.default_graphical_set = { base = { position = { 314, 746 }, corner_size = 6 } }
    gui_style.filter_group_slot_tab.selected_graphical_set = { base = { position = { 365, 746 }, corner_size = 6, tint = accent_color } }
    gui_style.filter_group_slot_tab.disabled_graphical_set = { base = { position = { 331, 746 }, corner_size = 6 } }

    gui_style.filter_group_tab.default_graphical_set = { base = { position = { 314, 746 }, corner_size = 6 } }
    gui_style.filter_group_tab.selected_graphical_set = { base = { position = { 365, 746 }, corner_size = 6, tint = accent_color } }
    gui_style.filter_group_tab.hovered_graphical_set = { base = { position = { 348, 746 }, corner_size = 6, tint = accent_color } }
    gui_style.filter_group_tab.clicked_graphical_set = { base = { position = { 365, 746 }, corner_size = 6 } }
    gui_style.filter_group_tab.disabled_graphical_set = { base = { position = { 331, 746 }, corner_size = 6 } }
    gui_style.filter_group_tab.override_graphics_on_edges = false
    gui_style.filter_group_tab.left_edge_selected_graphical_set = { base = { position = { 0, 0 }, corner_size = 8 } }
    gui_style.filter_group_tab.right_edge_selected_graphical_set = { base = { position = { 0, 0 }, corner_size = 8 } }

    gui_style.filter_group_button_tab_slightly_larger.default_graphical_set = { base = { position = { 314, 746 }, corner_size = 6 } }
    gui_style.filter_group_button_tab_slightly_larger.selected_graphical_set = { base = { position = { 365, 746 }, corner_size = 6, tint = accent_color } }
    gui_style.filter_group_button_tab_slightly_larger.disabled_graphical_set = { base = { position = { 331, 746 }, corner_size = 6 } }
    gui_style.filter_group_button_tab_slightly_larger.selected_hovered_graphical_set = { base = { position = { 365, 746 }, corner_size = 6, tint = accent_color } }
    gui_style.filter_group_button_tab_slightly_larger.selected_clicked_graphical_set = { base = { position = { 365, 746 }, corner_size = 6, tint = light_accent } }

    gui_style.choose_chat_icon_button.hovered_graphical_set = {
        base = { position = { 85, 634 }, corner_size = 8, tint = light_accent },
        glow = { position = { 34, 634 }, corner_size = 8, tint = light_accent, draw_type = "outer" }
    }
    gui_style.choose_chat_icon_button.clicked_graphical_set = { base = { position = { 51, 17 }, corner_size = 8, tint = light_accent } }
    gui_style.choose_chat_icon_in_textbox_button.hovered_graphical_set = {
        base = { position = { 85, 634 }, corner_size = 8, tint = light_accent },
        glow = { position = { 34, 634 }, corner_size = 8, tint = light_accent, draw_type = "outer" }
    }
    gui_style.choose_chat_icon_in_textbox_button.clicked_graphical_set = { base = { position = { 51, 17 }, corner_size = 8, tint = light_accent } }
    --#endregion

    --#region table_with_selection
    gui_style.table_with_selection.hovered_graphical_set = { position = { 369, 17 }, corner_size = 8, tint = light_accent }
    gui_style.table_with_selection.clicked_graphical_set = { position = { 51, 17 }, corner_size = 8, tint = light_accent }
    gui_style.table_with_selection.selected_graphical_set = { position = { 51, 17 }, corner_size = 8, tint = light_accent }
    gui_style.table_with_selection.selected_hovered_graphical_set = { position = { 369, 17 }, corner_size = 8, tint = light_accent }
    gui_style.table_with_selection.selected_clicked_graphical_set = { position = { 352, 17 }, corner_size = 8, tint = light_accent }
    --#endregion
    gui_style.electric_satisfaction_in_description_progressbar = { type = "progressbar_style", parent = "electric_satisfaction_progressbar" }
end
--#endregion
---------------------------------------------------------------------
-- #region FUI_invert_color
---------------------------------------------------------------------
if settings.startup["FUI_invert_color"].value then
    gui_style.button.default_font_color = { 230, 230, 230 }
    gui_style.button.disabled_font_color = { 100, 100, 100 }
    gui_style.tab.default_font_color = { 230, 230, 230 }
    gui_style.dialog_button.default_font_color = { 230, 230, 230 }
    gui_style.menu_button.default_font_color = { 230, 230, 230 }
    gui_style.menu_button.hovered_font_color = { 30, 30, 30 }
    gui_style.menu_button.clicked_font_color = { 30, 30, 30 }
    gui_style.menu_button_continue.default_font_color = { 30, 30, 30 }
    gui_style.textbox.font_color = { 255, 255, 255 }
    gui_style.textbox.selection_background_color = light_accent

    gui_style.tool_button.invert_colors_of_picture_when_hovered_or_toggled = true
    gui_style.train_schedule_action_button.invert_colors_of_picture_when_hovered_or_toggled = true
    gui_style.tool_button.invert_colors_of_picture_when_disabled = false
    gui_style.dropdown.icon.invert_colors = true

    local invert_sprites_to_true = {
        "rename_icon", "map_exchange_string", "list_view", "grid_view", "slots_view",
        "copy", "sort_by_time", "sync_mods", "sort_by_name", "move_tag",
        "color_picker", "play", "dropdown", "editor_pause", "editor_play",
        "center", "shuffle", "import", "export", "refresh",
        "search_icon", "bookmark", "mod_dependency_arrow", "backward_arrow_black",
        "forward_arrow_black", "track_button", "import_slot", "clone", "export_slot",
        "map"
    }
    for _, name in ipairs(invert_sprites_to_true) do
        if utility_sprites[name] then
            utility_sprites[name].invert_colors = true
        end
    end
    local invert_sprites_to_false = { "not_available_black", "select_icon_black", "equipment_grid_small" }
    for _, name in ipairs(invert_sprites_to_false) do
        if utility_sprites[name] then
            utility_sprites[name].invert_colors = false
        end
    end
end
--#endregion
