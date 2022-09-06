local widget = require "lua.scripts.widget"
local constants = require "lua.scripts.ui.components.constants"
---Options list component, scroll trough elements using dpad, etc
---@param childWidgets invaderWidgetChildWidget
---@param alignment '"vertical"' | '"horizontal"'
---@return string
return function(name, alignment, childWidgets)
    local widgetPath = widget.path .. name .. ".ui_widget_definition"
    local horizontal = alignment == "horizontal"
    ---@type invaderWidget
    local wid = {
        widget_type = "column_list",
        bounds = constants.getScreenBounds(),
        flags = {
            pass_unhandled_events_to_focused_child = true,
            dpad_up_down_tabs_thru_children = not horizontal,
            dpad_left_right_tabs_thru_children = horizontal
        },
        child_widgets = childWidgets or {}
    }
    widget.createV2(widgetPath, wid)
    return widgetPath
end
