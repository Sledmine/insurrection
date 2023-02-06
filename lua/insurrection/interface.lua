local harmony = require "mods.harmony"
local components = require "insurrection.components"
local menus = require "insurrection.menus"
local checkbox = require "insurrection.components.checkbox"
local button = require "insurrection.components.button"
local list = require "insurrection.components.list"
local input = require "insurrection.components.input"
local translations = require "insurrection.translations"
local utils = require "insurrection.utils"
local color = require "color"
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
local chimera = require "insurrection.mods.chimera"

local interface = {}

interface.shared = {}
local shared = interface.shared

function interface.load()
    components.free()
    constants.get()
    if script_type ~= "global" then
        interface.dialog("WARNING", "This script must be loaded as a global script.",
                         "Please move it to the global scripts folder and restart the game.")
    end
    -- TODO Remove this hack
    IsUICompatible = true
    if IsUICompatible then
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
            local customizationColor = components.new(constants.widgets.color.id)
            local customizationColorListOptions = list.new(
                                                      customizationColor:findChildWidgetTag(
                                                          "options").id)
            local customizationColorListActions = list.new(
                                                      customizationColor:findChildWidgetTag(
                                                          "actions").id)
            local customizationColorSaveButton = button.new(
                                                      customizationColorListActions:findChildWidgetTag(
                                                          "save").id)
            openSettingsMenu = function()
                menus.open(constants.widgets.settings.id)
                return false
            end
            customizationColorSaveButton:onClick(function()
                set_timer(30, "openSettingsMenu")
            end)
            local colorButtons = customizationColorListOptions:getChildWidgetTags()
            updateColorMenu = function()
                for buttonIndex, tag in pairs(colorButtons) do
                    if buttonIndex > 1 and buttonIndex < #colorButtons - 1 then
                        local colorButton = button.new(tag.id)
                        local colorButtonText = button.new(
                                                    colorButton:findChildWidgetTag("_text").id)
                        local colorIcon = button.new(colorButton:findChildWidgetTag("_icon").id)
                        local colorName = blam.readUnicodeString(core.getWidgetValues(
                                                                     colorButtonText.tag.id).text,
                                                                 true):lower()

                        local colorValue = constants.color[colorName]
                        if colorValue then
                            local colorIndex = glue.index(constants.colors)[colorValue] - 1
                            core.setWidgetValues(colorIcon.tag.id,
                                                 {background_bitmap_index = colorIndex})
                            colorButton:onClick(function()
                                local colorValue = constants.color[colorName]
                                for objectIndex = 1, 2048 do
                                    local object = blam.getObject(objectIndex)
                                    if object and object.class == blam.objectClasses.scenery then
                                        local tag = blam.getTag(object.tagId)
                                        if tag and tag.path:find "cyborg" then
                                            local r, g, b = color.hexToDec(colorValue)
                                            object.colorCLowerRed = r
                                            object.colorCLowerGreen = g
                                            object.colorCLowerBlue = b
                                        end
                                    end
                                end
                            end)
                        end
                    else
                        local scrollButton = button.new(tag.id)
                        scrollButton:onClick(function()
                            set_timer(30, "updateColorMenu")
                        end)
                    end
                end
                return false
            end
            customizationColor:onOpen(function()
                set_timer(30, "updateColorMenu")
            end)

            local dialog = components.new(constants.widgets.dialog.id)
            local dialogBackButton = button.new(dialog:findChildWidgetTag("dialog_back_button").id)
            dialogBackButton:onClick(function()
                if dialog.events.onClose then
                    dialog.events.onClose()
                end
            end)
            interface.shared.dialog = dialog

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
            -- dialogBackButton:onClick(function()
            --    os.execute("start https://discord.shadowmods.net")
            --    dialogBackButton:onClick(nil)
            -- end)
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
                discord.updatePresence("Playing Insurrection", "In the dashboard")
            end)
            dashboard:onClose(function()
                api.stopRefreshLobby()
                discord.updatePresence("Playing Insurrection", "In the main menu")
            end)

            local lobby = components.new(constants.widgets.lobby.id)
            local lobbySummary = components.new(components.new(
                                                    lobby:findChildWidgetTag("summary").id):findChildWidgetTag(
                                                    "text").id)

            local lobbyOptions = components.new(lobby:findChildWidgetTag("options").id)
            local lobbyDefs = components.new(lobbyOptions:findChildWidgetTag("definitions").id)
            local lobbyDef1 = button.new(lobbyDefs:findChildWidgetTag("template").id)
            local lobbyDef2 = button.new(lobbyDefs:findChildWidgetTag("map").id)
            local lobbyDef3 = button.new(lobbyDefs:findChildWidgetTag("gametype").id)
            -- local lobbySettings = button.new(lobbyDefs:findChildWidgetTag("settings").id)

            local lobbyElementsList = list.new(lobbyOptions:findChildWidgetTag("elements").id)
            local lobbyMapsList = list.new(blam.findTag("lobby_maps",
                                                        blam.tagClasses.uiWidgetDefinition).id)
            local lobbySearch = input.new(lobbyOptions:findChildWidgetTag("search").id)
            local lobbyPlay = button.new(lobbyOptions:findChildWidgetTag("play").id)
            local lobbyBack = button.new(lobbyOptions:findChildWidgetTag("back").id)

            local lobbyPlayers = list.new(lobby:findChildWidgetTag("players").id)
            lobbyPlayers:scrollable(false)

            shared.lobby = lobby
            shared.lobbySummary = lobbySummary
            shared.lobbyDefs = lobbyDefs
            shared.lobbyDef1 = lobbyDef1
            shared.lobbyDef2 = lobbyDef2
            shared.lobbyDef3 = lobbyDef3
            -- shared.lobbySettings = lobbySettings
            shared.lobbyPlay = lobbyPlay
            shared.lobbyElementsList = lobbyElementsList
            shared.lobbyMapsList = lobbyMapsList
            shared.lobbyPlayers = lobbyPlayers
            shared.lobbySearch = lobbySearch

            lobby:onClose(function()
                api.deleteLobby()
            end)
            lobbyBack:onClick(function()
                lobby.events.onClose()
            end)

            local pause = components.new(constants.widgets.pause.id)
            pause:onClose(function()
                interface.blur(false)
            end)

            local tester = components.new(constants.widgets.tester.id)
            local testerAnimTest = components.new(tester:findChildWidgetTag("anim_test").id)
            testerAnimTest:animate()
            testerAnimTest:setAnimation(0.6, "horizontal", 100, 300, "ease in")

            local customization = components.new(constants.widgets.customization.id)

            local nameplatesList = list.new(
                                       customization:findChildWidgetTag("nameplates_options").id, 1,
                                       9)
            local nameplatePreview = components.new(
                                         blam.findTag("nameplate_preview",
                                                      blam.tagClasses.uiWidgetDefinition).id)
            nameplatePreview:animate()
            local saveCustomizationButton = button.new(
                                                customization:findChildWidgetTag(
                                                    "save_customization").id)
            nameplatesList:onSelect(function(item)
                nameplatePreview.widgetDefinition.backgroundBitmap = item.bitmap
            end)
            local sortedNameplates = glue.map(glue.keys(constants.nameplates), function(nameplateId)
                return {value = nameplateId, bitmap = constants.nameplates[nameplateId].id}
            end)
            table.sort(sortedNameplates, function(a, b)
                return a.value < b.value
            end)
            nameplatesList:setItems(sortedNameplates)

            local selectBipedsList = list.new(blam.findTag("select_bipeds",
                                                           blam.tagClasses.uiWidgetDefinition).id)
            local mapsList = list.new(selectBipedsList:findChildWidgetTag("select_map_biped").id)
            local bipedsList = list.new(
                                   selectBipedsList:findChildWidgetTag("select_custom_biped").id)
            local customizationTypesList = components.new(
                                               customization:findChildWidgetTag("types").id)
            local customizationNameplatesButton = button.new(
                                                      customizationTypesList:findChildWidgetTag(
                                                          "nameplates").id)
            customizationNameplatesButton:onClick(function()
                selectBipedsList:replace(nameplatesList.tagId)
            end)
            local customizationBipedsButton = button.new(
                                                  customizationTypesList:findChildWidgetTag("bipeds").id)
            customizationBipedsButton:onClick(function()
                nameplatesList:replace(selectBipedsList.tagId)
                ---@type interfaceState
                local state = store:getState()
                local maps = glue.keys(state.available.customization)
                mapsList:onSelect(function(item)
                    dprint("mapsList:onSelect")
                    bipedsList:setItems(glue.map(item.value, function(bipedPath)
                        return {label = utils.path(bipedPath).name, value = bipedPath}
                    end))
                end)
                mapsList:setItems(glue.map(maps, function(map)
                    return {label = map, value = state.available.customization[map]}
                end))
                bipedsList:setItems(glue.map(state.available.customization[maps[1]],
                                             function(bipedPath)
                    return {label = utils.path(bipedPath).name, value = bipedPath}
                end))
                bipedsList:onSelect(function(item)
                    dprint("bipedsList:onSelect")
                end)
            end)

            local settings = core.loadSettings()
            saveCustomizationButton:onClick(function()
                local selectedMapItem = mapsList:getSelectedItem()
                local selectedBipedItem = bipedsList:getSelectedItem()
                local currentNameplateId
                if settings and settings.nameplate then
                    currentNameplateId = settings.nameplate
                end
                local selectedNameplateItem = nameplatesList:getSelectedItem() or
                                                  {value = currentNameplateId}
                dprint("saveCustomizationButton:onClick")
                dprint(selectedMapItem)
                dprint(selectedBipedItem)
                local nameplate = selectedNameplateItem.value
                local bipeds
                if selectedNameplateItem then
                    nameplate = selectedNameplateItem.value
                end
                if selectedMapItem and selectedBipedItem then
                    bipeds = {[selectedMapItem.label] = selectedBipedItem.value}
                end
                api.playerProfileEdit({
                    nameplate = nameplate,
                    bipeds = bipeds
                })
            end)

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
            for i = 1, settingsOptions.widgetDefinition.childWidgetsCount - 1 do
                local childWidget = settingsOptions.widgetDefinition.childWidgets[i]
                local button = button.new(childWidget.widgetTag)
                button:onFocus(function()
                    settingsDescriptionText.widgetDefinition.stringListIndex = i - 1
                end)
            end
        end

        if constants.widgets.chimera then
            local chimeraMod = components.new(constants.widgets.chimera.id)
            local chimeraOptions = components.new(chimeraMod:findChildWidgetTag(
                                                      "chimera_mod_options").id)
            local checkboxes = {}
            local config = chimera.getConfiguration() or {}
            local preferences = chimera.getPreferences() or {}
            for i = 1, chimeraOptions.widgetDefinition.childWidgetsCount - 4 do
                local childWidget = chimeraOptions.widgetDefinition.childWidgets[i]
                local check = checkbox.new(childWidget.widgetTag)
                checkboxes[check:getText()] = check
                check:onToggle(function(value)
                    local optionName = check:getText()
                    local optionsToggle = {
                        ["USE VSYNC"] = function(value)
                            config.video_mode.vsync = value and 1 or 0
                            chimera.saveConfiguration(config)
                        end,
                        ["SHOW FPS"] = function(value)
                            preferences.chimera_show_fps = value and 1 or 0
                            chimera.executeCommand("chimera_show_fps " .. (value and 1 or 0))
                        end,
                        ["WINDOWED MODE"] = function(value)
                            config.video_mode.windowed = value and 1 or 0
                            chimera.saveConfiguration(config)
                        end,
                        ["BORDERLESS"] = function(value)
                            config.video_mode.borderless = value and 1 or 0
                            chimera.saveConfiguration(config)
                        end,
                        ["LOAD MAPS ON RAM"] = function(value)
                            config.memory.enable_map_memory_buffer = value and 1 or 0
                            chimera.saveConfiguration(config)
                            interface.dialog("INFORMATION",
                                             "You have changed a critical Chimera setting.",
                                             "You need to restart the game for the changes to take effect.")
                        end,
                        ["ANISOTROPIC FILTER"] = function(value)
                            preferences.chimera_af = value and 1 or 0
                            chimera.executeCommand("chimera_af " .. (value and 1 or 0))
                        end,
                        ["BLOCK BUFFERING"] = function(value)
                            preferences.chimera_block_buffering = value and 1 or 0
                            chimera.executeCommand("chimera_block_buffering " .. (value and 1 or 0))
                        end,
                        ["BLOCK HOLD F1 AT START"] = function(value)
                            preferences.chimera_block_hold_f1 = value and 1 or 0
                            chimera.executeCommand("chimera_block_hold_f1 " .. (value and 1 or 0))
                        end,
                        ["BLOCK LOADING SCREEN"] = function(value)
                            preferences.chimera_block_loading_screen = value and 1 or 0
                            chimera.executeCommand("chimera_block_loading_screen " ..
                                                       (value and 1 or 0))
                        end,
                        ["BLOCK ZOOM BLUR"] = function(value)
                            preferences.chimera_block_zoom_blur = value and 1 or 0
                            chimera.executeCommand("chimera_block_zoom_blur " .. (value and 1 or 0))
                        end,
                        ["BLOCK MOUSE ACCELERATION"] = function(value)
                            preferences.chimera_block_mouse_acceleration = value and 1 or 0
                            chimera.executeCommand("chimera_block_mouse_acceleration " ..
                                                       (value and 1 or 0))
                        end,
                        ["DEVMODE"] = function(value)
                            preferences.chimera_devmode = value and 1 or 0
                            chimera.executeCommand("chimera_devmode " .. (value and 1 or 0))
                        end,
                        ["SHOW BUDGET"] = function(value)
                            preferences.chimera_budget = value and 1 or 0
                            chimera.executeCommand("chimera_budget " .. (value and 1 or 0))
                        end
                    }
                    if optionsToggle[optionName] then
                        optionsToggle[optionName](value)
                    end
                end)
            end
            chimeraMod:onOpen(function()
                config = chimera.getConfiguration() or {}
                preferences = chimera.getPreferences() or {}
                dprint(preferences)
                local optionsMapping = {
                    ["USE VSYNC"] = config.video_mode.vsync,
                    ["SHOW FPS"] = preferences.chimera_show_fps,
                    ["WINDOWED MODE"] = config.video_mode.windowed,
                    ["BORDERLESS"] = config.video_mode.borderless,
                    ["LOAD MAPS ON RAM"] = config.memory.enable_map_memory_buffer,
                    ["ANISOTROPIC FILTER"] = preferences.chimera_af,
                    ["BLOCK BUFFERING"] = preferences.chimera_block_buffering,
                    ["BLOCK HOLD F1 AT START"] = preferences.chimera_block_hold_f1,
                    ["BLOCK LOADING SCREEN"] = preferences.chimera_block_loading_screen,
                    ["BLOCK ZOOM BLUR"] = preferences.chimera_block_zoom_blur,
                    ["BLOCK MOUSE ACCELERATION"] = preferences.chimera_block_mouse_acceleration,
                    ["DEVMODE"] = preferences.chimera_devmode,
                    ["SHOW BUDGET"] = preferences.chimera_budget
                }
                for k, check in pairs(checkboxes) do
                    check:setValue(optionsMapping[k] == 1)
                end
            end)
        end

        -- Insurrection is running outside the UI
        if constants.widgetCollections.multiplayer then
            local multiplayerWidgetsCollection = uiWidgetCollection(
                                                     constants.widgetCollections.multiplayer.id)
            if multiplayerWidgetsCollection then
                local pause = components.new(multiplayerWidgetsCollection.tagList[1])
                if pause then
                    if constants.widgets.pause then
                        dprint("Loading Insurrection UI in external map...")
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
                            if not InvalidatePauseOverride then
                                if map ~= "ui" and (isGameDedicated() or DebugMode) then
                                    dprint("Loading Insurrection UI in external map...")
                                    interface.blur(true)
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
                            InvalidatePauseOverride = true
                            menus.open(pause.tagId)
                        end)
                    end
                end

            end
        end
    end
    -- Workaround fix to prevent players from getting stuck in a game server at menu
    if map == "ui" then
        -- Set up some chimera configs
        local preferences = chimera.getPreferences()
        local notServerIpBlocking = (not preferences or not preferences.chimera_block_server_ip or
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
    if constants.sounds then
        if titleText == "WARNING" or titleText == "ERROR" then
            playSound(constants.sounds.error.path)
        else
            playSound(constants.sounds.success.path)
        end
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

    local summary = shared.lobbySummary
    local template = shared.lobbyDef1
    local map = shared.lobbyDef2
    local gametype = shared.lobbyDef3
    local play = shared.lobbyPlay
    local elementsList = shared.lobbyElementsList
    local mapsList = shared.lobbyMapsList
    local mapPreview = components.new(blam.findTag("map_small_preview",
                                                   blam.tagClasses.uiWidgetDefinition).id)
    local playersList = shared.lobbyPlayers
    local search = shared.lobbySearch
    summary:setText("Play with your friends, define your rules and enjoy.")

    if not isPlayerLobbyOwner then
        core.setWidgetValues(elementsList.tagId, {opacity = 0})
        core.setWidgetValues(search.tagId, {opacity = 0})
        core.setWidgetValues(play.tagId, {opacity = 0})
    end

    template:setText(state.lobby.template)
    map:setText(state.lobby.map)
    gametype:setText(state.lobby.gametype)

    if isPlayerLobbyOwner then
        elementsList:onSelect(function(item)
            item.value:setText(item.label)
            api.editLobby(api.session.lobbyKey, {
                template = template:getText(),
                map = map:getText(),
                gametype = gametype:getText()
            })
        end)
        mapsList:onSelect(function(item)
            item.value:setText(item.label)
            api.editLobby(api.session.lobbyKey, {
                template = template:getText(),
                map = map:getText(),
                gametype = gametype:getText()
            })
            local mapBitmapTag = blam.findTag(item.label:lower(), blam.tagClasses.bitmap)
            if mapBitmapTag then
                mapPreview.widgetDefinition.backgroundBitmap = mapBitmapTag.id
            else
                mapPreview.widgetDefinition.backgroundBitmap =
                    constants.bitmaps.unknownMapPreview.id
            end
        end)

        local definitionClick = function(lobbyDef, definition)
            search:setText("")
            ---@type interfaceState
            local state = store:getState()
            local component = elementsList
            if definition == "map" then
                component = mapsList
            end
            component:setItems(glue.map(state.available[definition .. "s"], function(element)
                return {label = element, value = lobbyDef}
            end))
            store:dispatch(actions.setLobbyDefinition(definition))
        end

        template:onClick(function()
            definitionClick(template, "template")
            mapsList:replace(elementsList.tagId)
        end)
        -- Force selection of template at start
        template.events.onClick()
        template:onFocus(function()
            summary:setText(
                "Template defines a set of changes to the base server that will be applied when the lobby is created.")
        end)

        map:onClick(function()
            definitionClick(map, "map")
            elementsList:replace(mapsList.tagId)
        end)
        map:onFocus(function()
            summary:setText(
                "Choose a map from the available list to play on, you need to have the map installed.")
        end)

        gametype:onClick(function()
            definitionClick(gametype, "gametype")
            mapsList:replace(elementsList.tagId)
        end)
        gametype:onFocus(function()
            summary:setText(
                "Game type defines the rules of the game, defines team play, scoring, etc.")
        end)

        play:onClick(function()
            if isPlayerLobbyOwner then
                local template = template:getText()
                local map = map:getText()
                local gametype = gametype:getText()
                api.borrow(template:lower(), map, gametype:lower())
            else
                interface.dialog("WARNING", "", "You are not the owner of the lobby.")
            end
        end)

    end

    playersList:setItems(glue.map(state.lobby.players, function(player)
        local nameplateTag = constants.nameplates[player.nameplate] or {}
        return {label = player.name, value = player, bitmap = nameplateTag.id}
    end))

    local definitionsToComponent = {template = template, map = map, gametype = gametype}
    search:onInputText(function(text)
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
            local component = elementsList
            if definition == "map" then
                component = mapsList
            end
            component:setItems(glue.map(filtered, function(element)
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
