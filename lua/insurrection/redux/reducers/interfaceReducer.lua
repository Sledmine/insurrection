local redux = require "redux"
local actions = require "insurrection.redux.actions"
local glue = require "glue"
local chunks = glue.chunks

---@class interfaceState
local defaultState = {
    isLoading = false,
    definition = "template",
    lobbyKey = nil,
    lobby = {maps = {}, gametypes = {}, members = {}, templates = {}},
    selected = {template = nil, map = nil, gametype = nil},
    currentChunk = 1,
    displayed = {}
}

---Game interface reducer
---@param state interfaceState
---@param action reduxAction
local function interfaceReducer(state, action)
    if action.type == redux.actionTypes.INIT then
        return defaultState
    elseif action.type == actions.types.SET_IS_LOADING then
        state.isLoading = action.payload
        return state
    elseif action.type == actions.types.SET_LOBBY then
        state.lobbyKey = action.payload.key
        state.lobby = action.payload.lobby
        state.displayed = chunks(state.lobby.templates, 4)[1]
        state.selected.template = state.lobby.templates[1]
        state.selected.map = state.lobby.maps[1]
        state.selected.gametype = state.lobby.gametypes[1]
        return state
    elseif action.type == actions.types.SET_LOBBY_DEFINITION then
        state.definition = action.payload
        local list = state.lobby[state.definition .. "s"]
        state.displayed = chunks(list, 4)[1]
        return state
    elseif action.type == actions.types.SET_SELECTED then
        state.selected[state.definition] = action.payload
        return state
    elseif action.type == actions.types.SCROLL_LIST then
        local list = state.lobby[state.definition .. "s"]
        local chunkCount = #chunks(list, 4)
        -- Scroll forward
        if not action.payload then
            if (state.currentChunk < chunkCount) then
                state.currentChunk = state.currentChunk + 1
            end
        else
            if (state.currentChunk > 1) then
                state.currentChunk = state.currentChunk - 1
            end
        end
        if (list and #list > 0) then
            local displayed = chunks(list, 4)[state.currentChunk]
            if displayed then
                state.displayed = displayed
            end
        end
        return state
    else
        error("Undefined redux action type!")
    end
    return state
end

return interfaceReducer
