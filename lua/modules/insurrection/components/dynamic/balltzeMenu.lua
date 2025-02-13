local components = require "insurrection.components"
local checkbox = require "insurrection.components.checkbox"
local constants = require "insurrection.constants"
local chimera = require "insurrection.mods.chimera"
local interface = require "insurrection.interface"
local blam = require "blam"
local balltze = require "insurrection.mods.balltze"
local menus = require "insurrection.menus"
local spinner = require "insurrection.components.spinner"
local utils = require "insurrection.utils"

-- I don't like this, but I'll keep it for now
local loadingScreenDescription =
    "Select this option to enable the classic Halo: Combat Evolved loading screen before a map it's opened.\r\nWARNING: There is currently a bug where pressing a key in the loading screen might crash the game.\r\nAvoid pressing any key in the meantime."
local preloadMapTexturesDescription =
    "Select this option to preload a map textures before it's opened.\r\nWARNING: It could take a long time on low specs computers."
local gamepadProfileDescription =
    "Select a profile of gamepad buttons to use in the game.\r\nFor example, Balltze will use this to know which buttons to show in the HUD messages."
local reminderDescription = "\r\n\r\nNOTE: You must restart the game to apply changes."

return function()
    local balltzeMod = components.new(constants.widgets.balltze.id)
    local options = components.new(balltzeMod:findChildWidgetTag("options").id)
    local footer = components.new(balltzeMod:findChildWidgetTag("footer").id)
    local description = components.new(footer:findChildWidgetTag("text").id)

    local balltzeConfiguration = balltze.getConfiguration() or {}

    local elements = {}
    local elementsData = {
        ["LOADING SCREEN"] = {
            value = false,
            change = function(value)
                balltzeConfiguration.loading_screen.enable = value
                balltze.saveConfiguration(balltzeConfiguration)
            end,
            focus = function()
                description:setText(loadingScreenDescription .. reminderDescription)
            end
        },
        ["PRELOAD MAP TEXTURES"] = {
            value = false,
            change = function(value)
                balltzeConfiguration.preload_map_textures.enable = value
                balltze.saveConfiguration(balltzeConfiguration)
            end,
            focus = function()
                description:setText(preloadMapTexturesDescription .. reminderDescription)
            end
        },
        ["GAMEPAD PROFILE"] = {
            value = "xbox_360_windows",
            change = function(value)
                balltzeConfiguration.gamepad = value
                balltze.saveConfiguration(balltzeConfiguration)
            end,
            focus = function()
                description:setText(gamepadProfileDescription .. reminderDescription)
            end
        }
    }

    for i = 1, options.widgetDefinition.childWidgetsCount - 1 do
        local childWidget = options.widgetDefinition.childWidgets[i]
        local tag = blam.getTag(childWidget.widgetTag)
        assert(tag)
        if tag.path:includes "checkbox" then
            local check = checkbox.new(childWidget.widgetTag)
            elements[check:getText()] = check
            check:onToggle(function(value)
                local optionName = check:getText()
                if elementsData[optionName] then
                    elementsData[optionName].change(value)
                end
            end)
            check:onFocus(function()
                local optionName = check:getText()
                if elementsData[optionName] then
                    elementsData[optionName].focus()
                end
            end)
        elseif tag.path:includes "spinner" then
            local spin = spinner.new(childWidget.widgetTag)
            console_debug(spin:getText())
            elements[spin:getText()] = spin
            spin:onScroll(function(value, index)
                local optionName = spin:getText()
                if elementsData[optionName] then
                    elementsData[optionName].change(balltze.getGamepadProfiles()[index])
                end
            end)
            spin:onFocus(function()
                local optionName = spin:getText()
                if elementsData[optionName] then
                    elementsData[optionName].focus()
                end
            end)
        end
    end
    balltzeMod:onOpen(function()
        log("balltzeMod:onOpen")
        if not balltze.isInstalled() then
            interface.dialog("ERROR", "Balltze mod is not installed.",
                             "Please install it with Mercury and try again.")
            return
        end
        balltzeConfiguration = balltze.getConfiguration() or {}

        local gamepadProfiles = table.map(balltze.getGamepadProfiles(), function(profile)
            local title = utils.snakeCaseToTitleCase(profile)
            return title
        end)

        elements["GAMEPAD PROFILE"]:setValues(gamepadProfiles)

        elementsData["LOADING SCREEN"].value = balltzeConfiguration.loading_screen.enable
        elementsData["PRELOAD MAP TEXTURES"].value = balltzeConfiguration.preload_map_textures.enable
        elementsData["GAMEPAD PROFILE"].value = utils.snakeCaseToTitleCase(balltzeConfiguration.gamepad)

        for k, component in pairs(elements) do
            local data = elementsData[k]
            if data then
                component:setValue(data.value)
            else
                error("Element from list not found: " .. k)
            end
        end
    end)
end
