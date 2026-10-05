---@class EngineTagMeterInterpolateColorsEnum : Enum 

---@class EngineTagMeterInterpolateColorsLinearly : EngineTagMeterInterpolateColorsEnum 
---@class EngineTagMeterInterpolateColorsFasterNearEmpty : EngineTagMeterInterpolateColorsEnum 
---@class EngineTagMeterInterpolateColorsFasterNearFull : EngineTagMeterInterpolateColorsEnum 
---@class EngineTagMeterInterpolateColorsThroughRandomNoise : EngineTagMeterInterpolateColorsEnum 

---@alias EngineTagMeterInterpolateColors 
---| EngineTagMeterInterpolateColorsLinearly
---| EngineTagMeterInterpolateColorsFasterNearEmpty
---| EngineTagMeterInterpolateColorsFasterNearFull
---| EngineTagMeterInterpolateColorsThroughRandomNoise

---@class EngineTagMeterInterpolateColorsTable 
---@field sLinearly EngineTagMeterInterpolateColorsLinearly
---@field sFasterNearEmpty EngineTagMeterInterpolateColorsFasterNearEmpty
---@field sFasterNearFull EngineTagMeterInterpolateColorsFasterNearFull
---@field sThroughRandomNoise EngineTagMeterInterpolateColorsThroughRandomNoise
Engine.tag.meterInterpolateColors = {} 

---@class EngineTagMeterAnchorColorsEnum : Enum 

---@class EngineTagMeterAnchorColorsAtBothEnds : EngineTagMeterAnchorColorsEnum 
---@class EngineTagMeterAnchorColorsAtEmpty : EngineTagMeterAnchorColorsEnum 
---@class EngineTagMeterAnchorColorsAtFull : EngineTagMeterAnchorColorsEnum 

---@alias EngineTagMeterAnchorColors 
---| EngineTagMeterAnchorColorsAtBothEnds
---| EngineTagMeterAnchorColorsAtEmpty
---| EngineTagMeterAnchorColorsAtFull

---@class EngineTagMeterAnchorColorsTable 
---@field sAtBothEnds EngineTagMeterAnchorColorsAtBothEnds
---@field sAtEmpty EngineTagMeterAnchorColorsAtEmpty
---@field sAtFull EngineTagMeterAnchorColorsAtFull
Engine.tag.meterAnchorColors = {} 

---@class MetaEngineTagDataMeter 
---@field flags MetaEngineTagDataIsUnusedFlag 
---@field stencilBitmaps MetaEngineTagDependency 
---@field sourceBitmap MetaEngineTagDependency 
---@field stencilSequenceIndex integer 
---@field sourceSequenceIndex integer 
---@field interpolateColors EngineTagDataMeterInterpolateColors 
---@field anchorColors EngineTagDataMeterAnchorColors 
---@field emptyColor MetaEngineColorARGB 
---@field fullColor MetaEngineColorARGB 
---@field unmaskDistance number 
---@field maskDistance number 
---@field encodedStencil MetaEngineTagDataOffset 


