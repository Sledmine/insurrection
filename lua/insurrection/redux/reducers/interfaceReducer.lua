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
    displayed = {},
    filtered = {},
    list = {},
    currentChunk = 1,
    chunkSize = 4
}

---Game interface reducer
---@param state interfaceState
---@param action reduxAction
local function interfaceReducer(state, action)
    if action.type == redux.actionTypes.INIT then
        return glue.deepcopy(defaultState)
    elseif action.type == actions.types.SET_IS_LOADING then
        state.isLoading = action.payload
        return state
    elseif action.type == actions.types.SET_LOBBY then
        state.lobbyKey = action.payload.key
        state.lobby = action.payload.lobby
        local available = state.lobby.available
        state.chunkSize = 4
        state.list = state.lobby.available[state.definition .. "s"]
        state.displayed = chunks(available.templates, state.chunkSize)[1]
        state.selected = defaultState.selected
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
            state.filtered = glue.map(state.lobby.available[state.definition .. "s"],
                                      function(mapName)
                if mapName:lower():find(action.payload.filter:lower(), 1, true) then
                    return mapName
                end
            end)
            state.currentChunk = 1
            if state.filtered then
                state.displayed = chunks(state.filtered, 4)[state.currentChunk] or {}
                table.sort(state.displayed, function(a, b)
                    if a and b then
                        return a < b
                    end
                end)
            end
        end
        return state
    elseif action.type == actions.types.SET_LOBBY_DEFINITION then
        state.definition = action.payload
        state.list = state.lobby.available[state.definition .. "s"]
        state.chunkSize = 4
        state.displayed = chunks(state.list, state.chunkSize)[state.currentChunk]
        return state
    elseif action.type == actions.types.SET_SELECTED_ITEM then
        state.selected = action.payload
        return state
    elseif action.type == actions.types.SET_SELECTED then
        state.selected[state.definition] = action.payload
        return state
    elseif action.type == actions.types.SET_LIST then
        state.chunkSize = action.payload.chunkSize or defaultState.chunkSize
        state.currentChunk = 1
        state.list = action.payload.list
        state.displayed = chunks(action.payload.list, state.chunkSize)[state.currentChunk] or {}
        return state
    elseif action.type == actions.types.SCROLL_LIST then
        local list = state.list
        local chunkCount = #chunks(list, state.chunkSize)
        -- Scroll forward
        if not action.payload.scrollNext then
            if (state.currentChunk < chunkCount) then
                state.currentChunk = state.currentChunk + 1
            end
        else
            if (state.currentChunk > 1) then
                state.currentChunk = state.currentChunk - 1
            end
        end
        if (list and #list > 0) then
            local displayed = chunks(list, state.chunkSize)[state.currentChunk]
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
