local widget = require "lua.scripts.widget"
local ustr = require "lua.scripts.modules.ustr"
local constants = require "lua.scripts.ui.components.constants"
local image = require "lua.scripts.ui.componentsV2.image"
local floor = math.floor

---@class rankDashboardProps
---@field name string
---@field text? string
---@field justification? "left_justify" | "center_justify" | "right_justify"
---@field variant "overlay" | "icon"
---@field childs? invaderWidgetChildWidget[]

---Generic rank dashboard for info
---@param props rankDashboardProps
---@return string
return function(props)
    local name = props.name
    local variant = props.variant or "overlay"
    local widgetPath = widget.path .. "buttons/" .. name .. "_rank_dashboard.ui_widget_definition"

    local rankIconSize = {
        width = 200,
        height = 280,
        scale = 0.24
    }

    ---@type invaderWidget
    local wid = {
        bounds = widget.bounds(0, 0, 78, 58),
        background_bitmap = [[insurrection/ui/bitmaps/rank_overlay.bitmap]],
    }

    if variant == "icon" then
        wid.background_bitmap = [[insurrection/ui/bitmaps/rank_dummy.bitmap]]
        wid.bounds = widget.scale(rankIconSize.width, rankIconSize.height, rankIconSize.scale)
    end

    widget.createV2(widgetPath, wid)
    return widgetPath
end
