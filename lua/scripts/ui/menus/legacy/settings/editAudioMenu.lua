local widget = require "lua.scripts.widget"
local glue = require "lua.lua_modules.glue"

local normalButton = require "lua.scripts.ui.components.normalButton"
local labelButton = require "lua.scripts.ui.components.labelButton"
local largeButton = require "lua.scripts.ui.components.largeButton"
local settingsDescription = require "lua.scripts.ui.components.settingsDescription"

local containerPath =
    [[insurrection\ui\menus\settings_menu\audio_settings\audio_settings_screen.ui_widget_definition]]
local headerPath = widget.get(containerPath, "child_widgets[0].widget_tag")
local optionsPath = widget.get(containerPath, "child_widgets[1].widget_tag")

-- Edit container
widget.edit(containerPath, {
    bounds = "0 0 480 856",
    background_bitmap = [[insurrection\ui\bitmaps\background_transparent.bitmap]],
    child_widgets = {{vertical_offset = 20, horizontal_offset = 40}}
})

-- Edit header
if widget.count(headerPath, "child_widgets") < 2 then
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

-- Edit options list
widget.edit(optionsPath, {
    bounds = "0 0 480 856",
    child_widgets = {
        -- Network settings buttons
        {horizontal_offset = 40, vertical_offset = 84 + 26 * 0},
        {horizontal_offset = 40, vertical_offset = 84 + 26 * 1},
        {horizontal_offset = 40, vertical_offset = 84 + 26 * 2},
        {horizontal_offset = 40, vertical_offset = 84 + 26 * 3},
        {horizontal_offset = 40, vertical_offset = 84 + 26 * 4},
        {horizontal_offset = 40, vertical_offset = 84 + 26 * 5},
        {horizontal_offset = 40, vertical_offset = 84 + 26 * 6},
        -- Buttons bar
        {horizontal_offset = 0}
    }
})

-- Edit options, stop before button bar
local optionsCount = widget.count(optionsPath, "child_widgets")
for buttonIndex = 0, optionsCount - 2 do
    local buttonPath = widget.get(optionsPath, ("child_widgets[%s].widget_tag"):format(buttonIndex))
    local buttonInstance = glue.deepcopy(largeButton("left_justify"))
    buttonInstance.child_widgets = {nil, {horizontal_offset = 150}}
    widget.edit(buttonPath, buttonInstance)

    local labelPath = widget.get(buttonPath, "child_widgets[0].widget_tag")
    widget.edit(labelPath, labelButton("left_justify"))

    local valuePath = widget.get(buttonPath, "child_widgets[1].widget_tag")
    widget.edit(valuePath, labelButton("center_justify", 0))
end

-- Edit buttons bar
local buttonBarPath = widget.get(optionsPath,
                                 ("child_widgets[%s].widget_tag"):format(optionsCount - 1))
widget.edit(buttonBarPath, {
    bounds = "0 0 24 856",
    child_widgets = {{horizontal_offset = 40}, {horizontal_offset = 444}, {horizontal_offset = 630}}
})

for buttonIndex = 0, 2 do
    local buttonPath = widget.get(buttonBarPath,
                                  ("child_widgets[%s].widget_tag"):format(buttonIndex))
    widget.edit(buttonPath, normalButton())
end

-- Edit description
local descriptionPath = widget.get(optionsPath, "extended_description_widget")
widget.edit(descriptionPath, settingsDescription())
