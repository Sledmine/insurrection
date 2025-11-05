local components = require "insurrection.components"
local constants = require "insurrection.constants"
local button = require "insurrection.components.button"
local checkbox = require "insurrection.components.checkbox"
local core = require "insurrection.core"
local interface = require "insurrection.interface"
local input = require "insurrection.components.input"
local menus = require "insurrection.menus"

local engine = Engine

return function()
    local main = components.new(constants.widgets.main.id)
    local options = components.new(main:get("options"))

    local oldMultiplayerButton = button.new(options:findChildWidgetTag("multiplayer").id)
    oldMultiplayerButton:onClick(function()
        interface.dialog {
            title = "WARNING",
            subtitle = "YOU ARE ABOUT TO ENTER LEGACY MULTIPLAYER MODE.",
            body = "Legacy multiplayer over Internet lacks features from a modern service such as Insurrection, experience might be outdated or troublesome.\n\nAre you sure you want to proceed?",
            button = "YES, TAKE ME THERE",
            cancel = false,
            onConfirm = function()
                menus.open(constants.widgets.multiplayer.id, false)
                return false
            end
        }
        return false
    end)
end
