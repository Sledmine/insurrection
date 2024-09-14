local react = {}

local mounted = {}

function react.mount(component)
    logger:debug("Mounting component " .. component)
    if not mounted[component] then
        mounted[component] = require("insurrection.components.dynamic." .. component)()
    end
    if not mounted[component] then
        error("Failed to mount component " .. component)
    end
    return mounted[component]
end

function react.render(component)
    logger:debug("Rendering component " .. component)
    local render = react.mount(component)
    return render()
end

function react.unmountAll()
    for k, v in pairs(mounted) do
        logger:debug("Unmounting component " .. k)
        mounted[k] = nil
    end
end

return react