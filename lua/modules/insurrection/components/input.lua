local button = require "insurrection.components.button"
local core = require "insurrection.core"

---@class uiComponentInputClass : uiComponentButton
local input = setmetatable({type = "input", hasPlaceholder = false, allowEmptyChars = true}, {__index = button})

---@class uiComponentInputEvents : uiComponentEvents
---@field onInputText fun(text: string) | nil

---@class uiComponentInput : uiComponentInputClass
---@field events uiComponentInputEvents

local function handlePlaceHolder(self)
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
end

---@param tagHandle number
---@return uiComponentInput
function input.new(tagHandle)
    local instance = setmetatable(button.new(tagHandle), {__index = input}) --[[@as uiComponentInput]]
    instance.hasPlaceholder = instance:findChildWidgetTag("placeholder") ~= nil
    instance:onOpen(function()
        handlePlaceHolder(instance)
        --if instance.events.onInputText then
        --    local text = instance:getText()
        --    if text and text ~= "" then
        --        logger:debug("Calling onInputText for existing text onOpen: {}", text)
        --        instance.events.onInputText(text)
        --    end
        --end
    end)
    return instance
end

---@param self uiComponentInput
function input.onInputText(self, callback)
    if self.widgetDefinition.type == 1 then
        self.events.onInputText = function(text)
            handlePlaceHolder(self)
            if callback then
                callback(text)
            end
        end
    else
        error("onInputText can only be used on uiWidgetDefinition of type 1")
    end
end

---@param self uiComponentInput
---@param text string
---@param mask? string
function input.setText(self, text, mask)
    button.setText(self, text, mask)
    handlePlaceHolder(self)
end

---@param self uiComponentInput
---@param allow boolean
function input.setAllowEmptyCharacters(self, allow)
    self.allowEmptyChars = allow == true
end

return input
