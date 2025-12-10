local lanes = require "lanes"

local async = {}

async._VERSION = "1.0.2"

local asyncLibs = "*"
THREAD_LANES = {}

---Perform an async function
---@generic T, U
---@param inputFunction fun(await: fun(callback: fun(...:U): (T?), ...:U): T)
function async.async(inputFunction)
    local co
    local await = function(asyncCallback, ...)
        if not asyncCallback or type(asyncCallback) ~= "function" then
            error("Await callback is not a function or is nil", 2)
            return
        end
        table.insert(THREAD_LANES, {
            thread = lanes.gen(asyncLibs, asyncCallback)(...),
            callback = function(ret)
                local ok, message = coroutine.resume(co, ret)
                if not ok then
                    error(debug.traceback(co, message), 0)
                end
            end,
            co = co
        })
        return coroutine.yield()
    end
    ---@return boolean success Async function has finished successfully
    return function()
        co = coroutine.create(inputFunction)
        local ok, message = coroutine.resume(co, await)
        if not ok then
            error(debug.traceback(co, message), 0)
        end
        return ok
    end
end

---Configure the async module to use the specified libraries
---@param libs any
function async.configure(libs)
    asyncLibs = libs
end

---Dispatches the async functions and returns the number of async functions still running
function async.dispatch()
    for index, lane in ipairs(THREAD_LANES) do
        --print(lane.thread.status)
        if lane.thread.status == "done" then
            table.remove(THREAD_LANES, index)
            lane.callback(lane.thread[1])
        elseif lane.thread.status == "error" then
            local threadError = lane.thread[1]
            table.remove(THREAD_LANES, index)
            error(threadError)
        end
    end
    return #THREAD_LANES
end

return async