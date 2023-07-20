local widget = require "lua.scripts.widget"
local button = require "lua.scripts.ui.componentsV2.button"

---@class checkboxProps
---@field name string
---@field text string
---@field variant "large_button"

---Checkbox component
---@param props checkboxProps
---@return string
return function(props)
    local name = props.name
    local text = props.text

    local widgetPath = widget.path .. name .. "_checkbox.ui_widget_definition"
    ---@type invaderWidget
    local checkbox = {
        widget_type = "text_box",
        bounds = "0, 0, 14, 14",
        flags = {pass_unhandled_events_to_focused_child = true},
        background_bitmap = [[insurrection/ui/bitmaps/checkbox.bitmap]],
        event_handlers = {{event_type = "a_button"}}
    }
    widget.createV2(widgetPath, checkbox)
    -- TODO Add large button variant
    if props.variant == "large_button" then
    end
    return button(name .. "_checkbox", text, {
        childs = {{widget_tag = widgetPath, horizontal_offset = 184 - 14 - 5, vertical_offset = 5}}
    })
end
