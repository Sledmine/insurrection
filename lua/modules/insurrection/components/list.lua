return require "ui.list"
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
        logger.debug("Widget: " .. self.tag.path .. " is being used as a list but is not a column_list")
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
---@param self uiComponentList
function list.clearSelectedItem(self)
    self.lastSelectedItemIndex = nil
    if self.isSelectable then
        for _, childWidget in ipairs(self.widgetDefinition.childWidgets) do
            local component = component.widgets[childWidget.widgetTag]
            if component then
                -- Restore all buttons to their default state
                component:setWidgetValues{bitmapIndex = 0}
            end
        end
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
---@return number itemIndex
function list.getCurrentItemIndex(self)
    return self.currentItemIndex
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
