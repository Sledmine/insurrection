local constants = require "lua.scripts.ui.components.constants"
local widget = require "lua.scripts.widget"

---Box component it only acts as a container of widgets
---@param name string
---@param childWidgets invaderWidgetChildWidget[]
---@return string
return function(name, childWidgets)
    local widgetPath = widget.path .. name .. ".ui_widget_definition"
    ---@type invaderWidget
    local wid = {bounds = constants.getScreenBounds(), child_widgets = childWidgets or {}}
    widget.createV2(widgetPath, wid)
    return widgetPath
end
