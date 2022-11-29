local widget = require "lua.scripts.widget"
local container = require "lua.scripts.ui.componentsV2.container"
local options = require "lua.scripts.ui.componentsV2.options"
local button = require "lua.scripts.ui.componentsV2.button"
local header = require "lua.scripts.ui.componentsV2.header"
local input = require "lua.scripts.ui.componentsV2.input"
local constants = require "lua.scripts.ui.components.constants"
local image = require "lua.scripts.ui.componentsV2.image"
local pos = constants.position

widget.init [[insurrection/ui/menus/login/]]

local layout = widget.align("vertical", 33, 328, 180, 14)
local layout2 = widget.align("vertical", 24, 328, 310, 2)

return container("login_menu", {
    {
        header("login", "INSURRECTION LOGIN",
               "LOG INTO YOUR INSURRECTION ACCOUNT, GET ACCESS TO DIFFERENT SERVICES"),
        pos.header.x,
        pos.header.y
    },
    {
        image("dialog_background", [[insurrection/ui/bitmaps/login_dialog_background.bitmap]], 334,
              345),
        253,
        78
    },
    {
        image("insurrection_logo", [[insurrection/ui/bitmaps/insurrection_logo.bitmap]], 1280, 225,
              0.15),
        322,
        113
    },
    {
        options("login_options", "vertical", {
            {
                input("username", string.rep(" ", 23),
                      {icon = "insurrection/ui/bitmaps/user_icon.bitmap"}),
                layout()
            },
            {
                input("password", string.rep(" ", 23),
                      {icon = [[insurrection/ui/bitmaps/lock_icon.bitmap]], password = true}),
                layout()
            },
            {button("login", "LOGIN", {justification = "center_justify"}), layout2(-12)},
            {button("register", "REGISTER", {justification = "center_justify"}), layout2()},
            {button("back", "BACK", {justification = "center_justify", back = true}), layout2()}
        })
    },
    {[[insurrection/ui/shared/version.ui_widget_definition]], 0, 460}
})
