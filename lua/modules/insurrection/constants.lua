local maps = require "insurrection.constants.maps"
local utils = require "insurrection.utils"

local constants = {}

local engine = Engine

constants.maximumTicksForDOMRenderTime = utils.secondsToTicks(3)

constants.path = {
    pauseMenu = [[insurrection\ui\menus\pause\pause_menu]],
    nameplateCollection = [[insurrection\ui\shared\nameplates]],
    dialog = [[insurrection\ui\menus\dialog\dialog_menu]],
    customSounds = [[insurrection\sound\custom_sounds]],
    tester = [[insurrection\ui\menus\tester\tester_menu]],
    christmasHat = [[insurrection\hats\christmas\christmas_hat]],
    xmasObjects = [[insurrection\scenery\season\xmas\xmas_objects]]
}

constants.customBipedPaths = {
    bleed_it_out = {[[keymind\the_flood\characters\unsc\gridharvolur\gridharvolur_mk_ii_[b]_mp]]},
    b30_coop_evolved_dev = {
        [[[shm]\halo_1\characters\mjolnir_gen_1\mjolnir_gen_1_mp]],
        [[[shm]\halo_1\characters\marine\marine_mp]],
        [[[shm]\halo_1\characters\elite\elite_mp]],
        [[[shm]\halo_1\characters\grunt\grunt_mp]]
    },
    forge_island_dev = {[[[shm]\halo_4\characters\mjolnir_gen2\mjolnir_gen2_mp]]}
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
    rotation = {
        default = 133.144,
        left_shoulder = 80,
        right_shoulder = 190,
        arms = 80,
        gear = 0,
        color = 118,
        dashboard = 100
    }
}

constants.limits = {maximumPlayers = 15}

constants.widgets = {}

constants.maps = maps

constants.parser = {
    customization = {bipedPathIndex = 1, firstRegionIndex = 2, lastRegionIndex = 9, visorIndex = 10}
}

function constants.get()
    logger.debug("Gathering constants...")
    local function findWidgetTag(partialName)
        -- Balltze v2 uses tag group strings, not tagClasses.* enums.
        local matches = engine.tag.filterTags("ui_widget_definition", partialName)
        return matches and matches[1]
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
        pause = findWidgetTag("insurrection\\ui\\menus\\pause\\pause_menu"),
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
        firefight = findWidgetTag("firefight\\firefight_menu"),
        multiplayer = findWidgetTag("multiplayer\\multiplayer_menu"),
        overlay = findWidgetTag("overlay\\overlay_graft"),
        loadingMenu = findWidgetTag("loading\\loading_menu")
    }

    constants.sounds = {
        error = engine.tag.filterTags("sound", "flag_failure")[1],
        back = engine.tag.filterTags("sound", "back")[1],
        success = engine.tag.filterTags("sound", "forward")[1],
        join = engine.tag.filterTags("sound", "player_join")[1],
        leave = engine.tag.filterTags("sound", "player_leave")[1],
        teleporter = engine.tag.filterTags("sound", "teleporter_activate")[1]
    }

    constants.tagCollections = {
        nameplates = engine.tag.filterTags("tag_collection", "nameplates")[1],
        maps = engine.tag.filterTags("tag_collection", "insurrection_maps")[1]
    }

    constants.widgetCollections = {
        multiplayer = engine.tag.filterTags("ui_widget_collection", "ui\\shell\\multiplayer")[1]
    }

    if constants.tagCollections.nameplates then
        local nameplatesTagCollection = engine.tag.getTagData(constants.tagCollections.nameplates.handle.value,
                                                              "tag_collection")
        if nameplatesTagCollection then
            ---@type table<string, TagEntry>
            local nameplateBitmapTags = {}
            for _, tagHandle in ipairs(nameplatesTagCollection.tagList or {}) do
                local tagEntry = engine.tag.getTagEntry(tagHandle)
                if tagEntry then
                    local nameplateId = core.getTagName(tagEntry.path)
                    if nameplateId and not nameplateBitmapTags[nameplateId] then
                        nameplateBitmapTags[nameplateId] = tagEntry
                    end
                end
            end
            constants.nameplates = nameplateBitmapTags
        end
    end

    constants.bitmaps = {
        unknownMapPreview = engine.tag.filterTags("bitmap", "unknown_map_preview")[1],
        customization = {
            left_shoulder = engine.tag.filterTags("bitmap", "customization_left_shoulder_icons")[1],
            right_shoulder = engine.tag.filterTags("bitmap", "customization_right_shoulder_icons")[1],
            regions = engine.tag.filterTags("bitmap", "customization_icons")[1],
            helmet = engine.tag.filterTags("bitmap", "customization_helmet_icons")[1],
            chest = engine.tag.filterTags("bitmap", "customization_chest_icons")[1],
            gear = engine.tag.filterTags("bitmap", "customization_gear_icons")[1],
            legs = engine.tag.filterTags("bitmap", "customization_legs_icons")[1]
        }
    }
    local fontName = "geogrotesque-regular-"
    constants.fonts = {
        text = engine.tag.filterTags("font", fontName .. "text")[1],
        title = engine.tag.filterTags("font", fontName .. "title")[1],
        subtitle = engine.tag.filterTags("font", fontName .. "subtitle")[1],
        button = engine.tag.filterTags("font", fontName .. "button")[1],
        shadow = engine.tag.filterTags("font", fontName .. "shadow")[1]
    }

    constants.scenery = {
        christmasHat = engine.tag.filterTags("scenery", constants.path.christmasHat)[1],
        xmasObjects = engine.tag.filterTags("tag_collection", constants.path.xmasObjects)[1]
    }
end

return constants
