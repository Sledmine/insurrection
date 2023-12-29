local redux = require "redux"
local actions = {}

actions.types = {
    SET_IS_LOADING = "SET_IS_LOADING",
    SET_LOBBY = "SET_LOBBY",
    SET_AVAILABLE_RESOURCES = "SET_AVAILABLE_RESOURCES",
    RESET = "RESET",
    SET_PLAYER = "SET_PLAYER",
    SET_LOBBIES = "SET_LOBBIES"
}

function actions.setIsLoading(loading)
    return {type = actions.types.SET_IS_LOADING, payload = loading}
end

function actions.setLobby(key, lobby)
    return {type = actions.types.SET_LOBBY, payload = {key = key, lobby = lobby}}
end

function actions.reset()
    return {type = redux.actionTypes.INIT}
end

function actions.setAvailableResources(available)
    return {type = actions.types.SET_AVAILABLE_RESOURCES, payload = available}
end

function actions.setPlayer(player)
    return {type = actions.types.SET_PLAYER, payload = player}
end

function actions.setLobbies(lobbies)
    return {type = actions.types.SET_LOBBIES, payload = lobbies}
end

return actions
