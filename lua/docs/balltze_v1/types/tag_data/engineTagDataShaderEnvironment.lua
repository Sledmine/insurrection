---@class EngineTagShaderEnvironmentTypeEnum : Enum 

---@class EngineTagShaderEnvironmentTypeNormal : EngineTagShaderEnvironmentTypeEnum 
---@class EngineTagShaderEnvironmentTypeBlended : EngineTagShaderEnvironmentTypeEnum 
---@class EngineTagShaderEnvironmentTypeBlendedBaseSpecular : EngineTagShaderEnvironmentTypeEnum 

---@alias EngineTagShaderEnvironmentType 
---| EngineTagShaderEnvironmentTypeNormal
---| EngineTagShaderEnvironmentTypeBlended
---| EngineTagShaderEnvironmentTypeBlendedBaseSpecular

---@class EngineTagShaderEnvironmentTypeTable 
---@field eNormal EngineTagShaderEnvironmentTypeNormal
---@field eBlended EngineTagShaderEnvironmentTypeBlended
---@field eBlendedBaseSpecular EngineTagShaderEnvironmentTypeBlendedBaseSpecular
Engine.tag.shaderEnvironmentType = {} 

---@class EngineTagShaderEnvironmentReflectionTypeEnum : Enum 

---@class EngineTagShaderEnvironmentReflectionTypeBumpedCubeMap : EngineTagShaderEnvironmentReflectionTypeEnum 
---@class EngineTagShaderEnvironmentReflectionTypeFlatCubeMap : EngineTagShaderEnvironmentReflectionTypeEnum 
---@class EngineTagShaderEnvironmentReflectionTypeBumpedRadiosity : EngineTagShaderEnvironmentReflectionTypeEnum 

---@alias EngineTagShaderEnvironmentReflectionType 
---| EngineTagShaderEnvironmentReflectionTypeBumpedCubeMap
---| EngineTagShaderEnvironmentReflectionTypeFlatCubeMap
---| EngineTagShaderEnvironmentReflectionTypeBumpedRadiosity

---@class EngineTagShaderEnvironmentReflectionTypeTable 
---@field peBumpedCubeMap EngineTagShaderEnvironmentReflectionTypeBumpedCubeMap
---@field peFlatCubeMap EngineTagShaderEnvironmentReflectionTypeFlatCubeMap
---@field peBumpedRadiosity EngineTagShaderEnvironmentReflectionTypeBumpedRadiosity
Engine.tag.shaderEnvironmentReflectionType = {} 

---@class MetaEngineTagDataShaderEnvironmentFlags 
---@field alphaTested boolean 
---@field bumpMapIsSpecularMask boolean 
---@field trueAtmosphericFog boolean 

---@class MetaEngineTagDataShaderEnvironmentDiffuseFlags 
---@field rescaleDetailMaps boolean 
---@field rescaleBumpMap boolean 

---@class MetaEngineTagDataShaderEnvironmentSpecularFlags 
---@field overbright boolean 
---@field extraShiny boolean 
---@field lightmapIsSpecular boolean 

---@class MetaEngineTagDataShaderEnvironmentReflectionFlags 
---@field dynamicMirror boolean 

---@class MetaEngineTagDataShaderEnvironment: MetaEngineTagDataShader  
---@field shaderEnvironmentFlags MetaEngineTagDataShaderEnvironmentFlags 
---@field shaderEnvironmentType EngineTagDataShaderEnvironmentType 
---@field lensFlareSpacing number 
---@field lensFlare MetaEngineTagDependency 
---@field diffuseFlags MetaEngineTagDataShaderEnvironmentDiffuseFlags 
---@field baseMap MetaEngineTagDependency 
---@field detailMapFunction EngineTagDataShaderDetailFunction 
---@field primaryDetailMapScale number 
---@field primaryDetailMap MetaEngineTagDependency 
---@field secondaryDetailMapScale number 
---@field secondaryDetailMap MetaEngineTagDependency 
---@field microDetailMapFunction EngineTagDataShaderDetailFunction 
---@field microDetailMapScale number 
---@field microDetailMap MetaEngineTagDependency 
---@field materialColor MetaEngineColorRGB 
---@field bumpMapScale number 
---@field bumpMap MetaEngineTagDependency 
---@field bumpMapScaleXy MetaEnginePoint2D 
---@field uAnimationFunction EngineTagDataWaveFunction 
---@field uAnimationPeriod number 
---@field uAnimationScale number 
---@field vAnimationFunction EngineTagDataWaveFunction 
---@field vAnimationPeriod number 
---@field vAnimationScale number 
---@field selfIlluminationFlags MetaEngineTagDataIsUnfilteredFlag 
---@field primaryOnColor MetaEngineColorRGB 
---@field primaryOffColor MetaEngineColorRGB 
---@field primaryAnimationFunction EngineTagDataWaveFunction 
---@field primaryAnimationPeriod number 
---@field primaryAnimationPhase number 
---@field secondaryOnColor MetaEngineColorRGB 
---@field secondaryOffColor MetaEngineColorRGB 
---@field secondaryAnimationFunction EngineTagDataWaveFunction 
---@field secondaryAnimationPeriod number 
---@field secondaryAnimationPhase number 
---@field plasmaOnColor MetaEngineColorRGB 
---@field plasmaOffColor MetaEngineColorRGB 
---@field plasmaAnimationFunction EngineTagDataWaveFunction 
---@field plasmaAnimationPeriod number 
---@field plasmaAnimationPhase number 
---@field mapScale number 
---@field map MetaEngineTagDependency 
---@field specularFlags MetaEngineTagDataShaderEnvironmentSpecularFlags 
---@field brightness MetaEngineFraction 
---@field perpendicularColor MetaEngineColorRGB 
---@field parallelColor MetaEngineColorRGB 
---@field reflectionFlags MetaEngineTagDataShaderEnvironmentReflectionFlags 
---@field reflectionType EngineTagDataShaderEnvironmentReflectionType 
---@field lightmapBrightnessScale MetaEngineFraction 
---@field perpendicularBrightness MetaEngineFraction 
---@field parallelBrightness MetaEngineFraction 
---@field reflectionCubeMap MetaEngineTagDependency 


