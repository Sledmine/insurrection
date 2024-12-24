---@class EngineTagInputDeviceDefaultsDeviceTypeEnum : Enum 

---@class EngineTagInputDeviceDefaultsDeviceTypeMouseAndKeyboard : EngineTagInputDeviceDefaultsDeviceTypeEnum 
---@class EngineTagInputDeviceDefaultsDeviceTypeJoysticksGamepadsEtc : EngineTagInputDeviceDefaultsDeviceTypeEnum 
---@class EngineTagInputDeviceDefaultsDeviceTypeFullProfileDefinition : EngineTagInputDeviceDefaultsDeviceTypeEnum 

---@alias EngineTagInputDeviceDefaultsDeviceType 
---| EngineTagInputDeviceDefaultsDeviceTypeMouseAndKeyboard
---| EngineTagInputDeviceDefaultsDeviceTypeJoysticksGamepadsEtc
---| EngineTagInputDeviceDefaultsDeviceTypeFullProfileDefinition

---@class EngineTagInputDeviceDefaultsDeviceTypeTable 
---@field ypeMouseAndKeyboard EngineTagInputDeviceDefaultsDeviceTypeMouseAndKeyboard
---@field ypeJoysticksGamepadsEtc EngineTagInputDeviceDefaultsDeviceTypeJoysticksGamepadsEtc
---@field ypeFullProfileDefinition EngineTagInputDeviceDefaultsDeviceTypeFullProfileDefinition
Engine.tag.inputDeviceDefaultsDeviceType = {} 

---@class MetaEngineTagDataInputDeviceDefaultsFlags 
---@field unused boolean 

---@class MetaEngineTagDataInputDeviceDefaults 
---@field deviceType EngineTagDataInputDeviceDefaultsDeviceType 
---@field flags MetaEngineTagDataInputDeviceDefaultsFlags 
---@field deviceId MetaEngineTagDataOffset 
---@field profile MetaEngineTagDataOffset 


