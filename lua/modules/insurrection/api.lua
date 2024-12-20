local engine = Engine
local lanes = require "lanes"
local json = require "json"
local getState = require "insurrection.redux.getState"
local react = require "insurrection.react"
local blam = require "blam"
local requests = require "requestscurl"
local interface = require "insurrection.interface"
local glue = require "glue"
local exists = glue.canopen
local actions = require "insurrection.redux.actions"
local core = require "insurrection.core"
local menus = require "insurrection.menus"
local shared = interface.shared
local constants = require "insurrection.constants"
local loading = core.loading
local luna = require "luna"
local utils = require "insurrection.utils"

local api = {}

api.variables = {refreshRate = 3000, refreshTimer = nil}

---@class insurrectionSession
---@field token? string
---@field lobbyKey? string
---@field username? string
---@field player? insurrectionPlayer

---@type insurrectionSession
api.session = {token = nil, lobbyKey = nil, username = nil, player = nil}

-- Models

---@class requestResult
---@field message string

---@class insurrectionPlayer
---@field name string
---@field nameplate number
---@field publicId string
---@field rank number
---@field bipeds table<string, string>

---@class loginResponse
---@field message string
---@field token? string
---@field player insurrectionPlayer
---@field secondsToExpire number

---@class availableParameters
---@field maps string[]
---@field gametypes string[]
---@field templates string[]
---@field customization table<string, {maps: string[], tags: string[]}>

---@class serverInstance
---@field password string
---@field template string
---@field host string
---@field port integer
---@field map string
---@field gametype string
---@field cpu integer
---@field owner string
---@field lobbyKey string

---@class insurrectionLobby
---@field owner string
---@field players insurrectionPlayer[]
---@field map string
---@field gametype string
---@field template string
---@field server serverInstance
---@field isPublic boolean

-- function async(func, callback, ...)
--    if #Lanes == 0 then
--        Lanes[#Lanes + 1] = {thread = lanes.gen(asyncLibs, func)(...), callback = callback}
--    else
--        log("Warning! An async function is trying to add another thread!")
--    end
-- end

-- @param inputFunction fun(await: fun(callback: fun(...): (T), ...): T)

local function connect(desiredMap, host, port, password)
    api.stopRefreshLobby()
    api.session.lobbyKey = nil
    if not engine.map.getCurrentMapHeader().name == "ui" then
        engine.core.consolePrint("Can't connect to a server while in-game.")
        return
    end
    logger:debug("Connecting to " .. tostring(host) .. ":" .. tostring(port) .. " with password " .. tostring(password))
    local mapList = engine.map.getMapList()
    if table.indexof(mapList, desiredMap) then
        -- Force game profile name to be the same as the player's name
        core.setGameProfileName(api.session.player.name)
        core.connectServer(host, port, password)
    else
        interface.dialog("ERROR", "LOCAL MAP NOT FOUND", "Map \"" .. desiredMap ..
                             "\" was not found on your game files.\nPlease download it from Mercury or map repositories.")
    end
end

local function showErrorDialog(logs)
    if type(logs) ~= "string" then
        if type(logs) == "table" and logs.json then
            logs = tostring(inspect(logs)) .. "\n" .. tostring(inspect(logs.json()))
        else
            logs = tostring(inspect(logs))
            logger:error("Unknown error: " .. logs, "error")
        end
    end
    interface.dialog("ERROR", "UNKNOWN ERROR",
                     "An unknown error has ocurred, please check logs and try again later.")
    if logs then
        local log = Balltze.filesystem.readFile("insurrection.log") or ""
        -- Check if log is over 100,000 kilobytes and reset it
        if #log > 100000 then
            log = ""
        end
        log = log .. "\n" .. debug.traceback()
        log = log .. "\n" .. logs
        Balltze.filesystem.writeFile("insurrection.log", log)
    end
end

---Prevent players from getting stuck in the joining screen if the server connection fails
local function preventStuckLobby()
    -- Check after 30 seconds if we are still in the UI map
    -- TODO BALLTZE MIGRATE
    -- utils.delay(30000, function()
    --    if map == "ui" then
    --        -- If we were trying to join a lobby and the widget is closed, delete the lobby
    --        if api.session.lobbyKey then
    --            console_out(
    --                "It seems like there is a problem joining the server, deleting lobby...",
    --                table.unpack(blam.consoleColors.warning))
    --            api.deleteLobby()
    --        end
    --    end
    -- end)
end

---Load Insurrection URL to be used by the API
---@param host? string
function api.loadUrl(host)
    api.version = "v1"
    api.host = Balltze.filesystem.readFile("insurrection_host") or host or "http://localhost:4343/"
    --if DebugMode then
    --    api.host = "http://localhost:4343/"
    --end
    api.url = api.host .. api.version
end

function api.login(username, password)
    local login = async(function(await)
        loading(true, "Logging in...")
        ---@type httpResponse<loginResponse>?
        local response = await(requests.postform, api.url .. "/login",
                               {username = username, password = password})
        log("onLoginResponse")
        loading(false)
        if not response then
            logger:error("No response")
            showErrorDialog("No response")
            return
        end
        if response.code == 200 then
            local jsonResponse = response.json()
            api.session.token = jsonResponse.token
            api.session.player = jsonResponse.player
            requests.headers = {"Authorization: Bearer " .. api.session.token}
            -- Save last defined nameplate
            core.updateSettings({nameplate = jsonResponse.player.nameplate})
            interface.loadProfileNameplate()
            api.available()
            menus.dashboard()
        elseif response.code == 401 then
            local jsonResponse = response.json()
            interface.dialog("ATTENTION", "ERROR " .. response.code, jsonResponse.message)
        end
    end)
    login()
end

function api.available()
    loading(true, "Loading available parameters...")
    logger:info("Loading available parameters...")
    if IsDebugLocalCustomizationEnabled then
        local customization = {}
        for mapName, data in pairs(CustomBipedPaths) do
            customization[mapName] = {
                maps = {mapName},
                tags = table.map(data, function(tagPath)
                    return tagPath .. ".biped"
                end)
            }
        end
        store:dispatch(actions.setAvailableResources({
            maps = {"bloodgulch", "beavercreek", "dangercanyon", "deathisland", "icefields"},
            gametypes = {"slayer", "ctf", "oddball"},
            templates = {"default"},
            customization = customization
        }))
        return
    end
    local available = async(function(await)
        ---@type httpResponse<availableParameters>?
        local response = await(requests.get, api.url .. "/available")
        if not response then
            showErrorDialog("No response")
            return
        end
        loading(false)
        if response then
            if response.code == 200 then
                local jsonResponse = response.json()
                store:dispatch(actions.setAvailableResources(jsonResponse))
                return
            end
        end
        showErrorDialog(response)
    end)
    available()
end

---Create or join a lobby
---@param lobbyKey? string
function api.lobby(lobbyKey)
    if not lobbyKey then
        log("Creating lobby")
        local lobby = async(function(await)
            loading(true, "Creating lobby...")
            ---@type httpResponse<lobbyResponse>?
            local response = await(requests.get, api.url .. "/lobby")
            if not response then
                showErrorDialog("No response")
                return
            end
            if response.code == requests.codes.ok then
                ---@class lobbyResponse
                ---@field key string
                ---@field lobby insurrectionLobby

                local data = response.json()
                if data then
                    -- We asked for a new lobby room
                    if data.key then
                        api.session.lobbyKey = data.key
                        store:dispatch(actions.setLobby(data.key, data.lobby))
                    else
                        -- We have to joined an existing lobby
                        local lobby = data --[[@as insurrectionLobby]]
                        store:dispatch(actions.setLobby(nil, lobby))
                        -- There is a server already running for this lobby, connect to it
                        if lobby.server then
                            local isPlayerLobbyOwner = api.session.player and
                                                           api.session.player.publicId ==
                                                           lobby.owner
                            if isPlayerLobbyOwner then
                                discord.setParty(lobby.server.lobbyKey, #lobby.players, 16,
                                                 lobby.map, isPlayerLobbyOwner)
                            end
                            connect(lobby.server.map, lobby.server.host, lobby.server.port,
                                    lobby.server.password)
                            return
                        end
                    end
                    api.startLobbyRefresh()
                    local state = getState()
                    local isPlayerLobbyOwner = api.session.player and api.session.player.publicId ==
                                                   state.lobby.owner
                    if isPlayerLobbyOwner then
                        menus.lobby()
                        react.render("lobbyMenu")
                    else
                        menus.lobby(true)
                        react.render("lobbyMenuClient")
                    end
                    discord.setParty(api.session.lobbyKey, #state.lobby.players, 16,
                                     state.lobby.map, isPlayerLobbyOwner)
                end
                return
            elseif response.code == requests.codes.forbidden then
                local jsonResponse = response.json()
                if jsonResponse and jsonResponse.key then
                    api.lobby(jsonResponse.key)
                end
                return
            else
                api.session.lobbyKey = nil
                local jsonResponse = response.json()
                interface.dialog("ATTENTION", "ERROR " .. response.code, jsonResponse.message)
                return
            end
        end)
        lobby()
        return
    end

    log("Joining lobby with key: " .. lobbyKey)
    api.session.lobbyKey = lobbyKey
    async(function(await)
        ---@type httpResponse<insurrectionLobby>?
        local response = await(requests.get, api.url .. "/lobby/" .. lobbyKey)
        if not response then
            showErrorDialog("No response")
            return
        end
        if response.code == requests.codes.ok then
            local lobby = response.json()
            if lobby then
                store:dispatch(actions.setLobby(lobbyKey, lobby))
                local state = getState()
                local isPlayerLobbyOwner = api.session.player and api.session.player.publicId ==
                                               state.lobby.owner
                if isPlayerLobbyOwner then
                    menus.lobby()
                    react.render("lobbyMenu")
                else
                    menus.lobby(true)
                    react.render("lobbyMenuClient")
                end
                discord.setParty(api.session.lobbyKey, #lobby.players, 16, lobby.map,
                                 isPlayerLobbyOwner)
                api.startLobbyRefresh()
                -- Lobby already has a server running, connect to it
                if lobby.server and engine.netgame.getServerType() ~= "dedicated" then
                    log("Connecting to lobby server...")
                    api.stopRefreshLobby()
                    connect(lobby.server.map, lobby.server.host, lobby.server.port,
                            lobby.server.password)
                    preventStuckLobby()
                end
            end
        end
    end)()
end

function api.startLobbyRefresh()
    -- Start a timer to pull lobby data every certain time
    if api.variables.refreshTimer then
        api.stopRefreshLobby()
    end
    -- Create global function to be called by the timer
    RefreshLobby = function()
        if api.session.lobbyKey then
            api.refreshLobby()
        end
    end
    api.variables.refreshTimer = Balltze.misc.setTimer(api.variables.refreshRate, RefreshLobby)
end

function api.refreshLobby()
    if not api.session.lobbyKey then
        return
    end
    logger:info("Refreshing lobby data...", "info")
    loading(true, "Refreshing lobby...", false)
    local refresh = async(function(await)
        ---@type httpResponse<insurrectionLobby | requestResult>?
        local response = await(requests.get, api.url .. "/lobby/" .. api.session.lobbyKey)
        loading(false)
        if not response then
            api.stopRefreshLobby()
            showErrorDialog("No response")
            return
        end
        if response.code == 200 then
            local lobby = response.json()
            if lobby then
                -- Update previously joined lobby data
                store:dispatch(actions.setLobby(api.session.lobbyKey, lobby))
                local state = getState()
                local isPlayerLobbyOwner = api.session.player and api.session.player.publicId ==
                                               state.lobby.owner
                if isPlayerLobbyOwner then
                    react.render("lobbyMenu")
                else
                    react.render("lobbyMenuClient")
                end
                discord.setParty(api.session.lobbyKey, #lobby.players, 16, lobby.map,
                                 isPlayerLobbyOwner)
                -- Lobby already has a server running, connect to it
                if lobby.server and engine.netgame.getServerType() ~= "dedicated" then
                    api.stopRefreshLobby()
                    connect(lobby.server.map, lobby.server.host, lobby.server.port,
                            lobby.server.password)
                    preventStuckLobby()
                end
            end
            return
        else
            api.stopRefreshLobby()
            -- TODO Add a generic error handling function for this
            local jsonResponse = response.json()
            interface.dialog("ERROR", "ERROR " .. response.code, jsonResponse.message)
            return
        end
    end)
    refresh()
end
function api.stopRefreshLobby()
    if api.session.lobbyKey and api.variables.refreshTimer then
        api.variables.refreshTimer.stop()
        api.variables.refreshTimer = nil
    end
end
function api.deleteLobby()
    if api.session.lobbyKey then
        log("DELETING lobby")
        if api.variables.refreshTimer then
            api.variables.refreshTimer.stop()
        end
        api.variables.refreshTimer = nil
        api.session.lobbyKey = nil
        store:dispatch(actions.setLobby(nil, nil))
    end
end

function api.borrow(template, map, gametype)
    local borrow = async(function(await)
        loading(true, "Borrowing game server...", false)
        ---@type httpResponse<serverBorrowResponse>?
        local response = await(requests.get,
                               api.url .. "/borrow/" .. template .. "/" .. map .. "/" .. gametype ..
                                   "/" .. api.session.lobbyKey)
        if not response then
            showErrorDialog("No response")
            return
        end
        if response.code == 200 then
            -- Prevent lobby from refreshing while we are waiting for the server to start
            -- This is critical to avoid crashing the game due to multitasking stuff
            api.stopRefreshLobby()
            ---@class serverBorrowResponse
            ---@field password string
            ---@field message string
            ---@field port number
            ---@field host string
            ---@field map string

            local jsonResponse = response.json()
            if jsonResponse then
                connect(jsonResponse.map, jsonResponse.host, jsonResponse.port,
                        jsonResponse.password)
                preventStuckLobby()
            end
            return
        elseif response.code == 404 then
            local jsonResponse = response.json()
            interface.dialog("ATTENTION", "ERROR " .. response.code, jsonResponse.message)
            return
        else
            api.stopRefreshLobby()
            if response.code == 500 then
                interface.dialog("ATTENTION", "ERROR " .. response.code, "Internal Server Error")
                return
            else
                local jsonResponse = response.json()
                interface.dialog("ATTENTION", "ERROR " .. response.code, jsonResponse.message)
                return
            end
        end
    end)
    borrow()
end

---Edit player nameplate
---@param data {nameplate: string, bipeds: table<string, string>}
function api.playerProfileEdit(data)
    loading(true, "Editing profile...", false)
    local edit = async(function(await)
        ---@type httpResponse<any>?
        local response = await(requests.patch, api.url .. "/players", data)
        if not response then
            showErrorDialog("No response")
            return
        end
        loading(false)

        if response.code == 200 then
            local bipedProjectName = table.keys(data.bipeds)[1]
            interface.dialog("INFORMATION", "CONGRATULATIONS", "Profile customized successfully.")
            interface.loadProfileNameplate(data.nameplate)
            core.updateSettings({
                nameplate = data.nameplate,
                lastSavedProject = bipedProjectName
            })
            -- Refresh player data
            api.session.player.bipeds = table.merge(api.session.player.bipeds, data.bipeds)
            return
        else
            local jsonResponse = response.json()
            if jsonResponse then
                interface.dialog("WARNING", "ERROR " .. response.code, jsonResponse.message)
            end
            return
        end
    end)
    edit()
end

function api.editLobby(lobbyKey, data)
    loading(true, "Editing lobby...", false)
    local edit = async(function(await)
        ---@type httpResponse<any>?
        local response = await(requests.patch, api.url .. "/lobby/" .. lobbyKey, data)
        if not response then
            showErrorDialog("No response")
            return
        end
        if response.code == 200 then
        else
            local jsonResponse = response.json()
            if jsonResponse then
                interface.dialog("ATTENTION", "ERROR " .. response.code, jsonResponse.message)
            end
        end
    end)
    edit()
end

function api.getLobbies()
    loading(true, "Loading lobbies...", false)
    local get = async(function(await)
        ---@type httpResponse<insurrectionLobby[] | requestResult>?
        local response = await(requests.get, api.url .. "/lobbies")
        if not response then
            showErrorDialog("No lobbies server response")
            return
        end
        if response.code == 200 then
            local jsonResponse = response.json()
            if jsonResponse then
                if #jsonResponse == 0 then
                    interface.dialog("ERROR", "NO LOBBIES FOUND",
                                     "There are no lobbies available at the moment.")
                    return
                else
                    store:dispatch(actions.setLobbies(jsonResponse))
                    react.render("lobbyBrowserMenu")
                end
                return
            end
        else
            local jsonResponse = response.json()
            if jsonResponse then
                interface.dialog("ATTENTION", "ERROR " .. response.code, jsonResponse.message)
            end
        end
    end)
    get()
end

function api.getSavedBipeds()
    if api.session and api.session.player and api.session.player.bipeds then
        return table.map(api.session.player.bipeds, function(data)
            local elements = data:split("+")
            return {
                path = elements[1],
                regions = table.map(table.slice(elements, 2, #elements), tointeger)
            }
        end)
    end
end

return api
