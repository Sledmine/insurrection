local widget = require "lua.scripts.widget"
local strmem = widget.strmem
local container = require "lua.scripts.ui.componentsV3.container"
local options = require "lua.scripts.ui.componentsV3.options"
local button = require "lua.scripts.ui.componentsV3.button"
local header = require "lua.scripts.ui.componentsV3.header"
local input = require "lua.scripts.ui.componentsV3.input"
local constants = require "lua.scripts.ui.components.constants"
local image = require "lua.scripts.ui.componentsV3.image"
local checkbox = require "lua.scripts.ui.componentsV3.checkbox"
local label = require "lua.scripts.ui.componentsV3.label"
local buttonLogin = require "lua.scripts.ui.componentsV3.buttonLogin"
local buttonSquare = require "lua.scripts.ui.componentsV3.buttonSquare"
local pos = constants.position

widget.init [[insurrection/ui/menus/login/]]

local loginAreaWidth = 200
local insuLogoWidth = 816
local insuLogoScale = 0.15
local inputBoxWidth = 132

local containerLogin = container {
    name = "login_menu_new",
    background = "login",
    childs = {
        {
            image {
                name = "login_area",
                width = loginAreaWidth,
                height = 480,
                bitmap = [[insurrection/ui/redesign/bitmaps/login_info_area.bitmap]]
            },
            0,
            0
        },
        {
            image {
                name = "insurrection_logo_new",
                width = insuLogoWidth,
                height = 614,
                bitmap = [[insurrection/ui/redesign/bitmaps/insurrection_logo.bitmap]],
                scale = insuLogoScale
            },
            (loginAreaWidth - (insuLogoWidth * insuLogoScale)) / 2,
            20
        },
        {
            label {
                name = "login_title",
                text = strmem(256, "LOGIN"),
                variant = "title",
                color = "white"
            },
            33,
            140
        },
        {
            label {
                name = "username_new",
                text = strmem(256, "Username"),
                --variant = "button",
                color = "white"
            },
            33,
            180
        },
        {
            label {
                name = "password_new",
                text = strmem(256, "Password"),
                --variant = "button",
                color = "white"
            },
            33,
            220
        },
        -- Input fields for username and password
        {
            options {
                name = "login_new_options",
                layout = "vertical",
                childs = {
                    {
                        input {
                            name = "username_new",
                            text = string.rep(" ", 23),
                            variant = "login",
                            --placeholder = "Your Username",
                            --icon = [[insurrection/ui/redesign/bitmaps/login_input_textbox.bitmap]]
                        },
                        (loginAreaWidth - inputBoxWidth) / 2,
                        200
                    },
                    {
                        input {
                            name = "userpswrd_new",
                            text = string.rep(" ", 23),
                            variant = "login",
                            --placeholder = "Your Password",
                            password = true,
                            --icon = [[insurrection/ui/redesign/bitmaps/login_input_textbox.bitmap]]
                        },
                        (loginAreaWidth - inputBoxWidth) / 2,
                        240
                    },
                    {
                        checkbox {
                            name = "show_password_checkbox",
                            variant = "show_hide",
                            align = "right",
                            transparent = true
                        },
                        145,
                        239
                    },
                    {
                        checkbox {
                            name = "remember_me_checkbox",
                            --text = "Remember Me",
                            variant = "slider",
                            transparent = true,
                            align = "left"
                        },
                        (loginAreaWidth - inputBoxWidth) / 2,
                        258
                    },
                    {
                        label {
                            name = "remember_me_label",
                            variant = "subtitle",
                            text = strmem(256, "Remember Me"),
                            color = "white"
                        },
                        (loginAreaWidth - inputBoxWidth) / 2 + 25,
                        258
                    },
                    {
                        buttonLogin {
                            name = "login_button_new",
                            text = "Login",
                            justification = "center_justify"
                        },
                        (loginAreaWidth - inputBoxWidth) / 2,
                        320
                    }
                }
            }
        },
        {constants.components.version.path, pos.version.x, pos.version.y}
    }
}

widget.global(containerLogin, "insurrection/ui/custom_menus.tag_collection")

return containerLogin
