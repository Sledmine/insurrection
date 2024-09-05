local constants = require "lua.scripts.ui.components.constants"
local widget = require "lua.scripts.widget"
local image = require "lua.scripts.ui.componentsV2.image"

---@class previewProps
---@field name string
---@field bitmap string
---@field variant? "small" | "normal"

---Preview component, receives a bitmap and creates a preview of it
---@param props previewProps
---@return string
return function(props)
    local name = props.name
    local bitmap = props.bitmap
    local variant = props.variant or "normal"
    local path = widget.path .. name .. "_preview.ui_widget_definition"
    local size = {
        width = 533,
        height = 300,
        scale = 0.5
    }

    local scannerSize = {
        width = 533,
        height = 300,
        scale = 0.5
    }

    local overlaySize = {
        width = 267,
        height = 150,
        scale = 0.5
    }

    if variant == "small" then
        size.scale = 0.375
        scannerSize.scale = 0.375
        overlaySize.scale = 0.75
    end

    ---@type invaderWidget
    local wid = {
        bounds = widget.scale(size.width, size.height, size.scale),
        background_bitmap = bitmap,
        child_widgets = {
            {
                image(name .. "_preview_overlay_scanner",
                      [[insurrection/ui/bitmaps/description_overlay_small_scanner.bitmap]], scannerSize.width,
                      scannerSize.height, scannerSize.scale)
            },
            {
                image(name .. "_preview_overlay",
                      [[insurrection/ui/bitmaps/description_overlay_small.bitmap]], overlaySize.width, overlaySize.height, overlaySize.scale)
            }
        }
    }

    widget.createV2(path, wid)
    return path
end
