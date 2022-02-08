--- Convert any lua table to a ui_widget_definition
local argparse = require "argparse"
local glue = require "glue"

local parser =
    argparse("generateButtons", "Automatically generate dynamic widget buttons")

--parser:flag("-l --list", "Automatically generate a widget list for the buttons"):args("?")
-- parser:argument("listName", "Name of the list that will contain the buttons")
-- TODO Add triggers automatic generation

---@class args
---@field path string
---@field buttonName string
---@field buttonsQuantity number
---@field separation number

---@type args
local args = parser:parse()
local serverItemsPath = [[insurrection\ui\menus\servers_menu\servers_list\]]
local tagTemplate = [[invader-edit -t tags\ %s%s.ui_widget_definition]]

-- Widget list fields definition
--local vertical_offset = 49
local horizontal_offset = 0
local widgetList = {
    --widget_type = "column_list",
    --bounds = "0 0 480 640",
    -- bounds = "0 0 " .. (args.buttonsQuantity * args.separation) .. " 535",
    --flags = {
    --    pass_unhandled_events_to_focused_child = true,
    --    dpad_up_down_tabs_thru_children = true
    --},
    child_widgets = {}
}

-- Widget fields definitions
local widgetItem = {
    -- scaleH, scaleW, height, width
    -- t, r, b, l
    bounds = "0 0 16 640",
    background_bitmap = [[insurrection\ui\bitmaps\scroll_item.bitmap]],
    -- Remove when we don't need value labels anymore
    child_widgets = {
        {
            vertical_offset = 3,
            horizontal_offset = 46
        },
        {
            vertical_offset = 3,
            horizontal_offset = 89
        },
        {
            vertical_offset = 0,
            horizontal_offset = 150
        },
        {
            vertical_offset = 0,
            horizontal_offset = 462
        },
        {
            vertical_offset = 0,
            horizontal_offset = 594
        },
        {
            vertical_offset = 0,
            horizontal_offset = 618
        },
        {
            vertical_offset = 0,
            horizontal_offset = 697
        },
        {
            vertical_offset = 0,
            horizontal_offset = 766
        },
    }
}

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
    elseif (valueType == "table") then
        local sentence = ""
        for subField, subValue in pairs(value) do
            if (tonumber(subField)) then
                sentence = sentence ..
                           mapFields((field .. "[%s]"):format(subField - 1), subValue)
            else
                sentence = sentence .. mapFields(field .. "." .. subField, subValue)
            end
        end
        return sentence
    else
        print(field)
        error("Unknown property type!")
    end
end

local updateList = tagTemplate:format(serverItemsPath, "servers_list_items")
print("-> Updating buttons list...")
-- Multiple widgets generation
for childIndex = 4, 18 do
    widgetList.child_widgets[childIndex] = {
        horizontal_offset = horizontal_offset
    }

    glue.map(widgetList, function(property, value)
        updateList = updateList .. mapFields(property, value)
    end)
    local updateItem = tagTemplate:format(serverItemsPath, "items_list\\item_" .. childIndex - 3)
    glue.map(widgetItem, function(property, value)
        updateItem = updateItem .. mapFields(property, value)
    end)

    -- print(createButton)
    print("Finished button " .. childIndex .. "!!!\n")
    print(updateList)
    print(updateItem)
    os.execute(updateList)
    os.execute(updateItem)
end

print("Done!")
