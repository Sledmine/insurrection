local constants = require "lua.scripts.ui.components.constants"
local widget = require "lua.scripts.widget"
local image = require "lua.scripts.ui.componentsV2.image"

---Preview component, receives a bitmap and creates a preview of it
---@param props {name: string, bitmap: string}
---@return string
return function(props)
    local name = props.name
    local bitmap = props.bitmap
    local path = widget.path .. name .. "_preview.ui_widget_definition"

    ---@type invaderWidget
    local wid = {
        bounds = widget.scale(533, 300, 0.5),
        background_bitmap = bitmap,
        child_widgets = {
            {
                image(name .. "_preview_overlay_scanner",
                      [[insurrection/ui/bitmaps/description_overlay_small_scanner.bitmap]], 533,
                      300, 0.5)
            },
            {
                image(name .. "_preview_overlay",
                      [[insurrection/ui/bitmaps/description_overlay_small.bitmap]], 267, 150)
            }
        }
    }
    widget.createV2(path, wid)
    return path
end
