local balltze = Balltze
local engine = Engine
local openWidget = engine.userInterface.openWidget
local playSound = engine.userInterface.playSound
local components = require "insurrection.components"
local menus = require "insurrection.menus"
local button = require "insurrection.components.button"
local translations = require "insurrection.translations"
local blam = require "blam"
local core = require "insurrection.core"
local uiWidgetTag = blam.uiWidgetDefinition
local uiWidgetCollection = blam.uiWidgetCollection
local constants = require "insurrection.constants"
local chimera = require "insurrection.mods.chimera"
local executeScript = engine.hsc.executeScript

local interface = {}
interface.shared = {}

shared = interface.shared

function interface.load()
    -- Unload all required packages from Lua modules
    for moduleName in pairs(package.loaded or {}) do
        if moduleName:startswith("insurrection.components.dynamic") then
            print("Unloading module: " .. moduleName)
            package.loaded[moduleName] = nil
        end
    end
    components.free()
    -- constants.get()
    IsUICompatible = true
    -- local scenery = engine.tag.findTags("halo", engine.tag.classes.scenery)[1]
    -- assert(scenery, "Error, no scenery tag found")
    -- engine.core.consolePrint("{}", tostring(inspect(table.keys(scenery.data))))
    if IsUICompatible then

        -- Load Insurrection features
        log("Loading Insurrection patches...")
        core.loadInsurrectionPatches()

        -- Components initialization
        log("Initializing components...")
        interface.loadProfileNameplate()
        components.cleanAllEditableWidgets()

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

            local pause = components.new(constants.widgets.pause.id)
            pause:onClose(function()
                interface.blur(false)
            end)

            -- TODO BALLTZE MIGRATE
            local tester = components.new(constants.widgets.tester.id)
            local testerAnimTest = components.new(tester:findChildWidgetTag("anim_test").id)
            testerAnimTest:animate()
            -- testerAnimTest:setAnimation(0.6, "horizontal", 100, 300, "ease in")

            -- Most likely this means we are getting back from the map itself
            -- Rejoin previous lobby if it exists
            if api.session.lobbyKey and engine.map.getCurrentMapHeader().name == "ui" then
                api.lobby(api.session.lobbyKey)
            end

            -- local errorModalLegacy = components.new(constants.widgets.legacyModalError.id)
            -- errorModalLegacy:onOpen(function()
            --    logger:warning("Checking if lobby is active {}", api.session.lobbyKey)
            --    if api.session.lobbyKey and engine.map.getCurrentMapHeader().name == "ui" then
            --        api.lobby(api.session.lobbyKey)
            --    end
            -- end)
        end
        require "insurrection.components.dynamic.videoMenuCustom"()
        require "insurrection.components.dynamic.audioMenuCustom"()

        -- Insurrection is running outside the UI
        if constants.widgetCollections.multiplayer then
            local multiplayerWidgetsCollection = uiWidgetCollection(
                                                     constants.widgetCollections.multiplayer.id)
            if multiplayerWidgetsCollection then
                local pause = components.new(multiplayerWidgetsCollection.tagList[1])
                if pause then
                    log(multiplayerWidgetsCollection.tagList[1])
                    if constants.widgets.pause then
                        log("Insurrection may load in external map...")
                        require "insurrection.components.dynamic.dialog"()
                        local insurrectionPause = components.new(constants.widgets.pause.id)
                        local resumeButton = button.new(
                                                 insurrectionPause:findChildWidgetTag(
                                                     "resume_game_button").id)
                        local stockResumeButton = button.new(pause:findChildWidgetTag("resume").id)
                        local exitButton = button.new(
                                               insurrectionPause:findChildWidgetTag("exit_button").id)
                        resumeButton:onClick(function()
                            log("Resume button clicked")
                            interface.blur(false)
                            interface.sound("back")
                        end)
                        stockResumeButton:onClick(function()
                            log("Stock resume button clicked")
                            interface.sound("back")
                        end)
                        exitButton:onClick(function()
                            api.deleteLobby()
                        end)
                        local insurrectionChooseTeam = components.new(constants.widgets.team.id)
                        local blueTeamButton = button.new(
                                                   insurrectionChooseTeam:findChildWidgetTag(
                                                       "blue_team_button").id)
                        local redTeamButton = button.new(
                                                  insurrectionChooseTeam:findChildWidgetTag(
                                                      "red_team_button").id)
                        blueTeamButton:onClick(function()
                            interface.blur(false)
                        end)
                        redTeamButton:onClick(function()
                            interface.blur(false)
                        end)
                        pause:onOpen(function()
                            log("Opening stock pause menu...")
                            if not InvalidatePauseOverride then
                                -- if engine.map.getCurrentMapHeader().name ~= "ui" and (engine.netgame.getServerType() == "dedicated" or DebugMode) then
                                if engine.map.getCurrentMapHeader().name ~= "ui" then
                                    log("Opening Insurrection pause menu...")
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
                        local openMapPauseButton = button.new(
                                                       insurrectionPause:findChildWidgetTag(
                                                           "open_map_pause").id)
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
        if engine.map.getCurrentMapHeader().name == "ui" and false then
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
        log("Error, no nameplates collection found")
        return
    end
    local nameplate = components.new(constants.widgets.nameplate.id)
    local nameplatesTagCollection = blam.tagCollection(constants.tagCollections.nameplates.id)
    if nameplatesTagCollection then
        local nameplateBitmapTags = {}
        for _, tagId in ipairs(nameplatesTagCollection.tagList) do
            local tag = blam.getTag(tagId) --[[@as tag]]
            local nameplateId = core.getTagName(tag.path)
            if nameplateId and not nameplateBitmapTags[nameplateId] then
                nameplateBitmapTags[nameplateId] = tag
            end
        end
        nameplate:animate()
        if nameplateId then
            if not nameplateBitmapTags[nameplateId] then
                log("Invalid nameplate id: " .. nameplateId)
                return
            end
            nameplate.widgetDefinition.backgroundBitmap = nameplateBitmapTags[nameplateId].id
            return
        end
        log("Loading nameplate from settings...")
        local settings = core.loadSettings()
        if settings and settings.nameplate and nameplateBitmapTags[settings.nameplate] then
            nameplate.widgetDefinition.backgroundBitmap = nameplateBitmapTags[settings.nameplate].id
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

    local widgetTagHandleValue = widgetComponent.tagId
    local widget = engine.userInterface.findWidget(widgetTagHandleValue)
    if not widget then
        return
    end

    local widgetTag = engine.tag.getTag(widgetTagHandleValue, engine.tag.classes.uiWidgetDefinition)
    assert(widgetTag, "Error, widget tag not found")

    local bitmapTag = engine.tag.getTag(widgetTag.data.backgroundBitmap.tagHandle.value,
                                        engine.tag.classes.bitmap)
    if not bitmapTag then
        return
    end

    local bitmapTagData = bitmapTag.data
    if bitmapTagData.bitmapData.count <= 1 then
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

    if widget.bitmapIndex < bitmapTagData.bitmapData.count - 1 then
        -- Normal frame advance
        widget.bitmapIndex = widget.bitmapIndex + 1
    else
        -- Last frame reached
        if widgetComponent.isBackgroundLooped then
            -- Apply loop delay separately
            if timers.loop < loopDelay then
                timers.loop = timers.loop + 1
                return
            end
            timers.loop = 0
            widget.bitmapIndex = 0
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
            log(constants.sounds.error.path)
            playSound(constants.sounds.error.id)
        else
            playSound(constants.sounds.success.id)
        end
    end
    local dialog = shared.dialog

    local title = components.new(dialog:get("title"))
    title:setText(titleText)

    local subtitle = components.new(dialog:get("subtitle"))
    subtitle:setText(subtitleText)

    local body = components.new(dialog:get("text"))
    body:setText(bodyText)

    local options = components.new(dialog:get("options"))
    local actionButton = button.new(options:get("ok"))
    actionButton:setText(actionText)

    if onConfirm then
        actionButton:onClick(function()
            return onConfirm()
        end)
    end

    if titleText == "ERROR" or cancel then
        openWidget(constants.widgets.dialog.id, false)
    else
        openWidget(constants.widgets.dialog.id, true)
    end
end

---Play a special interface sound
---@param sound "error" | "success" | "back" | "join" | "leave"
function interface.sound(sound)
    if not (constants.sounds.error and constants.sounds.success and constants.sounds.back and
        constants.sounds.join and constants.sounds.leave) then
        log("Error, no custom sounds found", "error")
        return
    end
    if sound == "error" then
        playSound(constants.sounds.error.id)
    elseif sound == "success" then
        playSound(constants.sounds.success.id)
    elseif sound == "back" then
        playSound(constants.sounds.back.id)
    elseif sound == "join" then
        playSound(constants.sounds.join.id)
    elseif sound == "leave" then
        playSound(constants.sounds.leave.id)
    else
        log("Invalid sound: " .. sound, "error")
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
            engine.userInterface.closeWidget()
        end
        return
    end
    engine.userInterface.closeWidget()
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
        if currentWidgetTag.id == constants.widgets.biped.id or currentWidgetTag.id ==
            constants.widgets.bipedColor.id then
            interface.rotateCustomizationBiped()
        end
    end
    -- Animate UI widgets
    for tagId, component in pairs(components.widgets) do
        -- Try to animate only widgets that are visible
        local widgetHandle = engine.userInterface.findWidget(tagId)
        if widgetHandle and widgetHandle.visible and component.isBackgroundAnimated then
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
    if widgetTag and engine.map.getCurrentMapHeader().name == "ui" then
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
        logger:error("Error, invalid background: {}", background)
    end
end

return interface
