local widget = require "lua.scripts.widget"
local constants = require "lua.scripts.ui.components.constants"

---@class barProps
---@field name string
---@field orientation "horizontal" | "vertical
---@field type "scroll" | "progress"
---@field size number

---Bar component
---@param props barProps
---@return string
return function(props)
    local name = props.name
    local orientation = props.orientation or "horizontal"
    local size = props.size or 100
    local type = props.type or "progress"

    local widgetValuePath = widget.path .. name .. "_bar_value.ui_widget_definition"
    ---@type invaderWidget
    local value = {
        widget_type = "container",
        bounds = widget.bounds(0, 0, 3, size),
        background_bitmap = [[insurrection/ui/bitmaps/solid_cobalt.bitmap]],
    }
    if orientation == "vertical" then
        value.bounds = widget.bounds(0, 0, size, 3)
    end
    widget.createV2(widgetValuePath, value)

    local widgetPath = widget.path .. name .. "_bar.ui_widget_definition"
    ---@type invaderWidget
    local bar = {
        widget_type = "container",
        bounds = widget.bounds(0, 0, type == "scroll" and 1 or 3, size),
        background_bitmap = widget.color(constants.color.palette.contrast),
        child_widgets = {
            {
                widget_tag = widgetValuePath,
                vertical_offset = 0,
                horizontal_offset = 0,
            }
        }
    }
    if type == "scroll" then
        bar.child_widgets[1].vertical_offset = orientation == "horizontal" and -1 or 0
        bar.child_widgets[1].horizontal_offset = orientation == "vertical" and -1 or 0
    end
    if orientation == "vertical" then
        bar.bounds = widget.bounds(0, 0, size, type == "scroll" and 1 or 3)
    end
    widget.createV2(widgetPath, bar)
    return widgetPath
end
