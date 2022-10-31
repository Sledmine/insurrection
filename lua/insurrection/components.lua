local blam = require "blam"

local components = {}

components.widgets = {}

function components.new(self, tagId)
    self = self or {}
    self.tagId = tagId
    self.selectedWidgetTagId = nil
    self.widgetDefinition = blam.uiWidgetDefinition(tagId)
    components.widgets[tagId] = self
    return self
end

function components.onClick(self, callback)
    self.onClick = callback
end

function components.onFocus(self, callback)
    self.onFocus = callback
end

function components.onInputText(self, callback)
    ---@type uiWidgetDefinition
    local widgetDefinition = self.widgetDefinition
    if widgetDefinition.type == 1 then
        self.onInputText = callback
    else
        error("Widget is not a text widget")
    end
end

function components.onSelect(self, callback)
    ---@type uiWidgetDefinition
    local widgetDefinition = self.widgetDefinition
    if widgetDefinition.type == 2 then
        self.onSelect = callback
    else
        error("Widget is not a list widget")
    end
end

return components