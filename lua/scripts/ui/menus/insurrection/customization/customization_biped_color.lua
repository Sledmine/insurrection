local widget = require "lua.scripts.widget"
local constants = require "lua.scripts.ui.components.constants"
local dynamicConstants = require "lua.modules.insurrection.constants"
local bar = require "lua.scripts.ui.componentsV3.bar"
local pos = constants.position
local label = require "lua.scripts.ui.componentsV3.label"
local strmem = widget.strmem
local container = require "lua.scripts.ui.componentsV3.container"
local options = require "lua.scripts.ui.componentsV3.options"
local button = require "lua.scripts.ui.componentsV3.button"
local header = require "lua.scripts.ui.componentsV3.header"
local complexButton = require "lua.scripts.ui.componentsV3.complexButton"
local slider = require "lua.scripts.ui.componentsV3.slider"
local color = require "lua.scripts.ui.componentsV3.color"
---@diagnostic disable-next-line: deprecated
local unpack = table.unpack or unpack
local inspect = require "lua.modules.inspect"
local utils = require "lua.modules.insurrection.utils"

widget.init [[insurrection/ui/menus/customization_biped_colors/]]

local yPosList = 305
local barSize = 200
local layout = widget.align("horizontal", constants.components.complexButton.normal.width, 59,
                            yPosList, 2)

-- Reverse color order because of Mark doing Mark stuff
local customColors = table.map(dynamicConstants.customColors, function(colors)
    return table.reverse(colors)
end)

local colors = table.map(customColors, function(column, columnIndex)
    return table.map(column, function(colorHex)
        local colorName = table.keyof(dynamicConstants.customColor, colorHex)
        if not colorName then
            error("Invalid hex color: " .. colorHex .. " has no name")
        end
        local name = utils.camelCaseToSnakeCase(colorName)
        return color {
            name = name,
            color = colorHex,
            width = 28,
            height = 20
        }
    end)
end)

local primaryColorPosition = {x = -10, y = 130}
local SecondaryColorPosition = {x = -10, y = 285}

local colorComponents = table.map(colors, function(column, columnIndex)
    return table.map(column, function(colorPath, colorIndex)
        return {
            colorPath,
            0,
            (colorIndex - 1) * 20
        }
    end)
end)

local colorColumns = table.map(colorComponents, function(column, columnIndex)
    return {
        options {
            name = "customization_biped_colors_column_" .. columnIndex,
            layout = "vertical",
            childs = column,
            width = 28,
            height = 100
        },
        primaryColorPosition.x + (columnIndex * 30),
        primaryColorPosition.y
    }
end)

local colorColumnsSecondary = table.map(colorComponents, function(column, columnIndex)
    return {
        options {
            name = "customization_biped_colors_column_" .. columnIndex,
            layout = "vertical",
            childs = column,
            width = 28,
            height = 100
        },
        SecondaryColorPosition.x + (columnIndex * 30),
        SecondaryColorPosition.y
    }
end)

local customizationBipedColorMenuPath = container {
    name = "customization_biped_colors_menu",
    background = "fade",
    childs = {
        {
            header {
                name = "customization_color",
                title = "BIPED COLOR",
                subtitle = "CUSTOMIZE YOUR BIPED COLOR"
            },
            pos.header.x,
            pos.header.y
        },
        {
            header {
                name = "primary_color",
                title = "PRIMARY COLOR",
                subtitle = "$colorName"
            },
            20,
            103
        },
        {
            bar {
                name = "customization_primary_color_scroll",
                orientation = "horizontal",
                type = "scroll",
                size = barSize
            },
            20,
            240
        },
        {
            options {
                name = "customization_biped_colors",
                layout = "vertical",
                childs = colorColumns
                --{
                --    --{button {name = "back", text = "BACK", back = true}, pos.back.x, pos.back.y}
                --}
            }
        },
        {
            header {
                name = "secondary_color",
                title = "SECONDARY COLOR",
                subtitle = "$colorName"
            },
            pos.colorHeader.x,
            258
        },
        {
            bar {
                name = "customization_primary_color_scroll",
                orientation = "horizontal",
                type = "scroll",
                size = barSize
            },
            20,
            395
        },
        {
            options {
                name = "customization_biped_colors_secondary",
                layout = "vertical",
                childs = colorColumnsSecondary
                --{
                --    --{button {name = "back", text = "BACK", back = true}, pos.back.x, pos.back.y}
                --}
            }
        },
        {
            button {
                name = "back",
                text = "BACK",
                variant = "normal",
                back = true
            },
            pos.back.x,
            pos.back.y
        },
        {constants.components.currentProfile.path, 624, 20},
        {constants.components.version.path, 0, 460}
    }
}

widget.global(customizationBipedColorMenuPath, "insurrection/ui/custom_menus.tag_collection")

return customizationBipedColorMenuPath
