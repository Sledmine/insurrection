local blam = require "blam"
local tagClasses = blam.tagClasses
local ini = require "ini"
local constants = require "insurrection.constants"
local luna = require "luna"
local split = luna.string.split
local engine = Engine

local core = require "insurrection.core"

local chimera = {}

---@class chimeraServer
---@field ip string
---@field port number
---@field password string
---@field dns string?

---@type chimeraServer[]
local servers = {}

---@class chimeraConfiguration
---@field server_list Serverlist
---@field custom_console Customconsole
---@field memory Memory
---@field controller any[]
---@field font_override Fontoverride
---@field custom_chat Customchat
---@field scoreboard Scoreboard
---@field hotkey Hotkey
---@field video_mode Videomode
---@field name Name
---@field error_handling any[]
---@field halo Halo

---@class Halo
---@field hash string
---@field background_playback number
---@field optimal_defaults number
---@field console number

---@class Name
---@field font string

---@class Videomode
---@field height string
---@field borderless number
---@field refresh_rate number
---@field windowed number
---@field width string
---@field enabled number
---@field vsync number

---@class Hotkey
---@field ctrl_alt_shift_3 string
---@field alt_6 string
---@field ctrl_1 string
---@field alt_5 string
---@field ctrl_6 string
---@field ctrl_0 string
---@field alt_shift_3 string
---@field ctrl_alt_shift_2 string
---@field ctrl_4 string
---@field alt_1 string
---@field enabled number
---@field ctrl_7 string
---@field alt_0 string
---@field alt_8 string
---@field ctrl_9 string
---@field alt_shift_4 string
---@field ctrl_2 string
---@field alt_4 string
---@field ctrl_alt_shift_1 string
---@field ctrl_3 string
---@field f12 string
---@field ctrl_8 string
---@field alt_3 string
---@field alt_shift_2 string
---@field alt_9 string
---@field alt_shift_1 string
---@field alt_7 string
---@field ctrl_5 string
---@field alt_2 string

---@class Scoreboard
---@field font string
---@field fade_time number

---@class Customchat
---@field chat_message_hide_on_console number
---@field server_message_color_r number
---@field chat_input_anchor string
---@field chat_input_x number
---@field chat_input_color_b number
---@field chat_message_color_red_g number
---@field server_message_anchor string
---@field chat_message_color_red_a number
---@field chat_message_anchor string
---@field server_fade_out_time number
---@field chat_fade_out_time number
---@field server_slide_time_length number
---@field chat_input_color_a number
---@field server_message_font string
---@field server_time_up number
---@field chat_input_font string
---@field chat_message_y number
---@field chat_message_w number
---@field chat_slide_time_length number
---@field chat_input_w number
---@field chat_message_color_red_b number
---@field chat_message_h number
---@field chat_message_x number
---@field chat_message_color_blue_g number
---@field server_message_hide_on_console number
---@field server_message_color_a number
---@field server_message_h_chat_open number
---@field chat_message_color_ffa_g number
---@field chat_input_color_r number
---@field server_message_color_g number
---@field chat_message_color_ffa_r number
---@field chat_message_color_ffa_a number
---@field chat_message_font string
---@field chat_input_color_g number
---@field chat_line_height number
---@field chat_message_color_ffa_b number
---@field chat_message_color_blue_a number
---@field chat_message_color_blue_b number
---@field chat_input_y number
---@field server_message_w number
---@field chat_message_h_chat_open number
---@field chat_message_color_red_r number
---@field server_message_color_b number
---@field server_message_y number
---@field chat_message_color_blue_r number
---@field server_message_x number
---@field chat_time_up number
---@field server_line_height number
---@field server_message_h number

---@class Fontoverride
---@field ticker_font_weight number
---@field large_font_override number
---@field large_font_shadow_offset_y number
---@field small_font_offset_x number
---@field smaller_font_family string
---@field smaller_font_offset_y number
---@field ticker_font_offset_x number
---@field smaller_font_shadow_offset_x number
---@field small_font_shadow_offset_y number
---@field system_font_shadow_offset_x number
---@field system_font_shadow_offset_y number
---@field smaller_font_offset_x number
---@field small_font_offset_y number
---@field ticker_font_offset_y number
---@field ticker_font_family string
---@field smaller_font_override number
---@field small_font_family string
---@field console_font_shadow_offset_y number
---@field system_font_y_offset number
---@field large_font_family string
---@field console_font_offset_y number
---@field system_font_override number
---@field system_font_weight number
---@field large_font_size number
---@field ticker_font_override number
---@field small_font_override number
---@field console_font_size number
---@field ticker_font_shadow_offset_x number
---@field large_font_weight number
---@field console_font_family string
---@field enabled number
---@field console_font_weight number
---@field ticker_font_shadow_offset_y number
---@field smaller_font_size number
---@field system_font_size number
---@field small_font_weight number
---@field console_font_override number
---@field ticker_font_size number
---@field smaller_font_shadow_offset_y number
---@field small_font_size number
---@field large_font_offset_y number
---@field system_font_x_offset number
---@field large_font_shadow_offset_x number
---@field smaller_font_weight number
---@field large_font_offset_x number
---@field console_font_shadow_offset_x number
---@field console_font_offset_x number
---@field system_font_family string
---@field small_font_shadow_offset_x number

---@class Memory
---@field download_font string
---@field enable_map_memory_buffer number
---@field map_size number

---@class Customconsole
---@field fade_time number
---@field fade_start number
---@field buffer_size_soft number
---@field enable_scrollback number
---@field line_height number
---@field enabled number
---@field buffer_size number
---@field x_margin number

---@class Serverlist
---@field auto_query number

local insurrectionFontOverride = {
    console_font_family = "Hack Bold",
    console_font_offset_x = 0,
    console_font_offset_y = 0,
    console_font_override = 1,
    console_font_shadow_offset_x = 2,
    console_font_shadow_offset_y = 2,
    console_font_size = 10,
    console_font_weight = 400,
    enabled = 1,
    large_font_family = "Geogrotesque-Regular",
    large_font_offset_x = 0,
    large_font_offset_y = 3,
    large_font_override = 1,
    large_font_shadow_offset_x = 2,
    large_font_shadow_offset_y = 2,
    large_font_size = 13,
    large_font_weight = 400,
    small_font_family = "Geogrotesque-Regular",
    small_font_offset_x = 0,
    small_font_offset_y = 3,
    small_font_override = 1,
    small_font_shadow_offset_x = 2,
    small_font_shadow_offset_y = 2,
    small_font_size = 10,
    small_font_weight = 400,
    smaller_font_family = "Geogrotesque-Regular",
    smaller_font_offset_x = 0,
    smaller_font_offset_y = 4,
    smaller_font_override = 1,
    smaller_font_shadow_offset_x = 0,
    smaller_font_shadow_offset_y = 0,
    smaller_font_size = 10,
    smaller_font_weight = 400,
    system_font_family = "Geogrotesque-Regular",
    system_font_override = 1,
    system_font_shadow_offset_x = 2,
    system_font_shadow_offset_y = 2,
    system_font_size = 11,
    system_font_weight = 400,
    system_font_x_offset = 0,
    system_font_y_offset = 1,
    ticker_font_family = "Geogrotesque-Regular",
    ticker_font_offset_x = 0,
    ticker_font_offset_y = 0,
    ticker_font_override = 1,
    ticker_font_shadow_offset_x = 2,
    ticker_font_shadow_offset_y = 2,
    ticker_font_size = 18,
    ticker_font_weight = 400
}

local chimeraFontOverride = {
    console_font_family = "Hack Bold",
    console_font_offset_x = 0,
    console_font_offset_y = 0,
    console_font_override = 1,
    console_font_shadow_offset_x = 2,
    console_font_shadow_offset_y = 2,
    console_font_size = 14,
    console_font_weight = 400,
    enabled = 1,
    large_font_family = "Interstate-Bold",
    large_font_offset_x = 0,
    large_font_offset_y = 1,
    large_font_override = 1,
    large_font_shadow_offset_x = 2,
    large_font_shadow_offset_y = 2,
    large_font_size = 20,
    large_font_weight = 400,
    small_font_family = "Interstate-Bold",
    small_font_offset_x = 0,
    small_font_offset_y = 3,
    small_font_override = 1,
    small_font_shadow_offset_x = 2,
    small_font_shadow_offset_y = 2,
    small_font_size = 15,
    small_font_weight = 400,
    smaller_font_family = "Interstate-Bold",
    smaller_font_offset_x = 0,
    smaller_font_offset_y = 4,
    smaller_font_override = 1,
    smaller_font_shadow_offset_x = 2,
    smaller_font_shadow_offset_y = 2,
    smaller_font_size = 11,
    smaller_font_weight = 400,
    system_font_family = "Interstate-Bold",
    system_font_override = 1,
    system_font_shadow_offset_x = 2,
    system_font_shadow_offset_y = 2,
    system_font_size = 20,
    system_font_weight = 400,
    system_font_x_offset = 0,
    system_font_y_offset = 1,
    ticker_font_family = "Lucida Console",
    ticker_font_offset_x = 0,
    ticker_font_offset_y = 0,
    ticker_font_override = 1,
    ticker_font_shadow_offset_x = 2,
    ticker_font_shadow_offset_y = 2,
    ticker_font_size = 11,
    ticker_font_weight = 400
}

---Get chimera configuration
---@return chimeraConfiguration?
function chimera.getConfiguration()
    local configIni = luna.file.read("chimera.ini")
    if configIni then
        ---@type chimeraConfiguration
        local configuration = ini.decode(configIni)
        return configuration
    end
end

---Save chimera configuration
---@param configuration chimeraConfiguration
function chimera.saveConfiguration(configuration)
    local configIni = ini.encode(configuration)
    return luna.file.write("chimera.ini", configIni)
end

function chimera.setupFonts(revert)
    local chimeraIni = luna.file.read("chimera.ini")
    if chimeraIni then
        local configuration = chimera.getConfiguration()
        if configuration then
            configuration.font_override = insurrectionFontOverride
            if revert then
                configuration.font_override = chimeraFontOverride
            end
            return chimera.saveConfiguration(configuration)
        end
    end
    return false
end

function chimera.enableBlockServerIp()
    local preferences = chimera.getPreferences()
    if preferences then
        preferences.chimera_block_server_ip = 1
        return chimera.savePreferences(preferences)
    end
    return false
end

---@class chimeraPreferences
---@field chimera_devmode 1|0
---@field chimera_budget 1|0
---@field chimera_widescreen_fix 1|0
---@field chimera_block_gametype_rules 1
---@field chimera_block_gametype_indicator true | false
---@field chimera_uncap_cinematic 1|0
---@field chimera_fov number | "auto"
---@field chimera_af 1|0
---@field chimera_invert_shader_flags 1|0
---@field chimera_show_coordinates 1|0
---@field chimera_mouse_sensitivity number[]
---@field chimera_throttle_fps number
---@field chimera_block_zoom_blur 1|0
---@field chimera_block_server_ip 1|0
---@field chimera_block_buffering 1|0
---@field chimera_show_fps 1|0
---@field chimera_block_loading_screen 1|0
---@field chimera_block_hold_f1 1|0
---@field chimera_block_mouse_acceleration 1|0

---Get chimera preferences
---@return chimeraPreferences?
function chimera.getPreferences()
    local preferencesTxt = luna.file.read(
                               core.getMyGamesHaloCEPath() .. "\\chimera\\preferences.txt")
    if preferencesTxt then
        local preferences = {}
        -- Split the file into lines and iterate over them
        for line in preferencesTxt:gmatch("[^\n]+") do
            -- Search for line that starts with "chimera"
            if line:sub(1, 7) == "chimera" then
                -- Get key and value from line separeted by a space, support numbers as well
                local key, value = line:match("([^ ]+) (.+)")
                if key and value then
                    -- Convert value to number if possible
                    local number = tonumber(value)
                    if number then
                        value = number
                    end
                    -- Convert boolean to flag number if possible
                    if value == "true" then
                        value = 1
                    elseif value == "false" then
                        value = 0
                    end
                    preferences[key] = value
                end
            end
        end
        return preferences
    end
end

function chimera.savePreferences(preferences)
    local preferencesTxt = ""
    for key, value in pairs(preferences) do
        preferencesTxt = preferencesTxt .. key .. " " .. value .. "\n"
    end
    return luna.file.write(core.getMyGamesHaloCEPath() .. "\\chimera\\preferences.txt",
                          preferencesTxt)
end

function chimera.executeCommand(command)
    if not execute_chimera_command then
        engine.core.consolePrint("execute_chimera_command is not available.")
        return false
    end
    local result, error = pcall(execute_chimera_command, command, true)
    if result then
        execute_script("cls")
        return true
    end
    engine.core.consolePrint(error)
    return false
end

local function safeFontOverride(...)
    pcall(create_font_override, ...)
end

function chimera.fontOverride()
    logger:debug("Overriding Chimera font...")
    if create_font_override then
        if constants.fonts.text then
            safeFontOverride(constants.fonts.text.id, "Geogrotesque-Regular", 14, 400, 2, 2, 1, 1)
        end
        if constants.fonts.title then
            safeFontOverride(constants.fonts.title.id, "Geogrotesque-Regular", 18, 400, 2, 2, 0, 0)
        end
        if constants.fonts.subtitle then
            safeFontOverride(constants.fonts.subtitle.id, "Geogrotesque-Regular", 10, 400, 2, 2, 0, 0)
        end
        if constants.fonts.button then
            safeFontOverride(constants.fonts.button.id, "Geogrotesque-Regular", 13, 400, 2, 2, 1, 1)
        end
        if constants.fonts.shadow then
            safeFontOverride(constants.fonts.shadow.id, "Geogrotesque-Regular", 10, 400, 0, 0, 0, 0)
        end
        return true
    end
    logger:error("create_font_override is not available.")
    return false
end

return chimera
