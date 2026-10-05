---@class EngineTagActorVariantMovementTypeEnum : Enum 

---@class EngineTagActorVariantMovementTypeAlwaysRun : EngineTagActorVariantMovementTypeEnum 
---@class EngineTagActorVariantMovementTypeAlwaysCrouch : EngineTagActorVariantMovementTypeEnum 
---@class EngineTagActorVariantMovementTypeSwitchTypes : EngineTagActorVariantMovementTypeEnum 

---@alias EngineTagActorVariantMovementType 
---| EngineTagActorVariantMovementTypeAlwaysRun
---| EngineTagActorVariantMovementTypeAlwaysCrouch
---| EngineTagActorVariantMovementTypeSwitchTypes

---@class EngineTagActorVariantMovementTypeTable 
---@field peAlwaysRun EngineTagActorVariantMovementTypeAlwaysRun
---@field peAlwaysCrouch EngineTagActorVariantMovementTypeAlwaysCrouch
---@field peSwitchTypes EngineTagActorVariantMovementTypeSwitchTypes
Engine.tag.actorVariantMovementType = {} 

---@class EngineTagActorVariantSpecialFireModeEnum : Enum 

---@class EngineTagActorVariantSpecialFireModeNone : EngineTagActorVariantSpecialFireModeEnum 
---@class EngineTagActorVariantSpecialFireModeOvercharge : EngineTagActorVariantSpecialFireModeEnum 
---@class EngineTagActorVariantSpecialFireModeSecondaryTrigger : EngineTagActorVariantSpecialFireModeEnum 

---@alias EngineTagActorVariantSpecialFireMode 
---| EngineTagActorVariantSpecialFireModeNone
---| EngineTagActorVariantSpecialFireModeOvercharge
---| EngineTagActorVariantSpecialFireModeSecondaryTrigger

---@class EngineTagActorVariantSpecialFireModeTable 
---@field odeNone EngineTagActorVariantSpecialFireModeNone
---@field odeOvercharge EngineTagActorVariantSpecialFireModeOvercharge
---@field odeSecondaryTrigger EngineTagActorVariantSpecialFireModeSecondaryTrigger
Engine.tag.actorVariantSpecialFireMode = {} 

---@class EngineTagActorVariantSpecialFireSituationEnum : Enum 

---@class EngineTagActorVariantSpecialFireSituationNever : EngineTagActorVariantSpecialFireSituationEnum 
---@class EngineTagActorVariantSpecialFireSituationEnemyVisible : EngineTagActorVariantSpecialFireSituationEnum 
---@class EngineTagActorVariantSpecialFireSituationEnemyOutOfSight : EngineTagActorVariantSpecialFireSituationEnum 
---@class EngineTagActorVariantSpecialFireSituationStrafing : EngineTagActorVariantSpecialFireSituationEnum 

---@alias EngineTagActorVariantSpecialFireSituation 
---| EngineTagActorVariantSpecialFireSituationNever
---| EngineTagActorVariantSpecialFireSituationEnemyVisible
---| EngineTagActorVariantSpecialFireSituationEnemyOutOfSight
---| EngineTagActorVariantSpecialFireSituationStrafing

---@class EngineTagActorVariantSpecialFireSituationTable 
---@field ionNever EngineTagActorVariantSpecialFireSituationNever
---@field ionEnemyVisible EngineTagActorVariantSpecialFireSituationEnemyVisible
---@field ionEnemyOutOfSight EngineTagActorVariantSpecialFireSituationEnemyOutOfSight
---@field ionStrafing EngineTagActorVariantSpecialFireSituationStrafing
Engine.tag.actorVariantSpecialFireSituation = {} 

---@class EngineTagActorVariantTrajectoryTypeEnum : Enum 

---@class EngineTagActorVariantTrajectoryTypeToss : EngineTagActorVariantTrajectoryTypeEnum 
---@class EngineTagActorVariantTrajectoryTypeLob : EngineTagActorVariantTrajectoryTypeEnum 
---@class EngineTagActorVariantTrajectoryTypeBounce : EngineTagActorVariantTrajectoryTypeEnum 

---@alias EngineTagActorVariantTrajectoryType 
---| EngineTagActorVariantTrajectoryTypeToss
---| EngineTagActorVariantTrajectoryTypeLob
---| EngineTagActorVariantTrajectoryTypeBounce

---@class EngineTagActorVariantTrajectoryTypeTable 
---@field peToss EngineTagActorVariantTrajectoryTypeToss
---@field peLob EngineTagActorVariantTrajectoryTypeLob
---@field peBounce EngineTagActorVariantTrajectoryTypeBounce
Engine.tag.actorVariantTrajectoryType = {} 

---@class EngineTagActorVariantGrenadeStimulusEnum : Enum 

---@class EngineTagActorVariantGrenadeStimulusNever : EngineTagActorVariantGrenadeStimulusEnum 
---@class EngineTagActorVariantGrenadeStimulusVisibleTarget : EngineTagActorVariantGrenadeStimulusEnum 
---@class EngineTagActorVariantGrenadeStimulusSeekCover : EngineTagActorVariantGrenadeStimulusEnum 

---@alias EngineTagActorVariantGrenadeStimulus 
---| EngineTagActorVariantGrenadeStimulusNever
---| EngineTagActorVariantGrenadeStimulusVisibleTarget
---| EngineTagActorVariantGrenadeStimulusSeekCover

---@class EngineTagActorVariantGrenadeStimulusTable 
---@field usNever EngineTagActorVariantGrenadeStimulusNever
---@field usVisibleTarget EngineTagActorVariantGrenadeStimulusVisibleTarget
---@field usSeekCover EngineTagActorVariantGrenadeStimulusSeekCover
Engine.tag.actorVariantGrenadeStimulus = {} 

---@class MetaEngineTagDataActorVariantFlags 
---@field canShootWhileFlying boolean 
---@field interpolateColorInHsv boolean 
---@field hasUnlimitedGrenades boolean 
---@field movementSwitchingTryToStayWithFriends boolean 
---@field activeCamouflage boolean 
---@field superActiveCamouflage boolean 
---@field cannotUseRangedWeapons boolean 
---@field preferPassengerSeat boolean 

---@class MetaEngineTagDataActorVariantChangeColors 
---@field colorLowerBound MetaEngineColorRGB 
---@field colorUpperBound MetaEngineColorRGB 

---@class MetaEngineTagDataActorVariant 
---@field flags MetaEngineTagDataActorVariantFlags 
---@field actorDefinition MetaEngineTagDependency 
---@field unit MetaEngineTagDependency 
---@field majorVariant MetaEngineTagDependency 
---@field metagameType EngineTagDataMetagameType 
---@field metagameClass EngineTagDataMetagameClass 
---@field movementType EngineTagDataActorVariantMovementType 
---@field initialCrouchChance number 
---@field crouchTime number 
---@field runTime number 
---@field weapon MetaEngineTagDependency 
---@field maximumFiringDistance number 
---@field rateOfFire number 
---@field projectileError MetaEngineAngle 
---@field firstBurstDelayTime number 
---@field newTargetFiringPatternTime number 
---@field surpriseDelayTime number 
---@field surpriseFireWildlyTime number 
---@field deathFireWildlyChance number 
---@field deathFireWildlyTime number 
---@field desiredCombatRange number 
---@field customStandGunOffset MetaEngineVector3D 
---@field customCrouchGunOffset MetaEngineVector3D 
---@field targetTracking number 
---@field targetLeading number 
---@field weaponDamageModifier number 
---@field damagePerSecond number 
---@field burstOriginRadius number 
---@field burstOriginAngle MetaEngineAngle 
---@field burstReturnLength number 
---@field burstReturnAngle MetaEngineAngle 
---@field burstDuration number 
---@field burstSeparation number 
---@field burstAngularVelocity MetaEngineAngle 
---@field specialDamageModifier number 
---@field specialProjectileError MetaEngineAngle 
---@field newTargetBurstDuration number 
---@field newTargetBurstSeparation number 
---@field newTargetRateOfFire number 
---@field newTargetProjectileError number 
---@field movingBurstDuration number 
---@field movingBurstSeparation number 
---@field movingRateOfFire number 
---@field movingProjectileError number 
---@field berserkBurstDuration number 
---@field berserkBurstSeparation number 
---@field berserkRateOfFire number 
---@field berserkProjectileError number 
---@field superBallisticRange number 
---@field bombardmentRange number 
---@field modifiedVisionRange number 
---@field specialFireMode EngineTagDataActorVariantSpecialFireMode 
---@field specialFireSituation EngineTagDataActorVariantSpecialFireSituation 
---@field specialFireChance number 
---@field specialFireDelay number 
---@field meleeRange number 
---@field meleeAbortRange number 
---@field berserkFiringRanges number 
---@field berserkMeleeRange number 
---@field berserkMeleeAbortRange number 
---@field grenadeType EngineTagDataGrenadeType 
---@field trajectoryType EngineTagDataActorVariantTrajectoryType 
---@field grenadeStimulus EngineTagDataActorVariantGrenadeStimulus 
---@field minimumEnemyCount integer 
---@field enemyRadius number 
---@field grenadeVelocity number 
---@field grenadeRanges number 
---@field collateralDamageRadius number 
---@field grenadeChance MetaEngineFraction 
---@field grenadeCheckTime number 
---@field encounterGrenadeTimeout number 
---@field equipment MetaEngineTagDependency 
---@field grenadeCount integer 
---@field dontDropGrenadesChance number 
---@field dropWeaponLoaded number 
---@field dropWeaponAmmo integer 
---@field bodyVitality number 
---@field shieldVitality number 
---@field shieldSappingRadius number 
---@field forcedShaderPermutation MetaEngineIndex 
---@field changeColors TagBlock<MetaEngineTagDataActorVariantChangeColors> 


