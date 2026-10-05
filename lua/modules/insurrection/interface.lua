local balltze = Balltze
local engine = Engine
local openWidget = function(widgetDefinition, pushHistory)
    -- BALLTZE MIGRATE
    --return engine.uiWidget.launchWidget(widgetDefinition, pushHistory)
    return engine.uiWidget.launchWidget(widgetDefinition)
end
-- Balltze v2 does not provide a direct playSound replacement for uiWidget calls.
local playSound = function() end
local component = require "ui.component"
local menus = require "insurrection.menus"
local button = require "ui.button"
local translations = require "insurrection.translations"
local blam = require "blam"
local core = require "insurrection.core"
local uiWidgetTag = blam.uiWidgetDefinition
local uiWidgetCollection = blam.uiWidgetCollection
local constants = require "insurrection.constants"
local chimera = require "insurrection.mods.chimera"
local executeScript = engine.script.execute

local interface = {}
interface.shared = {}

shared = interface.shared

function interface.load()
    -- Unload all required packages from Lua modules
    for moduleName in pairs(package.loaded or {}) do
        if moduleName:startswith("insurrection.components.dynamic") then
            logger.debug("Unloading module: {}", moduleName)
            package.loaded[moduleName] = nil
        end
    end
    component.free()
    -- constants.get()
    IsUICompatible = true
    -- local scenery = engine.tag.findTags("halo", engine.tag.classes.scenery)[1]
    -- assert(scenery, "Error, no scenery tag found")
    -- engine.core.consolePrint("{}", tostring(inspect(table.keys(scenery.data))))
    if IsUICompatible then

        -- Load Insurrection features
        logger.debug("Loading Insurrection patches...")
        --core.loadInsurrectionPatches()

        -- Components initialization
        logger.debug("Initializing component...")
        interface.loadProfileNameplate()
        component.cleanAllEditableWidgets()

        -- interface.animate()

        -- If Insurrection has been loaded (check for a widget that only exists in Insurrection)
        if constants.widgets.login then
            require "insurrection.components.dynamic.dialog"()
            require "insurrection.components.dynamic.customizationColorMenu"()
            require "insurrection.components.dynamic.settingsMenu"()
            require "insurrection.components.dynamic.loginMenu"()
            require "insurrection.components.dynamic.dashboardMenu"()
            require "insurrection.components.dynamic.customizationMenu"()
            require "insurrection.components.dynamic.lobbyMenu"()
            require "insurrection.components.dynamic.lobbyMenuClient"()
            -- TODO Find a better way to toggle biped preview generation
            require "insurrection.components.dynamic.customizationBipedMenu" {
                isBipedPreviewGenEnabled = false
            }
            require "insurrection.components.dynamic.lobbyBrowserMenu"()
            require "insurrection.components.dynamic.customizationBipedColorMenu"()
            require "insurrection.components.dynamic.firefightMenu"()
            require "insurrection.components.dynamic.mainMenu"()

            local pause = component.new(constants.widgets.pause.handle.value)
            pause:onClose(function()
                interface.blur(false)
            end)

            -- TODO BALLTZE MIGRATE
            local tester = component.new(constants.widgets.tester.handle.value)
            local testerAnimTest = component.new(tester:findChildWidgetTag("anim_test").handle.value)
            testerAnimTest:animate()
            -- testerAnimTest:setAnimation(0.6, "horizontal", 100, 300, "ease in")

            -- Most likely this means we are getting back from the map itself
            -- Rejoin previous lobby if it exists
            if api.session.lobbyKey and engine.cacheFile.getLoadedCacheFileHeader().scenarioName == "ui" then
                api.lobby(api.session.lobbyKey)
            end

            -- local errorModalLegacy = component.new(constants.widgets.legacyModalError.handle.value)
            -- errorModalLegacy:onOpen(function()
            --    logger.warning("Checking if lobby is active {}", api.session.lobbyKey)
            --    if api.session.lobbyKey and engine.map.getCurrentMapHeader().name == "ui" then
            --        api.lobby(api.session.lobbyKey)
            --    end
            -- end)
        end
        -- BALLTZE MIGRATE
        --require "insurrection.components.dynamic.videoMenuCustom"()
        --require "insurrection.components.dynamic.audioMenuCustom"()

        -- Insurrection is running outside the UI
        if constants.widgetCollections.multiplayer then
            local multiplayerWidgetsCollection = uiWidgetCollection(
                                                     constants.widgetCollections.multiplayer.handle.value)
            if multiplayerWidgetsCollection then
                local pause = component.new(multiplayerWidgetsCollection.tagList[1])
                if pause then
                    logger.debug(multiplayerWidgetsCollection.tagList[1])
                    if constants.widgets.pause then
                        logger.debug("Insurrection may load in external map...")
                        require "insurrection.components.dynamic.dialog"()
                        local insurrectionPause = component.new(constants.widgets.pause.handle.value)
                        local resumeButton = button.new(
                                                 insurrectionPause:findChildWidgetTag(
                                                     "resume_game_button").handle.value)
                        local stockResumeButton = button.new(pause:findChildWidgetTag("resume").handle.value)
                        local exitButton = button.new(
                                               insurrectionPause:findChildWidgetTag("exit_button").handle.value)
                        resumeButton:onClick(function()
                            logger.debug("Resume button clicked")
                            interface.blur(false)
                            interface.sound("back")
                        end)
                        stockResumeButton:onClick(function()
                            logger.debug("Stock resume button clicked")
                            interface.sound("back")
                        end)
                        exitButton:onClick(function()
                            api.deleteLobby()
                        end)
                        local insurrectionChooseTeam = component.new(constants.widgets.team.handle.value)
                        local blueTeamButton = button.new(
                                                   insurrectionChooseTeam:findChildWidgetTag(
                                                       "blue_team_button").handle.value)
                        local redTeamButton = button.new(
                                                  insurrectionChooseTeam:findChildWidgetTag(
                                                      "red_team_button").handle.value)
                        blueTeamButton:onClick(function()
                            interface.blur(false)
                        end)
                        redTeamButton:onClick(function()
                            interface.blur(false)
                        end)
                        pause:onOpen(function()
                            logger.debug("Opening stock pause menu...")
                            if not InvalidatePauseOverride then
                                -- if engine.cacheFile.getLoadedCacheFileHeader().scenarioName ~= "ui" and (engine.netgame.getServerType() == "dedicated" or DebugMode) then
                                if engine.cacheFile.getLoadedCacheFileHeader().scenarioName ~= "ui" then
                                    logger.debug("Opening Insurrection pause menu...")
                                    interface.blur(true)
                                    balltze.features.setUIAspectRatio(16, 9)
                                    menus.pause()
                                end
                            end
                            InvalidatePauseOverride = false
                        end)
                        insurrectionPause:onClose(function()
                            interface.blur(false)
                        end)
                        local openMapPauseButton = button.new(insurrectionPause:get("open_map_pause"))
                        openMapPauseButton:onClick(function()
                            interface.blur(false)
                            InvalidatePauseOverride = true
                            menus.open(pause.tagId)
                        end)
                    end
                end

            end
        end

        -- Set up some chimera configs
        if engine.cacheFile.getLoadedCacheFileHeader().scenarioName == "ui" and false then
            local preferences = chimera.getPreferences() or {}
            -- TODO Check forced server name preference
            local notServerIpBlocking = not preferences.chimera_block_server_ip or
                                            preferences.chimera_block_server_ip == 0
            if notServerIpBlocking then
                interface.shared.dialog:onClose(function()
                    preferences.chimera_block_server_ip = 1
                    chimera.savePreferences(preferences)
                    if not chimera.executeCommand("chimera_block_server_ip 1") then
                        executeScript("quit")
                    end
                end)
                interface.dialog("WARNING", translations.eng.block_server_ips_subtitle,
                                 translations.eng.block_server_ips_message)
            end
        end
    end
end

function interface.loadProfileNameplate(nameplateId)
    if not constants.tagCollections.nameplates then
        logger.debug("Error, no nameplates collection found")
        return
    end
    local nameplate = component.new(constants.widgets.nameplate.handle.value)
    local nameplatesTagCollection = engine.tag.getTagData(constants.tagCollections.nameplates.handle.value,
                                                          "tag_collection")
    if nameplatesTagCollection then
        local nameplateBitmapTags = {}
        for _, tagId in ipairs(nameplatesTagCollection.tagList or {}) do
            local tagEntry = engine.tag.getTagEntry(tagId)
            if tagEntry then
                local nameplateId = core.getTagName(tagEntry.path)
                if nameplateId and not nameplateBitmapTags[nameplateId] then
                    nameplateBitmapTags[nameplateId] = tagEntry
                end
            end
        end
        nameplate:animate()
        if nameplateId then
            if not nameplateBitmapTags[nameplateId] then
                logger.debug("Invalid nameplate id: " .. nameplateId)
                return
            end
            nameplate.widgetDefinition.backgroundBitmap = nameplateBitmapTags[nameplateId].handle.value
            return
        end
        logger.debug("Loading nameplate from settings...")
        local settings = core.loadSettings()
        if settings and settings.nameplate and nameplateBitmapTags[settings.nameplate] then
            nameplate.widgetDefinition.backgroundBitmap = nameplateBitmapTags[settings.nameplate].handle.value
        end
    end
end

local widgetAnimationTimers = {}

---Animates UI elements by animating background bitmap
---@param widgetComponent uiComponent
---@param willRepeat? boolean
function interface.animateUIWidgetBackground(widgetComponent, willRepeat)
    if not widgetComponent.isBackgroundAnimated then
        return
    end

    if not core.getCurrentUIWidgetTag() then
        return
    end

    local widgetTagHandleValue = widgetComponent.handleValue
    local widget = engine.uiWidget.findWidgets(widgetTagHandleValue, nil, true)
    if widget and widget[1] then
        widget = widget[1]
    else
        return
    end

    local widgetTagEntry = engine.tag.getTagEntry(widgetTagHandleValue)
    local widgetTagData = engine.tag.getTagData(widgetTagHandleValue, "ui_widget_definition")
    assert(widgetTagEntry and widgetTagData, "Error, widget tag not found")

    local bitmapTagData = engine.tag.getTagData(widgetTagData.backgroundBitmap.tagHandle.value,
                                              "bitmap")
    if not bitmapTagData then
        return
    end
    --if bitmapTagData.bitmapData.count <= 1 then
    if #bitmapTagData.bitmaps <= 1 then
        return
    end

    -- Init timer state for this widget
    widgetAnimationTimers[widgetTagHandleValue] = widgetAnimationTimers[widgetTagHandleValue] or
                                                      {frame = 0, loop = 0}

    local timers = widgetAnimationTimers[widgetTagHandleValue]

    local frameDelay = widgetComponent.delayAnimationTicks or 0 -- ticks between frames
    local loopDelay = widgetComponent.animationWaitTicks or 0 -- ticks after full loop

    -- Handle per-frame delay
    if timers.frame < frameDelay then
        timers.frame = timers.frame + 1
        return
    end

    -- Reset frame timer when moving forward
    timers.frame = 0

    if widget.animationData.currentFrameIndex < #bitmapTagData.bitmaps - 1 then
        -- Normal frame advance
        widget.animationData.currentFrameIndex = widget.animationData.currentFrameIndex + 1
    else
        -- Last frame reached
        if widgetComponent.isBackgroundLooped then
            -- Apply loop delay separately
            if timers.loop < loopDelay then
                timers.loop = timers.loop + 1
                return
            end
            timers.loop = 0
            widget.animationData.currentFrameIndex = 0
        end
    end
end

---Show a dialog message on the screen
---@overload fun(props: {title: "WARNING" | "INFORMATION" | "ERROR" | string, subtitle: string, body: string, button?: string, cancel?: boolean, onConfirm?: function})
---@overload fun(titleText: "WARNING" | "INFORMATION" | "ERROR" | string, subtitleText: string, bodyText: string)
function interface.dialog(...)
    local args = {...}
    local cancel = false
    local titleText, subtitleText, bodyText, actionText = args[1], args[2], args[3], "OK"
    local onConfirm = nil
    if type(args[1]) == "table" then
        titleText = args[1].title
        subtitleText = args[1].subtitle
        bodyText = args[1].body
        actionText = args[1].button or "OK"
        cancel = args[1].cancel or false
        onConfirm = args[1].onConfirm
    end
    if constants.sounds then
        if titleText == "WARNING" or titleText == "ERROR" then
            logger.debug(constants.sounds.error.path)
            playSound(constants.sounds.error.handle.value)
        else
            playSound(constants.sounds.success.handle.value)
        end
    end
    local dialog = shared.dialog

    local title = component.new(dialog:get("title"))
    title:setText(titleText)

    local subtitle = component.new(dialog:get("subtitle"))
    subtitle:setText(subtitleText)

    local body = component.new(dialog:get("text"))
    body:setText(bodyText)

    local options = component.new(dialog:get("options"))
    local actionButton = button.new(options:get("ok"))
    actionButton:setText(actionText)

    if onConfirm then
        actionButton:onClick(function()
            return onConfirm()
        end)
    end

    if titleText == "ERROR" or cancel then
        openWidget(constants.widgets.dialog.handle.value, false)
    else
        openWidget(constants.widgets.dialog.handle.value, true)
    end
end

---Play a special interface sound
---@param sound "error" | "success" | "back" | "join" | "leave"
function interface.sound(sound)
    if not (constants.sounds.error and constants.sounds.success and constants.sounds.back and
        constants.sounds.join and constants.sounds.leave) then
        logger.debug("Error, no custom sounds found", "error")
        return
    end
    if sound == "error" then
        playSound(constants.sounds.error.handle.value)
    elseif sound == "success" then
        playSound(constants.sounds.success.handle.value)
    elseif sound == "back" then
        playSound(constants.sounds.back.handle.value)
    elseif sound == "join" then
        playSound(constants.sounds.join.handle.value)
    elseif sound == "leave" then
        playSound(constants.sounds.leave.handle.value)
    else
        logger.debug("Invalid sound: " .. sound, "error")
    end
end

---Blur UI background
---@param enable boolean
function interface.blur(enable)
    if enable then
        executeScript([[(begin
        (show_hud false)
        (cinematic_screen_effect_start true)
        (cinematic_screen_effect_set_convolution 2 2 1 2 0)
        (cinematic_screen_effect_start false)
    )]])
    else
        executeScript([[(begin
            (show_hud true)
            (cinematic_stop)
        )]])
    end
end

---Close current interface widget
---@param closeAllWidgets boolean
function interface.close(closeAllWidgets)
    if closeAllWidgets then
        while core.getCurrentUIWidgetTag() do
            engine.uiWidget.closeWidget()
        end
        return
    end
    engine.uiWidget.closeWidget()
    return
end

-- TODO Move this variable to a better global namespace
BipedRotation = 0
function interface.rotateCustomizationBiped()
    local mouse = core.getMouseState()

    if mouse.rightClick > 0 then
        local objectId = core.getCustomizationObjectId()
        if objectId then
            local object = blam.object(get_object(objectId))
            assert(object)
            BipedRotation = BipedRotation + mouse.right * 3
            if BipedRotation > 360 then
                BipedRotation = 0
            end
            blam.rotateObject(object, BipedRotation, 0, 0)
        end
    end
end

---Handle interface on tick events
function interface.onTick()
    local currentWidgetTag = core.getCurrentUIWidgetTag()
    if not currentWidgetTag then
        return
    end
    if constants.widgets.biped then
        if currentWidgetTag.handle.value == constants.widgets.biped.handle.value or currentWidgetTag.handle.value ==
            constants.widgets.bipedColor.handle.value then
            interface.rotateCustomizationBiped()
        end
    end
    -- Animate UI widgets
    for tagId, component in pairs(component.widgets) do
        -- Try to animate only widgets that are visible
        local widgetHandle = engine.uiWidget.findWidgets(tagId, nil, true)
        if widgetHandle and widgetHandle[1] and widgetHandle[1].visible and
            component.isBackgroundAnimated then
            interface.animateUIWidgetBackground(component)
        end
        -- if component.isBackgroundAnimated then
        --    interface.animateUIWidgetBackground(tagId)
        -- end
    end

    collectgarbage()
end

function interface.setup()
    local widgetTag = core.getCurrentUIWidgetTag()
    if widgetTag and engine.cacheFile.getLoadedCacheFileHeader().scenarioName == "ui" then
        -- Enable menu blur
        executeScript("menu_blur_on")

        -- Set network timeout to 5 seconds (keeps connection alive at loading huge maps)
        -- NOTE! This is meant to help server side loading time, not client side
        executeScript("network_connect_timeout 15000")
    end
end

---Fade screen in or out
---@param type "in" | "out"
---@param duration number
function interface.fade(type, duration)
    local type = type == "in" and "in" or "out"
    executeScript("fade_" .. type .. " 0 0 0 " .. duration)
end

---Set camera to a specific name
---@param cameraName string | "ui_camera" | "customization_lobby"
---@param ticks? number
function interface.camera(cameraName, ticks)
    local ticks = ticks or 0
    executeScript "camera_control 1"
    executeScript("camera_set " .. cameraName .. " " .. ticks)
end

---Set game bsp to a specific index
---@param bspIndex number
function interface.bsp(bspIndex)
    executeScript("switch_bsp " .. tostring(bspIndex))
end

---Set UI background to customization
---@param background "halo" | "multiplayer" | "customization"
function interface.setBackground(background)
    executeScript("object_destroy_containing customization")
    executeScript("object_destroy_containing prop")
    if background == "halo" then
        interface.bsp(0)
        interface.camera("ui_camera")
    elseif background == "multiplayer" then
        interface.camera("multiplayer")
        executeScript("object_destroy_containing customization")
        executeScript("object_destroy_containing prop")
    elseif background == "customization" then
        interface.bsp(1)
        interface.camera("customization_lobby")
        executeScript("object_create_containing prop")
    else
        logger.error("Error, invalid background: {}", background)
    end
end

---Set game in loading state
---@param isLoading boolean
---@param text? string
---@param blockInput? boolean
function interface.loading(isLoading, text, blockInput)
    local overlay = component.new(constants.widgets.overlay.handle.value)
    local loadingMenu = component.new(constants.widgets.loadingMenu.handle.value)
    local loadingLabel = component.new(loadingMenu:findChildWidgetTag("label").handle.value)
    local loadingSpinner = component.new(loadingMenu:findChildWidgetTag("orb").handle.value)
    loadingSpinner:animate()
    local loadingText = text or "Loading..."
    if isLoading then
        -- There is already another thread running, do not modify loading status
        if core.isThreadRunning() then
            return
        end
        component.blockInput(true)
        logger.debug("!!!LOADING!!!: {}", loadingText)
        if blockInput == false then
            -- TODO Show simpler loading text non overlay blocking
            component.blockInput(false)
            return
        end
        -- TODO Throw an error message if the overlay menu does not exist in current context
        loadingLabel:setText(loadingText)
        overlay:replace(constants.widgets.loadingMenu.handle.value)
        return
    else
        loadingMenu:replace(overlay.handleValue)
    end
    logger.debug("Restoring components input...")
    component.blockInput(false)
end

return interface
