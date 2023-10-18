---@diagnostic disable: duplicate-set-field, duplicate-doc-field
local core = require "insurrection.core"
local components = require "insurrection.components"

---@class uiComponentButtonClass : uiComponent
local button = setmetatable({}, {__index = components})

---@class uiComponentButtonEvents : uiComponentEvents
---@field onClick fun(value?: string | boolean | number):boolean | nil

---@class uiComponentButton : uiComponentButtonClass
---@field events uiComponentButtonEvents

---@param tagId number
---@return uiComponentButton
function button.new(tagId)
    local instance = setmetatable(components.new(tagId), {__index = button}) --[[@as uiComponentButton]]
    return instance
end

---@param self uiComponentButton
function button.onClick(self, callback)
    self.events.onClick = callback
end

return button
