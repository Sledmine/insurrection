local widget = require "lua.scripts.widget"
local strmem = widget.strmem
local container = require "lua.scripts.ui.componentsV2.container"
local optionsV2 = require "lua.scripts.ui.componentsV2.options"
local options = require "lua.scripts.ui.componentsV3.options"
local button = require "lua.scripts.ui.componentsV2.button"
local header = require "lua.scripts.ui.componentsV2.header"
local input = require "lua.scripts.ui.componentsV3.input"
local constants = require "lua.scripts.ui.components.constants"
local image = require "lua.scripts.ui.componentsV2.image"
local footer = require "lua.scripts.ui.componentsV2.footer"
local complexButton = require "lua.scripts.ui.componentsV2.complexButton"
local slider = require "lua.scripts.ui.componentsV2.slider"
local nameplate = require "lua.scripts.ui.componentsV2.nameplate"
local box = require "lua.scripts.ui.componentsV2.box"
local preview = require "lua.scripts.ui.componentsV2.preview"
local wrapper = require "lua.scripts.ui.componentsV3.wrapper"
local pos = constants.position
local checkbox = require "lua.scripts.ui.componentsV3.checkbox"
local label = require "lua.scripts.ui.componentsV3.label"

widget.init [[insurrection/ui/menus/lobby/]]

local defsLayout = widget.align("horizontal", constants.components.complexButton.horizontal.width,
                                pos.options.x, pos.options.y, 2)

local elementsLayout = widget.align("horizontal", constants.components.complexButton.normal.width,
                                    19, 0, 2)
local elementsLayoutVertical = widget.align("vertical", constants.components.button.normal.height,
                                            0, 0, 2)

local nameplatesLayout = widget.align("vertical", 26, 641, 20, 2)


local actionsLayout = widget.align("horizontal", constants.components.button.normal.width,
                                   pos.options.x, 416, 6)

return container("lobby_menu", {
    {
        header("lobby_menu", "MY LOBBY",
               "INVITE FRIENDS TO YOUR LOBBY, CHOOSE YOUR SERVER TYPE, SET YOUR RULES AND HAVE FUN!"),
        pos.header.x,
        pos.header.y
    },
    {
        optionsV2("lobby", "vertical", {
            {
                optionsV2("definitions", "horizontal", {
                    {
                        complexButton("definition_map", string.rep(" ", 32), "MAP",
                                      {variant = "horizontal"}),
                        defsLayout()
                    },
                    {
                        complexButton("definition_gametype", string.rep(" ", 32), "GAMETYPE",
                                      {variant = "horizontal"}),
                        defsLayout()
                    },
                    {
                        complexButton("definition_template", string.rep(" ", 32), "TEMPLATE",
                                      {variant = "horizontal"}),
                        defsLayout()
                    }
                    -- {
                    --    complexButton("settings", "SETTINGS", nil, {variant = "horizontal"}),
                    --    defsLayout()
                    -- }
                })
            },
            {
                input {
                    name = "search",
                    text = strmem(32),
                    variant = "small",
                    icon = [[insurrection/ui/bitmaps/search_icon.bitmap]]
                },
                pos.options.x,
                140
            },
            {
                options {
                    name = "elements",
                    alignment = "horizontal",
                    width = 530,
                    height = 110,
                    {
                        {slider("elements_left", "left")},
                        {
                            complexButton("element_1", string.rep(" ", 32), nil, {
                                variant = "normal",
                                icon = [[insurrection/ui/bitmaps/lobby_gametype_icon.bitmap]]
                            }),
                            elementsLayout()
                        },
                        {
                            complexButton("element_2", string.rep(" ", 32), nil, {
                                variant = "normal",
                                icon = [[insurrection/ui/bitmaps/lobby_gametype_icon.bitmap]]
                            }),
                            elementsLayout()
                        },
                        {
                            complexButton("element_3", string.rep(" ", 32), nil, {
                                variant = "normal",
                                icon = [[insurrection/ui/bitmaps/lobby_gametype_icon.bitmap]]
                            }),
                            elementsLayout()
                        },
                        {
                            complexButton("element_4", string.rep(" ", 32), nil, {
                                variant = "normal",
                                icon = [[insurrection/ui/bitmaps/lobby_gametype_icon.bitmap]]
                            }),
                            elementsLayout()
                        },
                        {slider("elements_right", "right"), elementsLayout(2)}
                    }
                },
                pos.options.x,
                170
            },
            {checkbox {name = "make_public", text = "Public Lobby"}, pos.options.x, 371},
            {
                input {
                    name = "lobby_key",
                    text = strmem(512, "Lobby Key"),
                    variant = "small",
                    icon = [[insurrection/ui/bitmaps/copy_icon.bitmap]]
                },
                pos.options.x + constants.components.button.normal.width + 7,
                371
            },
            {button("back", "BACK", {back = true}), actionsLayout()},
            {button("play", "PLAY"), actionsLayout()}
        })
    },
    {footer("summary", "SUMMARY", string.rep(" ", 256)), pos.footer.x, 335},
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
}, {
    conditionalWidgets = {
        {
            widget_tag = wrapper {
                name = "lobby_maps",
                width = 465,
                height = 160,
                {
                    {
                        options {
                            name = "lobby_maps",
                            alignment = "vertical",
                            width = 465,
                            height = 160,
                            {
                                {
                                    button("scroll_map_list_up", nil, {arrow = "up"}),
                                    elementsLayoutVertical()
                                },
                                {
                                    button("element_map_1", string.rep(" ", 32),
                                           {variant = "normal"}),
                                    elementsLayoutVertical()
                                },
                                {
                                    button("element_map_2", string.rep(" ", 32),
                                           {variant = "normal"}),
                                    elementsLayoutVertical()
                                },
                                {
                                    button("element_map_3", string.rep(" ", 32),
                                           {variant = "normal"}),
                                    elementsLayoutVertical()
                                },
                                {
                                    button("element_map_4", string.rep(" ", 32),
                                           {variant = "normal"}),
                                    elementsLayoutVertical()
                                },
                                {
                                    button("scroll_map_list_down", nil, {arrow = "down"}),
                                    elementsLayoutVertical()
                                }
                            }
                        }
                    },
                    {
                        preview("map_small", [[insurrection/ui/bitmaps/unknown_map_preview.bitmap]]),
                        190,
                        1
                    }
                }
            }
        }
    }
})
