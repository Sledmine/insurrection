---@class EngineTagMachineTypeEnum : Enum 

---@class EngineTagMachineTypeDoor : EngineTagMachineTypeEnum 
---@class EngineTagMachineTypePlatform : EngineTagMachineTypeEnum 
---@class EngineTagMachineTypeGear : EngineTagMachineTypeEnum 

---@alias EngineTagMachineType 
---| EngineTagMachineTypeDoor
---| EngineTagMachineTypePlatform
---| EngineTagMachineTypeGear

---@class EngineTagMachineTypeTable 
---@field door EngineTagMachineTypeDoor
---@field platform EngineTagMachineTypePlatform
---@field gear EngineTagMachineTypeGear
Engine.tag.machineType = {} 

---@class EngineTagMachineCollisionResponseEnum : Enum 

---@class EngineTagMachineCollisionResponsePauseUntilCrushed : EngineTagMachineCollisionResponseEnum 
---@class EngineTagMachineCollisionResponseReverseDirections : EngineTagMachineCollisionResponseEnum 

---@alias EngineTagMachineCollisionResponse 
---| EngineTagMachineCollisionResponsePauseUntilCrushed
---| EngineTagMachineCollisionResponseReverseDirections

---@class EngineTagMachineCollisionResponseTable 
---@field ePauseUntilCrushed EngineTagMachineCollisionResponsePauseUntilCrushed
---@field eReverseDirections EngineTagMachineCollisionResponseReverseDirections
Engine.tag.machineCollisionResponse = {} 

---@class MetaEngineTagDataMachineFlags 
---@field pathfindingObstacle boolean 
---@field butNotWhenOpen boolean 
---@field elevator boolean 

---@class MetaEngineTagDataDeviceMachine: MetaEngineTagDataDevice  
---@field machineType EngineTagDataMachineType 
---@field machineFlags MetaEngineTagDataMachineFlags 
---@field doorOpenTime number 
---@field collisionResponse EngineTagDataMachineCollisionResponse 
---@field elevatorNode MetaEngineIndex 
---@field doorOpenTimeTicks integer 


