local components = require "insurrection.components"
local constants = require "insurrection.constants"
local button = require "insurrection.components.button"

return function()
    local dialog = components.new(constants.widgets.dialog.id)
    local dialogBackButton = button.new(dialog:findChildWidgetTag("ok").id)
    dialogBackButton:onClick(function()
        if dialog.events.onClose then
            dialog.events.onClose()
        end
    end)
    shared.dialog = dialog
end
