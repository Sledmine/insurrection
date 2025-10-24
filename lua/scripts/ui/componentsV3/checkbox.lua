local widget = require "lua.scripts.widget"
local button = require "lua.scripts.ui.componentsV3.button"
local constants = require "lua.scripts.ui.components.constants"

---@class checkboxProps
---@field name string
---@field text? string
---@field align? "left" | "right"
---@field transparent? boolean
---@field variant? "normal" | "large"

---Checkbox component
---@param props checkboxProps
---@return string
return function(props)
    local name = props.name
    local text = props.text
    local variant = props.variant or "normal"
    local align = props.align or "right"
    local transparent = props.transparent
    local standalone = not props.text and transparent == true

    local size = {width = 14, height = 14, scale = 1}

    local widgetPath = widget.path .. name .. "_checkbox.ui_widget_definition"
    ---@type invaderWidget
    local checkbox = {
        widget_type = "container",
        bounds = widget.scale(size.width, size.height, size.scale),
        background_bitmap = "insurrection/ui/bitmaps/checkbox.bitmap"
    }
    widget.createV2(widgetPath, checkbox)
    local posX = constants.components.button[variant].width - 14 - 5

    if align == "right" then
        posX = constants.components.button[variant].width - 14 - 5
    elseif align == "left" then
        posX = 5
    end

    return button {
        name = name .. "_checkbox",
        text = text,
        variant = variant,
        justification = "left_justify",
        transparent = transparent,
        width = standalone and size.width or nil,
        height = standalone and size.height or nil,
        textOffset = align == "left" and 25 or nil,
        childs = {
            {
                widget_tag = widgetPath,
                horizontal_offset = standalone and 0 or posX,
                vertical_offset = standalone and 0 or 5
            }
        }
    }
end
