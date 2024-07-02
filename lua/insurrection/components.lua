local balltze = Balltze
local engine = Engine
local blam = require "blam"
local getTag = blam.getTag
local uiWidgetDefinition = blam.uiWidgetDefinition
local unicodeStringList = blam.unicodeStringList
local isNull = blam.isNull
local core = require "insurrection.core"

---@class uiComponent
local component = {
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
    ---@type "generic" | "list" | "button" | "checkbox" | "slider" | "dropdown" | "text" | "image" | "spinner" | "progress"
    type = "generic"
    -- @type table<string, widgetAnimation>
    -- animations = {}
}

---@class uiComponentEvents
---@field onClick? fun(value?: string | boolean | number): boolean
---@field onFocus? function
---@field onOpen? fun(previousWidgetTag?: tag)
---@field onClose? fun():boolean
---@field animate? function

---@type table<number, uiComponent>
component.widgets = {}

function component.callbacks()
    ---@type MetaEngineTagDataUiWidgetDefinition?
    local editableWidgetTagData
    ---@type MetaEngineTag?
    local editableWidgetTagEntry
    ---@type MetaEngineTag?
    local lastFocusedWidgetTagEntry

    -- TODO Make this local and port functions to component
    VirtualInputValue = {}

    balltze.event.uiWidgetAccept.subscribe(function(event)
        if not event.time == "before" then
            return
        end
        local isCanceled = false
        local widgetTagHandleValue = engine.userInterface.findWidget(event.args.widget
                                                                         .definitionTagHandle)
                                         .definitionTagHandle.value
        local instance = component.widgets[widgetTagHandleValue]
        if instance then
            if instance.events.onClick then
                isCanceled = instance.events.onClick() == false
            end
        end
        if isCanceled then
            event:cancel()
        end
    end)

    ---@type BalltzeUIWidgetFocusEventCallback
    local function onWidgetFocus(event)
        if not event.time == "before" then
            return
        end
        local definitionTagHandleValue = event.args.widget.definitionTagHandle.value
        local component = component.widgets[definitionTagHandleValue]
        if component and component.events.onFocus then
            component.events.onFocus()
        end
        --local focusedWidgetTag = engine.tag.getTag(definitionTagHandleValue, engine.tag.classes.uiWidgetDefinition)
        local focusedWidgetTag = engine.tag.getTag(definitionTagHandleValue)
        if focusedWidgetTag then
            logger:debug("Focused widget: {}", focusedWidgetTag.path)
            lastFocusedWidgetTagEntry = focusedWidgetTag
            if focusedWidgetTag.data.flags1.editable or focusedWidgetTag.data.flags1.password then
                editableWidgetTagData = focusedWidgetTag.data
                editableWidgetTagEntry = focusedWidgetTag
            else
                editableWidgetTagData = nil
                editableWidgetTagEntry = nil
            end
        end
    end
    balltze.event.uiWidgetFocus.subscribe(onWidgetFocus)

    -- TODO BALLTZE MIGRATE
    local function onMouseButtonPress(event)
        if not event.time == "before" then
            return
        end
        local widgetInstanceIndex, button
        local widgetTagId = harmony.menu.get_widget_values(widgetInstanceIndex).tag_id
        if editableWidgetTagData and editableWidgetTagEntry then
            if widgetTagId == editableWidgetTagEntry.handle then
                if button == "right" then
                    if isBalltzeAvailable then
                        local inputString = core.getStringFromWidget(editableWidgetTagEntry.handle)
                        local text = inputString .. core.getClipboard()
                        core.setStringToWidget(text, editableWidgetTagEntry.handle)
                        local component = components.widgets[editableWidgetTagEntry.handle]
                        if component and component.events.onInputText then
                            component.events.onInputText(text)
                        end
                    end
                end
            end
        end
    end

    local function onMouseScroll(widgetTagHandle)
        local widget = engine.userInterface.findWidget(widgetTagHandle)
        if not widget then
            return
        end
        local parentWidget = widget.parentWidget
        if not parentWidget then
            return
        end
        local component = component.widgets[parentWidget.definitionTagHandle.value] --[[@as uiComponentList]]
        if component and component.type == "list" and component.onScroll then
            local mouse = core.getMouseState()
            component:scroll(mouse.scroll, true)
        end
    end
    balltze.event.frame.subscribe(function(event)
        if not event.time == "before" then
            return
        end
        local widget = engine.userInterface.getRootWidget()
        if widget then
            if lastFocusedWidgetTagEntry then
                local mouse = core.getMouseState()
                if mouse.scroll ~= 0 then
                    onMouseScroll(lastFocusedWidgetTagEntry.handle.value)
                end
            end
        end
    end)

    balltze.event.uiWidgetCreate.subscribe(function(event)
        if not event.time == "before" then
            return
        end
        local widgetValues = event.args.widget
        if widgetValues then
            local widgetTagHandleValue = widgetValues.definitionTagHandle.value
            local widgetTag = engine.tag.getTag(widgetTagHandleValue,
                                                engine.tag.classes.uiWidgetDefinition)
            local component = component.widgets[widgetTagHandleValue]
            if component and component.events.onOpen then
                --component.events.onOpen(previousWidgetTag)
                component.events.onOpen()
            end
            if previousWidgetTag ~= widgetTag then
                previousWidgetTag = widgetTag
            end

            if widgetTag then
                assert(widgetTag, "Invalid widget tag")
                local widgetTagData = widgetTag.data
                -- if widgetTagData and widgetTagData.childWidgetsCount > 0 then
                if widgetTagData and #widgetTagData.childWidgets > 0 then
                    local optionsWidgetTag = engine.tag.getTag(
                                                 widgetTagData.childWidgets[#widgetTagData.childWidgets]
                                                     .widgetTag.handle,
                                                 engine.tag.classes.uiWidgetDefinition)
                    assert(optionsWidgetTag, "Invalid options widget tag")
                    local optionsWidgetTagData = optionsWidgetTag.data
                    -- Auto focus on the first editable widget
                    if optionsWidgetTagData and optionsWidgetTagData.childWidgets[1] then
                        onWidgetFocus(optionsWidget.childWidgets[1].widgetTag)
                    end
                    interface.animationsReset(widgetTag.handle.value)
                end
            end
        end
    end)

    balltze.event.uiWidgetBack.subscribe(function(event)
        if not event.time == "before" then
            return
        end
        local widgetTagHandleValue = event.args.widget.definitionTagHandle.value
        local component = component.widgets[widgetTagHandleValue]
        if component and component.events.onClose then
            if component.events.onClose() == false then
                event:cancel()
            end
        end
        editableWidgetTagData = nil
    end)

    balltze.event.uiWidgetListTab.subscribe(function(event)
        --if not event.time == "before" then
        if true then
            return
        end
        local presedKey = event.args.tab
        logger:debug("Pressed key: {}", presedKey)

        local listWidgetTagId = event.args.widgetList.definitionTagHandle.value
        local previousFocusedWidgetId = event.args.widgetList.focusedChild.definitionTagHandle.value
        local widgetList = blam.uiWidgetDefinition(listWidgetTagId)
        -- local widget = blam.uiWidgetDefinition(previousFocusedWidgetId)
        assert(widgetList, "Invalid widget list tag id")
        -- console_debug("Widget list tag: " .. widgetListTag.path)
        -- console_debug("Pressed key: " .. pressedKey)
        if pressedKey == "dpad left" or pressedKey == "dpad right" then
            local component = components.widgets[listWidgetTagId] --[[@as uiComponentSpinner]]
            if component and component.type == "spinner" and component.events.onScroll then
                component:scroll(pressedKey == "dpad left" and -1 or 1)
                return
            end
        end
        for childIndex, child in pairs(widgetList.childWidgets) do
            if child.widgetTag == previousFocusedWidgetId then
                local nextChildIndex
                if pressedKey == "dpad up" or pressedKey == "dpad left" then
                    if childIndex - 1 < 1 then
                        nextChildIndex = widgetList.childWidgetsCount
                    else
                        nextChildIndex = childIndex - 1
                    end
                elseif pressedKey == "dpad down" or pressedKey == "dpad right" then
                    if childIndex + 1 > widgetList.childWidgetsCount then
                        nextChildIndex = 1
                    else
                        nextChildIndex = childIndex + 1
                    end
                end
                local widgetTagId = widgetList.childWidgets[nextChildIndex].widgetTag
                if widgetTagId and not isNull(widgetTagId) then
                    onWidgetFocus({
                        args = {widget = {definitionTagHandle = {value = widgetTagId}}},
                        time = "before"
                    })
                end
            end
        end
    end)

    function OnKeypress(modifiers, char, keycode)
        if editableWidgetTagData and editableWidgetTagEntry then
            -- Get pressed key from the keyboard
            local pressedKey
            if char then
                pressedKey = char
            elseif keycode then
                pressedKey = core.translateKeycode(keycode)
            end
            -- If we pressed a key, update our editable widget
            if pressedKey then
                local inputString = core.getStringFromWidget(editableWidgetTagEntry.id)
                local text = core.mapKeyToText(pressedKey, inputString)
                if text then
                    -- TODO Use widget text flags from widget tag instead (add support for that in lua-blam)
                    if editableWidgetTagData.name:find "password" then
                        core.setStringToWidget(text, editableWidgetTagEntry.id, "*")
                    else
                        core.setStringToWidget(text, editableWidgetTagEntry.id)
                    end
                    local component = components.widgets[editableWidgetTagEntry.id]
                    if component and component.events.onInputText then
                        component.events.onInputText(text)
                    end
                end
            end
        end
    end

    -- harmony.set_callback("widget list tab", "OnMenuListTab")
    -- harmony.set_callback("widget mouse focus", "OnMouseFocus")
    -- harmony.set_callback("widget mouse button press", "OnMouseButtonPress")
    -- harmony.set_callback("widget close", "OnWidgetClose")
    -- harmony.set_callback("widget open", "OnWidgetOpen")
    -- harmony.set_callback("key press", "OnKeypress")
end

---@param tagId number
---@return uiComponent
function component.new(tagId)
    local instance = setmetatable({}, {__index = component})
    instance.tagId = tagId
    instance.tag = getTag(instance.tagId) or error("Invalid tagId") --[[@as tag]]
    instance.selectedWidgetTagId = nil
    instance.widgetDefinition = uiWidgetDefinition(tagId) or error("Invalid tagId") --[[@as uiWidgetDefinition]]
    instance.events = {}
    instance.isBackgroundAnimated = false
    -- dprint("Created component: " .. instance.tag.path, "info")
    component.widgets[tagId] = instance
    return instance
end

---@param tagId number
---@return uiComponent
function component.get(tagId)
    return component.widgets[tagId]
end

---@param self uiComponent
function component.onFocus(self, callback)
    self.events.onFocus = callback
end

---@param self uiComponent
---@return string
function component.getText(self)
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
function component.setText(self, text, mask)
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
function component.onOpen(self, callback)
    self.events.onOpen = callback
end

---@param self uiComponent
---@param callback fun(): boolean?
function component.onClose(self, callback)
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
function component.animate(self, isLooped)
    self.isBackgroundAnimated = true
    self.isBackgroundLoop = isLooped
end

function component.free()
    component.widgets = {}
end

---@param self uiComponent
---@return tag[]
function component.getChildWidgetTags(self)
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
function component.findChildWidgetTag(self, name)
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
---@param name string
function component.findChildWidgetDefinition(self, name)
    local childWidgetTags = self:getChildWidgetTags()
    for _, childTag in pairs(childWidgetTags) do
        if childTag.path:find(name, 1, true) then
            return uiWidgetDefinition(childTag.id)
        end
        local widgetDefinition = uiWidgetDefinition(childTag.id)
        if widgetDefinition then
            for _, childWidget in pairs(widgetDefinition.childWidgets) do
                local tag = getTag(childWidget.widgetTag) --[[@as tag]]
                if not isNull(childWidget.widgetTag) then
                    if tag.path:find(name, 1, true) then
                        return uiWidgetDefinition(childWidget.widgetTag)
                    end
                end
            end
        end
    end
end

---@param self uiComponent
function component.getType(self)
    return self.type
end

---@param self uiComponent
---@param newWidgetTagId number
function component.replace(self, newWidgetTagId)
    core.replaceWidgetInDom(self.tagId, newWidgetTagId)
end

---@param self uiComponent
---@return uiWidgetValues?
function component.getWidgetValues(self)
    if core.getWidgetHandle(self.tagId) then
        return core.getWidgetValues(self.tagId)
    end
end

---@param self uiComponent
---@param values uiWidgetValues
function component.setWidgetValues(self, values)
    core.setWidgetValues(self.tagId, values)
end

---@param self uiComponent
function component.setBitmapIndex(self, index)
    core.setWidgetValues(self.tagId, {bitmapIndex = index - 1})
end

return component
