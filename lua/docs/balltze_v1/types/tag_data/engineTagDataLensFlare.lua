---@class EngineTagLensFlareRadiusScaledByEnum : Enum 

---@class EngineTagLensFlareRadiusScaledByNone : EngineTagLensFlareRadiusScaledByEnum 
---@class EngineTagLensFlareRadiusScaledByRotation : EngineTagLensFlareRadiusScaledByEnum 
---@class EngineTagLensFlareRadiusScaledByRotationAndStrafing : EngineTagLensFlareRadiusScaledByEnum 
---@class EngineTagLensFlareRadiusScaledByDistanceFromCenter : EngineTagLensFlareRadiusScaledByEnum 

---@alias EngineTagLensFlareRadiusScaledBy 
---| EngineTagLensFlareRadiusScaledByNone
---| EngineTagLensFlareRadiusScaledByRotation
---| EngineTagLensFlareRadiusScaledByRotationAndStrafing
---| EngineTagLensFlareRadiusScaledByDistanceFromCenter

---@class EngineTagLensFlareRadiusScaledByTable 
---@field byNone EngineTagLensFlareRadiusScaledByNone
---@field byRotation EngineTagLensFlareRadiusScaledByRotation
---@field byRotationAndStrafing EngineTagLensFlareRadiusScaledByRotationAndStrafing
---@field byDistanceFromCenter EngineTagLensFlareRadiusScaledByDistanceFromCenter
Engine.tag.lensFlareRadiusScaledBy = {} 

---@class EngineTagLensFlareOcclusionOffsetDirectionEnum : Enum 

---@class EngineTagLensFlareOcclusionOffsetDirectionTowardViewer : EngineTagLensFlareOcclusionOffsetDirectionEnum 
---@class EngineTagLensFlareOcclusionOffsetDirectionMarkerForward : EngineTagLensFlareOcclusionOffsetDirectionEnum 
---@class EngineTagLensFlareOcclusionOffsetDirectionNone : EngineTagLensFlareOcclusionOffsetDirectionEnum 

---@alias EngineTagLensFlareOcclusionOffsetDirection 
---| EngineTagLensFlareOcclusionOffsetDirectionTowardViewer
---| EngineTagLensFlareOcclusionOffsetDirectionMarkerForward
---| EngineTagLensFlareOcclusionOffsetDirectionNone

---@class EngineTagLensFlareOcclusionOffsetDirectionTable 
---@field ionTowardViewer EngineTagLensFlareOcclusionOffsetDirectionTowardViewer
---@field ionMarkerForward EngineTagLensFlareOcclusionOffsetDirectionMarkerForward
---@field ionNone EngineTagLensFlareOcclusionOffsetDirectionNone
Engine.tag.lensFlareOcclusionOffsetDirection = {} 

---@class EngineTagLensFlareRotationFunctionEnum : Enum 

---@class EngineTagLensFlareRotationFunctionNone : EngineTagLensFlareRotationFunctionEnum 
---@class EngineTagLensFlareRotationFunctionRotationA : EngineTagLensFlareRotationFunctionEnum 
---@class EngineTagLensFlareRotationFunctionRotationB : EngineTagLensFlareRotationFunctionEnum 
---@class EngineTagLensFlareRotationFunctionRotationTranslation : EngineTagLensFlareRotationFunctionEnum 
---@class EngineTagLensFlareRotationFunctionTranslation : EngineTagLensFlareRotationFunctionEnum 

---@alias EngineTagLensFlareRotationFunction 
---| EngineTagLensFlareRotationFunctionNone
---| EngineTagLensFlareRotationFunctionRotationA
---| EngineTagLensFlareRotationFunctionRotationB
---| EngineTagLensFlareRotationFunctionRotationTranslation
---| EngineTagLensFlareRotationFunctionTranslation

---@class EngineTagLensFlareRotationFunctionTable 
---@field onNone EngineTagLensFlareRotationFunctionNone
---@field onRotationA EngineTagLensFlareRotationFunctionRotationA
---@field onRotationB EngineTagLensFlareRotationFunctionRotationB
---@field onRotationTranslation EngineTagLensFlareRotationFunctionRotationTranslation
---@field onTranslation EngineTagLensFlareRotationFunctionTranslation
Engine.tag.lensFlareRotationFunction = {} 

---@class MetaEngineTagDataLensFlareReflectionFlags 
---@field alignRotationWithScreenCenter boolean 
---@field radiusNotScaledByDistance boolean 
---@field radiusScaledByOcclusionFactor boolean 
---@field occludedBySolidObjects boolean 

---@class MetaEngineTagDataLensFlareReflectionMoreFlags 
---@field interpolateColorsInHsv boolean 
---@field moreColors boolean 

---@class MetaEngineTagDataLensFlareFlags 
---@field sun boolean 
---@field noOcclusionTest boolean 
---@field onlyRenderInFirstPerson boolean 
---@field onlyRenderInThirdPerson boolean 
---@field fadeInMoreQuickly boolean 
---@field fadeOutMoreQuickly boolean 
---@field scaleByMarker boolean 

---@class MetaEngineTagDataLensFlareReflection 
---@field flags MetaEngineTagDataLensFlareReflectionFlags 
---@field bitmapIndex MetaEngineIndex 
---@field position number 
---@field rotationOffset number 
---@field radius number 
---@field radiusScaledBy EngineTagDataLensFlareRadiusScaledBy 
---@field brightness MetaEngineFraction 
---@field brightnessScaledBy EngineTagDataLensFlareRadiusScaledBy 
---@field tintColor MetaEngineColorARGB 
---@field colorLowerBound MetaEngineColorARGB 
---@field colorUpperBound MetaEngineColorARGB 
---@field moreFlags MetaEngineTagDataLensFlareReflectionMoreFlags 
---@field animationFunction EngineTagDataWaveFunction 
---@field animationPeriod number 
---@field animationPhase number 

---@class MetaEngineTagDataLensFlare 
---@field falloffAngle MetaEngineAngle 
---@field cutoffAngle MetaEngineAngle 
---@field cosFalloffAngle number 
---@field cosCutoffAngle number 
---@field occlusionRadius number 
---@field occlusionOffsetDirection EngineTagDataLensFlareOcclusionOffsetDirection 
---@field nearFadeDistance number 
---@field farFadeDistance number 
---@field bitmap MetaEngineTagDependency 
---@field flags MetaEngineTagDataLensFlareFlags 
---@field rotationFunction EngineTagDataLensFlareRotationFunction 
---@field rotationFunctionScale MetaEngineAngle 
---@field horizontalScale number 
---@field verticalScale number 
---@field reflections TagBlock<MetaEngineTagDataLensFlareReflection> 


