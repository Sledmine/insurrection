---@diagnostic disable: duplicate-set-field, duplicate-doc-field, inject-field
local core = require "insurrection.core"
local components = require "insurrection.components"
local round = math.round

---@class uiComponentBar : uiComponent
local bar = setmetatable({
    ---@type string
    type = "bar",
    ---@type "progress" | "scroll"
    barType = "progress",
    ---@type "horizontal" | "vertical"
    orientation = "horizontal"
}, {__index = components})

---@param tagId number
---@param barType? "progress" | "scroll"
---@return uiComponentBar
function bar.new(tagId, barType)
    local instance = setmetatable(components.new(tagId), {__index = bar}) --[[@as uiComponentBar]]
    instance.barType = barType or "scroll"
    instance.orientation = instance.widgetDefinition.width > instance.widgetDefinition.height and
                               "horizontal" or "vertical"
    return instance
end

---@param self uiComponentBar
---@param values table
function bar.setBarValues(self, values)
    core.setWidgetValues(self:findChildWidgetTag("bar_value").id, values)
end

--- Set the value of the bar component.
--- 
--- The value is a number between 0 and 1.
---@param self uiComponentBar
---@param value number
function bar.setValue(self, value)
    local isHorizontal = self.orientation == "horizontal"
    local barPosition = round(value * (isHorizontal and self.widgetDefinition.width or self.widgetDefinition.height))
    logger:warning("Bar position: " .. barPosition)
    local barValueDefinition = self:findChildWidgetDefinition("bar_value")
    if isHorizontal then
        barValueDefinition.width = barPosition
    else
        barValueDefinition.height = barPosition
    end
end

return bar
