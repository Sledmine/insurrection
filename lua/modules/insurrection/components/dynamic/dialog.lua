local component = require "ui.component"
local constants = require "insurrection.constants"
local button = require "ui.button"

return function()
    local dialog = component.new(constants.widgets.dialog.handle.value)
    local dialogBackButton = button.new(dialog:findChildWidgetTag("ok").handle.value)
    dialogBackButton:onClick(function()
        if dialog.events.onClose then
            dialog.events.onClose()
        end
    end)
    shared.dialog = dialog
end
