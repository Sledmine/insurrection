---@class EngineTagShaderDetailLevelEnum : Enum 

---@class EngineTagShaderDetailLevelHigh : EngineTagShaderDetailLevelEnum 
---@class EngineTagShaderDetailLevelMedium : EngineTagShaderDetailLevelEnum 
---@class EngineTagShaderDetailLevelLow : EngineTagShaderDetailLevelEnum 
---@class EngineTagShaderDetailLevelTurd : EngineTagShaderDetailLevelEnum 

---@alias EngineTagShaderDetailLevel 
---| EngineTagShaderDetailLevelHigh
---| EngineTagShaderDetailLevelMedium
---| EngineTagShaderDetailLevelLow
---| EngineTagShaderDetailLevelTurd

---@class EngineTagShaderDetailLevelTable 
---@field lHigh EngineTagShaderDetailLevelHigh
---@field lMedium EngineTagShaderDetailLevelMedium
---@field lLow EngineTagShaderDetailLevelLow
---@field lTurd EngineTagShaderDetailLevelTurd
Engine.tag.shaderDetailLevel = {} 

---@class EngineTagShaderColorFunctionTypeEnum : Enum 

---@class EngineTagShaderColorFunctionTypeCurrent : EngineTagShaderColorFunctionTypeEnum 
---@class EngineTagShaderColorFunctionTypeNextMap : EngineTagShaderColorFunctionTypeEnum 
---@class EngineTagShaderColorFunctionTypeMultiply : EngineTagShaderColorFunctionTypeEnum 
---@class EngineTagShaderColorFunctionTypeDoubleMultiply : EngineTagShaderColorFunctionTypeEnum 
---@class EngineTagShaderColorFunctionTypeAdd : EngineTagShaderColorFunctionTypeEnum 
---@class EngineTagShaderColorFunctionTypeAddSignedCurrent : EngineTagShaderColorFunctionTypeEnum 
---@class EngineTagShaderColorFunctionTypeAddSignedNextMap : EngineTagShaderColorFunctionTypeEnum 
---@class EngineTagShaderColorFunctionTypeSubtractCurrent : EngineTagShaderColorFunctionTypeEnum 
---@class EngineTagShaderColorFunctionTypeSubtractNextMap : EngineTagShaderColorFunctionTypeEnum 
---@class EngineTagShaderColorFunctionTypeBlendCurrentAlpha : EngineTagShaderColorFunctionTypeEnum 
---@class EngineTagShaderColorFunctionTypeBlendCurrentAlphaInverse : EngineTagShaderColorFunctionTypeEnum 
---@class EngineTagShaderColorFunctionTypeBlendNextMapAlpha : EngineTagShaderColorFunctionTypeEnum 
---@class EngineTagShaderColorFunctionTypeBlendNextMapAlphaInverse : EngineTagShaderColorFunctionTypeEnum 

---@alias EngineTagShaderColorFunctionType 
---| EngineTagShaderColorFunctionTypeCurrent
---| EngineTagShaderColorFunctionTypeNextMap
---| EngineTagShaderColorFunctionTypeMultiply
---| EngineTagShaderColorFunctionTypeDoubleMultiply
---| EngineTagShaderColorFunctionTypeAdd
---| EngineTagShaderColorFunctionTypeAddSignedCurrent
---| EngineTagShaderColorFunctionTypeAddSignedNextMap
---| EngineTagShaderColorFunctionTypeSubtractCurrent
---| EngineTagShaderColorFunctionTypeSubtractNextMap
---| EngineTagShaderColorFunctionTypeBlendCurrentAlpha
---| EngineTagShaderColorFunctionTypeBlendCurrentAlphaInverse
---| EngineTagShaderColorFunctionTypeBlendNextMapAlpha
---| EngineTagShaderColorFunctionTypeBlendNextMapAlphaInverse

---@class EngineTagShaderColorFunctionTypeTable 
---@field peCurrent EngineTagShaderColorFunctionTypeCurrent
---@field peNextMap EngineTagShaderColorFunctionTypeNextMap
---@field peMultiply EngineTagShaderColorFunctionTypeMultiply
---@field peDoubleMultiply EngineTagShaderColorFunctionTypeDoubleMultiply
---@field peAdd EngineTagShaderColorFunctionTypeAdd
---@field peAddSignedCurrent EngineTagShaderColorFunctionTypeAddSignedCurrent
---@field peAddSignedNextMap EngineTagShaderColorFunctionTypeAddSignedNextMap
---@field peSubtractCurrent EngineTagShaderColorFunctionTypeSubtractCurrent
---@field peSubtractNextMap EngineTagShaderColorFunctionTypeSubtractNextMap
---@field peBlendCurrentAlpha EngineTagShaderColorFunctionTypeBlendCurrentAlpha
---@field peBlendCurrentAlphaInverse EngineTagShaderColorFunctionTypeBlendCurrentAlphaInverse
---@field peBlendNextMapAlpha EngineTagShaderColorFunctionTypeBlendNextMapAlpha
---@field peBlendNextMapAlphaInverse EngineTagShaderColorFunctionTypeBlendNextMapAlphaInverse
Engine.tag.shaderColorFunctionType = {} 

---@class EngineTagShaderFirstMapTypeEnum : Enum 

---@class EngineTagShaderFirstMapType2dMap : EngineTagShaderFirstMapTypeEnum 
---@class EngineTagShaderFirstMapTypeFirstMapIsReflectionCubeMap : EngineTagShaderFirstMapTypeEnum 
---@class EngineTagShaderFirstMapTypeFirstMapIsObjectCenteredCubeMap : EngineTagShaderFirstMapTypeEnum 
---@class EngineTagShaderFirstMapTypeFirstMapIsViewerCenteredCubeMap : EngineTagShaderFirstMapTypeEnum 

---@alias EngineTagShaderFirstMapType 
---| EngineTagShaderFirstMapType2dMap
---| EngineTagShaderFirstMapTypeFirstMapIsReflectionCubeMap
---| EngineTagShaderFirstMapTypeFirstMapIsObjectCenteredCubeMap
---| EngineTagShaderFirstMapTypeFirstMapIsViewerCenteredCubeMap

---@class EngineTagShaderFirstMapTypeTable 
---@field pe2dMap EngineTagShaderFirstMapType2dMap
---@field peFirstMapIsReflectionCubeMap EngineTagShaderFirstMapTypeFirstMapIsReflectionCubeMap
---@field peFirstMapIsObjectCenteredCubeMap EngineTagShaderFirstMapTypeFirstMapIsObjectCenteredCubeMap
---@field peFirstMapIsViewerCenteredCubeMap EngineTagShaderFirstMapTypeFirstMapIsViewerCenteredCubeMap
Engine.tag.shaderFirstMapType = {} 

---@class EngineTagShaderTypeEnum : Enum 

---@class EngineTagShaderTypeUnused : EngineTagShaderTypeEnum 
---@class EngineTagShaderTypeUnused1 : EngineTagShaderTypeEnum 
---@class EngineTagShaderTypeUnused2 : EngineTagShaderTypeEnum 
---@class EngineTagShaderTypeShaderEnvironment : EngineTagShaderTypeEnum 
---@class EngineTagShaderTypeShaderModel : EngineTagShaderTypeEnum 
---@class EngineTagShaderTypeShaderTransparentGeneric : EngineTagShaderTypeEnum 
---@class EngineTagShaderTypeShaderTransparentChicago : EngineTagShaderTypeEnum 
---@class EngineTagShaderTypeShaderTransparentChicagoExtended : EngineTagShaderTypeEnum 
---@class EngineTagShaderTypeShaderTransparentWater : EngineTagShaderTypeEnum 
---@class EngineTagShaderTypeShaderTransparentGlass : EngineTagShaderTypeEnum 
---@class EngineTagShaderTypeShaderTransparentMeter : EngineTagShaderTypeEnum 
---@class EngineTagShaderTypeShaderTransparentPlasma : EngineTagShaderTypeEnum 

---@alias EngineTagShaderType 
---| EngineTagShaderTypeUnused
---| EngineTagShaderTypeUnused1
---| EngineTagShaderTypeUnused2
---| EngineTagShaderTypeShaderEnvironment
---| EngineTagShaderTypeShaderModel
---| EngineTagShaderTypeShaderTransparentGeneric
---| EngineTagShaderTypeShaderTransparentChicago
---| EngineTagShaderTypeShaderTransparentChicagoExtended
---| EngineTagShaderTypeShaderTransparentWater
---| EngineTagShaderTypeShaderTransparentGlass
---| EngineTagShaderTypeShaderTransparentMeter
---| EngineTagShaderTypeShaderTransparentPlasma

---@class EngineTagShaderTypeTable 
---@field unused EngineTagShaderTypeUnused
---@field unused1 EngineTagShaderTypeUnused1
---@field unused2 EngineTagShaderTypeUnused2
---@field shaderEnvironment EngineTagShaderTypeShaderEnvironment
---@field shaderModel EngineTagShaderTypeShaderModel
---@field shaderTransparentGeneric EngineTagShaderTypeShaderTransparentGeneric
---@field shaderTransparentChicago EngineTagShaderTypeShaderTransparentChicago
---@field shaderTransparentChicagoExtended EngineTagShaderTypeShaderTransparentChicagoExtended
---@field shaderTransparentWater EngineTagShaderTypeShaderTransparentWater
---@field shaderTransparentGlass EngineTagShaderTypeShaderTransparentGlass
---@field shaderTransparentMeter EngineTagShaderTypeShaderTransparentMeter
---@field shaderTransparentPlasma EngineTagShaderTypeShaderTransparentPlasma
Engine.tag.shaderType = {} 

---@class EngineTagShaderDetailFunctionEnum : Enum 

---@class EngineTagShaderDetailFunctionDoubleBiasedMultiply : EngineTagShaderDetailFunctionEnum 
---@class EngineTagShaderDetailFunctionMultiply : EngineTagShaderDetailFunctionEnum 
---@class EngineTagShaderDetailFunctionDoubleBiasedAdd : EngineTagShaderDetailFunctionEnum 

---@alias EngineTagShaderDetailFunction 
---| EngineTagShaderDetailFunctionDoubleBiasedMultiply
---| EngineTagShaderDetailFunctionMultiply
---| EngineTagShaderDetailFunctionDoubleBiasedAdd

---@class EngineTagShaderDetailFunctionTable 
---@field nDoubleBiasedMultiply EngineTagShaderDetailFunctionDoubleBiasedMultiply
---@field nMultiply EngineTagShaderDetailFunctionMultiply
---@field nDoubleBiasedAdd EngineTagShaderDetailFunctionDoubleBiasedAdd
Engine.tag.shaderDetailFunction = {} 

---@class MetaEngineTagDataShaderFlags 
---@field simpleParameterization boolean 
---@field ignoreNormals boolean 
---@field transparentLit boolean 

---@class MetaEngineTagDataShaderPhysicsFlags 
---@field unused boolean 

---@class MetaEngineTagDataShaderTransparentExtraLayer 
---@field shader MetaEngineTagDependency 

---@class MetaEngineTagDataShader 
---@field shaderFlags MetaEngineTagDataShaderFlags 
---@field detailLevel EngineTagDataShaderDetailLevel 
---@field power number 
---@field colorOfEmittedLight MetaEngineColorRGB 
---@field tintColor MetaEngineColorRGB 
---@field physicsFlags MetaEngineTagDataShaderPhysicsFlags 
---@field materialType EngineTagDataMaterialType 
---@field shaderType integer 


