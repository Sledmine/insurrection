local widget = require "lua.scripts.widget"
local container = require "lua.scripts.ui.componentsV2.container"
local options = require "lua.scripts.ui.componentsV2.options"
local button = require "lua.scripts.ui.componentsV2.button"
local label = require "lua.scripts.ui.componentsV2.label"
local image = require "lua.scripts.ui.componentsV2.image"
local constants = require "lua.scripts.ui.components.constants"

widget.init [[insurrection/ui/menus/dialog/]]

local layout = widget.align("vertical", 24, 336, 340, 2)

return container("dialog_menu", {
    {
        image("dialog_background", "insurrection/ui/bitmaps/dialog_menu_background.bitmap",
              constants.screen.width, constants.screen.height),
        0,
        0
    },
    {label("dialog_title", string.rep(" ", 64), {variant = "title", justify = "center"}), 0, 104},
    {label("dialog_subtitle", string.rep(" ", 128), {variant = "text", justify = "center"}), 0, 154},
    {
        label("dialog_text", string.rep(" ", 4096),
              {variant = "text", justify = "center", size = 60}),
        0,
        210
    },
    {
        options("dialog", "vertical", {
            {button("dialog_ok", "OK", {back = true, justification = "center_justify"}), layout()}
            -- {button("cancel", "CANCEL", {back = true}), layout()}
        })
    },
    {constants.components.version.path, 0, 460}
})
