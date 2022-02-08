local widget = require "lua.scripts.widget"
local glue = require "lua.glue"

local normalButton = require "lua.scripts.ui.components.normalButton"
local labelButton = require "lua.scripts.ui.components.labelButton"
local largeButton = require "lua.scripts.ui.components.largeButton"

-- Edit menu container
widget.edit(
    [[insurrection\ui\menus\settings_menu\network_setup\network_settings_screen.ui_widget_definition]],
    {
        bounds = "0 0 480 856",
        background_bitmap = [[insurrection\ui\bitmaps\background_transparent.bitmap]]
    })

-- Edit options menu
widget.edit(
    [[insurrection\ui\menus\settings_menu\network_setup\network_options_menu.ui_widget_definition]],
    {
        bounds = "0 0 480 856",
        child_widgets = {
            -- Network settings buttons
            {horizontal_offset = 40, vertical_offset = 84},
            {horizontal_offset = 40, vertical_offset = 84 + 26},
            {horizontal_offset = 40, vertical_offset = 84 + 26 * 2},
            -- Buttons bar
            {horizontal_offset = 0}
        }
    })

-- Edit options, stop before button bar
for buttonIndex = 0, 2 do
    local buttonPath = widget.get(
                           [[insurrection\ui\menus\settings_menu\network_setup\network_options_menu.ui_widget_definition]],
                           ("child_widgets[%s].widget_tag"):format(buttonIndex))
    local buttonInstance = glue.deepcopy(largeButton("left_justify"))
    buttonInstance.child_widgets = {nil, {horizontal_offset = 150}}
    widget.edit(buttonPath, buttonInstance)

    local labelPath = widget.get(buttonPath, "child_widgets[0].widget_tag")
    widget.edit(labelPath, labelButton("left_justify"))

    local valuePath = widget.get(buttonPath, "child_widgets[1].widget_tag")
    widget.edit(valuePath, labelButton("center_justify", 0))
end

-- Edit buttons bar
local buttonBarPath = widget.get(
                          [[insurrection\ui\menus\settings_menu\network_setup\network_options_menu.ui_widget_definition]],
                          "child_widgets[3].widget_tag")
widget.edit(buttonBarPath, {
    bounds = "0 0 24 856",
    child_widgets = {{horizontal_offset = 40}, {horizontal_offset = 444}, {horizontal_offset = 630}}
})

for buttonIndex = 0, 2 do
    local buttonPath = widget.get(buttonBarPath,
                                  ("child_widgets[%s].widget_tag"):format(buttonIndex))
    widget.edit(buttonPath, normalButton("center_justify", 0))
end

widget.edit([[insurrection\ui\menus\settings_menu\network_setup\network_settings_help.ui_widget_definition]],
{
    bounds = "0 0 480 856",
    text_font = [[ui\gamespy.font]],
    -- Plus font offset
    horiz_offset = 400 + 40,
    vert_offset = 84
})