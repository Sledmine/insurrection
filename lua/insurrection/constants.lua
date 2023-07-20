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
    customSounds = [[insurrection\sound\custom_sounds]]
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

constants.customBipedPaths = {
    bigass_mod = {
        "bourrin\\halo reach\\spartan\\male\\odst",
        "bourrin\\halo reach\\spartan\\male\\mp masterchief",
        "bourrin\\halo reach\\spartan\\female\\female",
        "bourrin\\halo reach\\spartan\\male\\117",
        "bourrin\\halo reach\\spartan\\male\\haunted",
        "bourrin\\halo reach\\spartan\\male\\spec_ops"
    },
    treason = {
        "keymind\\the_flood\\characters\\unsc\\odst_multiplayer\\_types\\nova\\nova",
        "keymind\\the_flood\\characters\\unsc\\odst_multiplayer\\_types\\mkvb\\mkvb",
        "keymind\\the_flood\\characters\\unsc\\odst_multiplayer\\_types\\orion\\orion",
        "keymind\\the_flood\\characters\\unsc\\odst_multiplayer\\_types\\spi_warrior\\spi_warrior"
    },
    rp_crossview = {
		"ecd\\characters\\ecd_mark\\ecd_mark_mp",
		"characters\\cyborg\\cyborg",
		"ecd\\characters\\ecd_mark_iv\\ecd_mark_iv_mp"
    },
    forge_island = {
        "[shm]\\halo_4\\characters\\commando\\commando",
        "[shm]\\halo_4\\characters\\eva\\eva",
        "[shm]\\halo_4\\characters\\hazop\\hazop",
        "[shm]\\halo_4\\characters\\mariner\\mariner",
        "[shm]\\halo_4\\characters\\mark v\\mark v",
        "[shm]\\halo_4\\characters\\mark vi\\mark vi",
        "[shm]\\halo_4\\characters\\mark vii\\mark vii",
        "[shm]\\halo_1\\characters\\masterchief\\master chief halo 1",
        "[shm]\\halo_cea\\characters\\masterchief\\master chief halo 1 anniversary",
        "[shm]\\halo_2\\characters\\masterchief\\master chief halo 2",
        "[shm]\\h2a\\characters\\masterchief\\master chief halo 2 anniversary",
        "[shm]\\halo_3\\characters\\masterchief\\master chief halo 3",
        "[shm]\\halo_4\\characters\\master chief\\master chief halo 4",
        "[shm]\\halo_infinite\\characters\\masterchief\\master chief halo infinite",
        "[shm]\\halo_4\\characters\\odst\\odst",
        "[shm]\\h2a\\characters\\orion\\orion",
        "[shm]\\halo_4\\characters\\prefect\\prefect",
        "[shm]\\halo_4\\characters\\recon\\recon",
        "[shm]\\halo_4\\characters\\recruit\\recruit",
        "[shm]\\halo_4\\characters\\ricochet\\ricochet",
        "[shm]\\halo_4\\characters\\rogue\\rogue",
        "[shm]\\halo_4\\characters\\scanner\\scanner",
        "[shm]\\halo_4\\characters\\scout\\scout",
        "[shm]\\halo_3\\characters\\spi\\spi",
        "[shm]\\halo_4\\characters\\strider\\strider"
    },
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
        optic = findWidgetTag("optic\\optic_mod_menu")
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
            ---@type table<number, tag>
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
