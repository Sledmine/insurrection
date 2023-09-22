local react = {}

local components = {}

function react.mount(path)
    dprint("Mounting component " .. path)
    if not components[path] then
        components[path] = require("insurrection.components.dynamic." .. path)()
    end
    return components[path]
end

function react.render(path)
    local component = react.mount(path)
    return component()
end

return react