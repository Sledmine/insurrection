---@class EngineTagProjectileResponseEnum : Enum 

---@class EngineTagProjectileResponseDisappear : EngineTagProjectileResponseEnum 
---@class EngineTagProjectileResponseDetonate : EngineTagProjectileResponseEnum 
---@class EngineTagProjectileResponseReflect : EngineTagProjectileResponseEnum 
---@class EngineTagProjectileResponseOverpenetrate : EngineTagProjectileResponseEnum 
---@class EngineTagProjectileResponseAttach : EngineTagProjectileResponseEnum 

---@alias EngineTagProjectileResponse 
---| EngineTagProjectileResponseDisappear
---| EngineTagProjectileResponseDetonate
---| EngineTagProjectileResponseReflect
---| EngineTagProjectileResponseOverpenetrate
---| EngineTagProjectileResponseAttach

---@class EngineTagProjectileResponseTable 
---@field disappear EngineTagProjectileResponseDisappear
---@field detonate EngineTagProjectileResponseDetonate
---@field reflect EngineTagProjectileResponseReflect
---@field overpenetrate EngineTagProjectileResponseOverpenetrate
---@field attach EngineTagProjectileResponseAttach
Engine.tag.projectileResponse = {} 

---@class EngineTagProjectileScaleEffectsByEnum : Enum 

---@class EngineTagProjectileScaleEffectsByDamage : EngineTagProjectileScaleEffectsByEnum 
---@class EngineTagProjectileScaleEffectsByAngle : EngineTagProjectileScaleEffectsByEnum 

---@alias EngineTagProjectileScaleEffectsBy 
---| EngineTagProjectileScaleEffectsByDamage
---| EngineTagProjectileScaleEffectsByAngle

---@class EngineTagProjectileScaleEffectsByTable 
---@field byDamage EngineTagProjectileScaleEffectsByDamage
---@field byAngle EngineTagProjectileScaleEffectsByAngle
Engine.tag.projectileScaleEffectsBy = {} 

---@class EngineTagProjectileDetonationTimerStartsEnum : Enum 

---@class EngineTagProjectileDetonationTimerStartsImmediately : EngineTagProjectileDetonationTimerStartsEnum 
---@class EngineTagProjectileDetonationTimerStartsAfterFirstBounce : EngineTagProjectileDetonationTimerStartsEnum 
---@class EngineTagProjectileDetonationTimerStartsWhenAtRest : EngineTagProjectileDetonationTimerStartsEnum 

---@alias EngineTagProjectileDetonationTimerStarts 
---| EngineTagProjectileDetonationTimerStartsImmediately
---| EngineTagProjectileDetonationTimerStartsAfterFirstBounce
---| EngineTagProjectileDetonationTimerStartsWhenAtRest

---@class EngineTagProjectileDetonationTimerStartsTable 
---@field tsImmediately EngineTagProjectileDetonationTimerStartsImmediately
---@field tsAfterFirstBounce EngineTagProjectileDetonationTimerStartsAfterFirstBounce
---@field tsWhenAtRest EngineTagProjectileDetonationTimerStartsWhenAtRest
Engine.tag.projectileDetonationTimerStarts = {} 

---@class EngineTagProjectileFunctionInEnum : Enum 

---@class EngineTagProjectileFunctionInNone : EngineTagProjectileFunctionInEnum 
---@class EngineTagProjectileFunctionInRangeRemaining : EngineTagProjectileFunctionInEnum 
---@class EngineTagProjectileFunctionInTimeRemaining : EngineTagProjectileFunctionInEnum 
---@class EngineTagProjectileFunctionInTracer : EngineTagProjectileFunctionInEnum 

---@alias EngineTagProjectileFunctionIn 
---| EngineTagProjectileFunctionInNone
---| EngineTagProjectileFunctionInRangeRemaining
---| EngineTagProjectileFunctionInTimeRemaining
---| EngineTagProjectileFunctionInTracer

---@class EngineTagProjectileFunctionInTable 
---@field nNone EngineTagProjectileFunctionInNone
---@field nRangeRemaining EngineTagProjectileFunctionInRangeRemaining
---@field nTimeRemaining EngineTagProjectileFunctionInTimeRemaining
---@field nTracer EngineTagProjectileFunctionInTracer
Engine.tag.projectileFunctionIn = {} 

---@class MetaEngineTagDataProjectileFlags 
---@field orientedAlongVelocity boolean 
---@field aiMustUseBallisticAiming boolean 
---@field detonationMaxTimeIfAttached boolean 
---@field hasSuperCombiningExplosion boolean 
---@field combineInitialVelocityWithParentVelocity boolean 
---@field randomAttachedDetonationTime boolean 
---@field minimumUnattachedDetonationTime boolean 

---@class MetaEngineTagDataProjectileMaterialResponseFlags 
---@field cannotBeOverpenetrated boolean 

---@class MetaEngineTagDataProjectileMaterialResponsePotentialFlags 
---@field onlyAgainstUnits boolean 
---@field neverAgainstUnits boolean 

---@class MetaEngineTagDataProjectileMaterialResponse 
---@field flags MetaEngineTagDataProjectileMaterialResponseFlags 
---@field defaultResponse EngineTagDataProjectileResponse 
---@field defaultEffect MetaEngineTagDependency 
---@field potentialResponse EngineTagDataProjectileResponse 
---@field potentialFlags MetaEngineTagDataProjectileMaterialResponsePotentialFlags 
---@field potentialSkipFraction MetaEngineFraction 
---@field potentialBetween MetaEngineAngle 
---@field potentialAnd number 
---@field potentialEffect MetaEngineTagDependency 
---@field scaleEffectsBy EngineTagDataProjectileScaleEffectsBy 
---@field angularNoise MetaEngineAngle 
---@field velocityNoise number 
---@field detonationEffect MetaEngineTagDependency 
---@field initialFriction number 
---@field maximumDistance number 
---@field parallelFriction number 
---@field perpendicularFriction number 

---@class MetaEngineTagDataProjectile: MetaEngineTagDataObject  
---@field projectileFlags MetaEngineTagDataProjectileFlags 
---@field detonationTimerStarts EngineTagDataProjectileDetonationTimerStarts 
---@field impactNoise EngineTagDataObjectNoise 
---@field projectileAIn EngineTagDataProjectileFunctionIn 
---@field projectileBIn EngineTagDataProjectileFunctionIn 
---@field projectileCIn EngineTagDataProjectileFunctionIn 
---@field projectileDIn EngineTagDataProjectileFunctionIn 
---@field superDetonation MetaEngineTagDependency 
---@field aiPerceptionRadius number 
---@field collisionRadius number 
---@field armingTime number 
---@field dangerRadius number 
---@field effect MetaEngineTagDependency 
---@field timer number 
---@field minimumVelocity number 
---@field maximumRange number 
---@field airGravityScale number 
---@field airDamageRange number 
---@field waterGravityScale number 
---@field waterDamageRange number 
---@field initialVelocity number 
---@field finalVelocity number 
---@field guidedAngularVelocity MetaEngineAngle 
---@field detonationNoise EngineTagDataObjectNoise 
---@field detonationStarted MetaEngineTagDependency 
---@field flybySound MetaEngineTagDependency 
---@field attachedDetonationDamage MetaEngineTagDependency 
---@field impactDamage MetaEngineTagDependency 
---@field projectileMaterialResponse TagBlock<MetaEngineTagDataProjectileMaterialResponse> 


