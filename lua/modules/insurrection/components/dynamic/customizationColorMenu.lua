local color = require "color"
local components = require "insurrection.components"
local constants = require "insurrection.constants"
local list = require "insurrection.components.list"
local button = require "insurrection.components.button"
local blam = require "blam"
local core = require "insurrection.core"
local getWidgetValues = core.getWidgetValues
local setWidgetValues = core.setWidgetValues
local menus = require "insurrection.menus"
local delay = require"insurrection.utils".delay

return function()
    local customizationColor = components.new(constants.widgets.color.id)

    local optionsId = customizationColor:findChildWidgetTag("options").id
    local customizationColorListOptions = list.new(optionsId)

    local actionsId = customizationColor:findChildWidgetTag("actions").id
    local customizationColorListActions = list.new(actionsId)

    local saveId = customizationColorListActions:findChildWidgetTag("save").id
    local customizationColorSaveButton = button.new(saveId)
    local colorButtons = customizationColorListOptions:getChildWidgetTags()

    local page = 0
    local multiplier = #colorButtons - 2

    local scrollDown = button.new(colorButtons[1].id)
    local scrollUp = button.new(colorButtons[#colorButtons - 1].id)
    scrollDown:onClick(function()
    end)
    scrollUp:onClick(function()
    end)

    updateColorMenu = function()
        Engine.core.consolePrint("Updating color menu")

        local profile = core.getPlayerProfile()
        local colorFromGame = constants.colors[profile.colorIndex]
        local colorName = table.flip(constants.color)[colorFromGame]:lower()
        logger:debug("Color: {}", colorName)

        local customizationBiped = core.getCustomizationObjectData().biped
        local r, g, b = color.hexToDec(colorFromGame)
        customizationBiped.colorCLowerRed = r
        customizationBiped.colorCLowerGreen = g
        customizationBiped.colorCLowerBlue = b

        customizationBiped.colorDLowerRed = r
        customizationBiped.colorDLowerGreen = g
        customizationBiped.colorDLowerBlue = b

        for buttonIndex, tag in pairs(colorButtons) do
            if buttonIndex > 1 and buttonIndex < #colorButtons - 1 then
                local colorButton = button.new(tag.id)
                local colorButtonText = button.new(colorButton:findChildWidgetTag("_text").id)
                local colorIcon = button.new(colorButton:findChildWidgetTag("_icon").id)
                --local colorValue = constants.colors[]
                --if colorValue then
                --   local colorIndex = table.flip(constants.colors)[colorValue] - 1
                --   setWidgetValues(colorIcon.tag.id, {bitmapIndex = colorIndex})
                    colorButton:onClick(function()
                        Engine.core.consolePrint(profile.colorIndex)
                        Engine.core.consolePrint(core.getPlayerProfile().colorIndex)
                        --local r, g, b = color.hexToDec(colorValue)
                        --customizationBiped.colorCLowerRed = r
                        --customizationBiped.colorCLowerGreen = g
                        --customizationBiped.colorCLowerBlue = b
                    end)
                --end
            end
        end
        return false
    end
    customizationColor:onOpen(function()
        execute_script "object_create customization_biped"

        -- delay(45, updateColorMenu)
        updateColorMenu()
    end)
end
