---@class EngineTagFlagTrailingEdgeShapeEnum : Enum 

---@class EngineTagFlagTrailingEdgeShapeFlat : EngineTagFlagTrailingEdgeShapeEnum 
---@class EngineTagFlagTrailingEdgeShapeConcaveTriangular : EngineTagFlagTrailingEdgeShapeEnum 
---@class EngineTagFlagTrailingEdgeShapeConvexTriangular : EngineTagFlagTrailingEdgeShapeEnum 
---@class EngineTagFlagTrailingEdgeShapeTrapezoidShortTop : EngineTagFlagTrailingEdgeShapeEnum 
---@class EngineTagFlagTrailingEdgeShapeTrapezoidShortBottom : EngineTagFlagTrailingEdgeShapeEnum 

---@alias EngineTagFlagTrailingEdgeShape 
---| EngineTagFlagTrailingEdgeShapeFlat
---| EngineTagFlagTrailingEdgeShapeConcaveTriangular
---| EngineTagFlagTrailingEdgeShapeConvexTriangular
---| EngineTagFlagTrailingEdgeShapeTrapezoidShortTop
---| EngineTagFlagTrailingEdgeShapeTrapezoidShortBottom

---@class EngineTagFlagTrailingEdgeShapeTable 
---@field peFlat EngineTagFlagTrailingEdgeShapeFlat
---@field peConcaveTriangular EngineTagFlagTrailingEdgeShapeConcaveTriangular
---@field peConvexTriangular EngineTagFlagTrailingEdgeShapeConvexTriangular
---@field peTrapezoidShortTop EngineTagFlagTrailingEdgeShapeTrapezoidShortTop
---@field peTrapezoidShortBottom EngineTagFlagTrailingEdgeShapeTrapezoidShortBottom
Engine.tag.flagTrailingEdgeShape = {} 

---@class EngineTagFlagAttachedEdgeShapeEnum : Enum 

---@class EngineTagFlagAttachedEdgeShapeFlat : EngineTagFlagAttachedEdgeShapeEnum 
---@class EngineTagFlagAttachedEdgeShapeConcaveTriangular : EngineTagFlagAttachedEdgeShapeEnum 

---@alias EngineTagFlagAttachedEdgeShape 
---| EngineTagFlagAttachedEdgeShapeFlat
---| EngineTagFlagAttachedEdgeShapeConcaveTriangular

---@class EngineTagFlagAttachedEdgeShapeTable 
---@field peFlat EngineTagFlagAttachedEdgeShapeFlat
---@field peConcaveTriangular EngineTagFlagAttachedEdgeShapeConcaveTriangular
Engine.tag.flagAttachedEdgeShape = {} 

---@class MetaEngineTagDataFlagAttachmentPoint 
---@field heightToNextAttachment integer 
---@field markerName MetaEngineTagString 

---@class MetaEngineTagDataFlag 
---@field flags MetaEngineTagDataIsUnusedFlag 
---@field trailingEdgeShape EngineTagDataFlagTrailingEdgeShape 
---@field trailingEdgeShapeOffset integer 
---@field attachedEdgeShape EngineTagDataFlagAttachedEdgeShape 
---@field width integer 
---@field height integer 
---@field cellWidth number 
---@field cellHeight number 
---@field redFlagShader MetaEngineTagDependency 
---@field physics MetaEngineTagDependency 
---@field windNoise number 
---@field blueFlagShader MetaEngineTagDependency 
---@field attachmentPoints TagBlock<MetaEngineTagDataFlagAttachmentPoint> 


