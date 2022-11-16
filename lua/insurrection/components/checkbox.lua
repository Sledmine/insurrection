local core = require "insurrection.core"
local components = require "insurrection.components"

---@class uiComponentCheckboxClass : uiComponentClass
local checkbox = setmetatable({}, {__index = components})

---@class uiComponentCheckboxEvents : uiComponentEvents
---@field onToggle fun(value: boolean):boolean | nil

---@class uiComponentCheckbox : uiComponentCheckboxClass
---@field events uiComponentCheckboxEvents

---@return uiComponentCheckbox
function checkbox.new(tagId)
    local instance = setmetatable(components.new(tagId), {__index = checkbox}) --[[@as uiComponentCheckbox]]
    return instance
end

---@param self uiComponentCheckbox
function checkbox.onToggle(self, callback)
    self.events.onClick = function()
        local checkboxTagId = self:findChildWidgetTag("checkbox").id
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

return checkbox
