package.preload["luna"] = nil
package.loaded["luna"] = nil
local luna = require "luna"
inspect = require "inspect"
local components = require "insurrection.components"
local specialEvents = require "insurrection.specialEvents"
local balltze = Balltze
local engine = Engine
local chimera = require "insurrection.mods.chimera"
local interface = require "insurrection.interface"
async = require"async".async
local dispatch = require"async".dispatch
require"async".configure("base, table, package, string")
execute_script = engine.hsc.executeScript
local script = require "script"
local actions = require "insurrection.redux.actions"
local react = require "insurrection.react"

---@type Logger
logger = nil
DebugMode = false
APILocalMode = false
IsAPIMockEnabled = false
IsDebugCustomization = false
IsDebugLocalCustomizationEnabled = false
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

local customExternalTags = {
    {constants.path.nameplateCollection, engine.tag.classes.tagCollection},
    {constants.path.pauseMenu, engine.tag.classes.uiWidgetDefinition},
    {constants.path.dialog, engine.tag.classes.uiWidgetDefinition},
    {constants.path.customSounds, engine.tag.classes.tagCollection},
    {constants.path.christmasHat, engine.tag.classes.scenery},
    {constants.path.xmasObjects, engine.tag.classes.tagCollection}
}

function PluginMetadata()
    return {
        name = "Insurrection",
        author = "Shadowmods Team",
        version = "2.9.0",
        targetApi = "1.0.0-rc.1",
        reloadable = true
    }
end

local function initialize()
    logger:debug("Initializing Insurrection!...")
    api.loadUrl()
    -- We might not want to reset the store on every map load
    -- Helps to preserve data after game lobby changes
    --store:dispatch(actions.reset())
    react.unmountAll()
    components.free()
    constants.get()
    interface.load()
    interface.setup()
    chimera.fontOverride()
end

local commands = {
    debug = {
        description = "Enable Insurrection debug mode",
        help = "<boolean>",
        minArgs = 1,
        maxArgs = 1,
        execute = function(isEnabled)
            DebugMode = luna.bool(isEnabled)
            engine.core.consolePrint("Debug mode: " .. tostring(DebugMode))
            logger:muteDebug(not DebugMode)
            logger:muteIngame(not DebugMode)
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
        for mapName, bipeds in pairs(constants.customBipedPaths) do
            for _, bipedPath in pairs(bipeds) do
                local result = pcall(balltze.features.importTagFromMap, mapName, bipedPath,
                                     engine.tag.classes.biped)
                if not result then
                    logger:debug("Failed to import customizable biped {} from map {}", bipedPath,
                                   mapName)
                end
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
                    for _, tagPath in pairs(customExternalTags) do
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
                        isNewMap = false
                        logger:debug("New map loaded, initializing Insurrection data...")
                        initialize()
                        specialEvents.onPostMapLoad()
                    end
                    interface.onTick()
                    specialEvents.onTick()
                    script.poll()
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
                                        function(args)
            local success, result = pcall(data.execute, table.unpack(args or {}))
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
