--- Widget automated modifier using Invader
--- Sledmine
--- 1.0.0
local glue = require "glue"

local widget = {}

---@class childWidget
---@field widget_tag string
---@field name string
---@field vertical_offset number
---@field horizontal_offset number

---@class invaderWidget
---@field widget_type '"container"' | '"text_box"' | '"spinner_list"' | '"column_list"'
---@field bounds string
---@field flags any
---@field milliseconds_to_auto_close number
---@field milliseconds_to_auto_close_fade_time number
---@field background_bitmap string
---@field child_widgets childWidget[]
---@field justification '"left_justify"' | '"center_justify"' | '"right_justify"'
---@field text_font string
---@field horiz_offset number
---@field vert_offset number

local gamePath = os.getenv("HALO_CE_PATH")
local invaderRunner =
    ([[sudo docker run -it -v /storage/developing/halo-ce/insurrection/data:/invader/data -v /storage/developing/halo-ce/insurrection/tags:/invader/tags -v "%s/maps":/invader/maps invader-docker ]]):format(
        gamePath)
local editTagCmd = invaderRunner .. [[invader-edit "%s"]]
local countTagCmd = invaderRunner .. [[invader-edit "%s" -C %s]]
local getTagCmd = invaderRunner .. [[invader-edit "%s" -G %s]]

--- Build properties assignment type to invader string parameter
local function writeMapFields(field, value)
    local valueType = type(value)
    if (valueType ~= "table") then
        --print(field .. " = " .. tostring(value))
    end
    -- Text property
    if (valueType == "string") then
        return (" -S %s \"%s\""):format(field, tostring(value))
        -- Boolean property
    elseif (valueType == "boolean") then
        if (value) then
            return (" -S %s %s"):format(field, 1)
        end
        return (" -S %s %s"):format(field, 0)
        -- Number property
    elseif (valueType == "number") then
        return (" -S %s %s"):format(field, tostring(value))
        -- Table
    elseif (valueType == "table") then
        local sentence = ""
        --local isTagArray = false
        --glue.map(value, function(value)
        --    isTagArray = type(value) == "string"
        --end)
        --if (isTagArray) then
        --    for subField, subValue in pairs(value) do
        --        sentence = sentence ..
        --                       writeMapFields((field .. "[%s].widget_tag"):format(subField - 1),
        --                                      subValue)
        --    end
        --    return sentence
        --end
        for subField, subValue in pairs(value) do
            if (tonumber(subField)) then
                sentence = sentence .. writeMapFields((field .. "[%s]"):format(subField - 1), subValue)
            else
                sentence = sentence .. writeMapFields(field .. "." .. subField, subValue)
            end
        end
        return sentence
    else
        print(field)
        error("Unknown property type!")
    end
end

--- Set properties to widget
---@param widgetPath string Path to widget tag
---@param properties invaderWidget Properties to set into widget
function widget.edit(widgetPath, properties)
    print("\nModifying " .. widgetPath)
    local updateTagCmd = editTagCmd:format(widgetPath)
    glue.map(properties, function(property, value)
        updateTagCmd = updateTagCmd .. writeMapFields(property, value)
    end)
    --print(updateTagCmd)
    os.execute(updateTagCmd)
end

function widget.get(widgetPath, property)
    local pipe = io.popen(getTagCmd:format(widgetPath, property))
    local value = pipe:read("*a")
    --local value = pipe:read("*a"):gsub("\n", ""):gsub("\r", ""):gsub("/", "\\")
    return glue.string.trim(value)
end

function widget.count(widgetPath, property)
    local pipe = io.popen(countTagCmd:format(widgetPath, property))
    local value = pipe:read("*a")
    return tonumber(value)
end

return widget
