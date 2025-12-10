local store = require "insurrection.redux.store"

---Returns the current state of the redux store
---@return interfaceState
return function ()
    return store:getState()
end