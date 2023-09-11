function plugin_metadata()
    return {
        name = "Insurrection",
        author = "Shadowmods Team",
        version = {major = 1, minor = 0, patch = 0, build = 0},
        balltze_version = {major = 1, minor = 0, patch = 0, build = 0},
        reloadable = true
    }
end

local logger
local current_map = ""

local function tick_event(context)
    if context.time == "before" then
        local map_header = balltze.engine.get_current_map_header()
        if map_header.name ~= current_map then
            current_map = map_header.name
            local tag = balltze.engine.get_tag(0)
            logger:info("tag name: {}", tag.path)
            logger:info("map changed to {}", current_map)
        end
    end
end

local custom_biped_paths = {
    impasse = {
        "keymind\\the_flood\\characters\\unsc\\odst_multiplayer\\_types\\nova\\nova",
        "keymind\\the_flood\\characters\\unsc\\odst_multiplayer\\_types\\mkvb\\mkvb",
        "keymind\\the_flood\\characters\\unsc\\odst_multiplayer\\_types\\orion\\orion",
        "keymind\\the_flood\\characters\\unsc\\odst_multiplayer\\_types\\spi_warrior\\spi_warrior"
    },
    a50_coop_evolved = {
        "characters\\cyborg_mp\\cyborg_mp",
        "characters\\cyborg_mp\\air_assault_mp",
        "characters\\cyborg_mp\\commando_mp",
        "characters\\cyborg_mp\\cqb_mp",
        "characters\\elite_mp\\elite_mp",
        "characters\\cyborg_mp\\eod_mp",
        "characters\\cyborg_mp\\eva_mp",
        "characters\\cyborg_mp\\hazop_mp",
        "characters\\marine_armored_mp\\marine_mp",
        "characters\\cyborg_mp\\odst_mp",
        "characters\\cyborg_mp\\operator_mp",
        "characters\\cyborg_mp\\security_mp",
        "characters\\grunt\\yapyap\\yapyap_mp"
    }
}

local function play_video(args)
    local video_name = args[1]
    if video_name then
        logger:info("playing video {}", video_name)
        balltze.output.play_bik_video("videos\\" .. video_name .. ".bik")
        return true
    end
    logger:error("no video name provided")
    return true
end

function plugin_init()
    -- tick_event_listener = balltze.event.tick.add_listener(tick_event, "lowest")
    
    on_map_file_load_listener = balltze.event.map_load.add_listener(on_map_load, "lowest")
    logger = balltze.logger.create_logger("test logger")
    -- logger:set_file("test.log", false)
    balltze.command.register_command("play_video", "debug", "Reload upstream tag", play_video, false, 1, 1, true, false)
    return true
end

function plugin_load()
end

function on_map_load(event)
    logger:info("map loaded: {}", event.args.map_name)
    if event.args.map_name == "levels\\ui\\ui" then
        for mapName, bipeds in pairs(custom_biped_paths) do
            for _, bipedPath in pairs(bipeds) do
                local _ = pcall(balltze.features.import_tag_from_map, mapName, bipedPath, "biped")
            end
        end
    else
        balltze.features.clear_tag_imports()
    end
end
