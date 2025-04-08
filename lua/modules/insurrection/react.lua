local react = {}

local mounted = {}

function react.mount(componentName)
    logger:debug("Mounting component " .. componentName)
    if not mounted[componentName] then
        logger:debug("Component " .. componentName .. " was not mounted, mounting it now")
        local component = require("insurrection.components.dynamic." .. componentName)
        if not component then
            error("Component " .. componentName .. " not found")
        end
        mounted[componentName] = component()
    end
    if not mounted[componentName] then
        error("Failed to mount component " .. componentName)
    end
    return mounted[componentName]
end

function react.render(componentName)
    local render = react.mount(componentName)
    logger:debug("Rendering component " .. componentName)
    return render()
end

function react.unmountAll()
    for k, v in pairs(mounted) do
        log("Unmounting component " .. k)
        mounted[k] = nil
    end
end

return react