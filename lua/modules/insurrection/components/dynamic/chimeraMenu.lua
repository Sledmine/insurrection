local components = require "insurrection.components"
local blam = require "blam"
local constants = require "insurrection.constants"
local chimera = require "insurrection.mods.chimera"
local interface = require "insurrection.interface"
local checkbox = require "insurrection.components.checkbox"
local spinner = require "insurrection.components.spinner"
local core = require "insurrection.core"

return function()
    local chimeraMod = components.new(constants.widgets.chimera.id)
    local chimeraOptions = components.new(chimeraMod:findChildWidgetTag("chimera_mod_options").id)

    local chimeraConfig = chimera.getConfiguration() or {}
    local chimeraPreferences = chimera.getPreferences() or {}

    local elements = {}

    local aspectWidth = core.getScreenAspectRatio()
    local isUltraWide = aspectWidth > 16

    local elementsData = {
        ["USE VSYNC"] = {
            value = chimeraConfig.video_mode.vsync,
            change = function(value)
                chimeraConfig.video_mode.vsync = value and 1 or 0
                chimera.saveConfiguration(chimeraConfig)
            end
        },
        ["SHOW FPS"] = {
            value = chimeraPreferences.chimera_show_fps,
            change = function(value)
                chimeraPreferences.chimera_show_fps = value and 1 or 0
                chimera.executeCommand("chimera_show_fps " .. (value and 1 or 0))
            end
        },
        ["WINDOWED MODE"] = {
            value = chimeraConfig.video_mode.windowed,
            change = function(value)
                chimeraConfig.video_mode.windowed = value and 1 or 0
                chimera.saveConfiguration(chimeraConfig)
            end
        },
        ["BORDERLESS"] = {
            value = chimeraConfig.video_mode.borderless,
            change = function(value)
                chimeraConfig.video_mode.borderless = value and 1 or 0
                chimera.saveConfiguration(chimeraConfig)
            end
        },
        ["LOAD MAPS ON RAM"] = {
            value = chimeraConfig.memory.enable_map_memory_buffer,
            change = function(value)
                chimeraConfig.memory.enable_map_memory_buffer = value and 1 or 0
                chimera.saveConfiguration(chimeraConfig)
                interface.dialog("INFORMATION", "You have changed a critical Chimera setting.",
                                 "You need to restart the game for the changes to take effect.")
            end
        },
        ["ANISOTROPIC FILTER"] = {
            value = chimeraPreferences.chimera_af,
            change = function(value)
                chimeraPreferences.chimera_af = value and 1 or 0
                chimera.executeCommand("chimera_af " .. (value and 1 or 0))
            end
        },
        ["BLOCK BUFFERING"] = {
            value = chimeraPreferences.chimera_block_buffering,
            change = function(value)
                chimeraPreferences.chimera_block_buffering = value and 1 or 0
                chimera.executeCommand("chimera_block_buffering " .. (value and 1 or 0))
            end
        },
        ["BLOCK HOLD F1 AT START"] = {
            value = chimeraPreferences.chimera_block_hold_f1,
            change = function(value)
                chimeraPreferences.chimera_block_hold_f1 = value and 1 or 0
                chimera.executeCommand("chimera_block_hold_f1 " .. (value and 1 or 0))
            end
        },
        ["BLOCK LOADING SCREEN"] = {
            value = chimeraPreferences.chimera_block_loading_screen,
            change = function(value)
                chimeraPreferences.chimera_block_loading_screen = value and 1 or 0
                chimera.executeCommand("chimera_block_loading_screen " .. (value and 1 or 0))
            end
        },
        ["BLOCK ZOOM BLUR"] = {
            value = chimeraPreferences.chimera_block_zoom_blur,
            change = function(value)
                chimeraPreferences.chimera_block_zoom_blur = value and 1 or 0
                chimera.executeCommand("chimera_block_zoom_blur " .. (value and 1 or 0))
            end
        },
        -- ["BLOCK MOUSE ACCELERATION"] = function(value)
        --    preferences.chimera_block_mouse_acceleration = value and 1 or 0
        --    chimera.executeCommand("chimera_block_mouse_acceleration " .. (value and 1 or 0))
        -- end,
        ["DEVMODE"] = {
            value = chimeraPreferences.chimera_devmode,
            change = function(value)
                chimeraPreferences.chimera_devmode = value and 1 or 0
                chimera.executeCommand("chimera_devmode " .. (value and 1 or 0))
            end
        },
        ["SHOW BUDGET"] = {
            value = chimeraPreferences.chimera_budget,
            change = function(value)
                chimeraPreferences.chimera_budget = value and 1 or 0
                chimera.executeCommand("chimera_budget " .. (value and 1 or 0))
            end
        },
        ["FOV"] = {
            value = chimeraPreferences.chimera_fov,
            change = function(value)
                chimeraPreferences.chimera_fov = value
                chimera.executeCommand("chimera_fov " .. value)
                log("Setting horizontal FOV")
            end
        }
    }

    for i = 1, chimeraOptions.widgetDefinition.childWidgetsCount - 1 do
        local childWidget = chimeraOptions.widgetDefinition.childWidgets[i]
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
        elseif tag.path:includes "spinner" then
            local spin = spinner.new(childWidget.widgetTag)
            elements[spin:getText()] = spin
            spin:onScroll(function(value, index)
                local optionName = spin:getText()
                if elementsData[optionName] then
                    elementsData[optionName].change(value)
                end
            end)
        end
    end
    chimeraMod:onOpen(function()
        log("Aspect width: " .. aspectWidth)
        chimeraConfig = chimera.getConfiguration() or {}
        chimeraPreferences = chimera.getPreferences() or {}

        -- Create fovs list with values from 60 to 120 in steps of 5
        --log(preferences.chimera_fov)
        local fovs = {}
        for fov = 60, 120, 1 do
            table.insert(fovs, tostring(fov) .. (isUltraWide and "v" or ""))
        end

        elements["FOV"]:setValues(fovs)

        elementsData["USE VSYNC"].value = chimeraConfig.video_mode.vsync
        elementsData["SHOW FPS"].value = chimeraPreferences.chimera_show_fps
        elementsData["WINDOWED MODE"].value = chimeraConfig.video_mode.windowed
        elementsData["BORDERLESS"].value = chimeraConfig.video_mode.borderless
        elementsData["LOAD MAPS ON RAM"].value = chimeraConfig.memory.enable_map_memory_buffer
        elementsData["ANISOTROPIC FILTER"].value = chimeraPreferences.chimera_af
        elementsData["BLOCK BUFFERING"].value = chimeraPreferences.chimera_block_buffering
        elementsData["BLOCK HOLD F1 AT START"].value = chimeraPreferences.chimera_block_hold_f1
        elementsData["BLOCK LOADING SCREEN"].value = chimeraPreferences.chimera_block_loading_screen
        elementsData["BLOCK ZOOM BLUR"].value = chimeraPreferences.chimera_block_zoom_blur
        -- elementsData["BLOCK MOUSE ACCELERATION"].value = preferences.chimera_block_mouse_acceleration
        elementsData["DEVMODE"].value = chimeraPreferences.chimera_devmode
        elementsData["SHOW BUDGET"].value = chimeraPreferences.chimera_budget
        elementsData["FOV"].value = chimeraPreferences.chimera_fov
        for k, component in pairs(elements) do
            local data = elementsData[k]
            if data then
                if component.type == "checkbox" then
                    component:setValue(data.value == 1)
                elseif component.type == "spinner" then
                    component:setValue(data.value)
                end
            else
                -- error("Element from list not found: " .. k)
            end
        end
        log("chimeraMod:onOpen")
    end)
end
