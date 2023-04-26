local components = require "insurrection.components"
local checkbox = require "insurrection.components.checkbox"
local constants = require "insurrection.constants"
local chimera = require "insurrection.mods.chimera"
local interface = require "insurrection.interface"
local blam = require "blam"

return function()
    local chimeraMod = components.new(constants.widgets.chimera.id)
    local chimeraOptions = components.new(chimeraMod:findChildWidgetTag("chimera_mod_options").id)
    local checkboxes = {}
    local config = chimera.getConfiguration() or {}
    local preferences = chimera.getPreferences() or {}
    for i = 1, chimeraOptions.widgetDefinition.childWidgetsCount - 1 do
        local childWidget = chimeraOptions.widgetDefinition.childWidgets[i]
        local check = checkbox.new(childWidget.widgetTag)
        checkboxes[check:getText()] = check
        check:onToggle(function(value)
            local optionName = check:getText()
            local optionsToggle = {
                ["USE VSYNC"] = function(value)
                    config.video_mode.vsync = value and 1 or 0
                    chimera.saveConfiguration(config)
                end,
                ["SHOW FPS"] = function(value)
                    preferences.chimera_show_fps = value and 1 or 0
                    chimera.executeCommand("chimera_show_fps " .. (value and 1 or 0))
                end,
                ["WINDOWED MODE"] = function(value)
                    config.video_mode.windowed = value and 1 or 0
                    chimera.saveConfiguration(config)
                end,
                ["BORDERLESS"] = function(value)
                    config.video_mode.borderless = value and 1 or 0
                    chimera.saveConfiguration(config)
                end,
                ["LOAD MAPS ON RAM"] = function(value)
                    config.memory.enable_map_memory_buffer = value and 1 or 0
                    chimera.saveConfiguration(config)
                    interface.dialog("INFORMATION", "You have changed a critical Chimera setting.",
                                     "You need to restart the game for the changes to take effect.")
                end,
                ["ANISOTROPIC FILTER"] = function(value)
                    preferences.chimera_af = value and 1 or 0
                    chimera.executeCommand("chimera_af " .. (value and 1 or 0))
                end,
                ["BLOCK BUFFERING"] = function(value)
                    preferences.chimera_block_buffering = value and 1 or 0
                    chimera.executeCommand("chimera_block_buffering " .. (value and 1 or 0))
                end,
                ["BLOCK HOLD F1 AT START"] = function(value)
                    preferences.chimera_block_hold_f1 = value and 1 or 0
                    chimera.executeCommand("chimera_block_hold_f1 " .. (value and 1 or 0))
                end,
                ["BLOCK LOADING SCREEN"] = function(value)
                    preferences.chimera_block_loading_screen = value and 1 or 0
                    chimera.executeCommand("chimera_block_loading_screen " .. (value and 1 or 0))
                end,
                ["BLOCK ZOOM BLUR"] = function(value)
                    preferences.chimera_block_zoom_blur = value and 1 or 0
                    chimera.executeCommand("chimera_block_zoom_blur " .. (value and 1 or 0))
                end,
                ["BLOCK MOUSE ACCELERATION"] = function(value)
                    preferences.chimera_block_mouse_acceleration = value and 1 or 0
                    chimera.executeCommand("chimera_block_mouse_acceleration " .. (value and 1 or 0))
                end,
                ["DEVMODE"] = function(value)
                    preferences.chimera_devmode = value and 1 or 0
                    chimera.executeCommand("chimera_devmode " .. (value and 1 or 0))
                end,
                ["SHOW BUDGET"] = function(value)
                    preferences.chimera_budget = value and 1 or 0
                    chimera.executeCommand("chimera_budget " .. (value and 1 or 0))
                end
            }
            if optionsToggle[optionName] then
                optionsToggle[optionName](value)
            end
        end)
    end
    chimeraMod:onOpen(function()
        config = chimera.getConfiguration() or {}
        preferences = chimera.getPreferences() or {}
        local optionsMapping = {
            ["USE VSYNC"] = config.video_mode.vsync,
            ["SHOW FPS"] = preferences.chimera_show_fps,
            ["WINDOWED MODE"] = config.video_mode.windowed,
            ["BORDERLESS"] = config.video_mode.borderless,
            ["LOAD MAPS ON RAM"] = config.memory.enable_map_memory_buffer,
            ["ANISOTROPIC FILTER"] = preferences.chimera_af,
            ["BLOCK BUFFERING"] = preferences.chimera_block_buffering,
            ["BLOCK HOLD F1 AT START"] = preferences.chimera_block_hold_f1,
            ["BLOCK LOADING SCREEN"] = preferences.chimera_block_loading_screen,
            ["BLOCK ZOOM BLUR"] = preferences.chimera_block_zoom_blur,
            ["BLOCK MOUSE ACCELERATION"] = preferences.chimera_block_mouse_acceleration,
            ["DEVMODE"] = preferences.chimera_devmode,
            ["SHOW BUDGET"] = preferences.chimera_budget
        }
        for k, check in pairs(checkboxes) do
            check:setValue(optionsMapping[k] == 1)
        end
    end)
end
