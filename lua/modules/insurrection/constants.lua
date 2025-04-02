local constants = {}

local engine = Engine

constants.path = {
    pauseMenu = [[insurrection\ui\menus\pause\pause_menu]],
    nameplateCollection = [[insurrection\ui\shared\nameplates]],
    dialog = [[insurrection\ui\menus\dialog\dialog_menu]],
    customSounds = [[insurrection\sound\custom_sounds]],
    tester = [[insurrection\ui\menus\tester\tester_menu]],
    christmasHat = [[insurrection\hats\christmas\christmas_hat]],
    xmasObjects = [[insurrection\scenery\season\xmas\xmas_objects]]
}

constants.customColor = {
    black = "#141414",
    charcoal = "#323232",
    gray = "#787878",
    silver = "#c8c8c8",
    white = "#ffffff",
    --
    brown = "#413823",
    paleBrown = "#8c7a53",
    ash = "#7a7966",
    sage = "#a2a089",
    misr = "#d1d0c1",
    --
    blue = "#001473",
    cobalt = "#303c8f",
    deluge = "#5966ac",
    ice = "#8493c8",
    cerulean = "#b0c0e4",
    --
    indigo = "#0051a7",
    mariner = "#2f79bc",
    moonstone = "#57a3d1",
    malibu = "#80cde6",
    lightCyan = "#abf8fc",
    --
    green = "#117300",
    grass = "#18a20b",
    alien = "#40c937",
    algae = "#82ec7a",
    pastelGreen = "#b9f9b4",
    --
    muddyGreen = "#687434",
    drab = "#7a8932",
    moss = "#8f9e4d",
    olive = "#acbc6a",
    caper = "#ddf1a4",
    --
    mustard = "#918d09",
    bile = "#bfbf00",
    banana = "#eaea4d",
    buff = "#f7f79a",
    ecru = "#ffffc7",
    --
    rum = "#89642c",
    gold = "#b27e10",
    bee = "#eaae14",
    mango = "#f7bd44",
    chardonnay = "#FCCB77",
    --
    rust = "#8b3900",
    burnt = "#b14e00",
    bamboo = "#e86600",
    tiger = "#f78335",
    peach = "#f9a37a",
    --
    berry = "#8b0000",
    scarlet = "#b50000",
    corsa = "#ea0000",
    sunset = "#f35d5d",
    geraldine = "#ff8c8c",
    --
    eggplant = "#a70069",
    redViolet = "#ce0081",
    cerise = "#ff00a0",
    pink = "#ff7eb9",
    candy = "#ffbad5",
    --
    purple = "#321861",
    meteorite = "#462f6f",
    lilac = "#8b70a5",
    violet = "#d0a9f6",
    lavender = "#e1cdf6"
}

constants.customColors = {
    {
        constants.customColor.black,
        constants.customColor.charcoal,
        constants.customColor.gray,
        constants.customColor.silver,
        constants.customColor.white
    },
    {
        constants.customColor.brown,
        constants.customColor.paleBrown,
        constants.customColor.ash,
        constants.customColor.sage,
        constants.customColor.misr
    },
    {
        constants.customColor.blue,
        constants.customColor.cobalt,
        constants.customColor.deluge,
        constants.customColor.ice,
        constants.customColor.cerulean
    },
    {
        constants.customColor.indigo,
        constants.customColor.mariner,
        constants.customColor.moonstone,
        constants.customColor.malibu,
        constants.customColor.lightCyan
    },
    {
        constants.customColor.green,
        constants.customColor.grass,
        constants.customColor.alien,
        constants.customColor.algae,
        constants.customColor.pastelGreen
    },
    {
        constants.customColor.muddyGreen,
        constants.customColor.drab,
        constants.customColor.moss,
        constants.customColor.olive,
        constants.customColor.caper
    },
    {
        constants.customColor.mustard,
        constants.customColor.bile,
        constants.customColor.banana,
        constants.customColor.buff,
        constants.customColor.ecru
    },
    {
        constants.customColor.rum,
        constants.customColor.gold,
        constants.customColor.bee,
        constants.customColor.mango,
        constants.customColor.chardonnay
    },
    {
        constants.customColor.rust,
        constants.customColor.burnt,
        constants.customColor.bamboo,
        constants.customColor.tiger,
        constants.customColor.peach
    },
    {
        constants.customColor.berry,
        constants.customColor.scarlet,
        constants.customColor.corsa,
        constants.customColor.sunset,
        constants.customColor.geraldine
    },
    {
        constants.customColor.eggplant,
        constants.customColor.redViolet,
        constants.customColor.cerise,
        constants.customColor.pink,
        constants.customColor.candy
    },
    {
        constants.customColor.purple,
        constants.customColor.meteorite,
        constants.customColor.lilac,
        constants.customColor.violet,
        constants.customColor.lavender
    }
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
    rotation = {default = 133.144, left_shoulder = 80, right_shoulder = 190, arms = 80, gear = 0, color = 118},
}

constants.limits = {
    maximumPlayers = 15,
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
        dashboard = findWidgetTag("dashboard_updated\\dashboard_updated_menu"),
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
        browser = findWidgetTag("lobby_browser_table_menu"),
        legacyModalError = findWidgetTag("error_modal_fullscreen"),
        balltze = findWidgetTag("balltze\\balltze_mod_menu"),
        -- TODO Rename colors to color
        bipedColor = findWidgetTag("customization_biped_colors_menu"),
        videoSettings = findWidgetTag("video_settings_menu_custom"),
        audioSettings = findWidgetTag("audio_settings_menu_custom"),
        version = findWidgetTag("insurrection_version_footer"),
    }

    constants.sounds = {
        error = findTag("flag_failure", tagClasses.sound),
        back = findTag("back", tagClasses.sound),
        success = findTag("forward", tagClasses.sound),
        join = findTag("player_join", tagClasses.sound),
        leave = findTag("player_leave", tagClasses.sound),
        teleporter = findTag("teleporter_activate", tagClasses.sound),
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

    constants.scenery = {
        christmasHat = engine.tag.findTags(constants.path.christmasHat, engine.tag.classes.scenery)[1],
        xmasObjects = engine.tag.findTags(constants.path.xmasObjects, engine.tag.classes.tagCollection)[1]
    }
    log("Loaded constants")
end

return constants
