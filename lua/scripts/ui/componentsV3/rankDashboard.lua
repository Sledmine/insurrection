local constants = require "lua.scripts.ui.components.constants"
local widget = require "lua.scripts.widget"
local image = require "lua.scripts.ui.componentsV2.image"

---@class rankDashboardProps
---@field name string
---@field bitmap? string
---@field variant? "small" | "normal"

---Preview component, receives a bitmap and creates a preview of it
---@param props rankDashboardProps
---@return string
return function(props)
    local name = props.name
    local bitmap = props.bitmap
    local variant = props.variant or "normal"
    local path = widget.path .. name .. "_rank_dashboard.ui_widget_definition"

    local rankIconSize = {
        width = 200,
        height = 280,
        scale = 0.24
    }

    local overlaySize = {
        width = 50,
        height = 78,
        scale = 1
    }

    ---@type invaderWidget
    local wid = {
        bounds = widget.scale(overlaySize.width, overlaySize.height, overlaySize.scale),
        background_bitmap = bitmap,
        child_widgets = {
            {
                image(name .. "_rank_icon",
                      [[insurrection/ui/bitmaps/rank_dummy.bitmap]], rankIconSize.width,
                      rankIconSize.height, rankIconSize.scale)
            }
        }
    }

    widget.createV2(path, wid)
    return path
end
