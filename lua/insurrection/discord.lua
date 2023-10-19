local base64 = require "base64"
local discordRPC = require "discordRPC"
local utils = require "insurrection.utils"

local core = require "insurrection.core"
local interface = require "insurrection.interface"
local getState = require "insurrection.redux.getState"

local discord = {}

---@type number?
DiscordPresenceTimerId = nil
---@type number?
DiscordCheckTimerId = nil

discord.presence = {
    state = "",
    details = "",
    largeImageKey = "insurrection",
    largeImageText = "Insurrection",
    startTimestamp = os.time(os.date("*t") --[[@as osdateparam]] ),
    -- startTimestamp = os.date("*t", os.time())
    smallImageKey = "insurrection",
    smallImageText = "Insurrection"
    -- instance = 0
}

discord.attempted = false
discord.ready = false

function discordRPC.ready(userId, username, discriminator, avatar)
    dprint(string.format("Discord: ready (%s, %s, %s, %s)", userId, username, discriminator, avatar))
    core.loading(false)
    discord.ready = true
end

function discordRPC.disconnected(errorCode, message)
    dprint(string.format("Discord: disconnected (%d: %s)", errorCode, message))
    discord.ready = false
end

function discordRPC.joinGame(joinSecret)
    dprint("Discord: join game (" .. joinSecret .. ")")
    api.lobby(joinSecret)
end

function discordRPC.joinRequest(userId, username, discriminator, avatar)
    dprint(string.format("Discord: join request (%s, %s, %s, %s)", userId, username, discriminator,
                         avatar))
    discordRPC.respond(userId, "yes")
end

function discord.initialize()
    discordRPC.initialize(base64.decode(read_file("micro")), true)
end

function discord.startPresence()
    if not discord.ready then
        -- discordRPC.shutdown()
        core.loading(true, "Starting Discord Presence...", true)
        discord.initialize()
    end

    if DiscordPresenceTimerId then
        pcall(stop_timer, DiscordPresenceTimerId)
    end

    -- Routines to handle Discord presence
    function DiscordUpdate()
        --dprint("DiscordUpdate")
        discordRPC.runCallbacks()
        if discord.ready then
            if DiscordCheckTimerId then
                pcall(stop_timer, DiscordCheckTimerId)
            end
            discordRPC.updatePresence(discord.presence)
        end
    end
    function DiscordCheck()
        if not discord.ready then
            core.loading(false)
            if not DebugMode and not discord.attempted then
                interface.dialog("WARNING", "Discord Rich Presence failed to start.",
                                 "Please make sure you have Discord running and allow Discord to display your game status.")
                discord.attempted = true
            end
        end
        return false
    end
    DiscordPresenceTimerId = set_timer(120, "DiscordUpdate")
    DiscordCheckTimerId = set_timer(5000, "DiscordCheck")
end

---Set presence state and details
---@param state string
---@param details? string
---@param image? string
function discord.setState(state, details, image)
    dprint("discord.setState: " .. state .. ", " .. details)
    if not discord.ready then
        return
    end
    discord.presence.state = state .. "\n"
    discord.presence.details = details
    if not image then
        discord.presence.largeImageKey = "insurrection"
        discord.presence.largeImageText = "Insurrection"
    end
end

---Set presence party info
---@param partyId string?
---@param partySize number?
---@param partyMax number?
---@param map? string
---@param isLobbyOpen? boolean
function discord.setParty(partyId, partySize, partyMax, map, isLobbyOpen)
    dprint(
        "discord.setParty: " .. partyId .. ", " .. partySize .. ", " .. partyMax .. ", " .. map ..
            ", " .. tostring(isLobbyOpen))
    if partyId then
        -- TODO Replace with a proper party unique ID
        discord.presence.partyId = partyId .. partyId:reverse()
        discord.presence.joinSecret = nil
        if isLobbyOpen then
            discord.presence.joinSecret = partyId
        end
    end
    discord.presence.partySize = partySize
    discord.presence.partyMax = partyMax
    if map then
        local mapName = utils.snakeCaseToTitleCase(map)
        discord.presence.details = mapName
        discord.presence.largeImageKey = map
        discord.presence.largeImageText = map
    end
end

function discord.clearParty()
    dprint("discord.clearParty")

    discord.presence.partyId = nil
    discord.presence.joinSecret = nil
    discord.presence.partySize = nil
    discord.presence.partyMax = nil
end

--- Clear the presence info
function discord.clearPresence()
    dprint("discord.clearPresence")

    discord.presence.state = nil
    discord.presence.details = nil
    discord.presence.partyId = nil
    discord.presence.joinSecret = nil
    discord.presence.partySize = nil
    discord.presence.partyMax = nil
    discord.presence.largeImageKey = nil
    discord.presence.largeImageText = nil
end

function discord.stopPresence()
    if DiscordPresenceTimerId then
        pcall(stop_timer, DiscordPresenceTimerId)
    end
    discordRPC.clearPresence()
    discordRPC.shutdown()
end

return discord
