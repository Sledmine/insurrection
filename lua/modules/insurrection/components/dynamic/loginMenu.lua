local component = require "ui.component"
local constants = require "insurrection.constants"
local button = require "ui.button"
local checkbox = require "ui.checkbox"
local core = require "insurrection.core"
local interface = require "insurrection.interface"
local input = require "ui.input"

local engine = Engine

return function()
    local login = component.new(constants.widgets.login.handle.value)
    local usernameInput = input.new(login:findChildWidgetTag("username_input").handle.value)
    local passwordInput = input.new(login:findChildWidgetTag("userpswrd_input").handle.value)
    local showPasswordButton = checkbox.new(login:findChildWidgetTag("show_pasword").handle.value)

    local savedUserName, savedPassword = core.loadCredentials()

    local function updatePasswordDisplay(value, mask)
        passwordInput:setText(value, mask or nil)
        passwordInput:setValue(value)
    end

    passwordInput:onInputText(function(newValue)
        if showPasswordButton:getValue() then
            updatePasswordDisplay(newValue)
        else
            updatePasswordDisplay(passwordInput:getText(), "*")
        end
    end)

    showPasswordButton:onToggle(function(isShowPassword)
        if not isShowPassword then
            updatePasswordDisplay(passwordInput:getText(), "*")
        else
            updatePasswordDisplay(passwordInput:getText())
        end
    end)

    local loginButton = button.new(login:findChildWidgetTag("login_button").handle.value)
    loginButton:onClick(function()
        local username, password = usernameInput:getText(), passwordInput:getText()
        if username and password and username ~= "" and password ~= "" then
            core.saveCredentials(username, password)

            api.login(username, password)
        else
            interface.dialog("WARNING", "", "Please enter a username and password.")
        end
    end)

    local registerButton = button.new(login:findChildWidgetTag("register_button").handle.value)

    registerButton:onClick(function()
        interface.dialog("INFORMATION", "Join us on our Discord server!",
                         "We have a Discord Bot for the registering process:\n\n\nhttps://discord.shadowmods.net")
    end)

    login:onOpen(function(previousWidget)
        interface.blur(true)
        interface.setBackground("halo")
        if engine.cacheFile.getLoadedCacheFileHeader().scenarioName == "ui" and
            (previousWidget and previousWidget.handle.value == constants.widgets.main.handle.value) then
            if not discord.ready then
                -- BALLTZE MIGRATE
                --discord.startPresence()
            end
        end
        if savedUserName and savedPassword then

            usernameInput:setText(savedUserName)
            updatePasswordDisplay(savedPassword, "*")
        end
    end)
end
