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
    bleed_it_out_dev = {
        [[keymind\halo_infinite\characters\unsc\odst\mirage_core\mirage_mp]],
    },
    b30_coop_evolved_dev = {
        "[shm]\\halo_1\\characters\\mjolnir_gen_1\\mjolnir_gen_1_mp",
        "characters\\elite_mp\\elite_mp",
        "characters\\marine_armored_mp\\marine_mp",
        "characters\\grunt\\yapyap\\yapyap_mp"
    },
    forge_island_dev = {
        [[[shm]\halo_4\characters\mjolnir_gen2\mjolnir_gen2_mp]]
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
    -- tick_event_listener = balltze.event.tick.subscribe(tick_event, "lowest")
    
    on_map_file_load_listener = balltze.event.map_load.subscribe(on_map_load, "lowest")
    logger = balltze.logger.create_logger("test logger")
    -- logger:set_file("test.log", false)
    balltze.command.register_command("play_video", "debug", "Reload upstream tag", play_video, false, 1, 1, true, false)
    return true
end

function plugin_load()
end

function on_map_load(event)
    --logger:info("map loaded: {}", event.args.map_name)
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
