local color = {}

--- Convert to decimal rgb color from hex string color
---@param hex string
---@param alpha? number
function color.hexToDec(hex, alpha)
    local redColor, greenColor, blueColor = hex:gsub("#", ""):match("(..)(..)(..)")
    redColor, greenColor, blueColor = tonumber(redColor, 16) / 255, tonumber(greenColor, 16) / 255,
                                      tonumber(blueColor, 16) / 255
    redColor, greenColor, blueColor = math.floor(redColor * 100) / 100,
                                      math.floor(greenColor * 100) / 100,
                                      math.floor(blueColor * 100) / 100
    if alpha == nil then
        return redColor, greenColor, blueColor
    elseif alpha > 1 then
        alpha = alpha / 100
    end
    return redColor, greenColor, blueColor, alpha
end

--- Convert to decimal rgb color from byte rgb color
---@param r number
---@param g number
---@param b number
---@param alpha number
function color.rgbToDec(r, g, b, alpha)
    local redColor, greenColor, blueColor = r / 255, g / 255, b / 255
    redColor, greenColor, blueColor = math.floor(redColor * 100) / 100,
                                      math.floor(greenColor * 100) / 100,
                                      math.floor(blueColor * 100) / 100
    if alpha == nil then
        return redColor, greenColor, blueColor
    elseif alpha > 1 then
        alpha = alpha / 100
    end
    return redColor, greenColor, blueColor, alpha
end

--- Convert to rgb bytes to hex string
---@param r number
---@param g number
---@param b number
function color.rgbToHex(r, g, b)
    local rgb = (r * 0x10000) + (g * 0x100) + b
    return string.format("%06x", rgb)
end

--- Convert to rgb bytes to hex string
---@param r number
---@param g number
---@param b number
function color.decToHex(r, g, b)
    r = math.max(0, math.min(1, r))
    g = math.max(0, math.min(1, g))
    b = math.max(0, math.min(1, b))

    r = math.ceil(r * 255)
    g = math.ceil(g * 255)
    b = math.ceil(b * 255)

    return string.format("#%02X%02X%02X", r, g, b)
end

return color
