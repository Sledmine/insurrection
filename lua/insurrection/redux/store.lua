local createStore = require "redux".createStore
local interfaceReducer = require "insurrection.redux.reducers.interfaceReducer"
local updateInterface = require "insurrection.interface".lobbyInit

local store = createStore(interfaceReducer)
--store:subscribe(updateInterface)

return store