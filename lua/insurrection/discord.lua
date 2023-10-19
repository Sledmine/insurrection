local base64 = require "base64"
local discordRPC = require "discordRPC"

local core = require "insurrection.core"
local interface = require "insurrection.interface"
local getState = require "insurrection.redux.getState"

local discord = {}

---@type number?
DiscordPresenceTimerId = nil
---@type number?
DiscordCheckTimerId = nil

discord.presence = {
    state = "Playing Insurrection",
    details = "In the main menu",
    largeImageKey = "insurrection",
    largeImageText = "Insurrection",
    startTimestamp = os.time(os.date("*t") --[[@as osdateparam]] ),
    --startTimestamp = os.date("*t", os.time())
    smallImageKey = "insurrection",
    smallImageText = "Insurrection",
    -- instance = 0
}

discord.attempted = false
discord.ready = false

function discordRPC.ready(userId, username, discriminator, avatar)
    print(string.format("Discord: ready (%s, %s, %s, %s)", userId, username, discriminator, avatar))
    core.loading(false)
    discord.ready = true
end

function discordRPC.disconnected(errorCode, message)
    print(string.format("Discord: disconnected (%d: %s)", errorCode, message))
end

function discordRPC.joinGame(joinSecret)
    api.lobby(joinSecret)
end

function discordRPC.joinRequest(userId, username, discriminator, avatar)
    -- print(string.format("Discord: join request (%s, %s, %s, %s)", userId, username, discriminator,
    --                    avatar))
    discordRPC.respond(userId, "yes")
end

function discord.startPresence()
    if not discord.ready then
        discordRPC.shutdown()
        core.loading(true, "Starting Discord Presence...")
        discordRPC.initialize(base64.decode(read_file("micro")), true)
    end
    discordRPC.clearPresence()
    discordRPC.runCallbacks()
    if DiscordPresenceTimerId then
        pcall(stop_timer, DiscordPresenceTimerId)
    end

    -- Routines to handle Discord presence
    function DiscordUpdate()
        --discordRPC.runCallbacks()
        if discord.ready then
            if DiscordCheckTimerId then
                pcall(stop_timer, DiscordCheckTimerId)
            end
            --discordRPC.updatePresence(discord.presence)
            --discordRPC.runCallbacks()
        end
    end
    function DiscordCheck()
        if not discord.ready then
            core.loading(false)
            if not DebugMode and not discord.attempted then
                interface.dialog("WARNING", "An error occurred while starting Discord Presence.",
                                 "Please ensure that Discord is running and try again.\nDiscord is a required dependency for Insurrection services.")
                discord.attempted = true
            end
        end
        return false
    end
    DiscordPresenceTimerId = set_timer(2000, "DiscordUpdate")
    DiscordCheckTimerId = set_timer(3000, "DiscordCheck")
end

---Set presence state and details
---@param state string
---@param details? string
function discord.setState(state, details)
    dprint("discord.setState: " .. state .. ", " .. details)
    discord.presence.state = state .. "\n"
    discord.presence.details = details
    discordRPC.updatePresence(discord.presence)
    discordRPC.runCallbacks()
end

---Set presence party info
---@param partyId string?
---@param partySize number?
---@param partyMax number?
---@param map? string
function discord.setParty(partyId, partySize, partyMax, map)
    if partyId then
        -- TODO Replace with a proper party unique ID
        discord.presence.partyId = partyId .. partyId:reverse()
        discord.presence.joinSecret = partyId
    end
    discord.presence.partySize = partySize
    discord.presence.partyMax = partyMax
    if map then
        discord.presence.details = map
        discord.presence.largeImageKey = map
        discord.presence.largeImageText = map
    end
    discordRPC.updatePresence(discord.presence)
    discordRPC.runCallbacks()
end

function discord.clearParty()
    discord.presence.partyId = nil
    discord.presence.joinSecret = nil
    discord.presence.partySize = nil
    discord.presence.partyMax = nil
    
    discord.presence.details = nil

    discordRPC.updatePresence(discord.presence)
    discordRPC.runCallbacks()
end

--- Clear the presence info
function discord.clearPresence()
    discord.presence.state = nil
    discord.presence.details = nil

    discord.clearParty()
    discordRPC.clearPresence()
    discordRPC.runCallbacks()
end

function discord.stopPresence()
    if DiscordPresenceTimerId then
        pcall(stop_timer, DiscordPresenceTimerId)
    end
    discordRPC.clearPresence()
    discordRPC.shutdown()
end

return discord
