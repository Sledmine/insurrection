---@class EngineTagEquipmentPowerupTypeEnum : Enum 

---@class EngineTagEquipmentPowerupTypeNone : EngineTagEquipmentPowerupTypeEnum 
---@class EngineTagEquipmentPowerupTypeDoubleSpeed : EngineTagEquipmentPowerupTypeEnum 
---@class EngineTagEquipmentPowerupTypeOverShield : EngineTagEquipmentPowerupTypeEnum 
---@class EngineTagEquipmentPowerupTypeActiveCamouflage : EngineTagEquipmentPowerupTypeEnum 
---@class EngineTagEquipmentPowerupTypeFullSpectrumVision : EngineTagEquipmentPowerupTypeEnum 
---@class EngineTagEquipmentPowerupTypeHealth : EngineTagEquipmentPowerupTypeEnum 
---@class EngineTagEquipmentPowerupTypeGrenade : EngineTagEquipmentPowerupTypeEnum 

---@alias EngineTagEquipmentPowerupType 
---| EngineTagEquipmentPowerupTypeNone
---| EngineTagEquipmentPowerupTypeDoubleSpeed
---| EngineTagEquipmentPowerupTypeOverShield
---| EngineTagEquipmentPowerupTypeActiveCamouflage
---| EngineTagEquipmentPowerupTypeFullSpectrumVision
---| EngineTagEquipmentPowerupTypeHealth
---| EngineTagEquipmentPowerupTypeGrenade

---@class EngineTagEquipmentPowerupTypeTable 
---@field eNone EngineTagEquipmentPowerupTypeNone
---@field eDoubleSpeed EngineTagEquipmentPowerupTypeDoubleSpeed
---@field eOverShield EngineTagEquipmentPowerupTypeOverShield
---@field eActiveCamouflage EngineTagEquipmentPowerupTypeActiveCamouflage
---@field eFullSpectrumVision EngineTagEquipmentPowerupTypeFullSpectrumVision
---@field eHealth EngineTagEquipmentPowerupTypeHealth
---@field eGrenade EngineTagEquipmentPowerupTypeGrenade
Engine.tag.equipmentPowerupType = {} 

---@class MetaEngineTagDataEquipment: MetaEngineTagDataItem  
---@field powerupType EngineTagDataEquipmentPowerupType 
---@field grenadeType EngineTagDataGrenadeType 
---@field powerupTime number 
---@field pickupSound MetaEngineTagDependency 


