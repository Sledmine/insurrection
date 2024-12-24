---@class EngineTagParticleOrientationEnum : Enum 

---@class EngineTagParticleOrientationScreenFacing : EngineTagParticleOrientationEnum 
---@class EngineTagParticleOrientationParallelToDirection : EngineTagParticleOrientationEnum 
---@class EngineTagParticleOrientationPerpendicularToDirection : EngineTagParticleOrientationEnum 

---@alias EngineTagParticleOrientation 
---| EngineTagParticleOrientationScreenFacing
---| EngineTagParticleOrientationParallelToDirection
---| EngineTagParticleOrientationPerpendicularToDirection

---@class EngineTagParticleOrientationTable 
---@field screenFacing EngineTagParticleOrientationScreenFacing
---@field parallelToDirection EngineTagParticleOrientationParallelToDirection
---@field perpendicularToDirection EngineTagParticleOrientationPerpendicularToDirection
Engine.tag.particleOrientation = {} 

---@class EngineTagParticleAnchorEnum : Enum 

---@class EngineTagParticleAnchorWithPrimary : EngineTagParticleAnchorEnum 
---@class EngineTagParticleAnchorWithScreenSpace : EngineTagParticleAnchorEnum 
---@class EngineTagParticleAnchorZsprite : EngineTagParticleAnchorEnum 

---@alias EngineTagParticleAnchor 
---| EngineTagParticleAnchorWithPrimary
---| EngineTagParticleAnchorWithScreenSpace
---| EngineTagParticleAnchorZsprite

---@class EngineTagParticleAnchorTable 
---@field withPrimary EngineTagParticleAnchorWithPrimary
---@field withScreenSpace EngineTagParticleAnchorWithScreenSpace
---@field zsprite EngineTagParticleAnchorZsprite
Engine.tag.particleAnchor = {} 

---@class MetaEngineTagDataParticleFlags 
---@field canAnimateBackwards boolean 
---@field animationStopsAtRest boolean 
---@field animationStartsOnRandomFrame boolean 
---@field animateOncePerFrame boolean 
---@field diesAtRest boolean 
---@field diesOnContactWithStructure boolean 
---@field tintFromDiffuseTexture boolean 
---@field diesOnContactWithWater boolean 
---@field diesOnContactWithAir boolean 
---@field selfIlluminated boolean 
---@field randomHorizontalMirroring boolean 
---@field randomVerticalMirroring boolean 

---@class MetaEngineTagDataParticleShaderFlags 
---@field sortBias boolean 
---@field nonlinearTint boolean 
---@field dontOverdrawFpWeapon boolean 

---@class MetaEngineTagDataParticle 
---@field flags MetaEngineTagDataParticleFlags 
---@field bitmap MetaEngineTagDependency 
---@field physics MetaEngineTagDependency 
---@field sirMartyExchangedHisChildrenForThine MetaEngineTagDependency 
---@field lifespan number 
---@field fadeInTime number 
---@field fadeOutTime number 
---@field collisionEffect MetaEngineTagDependency 
---@field deathEffect MetaEngineTagDependency 
---@field minimumSize number 
---@field radiusAnimation number 
---@field animationRate number 
---@field contactDeterioration number 
---@field fadeStartSize number 
---@field fadeEndSize number 
---@field firstSequenceIndex MetaEngineIndex 
---@field initialSequenceCount integer 
---@field loopingSequenceCount integer 
---@field finalSequenceCount integer 
---@field spriteSize number 
---@field orientation EngineTagDataParticleOrientation 
---@field makeItActuallyWork integer 
---@field shaderFlags MetaEngineTagDataParticleShaderFlags 
---@field framebufferBlendFunction EngineTagDataFramebufferBlendFunction 
---@field framebufferFadeMode EngineTagDataFramebufferFadeMode 
---@field mapFlags MetaEngineTagDataIsUnfilteredFlag 
---@field secondaryBitmap MetaEngineTagDependency 
---@field anchor EngineTagDataParticleAnchor 
---@field secondaryMapFlags MetaEngineTagDataIsUnfilteredFlag 
---@field uAnimationSource EngineTagDataFunctionOut 
---@field uAnimationFunction EngineTagDataWaveFunction 
---@field uAnimationPeriod number 
---@field uAnimationPhase number 
---@field uAnimationScale number 
---@field vAnimationSource EngineTagDataFunctionOut 
---@field vAnimationFunction EngineTagDataWaveFunction 
---@field vAnimationPeriod number 
---@field vAnimationPhase number 
---@field vAnimationScale number 
---@field rotationAnimationSource EngineTagDataFunctionOut 
---@field rotationAnimationFunction EngineTagDataWaveFunction 
---@field rotationAnimationPeriod number 
---@field rotationAnimationPhase number 
---@field rotationAnimationScale number 
---@field rotationAnimationCenter MetaEnginePoint2D 
---@field zspriteRadiusScale number 


