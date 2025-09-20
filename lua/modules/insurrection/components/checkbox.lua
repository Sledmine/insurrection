local core = require "insurrection.core"
local components = require "insurrection.components"

---@class uiComponentCheckboxClass : uiComponent
local checkbox = setmetatable({
    ---@type string
    type = "checkbox",
    ---@type number
    boxTagId = nil,
    ---@type boolean
    value = false,
    onToggleCallback = nil
}, {__index = components})

---@class uiComponentCheckboxEvents : uiComponentEvents
---@field onToggle fun(value: boolean):boolean | nil

---@class uiComponentCheckbox : uiComponentCheckboxClass
---@field events uiComponentCheckboxEvents

---@param tagId number
---@return uiComponentCheckbox
function checkbox.new(tagId)
    local instance = setmetatable(components.new(tagId), {__index = checkbox}) --[[@as uiComponentCheckbox]]
    local boxTag = instance:findChildWidgetTag("checkbox")
    instance.boxTagId = boxTag.id
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
    return widgetValues.bitmapIndex == 1
end

local function setValue(self, value)
    core.setWidgetValues(self.boxTagId, {bitmapIndex = value and 1 or 0})
end

---@param self uiComponentCheckbox
function checkbox.setValue(self, value)
    assert(type(value) == "boolean", "Value must be a boolean")
    setValue(self, value)
    if self.onToggleCallback then
        self.onToggleCallback(value)
    end
end

---@param self uiComponentCheckbox
function checkbox.toggle(self)
    local value = self:getValue()
    self:setValue(not value)
end

---@param self uiComponentCheckbox
function checkbox.onToggle(self, callback)
    self.onToggleCallback = callback
    self.events.onClick = function()
        local value = self:getValue()
        local isCanceled
        if callback then
           isCanceled = callback(value) == false
        end
        if not isCanceled then
            self:toggle()
        end
        return isCanceled
    end
end

return checkbox
