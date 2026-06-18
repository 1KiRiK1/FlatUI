if settings.startup["FUI_inventory_width"].value == "big" then
    data.raw["utility-constants"]["default"].inventory_width = 14
    --data.raw["gui-style"]["default"].inventory_scroll_pane.minimal_width = data.raw["utility-constants"]["default"].inventory_width * 40 + 12 -- поправка на ширину + ширина логистики
elseif settings.startup["FUI_inventory_width"].value == "biggest" then
    data.raw["utility-constants"]["default"].inventory_width = 17
    --data.raw["gui-style"]["default"].inventory_scroll_pane.minimal_width = data.raw["utility-constants"]["default"].inventory_width * 40 + 12 -- поправка на ширину + ширина логистики
end
-------------------------------------------------------------------------------------------------
if settings.startup["FUI_recipe_width"].value == "big" then
    data.raw["utility-constants"]["default"].select_slot_row_count = 14
elseif settings.startup["FUI_recipe_width"].value == "biggest" then
    data.raw["utility-constants"]["default"].select_slot_row_count = 17
end
-------------------------------------------------------------------------------------------------
--426
--584
--704
local count = data.raw["utility-constants"]["default"].select_slot_row_count
if settings.startup["FUI_group_button_width"].value == "default" then
    data.raw["utility-constants"]["default"].select_group_row_count = (38 * count + 2 * (count - 1) + 28) / 71
elseif settings.startup["FUI_group_button_width"].value == "small" then
    data.raw["utility-constants"]["default"].select_group_row_count = (38 * count + 2 * (count - 1) + 26) / 60
    data.raw["gui-style"].default.filter_group_slot_tab.size = { 60, 60 }
    data.raw["gui-style"].default.filter_group_slot_tab.left_padding = 3
    data.raw["gui-style"].default.filter_group_slot_tab.right_padding = 3
    data.raw["gui-style"].default.filter_group_slot_tab.top_padding = 3
    data.raw["gui-style"].default.filter_group_slot_tab.bottom_padding = 3
elseif settings.startup["FUI_group_button_width"].value == "smaller" then
    data.raw["utility-constants"]["default"].select_group_row_count = (38 * count + 2 * (count - 1) + 26) / 50
    data.raw["gui-style"].default.filter_group_slot_tab.size = { 50, 50 }
    data.raw["gui-style"].default.filter_group_slot_tab.left_padding = 2
    data.raw["gui-style"].default.filter_group_slot_tab.right_padding = 2
    data.raw["gui-style"].default.filter_group_slot_tab.top_padding = 2
    data.raw["gui-style"].default.filter_group_slot_tab.bottom_padding = 2
elseif settings.startup["FUI_group_button_width"].value == "smallest" then
    data.raw["utility-constants"]["default"].select_group_row_count = (38 * count + 2 * (count - 1) + 26) / 40
    data.raw["gui-style"].default.filter_group_slot_tab.size = { 40, 40 }
    data.raw["gui-style"].default.filter_group_slot_tab.left_padding = 1
    data.raw["gui-style"].default.filter_group_slot_tab.right_padding = 1
    data.raw["gui-style"].default.filter_group_slot_tab.top_padding = 1
    data.raw["gui-style"].default.filter_group_slot_tab.bottom_padding = 1
end