local actionTypes = {INIT = "@@lua-redux/INIT"}

local function inverse(table)
    local newTable = {}
    for k, v in pairs(table) do
        newTable[v] = k
    end
    return newTable
end

---@class reduxAction
---@field type string
---@field payload any

---Create a redux store for the application state
---@param reducer fun(action:string, payload:any)
---@param preloadedState any
local function createStore(reducer, preloadedState)
    local store = {reducer = reducer, state = preloadedState, subscribers = {}}

    ---Subscribe a function callback to this store
    ---@param callback function
    ---@return function unsubscribe Unsubscribe function for this store
    function store:subscribe(callback)
        local i = table.insert(self.subscribers, callback)
        return function()
            table.remove(self.subscribers, inverse(self.subscribers)[callback])
        end
    end

    ---Dispatch an action event to the store
    ---@param action reduxAction
    function store:dispatch(action)
        self.state = self.reducer(self.state, action)
        for k, v in pairs(self.subscribers) do
            v()
        end
    end

    ---Return the state of the store
    ---@return any
    function store:getState()
        return self.state
    end

    ---Replace the reducer of this store with a given one
    ---@return any
    function store:replaceReducer(reducer)
        self.reducer = reducer
        self:dispatch({type = actionTypes.INIT})
    end

    store:dispatch({type = actionTypes.INIT})

    return store
end

return {actionTypes = actionTypes, createStore = createStore}
