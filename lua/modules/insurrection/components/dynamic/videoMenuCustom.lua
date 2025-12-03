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
local monitors = require "insurrection.monitors"

return function()
    local settings = components.new(constants.widgets.videoSettings.id)
    local options = components.new(settings:findChildWidgetTag("options").id)
    local footer = components.new(settings:findChildWidgetTag("footer").id)
    local description = components.new(footer:findChildWidgetTag("text").id)
    local backButton = button.new(options:findChildWidgetTag("back").id)

    local monitors = monitors.getAll(true)

    local resolutionsMap = {}
    for _, monitor in ipairs(monitors) do
        for _, resolution in ipairs(monitor.resolutions) do
            local resKey = string.format("%dx%d", resolution.width, resolution.height)
            resolutionsMap[resKey] = resolutionsMap[resKey] or {}
            table.insert(resolutionsMap[resKey], resolution.refresh)
        end
    end
    for _, refreshRates in pairs(resolutionsMap) do
        table.sort(refreshRates, function(a, b)
            return a < b
        end)
    end

    local availableResolutions = table.map(resolutionsMap, function(_, key)
        return key
    end)
    -- Keep only widescreen resolutions
    availableResolutions = table.filter(availableResolutions, function(value, index)
        local w, h = value:match("(%d+)x(%d+)")
        w = tonumber(w)
        h = tonumber(h)
        local aspectRatio = w / h
        return aspectRatio >= 16 / 10
    end)
    -- Sort resolutions by largest widescreen
    table.sort(availableResolutions, function(previous, current)
        local widthPrev = previous:match("(%d+)x")
        local widthCurr = current:match("(%d+)x")
        widthPrev = tonumber(widthPrev)
        widthCurr = tonumber(widthCurr)
        return widthPrev < widthCurr
    end)

    local width, height = core.getScreenResolution()
    local currentRefreshRates = resolutionsMap[string.format("%dx%d", width, height)]
    if not currentRefreshRates then
        local defaultResKey = availableResolutions[#availableResolutions]
        currentRefreshRates = resolutionsMap[defaultResKey]
    end

    local availableTextureQualities = {"LOW", "MEDIUM", "HIGH"}

    local availableRefreshRates = {}
    availableRefreshRates = table.map(currentRefreshRates or {}, function(refresh)
        return tostring(refresh) .. "Hz"
    end)

    local profile = Engine.savedGames.getPlayerProfile()

    local chimeraConfig = chimera.getConfiguration() or {}
    local chimeraPreferences = chimera.getPreferences() or {}
    local aspectWidth = core.getScreenAspectRatio()
    local isUltraWide = aspectWidth > 16

    local balltzeConfiguration = balltze.getConfiguration() or {}

    local function saveBalltzeConfig()
        balltze.saveConfiguration(balltzeConfiguration)
    end

    local function saveChimeraConfig()
        chimera.saveConfiguration(chimeraConfig)
    end

    local elements = {}
    local elementsData = {}
    elementsData = {
        ["DISPLAY ADAPTER"] = {
            value = monitors[1] and monitors[1].adapterLabel or "Default GPU Adapter",
            change = function(value)
            end,
            focus = function()
                description:setText("Select the display adapter to use for rendering the game.")
            end
        },
        ["RESOLUTION"] = {
            value = availableResolutions[#availableResolutions],
            change = function(value)
                local resolution = value:split("x")
                local newWidth = tonumber(resolution[1])
                local newHeight = tonumber(resolution[2])

                local witdh = profile.videoSettings.resolutionWidth
                local height = profile.videoSettings.resolutionHeight
                if newWidth == witdh and newHeight == height then
                    logger:debug("Resolution is the same, skipping")
                    return
                end

                profile.videoSettings.resolutionWidth = newWidth
                profile.videoSettings.resolutionHeight = newHeight

                availableRefreshRates = table.map(resolutionsMap[value] or {}, function(refresh)
                    return tostring(refresh) .. "Hz"
                end)
                local highestResfreshRate = availableRefreshRates[#availableRefreshRates]
                elements["REFRESH RATE"]:setValues(availableRefreshRates)
                elements["REFRESH RATE"]:setValue(highestResfreshRate)

                -- Save Chimera config as well (Chimera leads the video mode settings for now)
                chimeraConfig.video_mode.width = tostring(newWidth)
                chimeraConfig.video_mode.height = tostring(newHeight)
                saveChimeraConfig()

                -- Reload legacy game profile settings to apply changes
                -- Will require a game restart to take effect until Chimera gets removed
                Engine.savedGames.reloadPlayerProfile()
            end,
            focus = function()
                description:setText(
                    "Change the resolution of the game. NOTE: Changing resolution requires a game restart to take effect.")
            end
        },
        ["REFRESH RATE"] = {
            value = availableRefreshRates[#availableRefreshRates],
            change = function(value)
                local refreshRate = tonumber(value:replace("Hz", "")) or 0
                if profile.videoSettings.refreshRate == refreshRate then
                    logger:debug("Refresh rate is the same, skipping")
                    return
                end

                profile.videoSettings.refreshRate = refreshRate
                -- Save Chimera config as well (Chimera leads the video mode settings for now)
                chimeraConfig.video_mode.refresh_rate = refreshRate
                saveChimeraConfig()

                -- Reload legacy game profile settings to apply changes
                -- Will require a game restart to take effect until Chimera gets removed
                Engine.savedGames.reloadPlayerProfile()
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
                saveChimeraConfig()
                -- TODO Apply vsync data to game profile
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
                saveChimeraConfig()
            end,
            focus = function()
                description:setText("Enable game to run in windowed mode.")
            end
        },
        ["BORDERLESS WINDOW"] = {
            value = chimeraConfig.video_mode.borderless == 1,
            change = function(value)
                chimeraConfig.video_mode.borderless = value and 1 or 0
                saveChimeraConfig()
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
                balltzeConfiguration.preload_map_textures.enable = value
                saveBalltzeConfig()
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
        local resolutionKey = profile.videoSettings.resolutionWidth .. "x" ..
                                  profile.videoSettings.resolutionHeight
        local currentResolution = table.find(availableResolutions, function(value)
            return value == resolutionKey
        end) or availableResolutions[#availableResolutions]

        local currentRefreshRate = table.find(availableRefreshRates, function(value)
            return value:includes(profile.videoSettings.refreshRate .. "Hz")
        end) or availableRefreshRates[#availableRefreshRates]

        -- elements["DISPLAY ADAPTER"]:setValues(table.map(monitors, function(monitor)
        --    -- Keep only index (keep last char)
        --    local index = string.sub(monitor.adapterName, -1)
        --    return monitor.adapterLabel .. " (" .. index .. ")"
        -- end))
        -- elementsData["DISPLAY ADAPTER"].value = monitors[1] and monitors[1].adapterLabel or "Default GPU Adapter"
        -- elementsData["DISPLAY ADAPTER"].value = monitors[1] and monitors[1].adapterLabel

        elements["RESOLUTION"]:setValues(availableResolutions)
        elementsData["RESOLUTION"].value = currentResolution

        elements["REFRESH RATE"]:setValues(availableRefreshRates)
        elementsData["REFRESH RATE"].value = currentRefreshRate

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
        local chimeraFov = tostring(chimeraPreferences.chimera_fov)
        local currentFov = table.find(fovs, function(value)
            return value == chimeraFov or value == chimeraFov .. "v"
        end) or fovs[1]
        elementsData["FIELD OF VIEW"].value = currentFov
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
