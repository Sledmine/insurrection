local widget = require "lua.scripts.widget"
local ustr = require "lua.scripts.modules.ustr"
local constants = require "lua.scripts.ui.components.constants"
local image = require "lua.scripts.ui.componentsV2.image"
local floor = math.floor

---@class buttonTableProps
---@field name string
---@field text? string
---@field justification? "left_justify" | "center_justify" | "right_justify"
---@field variant? "header" | "row"
---@field childs? invaderWidgetChildWidget[]

---Generic table button for table usage
---@param props buttonTableProps
---@return string
return function(props)
    local name = props.name
    local text = props.text
    local variant = props.variant or "header"
    local justification = props.justification or "center_justify"

    local widgetPath = widget.path .. "buttons/" .. name .. "table_button.ui_widget_definition"
    ---@type invaderWidget
    local wid = {
        widget_type = "text_box",
        bounds = widget.bounds(0, 0, 19, 104),
        background_bitmap = [[insurrection/ui/bitmaps/browser_upper_button.bitmap]],
        flags = {pass_unhandled_events_to_focused_child = true}
    }

    widget.createV2(widgetPath, wid)
    return widgetPath
end
