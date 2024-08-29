local store = require "insurrection.redux.store"

---Returns the current state of the redux store
---@return interfaceState
return function ()
    ---@type interfaceState
    local state = store:getState()
    return state
end