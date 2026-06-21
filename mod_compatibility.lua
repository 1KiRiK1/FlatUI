--local assets = "__FlatUI__/graphics/"
--local gui_tr = "__FlatUI__/graphics/gui-new_tr.png"
--local shadow_tint = { 0, 0, 0, 0.8 }
--local nothing = { base = { position = { 0, 0 }, corner_size = 8 } }
---------------------------------------------------------------------
-- #region functions rgb2hsv hsv2rgb
---------------------------------------------------------------------
-- h, s, l, r, g, b, are all in range [0, 1]
local min, max, abs = math.min, math.max, math.abs
local function rgb2hsv(r, g, b)
    local M, m = max(r, g, b), min(r, g, b)
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
--#endregion
---------------------------------------------------------------------
-- #region function safe_modify
---------------------------------------------------------------------
local function safe_modify(name, modifications)
    local style = data.raw["gui-style"].default[name]
    if style then
        for key, value in pairs(modifications) do
            style[key] = value
        end
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
    accent_color = settings.startup["FUI_additional_color"].value
else
    accent_color = COLOR_PRESETS[settings.startup["FUI_set_add_color"].value] or COLOR_PRESETS.Factorio_orange
end
local h, s, v = rgb2hsv(accent_color.r / 255, accent_color.g / 255, accent_color.b / 255)
v = v > 0.8 and 1.0 or 0.9
local light_accent = { hsv2rgb(h, s, v) }
--#endregion
---------------------------------------------------------------------
-- #region flib
---------------------------------------------------------------------
if mods["flib"] then
    local SPRITE = {
        SLOT_EMPTY = { position = { 0, 0 }, size = 80, border = 4 },
        SLOT_BASE = { position = { 80, 0 }, size = 80, border = 4 },
        SLOT_CLICKED = { position = { 160, 0 }, size = 80, border = 4 },
        GLOW = {
            position = { 240, 0 },
            corner_size = 16,
            top_outer_border_shift = 4,
            bottom_outer_border_shift = -4,
            left_outer_border_shift = 4,
            right_outer_border_shift = -4,
            draw_type = "outer"
        }
    }
    local FLIB_BUTTON_FILE = "__FlatUI__/graphics/flib_button.png"
    local function setup_flib_button(style_name, colors)
        local style = data.raw["gui-style"].default[style_name]
        if not style then return end
        local base_color, hover_color, disabled_color = colors[1], colors[2], colors[3]
        style.default_graphical_set = { base = { border = 4, filename = FLIB_BUTTON_FILE, position = SPRITE.SLOT_BASE.position, size = SPRITE.SLOT_BASE.size, tint = base_color } }
        style.hovered_graphical_set = {
            base = { border = 4, filename = FLIB_BUTTON_FILE, position = SPRITE.SLOT_BASE.position, size = SPRITE.SLOT_BASE.size, tint = hover_color },
            glow = {
                type = "composition",
                filename = FLIB_BUTTON_FILE,
                position = SPRITE.GLOW.position,
                corner_size = SPRITE.GLOW.corner_size,
                tint = hover_color,
                top_outer_border_shift = SPRITE.GLOW.top_outer_border_shift,
                bottom_outer_border_shift = SPRITE.GLOW.bottom_outer_border_shift,
                left_outer_border_shift = SPRITE.GLOW.left_outer_border_shift,
                right_outer_border_shift = SPRITE.GLOW.right_outer_border_shift,
                draw_type = SPRITE.GLOW.draw_type
            }
        }
        style.clicked_graphical_set = { base = { border = 4, filename = FLIB_BUTTON_FILE, position = SPRITE.SLOT_CLICKED.position, size = SPRITE.SLOT_CLICKED.size, tint = hover_color } }
        style.selected_graphical_set = { base = { border = 4, filename = FLIB_BUTTON_FILE, position = SPRITE.SLOT_BASE.position, size = SPRITE.SLOT_BASE.size, tint = hover_color } }
        style.selected_hovered_graphical_set = {
            base = { border = 4, filename = FLIB_BUTTON_FILE, position = SPRITE.SLOT_BASE.position, size = SPRITE.SLOT_BASE.size, tint = hover_color },
            glow = {
                type = "composition",
                filename = FLIB_BUTTON_FILE,
                position = SPRITE.GLOW.position,
                corner_size = SPRITE.GLOW.corner_size,
                tint = hover_color,
                top_outer_border_shift = SPRITE.GLOW.top_outer_border_shift,
                bottom_outer_border_shift = SPRITE.GLOW.bottom_outer_border_shift,
                left_outer_border_shift = SPRITE.GLOW.left_outer_border_shift,
                right_outer_border_shift = SPRITE.GLOW.right_outer_border_shift,
                draw_type = SPRITE.GLOW.draw_type
            }
        }
        style.selected_clicked_graphical_set = { base = { border = 4, filename = FLIB_BUTTON_FILE, position = SPRITE.SLOT_CLICKED.position, size = SPRITE.SLOT_CLICKED.size, tint = hover_color } }
        style.disabled_graphical_set = { base = { border = 4, filename = FLIB_BUTTON_FILE, position = SPRITE.SLOT_BASE.position, size = SPRITE.SLOT_BASE.size, tint = disabled_color } }
    end
    local BUTTONS = {
        default = { nil, accent_color, { 50, 50, 50 } },
        grey = { { 142, 142, 142 }, { 190, 190, 190 }, { 90, 90, 90 } },
        red = { { 210, 60, 60 }, { 225, 105, 105 }, { 110, 43, 43 } },
        orange = { { 210, 145, 45 }, { 250, 170, 55 }, { 150, 108, 47 } },
        yellow = { { 205, 205, 30 }, { 235, 235, 35 }, { 150, 150, 47 } },
        green = { { 100, 220, 70 }, { 130, 225, 105 }, { 67, 150, 47 } },
        cyan = { { 70, 220, 220 }, { 110, 230, 230 }, { 47, 150, 150 } },
        blue = { { 70, 130, 220 }, { 90, 145, 230 }, { 47, 88, 150 } },
        purple = { { 90, 60, 200 }, { 100, 70, 240 }, { 67, 47, 150 } },
        pink = { { 190, 70, 220 }, { 200, 105, 225 }, { 129, 47, 150 } },
        selected = { { 255, 175, 0 }, { 255, 220, 0 }, { 255, 175, 0 } },
    }
    for name, colors in pairs(BUTTONS) do
        setup_flib_button("flib_slot_button_" .. name, colors)
    end
    data.raw["gui-style"].default.flib_slot_button_default.default_graphical_set = { base = { border = 4, filename = FLIB_BUTTON_FILE, position = SPRITE.SLOT_EMPTY.position, size = SPRITE.SLOT_EMPTY.size } }
    if mods["cybersyn"] then
        local CYBERSYN_BUTTONS = {
            ltnm_small_slot_button_default = { position = SPRITE.SLOT_EMPTY.position, tint = nil },
            ltnm_small_slot_button_red = { position = SPRITE.SLOT_BASE.position, tint = { 210, 60, 60 } },
            ltnm_small_slot_button_green = { position = SPRITE.SLOT_BASE.position, tint = { 100, 220, 70 } },
            ltnm_small_slot_button_blue = { position = SPRITE.SLOT_BASE.position, tint = { 70, 130, 220 } },
            ltnm_small_slot_button_orange = { position = SPRITE.SLOT_BASE.position, tint = { 210, 145, 45 } },
        }
        for name, config in pairs(CYBERSYN_BUTTONS) do
            local style = data.raw["gui-style"].default[name]
            if style then
                style.disabled_graphical_set = { base = { border = 4, filename = FLIB_BUTTON_FILE, position = config.position, size = 80, tint = config.tint } }
            end
        end
    end
end
--#endregion
---------------------------------------------------------------------
-- #region factoryplanner
---------------------------------------------------------------------
if mods["factoryplanner"] then
    safe_modify("fp_button_frame", {
        selected_graphical_set = nil,
        selected_hovered_graphical_set = nil,
        selected_clicked_graphical_set = nil,
    })
    safe_modify("fp_table_production", { odd_row_graphical_set = { position = { 8, 642 }, size = 1, tint = main_color } })
    if settings.startup["FUI_invert_color"].value then
        local sprites_to_invert = {
            "fp_archive",
            "fp_fold_out_subfloors",
            "fp_default",
            "fp_default_all",
            "flib_settings_black",
        }
        for _, sprite_name in ipairs(sprites_to_invert) do
            local sprite = data.raw.sprite[sprite_name]
            if sprite then
                sprite.invert_colors = true
            end
        end
        if data.raw.sprite.fp_panel then
            data.raw.sprite.fp_panel.filename = "__core__/graphics/icons/mip/expand-panel-white.png"
        end
    end
end
--#endregion
---------------------------------------------------------------------
-- #region informatron
---------------------------------------------------------------------
if mods["informatron"] then
    safe_modify("informatron_menu_button", {
        default_graphical_set = {
            base = { position = { 85, 634 }, corner_size = 8, tint = main_color },
            glow = { position = { 17, 634 }, corner_size = 8, draw_type = "inner", tint = accent_color }
        },
        clicked_graphical_set = { base = { position = { 51, 17 }, corner_size = 8, tint = light_accent } },
        hovered_graphical_set = { base = { position = { 369, 17 }, corner_size = 8, tint = light_accent } },
        disabled_graphical_set = { base = { position = { 17, 17 }, corner_size = 8 } }
    })
    safe_modify("informatron_menu_button_selected", {
        default_graphical_set = { base = { position = { 225, 17 }, corner_size = 8, tint = light_accent } },
        hovered_graphical_set = { base = { position = { 369, 17 }, corner_size = 8, tint = light_accent } }
    })
end
--#endregion
