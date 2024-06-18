local widget = require "lua.scripts.widget"
local floor = math.floor

---@class imageProps
---@field name string Name of the image component
---@field image string Image to display
---@field width number Width of the image component
---@field height number Height of the image component
---@field scale? number Scale of the image component

---Image component, displays bitmap image
---@param props imageProps
---@return string
return function(props)
    local name = props.name
    local image = props.image
    local scale = props.scale or 1
    local originalWidth = props.width
    local originalHeight = props.height
    local width = floor(props.width * scale)
    local height = floor(props.height * scale)
    local top = -(floor(originalHeight - height))
    local left = -(floor(originalWidth - width))
    if scale >= 1 then
        top = 0
        left = 0
    end
    local widgetPath = widget.path .. name .. "_image.ui_widget_definition"
    ---@type invaderWidget
    local wid = {
        widget_type = "container",
        bounds = top .. ", " .. left .. ", " .. height .. ", " .. width,
        background_bitmap = image
    }
    widget.createV2(widgetPath, wid)
    return widgetPath
end
