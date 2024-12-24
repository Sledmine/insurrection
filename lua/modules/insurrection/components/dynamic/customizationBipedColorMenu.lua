local color = require "color"
local components = require "insurrection.components"
local constants = require "insurrection.constants"
local list = require "insurrection.components.list"
local button = require "insurrection.components.button"
local core = require "insurrection.core"
local utils = require "insurrection.utils"
local blam  = require "blam"
local l = function(str)
    local snakeCase = utils.camelCaseToSnakeCase(str)
    local titleCase = utils.snakeCaseToTitleCase(snakeCase)
    return titleCase:upper()
end

local function getColorName(color)
    return table.keyof(constants.customColor, color)
end

return function()
    local customizationColor = components.new(constants.widgets.bipedColor.id)

    local primaryColorLabel = components.new(customizationColor:findChildWidgetTag(
                                                 "primary_color_subtitle").id)
    
    local secondaryColorLabel = components.new(customizationColor:findChildWidgetTag ("secondary_color_subtitle").id)

    local customizationBipedColorOptionsHandle = customizationColor:findChildWidgetTag(
                                                     "customization_biped_colors_options").id
    local customizationBipedColorOptions = components.new(customizationBipedColorOptionsHandle)

    for columnIndex = 1, #constants.customColors do
        local colorPrimaryColumnHandle = customizationBipedColorOptions:findChildWidgetTag(
                                             "primary_colors_column_" .. columnIndex).id
        local colorPrimaryColumnList = list.new(colorPrimaryColumnHandle)
        colorPrimaryColumnList:scrollable(false)
        colorPrimaryColumnList:onSelect(function(item)
            primaryColorLabel:setText(l(getColorName(item.value)))
            core.setCustomizationBipedColor(item.value)
        end)
        colorPrimaryColumnList:setItems(table.map(
                                            table.reverse(constants.customColors[columnIndex]),
                                            function(color)
                return {value = color, text = color}
            end))

        local colorSecondaryColumnHandle = customizationBipedColorOptions:findChildWidgetTag(
                                               "secondary_colors_column_" .. columnIndex).id
        local colorSecondaryColumnList = list.new(colorSecondaryColumnHandle)
        colorSecondaryColumnList:scrollable(false)
        colorSecondaryColumnList:onSelect(function(item)
            secondaryColorLabel:setText(l(getColorName(item.value)))
            core.setCustomizationBipedColor(nil, item.value)
        end)
        colorSecondaryColumnList:setItems(table.map(table.reverse(
                                                        constants.customColors[columnIndex]),
                                                    function(color)
            return {value = color, text = color}
        end))

    end

    customizationColor:onOpen(function()
        BipedRotation = constants.customization.rotation.color
        local customizationBiped = core.getCustomizationObjectData().biped
        assert(customizationBiped, "No customization biped found")
        blam.rotateObject(customizationBiped, BipedRotation, 0 , 0)
        execute_script "camera_set customization_color 30"
    end)
end
