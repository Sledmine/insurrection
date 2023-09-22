local harmony = require "mods.harmony"
local components = require "insurrection.components"
local menus = require "insurrection.menus"
local checkbox = require "insurrection.components.checkbox"
local button = require "insurrection.components.button"
local list = require "insurrection.components.list"
local translations = require "insurrection.translations"
local utils = require "insurrection.utils"

local openWidget = harmony.menu.open_widget
local playSound = harmony.menu.play_sound
local blam = require "blam"
local actions = require "insurrection.redux.actions"
local core = require "insurrection.core"
local unicodeStringTag = blam.unicodeStringList
local uiWidgetTag = blam.uiWidgetDefinition
local uiWidgetCollection = blam.uiWidgetCollection
local constants = require "insurrection.constants"
local isGameDedicated = blam.isGameDedicated
local chimera = require "insurrection.mods.chimera"

local interface = {}
interface.shared = {}

shared = interface.shared

function interface.load()
    components.free()
    constants.get()
    if script_type ~= "global" then
        interface.dialog("WARNING", "This script must be loaded as a global script.",
                         "Please move it to the global scripts folder and restart the game.")
    end
    IsUICompatible = true
    if IsUICompatible then

        dprint("Overriding Chimera font...")
        chimera.fontOverride()

        dprint("Checking if lobby is active...")
        if api.session.lobbyKey and map == "ui" then
            api.lobby(api.session.lobbyKey)
        end
        -- Start widgets background animation
        dprint("Starting widgets background animation...")
        if BitmapsAnimationTimerId then
            stop_timer(BitmapsAnimationTimerId)
        end
        function On30FPSRate()
            for tagId, component in pairs(components.widgets) do
                if component.isBackgroundAnimated then
                    interface.animateUIWidgetBackground(tagId)
                end
            end
        end
        BitmapsAnimationTimerId = set_timer(33, "On30FPSRate")

        -- Load Insurrection features
        dprint("Loading Insurrection patches...")
        core.loadInsurrectionPatches()

        -- Components initialization
        dprint("Initializing components...")
        interface.loadProfileNameplate()
        core.cleanAllEditableWidgets()

        -- interface.animate()
        if constants.widgets.login then
            require "insurrection.components.dynamic.dialog"()
            require "insurrection.components.dynamic.customizationColorMenu"()
            require "insurrection.components.dynamic.settingsMenu"()
            require "insurrection.components.dynamic.loginMenu"()
            require "insurrection.components.dynamic.dashboardMenu"()
            require "insurrection.components.dynamic.customizationMenu"()
            require "insurrection.components.dynamic.lobbyMenu"()
            require "insurrection.components.dynamic.customizationBipedMenu"()

            local pause = components.new(constants.widgets.pause.id)
            pause:onClose(function()
                interface.blur(false)
            end)

            local tester = components.new(constants.widgets.tester.id)
            local testerAnimTest = components.new(tester:findChildWidgetTag("anim_test").id)
            testerAnimTest:animate()
            testerAnimTest:setAnimation(0.6, "horizontal", 100, 300, "ease in")
        end

        if constants.widgets.chimera then
            require "insurrection.components.dynamic.chimeraMenu"()
        end
        if constants.widgets.optic then
            require "insurrection.components.dynamic.opticMenu"()
        end

        -- Insurrection is running outside the UI
        if constants.widgetCollections.multiplayer then
            local multiplayerWidgetsCollection = uiWidgetCollection(
                                                     constants.widgetCollections.multiplayer.id)
            if multiplayerWidgetsCollection then
                local pause = components.new(multiplayerWidgetsCollection.tagList[1])
                if pause then
                    if constants.widgets.pause then
                        require "insurrection.components.dynamic.dialog"()
                        dprint("Loading Insurrection UI in external map...")
                        local insurrectionPause = components.new(constants.widgets.pause.id)
                        local resumeButton = button.new(
                                                 insurrectionPause:findChildWidgetTag(
                                                     "resume_game_button").id)
                        local stockResumeButton = button.new(pause:findChildWidgetTag("resume").id)
                        local exitButton = button.new(
                                               insurrectionPause:findChildWidgetTag("exit_button").id)
                        resumeButton:onClick(function()
                            dprint("Resume button clicked")
                            interface.blur(false)
                            interface.sound("back")
                        end)
                        stockResumeButton:onClick(function()
                            dprint("Stock resume button clicked")
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
                            if not InvalidatePauseOverride then
                                if map ~= "ui" and (isGameDedicated() or DebugMode) then
                                    dprint("Loading Insurrection UI in external map...")
                                    interface.blur(true)
                                    harmony.menu.set_aspect_ratio(16, 9)
                                    menus.pause()
                                end
                            else
                                harmony.menu.set_aspect_ratio(4, 3)
                            end
                            InvalidatePauseOverride = false
                        end)
                        insurrectionPause:onClose(function()
                            interface.blur(false)
                            harmony.menu.set_aspect_ratio(4, 3)
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
        if map == "ui" then
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
        dprint("Error, no nameplates collection found", "error")
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
                dprint("Invalid nameplate id: " .. nameplateId, "warning")
                return
            end
            nameplate.widgetDefinition.backgroundBitmap = nameplateBitmapTags[nameplateId].id
            return
        end
        dprint("Loading nameplate from settings...")
        local settings = core.loadSettings()
        if settings and settings.nameplate and nameplateBitmapTags[settings.nameplate] then
            nameplate.widgetDefinition.backgroundBitmap = nameplateBitmapTags[settings.nameplate].id
        end
    end
end

---Animates UI elements by animating background bitmap
---@param widgetTagId number
function interface.animateUIWidgetBackground(widgetTagId, willRepeat)
    local willRepeat = willRepeat or true
    local newValues
    local isUIRendering = core.getRenderedUIWidgetTagId()
    if isUIRendering then
        local widgetValues = interface.getWidgetValues(widgetTagId)
        if widgetValues then
            local widgetBitmap = blam.bitmap(uiWidgetTag(widgetTagId).backgroundBitmap)
            if widgetBitmap then
                if widgetBitmap.bitmapsCount > 1 then
                    newValues = {background_bitmap_index = 0}
                    if widgetValues.background_bitmap_index < widgetBitmap.bitmapsCount then
                        newValues.background_bitmap_index = widgetValues.background_bitmap_index + 1
                    else
                        newValues.background_bitmap_index = 0
                    end
                    interface.setWidgetValues(widgetTagId, newValues)
                end
            end
        end
    end
end

---Show a dialog message on the screen
---@param titleText '"WARNING"' | '"INFORMATION"' | '"ERROR"' | string
---@param subtitleText string
---@param bodyText string
function interface.dialog(titleText, subtitleText, bodyText)
    if constants.sounds then
        if titleText == "WARNING" or titleText == "ERROR" then
            playSound(constants.sounds.error.path)
        else
            playSound(constants.sounds.success.path)
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
---@param sound '"error"' | '"success"' | '"back"' | '"join"' | '"leave"'
function interface.sound(sound)
    if constants.sounds.error and constants.sounds.success and constants.sounds.back and
        constants.sounds.join and constants.sounds.leave then
        dprint("Sounds not found", "error")
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
        dprint("Invalid sound: " .. sound, "error")
    end
end

function interface.getWidgetValues(widgetTagId)
    local sucess, widgetInstanceId = pcall(harmony.menu.find_widgets, widgetTagId)
    if sucess and widgetInstanceId then
        return harmony.menu.get_widget_values(widgetInstanceId)
    end
end

function interface.setWidgetValues(widgetTagId, values)
    local sucess, widgetInstanceId = pcall(harmony.menu.find_widgets, widgetTagId)
    if sucess and widgetInstanceId then
        harmony.menu.set_widget_values(widgetInstanceId, values);
    end
end

function interface.animate()
    local introMenuWidgetTag = blam.findTag([[ui\shell\main_menu]],
                                            blam.tagClasses.uiWidgetDefinition)
    local introMenuWidget = blam.uiWidgetDefinition(introMenuWidgetTag.id)
    local mainMenuWidgetTag = blam.findTag([[menus\main\main_menu]],
                                           blam.tagClasses.uiWidgetDefinition)
    local mainMenuWidget = blam.uiWidgetDefinition(mainMenuWidgetTag.id)
    local mainMenuList = blam.uiWidgetDefinition(mainMenuWidget.childWidgets[2].widgetTag)

    local containerId = mainMenuWidgetTag.id
    local widgetToAnimateId = mainMenuWidget.childWidgets[1].widgetTag
    local initial = introMenuWidget.childWidgets[1].verticalOffset
    local final = mainMenuWidget.childWidgets[1].verticalOffset

    interface.animation(introMenuWidget.childWidgets[1].widgetTag, introMenuWidgetTag.id, 0.2,
                        "vertical", final, initial, "ease out", "show")
    -- Animate the main menu widget
    interface.animation(widgetToAnimateId, containerId, 0.2, "vertical", initial, final, "ease out")
    for _, childWidget in pairs(mainMenuList.childWidgets) do
        -- Animate the main menu list widget
        interface.animation(childWidget.widgetTag, containerId, _ * 0.08, "horizontal",
                            childWidget.horizontalOffset - 50, childWidget.horizontalOffset,
                            "ease in", "show")
        interface.animation(childWidget.widgetTag, containerId, _ * 0.08, "opacity", 0, 1)
    end
    local dialogContainer = blam.uiWidgetDefinition(dialogWidgetTag.id)
    interface.animation(dialogWidgetTag.id, dialogWidgetTag.id, 0.2, "opacity", 0, 1)
end

--- Reset widgets animation data
function interface.animationsReset(widgetTagId)
    for _, animation in pairs(WidgetAnimations) do
        if animation.widgetContainerTagId == widgetTagId then
            animation.timestamp = nil
            animation.finished = false
        end
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
            harmony.menu.close_widget()
        end
        return
    end
    harmony.menu.close_widget()
    return
end


local bipedRotation = 0

---Handle interface on tick events
function interface.onTick()
    local currentWidgetTag = core.getCurrentUIWidgetTag()
    if not currentWidgetTag then
        return
    end
    if currentWidgetTag.id == constants.widgets.biped.id then
        local mouse = core.getMouseState()

        if mouse.rightClick > 0 then
            local objectId = core.getCustomizationObjectId()
            if objectId then
                bipedRotation = bipedRotation + mouse.right * 3
                if bipedRotation > 360 then
                    bipedRotation = 0
                end
                blam.rotateObject(objectId, bipedRotation, 0, 0)
            end
        end
    end
end

return interface
