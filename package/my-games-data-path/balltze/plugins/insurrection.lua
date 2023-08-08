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

function plugin_init()
    -- tick_event_listener = balltze.event.tick.add_listener(tick_event, "lowest")
    on_map_file_load_listener = balltze.event.map_file_load.add_listener(on_map_file_load, "lowest")
    logger = balltze.logger.create_logger("test logger")
    -- logger:set_file("test.log", false)
    return true
end

function plugin_load()
end

function on_map_file_load(event)
    if event.args.map_name == "ui" then
        for mapName, bipeds in pairs(custom_biped_paths) do
            for _, bipedPath in pairs(bipeds) do
                local _ = pcall(balltze.features.import_tag_from_map, mapName, bipedPath, "biped")
            end
        end
    else
        balltze.features.clear_tag_imports()
    end
end
