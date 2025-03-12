local components = require "insurrection.components"
local constants = require "insurrection.constants"
local spinner = require "insurrection.components.spinner"
local checkbox = require "insurrection.components.checkbox"
local blam = require "blam"
local core = require "insurrection.core"
local luna = require "luna"
local button = require "insurrection.components.button"
local tobit = luna.bit
local tobool = luna.bool
local engine = Engine
local playSound = engine.userInterface.playSound

return function()
    local settings = components.new(constants.widgets.audioSettings.id)
    local options = components.new(settings:findChildWidgetTag("options").id)
    local footer = components.new(settings:findChildWidgetTag("footer").id)
    local description = components.new(footer:findChildWidgetTag("text").id)
    local backButton = button.new(options:findChildWidgetTag("back").id)

    local profile = Engine.savedGames.getPlayerProfile()

    local elements = {}
    local elementsData = {
        ["MASTER VOLUME"] = {
            value = 10,
            change = function(value)
                profile.audioSettings.masterVolume = value
                Engine.savedGames.reloadPlayerProfile()
            end,
            focus = function()
                description:setText("Change the quality of the textures in the game.")
            end
        },
        ["GAME EFFECTS VOLUME"] = {
            value = 10,
            change = function(value)
                profile.audioSettings.effectsVolume = value
                Engine.savedGames.reloadPlayerProfile()
                playSound(constants.sounds.teleporter.id)
            end,
            focus = function()
                description:setText("Change the quality of the textures in the game.")
            end
        },
        ["MUSIC VOLUME"] = {
            value = 10,
            change = function(value)
                profile.audioSettings.musicVolume = value
                Engine.savedGames.reloadPlayerProfile()
            end,
            focus = function()
                description:setText("Change the quality of the textures in the game.")
            end
        },
        ["HARDWARE ACCELERATION"] = {
            value = true,
            change = function(value)
                profile.audioSettings.enableHardwareAcceleration = tobit(value)
                Engine.savedGames.reloadPlayerProfile()
            end,
            focus = function()
                description:setText("Change the quality of the textures in the game.")
            end
        },
        ["ENVIRONMENTAL SOUND"] = {
            value = true,
            change = function(value)
                profile.audioSettings.enableEax = tobit(value)
                Engine.savedGames.reloadPlayerProfile()
            end,
            focus = function()
                description:setText("Change the quality of the textures in the game.")
            end
        },
        --["SOUND QUALITY"] = {
        --    value = 0,
        --    change = function(value)
        --        profile.audioSettings.soundQuality = value
        --        Engine.savedGames.reloadPlayerProfile()
        --    end,
        --    focus = function()
        --        description:setText("Change the quality of the textures in the game.")
        --    end
        --},
        --["SOUND VARIETY"] = {
        --    value = 0,
        --    change = function(value)
        --        profile.audioSettings.soundVariety = value
        --        Engine.savedGames.reloadPlayerProfile()
        --    end,
        --    focus = function()
        --        description:setText("Change the quality of the textures in the game.")
        --    end
        --}
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
            elements[spin:getText()] = spin
            spin:onScroll(function(value, index)
                local optionName = spin:getText()
                if elementsData[optionName] then
                    elementsData[optionName].change(value)
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

    settings:onClose(function()
        Engine.savedGames.savePlayerProfile()
    end)

    backButton:onClick(function()
        settings.events.onClose()
    end)

    settings:onOpen(function(previousWidgetTag)
        local profile = Engine.savedGames.getPlayerProfile()

        -- Native game values
        local volumeLevels = {}
        for i = 0, 10, 1 do
            table.insert(volumeLevels, tostring(i))
        end

        elements["MASTER VOLUME"]:setValues(volumeLevels)
        elementsData["MASTER VOLUME"].value = profile.audioSettings.masterVolume
        elements["GAME EFFECTS VOLUME"]:setValues(volumeLevels)
        elementsData["GAME EFFECTS VOLUME"].value = profile.audioSettings.effectsVolume
        elements["MUSIC VOLUME"]:setValues(volumeLevels)
        elementsData["MUSIC VOLUME"].value = profile.audioSettings.musicVolume
        elementsData["HARDWARE ACCELERATION"].value = tobool(profile.audioSettings.enableHardwareAcceleration)
        elementsData["ENVIRONMENTAL SOUND"].value = tobool(profile.audioSettings.enableEax)
        --elementsData["SOUND QUALITY"].value = profile.audioSettings.soundQuality
        --elementsData["SOUND VARIETY"].value = profile.audioSettings.soundVariety

        for k, component in pairs(elements) do
            local data = elementsData[k]
            if data then
                component:setValue(data.value)
            else
                -- error("Element from list not found: " .. k)
            end
        end
    end)
end
