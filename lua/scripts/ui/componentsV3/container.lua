local constants = require "lua.scripts.ui.components.constants"
local widget = require "lua.scripts.widget"

---@class containerProps
---@field name string Name of the component
---@field script? string
---@field func? string
---@field branch? boolean
---@field conditionalWidgets? invaderWidgetConditionalWidget[]
---@field dataInput? string
---@field noBackgroud? boolean
---@field background "transparent" | "solid" | "fade" | "dialog"
---@field variant? '"settings"'
---@field [1]? invaderWidgetChildWidget[]
---@field childs? invaderWidgetChildWidget[]

---Menu container component, this is the first component that holds a screen
---@param props containerProps
---@return string
return function(props)
    local name = props.name
    local childWidgets = props[1] or props.childs
    
    local widgetPath = widget.path .. name .. ".ui_widget_definition"
    ---@type invaderWidget
    local wid = {
        --bounds = constants.getScreenBounds(),
        bounds = widget.bounds(-constants.screen.height, -constants.screen.width, constants.screen.height, constants.screen.width),
        background_bitmap = [[insurrection/ui/bitmaps/background_transparent.bitmap]],
        flags = {pass_unhandled_events_to_focused_child = true},
        event_handlers = {
            {
                event_type = "created",
                flags = {
                    run_scenario_script = props.script ~= nil and props.script ~= false,
                    try_to_branch_on_failure = props.branch or false,
                    run_function = props.func ~= nil and props.script ~= false
                },
                script = props.script,
                ["function"] = props.func
            }
        },
        conditional_widgets = props.conditionalWidgets,
        child_widgets = childWidgets or {}
    }
    if props.dataInput then
        wid.game_data_inputs = {{["function"] = props.dataInput}}
    end
    if props.background then
        if props.background == "transparent" then
            wid.background_bitmap = [[insurrection/ui/bitmaps/background_transparent.bitmap]]
        elseif props.background == "solid" then
            wid.background_bitmap = [[insurrection/ui/bitmaps/background_solid.bitmap]]
        elseif props.background == "fade" then
            wid.background_bitmap = [[insurrection/ui/bitmaps/background_transparent_fade.bitmap]]
        elseif props.background == "dialog" then
            wid.background_bitmap = [[insurrection/ui/bitmaps/dialog_menu_background.bitmap]]
        end
    end
    if props.noBackgroud then
        wid.background_bitmap = nil
    end
    if props.variant == "settings" then
        wid.event_handlers[#wid.event_handlers+1] = {
            event_type = "b_button",
            flags = {
                run_function = true,
                go_back_to_previous_widget = true
            },
            ["function"] = "player_profile_end_editing"
        }
        wid.event_handlers[#wid.event_handlers+1] = {
            event_type = "back_button",
            flags = {
                run_function = true,
                go_back_to_previous_widget = true
            },
            ["function"] = "player_profile_end_editing"
        }
    end
    widget.createV2(widgetPath, wid)
    return widgetPath
end
