local createStore = require "redux".createStore
local interfaceReducer = require "insurrection.redux.reducers.interfaceReducer"

local store = createStore(interfaceReducer)

return store