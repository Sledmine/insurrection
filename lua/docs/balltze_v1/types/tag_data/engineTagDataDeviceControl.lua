---@class EngineTagDeviceTypeEnum : Enum 

---@class EngineTagDeviceTypeToggleSwitch : EngineTagDeviceTypeEnum 
---@class EngineTagDeviceTypeOnButton : EngineTagDeviceTypeEnum 
---@class EngineTagDeviceTypeOffButton : EngineTagDeviceTypeEnum 
---@class EngineTagDeviceTypeCallButton : EngineTagDeviceTypeEnum 

---@alias EngineTagDeviceType 
---| EngineTagDeviceTypeToggleSwitch
---| EngineTagDeviceTypeOnButton
---| EngineTagDeviceTypeOffButton
---| EngineTagDeviceTypeCallButton

---@class EngineTagDeviceTypeTable 
---@field toggleSwitch EngineTagDeviceTypeToggleSwitch
---@field onButton EngineTagDeviceTypeOnButton
---@field offButton EngineTagDeviceTypeOffButton
---@field callButton EngineTagDeviceTypeCallButton
Engine.tag.deviceType = {} 

---@class EngineTagDeviceTriggersWhenEnum : Enum 

---@class EngineTagDeviceTriggersWhenTouchedByPlayer : EngineTagDeviceTriggersWhenEnum 
---@class EngineTagDeviceTriggersWhenDestroyed : EngineTagDeviceTriggersWhenEnum 

---@alias EngineTagDeviceTriggersWhen 
---| EngineTagDeviceTriggersWhenTouchedByPlayer
---| EngineTagDeviceTriggersWhenDestroyed

---@class EngineTagDeviceTriggersWhenTable 
---@field nTouchedByPlayer EngineTagDeviceTriggersWhenTouchedByPlayer
---@field nDestroyed EngineTagDeviceTriggersWhenDestroyed
Engine.tag.deviceTriggersWhen = {} 

---@class MetaEngineTagDataDeviceControl: MetaEngineTagDataDevice  
---@field type EngineTagDataDeviceType 
---@field triggersWhen EngineTagDataDeviceTriggersWhen 
---@field callValue number 
---@field on MetaEngineTagDependency 
---@field off MetaEngineTagDependency 
---@field deny MetaEngineTagDependency 


