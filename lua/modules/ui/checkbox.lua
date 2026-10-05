---@diagnostic disable: duplicate-set-field, duplicate-doc-field
local component = require "ui.component"
local core = require "ui.core"

---@class uiComponentCheckboxClass : uiComponent
local checkbox = setmetatable({
    ---@type string
    type = "checkbox",
    ---@type number
    boxTagId = nil,
    ---@type boolean
    value = false,
    onToggleCallback = nil
}, {__index = component})

---@class uiComponentCheckboxEvents : uiComponentEvents
---@field onToggle fun(value: boolean):boolean | nil

---@class uiComponentCheckbox : uiComponentCheckboxClass
---@field events uiComponentCheckboxEvents

---@param handleValue number
---@return uiComponentCheckbox
function checkbox.new(handleValue)
    local instance = setmetatable(component.new(handleValue), {__index = checkbox}) --[[@as uiComponentCheckbox]]
    local boxTag = instance:findChildWidgetTag("checkbox")
    instance.boxTagId = boxTag and boxTag.handle.value or nil
    assert(boxTag and boxTag.path:find("checkbox", 1, true),
           "Tag " .. instance.tag.path .. " is not a checkbox")
    return instance
end

---@param self uiComponentCheckbox
---@return boolean
function checkbox.getValue(self)
    local widgetValues = core.getWidgetValues(self.boxTagId)
    if not widgetValues then
        return false
    end
    return widgetValues.animationData.currentFrameIndex == 1
end

local function setValue(self, value)
    core.setWidgetValues(self.boxTagId, {animationData = {currentFrameIndex = value and 1 or 0}})
end

---@param self uiComponentCheckbox
function checkbox.setValue(self, value)
    assert(type(value) == "boolean", "Value must be a boolean")
    if self.onToggleCallback then
        if self.onToggleCallback(value) == false then
            -- Event has been cancelled
            return true
        end
    end
    setValue(self, value)
end

---@param self uiComponentCheckbox
function checkbox.toggle(self)
    local value = self:getValue()
    return self:setValue(not value)
end

---@param self uiComponentCheckbox
function checkbox.onToggle(self, callback)
    self.onToggleCallback = callback
    self.events.onClick = function()
        return self:toggle()
    end
end

return checkbox
