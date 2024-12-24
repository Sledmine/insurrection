---@class EngineTagDeviceInEnum : Enum 

---@class EngineTagDeviceInNone : EngineTagDeviceInEnum 
---@class EngineTagDeviceInPower : EngineTagDeviceInEnum 
---@class EngineTagDeviceInChangeInPower : EngineTagDeviceInEnum 
---@class EngineTagDeviceInPosition : EngineTagDeviceInEnum 
---@class EngineTagDeviceInChangeInPosition : EngineTagDeviceInEnum 
---@class EngineTagDeviceInLocked : EngineTagDeviceInEnum 
---@class EngineTagDeviceInDelay : EngineTagDeviceInEnum 

---@alias EngineTagDeviceIn 
---| EngineTagDeviceInNone
---| EngineTagDeviceInPower
---| EngineTagDeviceInChangeInPower
---| EngineTagDeviceInPosition
---| EngineTagDeviceInChangeInPosition
---| EngineTagDeviceInLocked
---| EngineTagDeviceInDelay

---@class EngineTagDeviceInTable 
---@field none EngineTagDeviceInNone
---@field power EngineTagDeviceInPower
---@field changeInPower EngineTagDeviceInChangeInPower
---@field position EngineTagDeviceInPosition
---@field changeInPosition EngineTagDeviceInChangeInPosition
---@field locked EngineTagDeviceInLocked
---@field delay EngineTagDeviceInDelay
Engine.tag.deviceIn = {} 

---@class MetaEngineTagDataDeviceFlags 
---@field positionLoops boolean 
---@field positionNotInterpolated boolean 

---@class MetaEngineTagDataDevice: MetaEngineTagDataObject  
---@field deviceFlags MetaEngineTagDataDeviceFlags 
---@field powerTransitionTime number 
---@field powerAccelerationTime number 
---@field positionTransitionTime number 
---@field positionAccelerationTime number 
---@field depoweredPositionTransitionTime number 
---@field depoweredPositionAccelerationTime number 
---@field deviceAIn EngineTagDataDeviceIn 
---@field deviceBIn EngineTagDataDeviceIn 
---@field deviceCIn EngineTagDataDeviceIn 
---@field deviceDIn EngineTagDataDeviceIn 
---@field open MetaEngineTagDependency 
---@field close MetaEngineTagDependency 
---@field opened MetaEngineTagDependency 
---@field closed MetaEngineTagDependency 
---@field depowered MetaEngineTagDependency 
---@field repowered MetaEngineTagDependency 
---@field delayTime number 
---@field delayEffect MetaEngineTagDependency 
---@field automaticActivationRadius number 
---@field inversePowerAccelerationTime number 
---@field inversePowerTransitionTime number 
---@field inverseDepoweredPositionAccelerationTime number 
---@field inverseDepoweredPositionTransitionTime number 
---@field inversePositionAccelerationTime number 
---@field inversePositionTransitionTime number 
---@field delayTimeTicks number 


