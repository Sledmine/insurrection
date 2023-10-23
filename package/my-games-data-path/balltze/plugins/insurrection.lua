local balltze = Balltze

local logger

local customBipedPaths = {
    bleed_it_out_dev = {[[keymind\halo_infinite\characters\unsc\odst\mirage_core\mirage_mp]]},
    b30_coop_evolved_dev = {
        [[[shm]\halo_1\characters\mjolnir_gen_1\mjolnir_gen_1_mp]],
        [[characters\elite_mp\elite_mp]],
        [[characters\marine_armored_mp\marine_mp]],
        [[characters\grunt\yapyap\yapyap_mp]]
    },
    forge_island_dev = {[[[shm]\halo_4\characters\mjolnir_gen2\mjolnir_gen2_mp]]}
}

---@type BalltzeMapLoadEventCallback
local function onMapLoad(event)
    -- logger:info("map loaded: {}", event.args.mapName)
    if event.args.mapName == "levels\\ui\\ui" then
        for mapName, bipeds in pairs(customBipedPaths) do
            for _, bipedPath in pairs(bipeds) do
                local _ = pcall(balltze.features.importTagFromMap, mapName, bipedPath, "biped")
            end
        end
    else
        balltze.features.clearTagImports()
    end
end

function PluginMetadata()
    return {
        name = "Insurrection",
        author = "Shadowmods Team",
        version = "2.6.0",
        targetApi = "1.0.0-rc.1",
        reloadable = true
    }
end

function PluginInit()
    balltze.event.mapLoad.subscribe(onMapLoad, "lowest")
    logger = balltze.logger.createLogger("test logger")
    return true
end

function PluginLoad()
end
