local blam = require "blam"
local unicodeStringList = blam.unicodeStringList
local isNull = blam.isNull

local components = {}

---@type table<number, uiComponent>
components.widgets = {}

---@class uiComponent
---@field tagId number
---@field tag tag
---@field selectedWidgetTagId number | nil
---@field widgetDefinition uiWidgetDefinition
---@field events uiComponentEvents
---@field onClick function | nil
---@field onFocus function | nil
---@field onInputText function | nil
---@field onSelect function | nil
---@field getText function | nil
---@field setText function | nil

---@class uiComponentEvents
---@field onClick function | nil
---@field onFocus function | nil
---@field onInputText function | nil
---@field onSelect function | nil

---@param self uiComponent
---@return uiComponent
function components.new(self, tagId)
    self = self or {}
    self.tagId = tagId
    self.tag = blam.getTag(tagId) or error("Invalid tagId") --[[@as tag]]
    self.selectedWidgetTagId = nil
    self.widgetDefinition = blam.uiWidgetDefinition(tagId) or error("Invalid tagId") --[[@as uiWidgetDefinition]]
    self.events = {}
    components.widgets[tagId] = self
    return self
end

---@param self uiComponent
function components.onClick(self, callback)
    self.events.onClick = callback
end

---@param self uiComponent
function components.onFocus(self, callback)
    self.events.onFocus = callback
end

---@param self uiComponent
function components.onInputText(self, callback)
    if self.widgetDefinition.type == 1 then
        self.events.onInputText = callback
    else
        error("onInputText can only be used on uiWidgetDefinition of type 1")
    end
end

---@param self uiComponent
function components.onSelect(self, callback)
    ---@type uiWidgetDefinition
    local widgetDefinition = self.widgetDefinition
    if widgetDefinition.type == 2 then
        self.events.onSelect = callback
    else
        error("onSelect can only be used on uiWidgetDefinition of type 2")
    end
end

---@param self uiComponent
---@return string
function components.getText(self)
    local virtualValue = VirtualInputValue[self.widgetDefinition.name]
    if virtualValue then
        return virtualValue
    end
    local unicodeStrings = blam.unicodeStringList(self.widgetDefinition.unicodeStringListTag)
    if unicodeStrings then
        return unicodeStrings.stringList[self.widgetDefinition.stringListIndex + 1]
    end
    error("No unicodeStringList found for widgetDefinition")
end

---@param self uiComponent
---@param text string
function components.setText(self, text, mask)
    local unicodeStrings = unicodeStringList(self.widgetDefinition.unicodeStringListTag)
    if isNull(unicodeStrings) then
        error("No unicodeStringList found for widgetDefinition, can't assign text to this widget")
    end
    if mask then
        VirtualInputValue[widgetDefinition.name] = text
        unicodeStrings.stringList = {string.rep(mask, #text)}
    else
        unicodeStrings.stringList = {text}
    end
end

return components
