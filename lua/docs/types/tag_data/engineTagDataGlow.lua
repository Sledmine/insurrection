---@class EngineTagGlowBoundaryEffectEnum : Enum 

---@class EngineTagGlowBoundaryEffectBounce : EngineTagGlowBoundaryEffectEnum 
---@class EngineTagGlowBoundaryEffectWrap : EngineTagGlowBoundaryEffectEnum 

---@alias EngineTagGlowBoundaryEffect 
---| EngineTagGlowBoundaryEffectBounce
---| EngineTagGlowBoundaryEffectWrap

---@class EngineTagGlowBoundaryEffectTable 
---@field tBounce EngineTagGlowBoundaryEffectBounce
---@field tWrap EngineTagGlowBoundaryEffectWrap
Engine.tag.glowBoundaryEffect = {} 

---@class EngineTagGlowNormalParticleDistributionEnum : Enum 

---@class EngineTagGlowNormalParticleDistributionDistributedRandomly : EngineTagGlowNormalParticleDistributionEnum 
---@class EngineTagGlowNormalParticleDistributionDistributedUniformly : EngineTagGlowNormalParticleDistributionEnum 

---@alias EngineTagGlowNormalParticleDistribution 
---| EngineTagGlowNormalParticleDistributionDistributedRandomly
---| EngineTagGlowNormalParticleDistributionDistributedUniformly

---@class EngineTagGlowNormalParticleDistributionTable 
---@field onDistributedRandomly EngineTagGlowNormalParticleDistributionDistributedRandomly
---@field onDistributedUniformly EngineTagGlowNormalParticleDistributionDistributedUniformly
Engine.tag.glowNormalParticleDistribution = {} 

---@class EngineTagGlowTrailingParticleDistributionEnum : Enum 

---@class EngineTagGlowTrailingParticleDistributionEmitVertically : EngineTagGlowTrailingParticleDistributionEnum 
---@class EngineTagGlowTrailingParticleDistributionEmitNormalUp : EngineTagGlowTrailingParticleDistributionEnum 
---@class EngineTagGlowTrailingParticleDistributionEmitRandomly : EngineTagGlowTrailingParticleDistributionEnum 

---@alias EngineTagGlowTrailingParticleDistribution 
---| EngineTagGlowTrailingParticleDistributionEmitVertically
---| EngineTagGlowTrailingParticleDistributionEmitNormalUp
---| EngineTagGlowTrailingParticleDistributionEmitRandomly

---@class EngineTagGlowTrailingParticleDistributionTable 
---@field onEmitVertically EngineTagGlowTrailingParticleDistributionEmitVertically
---@field onEmitNormalUp EngineTagGlowTrailingParticleDistributionEmitNormalUp
---@field onEmitRandomly EngineTagGlowTrailingParticleDistributionEmitRandomly
Engine.tag.glowTrailingParticleDistribution = {} 

---@class MetaEngineTagDataGlowFlags 
---@field modifyParticleColorInRange boolean 
---@field particlesMoveBackwards boolean 
---@field particesMoveInBothDirections boolean 
---@field trailingParticlesFadeOverTime boolean 
---@field trailingParticlesShrinkOverTime boolean 
---@field trailingParticlesSlowOverTime boolean 

---@class MetaEngineTagDataGlow 
---@field attachmentMarker MetaEngineTagString 
---@field numberOfParticles integer 
---@field boundaryEffect EngineTagDataGlowBoundaryEffect 
---@field normalParticleDistribution EngineTagDataGlowNormalParticleDistribution 
---@field trailingParticleDistribution EngineTagDataGlowTrailingParticleDistribution 
---@field glowFlags MetaEngineTagDataGlowFlags 
---@field attachment0 EngineTagDataFunctionOut 
---@field particleRotationalVelocity number 
---@field particleRotVelMulLow number 
---@field particleRotVelMulHigh number 
---@field attachment1 EngineTagDataFunctionOut 
---@field effectRotationalVelocity number 
---@field effectRotVelMulLow number 
---@field effectRotVelMulHigh number 
---@field attachment2 EngineTagDataFunctionOut 
---@field effectTranslationalVelocity number 
---@field effectTransVelMulLow number 
---@field effectTransVelMulHigh number 
---@field attachment3 EngineTagDataFunctionOut 
---@field minDistanceParticleToObject number 
---@field maxDistanceParticleToObject number 
---@field distanceToObjectMulLow number 
---@field distanceToObjectMulHigh number 
---@field attachment4 EngineTagDataFunctionOut 
---@field particleSizeBounds number 
---@field sizeAttachmentMultiplier number 
---@field attachment5 EngineTagDataFunctionOut 
---@field colorBound0 MetaEngineColorARGB 
---@field colorBound1 MetaEngineColorARGB 
---@field scaleColor0 MetaEngineColorARGB 
---@field scaleColor1 MetaEngineColorARGB 
---@field colorRateOfChange number 
---@field fadingPercentageOfGlow number 
---@field particleGenerationFreq number 
---@field lifetimeOfTrailingParticles number 
---@field velocityOfTrailingParticles number 
---@field trailingParticleMinimumT number 
---@field trailingParticleMaximumT number 
---@field texture MetaEngineTagDependency 


