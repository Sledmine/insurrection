local harmony = require "mods.harmony"
local chimera = require "insurrection.chimera"
local components = require "insurrection.components"
local createBezierCurve = harmony.math.create_bezier_curve
local bezierCurve = harmony.math.get_bezier_curve_point
local openWidget = harmony.menu.open_widget
local reloadWidget = harmony.menu.reload_widget
local findWidgets = harmony.menu.find_widgets
local playSound = harmony.menu.play_sound
local blam = require "blam"
local findTag = blam.findTag
local actions = require "insurrection.redux.actions"
local core = require "insurrection.core"
local getWidgetString = core.getStringFromWidget
local setWidgetString = core.setStringToWidget
local glue = require "glue"
local split = glue.string.split
local starts = glue.string.starts
local ends = glue.string.ends
local append = glue.append
local unicodeStringTag = blam.unicodeStringList
local uiWidgetTag = blam.uiWidgetDefinition

local function findWidgetTag(partialName)
    return findTag(partialName, blam.tagClasses.uiWidgetDefinition)
end

local interface = {}
-- Common tags
-- Get tags before using them to improve performance
-- Menus
local dialogWidgetTag = findWidgetTag("dialog_menu")
local lobbyWidgetTag = findWidgetTag("lobby_menu")
local dashboardWidgetTag = findWidgetTag("dashboard_menu")
local customizationWidgetTag = findWidgetTag("customization_menu")
local pauseMenuWidgetTag = findWidgetTag("pause\\pause_menu")
-- Sounds
local errorSoundTag = findTag("flag_failure", blam.tagClasses.sound)
local sucessSoundTag = findTag("forward", blam.tagClasses.sound)
-- Lobby elements
lobbyElement2Tag = findWidgetTag("lobby_element_button_2")
lobbyElement3Tag = findWidgetTag("lobby_element_button_3")
lobbyElement4Tag = findWidgetTag("lobby_element_button_4")
lobbyElement5Tag = findWidgetTag("lobby_element_button_5")
lobbyPlayersNameplatesTag = findWidgetTag("lobby_players_nameplates")
-- Input elements
usernameInputTag = findWidgetTag("username_input")
passwordInputTag = findWidgetTag("password_input")
-- General UI Elements
local nameplateTag = findWidgetTag("shared\\current_profile")
local blockedNameplates = {22, 23, 27, 29, 35}
local nameplateBitmapTags = blam.findTagsList("nameplates\\", blam.tagClasses.bitmap)
local nameplatesBitmapTagIds = {}
for _, tag in ipairs(nameplateBitmapTags) do
    local nameplateNumber = tonumber(core.getTagName(tag.path))
    if nameplateNumber and not nameplatesBitmapTagIds[nameplateNumber] then
        nameplatesBitmapTagIds[nameplateNumber] = tag.id
    end
end
local nameplatePreviewTag = findWidgetTag("nameplate_preview")

interface.widgets = {
    lobbyWidgetTag = lobbyWidgetTag,
    dashboardWidgetTag = dashboardWidgetTag,
    usernameInputTag = usernameInputTag,
    passwordInputTag = passwordInputTag,
    customizationWidgetTag = customizationWidgetTag,
    pauseMenuWidgetTag = pauseMenuWidgetTag
}

function interface.load()
    -- Load Insurrection features
    if (core.loadInsurrectionPatches()) then

        dialogWidgetTag = findWidgetTag("dialog_menu")
        lobbyWidgetTag = findWidgetTag("lobby_menu")
        dashboardWidgetTag = findWidgetTag("dashboard_menu")
        customizationWidgetTag = findWidgetTag("customization_menu")
        pauseMenuWidgetTag = findWidgetTag("pause\\pause_menu")
        -- Sounds
        errorSoundTag = findTag("flag_failure", blam.tagClasses.sound)
        sucessSoundTag = findTag("forward", blam.tagClasses.sound)
        -- Lobby elements
        lobbyElement2Tag = findWidgetTag("lobby_element_button_2")
        lobbyElement3Tag = findWidgetTag("lobby_element_button_3")
        lobbyElement4Tag = findWidgetTag("lobby_element_button_4")
        lobbyElement5Tag = findWidgetTag("lobby_element_button_5")
        lobbyPlayersNameplatesTag = findWidgetTag("lobby_players_nameplates")
        -- Input elements
        usernameInputTag = findWidgetTag("username_input")
        passwordInputTag = findWidgetTag("password_input")
        -- General UI Elements
        nameplateTag = findWidgetTag("shared\\current_profile")
        blockedNameplates = {22, 23, 27, 29, 35}
        nameplateBitmapTags = blam.findTagsList("nameplates\\", blam.tagClasses.bitmap)
        nameplatesBitmapTagIds = {}
        for _, tag in ipairs(nameplateBitmapTags) do
            local nameplateNumber = tonumber(core.getTagName(tag.path))
            if nameplateNumber and not nameplatesBitmapTagIds[nameplateNumber] then
                nameplatesBitmapTagIds[nameplateNumber] = tag.id
            end
        end
        nameplatePreviewTag = findWidgetTag("nameplate_preview")

        interface.widgets = {
            lobbyWidgetTag = lobbyWidgetTag,
            dashboardWidgetTag = dashboardWidgetTag,
            usernameInputTag = usernameInputTag,
            passwordInputTag = passwordInputTag,
            customizationWidgetTag = customizationWidgetTag,
            pauseMenuWidgetTag = pauseMenuWidgetTag
        }
        
        local usernameInput = components:new(usernameInputTag.id)
        usernameInput:onClick(function()
            console_out("Username input clicked")
        end)
        
        usernameInput:onFocus(function()
            console_out("Username input focused")
        end)

        -- Change aspect ratio
        harmony.menu.set_aspect_ratio(16, 9)

        -- Execute basic Halo commands
        execute_script("menu_blur_on")

        IsUICompatible = true

        interface.loadProfileNameplate()
        core.cleanAllEditableWidgets()

        interface.animate()

        -- Load login data
        local username, password = core.loadCredentials()
        if username and password then
            core.setStringToWidget(username, interface.widgets.usernameInputTag.id)
            core.setStringToWidget(password, interface.widgets.passwordInputTag.id, "*")
        end
    end
    -- Workaround fix to prevent players from getting stuck in a game server at menu
    if map == "ui" then
        execute_script("disconnect")
    end
end

function interface.loadProfileNameplate(nameplateIndex)
    local nameplate = uiWidgetTag(nameplateTag.id)
    if nameplateIndex then
        if nameplateIndex > #nameplatesBitmapTagIds then
            dprint("Invalid nameplate index: " .. nameplateIndex, "warning")
            nameplateIndex = #nameplatesBitmapTagIds
        end
        nameplate.backgroundBitmap = nameplatesBitmapTagIds[nameplateIndex]
        return
    end
    local settings = core.loadSettings()
    if settings and settings.nameplate then
        nameplate.backgroundBitmap = nameplatesBitmapTagIds[settings.nameplate]
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

--- Animates player nameplates, including profile nameplate
function interface.animateNameplates()
    if core.getCurrentUIWidgetTag() then
        interface.animateUIWidgetBackground(nameplateTag.id)
        local lobbyPlayersNameplatesWidgetTag = uiWidgetTag(lobbyPlayersNameplatesTag.id)
        if lobbyPlayersNameplatesWidgetTag then
            for widgetIndex, childWidget in pairs(lobbyPlayersNameplatesWidgetTag.childWidgets) do
                interface.animateUIWidgetBackground(childWidget.widgetTag)
            end
            local customizationMenuWidgetDef = uiWidgetTag(customizationWidgetTag.id)
            local optionsCustomizationWidgetDef = uiWidgetTag(
                                                      customizationMenuWidgetDef.childWidgets[2]
                                                          .widgetTag)
            for widgetIndex, childWidget in pairs(optionsCustomizationWidgetDef.childWidgets) do
                local nameplateWidgetDef = uiWidgetTag(childWidget.widgetTag)
                if starts(nameplateWidgetDef.name, "nameplate_button") then
                    interface.animateUIWidgetBackground(childWidget.widgetTag)
                end
            end
            interface.animateUIWidgetBackground(nameplatePreviewTag.id)
        end
    end
end

---Show a dialog message on the screen
---@param titleText '"WARNING"' | '"INFORMATION"' | '"ERROR"' | string
---@param subtitleText string
---@param bodyText string
function interface.dialog(titleText, subtitleText, bodyText)
    if errorSoundTag and sucessSoundTag then
        if titleText == "WARNING" or titleText == "ERROR" then
            playSound(errorSoundTag.path)
        else
            playSound(sucessSoundTag.path)
        end
    end
    local dialog = uiWidgetTag(dialogWidgetTag.id)
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
        openWidget(dialogWidgetTag.id, false)
    else
        openWidget(dialogWidgetTag.id, true)
    end
end

---Play a special interface sound
---@param sound '"error"'
function interface.sound(sound)
    if sound == "error" then
        playSound(errorSoundTag.path)
    end
end

function interface.lobby(force)
    openWidget(lobbyWidgetTag.id, true)
end

local lobbyDefinitions = {
    template = "lobby_definition_button_1",
    map = "lobby_definition_button_2",
    gametype = "lobby_definition_button_3"
}

function interface.customization()
    openWidget(customizationWidgetTag.id, true)
end

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
            api.editLobby(state.lobbyKey, {map = state.selected.map, gametype = state.selected.gametype, template = state.selected.template})
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
    if renderedWidgetId == lobbyWidgetTag.id then
        local lobbyWidget = uiWidgetTag(lobbyWidgetTag.id)
        local optionsWidget = uiWidgetTag(lobbyWidget.childWidgets[2].widgetTag)
        local definitionsWidget = uiWidgetTag(optionsWidget.childWidgets[1].widgetTag)
        local elementsWidget = uiWidgetTag(optionsWidget.childWidgets[2].widgetTag)
        local playersNameplates = uiWidgetTag(lobbyPlayersNameplatesTag.id)

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
                nameplateWidgetDefinition.backgroundBitmap =
                    nameplatesBitmapTagIds[player.nameplate]
                -- Update nameplate overlay
                local overlayWidgetTagId = nameplateWidgetDefinition.childWidgets[1].widgetTag
                setWidgetString(playerName, overlayWidgetTagId)
            end
        end

        setWidgetString(state.selected.template, definitionsWidget.childWidgets[1].widgetTag)
        setWidgetString(state.selected.map, definitionsWidget.childWidgets[2].widgetTag)
        setWidgetString(state.selected.gametype, definitionsWidget.childWidgets[3].widgetTag)

        -- Restore normal list widget state
        local newChilds = elementsWidget.childWidgets
        newChilds[2].widgetTag = lobbyElement2Tag.id
        newChilds[3].widgetTag = lobbyElement3Tag.id
        newChilds[4].widgetTag = lobbyElement4Tag.id
        newChilds[5].widgetTag = lobbyElement5Tag.id
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

        -- Hide elements widget if no are not the owner of the lobby
        if state.lobby.owner ~= api.session.player.publicId then
            -- Hide elements widget
            interface.setWidgetValues(optionsWidget.childWidgets[2].widgetTag, {opacity = 0})
            -- Hide search bar
            interface.setWidgetValues(optionsWidget.childWidgets[3].widgetTag, {opacity = 0})
        end
    elseif renderedWidgetId == customizationWidgetTag.id then
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

function interface.dashboard()
    openWidget(dashboardWidgetTag.id, true)
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
    local widget = blam.uiWidgetDefinition(widgetTagId)
    if widget.name == "lobby_search_input" then
        -- dprint("Searching for: " .. text)
        store:dispatch(actions.updateLobby(nil, nil, text))
    end
end

function interface.pauseMenu()
    openWidget(pauseMenuWidgetTag.id, false)
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
