local blam = require "blam"
local getTag = blam.getTag
local uiWidgetDefinition = blam.uiWidgetDefinition
local unicodeStringList = blam.unicodeStringList
local isNull = blam.isNull
local glue = require "glue"
local core = require "insurrection.core"

---@class uiComponentClass
local components = {}

---@class uiComponentEvents
---@field onClick fun(value?: string | boolean | number):boolean | nil
---@field onFocus function | nil
---@field onInputText fun(text: string) | nil
---@field onSelect function | nil
---@field onOpen function | nil
---@field onClose function | nil
---@field animate function | nil

---@class uiComponent : uiComponentClass
---@field tagId number
---@field tag tag
---@field selectedWidgetTagId number | nil
---@field widgetDefinition uiWidgetDefinition
---@field events uiComponentEvents
---@field isBackgroundAnimated boolean

---@type table<number, uiComponent>
components.widgets = {}

---@param tagId number
---@return uiComponent
function components.new(tagId)
    local instance = setmetatable({}, {__index = components}) --[[@as uiComponent]]
    instance.tagId = tagId
    instance.tag = getTag(instance.tagId) or error("Invalid tagId") --[[@as tag]]
    instance.selectedWidgetTagId = nil
    instance.widgetDefinition = uiWidgetDefinition(tagId) or error("Invalid tagId") --[[@as uiWidgetDefinition]]
    instance.events = {}
    instance.isBackgroundAnimated = false
    dprint("Created component: " .. instance.tag.path, "info")
    components.widgets[tagId] = instance
    return instance
end

---@param self uiComponent
function components.onClick(self, callback)
    self.events.onClick = callback
    if self.tag.path:find("_checkbox_button", 1, true) then
        local checkboxTagId = self:findChildWidgetTag("checkbox").id
        self.events.onClick = function()
            local bitmapIndex = core.getWidgetValues(checkboxTagId).background_bitmap_index
            if bitmapIndex == 0 then
                core.setWidgetValues(checkboxTagId, {background_bitmap_index = 1})
            else
                core.setWidgetValues(checkboxTagId, {background_bitmap_index = 0})
            end
            if bitmapIndex == 0 then
                callback(true)
            else
                callback(false)
            end
        end
    end
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
    local virtualValue = VirtualInputValue[self.tagId]
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
---@param mask? string
function components.setText(self, text, mask)
    local unicodeStrings = unicodeStringList(self.widgetDefinition.unicodeStringListTag)
    if unicodeStrings then
        if isNull(unicodeStrings) then
            error("No unicodeStringList, can't assign text to this widget")
        end
        local stringListIndex = self.widgetDefinition.stringListIndex
        local newStrings = unicodeStrings.stringList
        if mask then
            VirtualInputValue[self.tagId] = text
            newStrings[stringListIndex + 1] = string.rep(mask, #text)
        else
            newStrings[stringListIndex + 1] = text
        end
        unicodeStrings.stringList = newStrings
    end
end

---@param self uiComponent
function components.onOpen(self, callback)
    self.events.onOpen = callback
end

---@param self uiComponent
function components.onClose(self, callback)
    self.events.onClose = callback
end

--[[
    -- Fake menu scrolling
    if lastOpenWidgetTag and
        (lastOpenWidgetTag.id == interface.widgets.lobbyWidgetTag.id or lastOpenWidgetTag.id ==
            interface.widgets.customizationWidgetTag.id) then
        local scroll = tonumber(read_char(0x64C73C + 8))
        if scroll > 0 then
            store:dispatch(actions.scroll(false))
        elseif scroll < 0 then
            store:dispatch(actions.scroll(true))
        end
    end
]]

---@param self uiComponent
function components.animate(self)
    self.isBackgroundAnimated = true
end

function components.free()
    components.widgets = {}
end

---@param self uiComponent
---@return tag[]
function components.getChildWidgetTags(self)
    return glue.map(self.widgetDefinition.childWidgets, function(childWidget)
        if not isNull(childWidget.widgetTag) then
            local tag = getTag(childWidget.widgetTag)
            return tag
        end
    end)
end

---@param self uiComponent
function components.findChildWidgetTag(self, name)
    local childWidgetTags = self:getChildWidgetTags()
    for _, childTag in pairs(childWidgetTags) do
        if childTag.path:find(name, 1, true) then
            return childTag
        end
        local widgetDefinition = uiWidgetDefinition(childTag.id)
        if widgetDefinition then
            for _, childWidget in pairs(widgetDefinition.childWidgets) do
                local tag = getTag(childWidget.widgetTag) --[[@as tag]]
                if not isNull(childWidget.widgetTag) then
                    if tag.path:find(name, 1, true) then
                        return tag
                    end
                end
            end
        end
    end
end

return components
