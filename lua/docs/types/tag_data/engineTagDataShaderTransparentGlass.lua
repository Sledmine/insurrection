---@class EngineTagShaderTransparentGlassReflectionTypeEnum : Enum 

---@class EngineTagShaderTransparentGlassReflectionTypeBumpedCubeMap : EngineTagShaderTransparentGlassReflectionTypeEnum 
---@class EngineTagShaderTransparentGlassReflectionTypeFlatCubeMap : EngineTagShaderTransparentGlassReflectionTypeEnum 
---@class EngineTagShaderTransparentGlassReflectionTypeDynamicMirror : EngineTagShaderTransparentGlassReflectionTypeEnum 

---@alias EngineTagShaderTransparentGlassReflectionType 
---| EngineTagShaderTransparentGlassReflectionTypeBumpedCubeMap
---| EngineTagShaderTransparentGlassReflectionTypeFlatCubeMap
---| EngineTagShaderTransparentGlassReflectionTypeDynamicMirror

---@class EngineTagShaderTransparentGlassReflectionTypeTable 
---@field ypeBumpedCubeMap EngineTagShaderTransparentGlassReflectionTypeBumpedCubeMap
---@field ypeFlatCubeMap EngineTagShaderTransparentGlassReflectionTypeFlatCubeMap
---@field ypeDynamicMirror EngineTagShaderTransparentGlassReflectionTypeDynamicMirror
Engine.tag.shaderTransparentGlassReflectionType = {} 

---@class MetaEngineTagDataShaderTransparentGlassFlags 
---@field alphaTested boolean 
---@field decal boolean 
---@field twoSided boolean 
---@field bumpMapIsSpecularMask boolean 

---@class MetaEngineTagDataShaderTransparentGlass: MetaEngineTagDataShader  
---@field shaderTransparentGlassFlags MetaEngineTagDataShaderTransparentGlassFlags 
---@field backgroundTintColor MetaEngineColorRGB 
---@field backgroundTintMapScale number 
---@field backgroundTintMap MetaEngineTagDependency 
---@field reflectionType EngineTagDataShaderTransparentGlassReflectionType 
---@field perpendicularBrightness MetaEngineFraction 
---@field perpendicularTintColor MetaEngineColorRGB 
---@field parallelBrightness MetaEngineFraction 
---@field parallelTintColor MetaEngineColorRGB 
---@field reflectionMap MetaEngineTagDependency 
---@field bumpMapScale number 
---@field bumpMap MetaEngineTagDependency 
---@field diffuseMapScale number 
---@field diffuseMap MetaEngineTagDependency 
---@field diffuseDetailMapScale number 
---@field diffuseDetailMap MetaEngineTagDependency 
---@field specularMapScale number 
---@field specularMap MetaEngineTagDependency 
---@field specularDetailMapScale number 
---@field specularDetailMap MetaEngineTagDependency 


