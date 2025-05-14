local button = require "insurrection.components.button"
local core = require "insurrection.core"

---@class uiComponentInputClass : uiComponentButton
local input = setmetatable({type = "input", hasPlaceholder = false}, {__index = button})

---@class uiComponentInputEvents : uiComponentEvents
---@field onInputText fun(text: string) | nil

---@class uiComponentInput : uiComponentInputClass
---@field events uiComponentInputEvents

---@param tagId number
---@return uiComponentInput
function input.new(tagId)
    local instance = setmetatable(button.new(tagId), {__index = input}) --[[@as uiComponentInput]]
    instance.hasPlaceholder = instance:findChildWidgetTag("placeholder") ~= nil
    instance:onOpen(function()
        if instance.hasPlaceholder then
            local placeholder = instance:findChildWidgetTag("placeholder")
            if placeholder then
                -- TODO Ensure set widget values waits until widget is rendered
                -- We might need to port the sleep until implementation from Coop Evolved
                -- But ensuring it works for all widgets being rendered not just container parent
                -- ones, do not forget to add a maximum tick count to prevent stuck sleeps
                core.setWidgetValues(placeholder.id, {opacity = 0})
            end
        end
    end)
    return instance
end

---@param self uiComponentInput
function input.onInputText(self, callback)
    if self.widgetDefinition.type == 1 then
        self.events.onInputText = function(text)
            if self.hasPlaceholder then
                local placeholder = self:findChildWidgetTag("placeholder")
                if placeholder then
                    local text = self:getText()
                    local opacity = 0
                    if text and text == "" then
                        opacity = 1
                    end
                    core.setWidgetValues(placeholder.id, {opacity = opacity})
                end
            end
            if callback then
                callback(text)
            end
        end
    else
        error("onInputText can only be used on uiWidgetDefinition of type 1")
    end
end

return input
