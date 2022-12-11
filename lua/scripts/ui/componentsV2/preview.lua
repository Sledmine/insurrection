local constants = require "lua.scripts.ui.components.constants"
local widget = require "lua.scripts.widget"
local image = require "lua.scripts.ui.componentsV2.image"

---Box component it only acts as a container of widgets
---@param name string
---@param bitmap string
---@return string
return function(name, bitmap)
    local widgetPath = widget.path .. name .. "_preview.ui_widget_definition"
    ---@type invaderWidget
    local wid = {
        bounds = widget.scale(533, 300, 0.5),
        background_bitmap = bitmap,
        child_widgets = {
            {
                image(name .. "_preview_overlay",
                      [[insurrection/ui/bitmaps/description_overlay_small.bitmap]], 267, 150)
            }
        }
    }
    widget.createV2(widgetPath, wid)
    return widgetPath
end
