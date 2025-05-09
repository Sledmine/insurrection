local components = require "insurrection.components"
local constants = require "insurrection.constants"
local button = require "insurrection.components.button"
local core = require "insurrection.core"
local interface = require "insurrection.interface"
local input = require "insurrection.components.input"

local engine = Engine

return function()
    local login = components.new(constants.widgets.login.id)
    local usernameInput = input.new(login:findChildWidgetTag("username_input").id)
    local passwordInput = input.new(login:findChildWidgetTag("userpswrd_input").id)
    local showPasswordButton = button.new(login:findChildWidgetTag("showpasswrd_button").id)
    local isShowPassword = false

    local savedUserName, savedPassword = core.loadCredentials()

    local LABEL_SHOW_PASSWORD = "SHOW PASSWORD"
    local LABEL_HIDE_PASSWORD = "HIDE PASSWORD"

    local function updatePasswordDisplay(value, mask)
        passwordInput:setText(value, mask or nil)
        passwordInput:setValue(value)
    end

    local function resetState()
        isShowPassword = false
        showPasswordButton:setText(LABEL_SHOW_PASSWORD)
    end

    passwordInput:onInputText(function(newValue)
        if isShowPassword then
            updatePasswordDisplay(newValue)
        else
            updatePasswordDisplay(passwordInput:getText(), "*")
        end
    end)

    showPasswordButton:onClick(function()
        if isShowPassword then
            updatePasswordDisplay(passwordInput:getText(), "*")
            isShowPassword = false
            showPasswordButton:setText(LABEL_SHOW_PASSWORD)

        else
            updatePasswordDisplay(passwordInput:getText())
            isShowPassword = true
            showPasswordButton:setText(LABEL_HIDE_PASSWORD)
        end
    end)

    local loginButton = button.new(login:findChildWidgetTag("login_button").id)
    loginButton:onClick(function()
        local username, password = usernameInput:getText(), passwordInput:getText()
        if username and password and username ~= "" and password ~= "" then
            core.saveCredentials(username, password)

            api.login(username, password)
            resetState()

        else
            interface.dialog("WARNING", "", "Please enter a username and password.")
        end
    end)

    local registerButton = button.new(login:findChildWidgetTag("register_button").id)

    registerButton:onClick(function()
        interface.dialog("INFORMATION", "Join us on our Discord server!",
                         "We have a Discord Bot for the registering process:\n\n\nhttps://discord.shadowmods.net")
    end)

    login:onOpen(function(previousWidget)
        interface.blur(true)
        interface.setBackground("halo")
        if engine.map.getCurrentMapHeader().name == "ui" and
            (previousWidget and previousWidget.handle.value == constants.widgets.main.id) then
            if not discord.ready then
                discord.startPresence()
            end
        end
        if savedUserName and savedPassword then

            usernameInput:setText(savedUserName)
            updatePasswordDisplay(savedPassword, "*")
        end
    end)
    login:onClose(function()
        resetState()
    end)
end
