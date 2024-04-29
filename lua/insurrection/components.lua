local blam = require "blam"
local getTag = blam.getTag
local uiWidgetDefinition = blam.uiWidgetDefinition
local unicodeStringList = blam.unicodeStringList
local isNull = blam.isNull
local core = require "insurrection.core"
local harmony = require "mods.harmony"
local createBezierCurve = harmony.math.create_bezier_curve
local bezierCurve = harmony.math.get_bezier_curve_point

---@class uiComponent
local components = {
    ---@type number
    tagId = nil,
    ---@type tag
    tag = nil,
    ---@type uiWidgetDefinition
    widgetDefinition = nil,
    ---@type uiComponentEvents
    events = {},
    ---@type boolean
    isBackgroundAnimated = false,
    ---@type boolean
    isBackgroundLooped = false,
    ---@type '"generic"' | '"list"' | '"button"' | '"checkbox"' | '"slider"' | '"dropdown"' | '"text"' | '"image"' | '"spinner"' | '"progress"'
    type = "generic",
    ---@type table<string, widgetAnimation>
    animations = {}
}

---@class uiComponentEvents
---@field onClick? fun(value?: string | boolean | number): boolean
---@field onFocus? function
---@field onOpen? fun(previousWidgetTag?: tag)
---@field onClose? fun():boolean
---@field animate? function

---@type table<number, uiComponent>
components.widgets = {}

---@param tagId number
---@return uiComponent
function components.new(tagId)
    local instance = setmetatable({}, {__index = components})
    instance.tagId = tagId
    instance.tag = getTag(instance.tagId) or error("Invalid tagId") --[[@as tag]]
    instance.selectedWidgetTagId = nil
    instance.widgetDefinition = uiWidgetDefinition(tagId) or error("Invalid tagId") --[[@as uiWidgetDefinition]]
    instance.events = {}
    instance.isBackgroundAnimated = false
    -- dprint("Created component: " .. instance.tag.path, "info")
    components.widgets[tagId] = instance
    return instance
end

---@param tagId number
---@return uiComponent
function components.get(tagId)
    return components.widgets[tagId]
end

---@param self uiComponent
function components.onFocus(self, callback)
    self.events.onFocus = callback
end

---@param self uiComponent
---@return string
function components.getText(self)
    local virtualValue = VirtualInputValue[self.tagId]
    if virtualValue then
        return virtualValue
    end
    local unicodeStrings = blam.unicodeStringList(self.widgetDefinition.unicodeStringListTag)
    if unicodeStrings then
        return unicodeStrings.strings[self.widgetDefinition.stringListIndex + 1]
    end
    error("No unicodeStringList found for widgetDefinition")
end

---@param self uiComponent
---@param text string
---@param mask? string
function components.setText(self, text, mask)
    local childUnicodeStrings
    local childWidgetDefinition
    local widgetDefinition = self.widgetDefinition
    if self.widgetDefinition.childWidgetsCount > 0 then
        local childTagId = self.widgetDefinition.childWidgets[1].widgetTag
        childWidgetDefinition = uiWidgetDefinition(childTagId) --[[@as uiWidgetDefinition]]
        childUnicodeStrings = unicodeStringList(childWidgetDefinition.unicodeStringListTag)
    end
    local unicodeStrings = unicodeStringList(self.widgetDefinition.unicodeStringListTag)
    if not (unicodeStrings and not isNull(unicodeStrings)) then
        unicodeStrings = childUnicodeStrings --[[@as unicodeStringList]]
        widgetDefinition = childWidgetDefinition --[[@as uiWidgetDefinition]]
    end
    if not (unicodeStrings and not isNull(unicodeStrings)) then
        error("No unicodeStringList found for widgetDefinition " .. self.tag.path)
    end
    local stringListIndex = widgetDefinition.stringListIndex
    local newStrings = unicodeStrings.strings
    if mask then
        VirtualInputValue[self.tagId] = text
        newStrings[stringListIndex + 1] = string.rep(mask, #text)
    else
        newStrings[stringListIndex + 1] = text
    end
    unicodeStrings.strings = newStrings
end

---@param self uiComponent
---@param callback fun(previousWidgetTag?: tag)
function components.onOpen(self, callback)
    self.events.onOpen = callback
end

---@param self uiComponent
---@param callback fun(): boolean?
function components.onClose(self, callback)
    self.events.onClose = callback
end

--[[
    -- Fake menu scrolling
    if lastOpenWidgetTag and
        (lastOpenWidgetTag.id == interface.widgets.lobbyWidgetTag.id or lastOpenWidgetTag.id ==
            interface.widgets.customizationWidgetTag.id) then
        local scroll = tonumber(read_char(0x64C73C + 8))
        if scroll > 0 then
            store:dispatch(actions.scroll(false))
        elseif scroll < 0 then
            store:dispatch(actions.scroll(true))
        end
    end
]]

---Animate component background
---@param self uiComponent
---@param isLooped? boolean
function components.animate(self, isLooped)
    ---@diagnostic disable-next-line: inject-field
    self.isBackgroundAnimated = true
    ---@diagnostic disable-next-line: inject-field
    self.isBackgroundLooped = isLooped or false
end

function components.free()
    components.widgets = {}
end

---@param self uiComponent
---@return tag[]
function components.getChildWidgetTags(self)
    -- TODO Filter this instead of mapping
    return table.map(self.widgetDefinition.childWidgets, function(childWidget)
        if not isNull(childWidget.widgetTag) then
            local tag = getTag(childWidget.widgetTag)
            return tag
        end
        return nil
    end)
end

---@param self uiComponent
---@param name string
function components.findChildWidgetTag(self, name)
    local childWidgetTags = self:getChildWidgetTags()
    for _, childTag in pairs(childWidgetTags) do
        if childTag.path:find(name, 1, true) then
            return childTag
        end
        local widgetDefinition = uiWidgetDefinition(childTag.id)
        if widgetDefinition then
            for _, childWidget in pairs(widgetDefinition.childWidgets) do
                local tag = getTag(childWidget.widgetTag) --[[@as tag]]
                if not isNull(childWidget.widgetTag) then
                    if tag.path:find(name, 1, true) then
                        return tag
                    end
                end
            end
        end
    end
end

---@param self uiComponent
function components.getType(self)
    return self.type
end

---@param self uiComponent
---@param newWidgetTagId number
function components.replace(self, newWidgetTagId)
    core.replaceWidgetInDom(self.tagId, newWidgetTagId)
end

---@enum bezierCurves
local bezierCurves = {
    ["ease in"] = createBezierCurve("ease in"),
    ["ease out"] = createBezierCurve("ease out"),
    ["ease in out"] = createBezierCurve("ease in out")
}

---@class widgetAnimation
---@field finished boolean
---@field timestamp number?
---@field elapsed number?
---@field play fun()

---Setup an animation to apply to a widget
---@param duration number Duration of the animation in seconds
---@param property '"horizontal"' | '"vertical"' | '"opacity"' | string Property to animate (e.g. "opacity")
---@param originalOffset number Original offset of the widget
---@param offset number Offset to apply to the widget
---@param bezier? bezierCurves Bezier curve to use, e.g. "ease in"
function components.setAnimation(self, duration, property, originalOffset, offset, bezier)
    local targetWidgetTagId = self.tagId
    local animationId = targetWidgetTagId .. property
    self.animations[animationId] = {
        finished = false,
        timestamp = nil,
        play = function()
            console_out("Playing animation " .. animationId)
            local originalOffset = originalOffset
            local bezierCurveHandle = bezierCurves[bezier] or bezierCurves["ease in"]
            if not self.animations[animationId].timestamp then
                self.animations[animationId].timestamp = harmony.time.set_timestamp()
            end
            local elapsed = harmony.time.get_elapsed_milliseconds(
                                self.animations[animationId].timestamp) / 1000
            self.animations[animationId].elapsed = elapsed
            -- console_out(elapsed)
            -- console_out(duration)
            if (elapsed >= duration) then

                if property == "horizontal" then
                    core.setWidgetValues(targetWidgetTagId, {left_bound = offset})
                elseif property == "vertical" then
                    core.setWidgetValues(targetWidgetTagId, {top_bound = offset})
                else
                    core.setWidgetValues(targetWidgetTagId, {opacity = offset})
                end

                self.animations[animationId].timestamp = nil
                self.animations[animationId].finished = true
                return
            end

            local t = (elapsed / duration)
            local newPosition = bezierCurve(bezierCurveHandle, originalOffset, offset, t)
            if property == "horizontal" then
                core.setWidgetValues(targetWidgetTagId, {left_bound = math.floor(newPosition)})
            elseif property == "vertical" then
                core.setWidgetValues(targetWidgetTagId, {top_bound = math.floor(newPosition)})
            else
                core.setWidgetValues(targetWidgetTagId, {opacity = newPosition})
            end
        end
    }
end

---@param self uiComponent
---@return table?
function components.getWidgetValues(self)
    if core.getWidgetHandle(self.tagId) then
        return core.getWidgetValues(self.tagId)
    end
end

---@param self uiComponent
---@param values table
function components.setWidgetValues(self, values)
    core.setWidgetValues(self.tagId, values)
end

return components
