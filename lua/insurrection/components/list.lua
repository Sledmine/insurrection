local isNull = require"blam".isNull
local components = require "insurrection.components"
local button = require "insurrection.components.button"
local core = require "insurrection.core"
local glue = require "glue"

---@class uiComponentListClass : uiComponentClass
local list = setmetatable({
    ---@type number
    firstWidgetIndex = nil,
    ---@type number
    lastWidgetIndex = nil,
    ---@type number
    currentItemIndex = 1,
    ---@type number
    lastSelectedItemIndex = nil,
    ---@type uiComponentListItem[]
    items = {},
    ---@type uiWidgetDefinitionChild[]
    backupChildWidgets = {}
}, {__index = components})

---@class uiComponentListItem 
---@field label string
---@field value string | boolean | number | any
---@field bitmap?number

---@class uiComponentListEvents : uiComponentEvents
---@field onSelect fun(item: uiComponentListItem)

---@class uiComponentList : uiComponentListClass
---@field events uiComponentListEvents

---@param tagId number
---@return uiComponentList
function list.new(tagId, firstWidgetIndex, lastWidgetIndex)
    local instance = setmetatable(components.new(tagId), {__index = list}) --[[@as uiComponentList]]
    instance.firstWidgetIndex = firstWidgetIndex or 1
    instance.lastWidgetIndex = lastWidgetIndex or instance.widgetDefinition.childWidgetsCount
    return instance
end

---@param self uiComponentList
---@param callback fun(item: uiComponentListItem)
function list.onSelect(self, callback)
    self.events.onSelect = callback
end

---@param self uiComponentList
function list.scroll(self, direction)
    local itemIndex = self.currentItemIndex + direction
    if itemIndex < 1 then
        itemIndex = 1
    elseif itemIndex > #self.items then
        itemIndex = #self.items
    end
    dprint("Scrolling list to item " .. itemIndex)
    self.currentItemIndex = itemIndex
    self:refresh()
end

---@param self uiComponentList
function list.refresh(self)
    local items = self.items
    local itemIndex = self.currentItemIndex
    local widgetDefinition = self.widgetDefinition
    for widgetIndex = (self.firstWidgetIndex + 1), (self.lastWidgetIndex - 1) do
        local item = items[itemIndex]
        local childWidget = widgetDefinition.childWidgets[widgetIndex]
        if item then
            core.setWidgetValues(childWidget.widgetTag, {opacity = 1})
            if childWidget and not isNull(childWidget.widgetTag) then
                local listButton = button.new(childWidget.widgetTag)
                listButton:setText(item.label)
                local onSelect = self.events.onSelect
                if onSelect then
                    local lastSelectedItemIndex = itemIndex
                    listButton:onClick(function()
                        self.lastSelectedItemIndex = lastSelectedItemIndex
                        onSelect(item)
                    end)
                end
                if item.bitmap then
                    listButton:animate()
                    listButton.widgetDefinition.backgroundBitmap = item.bitmap
                end
                itemIndex = itemIndex + 1
            end
        else
            core.setWidgetValues(childWidget.widgetTag, {opacity = 0})
        end
    end
end

---@param self uiComponentList
---@param items uiComponentListItem[]
function list.setItems(self, items)
    local widgetDefinition = self.widgetDefinition
    if not widgetDefinition.type == 3 then
        error("setItems can only be used on uiWidgetDefinition of type column_list")
    end
    if not (#items > 0) then
        error("setItems requires at least one item")
    end
    if not self.backupChildWidgets then
        self.backupChildWidgets = glue.map(widgetDefinition.childWidgets, function(childWidget)
            return {
                widgetTag = childWidget.widgetTag,
                name = childWidget.name,
                customControllerIndex = childWidget.customControllerIndex,
                verticalOffset = childWidget.verticalOffset,
                horizontalOffset = childWidget.horizontalOffset
            }
        end)
    end
    self.currentItemIndex = 1
    self.items = items
    local firstWidgetTagId = widgetDefinition.childWidgets[self.firstWidgetIndex].widgetTag
    local lastWidgetTagId = widgetDefinition.childWidgets[self.lastWidgetIndex].widgetTag
    local firstWidget = button.new(firstWidgetTagId)
    local lastWidget = button.new(lastWidgetTagId)
    firstWidget:onClick(function()
        self:scroll(-1)
    end)
    lastWidget:onClick(function()
        self:scroll(1)
    end)
    self:refresh()
end

---@param self uiComponentList
function list.getSelectedItem(self)
    dprint(self.lastSelectedItemIndex)
    return self.items[self.lastSelectedItemIndex]
end

return list
