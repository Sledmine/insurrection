local widget = require "lua.scripts.widget"
local container = require "lua.scripts.ui.componentsV2.container"
local options = require "lua.scripts.ui.componentsV3.options"
local button = require "lua.scripts.ui.componentsV2.button"
local header = require "lua.scripts.ui.componentsV2.header"
local input = require "lua.scripts.ui.componentsV2.input"
local constants = require "lua.scripts.ui.components.constants"
local image = require "lua.scripts.ui.componentsV2.image"
local footer = require "lua.scripts.ui.componentsV2.footer"
local complexButton = require "lua.scripts.ui.componentsV2.complexButton"
local slider = require "lua.scripts.ui.componentsV2.slider"
local nameplate = require "lua.scripts.ui.componentsV2.nameplate"
local box = require "lua.scripts.ui.componentsV2.box"
local preview = require "lua.scripts.ui.componentsV2.preview"
local wrapper = require "lua.scripts.ui.componentsV3.wrapper"
local label = require "lua.scripts.ui.componentsV3.label"
local pos = constants.position

widget.init [[insurrection/ui/menus/lobby_client/]]

local nameplatesLayout = widget.align("vertical", 26, 624, 12, 2)
local actionsLayout = widget.align("horizontal", constants.components.button.normal.width,
                                   pos.options.x, 414, 6)

return container("lobby_client_menu", {
    {
        header("lobby_client_menu", "WAITING LOBBY",
               "YOU ARE PART OF A LOBBY. WAIT FOR THE HOST TO START THE GAME."),
        pos.header.x,
        pos.header.y
    },
    {
        options {
            name = "lobby_client_list",
            alignment = "horizontal",
            {{button("back", "BACK", {back = true}), actionsLayout()}}
        }
    },
    {label {name = "lobby_client_template", text = string.rep(" ", 64), width = 267}, 40, 100},
    {preview("lobby_client_map", [[insurrection/ui/bitmaps/unknown_map_preview.bitmap]]), 40, 124},
    {
        image("lobby_client_gametype_icon", [[insurrection/ui/bitmaps/lobby_gametype_icon.bitmap]],
              512, 512, 1 / 12),
        250,
        215
    },
    {
        label {
            name = "lobby_client_description",
            text = string.rep(" ", 64),
            justify = "right",
            width = 267
        },
        40,
        277
    },
    {
        box("players", {
            {nameplate("nameplate_1", string.rep(" ", 64)), nameplatesLayout()},
            {nameplate("nameplate_2", string.rep(" ", 64)), nameplatesLayout()},
            {nameplate("nameplate_3", string.rep(" ", 64)), nameplatesLayout()},
            {nameplate("nameplate_4", string.rep(" ", 64)), nameplatesLayout()},
            {nameplate("nameplate_5", string.rep(" ", 64)), nameplatesLayout()},
            {nameplate("nameplate_6", string.rep(" ", 64)), nameplatesLayout()},
            {nameplate("nameplate_7", string.rep(" ", 64)), nameplatesLayout()},
            {nameplate("nameplate_8", string.rep(" ", 64)), nameplatesLayout()},
            {nameplate("nameplate_9", string.rep(" ", 64)), nameplatesLayout()},
            {nameplate("nameplate_10", string.rep(" ", 64)), nameplatesLayout()},
            {nameplate("nameplate_11", string.rep(" ", 64)), nameplatesLayout()},
            {nameplate("nameplate_12", string.rep(" ", 64)), nameplatesLayout()},
            {nameplate("nameplate_13", string.rep(" ", 64)), nameplatesLayout()},
            {nameplate("nameplate_14", string.rep(" ", 64)), nameplatesLayout()},
            {nameplate("nameplate_15", string.rep(" ", 64)), nameplatesLayout()},
            {nameplate("nameplate_16", string.rep(" ", 64)), nameplatesLayout()}
        })
    },
    {constants.components.version.path, 0, 460}
})
