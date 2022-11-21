local harmony = require "mods.harmony"
local components = require "insurrection.components"
local menus = require "insurrection.menus"
local checkbox = require "insurrection.components.checkbox"
local button = require "insurrection.components.button"
local list = require "insurrection.components.list"
local input = require "insurrection.components.input"
local translations = require "insurrection.translations"
local createBezierCurve = harmony.math.create_bezier_curve
local bezierCurve = harmony.math.get_bezier_curve_point
local openWidget = harmony.menu.open_widget
local reloadWidget = harmony.menu.reload_widget
local findWidgets = harmony.menu.find_widgets
local playSound = harmony.menu.play_sound
local blam = require "blam"
local actions = require "insurrection.redux.actions"
local core = require "insurrection.core"
local getWidgetString = core.getStringFromWidget
local setWidgetString = core.setStringToWidget
local glue = require "glue"
local split = glue.string.split
local starts = glue.string.starts
local ends = glue.string.ends
local unicodeStringTag = blam.unicodeStringList
local uiWidgetTag = blam.uiWidgetDefinition
local uiWidgetCollection = blam.uiWidgetCollection
local constants = require "insurrection.constants"
local isGameDedicated = blam.isGameDedicated
local chimera = require "insurrection.chimera"

local interface = {}

interface.shared = {}
local shared = interface.shared

function interface.load()
    components.free()
    constants.get()
    if script_type ~= "global" then
        interface.dialog("WARNING", "This script must be loaded as a global script.",
                         "Insurrection will move itself to the correct location, please reload the game.")
    end
    -- TODO Remove this hack
    IsUICompatible = true
    if IsUICompatible then
        if api.session.lobbyKey and map == "ui" then
            api.lobby(api.session.lobbyKey)
        end
        -- Start widgets background animation routine
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
        core.loadInsurrectionPatches()

        if map == "ui" then
            -- Change UI aspect ratio
            harmony.menu.set_aspect_ratio(16, 9)
            -- Execute basic Halo commands
            execute_script("menu_blur_on")
        else
            harmony.menu.set_aspect_ratio(4, 3)
        end

        interface.loadProfileNameplate()
        core.cleanAllEditableWidgets()

        -- interface.animate()
        -- Components initialization
        if constants.widgets.login then
            local login = components.new(constants.widgets.login.id)
            local usernameInput = button.new(login:findChildWidgetTag("username_input").id)
            local passwordInput = button.new(login:findChildWidgetTag("password_input").id)
            -- Load login data
            local savedUserName, savedPassword = core.loadCredentials()
            if savedUserName and savedPassword then
                usernameInput:setText(savedUserName)
                passwordInput:setText(savedPassword, "*")
            end
            local loginButton = button.new(login:findChildWidgetTag("login_button").id)
            loginButton:onClick(function()
                local username, password = usernameInput:getText(), passwordInput:getText()
                if username and password and username ~= "" and password ~= "" then
                    core.saveCredentials(username, password)
                    api.login(username, password)
                else
                    interface.dialog("WARNING", "", "Please enter a username and password.")
                end
            end)
            local registerButton = button.new(login:findChildWidgetTag("register_button").id)
            registerButton:onClick(function()
                interface.dialog("INFORMATION", "Join us on our Discord server!",
                                 "We have a Discord Bot to help with the registering process:\n\n\nhttps://discord.shadowmods.net")
            end)

            local dashboard = components.new(constants.widgets.dashboard.id)
            local createLobbyButton = button.new(
                                          dashboard:findChildWidgetTag("create_lobby_button").id)
            createLobbyButton:onClick(function()
                dprint("Create lobby button clicked")
                api.lobby()
            end)
            local joinLobbyButton = button.new(dashboard:findChildWidgetTag("join_lobby_button").id)
            local joinLobbyInput = input.new(dashboard:findChildWidgetTag("lobby_key_input").id)
            joinLobbyButton:onClick(function()
                local lobbyKey = joinLobbyInput:getText()
                if lobbyKey ~= "" then
                    api.lobby(lobbyKey)
                else
                    interface.dialog("WARNING", "", "Please specify a lobby key to join.")
                end
            end)

            dashboard:onOpen(function()
                api.stopRefreshLobby()
            end)

            local lobby = components.new(constants.widgets.lobby.id)
            local lobbyDefs = components.new(lobby:findChildWidgetTag("lobby_definitions").id)
            local lobbyDef1 = button.new(
                                  lobbyDefs:findChildWidgetTag("lobby_definition_button_1").id)
            local lobbyDef2 = button.new(
                                  lobbyDefs:findChildWidgetTag("lobby_definition_button_2").id)
            local lobbyDef3 = button.new(
                                  lobbyDefs:findChildWidgetTag("lobby_definition_button_3").id)
            local lobbyDef4 = button.new(
                                  lobbyDefs:findChildWidgetTag("lobby_definition_button_4").id)
            local lobbyElementsList = list.new(lobby:findChildWidgetTag("lobby_elements").id)
            local lobbyPlayers = list.new(lobby:findChildWidgetTag("lobby_players_nameplates").id)
            lobbyPlayers:scrollable(false)
            local lobbySearch = input.new(lobby:findChildWidgetTag("lobby_input_search").id)

            interface.shared.lobby = lobby
            interface.shared.lobbyDefs = lobbyDefs
            interface.shared.lobbyDef1 = lobbyDef1
            interface.shared.lobbyDef2 = lobbyDef2
            interface.shared.lobbyDef3 = lobbyDef3
            interface.shared.lobbyDef4 = lobbyDef4
            interface.shared.lobbyElementsList = lobbyElementsList
            interface.shared.lobbyPlayers = lobbyPlayers
            interface.shared.lobbySearch = lobbySearch

            lobby:onClose(function()
                api.stopRefreshLobby()
            end)

            local pause = components.new(constants.widgets.pause.id)
            pause:onClose(function()
                interface.blur(false)
            end)

            local tester = components.new(constants.widgets.tester.id)
            local testerButton = button.new(tester:findChildWidgetTag("test_1_button").id)
            testerButton:onClick(function()
                dprint("Tester button clicked")
            end)

            local testerAnimatedElement = components.new(tester:findChildWidgetTag("anim_test").id)
            testerAnimatedElement:animate()

            local testerCheckbox = checkbox.new(tester:findChildWidgetTag("test_checkbox_1").id)
            testerCheckbox:onToggle(function(value)
                dprint("Checkbox value: " .. tostring(value))
            end)

            local testerCheckbox2 = checkbox.new(tester:findChildWidgetTag("test_checkbox_2").id)
            testerCheckbox2:onToggle(function(value)
                dprint("Tester checkbox clicked")
                dprint(value)
            end)

            local customization = components.new(constants.widgets.customization.id)
            local nameplatesList = list.new(
                                       customization:findChildWidgetTag("customization_options").id,
                                       2, 10)
            local nameplatePreview = components.new(
                                         customization:findChildWidgetTag("nameplate_preview").id)
            nameplatePreview:animate()
            local saveCustomizationButton = button.new(
                                                customization:findChildWidgetTag(
                                                    "save_customization").id)
            nameplatesList:onSelect(function(item)
                nameplatePreview.widgetDefinition.backgroundBitmap = item.bitmap
            end)
            nameplatesList:setItems(glue.map(glue.keys(constants.nameplates), function(nameplateId)
                return {
                    label = "",
                    value = nameplateId,
                    bitmap = constants.nameplates[nameplateId].id
                }
            end))
            saveCustomizationButton:onClick(function()
                local selectedNameplateItem = nameplatesList:getSelectedItem() --[[@as string]]
                if selectedNameplateItem then
                    api.playerEditNameplate(selectedNameplateItem.value)
                end
            end)

            local dialog = components.new(constants.widgets.dialog.id)
            local dialogBackButton = button.new(dialog:findChildWidgetTag("dialog_back_button").id)
            dialogBackButton:onClick(function()
                if dialog.events.onClose then
                    dialog.events.onClose()
                end
            end)
            interface.shared.dialog = dialog

            -- Hard code settings description text change, because the game doesn't support it
            local settings = components.new(constants.widgets.settings.id)
            local settingsOptions =
                list.new(settings:findChildWidgetTag("settings_menu_options").id)
            -- TODO Add extended description widget support to lua-blam
            local settingsDescription = components.new(
                                            blam.findTag("settings_elements_description",
                                                         blam.tagClasses.uiWidgetDefinition).id)
            local settingsDescriptionText = components.new(
                                                settingsDescription:findChildWidgetTag(
                                                    "settings_elements_description_data").id)
            for i = 1, settingsOptions.widgetDefinition.childWidgetsCount do
                local childWidget = settingsOptions.widgetDefinition.childWidgets[i]
                local button = button.new(childWidget.widgetTag)
                button:onFocus(function()
                    settingsDescriptionText.widgetDefinition.stringListIndex = i - 1
                end)
            end
        end

        -- Insurrection is running outside the UI
        if constants.widgetCollections.multiplayer then
            local multiplayerWidgetsCollection = uiWidgetCollection(
                                                     constants.widgetCollections.multiplayer.id)
            if multiplayerWidgetsCollection then
                local pause = components.new(multiplayerWidgetsCollection.tagList[1])
                if pause then
                    if constants.widgets.pause then
                        harmony.menu.set_aspect_ratio(16, 9)
                        local insurrectionPause = components.new(constants.widgets.pause.id)
                        local resumeButton = button.new(
                                                 insurrectionPause:findChildWidgetTag(
                                                     "resume_game_button").id)
                        local exitButton = button.new(
                                               insurrectionPause:findChildWidgetTag("exit_button").id)
                        resumeButton:onClick(function()
                            dprint("Resume button clicked")
                            interface.blur(false)
                            interface.sound("back")
                        end)
                        exitButton:onClick(function()
                            api.deleteLobby()
                        end)
                        pause:onOpen(function()
                            if map ~= "ui" and (isGameDedicated() or DebugMode) then
                                dprint("Loading Insurrection UI in external map...")
                                interface.blur(true)
                                menus.pause()
                            end
                        end)
                        insurrectionPause:onClose(function()
                            interface.blur(false)
                        end)
                    end
                end

            end
        end
    end
    -- Workaround fix to prevent players from getting stuck in a game server at menu
    if map == "ui" then
        execute_script("disconnect")

        -- Set up some chimera configs
        local preferences = chimera.getPreferences()
        if preferences then
            local notServerIpBlocking = (not preferences.chimera_block_server_ip or
                                            preferences.chimera_block_server_ip == 0)
            if notServerIpBlocking then
                interface.shared.dialog:onClose(function()
                    preferences.chimera_block_server_ip = 1
                    chimera.savePreferences(preferences)
                    execute_script("quit")
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

        local settings = core.loadSettings()
        if settings and settings.nameplate and nameplateBitmapTags[settings.nameplate] then
            nameplate.widgetDefinition.backgroundBitmap = nameplateBitmapTags[settings.nameplate].id
        end
    end
end

---Animates UI elements by animating background bitmap
---@param widgetTagId number
function interface.animateUIWidgetBackground(widgetTagId)
    local isUIRendering = core.getRenderedUIWidgetTagId()
    if isUIRendering then
        local widgetRender = interface.getWidgetValues(widgetTagId)
        if widgetRender then
            local widgetBitmap = blam.bitmap(uiWidgetTag(widgetTagId).backgroundBitmap)
            if widgetBitmap then
                if widgetBitmap.bitmapsCount > 1 then
                    if widgetRender then
                        if widgetRender.background_bitmap_index < widgetBitmap.bitmapsCount then
                            interface.setWidgetValues(widgetTagId, {
                                background_bitmap_index = widgetRender.background_bitmap_index + 1
                            })
                        else
                            interface.setWidgetValues(widgetTagId, {background_bitmap_index = 0})
                        end
                    end
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
    if titleText == "WARNING" or titleText == "ERROR" then
        playSound(constants.sounds.error.path)
    else
        playSound(constants.sounds.success.path)
    end
    local dialog = uiWidgetTag(constants.widgets.dialog.id)
    local header = uiWidgetTag(dialog.childWidgets[1].widgetTag)
    local title = uiWidgetTag(header.childWidgets[1].widgetTag)
    local headerStrings = blam.unicodeStringList(title.unicodeStringListTag)
    local strings = headerStrings.stringList
    strings[1] = titleText
    strings[2] = subtitleText
    headerStrings.stringList = strings
    local body = uiWidgetTag(dialog.childWidgets[3].widgetTag)
    local bodyStrings = unicodeStringTag(body.unicodeStringListTag)
    local strings = bodyStrings.stringList
    strings[1] = bodyText
    bodyStrings.stringList = strings

    if titleText == "ERROR" then
        openWidget(constants.widgets.dialog.id, false)
    else
        openWidget(constants.widgets.dialog.id, true)
    end
end

---Play a special interface sound
---@param sound '"error"' | '"success"' | '"back"'
function interface.sound(sound)
    if sound == "error" then
        playSound(constants.sounds.error.id)
    elseif sound == "success" then
        playSound(constants.sounds.success.id)
    elseif sound == "back" then
        playSound(constants.sounds.back.id)
    else
        dprint("Invalid sound: " .. sound, "error")
    end
end

function interface.lobbyInit()
    local time = os.clock()
    ---@type interfaceState
    local state = store:getState()

    local isPlayerLobbyOwner = api.session.player and api.session.player.publicId ==
                                   state.lobby.owner

    local lobbyDef1 = shared.lobbyDef1
    local lobbyDef2 = shared.lobbyDef2
    local lobbyDef3 = shared.lobbyDef3
    local lobbyDef4 = shared.lobbyDef4
    local lobbyElementsList = shared.lobbyElementsList
    local lobbyPlayers = shared.lobbyPlayers
    local lobbySearch = shared.lobbySearch

    if not isPlayerLobbyOwner then
        core.setWidgetValues(lobbyElementsList.tagId, {opacity = 0})
        core.setWidgetValues(lobbySearch.tagId, {opacity = 0})
        core.setWidgetValues(lobbyDef4.tagId, {opacity = 0})
    end

    lobbyDef1:setText(state.lobby.template)
    lobbyDef2:setText(state.lobby.map)
    lobbyDef3:setText(state.lobby.gametype)

    if isPlayerLobbyOwner then
        lobbyElementsList:onSelect(function(item)
            item.value:setText(item.label)
            api.editLobby(api.session.lobbyKey, {
                template = lobbyDef1:getText(),
                map = lobbyDef2:getText(),
                gametype = lobbyDef3:getText()
            })
        end)

        lobbyDef1:onClick(function()
            ---@type interfaceState
            local state = store:getState()
            lobbyElementsList:setItems(glue.map(state.available.templates, function(element)
                return {label = element, value = lobbyDef1}
            end))
            store:dispatch(actions.setLobbyDefinition("template"))
        end)
        lobbyDef1.events.onClick()

        lobbyDef2:onClick(function()
            ---@type interfaceState
            local state = store:getState()
            lobbyElementsList:setItems(glue.map(state.available.maps, function(element)
                return {label = element, value = lobbyDef2}
            end))
            store:dispatch(actions.setLobbyDefinition("map"))
        end)

        lobbyDef3:onClick(function()
            ---@type interfaceState
            local state = store:getState()
            lobbyElementsList:setItems(glue.map(state.available.gametypes, function(element)
                return {label = element, value = lobbyDef3}
            end))
            store:dispatch(actions.setLobbyDefinition("gametype"))
        end)

        lobbyDef4:onClick(function()
            if isPlayerLobbyOwner then
                local template = lobbyDef1:getText()
                local map = lobbyDef2:getText()
                local gametype = lobbyDef3:getText()
                api.borrow(template:lower(), map, gametype:lower())
            else
                interface.dialog("WARNING", "", "You are not the owner of the lobby.")
            end
        end)

    end

    lobbyPlayers:setItems(glue.map(state.lobby.players, function(player)
        local nameplateTag = constants.nameplates[player.nameplate] or {}
        return {label = player.name, value = player, bitmap = nameplateTag.id}
    end))

    local definitionsToComponent = {template = lobbyDef1, map = lobbyDef2, gametype = lobbyDef3}
    lobbySearch:onInputText(function(text)
        ---@type interfaceState
        local state = store:getState()
        local definition = state.definition or "template"
        if definition then
            local filtered = {}
            for _, element in pairs(state.available[definition .. "s"]) do
                if element:lower():find(text:lower(), 1, true) then
                    table.insert(filtered, element)
                end
            end
            lobbyElementsList:setItems(glue.map(filtered, function(element)
                return {label = element, value = definitionsToComponent[definition]}
            end))
        end
    end)

    if renderedWidgetId then
        dprint(string.format("Interface update time: %.6f\n", os.clock() - time, "warning"))
    end
end

function interface.lobbyUpdate()
    ---@type interfaceState
    local state = store:getState()

    local lobbyDef1 = shared.lobbyDef1
    local lobbyDef2 = shared.lobbyDef2
    local lobbyDef3 = shared.lobbyDef3
    local lobbyPlayers = shared.lobbyPlayers

    local isPlayerLobbyOwner = api.session.player and api.session.player.publicId ==
                                   state.lobby.owner
    if not isPlayerLobbyOwner then
        lobbyDef1:setText(state.lobby.template)
        lobbyDef2:setText(state.lobby.map)
        lobbyDef3:setText(state.lobby.gametype)
    end

    lobbyPlayers:setItems(glue.map(state.lobby.players, function(player)
        local nameplateTag = constants.nameplates[player.nameplate] or {}
        return {label = player.name, value = player, bitmap = nameplateTag.id}
    end))
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

local bezierCurves = {
    ["ease in"] = createBezierCurve("ease in"),
    ["ease out"] = createBezierCurve("ease out")
}
---Setup an animation to apply to a widget
---@param targetWidgetTagId number Tag id of the target widget
---@param widgetContainerTagId number Tag id of the widget container
---@param duration number Duration of the animation in seconds
---@param property '"horizontal"' | '"vertical' | '"opacity"' | string Property to animate (e.g. "opacity")
---@param originalOffset number Original offset of the widget
---@param offset number Offset to apply to the widget
---@param bezier? '"ease in"' | '"ease out"' | string Bezier curve to use, e.g. "ease in"
---@param animateOn? '"show"' | '"focus"' | string Animation to apply to the widget, e.g. "show"
function interface.animation(targetWidgetTagId,
                             widgetContainerTagId,
                             duration,
                             property,
                             originalOffset,
                             offset,
                             bezier,
                             animateOn)
    local animationId = targetWidgetTagId .. widgetContainerTagId .. property
    WidgetAnimations[animationId] = {
        finished = false,
        widgetContainerTagId = widgetContainerTagId,
        targetWidgetTagId = targetWidgetTagId,
        timestamp = nil,
        animateOn = animateOn or "show",
        animate = function()
            local originalOffset = originalOffset
            local bezierCurveHandle = bezierCurves[bezier] or bezierCurves["ease in"]
            if not WidgetAnimations[animationId].timestamp then
                WidgetAnimations[animationId].timestamp = harmony.time.set_timestamp()
            end
            local elapsed = harmony.time.get_elapsed_milliseconds(
                                WidgetAnimations[animationId].timestamp) / 1000
            WidgetAnimations[animationId].elapsed = elapsed
            -- console_out(elapsed)
            -- console_out(duration)
            if (elapsed >= duration) then

                if property == "horizontal" then
                    interface.setWidgetValues(targetWidgetTagId, {left_bound = offset})
                elseif property == "vertical" then
                    interface.setWidgetValues(targetWidgetTagId, {top_bound = offset})
                else
                    interface.setWidgetValues(targetWidgetTagId, {opacity = offset})
                end

                WidgetAnimations[animationId].timestamp = nil
                WidgetAnimations[animationId].finished = true
                return
            end

            local widgetTag = blam.uiWidgetDefinition(widgetContainerTagId)
            if not originalOffset then
                for _, childWidget in pairs(widgetTag.childWidgets) do
                    if childWidget.widgetTag == targetWidgetTagId then
                        if property == "horizontal" then
                            originalOffset = childWidget.horizontalOffset
                        elseif property == "vertical" then
                            originalOffset = childWidget.verticalOffset
                        end
                    end
                end
            end
            local t = (elapsed / duration)
            local newPosition = bezierCurve(bezierCurveHandle, originalOffset, offset, t)
            if property == "horizontal" then
                interface.setWidgetValues(targetWidgetTagId, {left_bound = math.floor(newPosition)})
            elseif property == "vertical" then
                interface.setWidgetValues(targetWidgetTagId, {top_bound = math.floor(newPosition)})
            else
                interface.setWidgetValues(targetWidgetTagId, {opacity = newPosition})
            end
        end
    }
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

function interface.onInputText(widgetTagId, text)
    local component = components.widgets[widgetTagId]
    if component and component.events.onInputText then
        component.events.onInputText(text)
    end
end

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

return interface
