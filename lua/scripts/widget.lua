--- Widget automated modifier using Invader
--- Sledmine
local glue = require "lua.glue"
local tag = require "lua.scripts.modules.tag"

local widget = {}

---@class invaderWidgetStringFlags
---@field editable boolean
---@field password boolean
---@field flashing boolean
---@field dont_do_that_weird_focus_test boolean

---@class invaderWidgetEventHandlerFlags
---@field close_current_widget boolean
---@field close_other_widget boolean
---@field close_all_widgets boolean
---@field open_widget boolean
---@field reload_self boolean
---@field reload_other_widget boolean
---@field give_focus_to_widget boolean
---@field run_function boolean
---@field replace_self_w_widget boolean
---@field go_back_to_previous_widget boolean
---@field run_scenario_script boolean
---@field try_to_branch_on_failure boolean

---@class invaderWidgetEventHandler
---@field flags invaderWidgetEventHandlerFlags
---@field event_type '"a_button"' | '"b_button"' | '"dpad_left"' | '"dpad_right"' | '"created"' | '"left_mouse"' | '"double_click"' | '"custom_activation"' | '"post_render"'
---@field function '"mouse_emit_accept_event"' | string
---@field widget_tag string
---@field sound_effect string
---@field script string

---@class invaderWidgetChildWidget
---@field widget_tag string
---@field name string
---@field vertical_offset number
---@field horizontal_offset number

---@class invaderWidgetFlags
---@field pass_unhandled_events_to_focused_child boolean
---@field pause_game_time boolean
---@field flash_background_bitmap boolean
---@field dpad_up_down_tabs_thru_children boolean
---@field dpad_left_right_tabs_thru_children boolean
---@field dpad_up_down_tabs_thru_list_items boolean
---@field dpad_left_right_tabs_thru_list_items boolean

---@class invaderWidget
---@field widget_type '"container"' | '"text_box"' | '"spinner_list"' | '"column_list"'
---@field bounds string
---@field flags invaderWidgetFlags
---@field milliseconds_to_auto_close number
---@field milliseconds_to_auto_close_fade_time number
---@field background_bitmap string
---@field event_handlers invaderWidgetEventHandler[]
---@field extended_description_widget string
---@field justification '"left_justify"' | '"center_justify"' | '"right_justify"'
---@field flags_1 invaderWidgetStringFlags
---@field text_label_unicode_strings_list string
---@field text_font string
---@field text_color string
---@field string_list_index number
---@field horiz_offset number
---@field vert_offset number
---@field child_widgets invaderWidgetChildWidget[]

--- Set properties to widget
---@param widgetPath string Path to widget tag
---@param keys invaderWidget Properties to set into widget
function widget.edit(widgetPath, keys)
    return tag.edit(widgetPath, keys)
end

---Get a value from a widget given key
---@param widgetPath string
---@param key string
---@param index? number
---@param subkey? string
---@return string | number
function widget.get(widgetPath, key, index, subkey)
    return tag.get(widgetPath, key, index, subkey)
end

---Count entries from a widget given key
---@param widgetPath any
---@param key any
---@return number
function widget.count(widgetPath, key)
    return tag.count(widgetPath, key)
end

---Insert a quantity of structs to specific key
---@param widgetPath string
---@param key string
---@param count number
---@param position number | '"end"'
function widget.insert(widgetPath, key, count, position)
    return tag.insert(widgetPath, key, count, position)
end

---Create a widget tag
---@param widgetPath string
---@param keys invaderWidget
---@return boolean
function widget.create(widgetPath, keys)
    print("Creating: " .. widgetPath)
    -- Create widget from scratch
    return tag.create(widgetPath, keys)
end

---Merge keys from one widget definition to another
---@param keys invaderWidget
---@param newKeys invaderWidget
---@return invaderWidget
function widget.merge(keys, newKeys)
    return glue.merge(keys, newKeys)
end

---Update keys from one widget definition to another
---@param keys invaderWidget
---@param newKeys invaderWidget
---@return invaderWidget
function widget.update(keys, newKeys)
    return glue.update(keys, newKeys)
end

function widget.offset(initial, size, offset, index)
    --return initial + ((initial * 2) + offset * (index - 1))
    return initial + ((size + offset) * (index - 1))
end

return widget
