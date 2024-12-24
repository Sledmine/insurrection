---@class EngineTagDetailObjectCollectionTypeEnum : Enum 

---@class EngineTagDetailObjectCollectionTypeScreenFacing : EngineTagDetailObjectCollectionTypeEnum 
---@class EngineTagDetailObjectCollectionTypeViewerFacing : EngineTagDetailObjectCollectionTypeEnum 

---@alias EngineTagDetailObjectCollectionType 
---| EngineTagDetailObjectCollectionTypeScreenFacing
---| EngineTagDetailObjectCollectionTypeViewerFacing

---@class EngineTagDetailObjectCollectionTypeTable 
---@field peScreenFacing EngineTagDetailObjectCollectionTypeScreenFacing
---@field peViewerFacing EngineTagDetailObjectCollectionTypeViewerFacing
Engine.tag.detailObjectCollectionType = {} 

---@class MetaEngineTagDataDetailObjectCollectionTypeFlags 
---@field unusedA boolean 
---@field unusedB boolean 
---@field interpolateColorInHsv boolean 
---@field moreColors boolean 

---@class MetaEngineTagDataDetailObjectCollectionObjectType 
---@field name MetaEngineTagString 
---@field sequenceIndex integer 
---@field flags MetaEngineTagDataDetailObjectCollectionTypeFlags 
---@field firstSpriteIndex integer 
---@field spriteCount integer 
---@field colorOverrideFactor MetaEngineFraction 
---@field nearFadeDistance number 
---@field farFadeDistance number 
---@field size number 
---@field minimumColor MetaEngineColorRGB 
---@field maximumColor MetaEngineColorRGB 
---@field ambientColor MetaEngineColorARGBInt 

---@class MetaEngineTagDataDetailObjectCollection 
---@field collectionType EngineTagDataDetailObjectCollectionType 
---@field globalZOffset number 
---@field spritePlate MetaEngineTagDependency 
---@field types TagBlock<MetaEngineTagDataDetailObjectCollectionObjectType> 


