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
    dialog = [[insurrection\ui\menus\dialog\dialog_menu]]
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

function constants.get()
    constants.widgets = {
        --[[
        The following widgets are not used by the game, but are used by Insurrection.
        They are gathered here for later use.
        Ideally, we only want root widgets, so we can search for nested widgets later.
    ]]
        intro = findWidgetTag("intro\\intro_menu"),
        main = findWidgetTag("main_menu"),
        dialog = findWidgetTag("dialog\\dialog_menu"),
        login = findWidgetTag("login_menu"),
        lobby = findWidgetTag("lobby_menu"),
        dashboard = findWidgetTag("dashboard\\dashboard_menu"),
        customization = findWidgetTag("customization_menu"),
        pause = findWidgetTag("pause\\pause_menu"),
        nameplate = findWidgetTag("shared\\current_profile"),
        tester = findWidgetTag("tester_menu"),
        settings = findWidgetTag("settings\\settings_menu"),
        chimera = findWidgetTag("chimera\\chimera_mod_menu"),
        color = findWidgetTag("customization_color_menu"),
        team = findWidgetTag("pause_choose_team_menu")
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

    if constants.tagCollections.nameplates then
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
            constants.nameplates = nameplateBitmapTags
        end
    end

    constants.bitmaps = {unknownMapPreview = findTag("unknown_map_preview", tagClasses.bitmap)}
    constants.fonts = {
        text = findTag("text", tagClasses.font),
        title = findTag("title", tagClasses.font),
        subtitle = findTag("subtitle", tagClasses.font),
        button = findTag("button", tagClasses.font)
    }
end

return constants
