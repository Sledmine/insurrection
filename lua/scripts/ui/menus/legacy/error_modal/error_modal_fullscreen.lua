local widget = require "lua.scripts.widget"
local constants = require "lua.scripts.ui.components.constants"
local container = require "lua.scripts.ui.componentsV3.container"
local header = require "lua.scripts.ui.componentsV3.header"
local wrapper = require "lua.scripts.ui.componentsV3.wrapper"
local label = require "lua.scripts.ui.componentsV3.label"
local options = require "lua.scripts.ui.componentsV3.options"
local button = require "lua.scripts.ui.componentsV3.button"

widget.init [[insurrection/ui/menus/error_modal/]]

local layout = widget.layout {
    alignment = "horizontal",
    margin = 2,
    size = 26,
    horizontal = 336,
    vertical = 340
}

local messages = {
    "Unable to complete\r\nthe last operation.",
    "A networking error\r\nhas occurred.",
    "Unable to join game \r\nbecause it is closed.",
    "Unable to join game.",
    "The game has\r\nclosed down.",
    "Halo can't connect to\r\nthe network.",
    "Network connection lost.",
    "Failed to join the game.",
    "Your game has\r\ngone out of sync with\r\nthe others in\r\nthe game. Resetting...",
    "Your connection is\r\nexperiencing\r\ndifficulties...",
    "unused network error",
    "A controller error\r\nhas occurred.",
    "Please reconnect\r\ncontroller #%controller.\r\nPress START to continue\r\nafter reconnecting.",
    "Please reconnect\r\n#%controller controller.",
    "A controller\r\nmemory card error\r\nhas occurred.",
    "Saving... one moment\r\nplease.",
    "Creating player profile...\r\none moment please.",
    "Creating game settings\r\nfile... one moment please.",
    "Player 2 must use a\r\ndifferent controller\r\nthan Player 1.",
    "unused controller error",
    "unused controller error",
    "Please insert\r\nanother quarter.",
    "All progress since the\r\nlast checkpoint will\r\nbe lost.",
    "All progress on this \r\nlevel will be lost.",
    "Are you sure you wish \r\nto delete this profile? \r\nAll your progress and \r\nsettings will be lost.",
    "Are you sure you wish \r\nto delete this\r\ngametype? All your\r\nsettings will be lost.",
    "Sorry, you can't delete\r\nthe default multiplayer\r\ngame settings.",
    "Sorry, there is already \r\na saved gametype or \r\nprofile with that name.",
    "Do you really want to\r\nback out without saving\r\nyour changes?",
    "Sorry, you can't create\r\na saved game file with\r\nan empty name.",
    "Saving last checkpoint...\r\none moment please.",
    "Unable to load saved\r\ngame file.",
    "unused warning",
    "Insufficient free space to\r\nsave game.",
    "Insufficient free save slots.",
    "An error has occurred\r\nloading a map file.",
    "You have reached the\r\nmaximum number of Halo\r\ngame files. Unable to\r\ncreate additional ones.",
    "Unable to create new\r\nplayer profile.",
    "Unable to create new\r\nmultiplayer game\r\nsettings entry.",
    "Unable to load saved\r\nprogress for this\r\nprofile.",
    "An error has occurred\r\ntrying to contact the \r\nGameSpy master server.",
    "Video settings changed...\r\nPress OK to accept.",
    "The server you selected\r\nrequires a password!",
    "Unable to join the game\r\nserver!",
    "The server reported\r\nan invalid connection\r\nrequest.",
    "Your password was\r\nrejected by the server.",
    "The server is full.",
    "Your CD Key is invalid.",
    "Your CD Key is in use\r\nby another player.",
    "The server operator has\r\nbanned you from playing\r\non this server.",
    "The server operator has\r\nkicked you from this\r\nserver.",
    "Video settings will be\r\ntested.  If you do not see\r\na confirm dialog after\r\nthe change, press ESC.",
    "Checkpoint saved.",
    "The address is invalid.",
    "You need to create or\r\nselect a profile in order\r\nto continue.",
    "Your client is running an\r\nincompatible network \r\nprotocol version.",
    "Connection rejected: Your\r\nclient is older than the\r\nserver.",
    "Connection rejected: Your\r\nclient is newer than the\r\nserver.",
    "You must have\r\nAdministrator privileges\r\nto download this required\r\npatch.",
    "Are you sure you want to\r\ndelete this saved game?"
}

local modal = container {
    name = "error_modal",
    background = "dialog",
    childs = {
        {
            wrapper {
                name = "error_modal",
                childs = {
                    {
                        label {
                            name = "error_modal_text",
                            justify = "center",
                            size = 60,
                            text = messages,
                            replace = {
                                {
                                    search_string = "%controller",
                                    replace_function = "widget_s_controller"
                                }
                            }
                        },
                        0,
                        210
                    },
                    {
                        label {
                            name = "error_modal_header",
                            justify = "center",
                            text = {
                                "ATTENTION",
                                "ATTENTION",
                                "ARE YOU SURE?",
                                "SAVING...",
                                "ATTENTION:",
                                "DID YOU KNOW...",
                                "OOPS!",
                                "ALERT!"
                            },
                            variant = "title"
                        },
                        0,
                        104
                    }
                }
            }
        },
        {
            options {
                name = "error_modal_options",
                alignment = "horizontal",
                childs = {
                    {
                        button {
                            name = "accept",
                            justification = "center_justify",
                            text = "OK",
                            back = true
                        },
                        layout()
                    }
                }
            }
        },
        {constants.components.currentProfile.path, 624, 20},
        {constants.components.version.path, 0, 460}
    }
}

if not os.execute(
    "cp -f tags/insurrection/ui/menus/error_modal/error_modal.ui_widget_definition tags/ui/shell/error/error_modal_fullscreen.ui_widget_definition") then
    os.exit(1)
end

return modal
