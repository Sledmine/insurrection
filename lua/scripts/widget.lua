--- Widget automated modifier using Invader
--- Sledmine
package.path = package.path .. ";lua/scripts/modules/?.lua"
local fs = require "lua.scripts.modules.fs"
local glue = require "lua.modules.glue"
local tag = require "lua.scripts.modules.tag"
local luna = require "lua.modules.luna"

local widget = {path = nil}

_ALIGNMENTS = {}

---@class invaderWidgetSearchAndReplaceFunctions
---@field search_string string?
---@field replace_function '"null"' | '"widget_s_controller"' | '"build_number"' | '"pid"'

---@class invaderWidgetListFlags
---@field list_items_generated_in_code? boolean
---@field list_items_from_string_list_tag? boolean
---@field list_items_only_one_tooltip? boolean
---@field list_single_preview_no_scroll? boolean

---@class invaderWidgetStringFlags
---@field editable? boolean
---@field password? boolean
---@field flashing? boolean
---@field dont_do_that_weird_focus_test? boolean

---@class invaderWidgetEventHandlerFlags
---@field close_current_widget? boolean
---@field close_other_widget? boolean
---@field close_all_widgets? boolean
---@field open_widget? boolean
---@field reload_self? boolean
---@field reload_other_widget? boolean
---@field give_focus_to_widget? boolean
---@field run_function? boolean
---@field replace_self_w_widget? boolean
---@field go_back_to_previous_widget? boolean
---@field run_scenario_script? boolean
---@field try_to_branch_on_failure? boolean

---@class invaderWidgetEventHandler
---@field flags? invaderWidgetEventHandlerFlags
---@field event_type '"a_button"' | '"b_button"' | '"back_button"' | '"start_button"' |  '"dpad_left"' | '"dpad_right"' | '"created"' | '"deleted"' | '"left_mouse"' | '"double_click"' | '"custom_activation"' | '"post_render"'
---@field function? '"mouse_emit_accept_event"' | string
---@field widget_tag? string
---@field sound_effect? string
---@field script? string

---@class invaderWidgetChildWidget
---@field widget_tag? string
---@field name? string
---@field vertical_offset? number
---@field horizontal_offset? number

---@class invaderWidgetFlags
---@field pass_unhandled_events_to_focused_child? boolean
---@field pause_game_time? boolean
---@field flash_background_bitmap? boolean
---@field dpad_up_down_tabs_thru_children? boolean
---@field dpad_left_right_tabs_thru_children? boolean
---@field dpad_up_down_tabs_thru_list_items? boolean
---@field dpad_left_right_tabs_thru_list_items? boolean

---@class invaderWidgetConditionalWidgetFlags
---@field load_if_event_handler_function_fails boolean

---@class invaderWidgetConditionalWidget
---@field widget_tag string
---@field name? string
---@field flags? invaderWidgetConditionalWidgetFlags
---@field custom_controller_index? number

---@class invaderWidgetGameDataInput
---@field function string

---@class invaderWidget
---@field widget_type? '"container"' | '"text_box"' | '"spinner_list"' | '"column_list"'
---@field bounds? string
---@field flags? invaderWidgetFlags
---@field milliseconds_to_auto_close_fade_time? number
---@field background_bitmap? string
---@field game_data_inputs? invaderWidgetGameDataInput[]
---@field search_and_replace_functions? invaderWidgetSearchAndReplaceFunctions[]
---@field event_handlers? invaderWidgetEventHandler[]
---@field text_label_unicode_strings_list? string
---@field text_font? string
---@field text_color? string
---@field justification? '"left_justify"' | '"center_justify"' | '"right_justify"'
---@field flags_1? invaderWidgetStringFlags
---@field string_list_index? number
---@field horiz_offset? number
---@field vert_offset? number
---@field flags_2? invaderWidgetListFlags
---@field list_header_bitmap? string
---@field list_footer_bitmap? string
---@field header_bounds? string
---@field footer_bounds? string
---@field extended_description_widget? string
---@field conditional_widgets? invaderWidgetConditionalWidget[]
---@field child_widgets? invaderWidgetChildWidget[]

--- Set properties to widget
---@param widgetPath string Path to widget tag
---@param keys invaderWidget Properties to set into widget
---@deprecated
function widget.edit(widgetPath, keys)
    return tag.edit(widgetPath, keys)
end

---Get a value from a widget given key
---@param widgetPath string
---@param key string
---@param index? number
---@param subkey? string
---@return string | number | nil
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
---@param position? number | '"end"'
function widget.insert(widgetPath, key, count, position)
    return tag.insert(widgetPath, key, count, position)
end

---Create a widget tag
---@param widgetPath string
---@param keys invaderWidget
---@return boolean
function widget.create(widgetPath, keys)
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

---Map values used as offsets for widget placement
---@param initial number Initial offset position
---@param size number Size of the widget mapped to the offset
---@param spacing number Space between offset mapping
---@param index number Index of the widget to be mapped
---@return number
function widget.offset(initial, size, spacing, index)
    -- return initial + ((initial * 2) + offset * (index - 1))
    return initial + ((size + spacing) * (index - 1))
end

---Set widget path to be used
function widget.init(widgetPath)
    widgetPath = widgetPath:gsub("\\", "/")
    -- Create widget folders
    fs.mkdir("tags/" .. widgetPath, true)
    fs.mkdir("tags/" .. widgetPath .. "/strings", true)
    fs.mkdir("tags/" .. widgetPath .. "/bitmaps", true)
    fs.mkdir("tags/" .. widgetPath .. "/buttons", true)
    -- Check if path ends with slash, if it does not, add it
    if widgetPath:sub(-1) ~= "/" then
        widgetPath = widgetPath .. "/"
    end
    widget.path = widgetPath
    return widgetPath
end

---Align multiple widgets to a specific position
---@param alignment "vertical" | "horizontal"
---@param size number
---@param horizontal number
---@param vertical number
---@param margin number
function widget.align(alignment, size, horizontal, vertical, margin)
    local alignmentHash = table.concat({alignment, size, horizontal, vertical, margin}, "")
    _ALIGNMENTS[alignmentHash] = 0
    return function(offset)
        local offset = offset or 0
        _ALIGNMENTS[alignmentHash] = _ALIGNMENTS[alignmentHash] + 1
        if alignment == "vertical" then
            return horizontal,
                   widget.offset(vertical, size, margin, _ALIGNMENTS[alignmentHash]) + offset
        else
            return widget.offset(horizontal, size, margin, _ALIGNMENTS[alignmentHash]) + offset,
                   vertical
        end
    end
end

function widget.wrap(tagPath, horizontal_offset, vertical_offset)
    return {
        widget_tag = tagPath,
        horizontal_offset = horizontal_offset,
        vertical_offset = vertical_offset
    }
end

---Create a widget tag
---@param widgetPath string
---@param keys invaderWidget
---@return boolean
function widget.createV2(widgetPath, keys)
    -- Create widget from scratch
    if keys.background_bitmap and not fs.is("tags/" .. keys.background_bitmap) then
        local bitmapPath = keys.background_bitmap:replace(".bitmap", "")
        if not os.execute("invader-bitmap -F 32-bit -T interface_bitmaps " .. bitmapPath) then
            error("Background bitmap " .. bitmapPath .. " does not exist")
        end
    end
    if keys.child_widgets then
        keys.child_widgets = glue.map(keys.child_widgets, function(child)
            if #child > 0 then
                return widget.wrap(child[1], child[2] or 0, child[3] or 0)
            end
            return child
        end)
    end
    return tag.create(widgetPath, keys)
end

---Return bounds formatted string
---@param y number
---@param x number
---@param height number
---@param width number
---@return string
function widget.bounds(y, x, height, width)
    return string.format("%d, %d, %d, %d", y, x, height, width)
end

local floor = math.floor

---Return scale formatted bounds
---@param width number
---@param height number
---@param scale number
---@return string
function widget.scale(width, height, scale)
    local scale = scale or 1
    local originalWidth = width
    local originalHeight = height
    local width = floor(width * scale)
    local height = floor(height * scale)
    local top = -(floor(originalHeight - height))
    local left = -(floor(originalWidth - width))
    if scale >= 1 then
        top = 0
        left = 0
    end
    return top .. ", " .. left .. ", " .. height .. ", " .. width
end

---Generate a string of spaces to reserve memory for a string
---@param size number
---@param default? string
---@return string
function widget.strmem(size, default)
    local str = default or ""
    local size = size - #str
    str = str .. string.rep(" ", size)
    return str
end

---Align multiple widgets to a specific position
---@param props {alignment: "vertical" | "horizontal", size: number, x: number, y: number, margin: number}
function widget.layout(props)
    local alignment = props.alignment
    local size = props.size
    local horizontal = props.x
    local vertical = props.y
    local margin = props.margin
    local alignmentHash = table.concat({alignment, size, horizontal, vertical, margin}, "")
    _ALIGNMENTS[alignmentHash] = 0
    return function(offset)
        local offset = offset or 0
        _ALIGNMENTS[alignmentHash] = _ALIGNMENTS[alignmentHash] + 1
        if alignment == "vertical" then
            return horizontal,
                   widget.offset(vertical, size, margin, _ALIGNMENTS[alignmentHash]) + offset
        else
            return widget.offset(horizontal, size, margin, _ALIGNMENTS[alignmentHash]) + offset,
                   vertical
        end
    end
end

---Create a bitmap tag from a color
---@param color string
---@param name? string
---@return string
function widget.color(color, name)
    local colorDecimal = tonumber(color:sub(2), 16) or 0
    local bitmapPath = "insurrection/ui/bitmaps/color_" .. (name or colorDecimal)
    local imagePath = "data/insurrection/ui/bitmaps/color_" .. (name or colorDecimal) .. ".png"

    if not fs.is("tags/" .. bitmapPath .. ".bitmap") then
        -- Create bitmap from color using image magick, assume color is in hex
        os.execute("convert -size 4x4 xc:" .. color .. " " .. imagePath)
        os.execute("invader-bitmap -F 32-bit -T interface_bitmaps " .. bitmapPath)
    end
    return bitmapPath .. ".bitmap"
end

--- Save widget path into a global tag collection reference
---@param widgetPath string
---@param tagCollectionPath string
function widget.global(widgetPath, tagCollectionPath)
    local widgetCount = widget.count(tagCollectionPath, "tags")

    local widgets = {}
    for i = 0, widgetCount - 1 do
        local widget = widget.get(tagCollectionPath, "tags", i, "reference")
        table.insert(widgets, {reference = widget})
    end

    if not table.find(widgets, function(v, k)
        return v.reference == widgetPath
    end) then
        table.insert(widgets, {reference = widgetPath})
        widget.create(tagCollectionPath, {tags = widgets})
        return
    end
    print("Widget already exists in tag collection.")
end

return widget
