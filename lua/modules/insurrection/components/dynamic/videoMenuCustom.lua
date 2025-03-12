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
local chimera = require "insurrection.mods.chimera"
local balltze = require "insurrection.mods.balltze"
local interface = require "insurrection.interface"
local engine = Engine

return function()
    local settings = components.new(constants.widgets.videoSettings.id)
    local options = components.new(settings:findChildWidgetTag("options").id)
    local footer = components.new(settings:findChildWidgetTag("footer").id)
    local description = components.new(footer:findChildWidgetTag("text").id)
    local backButton = button.new(options:findChildWidgetTag("back").id)

    local availableResolutions = {
        "1280x720",
        -- "1366x768",
        -- "1600x900",
        -- "1680x1050",
        "1920x1080",
        -- "1920x1200",
        "2560x1080"
        -- "2560x1440",
        -- "3440x1440",
        -- "3840x2160"
    }

    local availableTextureQualities = {"LOW", "MEDIUM", "HIGH"}

    local availableRefreshRates = {"60", "75", "120", "144", "240"}
    availableRefreshRates = table.map(availableRefreshRates, function(value)
        return value .. "Hz"
    end)

    local profile = Engine.savedGames.getPlayerProfile()

    local chimeraConfig = chimera.getConfiguration() or {}
    local chimeraPreferences = chimera.getPreferences() or {}
    local aspectWidth = core.getScreenAspectRatio()
    local isUltraWide = aspectWidth > 16

    local balltzeConfiguration = balltze.getConfiguration() or {}

    local elements = {}
    local elementsData = {
        ["RESOLUTION"] = {
            value = availableResolutions[#availableResolutions],
            change = function(value)
                local resolution = value:split("x")
                local newWidth = tonumber(resolution[1])
                local newHeight = tonumber(resolution[2])
                logger:debug("Current resolution: {} x {}", profile.videoSettings.resolutionWidth,
                             profile.videoSettings.resolutionHeight)
                local witdh = profile.videoSettings.resolutionWidth
                local height = profile.videoSettings.resolutionHeight
                if newWidth == witdh and newHeight == height then
                    logger:debug("Resolution is the same, skipping")
                    return
                end

                profile.videoSettings.resolutionWidth = newWidth
                profile.videoSettings.resolutionHeight = newHeight
                Engine.savedGames.reloadPlayerProfile()
            end,
            focus = function()
                description:setText("Change the resolution of the game.")
            end
        },
        ["REFRESH RATE"] = {
            value = availableRefreshRates[#availableRefreshRates],
            change = function(value)
                local refreshRate = tonumber(value:replace("Hz", ""))
                if profile.videoSettings.refreshRate == refreshRate then
                    logger:debug("Refresh rate is the same, skipping")
                    return
                end

                profile.videoSettings.refreshRate = refreshRate
            end,
            focus = function()
                description:setText("Change the refresh rate of the game.")
            end
        },
        ["TEXTURE QUALITY"] = {
            value = availableTextureQualities[3],
            change = function(value)
                profile.videoSettings.textureQuality =
                    (table.indexof(availableTextureQualities, value) or 3) - 1
                Engine.savedGames.reloadPlayerProfile()
            end,
            focus = function()
                description:setText("Change the quality of the textures in the game.")
            end
        },
        ["RENDER SPECULAR SURFACES"] = {
            value = true,
            change = function(value)
                profile.videoSettings.specular = tobit(value)
                Engine.savedGames.reloadPlayerProfile()
            end,
            focus = function()
                description:setText("Render surfaces with specular reflections.")
            end
        },
        ["RENDER OBJECTS SHADOWS"] = {
            value = true,
            change = function(value)
                profile.videoSettings.shadows = tobit(value)
                Engine.savedGames.reloadPlayerProfile()
            end,
            focus = function()
                description:setText("Dynamic shadows will be enabled for some objects.")
            end
        },
        ["RENDER MAP DECALS"] = {
            value = true,
            change = function(value)
                profile.videoSettings.decals = tobit(value)
                Engine.savedGames.reloadPlayerProfile()
            end,
            focus = function()
                description:setText(
                    "Render decals placed by effects, such as bullet holes and explosions in the map.")
            end
        },
        ["RENDER EFFECTS PARTICLES"] = {
            value = true,
            change = function(value)
                profile.videoSettings.particles = value == true and 2 or 0
                Engine.savedGames.reloadPlayerProfile()
            end,
            focus = function()
                description:setText("Render particles effects in the game.")
            end
        },
        ["USE VSYNC"] = {
            value = chimeraConfig.video_mode.vsync == 1,
            change = function(value)
                chimeraConfig.video_mode.vsync = value and 1 or 0
                chimera.saveConfiguration(chimeraConfig)
            end,
            focus = function()
                description:setText("Enable vertical synchronization to prevent screen tearing.")
            end
        },
        ["SHOW FPS"] = {
            value = chimeraPreferences.chimera_show_fps == 1,
            change = function(value)
                chimeraPreferences.chimera_show_fps = value and 1 or 0
                chimera.executeCommand("chimera_show_fps " .. (value and 1 or 0))
            end,
            focus = function()
                description:setText("Show the current frames per second in the game.")
            end
        },
        ["WINDOWED MODE"] = {
            value = chimeraConfig.video_mode.windowed == 1,
            change = function(value)
                chimeraConfig.video_mode.windowed = value and 1 or 0
                chimera.saveConfiguration(chimeraConfig)
            end,
            focus = function()
                description:setText("Enable game to run in windowed mode.")
            end
        },
        ["BORDERLESS WINDOW"] = {
            value = chimeraConfig.video_mode.borderless == 1,
            change = function(value)
                chimeraConfig.video_mode.borderless = value and 1 or 0
                chimera.saveConfiguration(chimeraConfig)
            end,
            focus = function()
                description:setText("Enable borderless windowed mode.")
            end
        },
        ["ANISOTROPIC FILTER"] = {
            value = chimeraPreferences.chimera_af == 1,
            change = function(value)
                chimeraPreferences.chimera_af = value and 1 or 0
                chimera.executeCommand("chimera_af " .. (value and 1 or 0))
            end,
            focus = function()
                description:setText("Enable anisotropic filtering to improve texture quality.")
            end
        },
        ["FIELD OF VIEW"] = {
            value = chimeraPreferences.chimera_fov,
            change = function(value)
                chimeraPreferences.chimera_fov = value
                chimera.executeCommand("chimera_fov " .. value)
                log("Setting horizontal FOV")
            end,
            focus = function()
                description:setText("Change field of view of player first person camera.")
            end
        },
        ["PRELOAD MAP TEXTURES"] = {
            value = false,
            change = function(value)
                config.preload_map_textures.enable = value
                balltze.saveConfiguration(config)
            end,
            focus = function()
                description:setText(
                    "Preload map textures before loading a map to prevent stuttering while playing.\n" ..
                        "NOTE: You must restart the game to apply changes.")
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
        if engine.map.getCurrentMapHeader().name ~= "ui" then
            interface.blur(true)
        end
        Engine.savedGames.savePlayerProfile()
    end)

    backButton:onClick(function()
        settings.events.onClose()
    end)

    settings:onOpen(function(previousWidgetTag)
        if engine.map.getCurrentMapHeader().name ~= "ui" then
            interface.blur(false)
        end
        local profile = Engine.savedGames.getPlayerProfile()
        -- local currentResolution = profile.videoSettings.resolutionWidth .. "x" ..
        --                              profile.videoSettings.resolutionHeight
        -- local currentRefreshRate = table.find(availableRefreshRates, function(value)
        --    return value:includes(profile.videoSettings.refreshRate .. "Hz")
        -- end)

        -- elements["RESOLUTION"]:setValues(availableResolutions)
        -- elementsData["RESOLUTION"].value = currentResolution

        -- elements["REFRESH RATE"]:setValues(availableRefreshRates)
        -- elementsData["REFRESH RATE"].value = currentRefreshRate

        -- Native game values
        elements["TEXTURE QUALITY"]:setValues(availableTextureQualities)
        elementsData["TEXTURE QUALITY"].value = availableTextureQualities[profile.videoSettings
                                                    .textureQuality + 1]
        elementsData["RENDER SPECULAR SURFACES"].value = tobool(profile.videoSettings.specular)
        elementsData["RENDER OBJECTS SHADOWS"].value = tobool(profile.videoSettings.shadows)
        elementsData["RENDER MAP DECALS"].value = tobool(profile.videoSettings.decals)
        elementsData["RENDER EFFECTS PARTICLES"].value = profile.videoSettings.particles == 2
        -- Chimera values
        elementsData["USE VSYNC"].value = chimeraConfig.video_mode.vsync == 1
        elementsData["SHOW FPS"].value = chimeraPreferences.chimera_show_fps == 1
        elementsData["WINDOWED MODE"].value = chimeraConfig.video_mode.windowed == 1
        elementsData["BORDERLESS WINDOW"].value = chimeraConfig.video_mode.borderless == 1
        elementsData["ANISOTROPIC FILTER"].value = chimeraPreferences.chimera_af == 1
        local fovs = {}
        for fov = 60, 120, 1 do
            table.insert(fovs, tostring(fov) .. (isUltraWide and "v" or ""))
        end
        elements["FIELD OF VIEW"]:setValues(fovs)
        elementsData["FIELD OF VIEW"].value = chimeraPreferences.chimera_fov
        -- Balltze values
        elementsData["PRELOAD MAP TEXTURES"].value =
            balltzeConfiguration.preload_map_textures.enable

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
