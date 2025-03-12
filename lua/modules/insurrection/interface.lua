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

local interface = {}
interface.shared = {}

shared = interface.shared

function interface.load()
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

            local errorModalLegacy = components.new(constants.widgets.legacyModalError.id)
            errorModalLegacy:onOpen(function()
                log("Checking if lobby is active...")
                if api.session.lobbyKey and engine.map.getCurrentMapHeader().name == "ui" then
                    api.lobby(api.session.lobbyKey)
                end
            end)

            local pause = components.new(constants.widgets.pause.id)
            pause:onClose(function()
                interface.blur(false)
            end)

            -- TODO BALLTZE MIGRATE
            local tester = components.new(constants.widgets.tester.id)
            local testerAnimTest = components.new(tester:findChildWidgetTag("anim_test").id)
            testerAnimTest:animate()
            -- testerAnimTest:setAnimation(0.6, "horizontal", 100, 300, "ease in")
        end

        if constants.widgets.chimera then
            require "insurrection.components.dynamic.chimeraMenu"()
        end
        if constants.widgets.optic then
            require "insurrection.components.dynamic.opticMenu"()
        end
        if constants.widgets.balltze then
            require "insurrection.components.dynamic.balltzeMenu"()
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
                            else
                                balltze.features.setUIAspectRatio(4, 3)
                            end
                            InvalidatePauseOverride = false
                        end)
                        insurrectionPause:onClose(function()
                            interface.blur(false)
                            balltze.features.setUIAspectRatio(4, 3)
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
                        execute_script("quit")
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

---Animates UI elements by animating background bitmap
---@param widgetTagHandleValue number
---@param willRepeat? boolean
function interface.animateUIWidgetBackground(widgetTagHandleValue, willRepeat)
    -- local willRepeat = willRepeat or true
    local widget = engine.userInterface.findWidget(widgetTagHandleValue)
    if widget then
        local widgetTag = engine.tag.getTag(widgetTagHandleValue,
                                            engine.tag.classes.uiWidgetDefinition)
        -- TODO Change balltze to catch exceptions in timer as they propagate and crash the game
        assert(widgetTag, "Error, widget tag not found")
        -- print("Animating widget {}", widgetTag.path)
        local bitmapTag = engine.tag.getTag(widgetTag.data.backgroundBitmap.tagHandle.value,
                                            engine.tag.classes.bitmap)
        if bitmapTag then
            local bitmapTagData = bitmapTag.data
            if bitmapTagData.bitmapData.count > 1 then
                if widget.bitmapIndex < bitmapTagData.bitmapData.count then
                    widget.bitmapIndex = widget.bitmapIndex + 1
                else
                    widget.bitmapIndex = 0
                end
            end
        end
    end
end

---Show a dialog message on the screen
---@param titleText "WARNING" | "INFORMATION" | "ERROR" | string
---@param subtitleText string
---@param bodyText string
function interface.dialog(titleText, subtitleText, bodyText)
    if constants.sounds then
        if titleText == "WARNING" or titleText == "ERROR" then
            log(constants.sounds.error.path)
            playSound(constants.sounds.error.id)
        else
            playSound(constants.sounds.success.id)
        end
    end
    local dialog = shared.dialog

    local title = components.new(dialog:findChildWidgetTag("title").id)
    title:setText(titleText)

    local subtitle = components.new(dialog:findChildWidgetTag("subtitle").id)
    subtitle:setText(subtitleText)

    local body = components.new(dialog:findChildWidgetTag("text").id)
    body:setText(bodyText)

    if titleText == "ERROR" then
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
        execute_script([[(begin
        (show_hud false)
        (cinematic_screen_effect_start true)
        (cinematic_screen_effect_set_convolution 3 1 1 2 0)
        (cinematic_screen_effect_start false)
    )]])
    else
        execute_script([[(begin
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
    -- TODO Try to animate only widgets that are visible
    for tagId, component in pairs(components.widgets) do
        if component.isBackgroundAnimated then
            interface.animateUIWidgetBackground(tagId)
        end
    end
    -- Inventory protptype code
    -- if core.getMouseState().scrollClick > 0 then
    --    if focusedWidgetTagId then
    --        local widget = blam.uiWidgetDefinition(focusedWidgetTagId)
    --        console_out(widget.width .. " " .. widget.height)
    --        local x, y = core.getWidgetCursorPosition()
    --        -- console_out("X: " .. x .. " Y: " .. y)
    --        local props = core.getWidgetValues(focusedWidgetTagId)
    --        -- console_out("Focused widget: " .. focusedWidgetTagId .. " X: " .. props.left_bound .. " Y: " .. props.top_bound)
    --        core.setWidgetValues(focusedWidgetTagId, {left_bound = x - (widget.width / 2), top_bound = y - (widget.height / 2)})
    --    end
    -- end
end

function interface.changeAspectRatio()
    local widgetTag = core.getCurrentUIWidgetTag()
    if widgetTag then
        if widgetTag.data.bounds.right > 640 then
            -- Change UI aspect ratio
            log("Setting UI aspect ratio to 16:9")
            balltze.features.setUIAspectRatio(16, 9)
        end
        -- Enable menu blur
        execute_script("menu_blur_on")

        -- Set network timeout to 5 seconds (keeps connection alive at loading huge maps)
        -- NOTE! This is meant to help server side loading time, not client side
        execute_script("network_connect_timeout 15000")
    else
        balltze.features.setUIAspectRatio(4, 3)
    end
end

---Fade screen in or out
---@param type "in" | "out"
---@param duration number
function interface.fade(type, duration)
    local type = type == "in" and "in" or "out"
    execute_script("fade_" .. type .. " 0 0 0 " .. duration)
end

return interface
