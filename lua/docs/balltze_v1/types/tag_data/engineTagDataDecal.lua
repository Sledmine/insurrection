---@class EngineTagDecalTypeEnum : Enum 

---@class EngineTagDecalTypeScratch : EngineTagDecalTypeEnum 
---@class EngineTagDecalTypeSplatter : EngineTagDecalTypeEnum 
---@class EngineTagDecalTypeBurn : EngineTagDecalTypeEnum 
---@class EngineTagDecalTypePaintedSign : EngineTagDecalTypeEnum 

---@alias EngineTagDecalType 
---| EngineTagDecalTypeScratch
---| EngineTagDecalTypeSplatter
---| EngineTagDecalTypeBurn
---| EngineTagDecalTypePaintedSign

---@class EngineTagDecalTypeTable 
---@field scratch EngineTagDecalTypeScratch
---@field splatter EngineTagDecalTypeSplatter
---@field burn EngineTagDecalTypeBurn
---@field paintedSign EngineTagDecalTypePaintedSign
Engine.tag.decalType = {} 

---@class EngineTagDecalLayerEnum : Enum 

---@class EngineTagDecalLayerPrimary : EngineTagDecalLayerEnum 
---@class EngineTagDecalLayerSecondary : EngineTagDecalLayerEnum 
---@class EngineTagDecalLayerLight : EngineTagDecalLayerEnum 
---@class EngineTagDecalLayerAlphaTested : EngineTagDecalLayerEnum 
---@class EngineTagDecalLayerWater : EngineTagDecalLayerEnum 

---@alias EngineTagDecalLayer 
---| EngineTagDecalLayerPrimary
---| EngineTagDecalLayerSecondary
---| EngineTagDecalLayerLight
---| EngineTagDecalLayerAlphaTested
---| EngineTagDecalLayerWater

---@class EngineTagDecalLayerTable 
---@field primary EngineTagDecalLayerPrimary
---@field secondary EngineTagDecalLayerSecondary
---@field light EngineTagDecalLayerLight
---@field alphaTested EngineTagDecalLayerAlphaTested
---@field water EngineTagDecalLayerWater
Engine.tag.decalLayer = {} 

---@class MetaEngineTagDataDecalFlags 
---@field geometryInheritedByNextDecalInChain boolean 
---@field interpolateColorInHsv boolean 
---@field moreColors boolean 
---@field noRandomRotation boolean 
---@field waterEffect boolean 
---@field sapienSnapToAxis boolean 
---@field sapienIncrementalCounter boolean 
---@field animationLoop boolean 
---@field preserveAspect boolean 
---@field disabledInAnniversaryByBloodSetting boolean 

---@class MetaEngineTagDataDecal 
---@field flags MetaEngineTagDataDecalFlags 
---@field type EngineTagDataDecalType 
---@field layer EngineTagDataDecalLayer 
---@field nextDecalInChain MetaEngineTagDependency 
---@field radius number 
---@field intensity MetaEngineFraction 
---@field colorLowerBounds MetaEngineColorRGB 
---@field colorUpperBounds MetaEngineColorRGB 
---@field animationLoopFrame integer 
---@field animationSpeed integer 
---@field lifetime number 
---@field decayTime number 
---@field framebufferBlendFunction EngineTagDataFramebufferBlendFunction 
---@field map MetaEngineTagDependency 
---@field maximumSpriteExtent number 


