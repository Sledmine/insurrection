local widget = require "lua.scripts.widget"
local container = require "lua.scripts.ui.componentsV3.container"
local options = require "lua.scripts.ui.componentsV3.options"
local button = require "lua.scripts.ui.componentsV3.button"
local header = require "lua.scripts.ui.componentsV3.header"
local input = require "lua.scripts.ui.componentsV3.input"
local constants = require "lua.scripts.ui.components.constants"
local image = require "lua.scripts.ui.componentsV3.image"
local pos = constants.position

widget.init [[insurrection/ui/menus/login/]]

local layout = widget.align("vertical", 33, 328, 180, 14)
local layout2 = widget.align("vertical", 24, 328, 310, 2)

local containerLogin =  container {
    name ="login_menu",
    background ="transparent",
    childs = {
        {
       header {
             name = "login",
             title = "INSURRECTION - LOGIN",
             subtitle = "LOG INTO YOUR INSURRECTION ACCOUNT, GET ACCESS TO DIFFERENT SERVICES"
        },
        pos.header.x,
        pos.header.y
    },
    {
        image {
            name = "dialog_background",
            width= 334,
            height = 345,
            image = [[insurrection/ui/bitmaps/login_dialog_background.bitmap]]
        },

        253,
        78
    },
    {
        image {
            name = "insurrection_logo",
            width = 1280,
            height = 225,
            image =  [[insurrection/ui/bitmaps/insurrection_logo.bitmap]],
            scale  = 0.15
        },
        322,
        113
    },
    {
     options {
        name = "login_options",
        layout ="vertical",
        childs = {
            {
                input {
                   name = "username",
                  text = string.rep(" ", 23),
                   icon =  "insurrection/ui/bitmaps/user_icon.bitmap",
                 },
                  layout()
            },
            {
                input {
                    name ="password",
                    text =  string.rep(" ", 23),
                    icon = [[insurrection/ui/bitmaps/lock_icon.bitmap]],
                    password = true
                },
                 layout()
            },
            {
                button {
                    name ="login",
                   text = "LOGIN",
                   justification ="center_justify",
                },
                layout2(-12)
            },
             {
                button {
                    name = "register",
                    text ="REGISTER",
                    justification = "center_justify",

                },
                 layout2()
             },
             {
                button {
                    name ="back",
                    text ="BACK",
                    justification = "center_justify",
                    back = true
                },
                layout2()
             }
         }
        }
     },
      {constants.components.version.path, 0, 460}
    }
}

return containerLogin
