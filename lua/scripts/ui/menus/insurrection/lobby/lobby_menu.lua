local widget = require "lua.scripts.widget"
local container = require "lua.scripts.ui.componentsV2.container"
local options = require "lua.scripts.ui.componentsV2.options"
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
local wrapper = require "lua.scripts.ui.componentsV2.wrapper"
local pos = constants.position

widget.init [[insurrection/ui/menus/lobby/]]

local defsLayout = widget.align("horizontal", constants.components.complexButton.horizontal.width,
                                pos.options.x, pos.options.y, 2)

local elementsLayout = widget.align("horizontal", constants.components.complexButton.normal.width,
                                    59, 180, 2)
local elementsLayoutVertical = widget.align("vertical", constants.components.button.normal.height,
                                            pos.options.x, 170, 2)

local nameplatesLayout = widget.align("vertical", 26, 624, 12, 2)

local actionsLayout = widget.align("horizontal", constants.components.button.normal.width,
                                   pos.options.x, 414, 6)

return container("lobby_menu", {
    {
        header("lobby_menu", "MY LOBBY",
               "INVITE FRIENDS TO YOUR LOBBY, CHOOSE YOUR SERVER TYPE, SET YOUR RULES AND HAVE FUN!"),
        pos.header.x,
        pos.header.y
    },
    {
        options("lobby", "vertical", {
            {
                options("definitions", "horizontal", {
                    {
                        complexButton("definition_template", string.rep(" ", 32), "TEMPLATE",
                                      {variant = "horizontal"}),
                        defsLayout()
                    },
                    {
                        complexButton("definition_map", string.rep(" ", 32), "MAP",
                                      {variant = "horizontal"}),
                        defsLayout()
                    },
                    {
                        complexButton("definition_gametype", string.rep(" ", 32), "GAMETYPE",
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
                input("search", string.rep(" ", 32),
                      {variant = "small", icon = [[insurrection/ui/bitmaps/search_icon.bitmap]]}),
                pos.options.x,
                140
            },
            {
                options("elements", "horizontal", {
                    {slider("elements_left", "left"), pos.options.x, 180},
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
                })
            },
            {button("back", "BACK", {back = true}), actionsLayout()},
            {button("play", "PLAY"), actionsLayout()}
        })
    },
    {footer("summary", "SUMMARY", string.rep(" ", 256)), pos.footer.x, 330},
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
            widget_tag = box("full_maps", {
                {
                    options("lobby_maps", "vertical", {
                        {
                            button("scroll_map_list_up", nil, {arrow = "up"}),
                            elementsLayoutVertical()
                        },
                        {
                            button("element_map_1", string.rep(" ", 32), {variant = "normal"}),
                            elementsLayoutVertical()
                        },
                        {
                            button("element_map_2", string.rep(" ", 32), {variant = "normal"}),
                            elementsLayoutVertical()
                        },
                        {
                            button("element_map_3", string.rep(" ", 32), {variant = "normal"}),
                            elementsLayoutVertical()
                        },
                        {
                            button("element_map_4", string.rep(" ", 32), {variant = "normal"}),
                            elementsLayoutVertical()
                        },
                        {
                            button("scroll_map_list_down", nil, {arrow = "down"}),
                            elementsLayoutVertical()
                        }
                    })
                },
                {
                    box("map_description", {
                        {
                            preview("map_small",
                                    [[insurrection/ui/bitmaps/unknown_map_preview.bitmap]]),
                            232,
                            170
                        }
                    })
                }
            })
        }
    }
})
