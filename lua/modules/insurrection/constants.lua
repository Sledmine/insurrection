local constants = {}

constants.path = {
    pauseMenu = [[insurrection\ui\menus\pause\pause_menu]],
    nameplateCollection = [[insurrection\ui\shared\nameplates]],
    dialog = [[insurrection\ui\menus\dialog\dialog_menu]],
    customSounds = [[insurrection\sound\custom_sounds]],
    tester = [[insurrection\ui\menus\tester\tester_menu]]
}

constants.customColor = {
    black = "#141414",
    brown = "#413823",
    blue = "#001473",
    indigo = "#0051a7",
    green = "#117300",
    muddy_green = "#687434",
    mustard = "#918d09",
    rum = "#89642c",
    rust = "#8b3900",
    berry = "#8b0000",
    eggplant = "#a70069",
    purple = "#a70069"
}

constants.customColors = {
    {
        constants.customColor.black,
        "#323232", --charcoal
        "#787878", --gray
        "#c8c8c8", --silver
        "#ffffff", --white
    },
    {
        constants.customColor.brown,
        "#8c7a53", --pale brown
        "#7a7966", --ash
        "#a2a089", --sage
        "#d1d0c1", --misr
    },
    {
        constants.customColor.blue,
        "#303c8f", --cobalt
        "#5966ac", --deluge
        "#8493c8", --ice
        "#b0c0e4", --cerulean
    },
    {
        constants.customColor.indigo,
        "#2f79bc", --mariner
        "#57a3d1", --moonstone
        "#80cde6", --malibu
        "#abf8fc", --light cyan
    },
    {
        constants.customColor.green,
        "#18a20b", --grass
        "#40c937", --alien
        "#82ec7a", --algae
        "#b9f9b4", --pastel green
    },
    {
        constants.customColor.muddy_green,
        "#7a8932", --drab
        "#8f9e4d", --moss
        "#acbc6a", --olive
        "#ddf1a4", --caper
    },
    {
        constants.customColor.mustard,
        "#bfbf00", --bile
        "#eaea4d", --banana
        "#f7f79a", --buff
        "#ffffc7", --ecru
    },
    {
        constants.customColor.rum,
        "#b27e10", --gold
        "#eaae14", --bee
        "#f7bd44", --mango
        "#FCCB77", --chardonnay
    },
    {
        constants.customColor.rust,
        "#b14e00", --burnt
        "#e86600", --bamboo
        "#f78335", --tiger
        "#f9a37a", --peach
    },
    {
        constants.customColor.berry,
        "#b50000", --scarlet
        "#ea0000", --corsa
        "#f35d5d", --sunset
        "#ff8c8c", --geraldine
    },
    {
        constants.customColor.eggplant,
        "#ce0081", --red violet
        "#ff00a0", --cerise
        "#ff7eb9", --pink
        "#ffbad5", --candy
    },
    {
        constants.customColor.purple,
        "#462f6f", --meteorite
        "#8b70a5", --lilac
        "#d0a9f6", --violet
        "#e1cdf6", --lavender
    },
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

constants.customization = {
    rotation = {default = 133.144, left_shoulder = 80, right_shoulder = 190, arms = 80, gear = 0}
}

constants.widgets = {}

function constants.get()
    local blam = require "blam"
    local tagClasses = blam.tagClasses
    local findTag = blam.findTag
    local function findWidgetTag(partialName)
        return findTag(partialName, blam.tagClasses.uiWidgetDefinition)
    end
    local core = require "insurrection.core"

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
        biped = findWidgetTag("customization_biped\\customization_biped_menu"),
        browser = findWidgetTag("lobby_browser_menu"),
        legacyModalError = findWidgetTag("error_modal_fullscreen"),
        balltze = findWidgetTag("balltze\\balltze_mod_menu")
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
            chest = findTag("customization_chest_icons", tagClasses.bitmap),
            gear = findTag("customization_gear_icons", tagClasses.bitmap),
            legs = findTag("customization_legs_icons", tagClasses.bitmap)
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
    log("Loaded constants")
end

return constants
