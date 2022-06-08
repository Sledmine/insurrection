local widget = require "lua.scripts.widget"
local glue = require "lua.lua_modules.glue"

local normalButton = require "lua.scripts.ui.components.normalButton"
local labelButton = require "lua.scripts.ui.components.labelButton"
local largeButton = require "lua.scripts.ui.components.largeButton"
local arrow = require "lua.scripts.ui.components.arrow"
local generalDescription = require "lua.scripts.ui.components.generalDescription"

local containerPath =
    [[ui\shell\main_menu\multiplayer_type_select\mp_map_select\mp_map_select_screen.ui_widget_definition]]
local headerPath = widget.get(containerPath, "child_widgets[0].widget_tag")
local optionsPath = widget.get(containerPath, "child_widgets[1].widget_tag")
-- local headerBitmapPath = widget.get(containerPath, "child_widgets[2].widget_tag")

--Edit container
widget.edit(containerPath, {
    bounds = "0 0 480 856",
    background_bitmap = [[insurrection\ui\bitmaps\background_transparent.bitmap]],
    child_widgets = {{vertical_offset = 20, horizontal_offset = 40}}
})

--Edit header
if widget.count(headerPath,"child_widgets") < 2 then
    widget.insert(headerPath, "child_widgets", 2)
end
widget.edit(headerPath, {
    background_bitmap = ".bitmap",
    bounds = "0 0 40 450",
    child_widgets = {
        {
            widget_tag = [[insurrection\ui\menus\settings_menu\titles\header_title.ui_widget_definition]],
            vertical_offset = 0,
            horizontal_offset = 0
        },
        {
            widget_tag = [[insurrection\ui\menus\settings_menu\titles\header_subtitle.ui_widget_definition]],
            vertical_offset = 15,
            horizontal_offset = 0
        }
    }
})

--Edit options list
widget.edit(optionsPath, {
    bounds = "0 0 480 856",
    background_bitmap = ".bitmap",
    child_widgets = {
        -- Map navigation buttons
        {horizontal_offset = 40, vertical_offset = 84 + 26 * 0},
        {horizontal_offset = 40, vertical_offset = 84 + 26 * 1},
        {horizontal_offset = 40, vertical_offset = 84 + 26 * 2},
        {horizontal_offset = 40, vertical_offset = 84 + 26 * 3},
        {horizontal_offset = 40, vertical_offset = 84 + 26 * 4},
        {horizontal_offset = 40, vertical_offset = 84 + 26 * 5},
        {horizontal_offset = 40, vertical_offset = 84 + 26 * 6},
        {horizontal_offset = 40, vertical_offset = 84 + 26 * 7},
        {horizontal_offset = 40, vertical_offset = 84 + 26 * 8},
        {horizontal_offset = 40, vertical_offset = 84 + 26 * 9},
        {horizontal_offset = 40, vertical_offset = 84 + 26 * 10},
        -- Buttons bar
        {horizontal_offset = 0}
    }
})

-- Edit options headers
local optionsCount = widget.count(optionsPath, "child_widgets")
for buttonIndex = 0, 10 do
     local buttonPath = widget.get(optionsPath, ("child_widgets[%s].widget_tag"):format(buttonIndex))
     widget.edit(buttonPath, largeButton("left_justify", true))

     local labelPath = widget.get(buttonPath, "child_widgets[0].widget_tag")
     widget.edit(labelPath, labelButton("left_justify"))

     local scrollUpPath = widget.get(buttonPath, "child_widgets[2].widget_tag")
     widget.edit(scrollUpPath, arrow("up"))

     local scrollDownPath = widget.get(buttonPath, "child_widgets[3].widget_tag")
     widget.edit(scrollDownPath, arrow("down"))
end

-- Edit buttons bar
local buttonBarPath =  widget.get(optionsPath, ("child_widgets[%s].widget_tag"): format(optionsCount - 1))
widget.edit(buttonBarPath, {
    bounds = "0 0 24 856",
    child_widgets = {{horizontal_offset = 380}, {horizontal_offset = 600}}
})

local buttonIndexCount = widget.count(buttonBarPath, "child_widgets")
if buttonIndexCount == 2 then
    local okButtonPath = widget.get(buttonBarPath, "child_widgets[0].widget_tag")
    widget.edit(okButtonPath, normalButton())
    local backButtonPath = widget.get(buttonBarPath, "child_widgets[1].widget_tag")
    widget.edit(backButtonPath, normalButton())
end

-- Edit description
local descriptionPath = widget.get(optionsPath, "extended_description_widget")
widget.edit(descriptionPath, generalDescription("maps"))
