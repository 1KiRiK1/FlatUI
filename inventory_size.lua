local utility_constants = data.raw["utility-constants"]["default"]
local gui_style = data.raw["gui-style"].default

local inventory_width = settings.startup["FUI_inventory_width"].value
if inventory_width == "big" then
    utility_constants.inventory_width = 14
elseif inventory_width == "biggest" then
    utility_constants.inventory_width = 17
end
-------------------------------------------------------------------------------------------------
local recipe_width = settings.startup["FUI_recipe_width"].value
if recipe_width == "big" then
    utility_constants.select_slot_row_count = 14
elseif recipe_width == "biggest" then
    utility_constants.select_slot_row_count = 17
end
-------------------------------------------------------------------------------------------------
-- Formula for calculating the number of button rows:
-- (icon_width * number_of_columns + spacing_between_icons * (number_of_columns - 1) + spacing_on_edges) / button_width
local count = utility_constants.select_slot_row_count
local group_button_width = settings.startup["FUI_group_button_width"].value
if group_button_width == "default" then
    utility_constants.select_group_row_count = (38 * count + 2 * (count - 1) + 28) / 71
elseif group_button_width == "small" then
    utility_constants.select_group_row_count = (38 * count + 2 * (count - 1) + 26) / 60
    gui_style.filter_group_slot_tab.size = { 60, 60 }
    gui_style.filter_group_slot_tab.left_padding = 3
    gui_style.filter_group_slot_tab.right_padding = 3
    gui_style.filter_group_slot_tab.top_padding = 3
    gui_style.filter_group_slot_tab.bottom_padding = 3
elseif group_button_width == "smaller" then
    utility_constants.select_group_row_count = (38 * count + 2 * (count - 1) + 26) / 50
    gui_style.filter_group_slot_tab.size = { 50, 50 }
    gui_style.filter_group_slot_tab.left_padding = 2
    gui_style.filter_group_slot_tab.right_padding = 2
    gui_style.filter_group_slot_tab.top_padding = 2
    gui_style.filter_group_slot_tab.bottom_padding = 2
elseif group_button_width == "smallest" then
    utility_constants.select_group_row_count = (38 * count + 2 * (count - 1) + 26) / 40
    gui_style.filter_group_slot_tab.size = { 40, 40 }
    gui_style.filter_group_slot_tab.left_padding = 1
    gui_style.filter_group_slot_tab.right_padding = 1
    gui_style.filter_group_slot_tab.top_padding = 1
    gui_style.filter_group_slot_tab.bottom_padding = 1
end