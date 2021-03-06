local actions = {}

actions.types = {
    SET_IS_LOADING = "SET_IS_LOADING",
    SET_LOBBY = "SET_LOBBY",
    UPDATE_LOBBY = "UPDATE_LOBBY",
    SET_LOBBY_DEFINITION = "SET_LOBBY_DEFINITION",
    SET_SELECTED = "SET_SELECTED",
    SCROLL_LIST = "SCROLL_LIST"
}

function actions.setIsLoading(loading)
    return {type = actions.types.SET_IS_LOADING, payload = loading}
end

function actions.setLobby(key, lobby)
    return {type = actions.types.SET_LOBBY, payload = {key = key, lobby = lobby}}
end

function actions.updateLobby(key, lobby, filter)
    return {
        type = actions.types.UPDATE_LOBBY,
        payload = {key = key, lobby = lobby, filter = filter}
    }
end

---@param definition '"template"' | '"map"' | '"gametype"'
---@return table
function actions.setLobbyDefinition(definition)
    return {type = actions.types.SET_LOBBY_DEFINITION, payload = definition}
end

function actions.setSelected(element)
    return {type = actions.types.SET_SELECTED, payload = element}
end

function actions.scroll(scrollNext)
    return {type = actions.types.SCROLL_LIST, payload = scrollNext}
end

return actions
