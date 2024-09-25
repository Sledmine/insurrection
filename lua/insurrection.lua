local components = require "insurrection.components"
local balltze = Balltze
local engine = Engine
package.preload["luna"] = nil
package.loaded["luna"] = nil
local luna = require "luna"
local chimera = require "insurrection.mods.chimera"
local interface = require "insurrection.interface"
async = require "async".async
local dispatch = require "async".dispatch
require "async".configure("base, table, package, string")
execute_script = engine.hsc.executeScript

---@type Logger
logger = nil
DebugMode = false
IsDebugCustomization = false
inspect = require "inspect"
constants = require "insurrection.constants"
api = require "insurrection.api"
discord = require "insurrection.discord"
store = require "insurrection.redux.store"
local isNewMap = false

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
    -- forge_island_dev = {[[[shm]\halo_4\characters\mjolnir_gen2\mjolnir_gen2_mp]]}
}

local customUiWidgetPaths = {
    {constants.path.nameplateCollection, "tag_collection"},
    {constants.path.pauseMenu, "ui_widget_definition"},
    {constants.path.dialog, "ui_widget_definition"},
    {constants.path.customSounds, "tag_collection"}
}

function log(...)
    if DebugMode then
        logger:debug(...)
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
    log("Overriding Chimera font...")
    chimera.fontOverride()
end

local commands = {
    debug = {
        description = "Enable Insurrection debug mode",
        help = "<boolean>",
        execute = function(enable)
            if enable == nil then
                DebugMode = not DebugMode
                return
            end
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
            --execute_script("set_customization_background 1")
            --execute_script("object_create customization_biped")
        end
    },
    test = {
        description = "Test command",
        execute = function()
            interface.dialog("SUCCESS", "Test command", "This is a test command")
        end
    }
}

function PluginInit()
    logger = balltze.logger.createLogger("insurrection")

    balltze.event.mapLoad.subscribe(function(event)
        if event.time == "before" then
            isNewMap = true
            if event.context:mapName() == "ui" then
                log("Loading Insurrection UI")
                for mapName, bipeds in pairs(customBipedPaths) do
                    for _, bipedPath in pairs(bipeds) do
                        balltze.features.importTagFromMap(mapName, bipedPath, "biped")
                    end
                end
            --elseif api.session.lobbyKey then
            else
                -- TODO BALLTZE MIGRATE
                for _, tagPath in pairs(customUiWidgetPaths) do
                    balltze.features.importTagFromMap("ui", tagPath[1], tagPath[2])
                end
            end
        else
            balltze.features.clearTagImports()
        end
    end, "lowest")

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

    return true
end

function PluginLoad()
    -- Load Chimera compatibility
    for k, v in pairs(balltze.chimera) do
        if not k:includes "timer" and not k:includes "execute_script" then
            _G[k] = v
        end
    end

    -- Replace Chimera functions with Balltze functions
    write_bit = function(address, bit, value)
        local byte = read_byte(address)
        if value then
            byte = byte | (1 << bit)
        else
            byte = byte & ~(1 << bit)
        end
        write_byte(address, byte)
    end
    write_byte = balltze.memory.writeInt8
    write_word = balltze.memory.writeInt16
    write_dword = balltze.memory.writeInt32
    write_int = balltze.memory.writeInt32
    write_float = balltze.memory.writeFloat
    write_string = function (address, value)
        for i = 1, #value do
            write_byte(address + i - 1, string.byte(value, i))
        end
        if #value == 0 then
            write_byte(address, 0)
        end
    end

    initialize()
 
    balltze.event.tick.subscribe(function(event)
        if isNewMap then
            initialize()
            isNewMap = false
        end
        if event.time == "before" then
            interface.onTick()
            -- Multithread callback resolve
            dispatch()
        end
    end)

    components.callbacks()
end
