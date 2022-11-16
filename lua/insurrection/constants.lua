local blam = require "blam"
local tagClasses = blam.tagClasses
local findTag = blam.findTag
local function findWidgetTag(partialName)
    return findTag(partialName, blam.tagClasses.uiWidgetDefinition)
end

local constants = {}

-- Common tags
-- Get tags before using them to improve performance
-- Menus
--[[local dialogWidgetTag = findWidgetTag("dialog_menu")
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
}]]

function constants.get()
    constants.widgets = {
        --[[
        The following widgets are not used by the game, but are used by the
        Insurrection mod. They are included here for completeness.
    ]]
        dialog = findWidgetTag("dialog_menu"),
        login = findWidgetTag("login_menu"),
        lobby = findWidgetTag("lobby_menu"),
        dashboard = findWidgetTag("dashboard\\dashboard_menu"),
        customization = findWidgetTag("customization_menu"),
        pause = findWidgetTag("pause\\pause_menu"),
        nameplate = findWidgetTag("shared\\current_profile"),
        -- TODO Rename to lobby_search_input
        lobbySearchInput = findWidgetTag("lobby_input_search"),
        lobbyPlayersNameplates = findWidgetTag("lobby_players_nameplates"),
        lobbyElement2 = findWidgetTag("lobby_element_button_2"),
        lobbyElement3 = findWidgetTag("lobby_element_button_3"),
        lobbyElement4 = findWidgetTag("lobby_element_button_4"),
        lobbyElement5 = findWidgetTag("lobby_element_button_5"),
        tester = findWidgetTag("tester_menu"),
    }

    constants.sounds = {
        error = findTag("flag_failure", tagClasses.sound),
        back = findTag("back", tagClasses.sound),
        success = findTag("forward", tagClasses.sound)
    }

    constants.tagCollections = {nameplates = findTag("nameplates", tagClasses.tagCollection)}

    constants.widgetCollections = {
        multiplayer = findTag("ui\\shell\\multiplayer", tagClasses.uiWidgetCollection)
    }
end

return constants
