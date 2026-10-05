local component = require "ui.component"
local constants = require "insurrection.constants"
local button = require "ui.button"
local checkbox = require "ui.checkbox"
local core = require "insurrection.core"
local interface = require "insurrection.interface"
local input = require "ui.input"
local menus = require "insurrection.menus"

local engine = Engine

return function()
    local main = component.new(constants.widgets.main.handle.value)
    local options = component.new(main:get("options"))

    local oldMultiplayerButton = button.new(options:findChildWidgetTag("multiplayer").handle.value)
    oldMultiplayerButton:onClick(function()
        interface.dialog {
            title = "WARNING",
            subtitle = "YOU ARE ABOUT TO ENTER LEGACY MULTIPLAYER MODE.",
            body = "Legacy multiplayer over Internet lacks features from a modern service such as Insurrection, experience might be outdated or troublesome.\n\nAre you sure you want to proceed?",
            button = "YES, TAKE ME THERE",
            cancel = false,
            onConfirm = function()
                menus.open(constants.widgets.multiplayer.handle.value, false)
                return false
            end
        }
        return false
    end)
end
