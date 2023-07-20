local constants = require "lua.scripts.ui.components.constants"
local widget = require "lua.scripts.widget"

---Wrapper component serves the purpose of wrapping widgets as a container given size
---@param props {name: string, width?: number, height?: number, [1]: invaderWidgetChildWidget[], childs?: invaderWidgetChildWidget[]}
---@return string
return function(props)
    local name = props.name
    local childWidgets = props[1] or props.childs
    local width = props.width or constants.screen.width
    local height = props.height or constants.screen.height
    local path = widget.path .. name .. "_wrapper.ui_widget_definition"

    ---@type invaderWidget
    local wid = {
        bounds = widget.bounds(0, 0, height, width),
        --background_bitmap = "insurrection/ui/bitmaps/solid_green.bitmap",
        flags = {pass_unhandled_events_to_focused_child = true},
        child_widgets = childWidgets or {}
    }

    widget.createV2(path, wid)
    return path
end
