local widget = require "lua.scripts.widget"
local container = require "lua.scripts.ui.componentsV2.container"
local header = require "lua.scripts.ui.componentsV2.header"
local options = require "lua.scripts.ui.componentsV2.options"
local button = require "lua.scripts.ui.componentsV2.button"
local constants = require "lua.scripts.ui.components.constants"
local checkbox = require "lua.scripts.ui.componentsV2.checkbox"
local spinner = require "lua.scripts.ui.componentsV2.spinner"
local footer = require "lua.scripts.ui.componentsV2.footer"
local pos = constants.position

widget.init [[insurrection/ui/menus/mods/optic/]]

local layout = widget.align("vertical", 24, pos.options.x, pos.options.y, 2)
local spinnersLayout = widget.align("vertical", 24,
                                    pos.options.x + constants.components.button.normal.width + 8,
                                    pos.options.y, 2)

-- Create volume values for spinner
local volume = {}
for i = 1, 100 do
    table.insert(volume, tostring(i))
end

return container("optic_mod_menu", {
    {header("optic_mod", "OPTIC", "CUSTOMIZE OPTIC MOD SETTINGS"), pos.header.x, pos.header.y},
    {
        options("optic_mod", "vertical", {
            {checkbox("enable_sound", "ENABLE SOUND"), layout()},
            {checkbox("hitmarker", "HITMARKER"), layout()},
            {checkbox("hud_messages", "HUD MESSAGES"), layout()},
            {spinner("volume", "VOLUME", volume), layout()},
            -- {spinner("mouse_sensitivity_x", "MOUSE SENSITIVITY X", sensitivities), spinnersLayout()},
            -- {spinner("mouse_sensitivity_y", "MOUSE SENSITIVITY Y", sensitivities), spinnersLayout()},
            {button("save_settings", "SAVE SETTINGS", {save = true}), pos.action.x, pos.action.y},
            {button("back", "BACK", {back = true}), pos.back.x, pos.back.y}
        })
    },
    {
        footer("optic_mod_footer", "SETTINGS",
               "Choose settings for the Optic mod.\r\nSome settings might require a restart to take effect."),
        layout(4)
    },
    {constants.components.currentProfile.path, 624, 20},
    {constants.components.version.path, 0, 460}
})
