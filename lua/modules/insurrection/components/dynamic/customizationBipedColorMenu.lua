local color = require "color"
local component = require "ui.component"
local constants = require "insurrection.constants"
local list = require "ui.list"
local button = require "ui.button"
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
    local customizationColor = component.new(constants.widgets.bipedColor.handle.value)

    local primaryColorLabel = component.new(customizationColor:findChildWidgetTag(
                                                 "primary_color_subtitle").handle.value)
    
    local secondaryColorLabel = component.new(customizationColor:findChildWidgetTag ("secondary_color_subtitle").handle.value)

    local customizationBipedColorOptionsHandle = customizationColor:findChildWidgetTag(
                                                     "customization_biped_colors_options").handle.value
    local customizationBipedColorOptions = component.new(customizationBipedColorOptionsHandle)

    for columnIndex = 1, #constants.customColors do
        local colorPrimaryColumnHandle = customizationBipedColorOptions:findChildWidgetTag(
                                             "primary_colors_column_" .. columnIndex).handle.value
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
                                               "secondary_colors_column_" .. columnIndex).handle.value
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
