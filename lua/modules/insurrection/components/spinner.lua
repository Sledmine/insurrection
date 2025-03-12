---@diagnostic disable: inject-field
local blam = require "blam"
local uiWidgetDefinition = blam.uiWidgetDefinition
local unicodeStringList = blam.unicodeStringList
local isNull = blam.isNull
local components = require "insurrection.components"
local button = require "insurrection.components.button"

---@class uiComponentSpinnerClass : uiComponent
local spinner = setmetatable({
    ---@type string
    type = "spinner",
    ---@type string
    value = nil,
    ---@type string[]
    values = {},
    ---@type number
    leftArrowTagId = nil,
    ---@type number
    rightArrowTagId = nil,
    ---@type number
    currentValueIndex = 1
}, {__index = components})

---@class uiComponentSpinnerEvents : uiComponentEvents
---@field onScroll fun(value: string, index: number):boolean | nil

---@class uiComponentSpinner : uiComponentSpinnerClass
---@field events uiComponentSpinnerEvents

---@param tagId number
---@return uiComponentSpinner
function spinner.new(tagId)
    local instance = setmetatable(components.new(tagId), {__index = spinner}) --[[@as uiComponentSpinner]]
    assert(instance.tag.path:find("spinner", 1, true),
           "Tag " .. instance.tag.path .. " is not a spinner")
    instance.leftArrowTagId = instance:findChildWidgetTag("arrow_left").id
    instance.rightArrowTagId = instance:findChildWidgetTag("arrow_right").id
    local leftArrow = button.new(instance.leftArrowTagId)
    leftArrow:onClick(function()
        instance:scroll(-1)
    end)
    local rightArrow = button.new(instance.rightArrowTagId)
    rightArrow:onClick(function()
        instance:scroll(1)
    end)
    return instance
end

---@param self uiComponentSpinner
---@param text string
local function setValueText(self, text)
    local childUnicodeStrings
    local childWidgetDefinition
    local labelTagId = self:findChildWidgetTag("label").id
    local widgetDefinition = uiWidgetDefinition(labelTagId)
    assert(widgetDefinition, "Invalid widgetDefinition")
    local unicodeStrings = unicodeStringList(self.widgetDefinition.unicodeStringListTag)
    if not (unicodeStrings and not isNull(unicodeStrings)) then
        error("No unicodeStringList found for widgetDefinition " .. self.tag.path)
    end
    local stringListIndex = widgetDefinition.stringListIndex
    local newStrings = unicodeStrings.strings
    newStrings[stringListIndex + 1] = text
    unicodeStrings.strings = newStrings
end

---@param self uiComponentSpinner
---@return string
function spinner.getValue(self)
    return self.values[self.currentValueIndex]
end

---@param self uiComponentSpinner
---@return number
function spinner.getValueIndex(self)
    return self.currentValueIndex
end

---@param self uiComponentSpinner
---@param value string
function spinner.setValue(self, value)
    local value = tostring(value)
    local index = table.indexof(self.values, value)
    if index then
        self.currentValueIndex = index
        setValueText(self, value)
        return true
    end
    error("Value " .. value .. " not found in spinner values for " .. self.tag.path)
    return false
end

---@param self uiComponentSpinner
---@param values string[]
function spinner.setValues(self, values)
    self.values = values
    self:setValue(values[1])
    setValueText(self, values[1])
end

---@param self uiComponentSpinner
---@param direction number
function spinner.scroll(self, direction)
    local itemIndex = self.currentValueIndex + direction
    -- TODO Add flag to define if the spinner should loop or not
    if itemIndex < 1 then
        itemIndex = #self.values
    elseif itemIndex > #self.values then
        itemIndex = 1
    end
    self.currentValueIndex = itemIndex
    setValueText(self, self.values[itemIndex])
    if self.events.onScroll then
        self.events.onScroll(self.values[itemIndex], itemIndex)
    end
end

---@param self uiComponentSpinner
---@param callback fun(value: string, index: number):boolean | nil
function spinner.onScroll(self, callback)
    self.events.onScroll = callback
end

return spinner
