local blam = require "blam"

--- Function to send debug messages to console output
---@param message string
---@param color? '"info"' | '"warning"' | '"error"' | '"success"'
function dprint(message, color)
    if DebugMode then
        local message = message
        if (type(message) ~= "string") then
            message = inspect(message)
        end
        if (color == "info") then
            console_out(message, 0.31, 0.631, 0.976)
        elseif (color == "warning") then
            console_out(message, table.unpack(blam.consoleColors.warning))
        elseif (color == "error") then
            console_out(message, table.unpack(blam.consoleColors.error))
        elseif (color == "success") then
            console_out(message, table.unpack(blam.consoleColors.success))
        else
            console_out(message)
        end
    end
end
