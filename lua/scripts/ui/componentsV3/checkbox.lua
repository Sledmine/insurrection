local widget = require "lua.scripts.widget"
local button = require "lua.scripts.ui.componentsV3.button"
local constants = require "lua.scripts.ui.components.constants"

---@class checkboxProps
---@field name string
---@field text string
---@field variant? "large"

---Checkbox component
---@param props checkboxProps
---@return string
return function(props)
    local name = props.name
    local text = props.text
    local variant = props.variant or "normal"

    local widgetPath = widget.path .. name .. "_checkbox.ui_widget_definition"
    ---@type invaderWidget
    local checkbox = {
        widget_type = "text_box",
        bounds = "0, 0, 14, 14",
        flags = {pass_unhandled_events_to_focused_child = true},
        background_bitmap = "insurrection/ui/bitmaps/checkbox.bitmap",
        event_handlers = {{event_type = "a_button"}}
    }
    widget.createV2(widgetPath, checkbox)
    return button {
        name = name .. "_checkbox",
        text = text,
        variant = variant,
        childs = {
            {
                widget_tag = widgetPath,
                horizontal_offset = constants.components.button[variant].width - 14 - 5,
                vertical_offset = 5
            }
        }
    }
    --return button(name .. "_checkbox", text, {
    --    variant = variant,
    --    childs = {
    --        {
    --            widget_tag = widgetPath,
    --            horizontal_offset = constants.components.button[variant].width - 14 - 5,
    --            vertical_offset = 5
    --        }
    --    }
    --})
end
