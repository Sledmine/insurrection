local harmony = require "mods.harmony"
local components = require "insurrection.components"
local menus = require "insurrection.menus"
local checkbox = require "insurrection.components.checkbox"
local button = require "insurrection.components.button"
local list = require "insurrection.components.list"
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

local interface = {}

function interface.load()
    components.free()
    constants.get()
    -- TODO Remove this hack
    IsUICompatible = true
    if IsUICompatible then
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
            local username, password = core.loadCredentials()
            if username and password then
                usernameInput:setText(username)
                passwordInput:setText(password, "*")
            end
            local loginButton = button.new(login:findChildWidgetTag("login_button").id)
            loginButton:onClick(function()
                dprint("Login button clicked")
                api.login(usernameInput:getText(), passwordInput:getText())
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
            dashboard:onOpen(function()
                api.stopRefreshLobby()
            end)

            local lobby = components.new(constants.widgets.lobby.id)
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
            nameplatesList:onSelect(function(value)
                api.playerEditNameplate(value)
            end)
            -- nameplatesList:setItems({
            --    {label = "test",
            --    value = 1,
            --    bitmap = blam.tagCollection(constants.tagCollections.nameplates.id).tagList[1]}
            -- })
            nameplatesList:setItems(glue.map(blam.tagCollection(
                                                 constants.tagCollections.nameplates.id).tagList,
                                             function(tagId)
                local pathSplit = glue.string.split(blam.getTag(tagId).path, "\\")
                return {label = "", value = tonumber(pathSplit[#pathSplit]), bitmap = tagId}
            end))
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
                        resumeButton:onClick(function()
                            dprint("Resume button clicked")
                            interface.blur(false)
                            interface.sound("back")
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
    end
end

function interface.loadProfileNameplate(nameplateIndex)
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
            local nameplateNumber = tonumber(core.getTagName(tag.path))
            if nameplateNumber and not nameplateBitmapTags[nameplateNumber] then
                nameplateBitmapTags[nameplateNumber] = tag
            end
        end
        nameplate:animate()
        if nameplateIndex then
            if nameplateIndex > nameplatesTagCollection.count then
                dprint("Invalid nameplate index: " .. nameplateIndex, "warning")
                nameplateIndex = nameplatesTagCollection.count
            end
            nameplate.widgetDefinition.backgroundBitmap = nameplateBitmapTags[nameplateIndex].id
            return
        end

        local settings = core.loadSettings()
        if settings and settings.nameplate then
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

local lobbyDefinitions = {
    template = "lobby_definition_button_1",
    map = "lobby_definition_button_2",
    gametype = "lobby_definition_button_3"
}

--- Map selected button from the UI
---@param widgetTagId number
function interface.onButton(widgetTagId)
    local buttonPath = blam.getTag(widgetTagId).path
    ---@type interfaceState
    local state = store:getState()
    local isPlayerLobbyOwner = api.session.player and api.session.player.publicId ==
                                   state.lobby.owner
    if ends(buttonPath, "login_button") then
        local username = getWidgetString(findWidgetTag("username_input").id)
        local password = getWidgetString(findWidgetTag("password_input").id)
        if username and password and username ~= "" and password ~= "" then
            -- dprint("Login with username: " .. username .. " and password: " .. password)
            core.saveCredentials(username, password)
            api.login(username, password)
        else
            interface.dialog("WARNING", "", "Please enter a username and password.")
        end
    elseif ends(buttonPath, "register_button") then
        interface.dialog("INFORMATION", "Join us on our Discord server!",
                         "We have a Discord Bot to help with the registering process:\n\n\nhttps://discord.shadowmods.net")
    elseif ends(buttonPath, "create_lobby_button") then
        api.lobby()
    elseif ends(buttonPath, "join_lobby_button") then
        local lobbyKey = getWidgetString(findWidgetTag("lobby_key_input").id)
        if lobbyKey ~= "" then
            api.lobby(lobbyKey)
        else
            interface.dialog("WARNING", "", "Please specify a lobby key to join.")
        end
    elseif ends(buttonPath, "lobby_definition_button_1") then
        if isPlayerLobbyOwner then
            store:dispatch(actions.setLobbyDefinition("template"))
        end
    elseif ends(buttonPath, "lobby_definition_button_2") then
        if isPlayerLobbyOwner then
            store:dispatch(actions.setLobbyDefinition("map"))
        end
    elseif ends(buttonPath, "lobby_definition_button_3") then
        if isPlayerLobbyOwner then
            store:dispatch(actions.setLobbyDefinition("gametype"))
        end

    elseif ends(buttonPath, "lobby_definition_button_4") then
        if isPlayerLobbyOwner then
            local template = getWidgetString(findWidgetTag("lobby_definition_button_1").id)
            local map = getWidgetString(findWidgetTag("lobby_definition_button_2").id)
            local gametype = getWidgetString(findWidgetTag("lobby_definition_button_3").id)
            api.borrow(template:lower(), map, gametype:lower())
        else
            interface.dialog("WARNING", "", "You are not the owner of the lobby.")
        end
    elseif string.find(buttonPath, "lobby_element_button_") then
        if isPlayerLobbyOwner then
            local buttonIndex = tonumber(split(core.getTagName(buttonPath), "_")[4])
            if buttonIndex == 1 then
                store:dispatch(actions.scroll(true))
                return
            elseif buttonIndex == 6 then
                store:dispatch(actions.scroll())
                return
            end
            local value = getWidgetString(findWidgetTag("lobby_element_button_" .. buttonIndex).id)
            store:dispatch(actions.setSelected(value))
            api.editLobby(state.lobbyKey, {
                map = state.selected.map,
                gametype = state.selected.gametype,
                template = state.selected.template
            })
        end
    elseif ends(buttonPath, "\\customization_button") then
        interface.customization()
        store:dispatch(actions.clean())
        local filteredNameplateTagIds = glue.map(nameplatesBitmapTagIds, function(tagId)
            local bitmapTag = blam.getTag(tagId)
            local nameplateNumber = tonumber(core.getTagName(bitmapTag.path))
            if not glue.index(blockedNameplates)[nameplateNumber] then
                return tagId
            end
        end)
        store:dispatch(actions.setList(filteredNameplateTagIds, 7))
        if api.session and api.session.player.rank > 0 then
            store:dispatch(actions.setList(nameplatesBitmapTagIds, 7))
        end
        return true
    elseif string.find(buttonPath, "scroll_") then
        local scrollDirection = split(core.getTagName(buttonPath), "_")[2]
        if scrollDirection == "up" then
            store:dispatch(actions.scroll(true))
        elseif scrollDirection == "down" then
            store:dispatch(actions.scroll(false))
        end
    elseif string.find(buttonPath, "nameplate_button_") then
        local buttonIndex = tonumber(split(core.getTagName(buttonPath), "_")[3])
        ---@type interfaceState
        local state = store:getState()
        local bitmapTag = blam.getTag(state.displayed[buttonIndex])
        if bitmapTag then
            local nameplateNumber = tonumber(core.getTagName(bitmapTag.path))
            store:dispatch(actions.setSelectedItem(bitmapTag.id))
        end
    elseif ends(buttonPath, "save_customization_button") then
        ---@type interfaceState
        local state = store:getState()
        local nameplateNumber = tonumber(glue.index(nameplatesBitmapTagIds)[state.selected])
        if nameplateNumber then
            api.playerEditNameplate(nameplateNumber)
        end
    elseif ends(buttonPath, "resume_game_button") then
        interface.blur(false)
    end
end

function interface.update()
    local time = os.clock()
    ---@type interfaceState
    local state = store:getState()
    local renderedWidgetId = core.getRenderedUIWidgetTagId()
    if renderedWidgetId == constants.widgets.lobby.id then
        local lobbyWidget = uiWidgetTag(constants.widgets.lobby.id)
        local optionsWidget = uiWidgetTag(lobbyWidget.childWidgets[2].widgetTag)
        local definitionsWidget = uiWidgetTag(optionsWidget.childWidgets[1].widgetTag)
        local elementsWidget = uiWidgetTag(optionsWidget.childWidgets[2].widgetTag)
        local playersNameplates = uiWidgetTag(constants.widgets.lobbyPlayersNameplates.id)

        -- Update players in lobby
        for playerIndex = 1, 16 do
            interface.setWidgetValues(playersNameplates.childWidgets[playerIndex].widgetTag,
                                      {opacity = 0})
        end

        -- TODO Fix this, we need the current profile name, player does not exist yet
        local currentPlayerName = blam.player(get_player()).name:lower()
        for playerIndex, player in pairs(state.lobby.players) do
            local playerName = player.name
            if playerName ~= currentPlayerName then
                local nameplateWidgetTagId = playersNameplates.childWidgets[playerIndex].widgetTag
                -- Unhide nameplate overlay
                interface.setWidgetValues(nameplateWidgetTagId, {opacity = 1})
                -- Update nameplate background
                local nameplateWidgetDefinition = uiWidgetTag(nameplateWidgetTagId)
                -- nameplateWidgetDefinition.backgroundBitmap =
                --    nameplatesBitmapTagIds[player.nameplate]
                ---- Update nameplate overlay
                -- local overlayWidgetTagId = nameplateWidgetDefinition.childWidgets[1].widgetTag
                setWidgetString(playerName, overlayWidgetTagId)
            end
        end

        setWidgetString(state.selected.template, definitionsWidget.childWidgets[1].widgetTag)
        setWidgetString(state.selected.map, definitionsWidget.childWidgets[2].widgetTag)
        setWidgetString(state.selected.gametype, definitionsWidget.childWidgets[3].widgetTag)

        -- Restore normal list widget state
        local newChilds = elementsWidget.childWidgets
        newChilds[2].widgetTag = constants.widgets.lobbyElement2.id
        newChilds[3].widgetTag = constants.widgets.lobbyElement3.id
        newChilds[4].widgetTag = constants.widgets.lobbyElement4.id
        newChilds[5].widgetTag = constants.widgets.lobbyElement5.id
        elementsWidget.childWidgets = newChilds

        -- Apply modifications based on lua state
        local elements = state.displayed
        for childIndex = 2, 5 do
            childWidget = elementsWidget.childWidgets[childIndex]
            local elementIndex = childIndex - 1
            if elements[elementIndex] then
                setWidgetString(elements[elementIndex], childWidget.widgetTag)
            else
                newChilds[childIndex].widgetTag = 0xFFFFFFFF
            end
        end
        elementsWidget.childWidgets = newChilds

        -- Reload dynamically changed widgets from tags, effectively redrawing the UI
        local foundWidgets = findWidgets(optionsWidget.childWidgets[2].widgetTag, true)
        local widgetInstanceIndex = foundWidgets[1]
        if widgetInstanceIndex then
            reloadWidget(widgetInstanceIndex)
        end

        -- Hide elements widget if you are not the owner of the lobby
        if state.lobby.owner ~= api.session.player.publicId then
            -- Hide elements widget
            interface.setWidgetValues(optionsWidget.childWidgets[2].widgetTag, {opacity = 0})
            -- Hide search bar
            interface.setWidgetValues(optionsWidget.childWidgets[3].widgetTag, {opacity = 0})
        end
    elseif renderedWidgetId == constants.widgets.customization.id then
        local nameplatePreviewWidgetDef = uiWidgetTag(nameplatePreviewTag.id)
        if state.selected and glue.index(nameplatesBitmapTagIds)[state.selected] and
            nameplatePreviewWidgetDef then
            nameplatePreviewWidgetDef.backgroundBitmap = state.selected --[[@as number]]
        end
        local customizationMenuWidgetDef = uiWidgetTag(customizationWidgetTag.id)
        local optionsWidgetDef = uiWidgetTag(customizationMenuWidgetDef.childWidgets[2].widgetTag)
        for childIndex, childWidget in pairs(optionsWidgetDef.childWidgets) do
            local nameplateWidget = uiWidgetTag(childWidget.widgetTag)
            if starts(nameplateWidget.name, "nameplate_button") then
                local nameplateBitmapTagId = state.displayed[childIndex - 2]
                if nameplateBitmapTagId then
                    nameplateWidget.backgroundBitmap = nameplateBitmapTagId
                    interface.setWidgetValues(childWidget.widgetTag, {opacity = 1})
                else
                    interface.setWidgetValues(childWidget.widgetTag, {opacity = 0})
                end
            end
        end
    end
    if renderedWidgetId then
        dprint(string.format("Interface update time: %.6f\n", os.clock() - time, "warning"))
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
