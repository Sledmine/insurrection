local component = require "ui.component"
local checkbox = require "ui.checkbox"
local constants = require "insurrection.constants"
local chimera = require "insurrection.mods.chimera"
local interface = require "insurrection.interface"
local blam = require "blam"
local optic = require "insurrection.mods.optic"
local menus = require "insurrection.menus"

return function()
    local opticMod = component.new(constants.widgets.optic.handle.value)
    local options = component.new(opticMod:findChildWidgetTag("options").handle.value)
    local checkboxes = {}
    local config = optic.getConfiguration() or {}
    for i = 1, #options.widgetDefinition.childWidgets - 3 do
        local childWidget = options.widgetDefinition.childWidgets[i]
        local check = checkbox.new(childWidget.widgetTag.tagHandle.value)
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
        logger.debug("opticMod:onOpen")
        if not optic.isInstalled() then
            interface.dialog("ERROR", "Optic mod is not installed.",
                             "Please install it with Mercury and try again.")
            return
        end
        config = optic.getConfiguration() or {}
        logger.debug("{}", inspect(config))
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
