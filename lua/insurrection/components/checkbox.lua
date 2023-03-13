local core = require "insurrection.core"
local components = require "insurrection.components"

---@class uiComponentCheckboxClass : uiComponent
local checkbox = setmetatable({
    ---@type number
    checkboxTagId = nil
}, {__index = components})

---@class uiComponentCheckboxEvents : uiComponentEvents
---@field onToggle fun(value: boolean):boolean | nil

---@class uiComponentCheckbox : uiComponentCheckboxClass
---@field events uiComponentCheckboxEvents

---@return uiComponentCheckbox
function checkbox.new(tagId)
    local instance = setmetatable(components.new(tagId), {__index = checkbox}) --[[@as uiComponentCheckbox]]
    assert(instance.tag.path:find("checkbox", 1, true),
           "Tag " .. instance.tag.path .. " is not a checkbox")
    instance.checkboxTagId = instance:findChildWidgetTag("checkbox").id
    return instance
end

---@param self uiComponentCheckbox
---@return boolean
function checkbox.getValue(self)
    local widgetValues = core.getWidgetValues(self.checkboxTagId)
    assert(widgetValues, "Checkbox " .. self.tag.path .. " does not exist in DOM tree")
    return widgetValues.background_bitmap_index == 1
end

function checkbox.setValue(self, value)
    local value = value and 1 or 0
    core.setWidgetValues(self.checkboxTagId, {background_bitmap_index = value})
end

function checkbox.toggle(self)
    local value = self:getValue()
    self:setValue(not value)
end

---@param self uiComponentCheckbox
function checkbox.onToggle(self, callback)
    self.events.onClick = function()
        local value = self:getValue()
        if value then
            self:toggle()
            callback(false)
        else
            self:toggle()
            callback(true)
        end
    end
end

return checkbox
