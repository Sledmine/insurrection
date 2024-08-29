---@diagnostic disable: duplicate-set-field, duplicate-doc-field, inject-field
local core       = require "insurrection.core"
local components = require "insurrection.components"

---@class uiComponentBar : uiComponent
local bar = setmetatable({
    ---@type string
    type = "bar",
    ---@type "progress" | "scroll"
    barType = "progress",
    ---@type "horizontal" | "vertical"
    orientation = "horizontal",
}, {__index = components})

---@param tagId number
---@param barType? "progress" | "scroll"
---@return uiComponentBar
function bar.new(tagId, barType)
    local instance = setmetatable(components.new(tagId), {__index = bar}) --[[@as uiComponentBar]]
    instance.barType = barType or "scroll"
    instance.orientation = instance.widgetDefinition.width > instance.widgetDefinition.height and "horizontal" or "vertical"
    return instance
end

---@param self uiComponentBar
---@param values uiWidgetValues
function bar.setBarValues(self, values)
    core.setWidgetValues(self:findChildWidgetTag("bar_value").id, values)
end

return bar
