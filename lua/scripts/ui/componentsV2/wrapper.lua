local constants = require "lua.scripts.ui.components.constants"
local widget = require "lua.scripts.widget"

---Wrapper component serves the purpose of wrapping widgets as a container given size
---@param name string
---@param width number
---@param height number
---@param childWidgets invaderWidgetChildWidget[]
---@return string
return function(name, width, height, childWidgets)
    local widgetPath = widget.path .. name .. ".ui_widget_definition"
    ---@type invaderWidget
    local wid = {
        bounds = constants.getScreenBounds(),
        background_bitmap = "insurrection/ui/bitmaps/solid_green.bitmap",
        flags = {pass_unhandled_events_to_focused_child = true},
        child_widgets = childWidgets or {}
    }
    widget.createV2(widgetPath, wid)
    return widgetPath
end
