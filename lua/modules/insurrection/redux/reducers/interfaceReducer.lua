local redux = require "redux"
local actions = require "insurrection.redux.actions"
local glue = require "glue"
local chunks = glue.chunks

---@class interfaceState
---@field isLoading boolean
---@field player insurrectionPlayer?
---@field available availableParameters?
---@field lobby insurrectionLobby?
---@field lobbies insurrectionLobby[]?

---@type interfaceState
local defaultState = {
    isLoading = false,
    lobbyKey = nil,
    available = nil,
    lobby = nil,
    player = nil,
    lobbies = nil
}

---Game interface reducer
---@param state interfaceState
---@param action reduxAction
---@return interfaceState
local function interfaceReducer(state, action)
    if logger then
        log(action.type)
    end
    if action.type == redux.actionTypes.INIT then
        return table.copy(defaultState)
    elseif action.type == actions.types.SET_IS_LOADING then
        state.isLoading = action.payload
        return state
    elseif action.type == actions.types.SET_AVAILABLE_RESOURCES then
        state.available = action.payload
        return state
    elseif action.type == actions.types.SET_LOBBY then
        state.lobby = action.payload.lobby
        return state
    elseif action.type == actions.types.SET_LOBBIES then
        state.lobbies = action.payload
        return state
    else
        error("Undefined redux action type!")
    end
end

return interfaceReducer
