local blam = require "blam"
local components = require "insurrection.components"
local button = require "insurrection.components.button"

---@class uiComponentListClass : uiComponentClass
local list = setmetatable({
    ---@type number
    firstWidgetIndex = nil,
    ---@type number
    lastWidgetIndex = nil,
    ---@type number
    currentItemIndex = 1,
    ---@type {label: string, value: string | boolean | number, bitmap?: number}[]
    items = {}
}, {__index = components})

---@class uiComponentListEvents : uiComponentEvents
---@field onSelect fun(value: string | boolean | number):boolean | nil

---@class uiComponentList : uiComponentListClass
---@field events uiComponentListEvents

---@param tagId number
---@return uiComponentList
function list.new(tagId, firstWidgetIndex, lastWidgetIndex)
    local instance = setmetatable(components.new(tagId), {__index = list}) --[[@as uiComponentList]]
    instance.firstWidgetIndex = firstWidgetIndex
    instance.lastWidgetIndex = lastWidgetIndex
    return instance
end

---@param self uiComponentList
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
    for i = self.firstWidgetIndex + 1, self.lastWidgetIndex - 1 do
        local item = items[itemIndex]
        if item then
            local childWidget = widgetDefinition.childWidgets[i]
            if childWidget and not blam.isNull(childWidget.widgetTag) then
                local listButton = button.new(childWidget.widgetTag)
                listButton:setText(item.label)
                listButton:animate()
                if self.events.onSelect then
                    listButton:onClick(function()
                        self.events.onSelect(item.value)
                    end)
                end
                if item.bitmap then
                    listButton.widgetDefinition.backgroundBitmap = item.bitmap
                end
            end
            itemIndex = itemIndex + 1
        end
    end
end

---@param self uiComponentList
---@param items {label: string, value: string | boolean | number, bitmap?: number}[]
function list.setItems(self, items)
    local widgetDefinition = self.widgetDefinition
    if not widgetDefinition.type == 3 then
        error("setItems can only be used on uiWidgetDefinition of type column_list")
    end
    if not (#items > 0) then
        error("setItems requires at least one item")
    end
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

return list
