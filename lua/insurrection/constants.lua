local blam = require "blam"
local tagClasses = blam.tagClasses
local findTag = blam.findTag
local function findWidgetTag(partialName)
    return findTag(partialName, blam.tagClasses.uiWidgetDefinition)
end
local core = require "insurrection.core"

local constants = {}

constants.path = {
    pauseMenu = [[insurrection\ui\menus\pause\pause_menu]],
    nameplateCollection = [[insurrection\ui\shared\nameplates]],
    dialog = [[insurrection\ui\menus\dialog\dialog_menu]],
    customSounds = [[insurrection\sound\custom_sounds]],
    tester = [[insurrection\ui\menus\tester\tester_menu]]
}

constants.color = {
    white = "#FFFFFF",
    black = "#000000",
    red = "#FE0000",
    blue = "#0201E3",
    gray = "#707E71",
    yellow = "#FFFF01",
    green = "#00FF01",
    pink = "#FF56B9",
    purple = "#AB10F4",
    cyan = "#01FFFF",
    cobalt = "#6493ED",
    orange = "#FF7F00",
    teal = "#1ECC91",
    sage = "#006401",
    brown = "#603814",
    tan = "#C69C6C",
    maroon = "#9D0B0E",
    salmon = "#F5999E"
}

constants.colors = {
    constants.color.white,
    constants.color.black,
    constants.color.red,
    constants.color.blue,
    constants.color.gray,
    constants.color.yellow,
    constants.color.green,
    constants.color.pink,
    constants.color.purple,
    constants.color.cyan,
    constants.color.cobalt,
    constants.color.orange,
    constants.color.teal,
    constants.color.sage,
    constants.color.brown,
    constants.color.tan,
    constants.color.maroon,
    constants.color.salmon
}

constants.customization = {rotation = {default = 133.144, left_shoulder = 80, right_shoulder = 190}}

function constants.get()
    constants.widgets = {
        --[[
        The following widgets are not used by the game, but are used by Insurrection.
        They are gathered here for later use.
        Ideally, we only want root widgets, so we can search for nested widgets later.
    ]]
        intro = findWidgetTag("intro\\intro_menu"),
        main = findWidgetTag("main\\main_menu"),
        dialog = findWidgetTag("dialog\\dialog_menu"),
        login = findWidgetTag("login_menu"),
        lobby = findWidgetTag("lobby_menu"),
        lobbyClient = findWidgetTag("lobby_client_menu"),
        dashboard = findWidgetTag("dashboard\\dashboard_menu"),
        customization = findWidgetTag("customization_menu"),
        pause = findWidgetTag("pause\\pause_menu"),
        nameplate = findWidgetTag("nameplate_current_profile"),
        tester = findWidgetTag("tester_menu"),
        settings = findWidgetTag("settings\\settings_menu"),
        chimera = findWidgetTag("chimera\\chimera_mod_menu"),
        color = findWidgetTag("customization_color_menu"),
        team = findWidgetTag("pause_choose_team_menu"),
        optic = findWidgetTag("optic\\optic_mod_menu"),
        biped = findWidgetTag("customization_biped\\customization_biped_menu")
    }

    constants.sounds = {
        error = findTag("flag_failure", tagClasses.sound),
        back = findTag("back", tagClasses.sound),
        success = findTag("forward", tagClasses.sound),
        join = findTag("player_join", tagClasses.sound),
        leave = findTag("player_leave", tagClasses.sound)
    }

    constants.tagCollections = {
        nameplates = findTag("nameplates", tagClasses.tagCollection),
        maps = findTag("insurrection_maps", tagClasses.tagCollection)
    }

    constants.widgetCollections = {
        multiplayer = findTag("ui\\shell\\multiplayer", tagClasses.uiWidgetCollection)
    }

    if constants.tagCollections.nameplates then
        local nameplatesTagCollection = blam.tagCollection(constants.tagCollections.nameplates.id)
        if nameplatesTagCollection then
            ---@type table<string, tag>
            local nameplateBitmapTags = {}
            for _, tagId in ipairs(nameplatesTagCollection.tagList) do
                local tag = blam.getTag(tagId) --[[@as tag]]
                local nameplateId = core.getTagName(tag.path)
                if nameplateId and not nameplateBitmapTags[nameplateId] then
                    nameplateBitmapTags[nameplateId] = tag
                end
            end
            constants.nameplates = nameplateBitmapTags
        end
    end

    constants.bitmaps = {
        unknownMapPreview = findTag("unknown_map_preview", tagClasses.bitmap),
        customization = {
            left_shoulder = findTag("customization_left_shoulder_icons", tagClasses.bitmap),
            right_shoulder = findTag("customization_right_shoulder_icons", tagClasses.bitmap),
            regions = findTag("customization_icons", tagClasses.bitmap),
            helmet = findTag("customization_helmet_icons", tagClasses.bitmap),
            chest = findTag("customization_chest_icons", tagClasses.bitmap)
        }
    }
    local fontName = "geogrotesque-regular-"
    constants.fonts = {
        text = findTag(fontName .. "text", tagClasses.font),
        title = findTag(fontName .. "title", tagClasses.font),
        subtitle = findTag(fontName .. "subtitle", tagClasses.font),
        button = findTag(fontName .. "button", tagClasses.font),
        shadow = findTag(fontName .. "shadow", tagClasses.font)
    }
end

return constants
