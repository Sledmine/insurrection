---@diagnostic disable: inject-field
local isNull = require"blam".isNull
local components = require "insurrection.components"
local button = require "insurrection.components.button"
local core = require "insurrection.core"
local interface = require "insurrection.interface"
local round = math.round

---@class uiComponentListClass : uiComponent
local list = setmetatable({
    ---@type string
    type = "list",
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
    backupChildWidgets = {},
    ---@type boolean
    isScrollable = true,
    ---@type boolean
    isSelectable = false,
    ---@type uiComponentBar
    scrollBar = nil
}, {__index = components})

---@class uiComponentListItem
---@field label? string | fun(uiComponent: uiComponent)
---@field value string | boolean | number | any
---@field bitmap? number | fun(uiComponent: uiComponent)

---@class uiComponentListEvents : uiComponentEvents
---@field onSelect fun(item: uiComponentListItem, button: uiComponentButton)
---@field onScroll fun(item: uiComponentListItem)

---@class uiComponentList : uiComponentListClass
---@field events uiComponentListEvents

---@param tagId number
---@param firstWidgetIndex? number
---@param lastWidgetIndex? number
---@return uiComponentList
function list.new(tagId, firstWidgetIndex, lastWidgetIndex)
    local instance = setmetatable(components.new(tagId), {__index = list}) --[[@as uiComponentList]]
    instance.firstWidgetIndex = firstWidgetIndex or 1
    instance.lastWidgetIndex = lastWidgetIndex or instance.widgetDefinition.childWidgetsCount
    return instance
end

---@param self uiComponentList
---@param callback fun(item: uiComponentListItem, button?: uiComponentButton)
function list.onSelect(self, callback)
    self.events.onSelect = callback
end

---@param self uiComponentList
---@param callback fun(item: uiComponentListItem)
function list.onScroll(self, callback)
    self.events.onScroll = callback
end

---@param self uiComponentList
function list.scroll(self, direction, isFromMouse)
    local itemIndex = self.currentItemIndex + direction
    if itemIndex < 1 then
        if not isFromMouse then
            interface.sound("error")
        end
        itemIndex = 1
    elseif itemIndex > #self.items then
        itemIndex = #self.items
    end

    local lastWidgetIndex = self.lastWidgetIndex
    if self.isScrollable then
        lastWidgetIndex = lastWidgetIndex - 2
    end
    local maximumDisplayableIndex = #self.items - lastWidgetIndex + 1
    if maximumDisplayableIndex < 1 then
        maximumDisplayableIndex = 1
    end
    if itemIndex > maximumDisplayableIndex then
        if not isFromMouse then
            interface.sound("error")
        end
        itemIndex = maximumDisplayableIndex
    end

    self.currentItemIndex = itemIndex
    if self.events.onScroll then
        self.events.onScroll(self.items[itemIndex])
    end
    self:refresh()
end

---@param self uiComponentList
function list.refresh(self)
    local items = self.items
    local itemIndex = self.currentItemIndex
    local widgetDefinition = self.widgetDefinition
    local firstWidgetIndex = self.firstWidgetIndex
    local lastWidgetIndex = self.lastWidgetIndex
    if self.isScrollable then
        firstWidgetIndex = firstWidgetIndex + 1
        lastWidgetIndex = lastWidgetIndex - 1
    end
    if self.scrollBar then
        local scroll = self.scrollBar
        local scrollBackground = scroll.widgetDefinition
        local scrollBar = scroll:findChildWidgetDefinition("bar_value")
        local elementsCount = #items
        local visibleElementsCount = lastWidgetIndex - firstWidgetIndex + 1
        local isHorizontal = self.widgetDefinition.dpadLeftRightTabsThruChildren
        local size = scrollBackground.height
        if isHorizontal then
            size = scrollBackground.width
        end
        barSizePerElement = size / elementsCount
        local isScrollBarVisible = elementsCount > visibleElementsCount
        if isScrollBarVisible then
            local scrollPosition = round((itemIndex - 1) * barSizePerElement)
            if elementsCount > 0 then
                if isHorizontal then
                    scrollBar.width = round(barSizePerElement * visibleElementsCount)
                    scroll:setBarValues{position = {x = scrollPosition}}
                else
                    scrollBar.height = round(barSizePerElement * visibleElementsCount)
                    scroll:setBarValues{position = {y = scrollPosition}}
                end
            end
        else
            if isHorizontal then
                scrollBar.width = scrollBackground.width
                scroll:setBarValues{position = {x = 0}}
            else
                scrollBar.height = scrollBackground.height
                scroll:setBarValues{position = {y = 0}}
            end
        end
    end
    for widgetIndex = firstWidgetIndex, lastWidgetIndex do
        local item = items[itemIndex]
        local childWidget = widgetDefinition.childWidgets[widgetIndex]
        if item then
            core.setWidgetValues(childWidget.widgetTag, {neverReceiveEvents = false, visible = true})
            if childWidget and not isNull(childWidget.widgetTag) then
                local listButton = button.new(childWidget.widgetTag)
                if item.label then
                    if type(item.label) == "function" then
                        item.label(listButton)
                    else
                        listButton:setText(tostring(item.label))
                    end
                end
                local onSelect = self.events.onSelect
                local lastSelectedItemIndex = itemIndex
                listButton:onClick(function()
                    self.lastSelectedItemIndex = lastSelectedItemIndex
                    if onSelect then
                        onSelect(item, listButton)
                    end
                    if self.isSelectable then
                        -- Set button bitmap state to selected index
                        listButton:setWidgetValues{bitmapIndex = 2}
                        for _, childWidget in ipairs(widgetDefinition.childWidgets) do
                            if childWidget.widgetTag ~= listButton.tag.id then
                                local component = components.widgets[childWidget.widgetTag]
                                if component then
                                    -- Restore all other buttons to their default state
                                    component:setWidgetValues{bitmapIndex = 0}
                                end
                            end
                        end
                    end
                end)

                local onFocus = self.events.onFocus
                listButton:onFocus(function()
                    if onFocus then
                        onFocus(item)
                    end
                    if self.isSelectable then

                        local isButtonSelected = listButton:getWidgetValues().bitmapIndex == 2
                        if not isButtonSelected then
                            -- Set button bitmap state to focused index
                            listButton:setWidgetValues{bitmapIndex = 1}
                        end
                        for _, childWidget in ipairs(widgetDefinition.childWidgets) do
                            if childWidget.widgetTag ~= listButton.tag.id then
                                local component = components.widgets[childWidget.widgetTag]
                                if component and component:getWidgetValues().bitmapIndex == 1 then
                                    -- Restore all other buttons to their default state
                                    component:setWidgetValues{bitmapIndex = 0}
                                end
                            end
                        end
                    end
                end)
                if item.bitmap then
                    if type(item.bitmap) == "number" then
                        -- TODO We might need to animate bitmaps when selected by a function
                        listButton:animate()
                        listButton.widgetDefinition.backgroundBitmap = item.bitmap --[[@as number]]
                    elseif type(item.bitmap) == "function" then
                        item.bitmap(listButton)
                    end
                end
                itemIndex = itemIndex + 1
            end
        else
            core.setWidgetValues(childWidget.widgetTag, {neverReceiveEvents = true, visible = false})
        end
    end
end

---@param self uiComponentList
---@param items uiComponentListItem[]
function list.setItems(self, items)
    local widgetDefinition = self.widgetDefinition
    if not widgetDefinition.type == 3 then
        log("Widget: " .. self.tag.path .. " is being used as a list but is not a column_list")
    end
    -- if not (#items > 0) then
    --    error("setItems requires at least one item")
    -- end
    if not self.backupChildWidgets then
        self.backupChildWidgets = table.map(widgetDefinition.childWidgets, function(childWidget)
            return {
                widgetTag = childWidget.widgetTag,
                name = childWidget.name,
                customControllerIndex = childWidget.customControllerIndex,
                verticalOffset = childWidget.verticalOffset,
                horizontalOffset = childWidget.horizontalOffset
            }
        end)
    end
    self.items = items
    -- if self.currentItemIndex > #items then
    --    self.currentItemIndex = 1
    -- end
    for widgetIndex = self.firstWidgetIndex, self.lastWidgetIndex do
        local widgetTagId = widgetDefinition.childWidgets[widgetIndex].widgetTag
        button.new(widgetTagId)
    end
    self.currentItemIndex = 1
    self.lastSelectedItemIndex = nil
    if self.isScrollable then
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
    end
    self:refresh()
end

---@param self uiComponentList
function list.getSelectedItem(self)
    if self:getWidgetValues() then
        return self.items[self.lastSelectedItemIndex]
    end
end

---Set the list to be scrollable or not.
---
---This will take first and last widget index as arrows that will scroll the list.
---@param self uiComponentList
---@param isScrollable boolean
function list.scrollable(self, isScrollable)
    self.isScrollable = isScrollable
end

---Set the list to be selectable or not.
---
---This will allow the list elements to reflect a selected state if bitmap has multiple states.
---@param self uiComponentList
---@param isSelectable boolean
function list.selectable(self, isSelectable)
    self.isSelectable = isSelectable
end

---@param self uiComponentList
function list.getCurrentItem(self)
    return self.items[self.currentItemIndex]
end

---@param self uiComponentList
---@param itemIndex number
function list.setCurrentItemIndex(self, itemIndex)
    self.currentItemIndex = itemIndex
    self:refresh()
end

---@param self uiComponentList
---@param scrollBar uiComponentBar
function list.setScrollBar(self, scrollBar)
    self.scrollBar = scrollBar
end

---@param self uiComponentList
function list.isHorizontal(self)
    return self.widgetDefinition.dpadLeftRightTabsThruChildren
end

return list
