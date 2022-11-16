local components = require "insurrection.components"

---@class uiComponentInputClass : uiComponentClass
local input = setmetatable({}, {__index = components})

---@class uiComponentInputEvents : uiComponentEvents
---@field onInputText fun(text: string) | nil

---@class uiComponentInput : uiComponentInputClass
---@field events uiComponentInputEvents

---@param tagId number
---@return uiComponentInput
function input.new(tagId)
    local instance = setmetatable(components.new(tagId), {__index = input}) --[[@as uiComponentInput]]
    return instance
end

---@param self uiComponentInput
function components.onInputText(self, callback)
    if self.widgetDefinition.type == 1 then
        self.events.onInputText = callback
    else
        error("onInputText can only be used on uiWidgetDefinition of type 1")
    end
end

return input
