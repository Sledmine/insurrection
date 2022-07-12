local redux = require "redux"
local actions = require "insurrection.redux.actions"
local glue = require "glue"
local chunks = glue.chunks

---@class interfaceState
local defaultState = {
    isLoading = false,
    definition = "template",
    lobbyKey = nil,
    lobby = {
        available = {maps = {}, gametypes = {}, templates = {}},
        owner = "",
        map = "",
        gametype = "",
        member = "",
        template = ""
    },
    selected = {template = nil, map = nil, gametype = nil},
    currentChunk = 1,
    displayed = {},
    filtered = {}
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
        local available = state.lobby.available
        state.displayed = chunks(available.templates, 4)[1]
        state.selected.template = available.templates[1]
        state.selected.map = available.maps[1]
        state.selected.gametype = available.gametypes[1]
        return state
    elseif action.type == actions.types.UPDATE_LOBBY then
        if action.payload.key then
            state.lobbyKey = action.payload.key
        end
        if action.payload.lobby then
            state.lobby = action.payload.lobby
        end
        if action.payload.filter then
            local filtered = glue.map(state.lobby.available[state.definition .. "s"],
                                      function(mapName)
                if mapName:lower():find(action.payload.filter:lower(), 1, true) then
                    return mapName
                end
            end)
            state.currentChunk = 1
            if filtered then
                local displayed = chunks(filtered, 4)[state.currentChunk] or {}
                state.displayed = displayed
            end
        end
        return state
    elseif action.type == actions.types.SET_LOBBY_DEFINITION then
        state.definition = action.payload
        local list = state.lobby.available[state.definition .. "s"]
        state.currentChunk = 1
        state.displayed = chunks(list, 4)[1]
        return state
    elseif action.type == actions.types.SET_SELECTED then
        state.selected[state.definition] = action.payload
        return state
    elseif action.type == actions.types.SCROLL_LIST then
        local list = state.lobby.available[state.definition .. "s"]
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
