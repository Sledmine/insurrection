local components = require "insurrection.components"
local specialEvents = require "insurrection.specialEvents"
local balltze = Balltze
local engine = Engine
package.preload["luna"] = nil
package.loaded["luna"] = nil
local luna = require "luna"
local chimera = require "insurrection.mods.chimera"
local interface = require "insurrection.interface"
async = require"async".async
local dispatch = require"async".dispatch
require"async".configure("base, table, package, string")
execute_script = engine.hsc.executeScript

---@type Logger
logger = nil
DebugMode = false
APILocalMode = false
IsDebugCustomization = false
IsDebugLocalCustomizationEnabled = false
inspect = require "inspect"
constants = require "insurrection.constants"
api = require "insurrection.api"
discord = require "insurrection.discord"
store = require "insurrection.redux.store"
local isNewMap = true

---@type uiWidgetDefinition?
local editableWidget
---@type tag?
local editableWidgetTagEntry
---@type tag
local lastOpenWidgetTag
---@type tag
local lastClosedWidgetTag
---@type tag
local lastListFocusedWidgetTag
---@type tag?
local lastFocusedWidgetTagEntry
-- Multithread lanes
Lanes = {}

local customBipedPaths = {
    bleed_it_out = {[[keymind\the_flood\characters\unsc\gridharvolur\gridharvolur_mk_ii_[b]_mp]]},
    b30_coop_evolved = {
        [[[shm]\halo_1\characters\mjolnir_gen_1\mjolnir_gen_1_mp]],
        [[[shm]\halo_1\characters\marine\marine_mp]],
        [[[shm]\halo_1\characters\elite\elite_mp]],
        [[[shm]\halo_1\characters\grunt\grunt_mp]]
    }
    -- forge_island_dev = {[ze[[shm]\halo_4\characters\mjolnir_gen2\mjolnir_gen2_mp]]}
}
CustomBipedPaths = customBipedPaths

local customUiWidgetPaths = {
    {constants.path.nameplateCollection, engine.tag.classes.tagCollection},
    {constants.path.pauseMenu, engine.tag.classes.uiWidgetDefinition},
    {constants.path.dialog, engine.tag.classes.uiWidgetDefinition},
    {constants.path.customSounds, engine.tag.classes.tagCollection},
    {constants.path.christmasHat, engine.tag.classes.scenery}

}

function log(...)
    if DebugMode then
        local args = {...}
        for i = 1, #args do
            if type(args[i]) == "string" then
                args[i] = args[i]:replace("\n", " ")
            end
        end
        logger:debug(table.unpack(args))
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

local function initialize()
    log("Initializing Insurrection")
    api.loadUrl()
    components.free()
    constants.get()
    interface.load()
    interface.changeAspectRatio()
    chimera.fontOverride()
end

local commands = {
    debug = {
        description = "Enable Insurrection debug mode",
        help = "<boolean>",
        minArgs = 1,
        maxArgs = 1,
        execute = function(enable)
            DebugMode = luna.bool(enable)
            engine.core.consolePrint("Debug mode: " .. tostring(DebugMode))
        end
    },
    setup_fonts = {
        description = "Setup Insurrection fonts as default game fonts",
        help = "<boolean>",
        minArgs = 1,
        maxArgs = 1,
        execute = function(enable)
            local revert = not luna.bool(enable)
            chimera.setupFonts(revert)
            if not revert then
                interface.dialog("SUCCESS", "Fonts have been setup",
                                 "Please restart the game to see changes.")
                return
            end
            interface.dialog("SUCCESS", "Fonts have been reverted",
                             "Please restart the game to see changes.")
        end
    },
    debug_customization = {
        description = "Enable Insurrection customization debug mode",
        execute = function()
            IsDebugCustomization = true
            interface.blur(false)
            interface.close(true)
            -- execute_script("set_customization_background 1")
            -- execute_script("object_create customization_biped")
        end
    },
    test = {
        description = "Test command",
        execute = function()
            interface.dialog("SUCCESS", "Test command", "This is a test command")
        end
    }
}

local isChimeraLoaded = false

local function loadChimeraCompatibility()
    -- Load Chimera compatibility
    for k, v in pairs(balltze.chimera) do
        if not k:includes "timer" and not k:includes "execute_script" and
            not k:includes "set_callback" then
            _G[k] = v
        end
    end
    server_type = engine.netgame.getServerType()

    -- Replace Chimera functions with Balltze functions
    write_bit = balltze.memory.writeBit
    write_byte = balltze.memory.writeInt8
    write_word = balltze.memory.writeInt16
    write_dword = balltze.memory.writeInt32
    write_int = balltze.memory.writeInt32
    write_float = balltze.memory.writeFloat
    write_string = function(address, value)
        for i = 1, #value do
            write_byte(address + i - 1, string.byte(value, i))
        end
        if #value == 0 then
            write_byte(address, 0)
        end
    end
    execute_script = engine.hsc.executeScript
end

local onMapLoadEvent
local onTickEvent

function PluginLoad()
    logger = balltze.logger.createLogger("Insurrection")
    logger:muteDebug(not DebugMode)

    local function importCustomizableBipeds()
        for mapName, bipeds in pairs(customBipedPaths) do
            for _, bipedPath in pairs(bipeds) do
                balltze.features.importTagFromMap(mapName, bipedPath, engine.tag.classes.biped)
            end
        end
    end

    importCustomizableBipeds()

    if not onMapLoadEvent then
        onMapLoadEvent = balltze.event.mapLoad.subscribe(function(event)
            if event.time == "before" then
                isNewMap = true
                if event.context:mapName() == "ui" then
                    logger:debug("Importing external customizable bipeds...")
                    importCustomizableBipeds()
                    -- elseif api.session.lobbyKey then
                else
                    balltze.features.clearTagImports()
                    for _, tagPath in pairs(customUiWidgetPaths) do
                        balltze.features.importTagFromMap("ui", tagPath[1], tagPath[2])
                    end
                end
            else
                balltze.features.clearTagImports()
            end
        end, "lowest")
    end

    if not onTickEvent then
        onTickEvent = balltze.event.tick.subscribe(function(event)
            if event.time == "before" then
                if not isChimeraLoaded and balltze.chimera then
                    logger:debug("Chimera compatibility loaded")
                    loadChimeraCompatibility()
                    isChimeraLoaded = true
                end
                if isChimeraLoaded then
                    if isNewMap then
                        initialize()
                        isNewMap = false
                    end
                    interface.onTick()
                    specialEvents.onTick()
                    -- Multithread callback resolve
                    local success, message = pcall(dispatch)
                    if not success then
                        logger:error(tostring(message))
                    end
                end
            end
        end)
    end

    for command, data in pairs(commands) do
        balltze.command.registerCommand(command, command, data.description, data.help, false,
                                        data.minArgs or 0, data.maxArgs or 0, false, true,
                                        function(...)
            local success, result = pcall(data.execute, table.unpack(...))
            if not success then
                logger:error("Error executing command '{}': {}", command, result)
                return false
            end
            return true
        end)
    end

    components.callbacks()

    return true
end

function PluginUnload()
end
