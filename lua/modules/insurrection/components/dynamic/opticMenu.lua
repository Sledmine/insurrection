local components = require "insurrection.components"
local checkbox = require "insurrection.components.checkbox"
local constants = require "insurrection.constants"
local chimera = require "insurrection.mods.chimera"
local interface = require "insurrection.interface"
local blam = require "blam"
local optic = require "insurrection.mods.optic"
local menus = require "insurrection.menus"

return function()
    local opticMod = components.new(constants.widgets.optic.id)
    local options = components.new(opticMod:findChildWidgetTag("options").id)
    local checkboxes = {}
    local config = optic.getConfiguration() or {}
    for i = 1, options.widgetDefinition.childWidgetsCount - 3 do
        local childWidget = options.widgetDefinition.childWidgets[i]
        local check = checkbox.new(childWidget.widgetTag)
        checkboxes[check:getText()] = check
        check:onToggle(function(value)
            local optionName = check:getText()
            local optionsToggle = {
                ["ENABLE SOUND"] = function(value)
                    execute_script("optic_test")
                    config.enableSound = value
                    optic.saveConfiguration(config)
                end,
                ["HITMARKER"] = function(value)
                    config.hitmarker = value
                    optic.saveConfiguration(config)
                end,
                ["HUD MESSAGES"] = function(value)
                    config.hudMessages = value
                    optic.saveConfiguration(config)
                end
            }
            if optionsToggle[optionName] then
                optionsToggle[optionName](value)
            end
        end)
    end
    opticMod:onOpen(function()
        log("opticMod:onOpen")
        if not optic.isInstalled() then
            interface.dialog("ERROR", "Optic mod is not installed.",
                             "Please install it with Mercury and try again.")
            return
        end
        config = optic.getConfiguration() or {}
        log(config)
        local optionsMapping = {
            ["ENABLE SOUND"] = config.enableSound,
            ["HITMARKER"] = config.hitmarker,
            ["HUD MESSAGES"] = config.hudMessages
            -- ["VOLUME"] = config.volume,
        }
        for k, check in pairs(checkboxes) do
            check:setValue(optionsMapping[k])
        end
    end)
end
