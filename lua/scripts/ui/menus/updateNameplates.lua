--- Convert any lua table to a ui_widget_definition
local glue = require "glue"
local fs = require "fs"

local tagTemplate = [[invader-edit -t tags\ insurrection\ui\shared\nameplates.tag_collection -N ]]
local bitmapTemplate = [[invader-bitmap -t tags\ -d data\ -T interface_bitmaps %s]]
--- Build properties assignment type to invader string parameter
local function mapFields(field, value)
    local valueType = type(value)
    if (valueType ~= "table") then
        print("Writting " .. field .. " = " .. tostring(value))
    end
    -- Text property
    if (valueType == "string") then
        -- FIXME Split button index asignation via keyword without string formatting
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
    elseif (valueType == "table" and #value == 0) then
        local sentence = ""
        for subField, subValue in pairs(value) do
            sentence = sentence .. mapFields(field .. "." .. subField, subValue)
        end
        return sentence
        -- Array
    elseif (valueType == "table" and #value > 0) then
        -- Reserve elements space
        local sentence = (" -I %s %s end"):format(field, #value)
        for elementIndex, subValue in ipairs(value) do
            sentence = sentence .. mapFields((field .. "[%s]"):format(elementIndex - 1), subValue)
        end
        return sentence
    else
        print(field)
        error("Unknown property type!")
    end
end

local tagCollection = {tags = {}}

local createCollection = tagTemplate
for name, d in fs.dir([[data\insurrection\ui\shared\bitmaps\nameplates]]) do
    if not name then
        print("error: ", d)
        break
    end
    local type = d:attr "type"
    if (type == "file") then
        local filePath = d:path():gsub("data\\", "")
        tagCollection.tags[#tagCollection.tags + 1] = {reference = filePath:gsub((".tif"):gsub('[%^%$%(%)%%%.%[%]%*%+%-%?]','%%%1'), ".bitmap")}
        
        local bitmapPath = filePath:gsub((".tif"):gsub('[%^%$%(%)%%%.%[%]%*%+%-%?]','%%%1'), "")
        os.execute(bitmapTemplate:format(bitmapPath))
    end
end
glue.map(tagCollection, function(property, value)
    createCollection = createCollection .. mapFields(property, value)
end)
--print(createCollection)
os.execute(createCollection)
