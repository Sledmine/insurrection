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
local widgetItemsPath = [[insurrection\ui\menus\settings_menu\]]
local tagTemplate = [[invader-edit -t tags\ %s%s.ui_widget_definition]]
local tagGetTemplate = [[invader-edit -t tags\ %s.ui_widget_definition -G]]

-- Widget list fields definition
local vertical_offset = 58
local horizontal_offset = 40
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
    bounds = "0 0 24 184",
    background_bitmap = [[insurrection\ui\bitmaps\normal_button.bitmap]],
    text_font = [[ui\large_ui.font]],
    text_color = "1 1 1 1",
    justification = "left_justify",
    horiz_offset = 10,
    vert_offset = 5
}

--- Build properties assignment type to invader string parameter
local function writeMapFields(field, value)
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
                           writeMapFields((field .. "[%s]"):format(subField), subValue)
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

local updateList = tagTemplate:format(widgetItemsPath, "profile_edit_select_list")
print("-> Updating buttons list...")
-- Multiple widgets generation
for childIndex = 0,8 do
    vertical_offset = vertical_offset + 26
    widgetList.child_widgets[childIndex] = {
        horizontal_offset = horizontal_offset,
        vertical_offset = vertical_offset
    }
    
    local childTagPath = tagGetTemplate:format(widgetItemsPath .. "profile_edit_select_list") .. (" child_widgets[%s].widget_tag"):format(childIndex)
    childTagPath = glue.readpipe(childTagPath)
    local updateItem = tagTemplate:gsub(".ui_widget_definition", ""):format(childTagPath:gsub("\n", ""), "")
    glue.map(widgetItem, function(property, value)
        updateItem = updateItem .. writeMapFields(property, value)
    end)
--
    print(updateItem)
    os.execute(updateItem)
end

glue.map(widgetList, function(property, value)
    updateList = updateList .. writeMapFields(property, value)
end)
print(updateList)
os.execute(updateList)

print("Done!")
