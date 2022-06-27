local widget = require "lua.scripts.widget"

local normalButton = require "lua.scripts.ui.components.normalButton"
local labelButton = require "lua.scripts.ui.components.labelButton"
local arrow = require "lua.scripts.ui.components.arrow"
local generalDescription = require "lua.scripts.ui.components.generalDescription"
local menuHeader = require "lua.scripts.ui.components.menuHeader"
local constants = require "lua.scripts.ui.components.constants"

local wrapperPath =
    [[ui\shell\main_menu\multiplayer_type_select\connected\connected_map_select_wrapper.ui_widget_definition]]
local containerPath =
    [[ui\shell\main_menu\multiplayer_type_select\mp_map_select\mp_map_select_screen.ui_widget_definition]]
local menuPath = [[insurrection\ui\menus\multiplayer_lan\]]
local headerPath = menuPath .. "multiplayer_lan_menu_header.ui_widget_definition"
local optionsPath = widget.get(containerPath, "child_widgets[1].widget_tag")

-- Edit wrapper
widget.edit(wrapperPath,
            {bounds = "0 0 " .. constants.screen.height .. " " .. constants.screen.width})
-- Create menu header
widget.create(headerPath, menuHeader("multiplayer_lan_menu", "CREATE LEGACY GAME",
                                     "CREATE GAME ON NETWORK, CHOOSE MAP AND GAMETYPE TO PLAY"))
-- Edit container
widget.edit(containerPath, {
    bounds = "0 0 " .. constants.screen.height .. " " .. constants.screen.width,
    background_bitmap = [[insurrection\ui\bitmaps\background_transparent.bitmap]],
    child_widgets = {
        {widget_tag = headerPath, vertical_offset = 20, horizontal_offset = 40},
        nil,
        {widget_tag = ".ui_widget_definition", vertical_offset = 0, horizontal_offset = 0}
    }
})
-- Edit options list
widget.edit(optionsPath, {
    bounds = "0 0 480 854",
    background_bitmap = ".bitmap",
    child_widgets = {
        -- Map navigation buttons
        {horizontal_offset = 40, vertical_offset = widget.offset(84, 24, 2, 1)},
        {horizontal_offset = 40, vertical_offset = widget.offset(84, 24, 2, 2)},
        {horizontal_offset = 40, vertical_offset = widget.offset(84, 24, 2, 3)},
        {horizontal_offset = 40, vertical_offset = widget.offset(84, 24, 2, 4)},
        {horizontal_offset = 40, vertical_offset = widget.offset(84, 24, 2, 5)},
        {horizontal_offset = 40, vertical_offset = widget.offset(84, 24, 2, 6)},
        {horizontal_offset = 40, vertical_offset = widget.offset(84, 24, 2, 7)},
        {horizontal_offset = 40, vertical_offset = widget.offset(84, 24, 2, 8)},
        {horizontal_offset = 40, vertical_offset = widget.offset(84, 24, 2, 9)},
        {horizontal_offset = 40, vertical_offset = widget.offset(84, 24, 2, 10)},
        {horizontal_offset = 40, vertical_offset = widget.offset(84, 24, 2, 11)},
        -- Buttons bar
        {horizontal_offset = 0}
    }
})

-- Edit options headers
local optionsCount = widget.count(optionsPath, "child_widgets")
for buttonIndex = 0, 10 do
    local buttonPath = widget.get(optionsPath, "child_widgets[" .. buttonIndex .. "].widget_tag")
    -- Only consider button as select if they are not arrow buttons (first one and last one)
    local buttonInstance = normalButton("left_justify", nil, nil, nil, nil,
                                        (buttonIndex ~= 0 and buttonIndex ~= 10))
    buttonInstance.child_widgets = {
        -- Text
        {horizontal_offset = 0},
        -- Arrows
        nil,
        -- Up Arrow
        {horizontal_offset = 90, vertical_offset = 7},
        -- Down Arrows
        {horizontal_offset = 90, vertical_offset = 7}
    }
    widget.edit(buttonPath, buttonInstance)

    local labelPath = widget.get(buttonPath, "child_widgets[0].widget_tag")
    local labelInstance = labelButton("left_justify")
    labelInstance.text_color = "1 0.47 0.47 0.47"
    widget.edit(labelPath, labelInstance)

    local scrollUpPath = widget.get(buttonPath, "child_widgets[2].widget_tag")
    widget.edit(scrollUpPath, arrow("up"))

    local scrollDownPath = widget.get(buttonPath, "child_widgets[3].widget_tag")
    widget.edit(scrollDownPath, arrow("down"))
end

-- Edit buttons bar
local buttonBarPath =
    widget.get(optionsPath, "child_widgets[" .. optionsCount - 1 .. "].widget_tag")
widget.edit(buttonBarPath, {
    bounds = "0 0 24 854",
    child_widgets = {{horizontal_offset = 444}, {horizontal_offset = 630}}
})

local okButtonPath = widget.get(buttonBarPath, "child_widgets[0].widget_tag")
widget.edit(okButtonPath, normalButton())
local backButtonPath = widget.get(buttonBarPath, "child_widgets[1].widget_tag")
widget.edit(backButtonPath, normalButton())

-- Edit description
local descriptionPath = widget.get(optionsPath, "extended_description_widget")
widget.edit(descriptionPath, generalDescription("maps"))
