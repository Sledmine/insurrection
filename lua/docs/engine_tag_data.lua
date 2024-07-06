-- SPDX-License-Identifier: GPL-3.0-only
-- This file is used to document the Lua plugins engine API. It should not be included.

---@meta _

---@class EngineTagDataActorVariantMovementTypeEnum : Enum 

---@class EngineTagDataActorVariantMovementTypeAlwaysRun : EngineTagDataActorVariantMovementTypeEnum 
---@class EngineTagDataActorVariantMovementTypeAlwaysCrouch : EngineTagDataActorVariantMovementTypeEnum 
---@class EngineTagDataActorVariantMovementTypeSwitchTypes : EngineTagDataActorVariantMovementTypeEnum 

---@alias EngineTagDataActorVariantMovementType 
---| EngineTagDataActorVariantMovementTypeAlwaysRun
---| EngineTagDataActorVariantMovementTypeAlwaysCrouch
---| EngineTagDataActorVariantMovementTypeSwitchTypes

---@class EngineTagDataActorVariantMovementTypeTable 
---@field peAlwaysRun EngineTagDataActorVariantMovementTypeAlwaysRun
---@field peAlwaysCrouch EngineTagDataActorVariantMovementTypeAlwaysCrouch
---@field peSwitchTypes EngineTagDataActorVariantMovementTypeSwitchTypes
Engine.tag.actorVariantMovementType = {} 

---@class EngineTagDataActorVariantSpecialFireModeEnum : Enum 

---@class EngineTagDataActorVariantSpecialFireModeNone : EngineTagDataActorVariantSpecialFireModeEnum 
---@class EngineTagDataActorVariantSpecialFireModeOvercharge : EngineTagDataActorVariantSpecialFireModeEnum 
---@class EngineTagDataActorVariantSpecialFireModeSecondaryTrigger : EngineTagDataActorVariantSpecialFireModeEnum 

---@alias EngineTagDataActorVariantSpecialFireMode 
---| EngineTagDataActorVariantSpecialFireModeNone
---| EngineTagDataActorVariantSpecialFireModeOvercharge
---| EngineTagDataActorVariantSpecialFireModeSecondaryTrigger

---@class EngineTagDataActorVariantSpecialFireModeTable 
---@field odeNone EngineTagDataActorVariantSpecialFireModeNone
---@field odeOvercharge EngineTagDataActorVariantSpecialFireModeOvercharge
---@field odeSecondaryTrigger EngineTagDataActorVariantSpecialFireModeSecondaryTrigger
Engine.tag.actorVariantSpecialFireMode = {} 

---@class EngineTagDataActorVariantSpecialFireSituationEnum : Enum 

---@class EngineTagDataActorVariantSpecialFireSituationNever : EngineTagDataActorVariantSpecialFireSituationEnum 
---@class EngineTagDataActorVariantSpecialFireSituationEnemyVisible : EngineTagDataActorVariantSpecialFireSituationEnum 
---@class EngineTagDataActorVariantSpecialFireSituationEnemyOutOfSight : EngineTagDataActorVariantSpecialFireSituationEnum 
---@class EngineTagDataActorVariantSpecialFireSituationStrafing : EngineTagDataActorVariantSpecialFireSituationEnum 

---@alias EngineTagDataActorVariantSpecialFireSituation 
---| EngineTagDataActorVariantSpecialFireSituationNever
---| EngineTagDataActorVariantSpecialFireSituationEnemyVisible
---| EngineTagDataActorVariantSpecialFireSituationEnemyOutOfSight
---| EngineTagDataActorVariantSpecialFireSituationStrafing

---@class EngineTagDataActorVariantSpecialFireSituationTable 
---@field ionNever EngineTagDataActorVariantSpecialFireSituationNever
---@field ionEnemyVisible EngineTagDataActorVariantSpecialFireSituationEnemyVisible
---@field ionEnemyOutOfSight EngineTagDataActorVariantSpecialFireSituationEnemyOutOfSight
---@field ionStrafing EngineTagDataActorVariantSpecialFireSituationStrafing
Engine.tag.actorVariantSpecialFireSituation = {} 

---@class EngineTagDataActorVariantTrajectoryTypeEnum : Enum 

---@class EngineTagDataActorVariantTrajectoryTypeToss : EngineTagDataActorVariantTrajectoryTypeEnum 
---@class EngineTagDataActorVariantTrajectoryTypeLob : EngineTagDataActorVariantTrajectoryTypeEnum 
---@class EngineTagDataActorVariantTrajectoryTypeBounce : EngineTagDataActorVariantTrajectoryTypeEnum 

---@alias EngineTagDataActorVariantTrajectoryType 
---| EngineTagDataActorVariantTrajectoryTypeToss
---| EngineTagDataActorVariantTrajectoryTypeLob
---| EngineTagDataActorVariantTrajectoryTypeBounce

---@class EngineTagDataActorVariantTrajectoryTypeTable 
---@field peToss EngineTagDataActorVariantTrajectoryTypeToss
---@field peLob EngineTagDataActorVariantTrajectoryTypeLob
---@field peBounce EngineTagDataActorVariantTrajectoryTypeBounce
Engine.tag.actorVariantTrajectoryType = {} 

---@class EngineTagDataActorVariantGrenadeStimulusEnum : Enum 

---@class EngineTagDataActorVariantGrenadeStimulusNever : EngineTagDataActorVariantGrenadeStimulusEnum 
---@class EngineTagDataActorVariantGrenadeStimulusVisibleTarget : EngineTagDataActorVariantGrenadeStimulusEnum 
---@class EngineTagDataActorVariantGrenadeStimulusSeekCover : EngineTagDataActorVariantGrenadeStimulusEnum 

---@alias EngineTagDataActorVariantGrenadeStimulus 
---| EngineTagDataActorVariantGrenadeStimulusNever
---| EngineTagDataActorVariantGrenadeStimulusVisibleTarget
---| EngineTagDataActorVariantGrenadeStimulusSeekCover

---@class EngineTagDataActorVariantGrenadeStimulusTable 
---@field usNever EngineTagDataActorVariantGrenadeStimulusNever
---@field usVisibleTarget EngineTagDataActorVariantGrenadeStimulusVisibleTarget
---@field usSeekCover EngineTagDataActorVariantGrenadeStimulusSeekCover
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
---@field changeColors table<MetaEngineTagDataActorVariantChangeColors> 

---@class EngineTagDataUnitFunctionInEnum : Enum 

---@class EngineTagDataUnitFunctionInNone : EngineTagDataUnitFunctionInEnum 
---@class EngineTagDataUnitFunctionInDriverSeatPower : EngineTagDataUnitFunctionInEnum 
---@class EngineTagDataUnitFunctionInGunnerSeatPower : EngineTagDataUnitFunctionInEnum 
---@class EngineTagDataUnitFunctionInAimingChange : EngineTagDataUnitFunctionInEnum 
---@class EngineTagDataUnitFunctionInMouthAperture : EngineTagDataUnitFunctionInEnum 
---@class EngineTagDataUnitFunctionInIntegratedLightPower : EngineTagDataUnitFunctionInEnum 
---@class EngineTagDataUnitFunctionInCanBlink : EngineTagDataUnitFunctionInEnum 
---@class EngineTagDataUnitFunctionInShieldSapping : EngineTagDataUnitFunctionInEnum 

---@alias EngineTagDataUnitFunctionIn 
---| EngineTagDataUnitFunctionInNone
---| EngineTagDataUnitFunctionInDriverSeatPower
---| EngineTagDataUnitFunctionInGunnerSeatPower
---| EngineTagDataUnitFunctionInAimingChange
---| EngineTagDataUnitFunctionInMouthAperture
---| EngineTagDataUnitFunctionInIntegratedLightPower
---| EngineTagDataUnitFunctionInCanBlink
---| EngineTagDataUnitFunctionInShieldSapping

---@class EngineTagDataUnitFunctionInTable 
---@field nNone EngineTagDataUnitFunctionInNone
---@field nDriverSeatPower EngineTagDataUnitFunctionInDriverSeatPower
---@field nGunnerSeatPower EngineTagDataUnitFunctionInGunnerSeatPower
---@field nAimingChange EngineTagDataUnitFunctionInAimingChange
---@field nMouthAperture EngineTagDataUnitFunctionInMouthAperture
---@field nIntegratedLightPower EngineTagDataUnitFunctionInIntegratedLightPower
---@field nCanBlink EngineTagDataUnitFunctionInCanBlink
---@field nShieldSapping EngineTagDataUnitFunctionInShieldSapping
Engine.tag.unitFunctionIn = {} 

---@class EngineTagDataUnitDefaultTeamEnum : Enum 

---@class EngineTagDataUnitDefaultTeamNone : EngineTagDataUnitDefaultTeamEnum 
---@class EngineTagDataUnitDefaultTeamPlayer : EngineTagDataUnitDefaultTeamEnum 
---@class EngineTagDataUnitDefaultTeamHuman : EngineTagDataUnitDefaultTeamEnum 
---@class EngineTagDataUnitDefaultTeamCovenant : EngineTagDataUnitDefaultTeamEnum 
---@class EngineTagDataUnitDefaultTeamFlood : EngineTagDataUnitDefaultTeamEnum 
---@class EngineTagDataUnitDefaultTeamSentinel : EngineTagDataUnitDefaultTeamEnum 
---@class EngineTagDataUnitDefaultTeamUnused6 : EngineTagDataUnitDefaultTeamEnum 
---@class EngineTagDataUnitDefaultTeamUnused7 : EngineTagDataUnitDefaultTeamEnum 
---@class EngineTagDataUnitDefaultTeamUnused8 : EngineTagDataUnitDefaultTeamEnum 
---@class EngineTagDataUnitDefaultTeamUnused9 : EngineTagDataUnitDefaultTeamEnum 

---@alias EngineTagDataUnitDefaultTeam 
---| EngineTagDataUnitDefaultTeamNone
---| EngineTagDataUnitDefaultTeamPlayer
---| EngineTagDataUnitDefaultTeamHuman
---| EngineTagDataUnitDefaultTeamCovenant
---| EngineTagDataUnitDefaultTeamFlood
---| EngineTagDataUnitDefaultTeamSentinel
---| EngineTagDataUnitDefaultTeamUnused6
---| EngineTagDataUnitDefaultTeamUnused7
---| EngineTagDataUnitDefaultTeamUnused8
---| EngineTagDataUnitDefaultTeamUnused9

---@class EngineTagDataUnitDefaultTeamTable 
---@field mNone EngineTagDataUnitDefaultTeamNone
---@field mPlayer EngineTagDataUnitDefaultTeamPlayer
---@field mHuman EngineTagDataUnitDefaultTeamHuman
---@field mCovenant EngineTagDataUnitDefaultTeamCovenant
---@field mFlood EngineTagDataUnitDefaultTeamFlood
---@field mSentinel EngineTagDataUnitDefaultTeamSentinel
---@field mUnused6 EngineTagDataUnitDefaultTeamUnused6
---@field mUnused7 EngineTagDataUnitDefaultTeamUnused7
---@field mUnused8 EngineTagDataUnitDefaultTeamUnused8
---@field mUnused9 EngineTagDataUnitDefaultTeamUnused9
Engine.tag.unitDefaultTeam = {} 

---@class EngineTagDataUnitMotionSensorBlipSizeEnum : Enum 

---@class EngineTagDataUnitMotionSensorBlipSizeMedium : EngineTagDataUnitMotionSensorBlipSizeEnum 
---@class EngineTagDataUnitMotionSensorBlipSizeSmall : EngineTagDataUnitMotionSensorBlipSizeEnum 
---@class EngineTagDataUnitMotionSensorBlipSizeLarge : EngineTagDataUnitMotionSensorBlipSizeEnum 

---@alias EngineTagDataUnitMotionSensorBlipSize 
---| EngineTagDataUnitMotionSensorBlipSizeMedium
---| EngineTagDataUnitMotionSensorBlipSizeSmall
---| EngineTagDataUnitMotionSensorBlipSizeLarge

---@class EngineTagDataUnitMotionSensorBlipSizeTable 
---@field izeMedium EngineTagDataUnitMotionSensorBlipSizeMedium
---@field izeSmall EngineTagDataUnitMotionSensorBlipSizeSmall
---@field izeLarge EngineTagDataUnitMotionSensorBlipSizeLarge
Engine.tag.unitMotionSensorBlipSize = {} 

---@class EngineTagDataMetagameTypeEnum : Enum 

---@class EngineTagDataMetagameTypeBrute : EngineTagDataMetagameTypeEnum 
---@class EngineTagDataMetagameTypeGrunt : EngineTagDataMetagameTypeEnum 
---@class EngineTagDataMetagameTypeJackal : EngineTagDataMetagameTypeEnum 
---@class EngineTagDataMetagameTypeSkirmisher : EngineTagDataMetagameTypeEnum 
---@class EngineTagDataMetagameTypeMarine : EngineTagDataMetagameTypeEnum 
---@class EngineTagDataMetagameTypeSpartan : EngineTagDataMetagameTypeEnum 
---@class EngineTagDataMetagameTypeBugger : EngineTagDataMetagameTypeEnum 
---@class EngineTagDataMetagameTypeHunter : EngineTagDataMetagameTypeEnum 
---@class EngineTagDataMetagameTypeFloodInfection : EngineTagDataMetagameTypeEnum 
---@class EngineTagDataMetagameTypeFloodCarrier : EngineTagDataMetagameTypeEnum 
---@class EngineTagDataMetagameTypeFloodCombat : EngineTagDataMetagameTypeEnum 
---@class EngineTagDataMetagameTypeFloodPure : EngineTagDataMetagameTypeEnum 
---@class EngineTagDataMetagameTypeSentinel : EngineTagDataMetagameTypeEnum 
---@class EngineTagDataMetagameTypeElite : EngineTagDataMetagameTypeEnum 
---@class EngineTagDataMetagameTypeEngineer : EngineTagDataMetagameTypeEnum 
---@class EngineTagDataMetagameTypeMule : EngineTagDataMetagameTypeEnum 
---@class EngineTagDataMetagameTypeTurret : EngineTagDataMetagameTypeEnum 
---@class EngineTagDataMetagameTypeMongoose : EngineTagDataMetagameTypeEnum 
---@class EngineTagDataMetagameTypeWarthog : EngineTagDataMetagameTypeEnum 
---@class EngineTagDataMetagameTypeScorpion : EngineTagDataMetagameTypeEnum 
---@class EngineTagDataMetagameTypeHornet : EngineTagDataMetagameTypeEnum 
---@class EngineTagDataMetagameTypePelican : EngineTagDataMetagameTypeEnum 
---@class EngineTagDataMetagameTypeRevenant : EngineTagDataMetagameTypeEnum 
---@class EngineTagDataMetagameTypeSeraph : EngineTagDataMetagameTypeEnum 
---@class EngineTagDataMetagameTypeShade : EngineTagDataMetagameTypeEnum 
---@class EngineTagDataMetagameTypeWatchtower : EngineTagDataMetagameTypeEnum 
---@class EngineTagDataMetagameTypeGhost : EngineTagDataMetagameTypeEnum 
---@class EngineTagDataMetagameTypeChopper : EngineTagDataMetagameTypeEnum 
---@class EngineTagDataMetagameTypeMauler : EngineTagDataMetagameTypeEnum 
---@class EngineTagDataMetagameTypeWraith : EngineTagDataMetagameTypeEnum 
---@class EngineTagDataMetagameTypeBanshee : EngineTagDataMetagameTypeEnum 
---@class EngineTagDataMetagameTypePhantom : EngineTagDataMetagameTypeEnum 
---@class EngineTagDataMetagameTypeScarab : EngineTagDataMetagameTypeEnum 
---@class EngineTagDataMetagameTypeGuntower : EngineTagDataMetagameTypeEnum 
---@class EngineTagDataMetagameTypeTuningFork : EngineTagDataMetagameTypeEnum 
---@class EngineTagDataMetagameTypeBroadsword : EngineTagDataMetagameTypeEnum 
---@class EngineTagDataMetagameTypeMammoth : EngineTagDataMetagameTypeEnum 
---@class EngineTagDataMetagameTypeLich : EngineTagDataMetagameTypeEnum 
---@class EngineTagDataMetagameTypeMantis : EngineTagDataMetagameTypeEnum 
---@class EngineTagDataMetagameTypeWasp : EngineTagDataMetagameTypeEnum 
---@class EngineTagDataMetagameTypePhaeton : EngineTagDataMetagameTypeEnum 
---@class EngineTagDataMetagameTypeBishop : EngineTagDataMetagameTypeEnum 
---@class EngineTagDataMetagameTypeKnight : EngineTagDataMetagameTypeEnum 
---@class EngineTagDataMetagameTypePawn : EngineTagDataMetagameTypeEnum 

---@alias EngineTagDataMetagameType 
---| EngineTagDataMetagameTypeBrute
---| EngineTagDataMetagameTypeGrunt
---| EngineTagDataMetagameTypeJackal
---| EngineTagDataMetagameTypeSkirmisher
---| EngineTagDataMetagameTypeMarine
---| EngineTagDataMetagameTypeSpartan
---| EngineTagDataMetagameTypeBugger
---| EngineTagDataMetagameTypeHunter
---| EngineTagDataMetagameTypeFloodInfection
---| EngineTagDataMetagameTypeFloodCarrier
---| EngineTagDataMetagameTypeFloodCombat
---| EngineTagDataMetagameTypeFloodPure
---| EngineTagDataMetagameTypeSentinel
---| EngineTagDataMetagameTypeElite
---| EngineTagDataMetagameTypeEngineer
---| EngineTagDataMetagameTypeMule
---| EngineTagDataMetagameTypeTurret
---| EngineTagDataMetagameTypeMongoose
---| EngineTagDataMetagameTypeWarthog
---| EngineTagDataMetagameTypeScorpion
---| EngineTagDataMetagameTypeHornet
---| EngineTagDataMetagameTypePelican
---| EngineTagDataMetagameTypeRevenant
---| EngineTagDataMetagameTypeSeraph
---| EngineTagDataMetagameTypeShade
---| EngineTagDataMetagameTypeWatchtower
---| EngineTagDataMetagameTypeGhost
---| EngineTagDataMetagameTypeChopper
---| EngineTagDataMetagameTypeMauler
---| EngineTagDataMetagameTypeWraith
---| EngineTagDataMetagameTypeBanshee
---| EngineTagDataMetagameTypePhantom
---| EngineTagDataMetagameTypeScarab
---| EngineTagDataMetagameTypeGuntower
---| EngineTagDataMetagameTypeTuningFork
---| EngineTagDataMetagameTypeBroadsword
---| EngineTagDataMetagameTypeMammoth
---| EngineTagDataMetagameTypeLich
---| EngineTagDataMetagameTypeMantis
---| EngineTagDataMetagameTypeWasp
---| EngineTagDataMetagameTypePhaeton
---| EngineTagDataMetagameTypeBishop
---| EngineTagDataMetagameTypeKnight
---| EngineTagDataMetagameTypePawn

---@class EngineTagDataMetagameTypeTable 
---@field brute EngineTagDataMetagameTypeBrute
---@field grunt EngineTagDataMetagameTypeGrunt
---@field jackal EngineTagDataMetagameTypeJackal
---@field skirmisher EngineTagDataMetagameTypeSkirmisher
---@field marine EngineTagDataMetagameTypeMarine
---@field spartan EngineTagDataMetagameTypeSpartan
---@field bugger EngineTagDataMetagameTypeBugger
---@field hunter EngineTagDataMetagameTypeHunter
---@field floodInfection EngineTagDataMetagameTypeFloodInfection
---@field floodCarrier EngineTagDataMetagameTypeFloodCarrier
---@field floodCombat EngineTagDataMetagameTypeFloodCombat
---@field floodPure EngineTagDataMetagameTypeFloodPure
---@field sentinel EngineTagDataMetagameTypeSentinel
---@field elite EngineTagDataMetagameTypeElite
---@field engineer EngineTagDataMetagameTypeEngineer
---@field mule EngineTagDataMetagameTypeMule
---@field turret EngineTagDataMetagameTypeTurret
---@field mongoose EngineTagDataMetagameTypeMongoose
---@field warthog EngineTagDataMetagameTypeWarthog
---@field scorpion EngineTagDataMetagameTypeScorpion
---@field hornet EngineTagDataMetagameTypeHornet
---@field pelican EngineTagDataMetagameTypePelican
---@field revenant EngineTagDataMetagameTypeRevenant
---@field seraph EngineTagDataMetagameTypeSeraph
---@field shade EngineTagDataMetagameTypeShade
---@field watchtower EngineTagDataMetagameTypeWatchtower
---@field ghost EngineTagDataMetagameTypeGhost
---@field chopper EngineTagDataMetagameTypeChopper
---@field mauler EngineTagDataMetagameTypeMauler
---@field wraith EngineTagDataMetagameTypeWraith
---@field banshee EngineTagDataMetagameTypeBanshee
---@field phantom EngineTagDataMetagameTypePhantom
---@field scarab EngineTagDataMetagameTypeScarab
---@field guntower EngineTagDataMetagameTypeGuntower
---@field tuningFork EngineTagDataMetagameTypeTuningFork
---@field broadsword EngineTagDataMetagameTypeBroadsword
---@field mammoth EngineTagDataMetagameTypeMammoth
---@field lich EngineTagDataMetagameTypeLich
---@field mantis EngineTagDataMetagameTypeMantis
---@field wasp EngineTagDataMetagameTypeWasp
---@field phaeton EngineTagDataMetagameTypePhaeton
---@field bishop EngineTagDataMetagameTypeBishop
---@field knight EngineTagDataMetagameTypeKnight
---@field pawn EngineTagDataMetagameTypePawn
Engine.tag.metagameType = {} 

---@class EngineTagDataMetagameClassEnum : Enum 

---@class EngineTagDataMetagameClassInfantry : EngineTagDataMetagameClassEnum 
---@class EngineTagDataMetagameClassLeader : EngineTagDataMetagameClassEnum 
---@class EngineTagDataMetagameClassHero : EngineTagDataMetagameClassEnum 
---@class EngineTagDataMetagameClassSpecialist : EngineTagDataMetagameClassEnum 
---@class EngineTagDataMetagameClassLightVehicle : EngineTagDataMetagameClassEnum 
---@class EngineTagDataMetagameClassHeavyVehicle : EngineTagDataMetagameClassEnum 
---@class EngineTagDataMetagameClassGiantVehicle : EngineTagDataMetagameClassEnum 
---@class EngineTagDataMetagameClassStandardVehicle : EngineTagDataMetagameClassEnum 

---@alias EngineTagDataMetagameClass 
---| EngineTagDataMetagameClassInfantry
---| EngineTagDataMetagameClassLeader
---| EngineTagDataMetagameClassHero
---| EngineTagDataMetagameClassSpecialist
---| EngineTagDataMetagameClassLightVehicle
---| EngineTagDataMetagameClassHeavyVehicle
---| EngineTagDataMetagameClassGiantVehicle
---| EngineTagDataMetagameClassStandardVehicle

---@class EngineTagDataMetagameClassTable 
---@field infantry EngineTagDataMetagameClassInfantry
---@field leader EngineTagDataMetagameClassLeader
---@field hero EngineTagDataMetagameClassHero
---@field specialist EngineTagDataMetagameClassSpecialist
---@field lightVehicle EngineTagDataMetagameClassLightVehicle
---@field heavyVehicle EngineTagDataMetagameClassHeavyVehicle
---@field giantVehicle EngineTagDataMetagameClassGiantVehicle
---@field standardVehicle EngineTagDataMetagameClassStandardVehicle
Engine.tag.metagameClass = {} 

---@class MetaEngineTagDataUnitFlags 
---@field circularAiming boolean 
---@field destroyedAfterDying boolean 
---@field halfSpeedInterpolation boolean 
---@field firesFromCamera boolean 
---@field entranceInsideBoundingSphere boolean 
---@field unused boolean 
---@field causesPassengerDialogue boolean 
---@field resistsPings boolean 
---@field meleeAttackIsFatal boolean 
---@field dontRefaceDuringPings boolean 
---@field hasNoAiming boolean 
---@field simpleCreature boolean 
---@field impactMeleeAttachesToUnit boolean 
---@field impactMeleeDiesOnShields boolean 
---@field cannotOpenDoorsAutomatically boolean 
---@field meleeAttackersCannotAttach boolean 
---@field notInstantlyKilledByMelee boolean 
---@field shieldSapping boolean 
---@field runsAroundFlaming boolean 
---@field inconsequential boolean 
---@field specialCinematicUnit boolean 
---@field ignoredByAutoaiming boolean 
---@field shieldsFryInfectionForms boolean 
---@field integratedLightCntrlsWeapon boolean 
---@field integratedLightLastsForever boolean 

---@class MetaEngineTagDataUnitSeatFlags 
---@field invisible boolean 
---@field locked boolean 
---@field driver boolean 
---@field gunner boolean 
---@field thirdPersonCamera boolean 
---@field allowsWeapons boolean 
---@field thirdPersonOnEnter boolean 
---@field firstPersonCameraSlavedToGun boolean 
---@field allowVehicleCommunicationAnimations boolean 
---@field notValidWithoutDriver boolean 
---@field allowAiNoncombatants boolean 

---@class MetaEngineTagDataUnitPoweredSeat 
---@field driverPowerupTime number 
---@field driverPowerdownTime number 

---@class MetaEngineTagDataUnitCameraTrack 
---@field track MetaEngineTagDependency 

---@class MetaEngineTagDataUnitUnitHudInterface 
---@field hud MetaEngineTagDependency 

---@class MetaEngineTagDataUnitSeat 
---@field flags MetaEngineTagDataUnitSeatFlags 
---@field label MetaEngineTagString 
---@field markerName MetaEngineTagString 
---@field accelerationScale MetaEngineVector3D 
---@field yawRate number 
---@field pitchRate number 
---@field cameraMarkerName MetaEngineTagString 
---@field cameraSubmergedMarkerName MetaEngineTagString 
---@field pitchAutoLevel MetaEngineAngle 
---@field pitchRange MetaEngineAngle 
---@field cameraTracks table<MetaEngineTagDataUnitCameraTrack> 
---@field unitHudInterface table<MetaEngineTagDataUnitUnitHudInterface> 
---@field hudTextMessageIndex MetaEngineIndex 
---@field yawMinimum MetaEngineAngle 
---@field yawMaximum MetaEngineAngle 
---@field builtInGunner MetaEngineTagDependency 

---@class MetaEngineTagDataUnitWeapon 
---@field weapon MetaEngineTagDependency 

---@class MetaEngineTagDataUnitDialogueVariant 
---@field variantNumber integer 
---@field dialogue MetaEngineTagDependency 

---@class MetaEngineTagDataUnit: MetaEngineTagDataObject  
---@field unitFlags MetaEngineTagDataUnitFlags 
---@field defaultTeam EngineTagDataUnitDefaultTeam 
---@field constantSoundVolume EngineTagDataObjectNoise 
---@field riderDamageFraction number 
---@field integratedLightToggle MetaEngineTagDependency 
---@field unitAIn EngineTagDataUnitFunctionIn 
---@field unitBIn EngineTagDataUnitFunctionIn 
---@field unitCIn EngineTagDataUnitFunctionIn 
---@field unitDIn EngineTagDataUnitFunctionIn 
---@field cameraFieldOfView MetaEngineAngle 
---@field cameraStiffness number 
---@field cameraMarkerName MetaEngineTagString 
---@field cameraSubmergedMarkerName MetaEngineTagString 
---@field pitchAutoLevel MetaEngineAngle 
---@field pitchRange MetaEngineAngle 
---@field cameraTracks table<MetaEngineTagDataUnitCameraTrack> 
---@field seatAccelerationScale MetaEnginePoint3D 
---@field softPingThreshold number 
---@field softPingInterruptTime number 
---@field hardPingThreshold number 
---@field hardPingInterruptTime number 
---@field hardDeathThreshold number 
---@field feignDeathThreshold number 
---@field feignDeathTime number 
---@field distanceOfEvadeAnim number 
---@field distanceOfDiveAnim number 
---@field stunnedMovementThreshold number 
---@field feignDeathChance number 
---@field feignRepeatChance number 
---@field spawnedActor MetaEngineTagDependency 
---@field spawnedActorCount integer 
---@field spawnedVelocity number 
---@field aimingVelocityMaximum MetaEngineAngle 
---@field aimingAccelerationMaximum MetaEngineAngle 
---@field casualAimingModifier MetaEngineFraction 
---@field lookingVelocityMaximum MetaEngineAngle 
---@field lookingAccelerationMaximum MetaEngineAngle 
---@field aiVehicleRadius number 
---@field aiDangerRadius number 
---@field meleeDamage MetaEngineTagDependency 
---@field motionSensorBlipSize EngineTagDataUnitMotionSensorBlipSize 
---@field metagameType EngineTagDataMetagameType 
---@field metagameClass EngineTagDataMetagameClass 
---@field newHudInterfaces table<MetaEngineTagDataUnitUnitHudInterface> 
---@field dialogueVariants table<MetaEngineTagDataUnitDialogueVariant> 
---@field grenadeVelocity number 
---@field grenadeType EngineTagDataGrenadeType 
---@field grenadeCount integer 
---@field softPingInterruptTicks integer 
---@field hardPingInterruptTicks integer 
---@field poweredSeats table<MetaEngineTagDataUnitPoweredSeat> 
---@field weapons table<MetaEngineTagDataUnitWeapon> 
---@field seats table<MetaEngineTagDataUnitSeat> 

---@class EngineTagDataMeterInterpolateColorsEnum : Enum 

---@class EngineTagDataMeterInterpolateColorsLinearly : EngineTagDataMeterInterpolateColorsEnum 
---@class EngineTagDataMeterInterpolateColorsFasterNearEmpty : EngineTagDataMeterInterpolateColorsEnum 
---@class EngineTagDataMeterInterpolateColorsFasterNearFull : EngineTagDataMeterInterpolateColorsEnum 
---@class EngineTagDataMeterInterpolateColorsThroughRandomNoise : EngineTagDataMeterInterpolateColorsEnum 

---@alias EngineTagDataMeterInterpolateColors 
---| EngineTagDataMeterInterpolateColorsLinearly
---| EngineTagDataMeterInterpolateColorsFasterNearEmpty
---| EngineTagDataMeterInterpolateColorsFasterNearFull
---| EngineTagDataMeterInterpolateColorsThroughRandomNoise

---@class EngineTagDataMeterInterpolateColorsTable 
---@field sLinearly EngineTagDataMeterInterpolateColorsLinearly
---@field sFasterNearEmpty EngineTagDataMeterInterpolateColorsFasterNearEmpty
---@field sFasterNearFull EngineTagDataMeterInterpolateColorsFasterNearFull
---@field sThroughRandomNoise EngineTagDataMeterInterpolateColorsThroughRandomNoise
Engine.tag.meterInterpolateColors = {} 

---@class EngineTagDataMeterAnchorColorsEnum : Enum 

---@class EngineTagDataMeterAnchorColorsAtBothEnds : EngineTagDataMeterAnchorColorsEnum 
---@class EngineTagDataMeterAnchorColorsAtEmpty : EngineTagDataMeterAnchorColorsEnum 
---@class EngineTagDataMeterAnchorColorsAtFull : EngineTagDataMeterAnchorColorsEnum 

---@alias EngineTagDataMeterAnchorColors 
---| EngineTagDataMeterAnchorColorsAtBothEnds
---| EngineTagDataMeterAnchorColorsAtEmpty
---| EngineTagDataMeterAnchorColorsAtFull

---@class EngineTagDataMeterAnchorColorsTable 
---@field sAtBothEnds EngineTagDataMeterAnchorColorsAtBothEnds
---@field sAtEmpty EngineTagDataMeterAnchorColorsAtEmpty
---@field sAtFull EngineTagDataMeterAnchorColorsAtFull
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

---@class EngineTagDataShaderModelDetailMaskEnum : Enum 

---@class EngineTagDataShaderModelDetailMaskNone : EngineTagDataShaderModelDetailMaskEnum 
---@class EngineTagDataShaderModelDetailMaskReflectionMaskInverse : EngineTagDataShaderModelDetailMaskEnum 
---@class EngineTagDataShaderModelDetailMaskReflectionMask : EngineTagDataShaderModelDetailMaskEnum 
---@class EngineTagDataShaderModelDetailMaskSelfIlluminationMaskInverse : EngineTagDataShaderModelDetailMaskEnum 
---@class EngineTagDataShaderModelDetailMaskSelfIlluminationMask : EngineTagDataShaderModelDetailMaskEnum 
---@class EngineTagDataShaderModelDetailMaskChangeColorMaskInverse : EngineTagDataShaderModelDetailMaskEnum 
---@class EngineTagDataShaderModelDetailMaskChangeColorMask : EngineTagDataShaderModelDetailMaskEnum 
---@class EngineTagDataShaderModelDetailMaskAuxiliaryMaskInverse : EngineTagDataShaderModelDetailMaskEnum 
---@class EngineTagDataShaderModelDetailMaskAuxiliaryMask : EngineTagDataShaderModelDetailMaskEnum 

---@alias EngineTagDataShaderModelDetailMask 
---| EngineTagDataShaderModelDetailMaskNone
---| EngineTagDataShaderModelDetailMaskReflectionMaskInverse
---| EngineTagDataShaderModelDetailMaskReflectionMask
---| EngineTagDataShaderModelDetailMaskSelfIlluminationMaskInverse
---| EngineTagDataShaderModelDetailMaskSelfIlluminationMask
---| EngineTagDataShaderModelDetailMaskChangeColorMaskInverse
---| EngineTagDataShaderModelDetailMaskChangeColorMask
---| EngineTagDataShaderModelDetailMaskAuxiliaryMaskInverse
---| EngineTagDataShaderModelDetailMaskAuxiliaryMask

---@class EngineTagDataShaderModelDetailMaskTable 
---@field skNone EngineTagDataShaderModelDetailMaskNone
---@field skReflectionMaskInverse EngineTagDataShaderModelDetailMaskReflectionMaskInverse
---@field skReflectionMask EngineTagDataShaderModelDetailMaskReflectionMask
---@field skSelfIlluminationMaskInverse EngineTagDataShaderModelDetailMaskSelfIlluminationMaskInverse
---@field skSelfIlluminationMask EngineTagDataShaderModelDetailMaskSelfIlluminationMask
---@field skChangeColorMaskInverse EngineTagDataShaderModelDetailMaskChangeColorMaskInverse
---@field skChangeColorMask EngineTagDataShaderModelDetailMaskChangeColorMask
---@field skAuxiliaryMaskInverse EngineTagDataShaderModelDetailMaskAuxiliaryMaskInverse
---@field skAuxiliaryMask EngineTagDataShaderModelDetailMaskAuxiliaryMask
Engine.tag.shaderModelDetailMask = {} 

---@class MetaEngineTagDataShaderModelFlags 
---@field detailAfterReflection boolean 
---@field twoSided boolean 
---@field notAlphaTested boolean 
---@field alphaBlendedDecal boolean 
---@field trueAtmosphericFog boolean 
---@field disableTwoSidedCulling boolean 
---@field useXboxMultipurposeChannelOrder boolean 

---@class MetaEngineTagDataShaderModelMoreFlags 
---@field noRandomPhase boolean 

---@class MetaEngineTagDataShaderModel: MetaEngineTagDataShader  
---@field shaderModelFlags MetaEngineTagDataShaderModelFlags 
---@field translucency MetaEngineFraction 
---@field changeColorSource EngineTagDataFunctionNameNullable 
---@field shaderModelMoreFlags MetaEngineTagDataShaderModelMoreFlags 
---@field colorSource EngineTagDataFunctionNameNullable 
---@field animationFunction EngineTagDataWaveFunction 
---@field animationPeriod number 
---@field animationColorLowerBound MetaEngineColorRGB 
---@field animationColorUpperBound MetaEngineColorRGB 
---@field mapUScale number 
---@field mapVScale number 
---@field baseMap MetaEngineTagDependency 
---@field multipurposeMap MetaEngineTagDependency 
---@field detailFunction EngineTagDataShaderDetailFunction 
---@field detailMask EngineTagDataShaderModelDetailMask 
---@field detailMapScale number 
---@field detailMap MetaEngineTagDependency 
---@field detailMapVScale number 
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
---@field reflectionFalloffDistance number 
---@field reflectionCutoffDistance number 
---@field perpendicularBrightness MetaEngineFraction 
---@field perpendicularTintColor MetaEngineColorRGB 
---@field parallelBrightness MetaEngineFraction 
---@field parallelTintColor MetaEngineColorRGB 
---@field reflectionCubeMap MetaEngineTagDependency 
---@field unknown number 

---@class MetaEngineTagDataModelCollisionGeometryMaterialFlags 
---@field head boolean 

---@class MetaEngineTagDataModelCollisionGeometryRegionFlags 
---@field livesUntilObjectDies boolean 
---@field forcesObjectToDie boolean 
---@field diesWhenObjectDies boolean 
---@field diesWhenObjectIsDamaged boolean 
---@field disappearsWhenShieldIsOff boolean 
---@field inhibitsMeleeAttack boolean 
---@field inhibitsWeaponAttack boolean 
---@field inhibitsWalking boolean 
---@field forcesDropWeapon boolean 
---@field causesHeadMaimedScream boolean 

---@class MetaEngineTagDataModelCollisionGeometryBSPLeafFlags 
---@field containsDoubleSidedSurfaces boolean 

---@class MetaEngineTagDataModelCollisionGeometryBSPSurfaceFlags 
---@field twoSided boolean 
---@field invisible boolean 
---@field climbable boolean 
---@field breakable boolean 

---@class MetaEngineTagDataModelCollisionGeometryFlags 
---@field takesShieldDamageForChildren boolean 
---@field takesBodyDamageForChildren boolean 
---@field alwaysShieldsFriendlyDamage boolean 
---@field passesAreaDamageToChildren boolean 
---@field parentNeverTakesBodyDamageForUs boolean 
---@field onlyDamagedByExplosives boolean 
---@field onlyDamagedWhileOccupied boolean 

---@class MetaEngineTagDataModelCollisionGeometryMaterial 
---@field name MetaEngineTagString 
---@field flags MetaEngineTagDataModelCollisionGeometryMaterialFlags 
---@field materialType EngineTagDataMaterialType 
---@field shieldLeakPercentage MetaEngineFraction 
---@field shieldDamageMultiplier number 
---@field bodyDamageMultiplier number 

---@class MetaEngineTagDataModelCollisionGeometryPermutation 
---@field name MetaEngineTagString 

---@class MetaEngineTagDataModelCollisionGeometryRegion 
---@field name MetaEngineTagString 
---@field flags MetaEngineTagDataModelCollisionGeometryRegionFlags 
---@field damageThreshold number 
---@field destroyedEffect MetaEngineTagDependency 
---@field permutations table<MetaEngineTagDataModelCollisionGeometryPermutation> 

---@class MetaEngineTagDataModelCollisionGeometryModifier 

---@class MetaEngineTagDataModelCollisionGeometrySphere 
---@field node MetaEngineIndex 
---@field center MetaEnginePoint3D 
---@field radius number 

---@class MetaEngineTagDataModelCollisionGeometryBSP3DNode 
---@field plane integer 
---@field backChild integer 
---@field frontChild integer 

---@class MetaEngineTagDataModelCollisionGeometryBSPPlane 
---@field plane MetaEnginePlane3D 

---@class MetaEngineTagDataModelCollisionGeometryBSPLeaf 
---@field flags MetaEngineTagDataModelCollisionGeometryBSPLeafFlags 
---@field bsp2dReferenceCount integer 
---@field firstBsp2dReference integer 

---@class MetaEngineTagDataModelCollisionGeometryBSP2DReference 
---@field plane integer 
---@field bsp2dNode integer 

---@class MetaEngineTagDataModelCollisionGeometryBSP2DNode 
---@field plane MetaEnginePlane2D 
---@field leftChild integer 
---@field rightChild integer 

---@class MetaEngineTagDataModelCollisionGeometryBSPSurface 
---@field plane integer 
---@field firstEdge integer 
---@field flags MetaEngineTagDataModelCollisionGeometryBSPSurfaceFlags 
---@field breakableSurface integer 
---@field material MetaEngineIndex 

---@class MetaEngineTagDataModelCollisionGeometryBSPEdge 
---@field startVertex integer 
---@field endVertex integer 
---@field forwardEdge integer 
---@field reverseEdge integer 
---@field leftSurface integer 
---@field rightSurface integer 

---@class MetaEngineTagDataModelCollisionGeometryBSPVertex 
---@field point MetaEnginePoint3D 
---@field firstEdge integer 

---@class MetaEngineTagDataModelCollisionGeometryBSP 
---@field bsp3dNodes table<MetaEngineTagDataModelCollisionGeometryBSP3DNode> 
---@field planes table<MetaEngineTagDataModelCollisionGeometryBSPPlane> 
---@field leaves table<MetaEngineTagDataModelCollisionGeometryBSPLeaf> 
---@field bsp2dReferences table<MetaEngineTagDataModelCollisionGeometryBSP2DReference> 
---@field bsp2dNodes table<MetaEngineTagDataModelCollisionGeometryBSP2DNode> 
---@field surfaces table<MetaEngineTagDataModelCollisionGeometryBSPSurface> 
---@field edges table<MetaEngineTagDataModelCollisionGeometryBSPEdge> 
---@field vertices table<MetaEngineTagDataModelCollisionGeometryBSPVertex> 

---@class MetaEngineTagDataModelCollisionGeometryNode 
---@field name MetaEngineTagString 
---@field region MetaEngineIndex 
---@field parentNode MetaEngineIndex 
---@field nextSiblingNode MetaEngineIndex 
---@field firstChildNode MetaEngineIndex 
---@field nameThing integer 
---@field bsps table<MetaEngineTagDataModelCollisionGeometryBSP> 

---@class MetaEngineTagDataModelCollisionGeometry 
---@field flags MetaEngineTagDataModelCollisionGeometryFlags 
---@field indirectDamageMaterial MetaEngineIndex 
---@field maximumBodyVitality number 
---@field bodySystemShock number 
---@field friendlyDamageResistance MetaEngineFraction 
---@field localizedDamageEffect MetaEngineTagDependency 
---@field areaDamageEffectThreshold number 
---@field areaDamageEffect MetaEngineTagDependency 
---@field bodyDamagedThreshold number 
---@field bodyDamagedEffect MetaEngineTagDependency 
---@field bodyDepletedEffect MetaEngineTagDependency 
---@field bodyDestroyedThreshold number 
---@field bodyDestroyedEffect MetaEngineTagDependency 
---@field maximumShieldVitality number 
---@field shieldMaterialType EngineTagDataMaterialType 
---@field shieldFailureFunction EngineTagDataFunctionType 
---@field shieldFailureThreshold MetaEngineFraction 
---@field failingShieldLeakFraction MetaEngineFraction 
---@field minimumStunDamage number 
---@field stunTime number 
---@field rechargeTime number 
---@field shieldDamagedThreshold number 
---@field shieldDamagedEffect MetaEngineTagDependency 
---@field shieldDepletedEffect MetaEngineTagDependency 
---@field shieldRechargingEffect MetaEngineTagDependency 
---@field shieldRechargeRate number 
---@field materials table<MetaEngineTagDataModelCollisionGeometryMaterial> 
---@field regions table<MetaEngineTagDataModelCollisionGeometryRegion> 
---@field modifiers table<MetaEngineTagDataModelCollisionGeometryModifier> 
---@field x number 
---@field y number 
---@field z number 
---@field pathfindingSpheres table<MetaEngineTagDataModelCollisionGeometrySphere> 
---@field nodes table<MetaEngineTagDataModelCollisionGeometryNode> 

---@class EngineTagDataScenarioTypeEnum : Enum 

---@class EngineTagDataScenarioTypeSingleplayer : EngineTagDataScenarioTypeEnum 
---@class EngineTagDataScenarioTypeMultiplayer : EngineTagDataScenarioTypeEnum 
---@class EngineTagDataScenarioTypeUserInterface : EngineTagDataScenarioTypeEnum 

---@alias EngineTagDataScenarioType 
---| EngineTagDataScenarioTypeSingleplayer
---| EngineTagDataScenarioTypeMultiplayer
---| EngineTagDataScenarioTypeUserInterface

---@class EngineTagDataScenarioTypeTable 
---@field singleplayer EngineTagDataScenarioTypeSingleplayer
---@field multiplayer EngineTagDataScenarioTypeMultiplayer
---@field userInterface EngineTagDataScenarioTypeUserInterface
Engine.tag.scenarioType = {} 

---@class EngineTagDataScenarioSpawnTypeEnum : Enum 

---@class EngineTagDataScenarioSpawnTypeNone : EngineTagDataScenarioSpawnTypeEnum 
---@class EngineTagDataScenarioSpawnTypeCtf : EngineTagDataScenarioSpawnTypeEnum 
---@class EngineTagDataScenarioSpawnTypeSlayer : EngineTagDataScenarioSpawnTypeEnum 
---@class EngineTagDataScenarioSpawnTypeOddball : EngineTagDataScenarioSpawnTypeEnum 
---@class EngineTagDataScenarioSpawnTypeKingOfTheHill : EngineTagDataScenarioSpawnTypeEnum 
---@class EngineTagDataScenarioSpawnTypeRace : EngineTagDataScenarioSpawnTypeEnum 
---@class EngineTagDataScenarioSpawnTypeTerminator : EngineTagDataScenarioSpawnTypeEnum 
---@class EngineTagDataScenarioSpawnTypeStub : EngineTagDataScenarioSpawnTypeEnum 
---@class EngineTagDataScenarioSpawnTypeIgnored1 : EngineTagDataScenarioSpawnTypeEnum 
---@class EngineTagDataScenarioSpawnTypeIgnored2 : EngineTagDataScenarioSpawnTypeEnum 
---@class EngineTagDataScenarioSpawnTypeIgnored3 : EngineTagDataScenarioSpawnTypeEnum 
---@class EngineTagDataScenarioSpawnTypeIgnored4 : EngineTagDataScenarioSpawnTypeEnum 
---@class EngineTagDataScenarioSpawnTypeAllGames : EngineTagDataScenarioSpawnTypeEnum 
---@class EngineTagDataScenarioSpawnTypeAllExceptCtf : EngineTagDataScenarioSpawnTypeEnum 
---@class EngineTagDataScenarioSpawnTypeAllExceptRaceAndCtf : EngineTagDataScenarioSpawnTypeEnum 

---@alias EngineTagDataScenarioSpawnType 
---| EngineTagDataScenarioSpawnTypeNone
---| EngineTagDataScenarioSpawnTypeCtf
---| EngineTagDataScenarioSpawnTypeSlayer
---| EngineTagDataScenarioSpawnTypeOddball
---| EngineTagDataScenarioSpawnTypeKingOfTheHill
---| EngineTagDataScenarioSpawnTypeRace
---| EngineTagDataScenarioSpawnTypeTerminator
---| EngineTagDataScenarioSpawnTypeStub
---| EngineTagDataScenarioSpawnTypeIgnored1
---| EngineTagDataScenarioSpawnTypeIgnored2
---| EngineTagDataScenarioSpawnTypeIgnored3
---| EngineTagDataScenarioSpawnTypeIgnored4
---| EngineTagDataScenarioSpawnTypeAllGames
---| EngineTagDataScenarioSpawnTypeAllExceptCtf
---| EngineTagDataScenarioSpawnTypeAllExceptRaceAndCtf

---@class EngineTagDataScenarioSpawnTypeTable 
---@field eNone EngineTagDataScenarioSpawnTypeNone
---@field eCtf EngineTagDataScenarioSpawnTypeCtf
---@field eSlayer EngineTagDataScenarioSpawnTypeSlayer
---@field eOddball EngineTagDataScenarioSpawnTypeOddball
---@field eKingOfTheHill EngineTagDataScenarioSpawnTypeKingOfTheHill
---@field eRace EngineTagDataScenarioSpawnTypeRace
---@field eTerminator EngineTagDataScenarioSpawnTypeTerminator
---@field eStub EngineTagDataScenarioSpawnTypeStub
---@field eIgnored1 EngineTagDataScenarioSpawnTypeIgnored1
---@field eIgnored2 EngineTagDataScenarioSpawnTypeIgnored2
---@field eIgnored3 EngineTagDataScenarioSpawnTypeIgnored3
---@field eIgnored4 EngineTagDataScenarioSpawnTypeIgnored4
---@field eAllGames EngineTagDataScenarioSpawnTypeAllGames
---@field eAllExceptCtf EngineTagDataScenarioSpawnTypeAllExceptCtf
---@field eAllExceptRaceAndCtf EngineTagDataScenarioSpawnTypeAllExceptRaceAndCtf
Engine.tag.scenarioSpawnType = {} 

---@class EngineTagDataScenarioNetgameFlagTypeEnum : Enum 

---@class EngineTagDataScenarioNetgameFlagTypeCtfFlag : EngineTagDataScenarioNetgameFlagTypeEnum 
---@class EngineTagDataScenarioNetgameFlagTypeCtfVehicle : EngineTagDataScenarioNetgameFlagTypeEnum 
---@class EngineTagDataScenarioNetgameFlagTypeOddballBallSpawn : EngineTagDataScenarioNetgameFlagTypeEnum 
---@class EngineTagDataScenarioNetgameFlagTypeRaceTrack : EngineTagDataScenarioNetgameFlagTypeEnum 
---@class EngineTagDataScenarioNetgameFlagTypeRaceVehicle : EngineTagDataScenarioNetgameFlagTypeEnum 
---@class EngineTagDataScenarioNetgameFlagTypeVegasBank : EngineTagDataScenarioNetgameFlagTypeEnum 
---@class EngineTagDataScenarioNetgameFlagTypeTeleportFrom : EngineTagDataScenarioNetgameFlagTypeEnum 
---@class EngineTagDataScenarioNetgameFlagTypeTeleportTo : EngineTagDataScenarioNetgameFlagTypeEnum 
---@class EngineTagDataScenarioNetgameFlagTypeHillFlag : EngineTagDataScenarioNetgameFlagTypeEnum 

---@alias EngineTagDataScenarioNetgameFlagType 
---| EngineTagDataScenarioNetgameFlagTypeCtfFlag
---| EngineTagDataScenarioNetgameFlagTypeCtfVehicle
---| EngineTagDataScenarioNetgameFlagTypeOddballBallSpawn
---| EngineTagDataScenarioNetgameFlagTypeRaceTrack
---| EngineTagDataScenarioNetgameFlagTypeRaceVehicle
---| EngineTagDataScenarioNetgameFlagTypeVegasBank
---| EngineTagDataScenarioNetgameFlagTypeTeleportFrom
---| EngineTagDataScenarioNetgameFlagTypeTeleportTo
---| EngineTagDataScenarioNetgameFlagTypeHillFlag

---@class EngineTagDataScenarioNetgameFlagTypeTable 
---@field peCtfFlag EngineTagDataScenarioNetgameFlagTypeCtfFlag
---@field peCtfVehicle EngineTagDataScenarioNetgameFlagTypeCtfVehicle
---@field peOddballBallSpawn EngineTagDataScenarioNetgameFlagTypeOddballBallSpawn
---@field peRaceTrack EngineTagDataScenarioNetgameFlagTypeRaceTrack
---@field peRaceVehicle EngineTagDataScenarioNetgameFlagTypeRaceVehicle
---@field peVegasBank EngineTagDataScenarioNetgameFlagTypeVegasBank
---@field peTeleportFrom EngineTagDataScenarioNetgameFlagTypeTeleportFrom
---@field peTeleportTo EngineTagDataScenarioNetgameFlagTypeTeleportTo
---@field peHillFlag EngineTagDataScenarioNetgameFlagTypeHillFlag
Engine.tag.scenarioNetgameFlagType = {} 

---@class EngineTagDataScenarioReturnStateEnum : Enum 

---@class EngineTagDataScenarioReturnStateNone : EngineTagDataScenarioReturnStateEnum 
---@class EngineTagDataScenarioReturnStateSleeping : EngineTagDataScenarioReturnStateEnum 
---@class EngineTagDataScenarioReturnStateAlert : EngineTagDataScenarioReturnStateEnum 
---@class EngineTagDataScenarioReturnStateMovingRepeatSamePosition : EngineTagDataScenarioReturnStateEnum 
---@class EngineTagDataScenarioReturnStateMovingLoop : EngineTagDataScenarioReturnStateEnum 
---@class EngineTagDataScenarioReturnStateMovingLoopBackAndForth : EngineTagDataScenarioReturnStateEnum 
---@class EngineTagDataScenarioReturnStateMovingLoopRandomly : EngineTagDataScenarioReturnStateEnum 
---@class EngineTagDataScenarioReturnStateMovingRandomly : EngineTagDataScenarioReturnStateEnum 
---@class EngineTagDataScenarioReturnStateGuarding : EngineTagDataScenarioReturnStateEnum 
---@class EngineTagDataScenarioReturnStateGuardingAtGuardPosition : EngineTagDataScenarioReturnStateEnum 
---@class EngineTagDataScenarioReturnStateSearching : EngineTagDataScenarioReturnStateEnum 
---@class EngineTagDataScenarioReturnStateFleeing : EngineTagDataScenarioReturnStateEnum 

---@alias EngineTagDataScenarioReturnState 
---| EngineTagDataScenarioReturnStateNone
---| EngineTagDataScenarioReturnStateSleeping
---| EngineTagDataScenarioReturnStateAlert
---| EngineTagDataScenarioReturnStateMovingRepeatSamePosition
---| EngineTagDataScenarioReturnStateMovingLoop
---| EngineTagDataScenarioReturnStateMovingLoopBackAndForth
---| EngineTagDataScenarioReturnStateMovingLoopRandomly
---| EngineTagDataScenarioReturnStateMovingRandomly
---| EngineTagDataScenarioReturnStateGuarding
---| EngineTagDataScenarioReturnStateGuardingAtGuardPosition
---| EngineTagDataScenarioReturnStateSearching
---| EngineTagDataScenarioReturnStateFleeing

---@class EngineTagDataScenarioReturnStateTable 
---@field eNone EngineTagDataScenarioReturnStateNone
---@field eSleeping EngineTagDataScenarioReturnStateSleeping
---@field eAlert EngineTagDataScenarioReturnStateAlert
---@field eMovingRepeatSamePosition EngineTagDataScenarioReturnStateMovingRepeatSamePosition
---@field eMovingLoop EngineTagDataScenarioReturnStateMovingLoop
---@field eMovingLoopBackAndForth EngineTagDataScenarioReturnStateMovingLoopBackAndForth
---@field eMovingLoopRandomly EngineTagDataScenarioReturnStateMovingLoopRandomly
---@field eMovingRandomly EngineTagDataScenarioReturnStateMovingRandomly
---@field eGuarding EngineTagDataScenarioReturnStateGuarding
---@field eGuardingAtGuardPosition EngineTagDataScenarioReturnStateGuardingAtGuardPosition
---@field eSearching EngineTagDataScenarioReturnStateSearching
---@field eFleeing EngineTagDataScenarioReturnStateFleeing
Engine.tag.scenarioReturnState = {} 

---@class EngineTagDataScenarioUniqueLeaderTypeEnum : Enum 

---@class EngineTagDataScenarioUniqueLeaderTypeNormal : EngineTagDataScenarioUniqueLeaderTypeEnum 
---@class EngineTagDataScenarioUniqueLeaderTypeNone : EngineTagDataScenarioUniqueLeaderTypeEnum 
---@class EngineTagDataScenarioUniqueLeaderTypeRandom : EngineTagDataScenarioUniqueLeaderTypeEnum 
---@class EngineTagDataScenarioUniqueLeaderTypeSgtJohnson : EngineTagDataScenarioUniqueLeaderTypeEnum 
---@class EngineTagDataScenarioUniqueLeaderTypeSgtLehto : EngineTagDataScenarioUniqueLeaderTypeEnum 

---@alias EngineTagDataScenarioUniqueLeaderType 
---| EngineTagDataScenarioUniqueLeaderTypeNormal
---| EngineTagDataScenarioUniqueLeaderTypeNone
---| EngineTagDataScenarioUniqueLeaderTypeRandom
---| EngineTagDataScenarioUniqueLeaderTypeSgtJohnson
---| EngineTagDataScenarioUniqueLeaderTypeSgtLehto

---@class EngineTagDataScenarioUniqueLeaderTypeTable 
---@field peNormal EngineTagDataScenarioUniqueLeaderTypeNormal
---@field peNone EngineTagDataScenarioUniqueLeaderTypeNone
---@field peRandom EngineTagDataScenarioUniqueLeaderTypeRandom
---@field peSgtJohnson EngineTagDataScenarioUniqueLeaderTypeSgtJohnson
---@field peSgtLehto EngineTagDataScenarioUniqueLeaderTypeSgtLehto
Engine.tag.scenarioUniqueLeaderType = {} 

---@class EngineTagDataScenarioMajorUpgradeEnum : Enum 

---@class EngineTagDataScenarioMajorUpgradeNormal : EngineTagDataScenarioMajorUpgradeEnum 
---@class EngineTagDataScenarioMajorUpgradeFew : EngineTagDataScenarioMajorUpgradeEnum 
---@class EngineTagDataScenarioMajorUpgradeMany : EngineTagDataScenarioMajorUpgradeEnum 
---@class EngineTagDataScenarioMajorUpgradeNone : EngineTagDataScenarioMajorUpgradeEnum 
---@class EngineTagDataScenarioMajorUpgradeAll : EngineTagDataScenarioMajorUpgradeEnum 

---@alias EngineTagDataScenarioMajorUpgrade 
---| EngineTagDataScenarioMajorUpgradeNormal
---| EngineTagDataScenarioMajorUpgradeFew
---| EngineTagDataScenarioMajorUpgradeMany
---| EngineTagDataScenarioMajorUpgradeNone
---| EngineTagDataScenarioMajorUpgradeAll

---@class EngineTagDataScenarioMajorUpgradeTable 
---@field eNormal EngineTagDataScenarioMajorUpgradeNormal
---@field eFew EngineTagDataScenarioMajorUpgradeFew
---@field eMany EngineTagDataScenarioMajorUpgradeMany
---@field eNone EngineTagDataScenarioMajorUpgradeNone
---@field eAll EngineTagDataScenarioMajorUpgradeAll
Engine.tag.scenarioMajorUpgrade = {} 

---@class EngineTagDataScenarioChangeAttackingDefendingStateWhenEnum : Enum 

---@class EngineTagDataScenarioChangeAttackingDefendingStateWhenNever : EngineTagDataScenarioChangeAttackingDefendingStateWhenEnum 
---@class EngineTagDataScenarioChangeAttackingDefendingStateWhen_75Strength : EngineTagDataScenarioChangeAttackingDefendingStateWhenEnum 
---@class EngineTagDataScenarioChangeAttackingDefendingStateWhen_50Strength : EngineTagDataScenarioChangeAttackingDefendingStateWhenEnum 
---@class EngineTagDataScenarioChangeAttackingDefendingStateWhen_25Strength : EngineTagDataScenarioChangeAttackingDefendingStateWhenEnum 
---@class EngineTagDataScenarioChangeAttackingDefendingStateWhenAnybodyDead : EngineTagDataScenarioChangeAttackingDefendingStateWhenEnum 
---@class EngineTagDataScenarioChangeAttackingDefendingStateWhen_25Dead : EngineTagDataScenarioChangeAttackingDefendingStateWhenEnum 
---@class EngineTagDataScenarioChangeAttackingDefendingStateWhen_50Dead : EngineTagDataScenarioChangeAttackingDefendingStateWhenEnum 
---@class EngineTagDataScenarioChangeAttackingDefendingStateWhen_75Dead : EngineTagDataScenarioChangeAttackingDefendingStateWhenEnum 
---@class EngineTagDataScenarioChangeAttackingDefendingStateWhenAllButOneDead : EngineTagDataScenarioChangeAttackingDefendingStateWhenEnum 
---@class EngineTagDataScenarioChangeAttackingDefendingStateWhenAllDead : EngineTagDataScenarioChangeAttackingDefendingStateWhenEnum 

---@alias EngineTagDataScenarioChangeAttackingDefendingStateWhen 
---| EngineTagDataScenarioChangeAttackingDefendingStateWhenNever
---| EngineTagDataScenarioChangeAttackingDefendingStateWhen_75Strength
---| EngineTagDataScenarioChangeAttackingDefendingStateWhen_50Strength
---| EngineTagDataScenarioChangeAttackingDefendingStateWhen_25Strength
---| EngineTagDataScenarioChangeAttackingDefendingStateWhenAnybodyDead
---| EngineTagDataScenarioChangeAttackingDefendingStateWhen_25Dead
---| EngineTagDataScenarioChangeAttackingDefendingStateWhen_50Dead
---| EngineTagDataScenarioChangeAttackingDefendingStateWhen_75Dead
---| EngineTagDataScenarioChangeAttackingDefendingStateWhenAllButOneDead
---| EngineTagDataScenarioChangeAttackingDefendingStateWhenAllDead

---@class EngineTagDataScenarioChangeAttackingDefendingStateWhenTable 
---@field whenNever EngineTagDataScenarioChangeAttackingDefendingStateWhenNever
---@field when_75Strength EngineTagDataScenarioChangeAttackingDefendingStateWhen_75Strength
---@field when_50Strength EngineTagDataScenarioChangeAttackingDefendingStateWhen_50Strength
---@field when_25Strength EngineTagDataScenarioChangeAttackingDefendingStateWhen_25Strength
---@field whenAnybodyDead EngineTagDataScenarioChangeAttackingDefendingStateWhenAnybodyDead
---@field when_25Dead EngineTagDataScenarioChangeAttackingDefendingStateWhen_25Dead
---@field when_50Dead EngineTagDataScenarioChangeAttackingDefendingStateWhen_50Dead
---@field when_75Dead EngineTagDataScenarioChangeAttackingDefendingStateWhen_75Dead
---@field whenAllButOneDead EngineTagDataScenarioChangeAttackingDefendingStateWhenAllButOneDead
---@field whenAllDead EngineTagDataScenarioChangeAttackingDefendingStateWhenAllDead
Engine.tag.scenarioChangeAttackingDefendingStateWhen = {} 

---@class EngineTagDataScenarioGroupIndexEnum : Enum 

---@class EngineTagDataScenarioGroupIndexA : EngineTagDataScenarioGroupIndexEnum 
---@class EngineTagDataScenarioGroupIndexB : EngineTagDataScenarioGroupIndexEnum 
---@class EngineTagDataScenarioGroupIndexC : EngineTagDataScenarioGroupIndexEnum 
---@class EngineTagDataScenarioGroupIndexD : EngineTagDataScenarioGroupIndexEnum 
---@class EngineTagDataScenarioGroupIndexE : EngineTagDataScenarioGroupIndexEnum 
---@class EngineTagDataScenarioGroupIndexF : EngineTagDataScenarioGroupIndexEnum 
---@class EngineTagDataScenarioGroupIndexG : EngineTagDataScenarioGroupIndexEnum 
---@class EngineTagDataScenarioGroupIndexH : EngineTagDataScenarioGroupIndexEnum 
---@class EngineTagDataScenarioGroupIndexI : EngineTagDataScenarioGroupIndexEnum 
---@class EngineTagDataScenarioGroupIndexJ : EngineTagDataScenarioGroupIndexEnum 
---@class EngineTagDataScenarioGroupIndexK : EngineTagDataScenarioGroupIndexEnum 
---@class EngineTagDataScenarioGroupIndexL : EngineTagDataScenarioGroupIndexEnum 
---@class EngineTagDataScenarioGroupIndexM : EngineTagDataScenarioGroupIndexEnum 
---@class EngineTagDataScenarioGroupIndexN : EngineTagDataScenarioGroupIndexEnum 
---@class EngineTagDataScenarioGroupIndexO : EngineTagDataScenarioGroupIndexEnum 
---@class EngineTagDataScenarioGroupIndexP : EngineTagDataScenarioGroupIndexEnum 
---@class EngineTagDataScenarioGroupIndexQ : EngineTagDataScenarioGroupIndexEnum 
---@class EngineTagDataScenarioGroupIndexR : EngineTagDataScenarioGroupIndexEnum 
---@class EngineTagDataScenarioGroupIndexS : EngineTagDataScenarioGroupIndexEnum 
---@class EngineTagDataScenarioGroupIndexT : EngineTagDataScenarioGroupIndexEnum 
---@class EngineTagDataScenarioGroupIndexU : EngineTagDataScenarioGroupIndexEnum 
---@class EngineTagDataScenarioGroupIndexV : EngineTagDataScenarioGroupIndexEnum 
---@class EngineTagDataScenarioGroupIndexW : EngineTagDataScenarioGroupIndexEnum 
---@class EngineTagDataScenarioGroupIndexX : EngineTagDataScenarioGroupIndexEnum 
---@class EngineTagDataScenarioGroupIndexY : EngineTagDataScenarioGroupIndexEnum 
---@class EngineTagDataScenarioGroupIndexZ : EngineTagDataScenarioGroupIndexEnum 

---@alias EngineTagDataScenarioGroupIndex 
---| EngineTagDataScenarioGroupIndexA
---| EngineTagDataScenarioGroupIndexB
---| EngineTagDataScenarioGroupIndexC
---| EngineTagDataScenarioGroupIndexD
---| EngineTagDataScenarioGroupIndexE
---| EngineTagDataScenarioGroupIndexF
---| EngineTagDataScenarioGroupIndexG
---| EngineTagDataScenarioGroupIndexH
---| EngineTagDataScenarioGroupIndexI
---| EngineTagDataScenarioGroupIndexJ
---| EngineTagDataScenarioGroupIndexK
---| EngineTagDataScenarioGroupIndexL
---| EngineTagDataScenarioGroupIndexM
---| EngineTagDataScenarioGroupIndexN
---| EngineTagDataScenarioGroupIndexO
---| EngineTagDataScenarioGroupIndexP
---| EngineTagDataScenarioGroupIndexQ
---| EngineTagDataScenarioGroupIndexR
---| EngineTagDataScenarioGroupIndexS
---| EngineTagDataScenarioGroupIndexT
---| EngineTagDataScenarioGroupIndexU
---| EngineTagDataScenarioGroupIndexV
---| EngineTagDataScenarioGroupIndexW
---| EngineTagDataScenarioGroupIndexX
---| EngineTagDataScenarioGroupIndexY
---| EngineTagDataScenarioGroupIndexZ

---@class EngineTagDataScenarioGroupIndexTable 
---@field xA EngineTagDataScenarioGroupIndexA
---@field xB EngineTagDataScenarioGroupIndexB
---@field xC EngineTagDataScenarioGroupIndexC
---@field xD EngineTagDataScenarioGroupIndexD
---@field xE EngineTagDataScenarioGroupIndexE
---@field xF EngineTagDataScenarioGroupIndexF
---@field xG EngineTagDataScenarioGroupIndexG
---@field xH EngineTagDataScenarioGroupIndexH
---@field xI EngineTagDataScenarioGroupIndexI
---@field xJ EngineTagDataScenarioGroupIndexJ
---@field xK EngineTagDataScenarioGroupIndexK
---@field xL EngineTagDataScenarioGroupIndexL
---@field xM EngineTagDataScenarioGroupIndexM
---@field xN EngineTagDataScenarioGroupIndexN
---@field xO EngineTagDataScenarioGroupIndexO
---@field xP EngineTagDataScenarioGroupIndexP
---@field xQ EngineTagDataScenarioGroupIndexQ
---@field xR EngineTagDataScenarioGroupIndexR
---@field xS EngineTagDataScenarioGroupIndexS
---@field xT EngineTagDataScenarioGroupIndexT
---@field xU EngineTagDataScenarioGroupIndexU
---@field xV EngineTagDataScenarioGroupIndexV
---@field xW EngineTagDataScenarioGroupIndexW
---@field xX EngineTagDataScenarioGroupIndexX
---@field xY EngineTagDataScenarioGroupIndexY
---@field xZ EngineTagDataScenarioGroupIndexZ
Engine.tag.scenarioGroupIndex = {} 

---@class EngineTagDataScenarioTeamIndexEnum : Enum 

---@class EngineTagDataScenarioTeamIndexDefaultByUnit : EngineTagDataScenarioTeamIndexEnum 
---@class EngineTagDataScenarioTeamIndexPlayer : EngineTagDataScenarioTeamIndexEnum 
---@class EngineTagDataScenarioTeamIndexHuman : EngineTagDataScenarioTeamIndexEnum 
---@class EngineTagDataScenarioTeamIndexCovenant : EngineTagDataScenarioTeamIndexEnum 
---@class EngineTagDataScenarioTeamIndexFlood : EngineTagDataScenarioTeamIndexEnum 
---@class EngineTagDataScenarioTeamIndexSentinel : EngineTagDataScenarioTeamIndexEnum 
---@class EngineTagDataScenarioTeamIndexUnused6 : EngineTagDataScenarioTeamIndexEnum 
---@class EngineTagDataScenarioTeamIndexUnused7 : EngineTagDataScenarioTeamIndexEnum 
---@class EngineTagDataScenarioTeamIndexUnused8 : EngineTagDataScenarioTeamIndexEnum 
---@class EngineTagDataScenarioTeamIndexUnused9 : EngineTagDataScenarioTeamIndexEnum 

---@alias EngineTagDataScenarioTeamIndex 
---| EngineTagDataScenarioTeamIndexDefaultByUnit
---| EngineTagDataScenarioTeamIndexPlayer
---| EngineTagDataScenarioTeamIndexHuman
---| EngineTagDataScenarioTeamIndexCovenant
---| EngineTagDataScenarioTeamIndexFlood
---| EngineTagDataScenarioTeamIndexSentinel
---| EngineTagDataScenarioTeamIndexUnused6
---| EngineTagDataScenarioTeamIndexUnused7
---| EngineTagDataScenarioTeamIndexUnused8
---| EngineTagDataScenarioTeamIndexUnused9

---@class EngineTagDataScenarioTeamIndexTable 
---@field xDefaultByUnit EngineTagDataScenarioTeamIndexDefaultByUnit
---@field xPlayer EngineTagDataScenarioTeamIndexPlayer
---@field xHuman EngineTagDataScenarioTeamIndexHuman
---@field xCovenant EngineTagDataScenarioTeamIndexCovenant
---@field xFlood EngineTagDataScenarioTeamIndexFlood
---@field xSentinel EngineTagDataScenarioTeamIndexSentinel
---@field xUnused6 EngineTagDataScenarioTeamIndexUnused6
---@field xUnused7 EngineTagDataScenarioTeamIndexUnused7
---@field xUnused8 EngineTagDataScenarioTeamIndexUnused8
---@field xUnused9 EngineTagDataScenarioTeamIndexUnused9
Engine.tag.scenarioTeamIndex = {} 

---@class EngineTagDataScenarioSearchBehaviorEnum : Enum 

---@class EngineTagDataScenarioSearchBehaviorNormal : EngineTagDataScenarioSearchBehaviorEnum 
---@class EngineTagDataScenarioSearchBehaviorNever : EngineTagDataScenarioSearchBehaviorEnum 
---@class EngineTagDataScenarioSearchBehaviorTenacious : EngineTagDataScenarioSearchBehaviorEnum 

---@alias EngineTagDataScenarioSearchBehavior 
---| EngineTagDataScenarioSearchBehaviorNormal
---| EngineTagDataScenarioSearchBehaviorNever
---| EngineTagDataScenarioSearchBehaviorTenacious

---@class EngineTagDataScenarioSearchBehaviorTable 
---@field rNormal EngineTagDataScenarioSearchBehaviorNormal
---@field rNever EngineTagDataScenarioSearchBehaviorNever
---@field rTenacious EngineTagDataScenarioSearchBehaviorTenacious
Engine.tag.scenarioSearchBehavior = {} 

---@class EngineTagDataScenarioAtomTypeEnum : Enum 

---@class EngineTagDataScenarioAtomTypePause : EngineTagDataScenarioAtomTypeEnum 
---@class EngineTagDataScenarioAtomTypeGoTo : EngineTagDataScenarioAtomTypeEnum 
---@class EngineTagDataScenarioAtomTypeGoToAndFace : EngineTagDataScenarioAtomTypeEnum 
---@class EngineTagDataScenarioAtomTypeMoveInDirection : EngineTagDataScenarioAtomTypeEnum 
---@class EngineTagDataScenarioAtomTypeLook : EngineTagDataScenarioAtomTypeEnum 
---@class EngineTagDataScenarioAtomTypeAnimationMode : EngineTagDataScenarioAtomTypeEnum 
---@class EngineTagDataScenarioAtomTypeCrouch : EngineTagDataScenarioAtomTypeEnum 
---@class EngineTagDataScenarioAtomTypeShoot : EngineTagDataScenarioAtomTypeEnum 
---@class EngineTagDataScenarioAtomTypeGrenade : EngineTagDataScenarioAtomTypeEnum 
---@class EngineTagDataScenarioAtomTypeVehicle : EngineTagDataScenarioAtomTypeEnum 
---@class EngineTagDataScenarioAtomTypeRunningJump : EngineTagDataScenarioAtomTypeEnum 
---@class EngineTagDataScenarioAtomTypeTargetedJump : EngineTagDataScenarioAtomTypeEnum 
---@class EngineTagDataScenarioAtomTypeScript : EngineTagDataScenarioAtomTypeEnum 
---@class EngineTagDataScenarioAtomTypeAnimate : EngineTagDataScenarioAtomTypeEnum 
---@class EngineTagDataScenarioAtomTypeRecording : EngineTagDataScenarioAtomTypeEnum 
---@class EngineTagDataScenarioAtomTypeAction : EngineTagDataScenarioAtomTypeEnum 
---@class EngineTagDataScenarioAtomTypeVocalize : EngineTagDataScenarioAtomTypeEnum 
---@class EngineTagDataScenarioAtomTypeTargeting : EngineTagDataScenarioAtomTypeEnum 
---@class EngineTagDataScenarioAtomTypeInitiative : EngineTagDataScenarioAtomTypeEnum 
---@class EngineTagDataScenarioAtomTypeWait : EngineTagDataScenarioAtomTypeEnum 
---@class EngineTagDataScenarioAtomTypeLoop : EngineTagDataScenarioAtomTypeEnum 
---@class EngineTagDataScenarioAtomTypeDie : EngineTagDataScenarioAtomTypeEnum 
---@class EngineTagDataScenarioAtomTypeMoveImmediate : EngineTagDataScenarioAtomTypeEnum 
---@class EngineTagDataScenarioAtomTypeLookRandom : EngineTagDataScenarioAtomTypeEnum 
---@class EngineTagDataScenarioAtomTypeLookPlayer : EngineTagDataScenarioAtomTypeEnum 
---@class EngineTagDataScenarioAtomTypeLookObject : EngineTagDataScenarioAtomTypeEnum 
---@class EngineTagDataScenarioAtomTypeSetRadius : EngineTagDataScenarioAtomTypeEnum 
---@class EngineTagDataScenarioAtomTypeTeleport : EngineTagDataScenarioAtomTypeEnum 

---@alias EngineTagDataScenarioAtomType 
---| EngineTagDataScenarioAtomTypePause
---| EngineTagDataScenarioAtomTypeGoTo
---| EngineTagDataScenarioAtomTypeGoToAndFace
---| EngineTagDataScenarioAtomTypeMoveInDirection
---| EngineTagDataScenarioAtomTypeLook
---| EngineTagDataScenarioAtomTypeAnimationMode
---| EngineTagDataScenarioAtomTypeCrouch
---| EngineTagDataScenarioAtomTypeShoot
---| EngineTagDataScenarioAtomTypeGrenade
---| EngineTagDataScenarioAtomTypeVehicle
---| EngineTagDataScenarioAtomTypeRunningJump
---| EngineTagDataScenarioAtomTypeTargetedJump
---| EngineTagDataScenarioAtomTypeScript
---| EngineTagDataScenarioAtomTypeAnimate
---| EngineTagDataScenarioAtomTypeRecording
---| EngineTagDataScenarioAtomTypeAction
---| EngineTagDataScenarioAtomTypeVocalize
---| EngineTagDataScenarioAtomTypeTargeting
---| EngineTagDataScenarioAtomTypeInitiative
---| EngineTagDataScenarioAtomTypeWait
---| EngineTagDataScenarioAtomTypeLoop
---| EngineTagDataScenarioAtomTypeDie
---| EngineTagDataScenarioAtomTypeMoveImmediate
---| EngineTagDataScenarioAtomTypeLookRandom
---| EngineTagDataScenarioAtomTypeLookPlayer
---| EngineTagDataScenarioAtomTypeLookObject
---| EngineTagDataScenarioAtomTypeSetRadius
---| EngineTagDataScenarioAtomTypeTeleport

---@class EngineTagDataScenarioAtomTypeTable 
---@field ePause EngineTagDataScenarioAtomTypePause
---@field eGoTo EngineTagDataScenarioAtomTypeGoTo
---@field eGoToAndFace EngineTagDataScenarioAtomTypeGoToAndFace
---@field eMoveInDirection EngineTagDataScenarioAtomTypeMoveInDirection
---@field eLook EngineTagDataScenarioAtomTypeLook
---@field eAnimationMode EngineTagDataScenarioAtomTypeAnimationMode
---@field eCrouch EngineTagDataScenarioAtomTypeCrouch
---@field eShoot EngineTagDataScenarioAtomTypeShoot
---@field eGrenade EngineTagDataScenarioAtomTypeGrenade
---@field eVehicle EngineTagDataScenarioAtomTypeVehicle
---@field eRunningJump EngineTagDataScenarioAtomTypeRunningJump
---@field eTargetedJump EngineTagDataScenarioAtomTypeTargetedJump
---@field eScript EngineTagDataScenarioAtomTypeScript
---@field eAnimate EngineTagDataScenarioAtomTypeAnimate
---@field eRecording EngineTagDataScenarioAtomTypeRecording
---@field eAction EngineTagDataScenarioAtomTypeAction
---@field eVocalize EngineTagDataScenarioAtomTypeVocalize
---@field eTargeting EngineTagDataScenarioAtomTypeTargeting
---@field eInitiative EngineTagDataScenarioAtomTypeInitiative
---@field eWait EngineTagDataScenarioAtomTypeWait
---@field eLoop EngineTagDataScenarioAtomTypeLoop
---@field eDie EngineTagDataScenarioAtomTypeDie
---@field eMoveImmediate EngineTagDataScenarioAtomTypeMoveImmediate
---@field eLookRandom EngineTagDataScenarioAtomTypeLookRandom
---@field eLookPlayer EngineTagDataScenarioAtomTypeLookPlayer
---@field eLookObject EngineTagDataScenarioAtomTypeLookObject
---@field eSetRadius EngineTagDataScenarioAtomTypeSetRadius
---@field eTeleport EngineTagDataScenarioAtomTypeTeleport
Engine.tag.scenarioAtomType = {} 

---@class EngineTagDataScenarioSelectionTypeEnum : Enum 

---@class EngineTagDataScenarioSelectionTypeFriendlyActor : EngineTagDataScenarioSelectionTypeEnum 
---@class EngineTagDataScenarioSelectionTypeDisembodied : EngineTagDataScenarioSelectionTypeEnum 
---@class EngineTagDataScenarioSelectionTypeInPlayerSVehicle : EngineTagDataScenarioSelectionTypeEnum 
---@class EngineTagDataScenarioSelectionTypeNotInAVehicle : EngineTagDataScenarioSelectionTypeEnum 
---@class EngineTagDataScenarioSelectionTypePreferSergeant : EngineTagDataScenarioSelectionTypeEnum 
---@class EngineTagDataScenarioSelectionTypeAnyActor : EngineTagDataScenarioSelectionTypeEnum 
---@class EngineTagDataScenarioSelectionTypeRadioUnit : EngineTagDataScenarioSelectionTypeEnum 
---@class EngineTagDataScenarioSelectionTypeRadioSergeant : EngineTagDataScenarioSelectionTypeEnum 

---@alias EngineTagDataScenarioSelectionType 
---| EngineTagDataScenarioSelectionTypeFriendlyActor
---| EngineTagDataScenarioSelectionTypeDisembodied
---| EngineTagDataScenarioSelectionTypeInPlayerSVehicle
---| EngineTagDataScenarioSelectionTypeNotInAVehicle
---| EngineTagDataScenarioSelectionTypePreferSergeant
---| EngineTagDataScenarioSelectionTypeAnyActor
---| EngineTagDataScenarioSelectionTypeRadioUnit
---| EngineTagDataScenarioSelectionTypeRadioSergeant

---@class EngineTagDataScenarioSelectionTypeTable 
---@field eFriendlyActor EngineTagDataScenarioSelectionTypeFriendlyActor
---@field eDisembodied EngineTagDataScenarioSelectionTypeDisembodied
---@field eInPlayerSVehicle EngineTagDataScenarioSelectionTypeInPlayerSVehicle
---@field eNotInAVehicle EngineTagDataScenarioSelectionTypeNotInAVehicle
---@field ePreferSergeant EngineTagDataScenarioSelectionTypePreferSergeant
---@field eAnyActor EngineTagDataScenarioSelectionTypeAnyActor
---@field eRadioUnit EngineTagDataScenarioSelectionTypeRadioUnit
---@field eRadioSergeant EngineTagDataScenarioSelectionTypeRadioSergeant
Engine.tag.scenarioSelectionType = {} 

---@class EngineTagDataScenarioAddresseeEnum : Enum 

---@class EngineTagDataScenarioAddresseeNone : EngineTagDataScenarioAddresseeEnum 
---@class EngineTagDataScenarioAddresseePlayer : EngineTagDataScenarioAddresseeEnum 
---@class EngineTagDataScenarioAddresseeParticipant : EngineTagDataScenarioAddresseeEnum 

---@alias EngineTagDataScenarioAddressee 
---| EngineTagDataScenarioAddresseeNone
---| EngineTagDataScenarioAddresseePlayer
---| EngineTagDataScenarioAddresseeParticipant

---@class EngineTagDataScenarioAddresseeTable 
---@field none EngineTagDataScenarioAddresseeNone
---@field player EngineTagDataScenarioAddresseePlayer
---@field participant EngineTagDataScenarioAddresseeParticipant
Engine.tag.scenarioAddressee = {} 

---@class EngineTagDataScenarioScriptTypeEnum : Enum 

---@class EngineTagDataScenarioScriptTypeStartup : EngineTagDataScenarioScriptTypeEnum 
---@class EngineTagDataScenarioScriptTypeDormant : EngineTagDataScenarioScriptTypeEnum 
---@class EngineTagDataScenarioScriptTypeContinuous : EngineTagDataScenarioScriptTypeEnum 
---@class EngineTagDataScenarioScriptTypeStatic : EngineTagDataScenarioScriptTypeEnum 
---@class EngineTagDataScenarioScriptTypeStub : EngineTagDataScenarioScriptTypeEnum 

---@alias EngineTagDataScenarioScriptType 
---| EngineTagDataScenarioScriptTypeStartup
---| EngineTagDataScenarioScriptTypeDormant
---| EngineTagDataScenarioScriptTypeContinuous
---| EngineTagDataScenarioScriptTypeStatic
---| EngineTagDataScenarioScriptTypeStub

---@class EngineTagDataScenarioScriptTypeTable 
---@field eStartup EngineTagDataScenarioScriptTypeStartup
---@field eDormant EngineTagDataScenarioScriptTypeDormant
---@field eContinuous EngineTagDataScenarioScriptTypeContinuous
---@field eStatic EngineTagDataScenarioScriptTypeStatic
---@field eStub EngineTagDataScenarioScriptTypeStub
Engine.tag.scenarioScriptType = {} 

---@class EngineTagDataScenarioScriptValueTypeEnum : Enum 

---@class EngineTagDataScenarioScriptValueTypeUnparsed : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeSpecialForm : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeFunctionName : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypePassthrough : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeVoid : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeBoolean : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeReal : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeShort : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeLong : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeString : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeScript : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeTriggerVolume : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeCutsceneFlag : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeCutsceneCameraPoint : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeCutsceneTitle : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeCutsceneRecording : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeDeviceGroup : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeAi : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeAiCommandList : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeStartingProfile : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeConversation : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeNavpoint : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeHudMessage : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeObjectList : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeSound : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeEffect : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeDamage : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeLoopingSound : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeAnimationGraph : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeActorVariant : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeDamageEffect : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeObjectDefinition : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeGameDifficulty : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeTeam : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeAiDefaultState : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeActorType : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeHudCorner : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeObject : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeUnit : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeVehicle : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeWeapon : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeDevice : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeScenery : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeObjectName : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeUnitName : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeVehicleName : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeWeaponName : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeDeviceName : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeSceneryName : EngineTagDataScenarioScriptValueTypeEnum 

---@alias EngineTagDataScenarioScriptValueType 
---| EngineTagDataScenarioScriptValueTypeUnparsed
---| EngineTagDataScenarioScriptValueTypeSpecialForm
---| EngineTagDataScenarioScriptValueTypeFunctionName
---| EngineTagDataScenarioScriptValueTypePassthrough
---| EngineTagDataScenarioScriptValueTypeVoid
---| EngineTagDataScenarioScriptValueTypeBoolean
---| EngineTagDataScenarioScriptValueTypeReal
---| EngineTagDataScenarioScriptValueTypeShort
---| EngineTagDataScenarioScriptValueTypeLong
---| EngineTagDataScenarioScriptValueTypeString
---| EngineTagDataScenarioScriptValueTypeScript
---| EngineTagDataScenarioScriptValueTypeTriggerVolume
---| EngineTagDataScenarioScriptValueTypeCutsceneFlag
---| EngineTagDataScenarioScriptValueTypeCutsceneCameraPoint
---| EngineTagDataScenarioScriptValueTypeCutsceneTitle
---| EngineTagDataScenarioScriptValueTypeCutsceneRecording
---| EngineTagDataScenarioScriptValueTypeDeviceGroup
---| EngineTagDataScenarioScriptValueTypeAi
---| EngineTagDataScenarioScriptValueTypeAiCommandList
---| EngineTagDataScenarioScriptValueTypeStartingProfile
---| EngineTagDataScenarioScriptValueTypeConversation
---| EngineTagDataScenarioScriptValueTypeNavpoint
---| EngineTagDataScenarioScriptValueTypeHudMessage
---| EngineTagDataScenarioScriptValueTypeObjectList
---| EngineTagDataScenarioScriptValueTypeSound
---| EngineTagDataScenarioScriptValueTypeEffect
---| EngineTagDataScenarioScriptValueTypeDamage
---| EngineTagDataScenarioScriptValueTypeLoopingSound
---| EngineTagDataScenarioScriptValueTypeAnimationGraph
---| EngineTagDataScenarioScriptValueTypeActorVariant
---| EngineTagDataScenarioScriptValueTypeDamageEffect
---| EngineTagDataScenarioScriptValueTypeObjectDefinition
---| EngineTagDataScenarioScriptValueTypeGameDifficulty
---| EngineTagDataScenarioScriptValueTypeTeam
---| EngineTagDataScenarioScriptValueTypeAiDefaultState
---| EngineTagDataScenarioScriptValueTypeActorType
---| EngineTagDataScenarioScriptValueTypeHudCorner
---| EngineTagDataScenarioScriptValueTypeObject
---| EngineTagDataScenarioScriptValueTypeUnit
---| EngineTagDataScenarioScriptValueTypeVehicle
---| EngineTagDataScenarioScriptValueTypeWeapon
---| EngineTagDataScenarioScriptValueTypeDevice
---| EngineTagDataScenarioScriptValueTypeScenery
---| EngineTagDataScenarioScriptValueTypeObjectName
---| EngineTagDataScenarioScriptValueTypeUnitName
---| EngineTagDataScenarioScriptValueTypeVehicleName
---| EngineTagDataScenarioScriptValueTypeWeaponName
---| EngineTagDataScenarioScriptValueTypeDeviceName
---| EngineTagDataScenarioScriptValueTypeSceneryName

---@class EngineTagDataScenarioScriptValueTypeTable 
---@field peUnparsed EngineTagDataScenarioScriptValueTypeUnparsed
---@field peSpecialForm EngineTagDataScenarioScriptValueTypeSpecialForm
---@field peFunctionName EngineTagDataScenarioScriptValueTypeFunctionName
---@field pePassthrough EngineTagDataScenarioScriptValueTypePassthrough
---@field peVoid EngineTagDataScenarioScriptValueTypeVoid
---@field peBoolean EngineTagDataScenarioScriptValueTypeBoolean
---@field peReal EngineTagDataScenarioScriptValueTypeReal
---@field peShort EngineTagDataScenarioScriptValueTypeShort
---@field peLong EngineTagDataScenarioScriptValueTypeLong
---@field peString EngineTagDataScenarioScriptValueTypeString
---@field peScript EngineTagDataScenarioScriptValueTypeScript
---@field peTriggerVolume EngineTagDataScenarioScriptValueTypeTriggerVolume
---@field peCutsceneFlag EngineTagDataScenarioScriptValueTypeCutsceneFlag
---@field peCutsceneCameraPoint EngineTagDataScenarioScriptValueTypeCutsceneCameraPoint
---@field peCutsceneTitle EngineTagDataScenarioScriptValueTypeCutsceneTitle
---@field peCutsceneRecording EngineTagDataScenarioScriptValueTypeCutsceneRecording
---@field peDeviceGroup EngineTagDataScenarioScriptValueTypeDeviceGroup
---@field peAi EngineTagDataScenarioScriptValueTypeAi
---@field peAiCommandList EngineTagDataScenarioScriptValueTypeAiCommandList
---@field peStartingProfile EngineTagDataScenarioScriptValueTypeStartingProfile
---@field peConversation EngineTagDataScenarioScriptValueTypeConversation
---@field peNavpoint EngineTagDataScenarioScriptValueTypeNavpoint
---@field peHudMessage EngineTagDataScenarioScriptValueTypeHudMessage
---@field peObjectList EngineTagDataScenarioScriptValueTypeObjectList
---@field peSound EngineTagDataScenarioScriptValueTypeSound
---@field peEffect EngineTagDataScenarioScriptValueTypeEffect
---@field peDamage EngineTagDataScenarioScriptValueTypeDamage
---@field peLoopingSound EngineTagDataScenarioScriptValueTypeLoopingSound
---@field peAnimationGraph EngineTagDataScenarioScriptValueTypeAnimationGraph
---@field peActorVariant EngineTagDataScenarioScriptValueTypeActorVariant
---@field peDamageEffect EngineTagDataScenarioScriptValueTypeDamageEffect
---@field peObjectDefinition EngineTagDataScenarioScriptValueTypeObjectDefinition
---@field peGameDifficulty EngineTagDataScenarioScriptValueTypeGameDifficulty
---@field peTeam EngineTagDataScenarioScriptValueTypeTeam
---@field peAiDefaultState EngineTagDataScenarioScriptValueTypeAiDefaultState
---@field peActorType EngineTagDataScenarioScriptValueTypeActorType
---@field peHudCorner EngineTagDataScenarioScriptValueTypeHudCorner
---@field peObject EngineTagDataScenarioScriptValueTypeObject
---@field peUnit EngineTagDataScenarioScriptValueTypeUnit
---@field peVehicle EngineTagDataScenarioScriptValueTypeVehicle
---@field peWeapon EngineTagDataScenarioScriptValueTypeWeapon
---@field peDevice EngineTagDataScenarioScriptValueTypeDevice
---@field peScenery EngineTagDataScenarioScriptValueTypeScenery
---@field peObjectName EngineTagDataScenarioScriptValueTypeObjectName
---@field peUnitName EngineTagDataScenarioScriptValueTypeUnitName
---@field peVehicleName EngineTagDataScenarioScriptValueTypeVehicleName
---@field peWeaponName EngineTagDataScenarioScriptValueTypeWeaponName
---@field peDeviceName EngineTagDataScenarioScriptValueTypeDeviceName
---@field peSceneryName EngineTagDataScenarioScriptValueTypeSceneryName
Engine.tag.scenarioScriptValueType = {} 

---@class EngineTagDataScenarioTextStyleEnum : Enum 

---@class EngineTagDataScenarioTextStylePlain : EngineTagDataScenarioTextStyleEnum 
---@class EngineTagDataScenarioTextStyleBold : EngineTagDataScenarioTextStyleEnum 
---@class EngineTagDataScenarioTextStyleItalic : EngineTagDataScenarioTextStyleEnum 
---@class EngineTagDataScenarioTextStyleCondense : EngineTagDataScenarioTextStyleEnum 
---@class EngineTagDataScenarioTextStyleUnderline : EngineTagDataScenarioTextStyleEnum 

---@alias EngineTagDataScenarioTextStyle 
---| EngineTagDataScenarioTextStylePlain
---| EngineTagDataScenarioTextStyleBold
---| EngineTagDataScenarioTextStyleItalic
---| EngineTagDataScenarioTextStyleCondense
---| EngineTagDataScenarioTextStyleUnderline

---@class EngineTagDataScenarioTextStyleTable 
---@field ePlain EngineTagDataScenarioTextStylePlain
---@field eBold EngineTagDataScenarioTextStyleBold
---@field eItalic EngineTagDataScenarioTextStyleItalic
---@field eCondense EngineTagDataScenarioTextStyleCondense
---@field eUnderline EngineTagDataScenarioTextStyleUnderline
Engine.tag.scenarioTextStyle = {} 

---@class EngineTagDataScenarioJustificationEnum : Enum 

---@class EngineTagDataScenarioJustificationLeft : EngineTagDataScenarioJustificationEnum 
---@class EngineTagDataScenarioJustificationRight : EngineTagDataScenarioJustificationEnum 
---@class EngineTagDataScenarioJustificationCenter : EngineTagDataScenarioJustificationEnum 

---@alias EngineTagDataScenarioJustification 
---| EngineTagDataScenarioJustificationLeft
---| EngineTagDataScenarioJustificationRight
---| EngineTagDataScenarioJustificationCenter

---@class EngineTagDataScenarioJustificationTable 
---@field left EngineTagDataScenarioJustificationLeft
---@field right EngineTagDataScenarioJustificationRight
---@field center EngineTagDataScenarioJustificationCenter
Engine.tag.scenarioJustification = {} 

---@class MetaEngineTagDataScenarioTextFlags 
---@field wrapHorizontally boolean 
---@field wrapVertically boolean 
---@field centerVertically boolean 
---@field bottomJustify boolean 

---@class MetaEngineTagDataScenarioFunctionFlags 
---@field scripted boolean 
---@field invert boolean 
---@field additive boolean 
---@field alwaysActive boolean 

---@class MetaEngineTagDataScenarioSpawnNotPlaced 
---@field automatically boolean 
---@field onEasy boolean 
---@field onNormal boolean 
---@field onHard boolean 
---@field usePlayerAppearance boolean 

---@class MetaEngineTagDataScenarioUnitFlags 
---@field dead boolean 

---@class MetaEngineTagDataScenarioVehicleMultiplayerSpawnFlags 
---@field slayerDefault boolean 
---@field ctfDefault boolean 
---@field kingDefault boolean 
---@field oddballDefault boolean 
---@field unused boolean 
---@field unused1 boolean 
---@field unused2 boolean 
---@field unused3 boolean 
---@field slayerAllowed boolean 
---@field ctfAllowed boolean 
---@field kingAllowed boolean 
---@field oddballAllowed boolean 
---@field unused4 boolean 
---@field unused5 boolean 
---@field unused6 boolean 
---@field unused7 boolean 

---@class MetaEngineTagDataScenarioItemFlags 
---@field initiallyAtRest boolean 
---@field obsolete boolean 
---@field doesAccelerate boolean 

---@class MetaEngineTagDataScenarioDeviceGroupFlags 
---@field canChangeOnlyOnce boolean 

---@class MetaEngineTagDataScenarioDeviceFlags 
---@field initiallyOpen boolean 
---@field initiallyOff boolean 
---@field canChangeOnlyOnce boolean 
---@field positionReversed boolean 
---@field notUsableFromAnySide boolean 

---@class MetaEngineTagDataScenarioMachineFlags 
---@field doesNotOperateAutomatically boolean 
---@field oneSided boolean 
---@field neverAppearsLocked boolean 
---@field openedByMeleeAttack boolean 

---@class MetaEngineTagDataScenarioControlFlags 
---@field usableFromBothSides boolean 

---@class MetaEngineTagDataScenarioNetgameEquipmentFlags 
---@field levitate boolean 

---@class MetaEngineTagDataScenarioStartingEquipmentFlags 
---@field noGrenades boolean 
---@field plasmaGrenadesOnly boolean 
---@field type2GrenadesOnly boolean 
---@field type3GrenadesOnly boolean 

---@class MetaEngineTagDataScenarioActorStartingLocationFlags 
---@field required boolean 

---@class MetaEngineTagDataScenarioSquadFlags 
---@field unused boolean 
---@field neverSearch boolean 
---@field startTimerImmediately boolean 
---@field noTimerDelayForever boolean 
---@field magicSightAfterTimer boolean 
---@field automaticMigration boolean 

---@class MetaEngineTagDataScenarioSquadAttacking 
---@field a boolean 
---@field b boolean 
---@field c boolean 
---@field d boolean 
---@field e boolean 
---@field f boolean 
---@field g boolean 
---@field h boolean 
---@field i boolean 
---@field j boolean 
---@field k boolean 
---@field l boolean 
---@field m boolean 
---@field n boolean 
---@field o boolean 
---@field p boolean 
---@field q boolean 
---@field r boolean 
---@field s boolean 
---@field t boolean 
---@field u boolean 
---@field v boolean 
---@field w boolean 
---@field x boolean 
---@field y boolean 
---@field z boolean 

---@class MetaEngineTagDataScenarioPlatoonFlags 
---@field fleeWhenManeuvering boolean 
---@field sayAdvancingWhenManeuver boolean 
---@field startInDefendingState boolean 

---@class MetaEngineTagDataScenarioEncounterFlags 
---@field notInitiallyCreated boolean 
---@field respawnEnabled boolean 
---@field initiallyBlind boolean 
---@field initiallyDeaf boolean 
---@field initiallyBraindead boolean 
---@field _3dFiringPositions boolean 
---@field manualBspIndexSpecified boolean 

---@class MetaEngineTagDataScenarioCommandListFlags 
---@field allowInitiative boolean 
---@field allowTargeting boolean 
---@field disableLooking boolean 
---@field disableCommunication boolean 
---@field disableFallingDamage boolean 
---@field manualBspIndex boolean 

---@class MetaEngineTagDataScenarioAIConversationParticipantFlags 
---@field optional boolean 
---@field hasAlternate boolean 
---@field isAlternate boolean 

---@class MetaEngineTagDataScenarioAIConversationLineFlags 
---@field addresseeLookAtSpeaker boolean 
---@field everyoneLookAtSpeaker boolean 
---@field everyoneLookAtAddressee boolean 
---@field waitAfterUntilToldToAdvance boolean 
---@field waitUntilSpeakerNearby boolean 
---@field waitUntilEveryoneNearby boolean 

---@class MetaEngineTagDataScenarioAIConversationFlags 
---@field stopIfDeath boolean 
---@field stopIfDamaged boolean 
---@field stopIfVisibleEnemy boolean 
---@field stopIfAlertedToEnemy boolean 
---@field playerMustBeVisible boolean 
---@field stopOtherActions boolean 
---@field keepTryingToPlay boolean 
---@field playerMustBeLooking boolean 

---@class MetaEngineTagDataScenarioFlags 
---@field cortanaHack boolean 
---@field useDemoUi boolean 
---@field colorCorrectionNtscToSrgb boolean 
---@field doNotApplyBungieCampaignTagPatches boolean 

---@class MetaEngineTagDataScenarioScriptNodeFlags 
---@field isPrimitive boolean 
---@field isScriptCall boolean 
---@field isGlobal boolean 
---@field isGarbageCollectable boolean 
---@field isLocalVariable boolean 

---@class MetaEngineTagDataScenarioSky 
---@field sky MetaEngineTagDependency 

---@class MetaEngineTagDataScenarioChildScenario 
---@field childScenario MetaEngineTagDependency 

---@class MetaEngineTagDataScenarioFunction 
---@field flags MetaEngineTagDataScenarioFunctionFlags 
---@field name MetaEngineTagString 
---@field period number 
---@field scalePeriodBy MetaEngineIndex 
---@field function EngineTagDataWaveFunction 
---@field scaleFunctionBy MetaEngineIndex 
---@field wobbleFunction EngineTagDataWaveFunction 
---@field wobblePeriod number 
---@field wobbleMagnitude number 
---@field squareWaveThreshold MetaEngineFraction 
---@field stepCount integer 
---@field mapTo EngineTagDataFunctionType 
---@field sawtoothCount integer 
---@field scaleResultBy MetaEngineIndex 
---@field boundsMode EngineTagDataFunctionBoundsMode 
---@field bounds number 
---@field turnOffWith MetaEngineIndex 

---@class MetaEngineTagDataScenarioEditorComment 
---@field position MetaEnginePoint3D 
---@field comment MetaEngineTagDataOffset 

---@class MetaEngineTagDataScenarioScavengerHuntObjects 
---@field name MetaEngineTagString 
---@field objectNameIndex MetaEngineIndex 

---@class MetaEngineTagDataScenarioObjectName 
---@field name MetaEngineTagString 
---@field objectType EngineTagDataObjectType 
---@field objectIndex MetaEngineIndex 

---@class MetaEngineTagDataScenarioScenery 
---@field type MetaEngineIndex 
---@field name MetaEngineIndex 
---@field notPlaced MetaEngineTagDataScenarioSpawnNotPlaced 
---@field desiredPermutation integer 
---@field position MetaEnginePoint3D 
---@field rotation MetaEngineEuler3D 
---@field bspIndices integer 
---@field appearancePlayerIndex integer 

---@class MetaEngineTagDataScenarioSceneryPalette 
---@field name MetaEngineTagDependency 

---@class MetaEngineTagDataScenarioBiped 
---@field type MetaEngineIndex 
---@field name MetaEngineIndex 
---@field notPlaced MetaEngineTagDataScenarioSpawnNotPlaced 
---@field desiredPermutation integer 
---@field position MetaEnginePoint3D 
---@field rotation MetaEngineEuler3D 
---@field appearancePlayerIndex integer 
---@field bodyVitalityModifier number 
---@field flags MetaEngineTagDataScenarioUnitFlags 

---@class MetaEngineTagDataScenarioBipedPalette 
---@field name MetaEngineTagDependency 

---@class MetaEngineTagDataScenarioVehicle 
---@field type MetaEngineIndex 
---@field name MetaEngineIndex 
---@field notPlaced MetaEngineTagDataScenarioSpawnNotPlaced 
---@field desiredPermutation integer 
---@field position MetaEnginePoint3D 
---@field rotation MetaEngineEuler3D 
---@field appearancePlayerIndex integer 
---@field bodyVitality number 
---@field flags MetaEngineTagDataScenarioUnitFlags 
---@field multiplayerTeamIndex integer 
---@field multiplayerSpawnFlags MetaEngineTagDataScenarioVehicleMultiplayerSpawnFlags 

---@class MetaEngineTagDataScenarioVehiclePalette 
---@field name MetaEngineTagDependency 

---@class MetaEngineTagDataScenarioEquipment 
---@field type MetaEngineIndex 
---@field name MetaEngineIndex 
---@field notPlaced MetaEngineTagDataScenarioSpawnNotPlaced 
---@field desiredPermutation integer 
---@field position MetaEnginePoint3D 
---@field rotation MetaEngineEuler3D 
---@field miscFlags MetaEngineTagDataScenarioItemFlags 
---@field appearancePlayerIndex integer 

---@class MetaEngineTagDataScenarioEquipmentPalette 
---@field name MetaEngineTagDependency 

---@class MetaEngineTagDataScenarioWeapon 
---@field type MetaEngineIndex 
---@field name MetaEngineIndex 
---@field notPlaced MetaEngineTagDataScenarioSpawnNotPlaced 
---@field desiredPermutation integer 
---@field position MetaEnginePoint3D 
---@field rotation MetaEngineEuler3D 
---@field appearancePlayerIndex integer 
---@field roundsReserved integer 
---@field roundsLoaded integer 
---@field flags MetaEngineTagDataScenarioItemFlags 

---@class MetaEngineTagDataScenarioWeaponPalette 
---@field name MetaEngineTagDependency 

---@class MetaEngineTagDataScenarioDeviceGroup 
---@field name MetaEngineTagString 
---@field initialValue number 
---@field flags MetaEngineTagDataScenarioDeviceGroupFlags 

---@class MetaEngineTagDataScenarioMachine 
---@field type MetaEngineIndex 
---@field name MetaEngineIndex 
---@field notPlaced MetaEngineTagDataScenarioSpawnNotPlaced 
---@field desiredPermutation integer 
---@field position MetaEnginePoint3D 
---@field rotation MetaEngineEuler3D 
---@field appearancePlayerIndex integer 
---@field powerGroup MetaEngineIndex 
---@field positionGroup MetaEngineIndex 
---@field deviceFlags MetaEngineTagDataScenarioDeviceFlags 
---@field machineFlags MetaEngineTagDataScenarioMachineFlags 

---@class MetaEngineTagDataScenarioMachinePalette 
---@field name MetaEngineTagDependency 

---@class MetaEngineTagDataScenarioControl 
---@field type MetaEngineIndex 
---@field name MetaEngineIndex 
---@field notPlaced MetaEngineTagDataScenarioSpawnNotPlaced 
---@field desiredPermutation integer 
---@field position MetaEnginePoint3D 
---@field rotation MetaEngineEuler3D 
---@field appearancePlayerIndex integer 
---@field powerGroup MetaEngineIndex 
---@field positionGroup MetaEngineIndex 
---@field deviceFlags MetaEngineTagDataScenarioDeviceFlags 
---@field controlFlags MetaEngineTagDataScenarioControlFlags 
---@field customControlName integer 

---@class MetaEngineTagDataScenarioControlPalette 
---@field name MetaEngineTagDependency 

---@class MetaEngineTagDataScenarioLightFixture 
---@field type MetaEngineIndex 
---@field name MetaEngineIndex 
---@field notPlaced MetaEngineTagDataScenarioSpawnNotPlaced 
---@field desiredPermutation integer 
---@field position MetaEnginePoint3D 
---@field rotation MetaEngineEuler3D 
---@field bspIndices integer 
---@field appearancePlayerIndex integer 
---@field powerGroup MetaEngineIndex 
---@field positionGroup MetaEngineIndex 
---@field deviceFlags MetaEngineTagDataScenarioDeviceFlags 
---@field color MetaEngineColorRGB 
---@field intensity number 
---@field falloffAngle MetaEngineAngle 
---@field cutoffAngle MetaEngineAngle 

---@class MetaEngineTagDataScenarioLightFixturePalette 
---@field name MetaEngineTagDependency 

---@class MetaEngineTagDataScenarioSoundScenery 
---@field type MetaEngineIndex 
---@field name MetaEngineIndex 
---@field notPlaced MetaEngineTagDataScenarioSpawnNotPlaced 
---@field desiredPermutation integer 
---@field position MetaEnginePoint3D 
---@field rotation MetaEngineEuler3D 
---@field appearancePlayerIndex integer 

---@class MetaEngineTagDataScenarioSoundSceneryPalette 
---@field name MetaEngineTagDependency 

---@class MetaEngineTagDataScenarioPlayerStartingProfile 
---@field name MetaEngineTagString 
---@field startingHealthModifier MetaEngineFraction 
---@field startingShieldModifier MetaEngineFraction 
---@field primaryWeapon MetaEngineTagDependency 
---@field primaryRoundsLoaded integer 
---@field primaryRoundsReserved integer 
---@field secondaryWeapon MetaEngineTagDependency 
---@field secondaryRoundsLoaded integer 
---@field secondaryRoundsReserved integer 
---@field startingFragmentationGrenadeCount integer 
---@field startingPlasmaGrenadeCount integer 
---@field startingGrenadeType2Count integer 
---@field startingGrenadeType3Count integer 

---@class MetaEngineTagDataScenarioPlayerStartingLocation 
---@field position MetaEnginePoint3D 
---@field facing MetaEngineAngle 
---@field teamIndex MetaEngineIndex 
---@field bspIndex MetaEngineIndex 
---@field type_0 EngineTagDataScenarioSpawnType 
---@field type_1 EngineTagDataScenarioSpawnType 
---@field type_2 EngineTagDataScenarioSpawnType 
---@field type_3 EngineTagDataScenarioSpawnType 

---@class MetaEngineTagDataScenarioTriggerVolume 
---@field unknown integer 
---@field name MetaEngineTagString 
---@field parameters number 
---@field rotationVectorA MetaEngineVector3D 
---@field rotationVectorB MetaEngineVector3D 
---@field startingCorner MetaEnginePoint3D 
---@field endingCornerOffset MetaEnginePoint3D 

---@class MetaEngineTagDataScenarioRecordedAnimation 
---@field name MetaEngineTagString 
---@field version integer 
---@field rawAnimationData integer 
---@field unitControlDataVersion integer 
---@field lengthOfAnimation integer 
---@field recordedAnimationEventStream MetaEngineTagDataOffset 

---@class MetaEngineTagDataScenarioNetgameFlags 
---@field position MetaEnginePoint3D 
---@field facing MetaEngineAngle 
---@field type EngineTagDataScenarioNetgameFlagType 
---@field usageId MetaEngineIndex 
---@field weaponGroup MetaEngineTagDependency 

---@class MetaEngineTagDataScenarioNetgameEquipment 
---@field flags MetaEngineTagDataScenarioNetgameEquipmentFlags 
---@field type_0 EngineTagDataScenarioSpawnType 
---@field type_1 EngineTagDataScenarioSpawnType 
---@field type_2 EngineTagDataScenarioSpawnType 
---@field type_3 EngineTagDataScenarioSpawnType 
---@field teamIndex MetaEngineIndex 
---@field spawnTime integer 
---@field unknownFfffffff integer 
---@field position MetaEnginePoint3D 
---@field facing MetaEngineAngle 
---@field itemCollection MetaEngineTagDependency 

---@class MetaEngineTagDataScenarioStartingEquipment 
---@field flags MetaEngineTagDataScenarioStartingEquipmentFlags 
---@field type_0 EngineTagDataScenarioSpawnType 
---@field type_1 EngineTagDataScenarioSpawnType 
---@field type_2 EngineTagDataScenarioSpawnType 
---@field type_3 EngineTagDataScenarioSpawnType 
---@field itemCollection_1 MetaEngineTagDependency 
---@field itemCollection_2 MetaEngineTagDependency 
---@field itemCollection_3 MetaEngineTagDependency 
---@field itemCollection_4 MetaEngineTagDependency 
---@field itemCollection_5 MetaEngineTagDependency 
---@field itemCollection_6 MetaEngineTagDependency 

---@class MetaEngineTagDataScenarioBSPSwitchTriggerVolume 
---@field triggerVolume MetaEngineIndex 
---@field source MetaEngineIndex 
---@field destination MetaEngineIndex 
---@field unknown integer 

---@class MetaEngineTagDataScenarioDecal 
---@field decalType MetaEngineIndex 
---@field yaw integer 
---@field pitch integer 
---@field position MetaEnginePoint3D 

---@class MetaEngineTagDataScenarioDecalPalette 
---@field reference MetaEngineTagDependency 

---@class MetaEngineTagDataScenarioDetailObjectCollectionPalette 
---@field reference MetaEngineTagDependency 

---@class MetaEngineTagDataScenarioActorPalette 
---@field reference MetaEngineTagDependency 

---@class MetaEngineTagDataScenarioMovePosition 
---@field position MetaEnginePoint3D 
---@field facing MetaEngineAngle 
---@field weight number 
---@field time number 
---@field animation MetaEngineIndex 
---@field sequenceId integer 
---@field clusterIndex MetaEngineIndex 
---@field surfaceIndex integer 

---@class MetaEngineTagDataScenarioActorStartingLocation 
---@field position MetaEnginePoint3D 
---@field facing MetaEngineAngle 
---@field clusterIndex MetaEngineIndex 
---@field sequenceId integer 
---@field flags MetaEngineTagDataScenarioActorStartingLocationFlags 
---@field returnState EngineTagDataScenarioReturnState 
---@field initialState EngineTagDataScenarioReturnState 
---@field actorType MetaEngineIndex 
---@field commandList MetaEngineIndex 

---@class MetaEngineTagDataScenarioSquad 
---@field name MetaEngineTagString 
---@field actorType MetaEngineIndex 
---@field platoon MetaEngineIndex 
---@field initialState EngineTagDataScenarioReturnState 
---@field returnState EngineTagDataScenarioReturnState 
---@field flags MetaEngineTagDataScenarioSquadFlags 
---@field uniqueLeaderType EngineTagDataScenarioUniqueLeaderType 
---@field maneuverToSquad MetaEngineIndex 
---@field squadDelayTime number 
---@field attacking MetaEngineTagDataScenarioSquadAttacking 
---@field attackingSearch MetaEngineTagDataScenarioSquadAttacking 
---@field attackingGuard MetaEngineTagDataScenarioSquadAttacking 
---@field defending MetaEngineTagDataScenarioSquadAttacking 
---@field defendingSearch MetaEngineTagDataScenarioSquadAttacking 
---@field defendingGuard MetaEngineTagDataScenarioSquadAttacking 
---@field pursuing MetaEngineTagDataScenarioSquadAttacking 
---@field normalDiffCount integer 
---@field insaneDiffCount integer 
---@field majorUpgrade EngineTagDataScenarioMajorUpgrade 
---@field respawnMinActors integer 
---@field respawnMaxActors integer 
---@field respawnTotal integer 
---@field respawnDelay number 
---@field movePositions table<MetaEngineTagDataScenarioMovePosition> 
---@field startingLocations table<MetaEngineTagDataScenarioActorStartingLocation> 

---@class MetaEngineTagDataScenarioPlatoon 
---@field name MetaEngineTagString 
---@field flags MetaEngineTagDataScenarioPlatoonFlags 
---@field changeAttackingDefendingStateWhen EngineTagDataScenarioChangeAttackingDefendingStateWhen 
---@field happensTo MetaEngineIndex 
---@field maneuverWhen EngineTagDataScenarioChangeAttackingDefendingStateWhen 
---@field happensTo_1 MetaEngineIndex 

---@class MetaEngineTagDataScenarioFiringPosition 
---@field position MetaEnginePoint3D 
---@field groupIndex EngineTagDataScenarioGroupIndex 
---@field clusterIndex MetaEngineIndex 
---@field surfaceIndex integer 

---@class MetaEngineTagDataScenarioEncounter 
---@field name MetaEngineTagString 
---@field flags MetaEngineTagDataScenarioEncounterFlags 
---@field teamIndex EngineTagDataScenarioTeamIndex 
---@field one integer 
---@field searchBehavior EngineTagDataScenarioSearchBehavior 
---@field manualBspIndex MetaEngineIndex 
---@field respawnDelay number 
---@field precomputedBspIndex MetaEngineIndex 
---@field squads table<MetaEngineTagDataScenarioSquad> 
---@field platoons table<MetaEngineTagDataScenarioPlatoon> 
---@field firingPositions table<MetaEngineTagDataScenarioFiringPosition> 
---@field playerStartingLocations table<MetaEngineTagDataScenarioPlayerStartingLocation> 

---@class MetaEngineTagDataScenarioCommand 
---@field atomType EngineTagDataScenarioAtomType 
---@field atomModifier integer 
---@field parameter1 number 
---@field parameter2 number 
---@field point_1 MetaEngineIndex 
---@field point_2 MetaEngineIndex 
---@field animation MetaEngineIndex 
---@field script MetaEngineIndex 
---@field recording MetaEngineIndex 
---@field command MetaEngineIndex 
---@field objectName MetaEngineIndex 

---@class MetaEngineTagDataScenarioCommandPoint 
---@field position MetaEnginePoint3D 
---@field surfaceIndex integer 

---@class MetaEngineTagDataScenarioCommandList 
---@field name MetaEngineTagString 
---@field flags MetaEngineTagDataScenarioCommandListFlags 
---@field manualBspIndex MetaEngineIndex 
---@field precomputedBspIndex MetaEngineIndex 
---@field commands table<MetaEngineTagDataScenarioCommand> 
---@field points table<MetaEngineTagDataScenarioCommandPoint> 

---@class MetaEngineTagDataScenarioAIAnimationReference 
---@field animationName MetaEngineTagString 
---@field animationGraph MetaEngineTagDependency 

---@class MetaEngineTagDataScenarioAIScriptReference 
---@field scriptName MetaEngineTagString 

---@class MetaEngineTagDataScenarioAIRecordingReference 
---@field recordingName MetaEngineTagString 

---@class MetaEngineTagDataScenarioAIConversationParticipant 
---@field flags MetaEngineTagDataScenarioAIConversationParticipantFlags 
---@field selectionType EngineTagDataScenarioSelectionType 
---@field actorType EngineTagDataActorType 
---@field useThisObject MetaEngineIndex 
---@field setNewName MetaEngineIndex 
---@field variantNumbers integer 
---@field encounterName MetaEngineTagString 
---@field encounterIndex integer 

---@class MetaEngineTagDataScenarioAIConversationLine 
---@field flags MetaEngineTagDataScenarioAIConversationLineFlags 
---@field participant MetaEngineIndex 
---@field addressee EngineTagDataScenarioAddressee 
---@field addresseeParticipant MetaEngineIndex 
---@field lineDelayTime number 
---@field variant_1 MetaEngineTagDependency 
---@field variant_2 MetaEngineTagDependency 
---@field variant_3 MetaEngineTagDependency 
---@field variant_4 MetaEngineTagDependency 
---@field variant_5 MetaEngineTagDependency 
---@field variant_6 MetaEngineTagDependency 

---@class MetaEngineTagDataScenarioAIConversation 
---@field name MetaEngineTagString 
---@field flags MetaEngineTagDataScenarioAIConversationFlags 
---@field triggerDistance number 
---@field runToPlayerDist number 
---@field participants table<MetaEngineTagDataScenarioAIConversationParticipant> 
---@field lines table<MetaEngineTagDataScenarioAIConversationLine> 

---@class MetaEngineTagDataScenarioScriptParameter 
---@field name MetaEngineTagString 
---@field returnType EngineTagDataScenarioScriptValueType 

---@class MetaEngineTagDataScenarioScript 
---@field name MetaEngineTagString 
---@field scriptType EngineTagDataScenarioScriptType 
---@field returnType EngineTagDataScenarioScriptValueType 
---@field rootExpressionIndex integer 
---@field parameters table<MetaEngineTagDataScenarioScriptParameter> 

---@class MetaEngineTagDataScenarioGlobal 
---@field name MetaEngineTagString 
---@field type EngineTagDataScenarioScriptValueType 
---@field initializationExpressionIndex integer 

---@class MetaEngineTagDataScenarioReference 
---@field reference MetaEngineTagDependency 

---@class MetaEngineTagDataScenarioSourceFile 
---@field name MetaEngineTagString 
---@field source MetaEngineTagDataOffset 

---@class MetaEngineTagDataScenarioCutsceneFlag 
---@field unknown integer 
---@field name MetaEngineTagString 
---@field position MetaEnginePoint3D 
---@field facing MetaEngineEuler2D 

---@class MetaEngineTagDataScenarioCutsceneCameraPoint 
---@field unknown integer 
---@field name MetaEngineTagString 
---@field position MetaEnginePoint3D 
---@field orientation MetaEngineEuler3D 
---@field fieldOfView MetaEngineAngle 

---@class MetaEngineTagDataScenarioCutsceneTitle 
---@field unknown integer 
---@field name MetaEngineTagString 
---@field textBounds MetaEngineRectangle2D 
---@field stringIndex MetaEngineIndex 
---@field textStyle EngineTagDataScenarioTextStyle 
---@field justification EngineTagDataScenarioJustification 
---@field textFlags MetaEngineTagDataScenarioTextFlags 
---@field textColor MetaEngineColorARGBInt 
---@field shadowColor MetaEngineColorARGBInt 
---@field fadeInTime number 
---@field upTime number 
---@field fadeOutTime number 

---@class MetaEngineTagDataScenarioBSP 
---@field bspStart integer 
---@field bspSize integer 
---@field bspAddress integer 
---@field structureBsp MetaEngineTagDependency 

---@class MetaEngineTagDataScenarioScriptNode 
---@field salt integer 
---@field indexUnion integer 
---@field type EngineTagDataScenarioScriptValueType 
---@field flags MetaEngineTagDataScenarioScriptNodeFlags 
---@field nextNode integer 
---@field stringOffset integer 
---@field data EngineScenarioScriptNodeValue 

---@class MetaEngineTagDataScenarioScriptNodeTable 
---@field name MetaEngineTagString 
---@field maximumCount integer 
---@field elementSize integer 
---@field one integer 
---@field data integer 
---@field size integer 
---@field count integer 
---@field nextId integer 
---@field firstElementPtr integer 

---@class MetaEngineTagDataScenario 
---@field dontUse MetaEngineTagDependency 
---@field wontUse MetaEngineTagDependency 
---@field cantUse MetaEngineTagDependency 
---@field skies table<MetaEngineTagDataScenarioSky> 
---@field type EngineTagDataScenarioType 
---@field flags MetaEngineTagDataScenarioFlags 
---@field childScenarios table<MetaEngineTagDataScenarioChildScenario> 
---@field localNorth number 
---@field predictedResources table<MetaEngineTagDataPredictedResource> 
---@field functions table<MetaEngineTagDataScenarioFunction> 
---@field editorScenarioData MetaEngineTagDataOffset 
---@field comments table<MetaEngineTagDataScenarioEditorComment> 
---@field scavengerHuntObjects table<MetaEngineTagDataScenarioScavengerHuntObjects> 
---@field objectNames table<MetaEngineTagDataScenarioObjectName> 
---@field scenery table<MetaEngineTagDataScenarioScenery> 
---@field sceneryPalette table<MetaEngineTagDataScenarioSceneryPalette> 
---@field bipeds table<MetaEngineTagDataScenarioBiped> 
---@field bipedPalette table<MetaEngineTagDataScenarioBipedPalette> 
---@field vehicles table<MetaEngineTagDataScenarioVehicle> 
---@field vehiclePalette table<MetaEngineTagDataScenarioVehiclePalette> 
---@field equipment table<MetaEngineTagDataScenarioEquipment> 
---@field equipmentPalette table<MetaEngineTagDataScenarioEquipmentPalette> 
---@field weapons table<MetaEngineTagDataScenarioWeapon> 
---@field weaponPalette table<MetaEngineTagDataScenarioWeaponPalette> 
---@field deviceGroups table<MetaEngineTagDataScenarioDeviceGroup> 
---@field machines table<MetaEngineTagDataScenarioMachine> 
---@field machinePalette table<MetaEngineTagDataScenarioMachinePalette> 
---@field controls table<MetaEngineTagDataScenarioControl> 
---@field controlPalette table<MetaEngineTagDataScenarioControlPalette> 
---@field lightFixtures table<MetaEngineTagDataScenarioLightFixture> 
---@field lightFixturePalette table<MetaEngineTagDataScenarioLightFixturePalette> 
---@field soundScenery table<MetaEngineTagDataScenarioSoundScenery> 
---@field soundSceneryPalette table<MetaEngineTagDataScenarioSoundSceneryPalette> 
---@field playerStartingProfile table<MetaEngineTagDataScenarioPlayerStartingProfile> 
---@field playerStartingLocations table<MetaEngineTagDataScenarioPlayerStartingLocation> 
---@field triggerVolumes table<MetaEngineTagDataScenarioTriggerVolume> 
---@field recordedAnimations table<MetaEngineTagDataScenarioRecordedAnimation> 
---@field netgameFlags table<MetaEngineTagDataScenarioNetgameFlags> 
---@field netgameEquipment table<MetaEngineTagDataScenarioNetgameEquipment> 
---@field startingEquipment table<MetaEngineTagDataScenarioStartingEquipment> 
---@field bspSwitchTriggerVolumes table<MetaEngineTagDataScenarioBSPSwitchTriggerVolume> 
---@field decals table<MetaEngineTagDataScenarioDecal> 
---@field decalPalette table<MetaEngineTagDataScenarioDecalPalette> 
---@field detailObjectCollectionPalette table<MetaEngineTagDataScenarioDetailObjectCollectionPalette> 
---@field actorPalette table<MetaEngineTagDataScenarioActorPalette> 
---@field encounters table<MetaEngineTagDataScenarioEncounter> 
---@field commandLists table<MetaEngineTagDataScenarioCommandList> 
---@field aiAnimationReferences table<MetaEngineTagDataScenarioAIAnimationReference> 
---@field aiScriptReferences table<MetaEngineTagDataScenarioAIScriptReference> 
---@field aiRecordingReferences table<MetaEngineTagDataScenarioAIRecordingReference> 
---@field aiConversations table<MetaEngineTagDataScenarioAIConversation> 
---@field scriptSyntaxData MetaEngineTagDataOffset 
---@field scriptStringData MetaEngineTagDataOffset 
---@field scripts table<MetaEngineTagDataScenarioScript> 
---@field globals table<MetaEngineTagDataScenarioGlobal> 
---@field references table<MetaEngineTagDataScenarioReference> 
---@field sourceFiles table<MetaEngineTagDataScenarioSourceFile> 
---@field cutsceneFlags table<MetaEngineTagDataScenarioCutsceneFlag> 
---@field cutsceneCameraPoints table<MetaEngineTagDataScenarioCutsceneCameraPoint> 
---@field cutsceneTitles table<MetaEngineTagDataScenarioCutsceneTitle> 
---@field customObjectNames MetaEngineTagDependency 
---@field ingameHelpText MetaEngineTagDependency 
---@field hudMessages MetaEngineTagDependency 
---@field structureBsps table<MetaEngineTagDataScenarioBSP> 

---@class EngineTagDataParticleOrientationEnum : Enum 

---@class EngineTagDataParticleOrientationScreenFacing : EngineTagDataParticleOrientationEnum 
---@class EngineTagDataParticleOrientationParallelToDirection : EngineTagDataParticleOrientationEnum 
---@class EngineTagDataParticleOrientationPerpendicularToDirection : EngineTagDataParticleOrientationEnum 

---@alias EngineTagDataParticleOrientation 
---| EngineTagDataParticleOrientationScreenFacing
---| EngineTagDataParticleOrientationParallelToDirection
---| EngineTagDataParticleOrientationPerpendicularToDirection

---@class EngineTagDataParticleOrientationTable 
---@field screenFacing EngineTagDataParticleOrientationScreenFacing
---@field parallelToDirection EngineTagDataParticleOrientationParallelToDirection
---@field perpendicularToDirection EngineTagDataParticleOrientationPerpendicularToDirection
Engine.tag.particleOrientation = {} 

---@class EngineTagDataParticleAnchorEnum : Enum 

---@class EngineTagDataParticleAnchorWithPrimary : EngineTagDataParticleAnchorEnum 
---@class EngineTagDataParticleAnchorWithScreenSpace : EngineTagDataParticleAnchorEnum 
---@class EngineTagDataParticleAnchorZsprite : EngineTagDataParticleAnchorEnum 

---@alias EngineTagDataParticleAnchor 
---| EngineTagDataParticleAnchorWithPrimary
---| EngineTagDataParticleAnchorWithScreenSpace
---| EngineTagDataParticleAnchorZsprite

---@class EngineTagDataParticleAnchorTable 
---@field withPrimary EngineTagDataParticleAnchorWithPrimary
---@field withScreenSpace EngineTagDataParticleAnchorWithScreenSpace
---@field zsprite EngineTagDataParticleAnchorZsprite
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

---@class MetaEngineTagDataGrenadeHUDInterfaceOverlayType 
---@field showOnFlashing boolean 
---@field showOnEmpty boolean 
---@field showOnDefault boolean 
---@field showAlways boolean 

---@class MetaEngineTagDataGrenadeHUDInterfaceSoundLatchedTo 
---@field lowGrenadeCount boolean 
---@field noGrenadesLeft boolean 
---@field throwOnNoGrenades boolean 

---@class MetaEngineTagDataGrenadeHUDInterfaceOverlay 
---@field anchorOffset MetaEnginePoint2DInt 
---@field widthScale number 
---@field heightScale number 
---@field scalingFlags MetaEngineTagDataHUDInterfaceScalingFlags 
---@field defaultColor MetaEngineColorARGBInt 
---@field flashingColor MetaEngineColorARGBInt 
---@field flashPeriod number 
---@field flashDelay number 
---@field numberOfFlashes integer 
---@field flashFlags MetaEngineTagDataHUDInterfaceFlashFlags 
---@field flashLength number 
---@field disabledColor MetaEngineColorARGBInt 
---@field frameRate number 
---@field sequenceIndex MetaEngineIndex 
---@field type MetaEngineTagDataGrenadeHUDInterfaceOverlayType 
---@field flags MetaEngineTagDataHUDInterfaceOverlayFlashFlags 

---@class MetaEngineTagDataGrenadeHUDInterfaceSound 
---@field sound MetaEngineTagDependency 
---@field latchedTo MetaEngineTagDataGrenadeHUDInterfaceSoundLatchedTo 
---@field scale number 

---@class MetaEngineTagDataGrenadeHudInterface 
---@field anchor EngineTagDataHUDInterfaceAnchor 
---@field backgroundAnchorOffset MetaEnginePoint2DInt 
---@field backgroundWidthScale number 
---@field backgroundHeightScale number 
---@field backgroundScalingFlags MetaEngineTagDataHUDInterfaceScalingFlags 
---@field backgroundInterfaceBitmap MetaEngineTagDependency 
---@field backgroundDefaultColor MetaEngineColorARGBInt 
---@field backgroundFlashingColor MetaEngineColorARGBInt 
---@field backgroundFlashPeriod number 
---@field backgroundFlashDelay number 
---@field backgroundNumberOfFlashes integer 
---@field backgroundFlashFlags MetaEngineTagDataHUDInterfaceFlashFlags 
---@field backgroundFlashLength number 
---@field backgroundDisabledColor MetaEngineColorARGBInt 
---@field backgroundSequenceIndex MetaEngineIndex 
---@field backgroundMultitextureOverlays table<MetaEngineTagDataHUDInterfaceMultitextureOverlay> 
---@field totalGrenadesBackgroundAnchorOffset MetaEnginePoint2DInt 
---@field totalGrenadesBackgroundWidthScale number 
---@field totalGrenadesBackgroundHeightScale number 
---@field totalGrenadesBackgroundScalingFlags MetaEngineTagDataHUDInterfaceScalingFlags 
---@field totalGrenadesBackgroundInterfaceBitmap MetaEngineTagDependency 
---@field totalGrenadesBackgroundDefaultColor MetaEngineColorARGBInt 
---@field totalGrenadesBackgroundFlashingColor MetaEngineColorARGBInt 
---@field totalGrenadesBackgroundFlashPeriod number 
---@field totalGrenadesBackgroundFlashDelay number 
---@field totalGrenadesBackgroundNumberOfFlashes integer 
---@field totalGrenadesBackgroundFlashFlags MetaEngineTagDataHUDInterfaceFlashFlags 
---@field totalGrenadesBackgroundFlashLength number 
---@field totalGrenadesBackgroundDisabledColor MetaEngineColorARGBInt 
---@field totalGrenadesBackgroundSequenceIndex MetaEngineIndex 
---@field totalGrenadesBackgroundMultitextureOverlays table<MetaEngineTagDataHUDInterfaceMultitextureOverlay> 
---@field totalGrenadesNumbersAnchorOffset MetaEnginePoint2DInt 
---@field totalGrenadesNumbersWidthScale number 
---@field totalGrenadesNumbersHeightScale number 
---@field totalGrenadesNumbersScalingFlags MetaEngineTagDataHUDInterfaceScalingFlags 
---@field totalGrenadesNumbersDefaultColor MetaEngineColorARGBInt 
---@field totalGrenadesNumbersFlashingColor MetaEngineColorARGBInt 
---@field totalGrenadesNumbersFlashPeriod number 
---@field totalGrenadesNumbersFlashDelay number 
---@field totalGrenadesNumbersNumberOfFlashes integer 
---@field totalGrenadesNumbersFlashFlags MetaEngineTagDataHUDInterfaceFlashFlags 
---@field totalGrenadesNumbersFlashLength number 
---@field totalGrenadesNumbersDisabledColor MetaEngineColorARGBInt 
---@field totalGrenadesNumbersMaximumNumberOfDigits integer 
---@field totalGrenadesNumbersFlags MetaEngineTagDataHUDInterfaceNumberFlags 
---@field totalGrenadesNumbersNumberOfFractionalDigits integer 
---@field flashCutoff integer 
---@field totalGrenadesOverlayBitmap MetaEngineTagDependency 
---@field totalGrenadesOverlays table<MetaEngineTagDataGrenadeHUDInterfaceOverlay> 
---@field totalGrenadesWarningSounds table<MetaEngineTagDataGrenadeHUDInterfaceSound> 
---@field messagingInformationSequenceIndex MetaEngineIndex 
---@field messagingInformationWidthOffset integer 
---@field messagingInformationOffsetFromReferenceCorner MetaEnginePoint2DInt 
---@field messagingInformationOverrideIconColor MetaEngineColorARGBInt 
---@field messagingInformationFrameRate integer 
---@field messagingInformationFlags MetaEngineTagDataHUDInterfaceMessagingFlags 
---@field messagingInformationTextIndex MetaEngineIndex 

---@class EngineTagDataActorTypeEnum : Enum 

---@class EngineTagDataActorTypeElite : EngineTagDataActorTypeEnum 
---@class EngineTagDataActorTypeJackal : EngineTagDataActorTypeEnum 
---@class EngineTagDataActorTypeGrunt : EngineTagDataActorTypeEnum 
---@class EngineTagDataActorTypeHunter : EngineTagDataActorTypeEnum 
---@class EngineTagDataActorTypeEngineer : EngineTagDataActorTypeEnum 
---@class EngineTagDataActorTypeAssassin : EngineTagDataActorTypeEnum 
---@class EngineTagDataActorTypePlayer : EngineTagDataActorTypeEnum 
---@class EngineTagDataActorTypeMarine : EngineTagDataActorTypeEnum 
---@class EngineTagDataActorTypeCrew : EngineTagDataActorTypeEnum 
---@class EngineTagDataActorTypeCombatForm : EngineTagDataActorTypeEnum 
---@class EngineTagDataActorTypeInfectionForm : EngineTagDataActorTypeEnum 
---@class EngineTagDataActorTypeCarrierForm : EngineTagDataActorTypeEnum 
---@class EngineTagDataActorTypeMonitor : EngineTagDataActorTypeEnum 
---@class EngineTagDataActorTypeSentinel : EngineTagDataActorTypeEnum 
---@class EngineTagDataActorTypeNone : EngineTagDataActorTypeEnum 
---@class EngineTagDataActorTypeMountedWeapon : EngineTagDataActorTypeEnum 

---@alias EngineTagDataActorType 
---| EngineTagDataActorTypeElite
---| EngineTagDataActorTypeJackal
---| EngineTagDataActorTypeGrunt
---| EngineTagDataActorTypeHunter
---| EngineTagDataActorTypeEngineer
---| EngineTagDataActorTypeAssassin
---| EngineTagDataActorTypePlayer
---| EngineTagDataActorTypeMarine
---| EngineTagDataActorTypeCrew
---| EngineTagDataActorTypeCombatForm
---| EngineTagDataActorTypeInfectionForm
---| EngineTagDataActorTypeCarrierForm
---| EngineTagDataActorTypeMonitor
---| EngineTagDataActorTypeSentinel
---| EngineTagDataActorTypeNone
---| EngineTagDataActorTypeMountedWeapon

---@class EngineTagDataActorTypeTable 
---@field elite EngineTagDataActorTypeElite
---@field jackal EngineTagDataActorTypeJackal
---@field grunt EngineTagDataActorTypeGrunt
---@field hunter EngineTagDataActorTypeHunter
---@field engineer EngineTagDataActorTypeEngineer
---@field assassin EngineTagDataActorTypeAssassin
---@field player EngineTagDataActorTypePlayer
---@field marine EngineTagDataActorTypeMarine
---@field crew EngineTagDataActorTypeCrew
---@field combatForm EngineTagDataActorTypeCombatForm
---@field infectionForm EngineTagDataActorTypeInfectionForm
---@field carrierForm EngineTagDataActorTypeCarrierForm
---@field monitor EngineTagDataActorTypeMonitor
---@field sentinel EngineTagDataActorTypeSentinel
---@field none EngineTagDataActorTypeNone
---@field mountedWeapon EngineTagDataActorTypeMountedWeapon
Engine.tag.actorType = {} 

---@class EngineTagDataActorUnreachableDangerTriggerEnum : Enum 

---@class EngineTagDataActorUnreachableDangerTriggerNever : EngineTagDataActorUnreachableDangerTriggerEnum 
---@class EngineTagDataActorUnreachableDangerTriggerVisible : EngineTagDataActorUnreachableDangerTriggerEnum 
---@class EngineTagDataActorUnreachableDangerTriggerShooting : EngineTagDataActorUnreachableDangerTriggerEnum 
---@class EngineTagDataActorUnreachableDangerTriggerShootingNearUs : EngineTagDataActorUnreachableDangerTriggerEnum 
---@class EngineTagDataActorUnreachableDangerTriggerDamagingUs : EngineTagDataActorUnreachableDangerTriggerEnum 
---@class EngineTagDataActorUnreachableDangerTriggerUnused : EngineTagDataActorUnreachableDangerTriggerEnum 
---@class EngineTagDataActorUnreachableDangerTriggerUnused1 : EngineTagDataActorUnreachableDangerTriggerEnum 
---@class EngineTagDataActorUnreachableDangerTriggerUnused2 : EngineTagDataActorUnreachableDangerTriggerEnum 
---@class EngineTagDataActorUnreachableDangerTriggerUnused3 : EngineTagDataActorUnreachableDangerTriggerEnum 
---@class EngineTagDataActorUnreachableDangerTriggerUnused4 : EngineTagDataActorUnreachableDangerTriggerEnum 

---@alias EngineTagDataActorUnreachableDangerTrigger 
---| EngineTagDataActorUnreachableDangerTriggerNever
---| EngineTagDataActorUnreachableDangerTriggerVisible
---| EngineTagDataActorUnreachableDangerTriggerShooting
---| EngineTagDataActorUnreachableDangerTriggerShootingNearUs
---| EngineTagDataActorUnreachableDangerTriggerDamagingUs
---| EngineTagDataActorUnreachableDangerTriggerUnused
---| EngineTagDataActorUnreachableDangerTriggerUnused1
---| EngineTagDataActorUnreachableDangerTriggerUnused2
---| EngineTagDataActorUnreachableDangerTriggerUnused3
---| EngineTagDataActorUnreachableDangerTriggerUnused4

---@class EngineTagDataActorUnreachableDangerTriggerTable 
---@field erNever EngineTagDataActorUnreachableDangerTriggerNever
---@field erVisible EngineTagDataActorUnreachableDangerTriggerVisible
---@field erShooting EngineTagDataActorUnreachableDangerTriggerShooting
---@field erShootingNearUs EngineTagDataActorUnreachableDangerTriggerShootingNearUs
---@field erDamagingUs EngineTagDataActorUnreachableDangerTriggerDamagingUs
---@field erUnused EngineTagDataActorUnreachableDangerTriggerUnused
---@field erUnused1 EngineTagDataActorUnreachableDangerTriggerUnused1
---@field erUnused2 EngineTagDataActorUnreachableDangerTriggerUnused2
---@field erUnused3 EngineTagDataActorUnreachableDangerTriggerUnused3
---@field erUnused4 EngineTagDataActorUnreachableDangerTriggerUnused4
Engine.tag.actorUnreachableDangerTrigger = {} 

---@class EngineTagDataActorDefensiveCrouchTypeEnum : Enum 

---@class EngineTagDataActorDefensiveCrouchTypeNever : EngineTagDataActorDefensiveCrouchTypeEnum 
---@class EngineTagDataActorDefensiveCrouchTypeDanger : EngineTagDataActorDefensiveCrouchTypeEnum 
---@class EngineTagDataActorDefensiveCrouchTypeLowShields : EngineTagDataActorDefensiveCrouchTypeEnum 
---@class EngineTagDataActorDefensiveCrouchTypeHideBehindShield : EngineTagDataActorDefensiveCrouchTypeEnum 
---@class EngineTagDataActorDefensiveCrouchTypeAnyTarget : EngineTagDataActorDefensiveCrouchTypeEnum 
---@class EngineTagDataActorDefensiveCrouchTypeFloodShamble : EngineTagDataActorDefensiveCrouchTypeEnum 

---@alias EngineTagDataActorDefensiveCrouchType 
---| EngineTagDataActorDefensiveCrouchTypeNever
---| EngineTagDataActorDefensiveCrouchTypeDanger
---| EngineTagDataActorDefensiveCrouchTypeLowShields
---| EngineTagDataActorDefensiveCrouchTypeHideBehindShield
---| EngineTagDataActorDefensiveCrouchTypeAnyTarget
---| EngineTagDataActorDefensiveCrouchTypeFloodShamble

---@class EngineTagDataActorDefensiveCrouchTypeTable 
---@field peNever EngineTagDataActorDefensiveCrouchTypeNever
---@field peDanger EngineTagDataActorDefensiveCrouchTypeDanger
---@field peLowShields EngineTagDataActorDefensiveCrouchTypeLowShields
---@field peHideBehindShield EngineTagDataActorDefensiveCrouchTypeHideBehindShield
---@field peAnyTarget EngineTagDataActorDefensiveCrouchTypeAnyTarget
---@field peFloodShamble EngineTagDataActorDefensiveCrouchTypeFloodShamble
Engine.tag.actorDefensiveCrouchType = {} 

---@class MetaEngineTagDataActorFlags 
---@field canSeeInDarkness boolean 
---@field sneakUncoveringTarget boolean 
---@field sneakUncoveringPursuitPosition boolean 
---@field unused boolean 
---@field shootAtTargetSLastLocation boolean 
---@field tryToStayStillWhenCrouched boolean 
---@field crouchWhenNotInCombat boolean 
---@field crouchWhenGuarding boolean 
---@field unused_1 boolean 
---@field mustCrouchToShoot boolean 
---@field panicWhenSurprised boolean 
---@field alwaysChargeAtEnemies boolean 
---@field getsInVehiclesWithPlayer boolean 
---@field startFiringBeforeAligned boolean 
---@field standingMustMoveForward boolean 
---@field crouchingMustMoveForward boolean 
---@field defensiveCrouchWhileCharging boolean 
---@field useStalkingBehavior boolean 
---@field stalkingFreezeIfExposed boolean 
---@field alwaysBerserkInAttackingMode boolean 
---@field berserkingUsesPanickedMovement boolean 
---@field flying boolean 
---@field panickedByUnopposableEnemy boolean 
---@field crouchWhenHidingFromUnopposable boolean 
---@field alwaysChargeInAttackingMode boolean 
---@field diveOffLedges boolean 
---@field swarm boolean 
---@field suicidalMeleeAttack boolean 
---@field cannotMoveWhileCrouching boolean 
---@field fixedCrouchFacing boolean 
---@field crouchWhenInLineOfFire boolean 
---@field avoidFriendsLineOfFire boolean 

---@class MetaEngineTagDataActorMoreFlags 
---@field avoidAllEnemyAttackVectors boolean 
---@field mustStandToFire boolean 
---@field mustStopToFire boolean 
---@field disallowVehicleCombat boolean 
---@field pathfindingIgnoresDanger boolean 
---@field panicInGroups boolean 
---@field noCorpseShooting boolean 

---@class MetaEngineTagDataActor 
---@field flags MetaEngineTagDataActorFlags 
---@field moreFlags MetaEngineTagDataActorMoreFlags 
---@field type EngineTagDataActorType 
---@field maxVisionDistance number 
---@field centralVisionAngle MetaEngineAngle 
---@field maxVisionAngle MetaEngineAngle 
---@field peripheralVisionAngle MetaEngineAngle 
---@field peripheralDistance number 
---@field standingGunOffset MetaEngineVector3D 
---@field crouchingGunOffset MetaEngineVector3D 
---@field hearingDistance number 
---@field noticeProjectileChance number 
---@field noticeVehicleChance number 
---@field combatPerceptionTime number 
---@field guardPerceptionTime number 
---@field nonCombatPerceptionTime number 
---@field inverseCombatPerceptionTime number 
---@field inverseGuardPerceptionTime number 
---@field inverseNonCombatPerceptionTime number 
---@field diveIntoCoverChance number 
---@field emergeFromCoverChance number 
---@field diveFromGrenadeChance number 
---@field pathfindingRadius number 
---@field glassIgnoranceChance number 
---@field stationaryMovementDist number 
---@field freeFlyingSidestep number 
---@field beginMovingAngle MetaEngineAngle 
---@field cosineBeginMovingAngle number 
---@field maximumAimingDeviation MetaEngineEuler2D 
---@field maximumLookingDeviation MetaEngineEuler2D 
---@field noncombatLookDeltaL MetaEngineAngle 
---@field noncombatLookDeltaR MetaEngineAngle 
---@field combatLookDeltaL MetaEngineAngle 
---@field combatLookDeltaR MetaEngineAngle 
---@field idleAimingRange MetaEngineEuler2D 
---@field idleLookingRange MetaEngineEuler2D 
---@field eventLookTimeModifier number 
---@field noncombatIdleFacing number 
---@field noncombatIdleAiming number 
---@field noncombatIdleLooking number 
---@field guardIdleFacing number 
---@field guardIdleAiming number 
---@field guardIdleLooking number 
---@field combatIdleFacing number 
---@field combatIdleAiming number 
---@field combatIdleLooking number 
---@field cosineMaximumAimingDeviation MetaEngineEuler2D 
---@field cosineMaximumLookingDeviation MetaEngineEuler2D 
---@field doNotUse MetaEngineTagDependency 
---@field doNotUse_1 MetaEngineTagDependency 
---@field unreachableDangerTrigger EngineTagDataActorUnreachableDangerTrigger 
---@field vehicleDangerTrigger EngineTagDataActorUnreachableDangerTrigger 
---@field playerDangerTrigger EngineTagDataActorUnreachableDangerTrigger 
---@field dangerTriggerTime number 
---@field friendsKilledTrigger integer 
---@field friendsRetreatingTrigger integer 
---@field retreatTime number 
---@field coweringTime number 
---@field friendKilledPanicChance number 
---@field leaderType EngineTagDataActorType 
---@field leaderKilledPanicChance number 
---@field panicDamageThreshold number 
---@field surpriseDistance number 
---@field hideBehindCoverTime number 
---@field hideTargetNotVisibleTime number 
---@field hideShieldFraction number 
---@field attackShieldFraction number 
---@field pursueShieldFraction number 
---@field defensiveCrouchType EngineTagDataActorDefensiveCrouchType 
---@field attackingCrouchThreshold number 
---@field defendingCrouchThreshold number 
---@field minStandTime number 
---@field minCrouchTime number 
---@field defendingHideTimeModifier number 
---@field attackingEvasionThreshold number 
---@field defendingEvasionThreshold number 
---@field evasionSeekCoverChance number 
---@field evasionDelayTime number 
---@field maxSeekCoverDistance number 
---@field coverDamageThreshold number 
---@field stalkingDiscoveryTime number 
---@field stalkingMaxDistance number 
---@field stationaryFacingAngle MetaEngineAngle 
---@field changeFacingStandTime number 
---@field uncoverDelayTime number 
---@field targetSearchTime number 
---@field pursuitPositionTime number 
---@field numPositionsCoord integer 
---@field numPositionsNormal integer 
---@field meleeAttackDelay number 
---@field meleeFudgeFactor number 
---@field meleeChargeTime number 
---@field meleeLeapRange number 
---@field meleeLeapVelocity number 
---@field meleeLeapChance number 
---@field meleeLeapBallistic number 
---@field berserkDamageAmount number 
---@field berserkDamageThreshold number 
---@field berserkProximity number 
---@field suicideSensingDist number 
---@field berserkGrenadeChance number 
---@field guardPositionTime number 
---@field combatPositionTime number 
---@field oldPositionAvoidDist number 
---@field friendAvoidDist number 
---@field noncombatIdleSpeechTime number 
---@field combatIdleSpeechTime number 
---@field doNotUse_2 MetaEngineTagDependency 

---@class EngineTagDataShaderTransparentGlassReflectionTypeEnum : Enum 

---@class EngineTagDataShaderTransparentGlassReflectionTypeBumpedCubeMap : EngineTagDataShaderTransparentGlassReflectionTypeEnum 
---@class EngineTagDataShaderTransparentGlassReflectionTypeFlatCubeMap : EngineTagDataShaderTransparentGlassReflectionTypeEnum 
---@class EngineTagDataShaderTransparentGlassReflectionTypeDynamicMirror : EngineTagDataShaderTransparentGlassReflectionTypeEnum 

---@alias EngineTagDataShaderTransparentGlassReflectionType 
---| EngineTagDataShaderTransparentGlassReflectionTypeBumpedCubeMap
---| EngineTagDataShaderTransparentGlassReflectionTypeFlatCubeMap
---| EngineTagDataShaderTransparentGlassReflectionTypeDynamicMirror

---@class EngineTagDataShaderTransparentGlassReflectionTypeTable 
---@field ypeBumpedCubeMap EngineTagDataShaderTransparentGlassReflectionTypeBumpedCubeMap
---@field ypeFlatCubeMap EngineTagDataShaderTransparentGlassReflectionTypeFlatCubeMap
---@field ypeDynamicMirror EngineTagDataShaderTransparentGlassReflectionTypeDynamicMirror
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

---@class MetaEngineTagDataModelRegionPermutationFlags 
---@field cannotBeChosenRandomly boolean 

---@class MetaEngineTagDataModelGeometryPartFlags 
---@field strippedInternal boolean 
---@field zoner boolean 

---@class MetaEngineTagDataModelFlags 
---@field blendSharedNormals boolean 
---@field partsHaveLocalNodes boolean 
---@field ignoreSkinning boolean 

---@class MetaEngineTagDataModelMarkerInstance 
---@field regionIndex integer 
---@field permutationIndex integer 
---@field nodeIndex integer 
---@field translation MetaEnginePoint3D 
---@field rotation MetaEngineQuaternion 

---@class MetaEngineTagDataModelMarker 
---@field name MetaEngineTagString 
---@field magicIdentifier integer 
---@field instances table<MetaEngineTagDataModelMarkerInstance> 

---@class MetaEngineTagDataModelNode 
---@field name MetaEngineTagString 
---@field nextSiblingNodeIndex MetaEngineIndex 
---@field firstChildNodeIndex MetaEngineIndex 
---@field parentNodeIndex MetaEngineIndex 
---@field defaultTranslation MetaEnginePoint3D 
---@field defaultRotation MetaEngineQuaternion 
---@field nodeDistanceFromParent number 
---@field scale number 
---@field rotation MetaEngineMatrix 
---@field translation MetaEnginePoint3D 

---@class MetaEngineTagDataModelRegionPermutationMarker 
---@field name MetaEngineTagString 
---@field nodeIndex MetaEngineIndex 
---@field rotation MetaEngineQuaternion 
---@field translation MetaEnginePoint3D 

---@class MetaEngineTagDataModelRegionPermutation 
---@field name MetaEngineTagString 
---@field flags MetaEngineTagDataModelRegionPermutationFlags 
---@field permutationNumber integer 
---@field superLow MetaEngineIndex 
---@field low MetaEngineIndex 
---@field medium MetaEngineIndex 
---@field high MetaEngineIndex 
---@field superHigh MetaEngineIndex 
---@field markers table<MetaEngineTagDataModelRegionPermutationMarker> 

---@class MetaEngineTagDataModelRegion 
---@field name MetaEngineTagString 
---@field permutations table<MetaEngineTagDataModelRegionPermutation> 

---@class MetaEngineTagDataModelVertexUncompressed 
---@field position MetaEnginePoint3D 
---@field normal MetaEngineVector3D 
---@field binormal MetaEngineVector3D 
---@field tangent MetaEngineVector3D 
---@field textureCoords MetaEnginePoint2D 
---@field node0Index MetaEngineIndex 
---@field node1Index MetaEngineIndex 
---@field node0Weight number 
---@field node1Weight number 

---@class MetaEngineTagDataModelVertexCompressed 
---@field position MetaEnginePoint3D 
---@field normal integer 
---@field binormal integer 
---@field tangent integer 
---@field textureCoordinateU integer 
---@field textureCoordinateV integer 
---@field node0Index integer 
---@field node1Index integer 
---@field node0Weight integer 

---@class MetaEngineTagDataModelTriangle 
---@field vertex0Index MetaEngineIndex 
---@field vertex1Index MetaEngineIndex 
---@field vertex2Index MetaEngineIndex 

---@class MetaEngineTagDataModelGeometryPart 
---@field flags MetaEngineTagDataModelGeometryPartFlags 
---@field shaderIndex MetaEngineIndex 
---@field prevFilthyPartIndex integer 
---@field nextFilthyPartIndex integer 
---@field centroidPrimaryNode MetaEngineIndex 
---@field centroidSecondaryNode MetaEngineIndex 
---@field centroidPrimaryWeight MetaEngineFraction 
---@field centroidSecondaryWeight MetaEngineFraction 
---@field centroid MetaEnginePoint3D 
---@field uncompressedVertices table<MetaEngineTagDataModelVertexUncompressed> 
---@field compressedVertices table<MetaEngineTagDataModelVertexCompressed> 
---@field triangles table<MetaEngineTagDataModelTriangle> 
---@field doNotCrashTheGame integer 
---@field triangleCount integer 
---@field triangleOffset integer 
---@field triangleOffset_2 integer 
---@field vertexType EngineTagDataVertexType 
---@field vertexCount integer 
---@field vertexPointer integer 
---@field vertexOffset integer 

---@class MetaEngineTagDataModelGeometry 
---@field flags MetaEngineTagDataIsUnusedFlag 
---@field parts table<MetaEngineTagDataModelGeometryPart> 

---@class MetaEngineTagDataModelShaderReference 
---@field shader MetaEngineTagDependency 
---@field permutation MetaEngineIndex 

---@class MetaEngineTagDataModel 
---@field flags MetaEngineTagDataModelFlags 
---@field nodeListChecksum integer 
---@field superHighDetailCutoff number 
---@field highDetailCutoff number 
---@field mediumDetailCutoff number 
---@field lowDetailCutoff number 
---@field superLowDetailCutoff number 
---@field superLowDetailNodeCount integer 
---@field lowDetailNodeCount integer 
---@field mediumDetailNodeCount integer 
---@field highDetailNodeCount integer 
---@field superHighDetailNodeCount integer 
---@field baseMapUScale number 
---@field baseMapVScale number 
---@field markers table<MetaEngineTagDataModelMarker> 
---@field nodes table<MetaEngineTagDataModelNode> 
---@field regions table<MetaEngineTagDataModelRegion> 
---@field geometries table<MetaEngineTagDataModelGeometry> 
---@field shaders table<MetaEngineTagDataModelShaderReference> 

---@class EngineTagDataShaderEnvironmentTypeEnum : Enum 

---@class EngineTagDataShaderEnvironmentTypeNormal : EngineTagDataShaderEnvironmentTypeEnum 
---@class EngineTagDataShaderEnvironmentTypeBlended : EngineTagDataShaderEnvironmentTypeEnum 
---@class EngineTagDataShaderEnvironmentTypeBlendedBaseSpecular : EngineTagDataShaderEnvironmentTypeEnum 

---@alias EngineTagDataShaderEnvironmentType 
---| EngineTagDataShaderEnvironmentTypeNormal
---| EngineTagDataShaderEnvironmentTypeBlended
---| EngineTagDataShaderEnvironmentTypeBlendedBaseSpecular

---@class EngineTagDataShaderEnvironmentTypeTable 
---@field eNormal EngineTagDataShaderEnvironmentTypeNormal
---@field eBlended EngineTagDataShaderEnvironmentTypeBlended
---@field eBlendedBaseSpecular EngineTagDataShaderEnvironmentTypeBlendedBaseSpecular
Engine.tag.shaderEnvironmentType = {} 

---@class EngineTagDataShaderEnvironmentReflectionTypeEnum : Enum 

---@class EngineTagDataShaderEnvironmentReflectionTypeBumpedCubeMap : EngineTagDataShaderEnvironmentReflectionTypeEnum 
---@class EngineTagDataShaderEnvironmentReflectionTypeFlatCubeMap : EngineTagDataShaderEnvironmentReflectionTypeEnum 
---@class EngineTagDataShaderEnvironmentReflectionTypeBumpedRadiosity : EngineTagDataShaderEnvironmentReflectionTypeEnum 

---@alias EngineTagDataShaderEnvironmentReflectionType 
---| EngineTagDataShaderEnvironmentReflectionTypeBumpedCubeMap
---| EngineTagDataShaderEnvironmentReflectionTypeFlatCubeMap
---| EngineTagDataShaderEnvironmentReflectionTypeBumpedRadiosity

---@class EngineTagDataShaderEnvironmentReflectionTypeTable 
---@field peBumpedCubeMap EngineTagDataShaderEnvironmentReflectionTypeBumpedCubeMap
---@field peFlatCubeMap EngineTagDataShaderEnvironmentReflectionTypeFlatCubeMap
---@field peBumpedRadiosity EngineTagDataShaderEnvironmentReflectionTypeBumpedRadiosity
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

---@class MetaEngineTagDataShaderTransparentWaterFlags 
---@field baseMapAlphaModulatesReflection boolean 
---@field baseMapColorModulatesBackground boolean 
---@field atmosphericFog boolean 
---@field drawBeforeFog boolean 

---@class MetaEngineTagDataShaderTransparentWaterRipple 
---@field contributionFactor MetaEngineFraction 
---@field animationAngle MetaEngineAngle 
---@field animationVelocity number 
---@field mapOffset MetaEngineVector2D 
---@field mapRepeats integer 
---@field mapIndex MetaEngineIndex 

---@class MetaEngineTagDataShaderTransparentWater: MetaEngineTagDataShader  
---@field waterFlags MetaEngineTagDataShaderTransparentWaterFlags 
---@field baseMap MetaEngineTagDependency 
---@field viewPerpendicularBrightness MetaEngineFraction 
---@field viewPerpendicularTintColor MetaEngineColorRGB 
---@field viewParallelBrightness MetaEngineFraction 
---@field viewParallelTintColor MetaEngineColorRGB 
---@field reflectionMap MetaEngineTagDependency 
---@field rippleAnimationAngle MetaEngineAngle 
---@field rippleAnimationVelocity number 
---@field rippleScale number 
---@field rippleMaps MetaEngineTagDependency 
---@field rippleMipmapLevels integer 
---@field rippleMipmapFadeFactor MetaEngineFraction 
---@field rippleMipmapDetailBias number 
---@field ripples table<MetaEngineTagDataShaderTransparentWaterRipple> 

---@class EngineTagDataFramebufferBlendFunctionEnum : Enum 

---@class EngineTagDataFramebufferBlendFunctionAlphaBlend : EngineTagDataFramebufferBlendFunctionEnum 
---@class EngineTagDataFramebufferBlendFunctionMultiply : EngineTagDataFramebufferBlendFunctionEnum 
---@class EngineTagDataFramebufferBlendFunctionDoubleMultiply : EngineTagDataFramebufferBlendFunctionEnum 
---@class EngineTagDataFramebufferBlendFunctionAdd : EngineTagDataFramebufferBlendFunctionEnum 
---@class EngineTagDataFramebufferBlendFunctionSubtract : EngineTagDataFramebufferBlendFunctionEnum 
---@class EngineTagDataFramebufferBlendFunctionComponentMin : EngineTagDataFramebufferBlendFunctionEnum 
---@class EngineTagDataFramebufferBlendFunctionComponentMax : EngineTagDataFramebufferBlendFunctionEnum 
---@class EngineTagDataFramebufferBlendFunctionAlphaMultiplyAdd : EngineTagDataFramebufferBlendFunctionEnum 

---@alias EngineTagDataFramebufferBlendFunction 
---| EngineTagDataFramebufferBlendFunctionAlphaBlend
---| EngineTagDataFramebufferBlendFunctionMultiply
---| EngineTagDataFramebufferBlendFunctionDoubleMultiply
---| EngineTagDataFramebufferBlendFunctionAdd
---| EngineTagDataFramebufferBlendFunctionSubtract
---| EngineTagDataFramebufferBlendFunctionComponentMin
---| EngineTagDataFramebufferBlendFunctionComponentMax
---| EngineTagDataFramebufferBlendFunctionAlphaMultiplyAdd

---@class EngineTagDataFramebufferBlendFunctionTable 
---@field nAlphaBlend EngineTagDataFramebufferBlendFunctionAlphaBlend
---@field nMultiply EngineTagDataFramebufferBlendFunctionMultiply
---@field nDoubleMultiply EngineTagDataFramebufferBlendFunctionDoubleMultiply
---@field nAdd EngineTagDataFramebufferBlendFunctionAdd
---@field nSubtract EngineTagDataFramebufferBlendFunctionSubtract
---@field nComponentMin EngineTagDataFramebufferBlendFunctionComponentMin
---@field nComponentMax EngineTagDataFramebufferBlendFunctionComponentMax
---@field nAlphaMultiplyAdd EngineTagDataFramebufferBlendFunctionAlphaMultiplyAdd
Engine.tag.framebufferBlendFunction = {} 

---@class EngineTagDataFramebufferFadeModeEnum : Enum 

---@class EngineTagDataFramebufferFadeModeNone : EngineTagDataFramebufferFadeModeEnum 
---@class EngineTagDataFramebufferFadeModeFadeWhenPerpendicular : EngineTagDataFramebufferFadeModeEnum 
---@class EngineTagDataFramebufferFadeModeFadeWhenParallel : EngineTagDataFramebufferFadeModeEnum 

---@alias EngineTagDataFramebufferFadeMode 
---| EngineTagDataFramebufferFadeModeNone
---| EngineTagDataFramebufferFadeModeFadeWhenPerpendicular
---| EngineTagDataFramebufferFadeModeFadeWhenParallel

---@class EngineTagDataFramebufferFadeModeTable 
---@field eNone EngineTagDataFramebufferFadeModeNone
---@field eFadeWhenPerpendicular EngineTagDataFramebufferFadeModeFadeWhenPerpendicular
---@field eFadeWhenParallel EngineTagDataFramebufferFadeModeFadeWhenParallel
Engine.tag.framebufferFadeMode = {} 

---@class EngineTagDataFunctionOutEnum : Enum 

---@class EngineTagDataFunctionOutNone : EngineTagDataFunctionOutEnum 
---@class EngineTagDataFunctionOutAOut : EngineTagDataFunctionOutEnum 
---@class EngineTagDataFunctionOutBOut : EngineTagDataFunctionOutEnum 
---@class EngineTagDataFunctionOutCOut : EngineTagDataFunctionOutEnum 
---@class EngineTagDataFunctionOutDOut : EngineTagDataFunctionOutEnum 

---@alias EngineTagDataFunctionOut 
---| EngineTagDataFunctionOutNone
---| EngineTagDataFunctionOutAOut
---| EngineTagDataFunctionOutBOut
---| EngineTagDataFunctionOutCOut
---| EngineTagDataFunctionOutDOut

---@class EngineTagDataFunctionOutTable 
---@field none EngineTagDataFunctionOutNone
---@field aOut EngineTagDataFunctionOutAOut
---@field bOut EngineTagDataFunctionOutBOut
---@field cOut EngineTagDataFunctionOutCOut
---@field dOut EngineTagDataFunctionOutDOut
Engine.tag.functionOut = {} 

---@class EngineTagDataWaveFunctionEnum : Enum 

---@class EngineTagDataWaveFunctionOne : EngineTagDataWaveFunctionEnum 
---@class EngineTagDataWaveFunctionZero : EngineTagDataWaveFunctionEnum 
---@class EngineTagDataWaveFunctionCosine : EngineTagDataWaveFunctionEnum 
---@class EngineTagDataWaveFunctionCosineVariablePeriod : EngineTagDataWaveFunctionEnum 
---@class EngineTagDataWaveFunctionDiagonalWave : EngineTagDataWaveFunctionEnum 
---@class EngineTagDataWaveFunctionDiagonalWaveVariablePeriod : EngineTagDataWaveFunctionEnum 
---@class EngineTagDataWaveFunctionSlide : EngineTagDataWaveFunctionEnum 
---@class EngineTagDataWaveFunctionSlideVariablePeriod : EngineTagDataWaveFunctionEnum 
---@class EngineTagDataWaveFunctionNoise : EngineTagDataWaveFunctionEnum 
---@class EngineTagDataWaveFunctionJitter : EngineTagDataWaveFunctionEnum 
---@class EngineTagDataWaveFunctionWander : EngineTagDataWaveFunctionEnum 
---@class EngineTagDataWaveFunctionSpark : EngineTagDataWaveFunctionEnum 

---@alias EngineTagDataWaveFunction 
---| EngineTagDataWaveFunctionOne
---| EngineTagDataWaveFunctionZero
---| EngineTagDataWaveFunctionCosine
---| EngineTagDataWaveFunctionCosineVariablePeriod
---| EngineTagDataWaveFunctionDiagonalWave
---| EngineTagDataWaveFunctionDiagonalWaveVariablePeriod
---| EngineTagDataWaveFunctionSlide
---| EngineTagDataWaveFunctionSlideVariablePeriod
---| EngineTagDataWaveFunctionNoise
---| EngineTagDataWaveFunctionJitter
---| EngineTagDataWaveFunctionWander
---| EngineTagDataWaveFunctionSpark

---@class EngineTagDataWaveFunctionTable 
---@field one EngineTagDataWaveFunctionOne
---@field zero EngineTagDataWaveFunctionZero
---@field cosine EngineTagDataWaveFunctionCosine
---@field cosineVariablePeriod EngineTagDataWaveFunctionCosineVariablePeriod
---@field diagonalWave EngineTagDataWaveFunctionDiagonalWave
---@field diagonalWaveVariablePeriod EngineTagDataWaveFunctionDiagonalWaveVariablePeriod
---@field slide EngineTagDataWaveFunctionSlide
---@field slideVariablePeriod EngineTagDataWaveFunctionSlideVariablePeriod
---@field noise EngineTagDataWaveFunctionNoise
---@field jitter EngineTagDataWaveFunctionJitter
---@field wander EngineTagDataWaveFunctionWander
---@field spark EngineTagDataWaveFunctionSpark
Engine.tag.waveFunction = {} 

---@class EngineTagDataMaterialTypeEnum : Enum 

---@class EngineTagDataMaterialTypeDirt : EngineTagDataMaterialTypeEnum 
---@class EngineTagDataMaterialTypeSand : EngineTagDataMaterialTypeEnum 
---@class EngineTagDataMaterialTypeStone : EngineTagDataMaterialTypeEnum 
---@class EngineTagDataMaterialTypeSnow : EngineTagDataMaterialTypeEnum 
---@class EngineTagDataMaterialTypeWood : EngineTagDataMaterialTypeEnum 
---@class EngineTagDataMaterialTypeMetalHollow : EngineTagDataMaterialTypeEnum 
---@class EngineTagDataMaterialTypeMetalThin : EngineTagDataMaterialTypeEnum 
---@class EngineTagDataMaterialTypeMetalThick : EngineTagDataMaterialTypeEnum 
---@class EngineTagDataMaterialTypeRubber : EngineTagDataMaterialTypeEnum 
---@class EngineTagDataMaterialTypeGlass : EngineTagDataMaterialTypeEnum 
---@class EngineTagDataMaterialTypeForceField : EngineTagDataMaterialTypeEnum 
---@class EngineTagDataMaterialTypeGrunt : EngineTagDataMaterialTypeEnum 
---@class EngineTagDataMaterialTypeHunterArmor : EngineTagDataMaterialTypeEnum 
---@class EngineTagDataMaterialTypeHunterSkin : EngineTagDataMaterialTypeEnum 
---@class EngineTagDataMaterialTypeElite : EngineTagDataMaterialTypeEnum 
---@class EngineTagDataMaterialTypeJackal : EngineTagDataMaterialTypeEnum 
---@class EngineTagDataMaterialTypeJackalEnergyShield : EngineTagDataMaterialTypeEnum 
---@class EngineTagDataMaterialTypeEngineerSkin : EngineTagDataMaterialTypeEnum 
---@class EngineTagDataMaterialTypeEngineerForceField : EngineTagDataMaterialTypeEnum 
---@class EngineTagDataMaterialTypeFloodCombatForm : EngineTagDataMaterialTypeEnum 
---@class EngineTagDataMaterialTypeFloodCarrierForm : EngineTagDataMaterialTypeEnum 
---@class EngineTagDataMaterialTypeCyborgArmor : EngineTagDataMaterialTypeEnum 
---@class EngineTagDataMaterialTypeCyborgEnergyShield : EngineTagDataMaterialTypeEnum 
---@class EngineTagDataMaterialTypeHumanArmor : EngineTagDataMaterialTypeEnum 
---@class EngineTagDataMaterialTypeHumanSkin : EngineTagDataMaterialTypeEnum 
---@class EngineTagDataMaterialTypeSentinel : EngineTagDataMaterialTypeEnum 
---@class EngineTagDataMaterialTypeMonitor : EngineTagDataMaterialTypeEnum 
---@class EngineTagDataMaterialTypePlastic : EngineTagDataMaterialTypeEnum 
---@class EngineTagDataMaterialTypeWater : EngineTagDataMaterialTypeEnum 
---@class EngineTagDataMaterialTypeLeaves : EngineTagDataMaterialTypeEnum 
---@class EngineTagDataMaterialTypeEliteEnergyShield : EngineTagDataMaterialTypeEnum 
---@class EngineTagDataMaterialTypeIce : EngineTagDataMaterialTypeEnum 
---@class EngineTagDataMaterialTypeHunterShield : EngineTagDataMaterialTypeEnum 

---@alias EngineTagDataMaterialType 
---| EngineTagDataMaterialTypeDirt
---| EngineTagDataMaterialTypeSand
---| EngineTagDataMaterialTypeStone
---| EngineTagDataMaterialTypeSnow
---| EngineTagDataMaterialTypeWood
---| EngineTagDataMaterialTypeMetalHollow
---| EngineTagDataMaterialTypeMetalThin
---| EngineTagDataMaterialTypeMetalThick
---| EngineTagDataMaterialTypeRubber
---| EngineTagDataMaterialTypeGlass
---| EngineTagDataMaterialTypeForceField
---| EngineTagDataMaterialTypeGrunt
---| EngineTagDataMaterialTypeHunterArmor
---| EngineTagDataMaterialTypeHunterSkin
---| EngineTagDataMaterialTypeElite
---| EngineTagDataMaterialTypeJackal
---| EngineTagDataMaterialTypeJackalEnergyShield
---| EngineTagDataMaterialTypeEngineerSkin
---| EngineTagDataMaterialTypeEngineerForceField
---| EngineTagDataMaterialTypeFloodCombatForm
---| EngineTagDataMaterialTypeFloodCarrierForm
---| EngineTagDataMaterialTypeCyborgArmor
---| EngineTagDataMaterialTypeCyborgEnergyShield
---| EngineTagDataMaterialTypeHumanArmor
---| EngineTagDataMaterialTypeHumanSkin
---| EngineTagDataMaterialTypeSentinel
---| EngineTagDataMaterialTypeMonitor
---| EngineTagDataMaterialTypePlastic
---| EngineTagDataMaterialTypeWater
---| EngineTagDataMaterialTypeLeaves
---| EngineTagDataMaterialTypeEliteEnergyShield
---| EngineTagDataMaterialTypeIce
---| EngineTagDataMaterialTypeHunterShield

---@class EngineTagDataMaterialTypeTable 
---@field dirt EngineTagDataMaterialTypeDirt
---@field sand EngineTagDataMaterialTypeSand
---@field stone EngineTagDataMaterialTypeStone
---@field snow EngineTagDataMaterialTypeSnow
---@field wood EngineTagDataMaterialTypeWood
---@field metalHollow EngineTagDataMaterialTypeMetalHollow
---@field metalThin EngineTagDataMaterialTypeMetalThin
---@field metalThick EngineTagDataMaterialTypeMetalThick
---@field rubber EngineTagDataMaterialTypeRubber
---@field glass EngineTagDataMaterialTypeGlass
---@field forceField EngineTagDataMaterialTypeForceField
---@field grunt EngineTagDataMaterialTypeGrunt
---@field hunterArmor EngineTagDataMaterialTypeHunterArmor
---@field hunterSkin EngineTagDataMaterialTypeHunterSkin
---@field elite EngineTagDataMaterialTypeElite
---@field jackal EngineTagDataMaterialTypeJackal
---@field jackalEnergyShield EngineTagDataMaterialTypeJackalEnergyShield
---@field engineerSkin EngineTagDataMaterialTypeEngineerSkin
---@field engineerForceField EngineTagDataMaterialTypeEngineerForceField
---@field floodCombatForm EngineTagDataMaterialTypeFloodCombatForm
---@field floodCarrierForm EngineTagDataMaterialTypeFloodCarrierForm
---@field cyborgArmor EngineTagDataMaterialTypeCyborgArmor
---@field cyborgEnergyShield EngineTagDataMaterialTypeCyborgEnergyShield
---@field humanArmor EngineTagDataMaterialTypeHumanArmor
---@field humanSkin EngineTagDataMaterialTypeHumanSkin
---@field sentinel EngineTagDataMaterialTypeSentinel
---@field monitor EngineTagDataMaterialTypeMonitor
---@field plastic EngineTagDataMaterialTypePlastic
---@field water EngineTagDataMaterialTypeWater
---@field leaves EngineTagDataMaterialTypeLeaves
---@field eliteEnergyShield EngineTagDataMaterialTypeEliteEnergyShield
---@field ice EngineTagDataMaterialTypeIce
---@field hunterShield EngineTagDataMaterialTypeHunterShield
Engine.tag.materialType = {} 

---@class EngineTagDataFunctionTypeEnum : Enum 

---@class EngineTagDataFunctionTypeLinear : EngineTagDataFunctionTypeEnum 
---@class EngineTagDataFunctionTypeEarly : EngineTagDataFunctionTypeEnum 
---@class EngineTagDataFunctionTypeVeryEarly : EngineTagDataFunctionTypeEnum 
---@class EngineTagDataFunctionTypeLate : EngineTagDataFunctionTypeEnum 
---@class EngineTagDataFunctionTypeVeryLate : EngineTagDataFunctionTypeEnum 
---@class EngineTagDataFunctionTypeCosine : EngineTagDataFunctionTypeEnum 

---@alias EngineTagDataFunctionType 
---| EngineTagDataFunctionTypeLinear
---| EngineTagDataFunctionTypeEarly
---| EngineTagDataFunctionTypeVeryEarly
---| EngineTagDataFunctionTypeLate
---| EngineTagDataFunctionTypeVeryLate
---| EngineTagDataFunctionTypeCosine

---@class EngineTagDataFunctionTypeTable 
---@field linear EngineTagDataFunctionTypeLinear
---@field early EngineTagDataFunctionTypeEarly
---@field veryEarly EngineTagDataFunctionTypeVeryEarly
---@field late EngineTagDataFunctionTypeLate
---@field veryLate EngineTagDataFunctionTypeVeryLate
---@field cosine EngineTagDataFunctionTypeCosine
Engine.tag.functionType = {} 

---@class EngineTagDataFunctionBoundsModeEnum : Enum 

---@class EngineTagDataFunctionBoundsModeClip : EngineTagDataFunctionBoundsModeEnum 
---@class EngineTagDataFunctionBoundsModeClipAndNormalize : EngineTagDataFunctionBoundsModeEnum 
---@class EngineTagDataFunctionBoundsModeScaleToFit : EngineTagDataFunctionBoundsModeEnum 

---@alias EngineTagDataFunctionBoundsMode 
---| EngineTagDataFunctionBoundsModeClip
---| EngineTagDataFunctionBoundsModeClipAndNormalize
---| EngineTagDataFunctionBoundsModeScaleToFit

---@class EngineTagDataFunctionBoundsModeTable 
---@field eClip EngineTagDataFunctionBoundsModeClip
---@field eClipAndNormalize EngineTagDataFunctionBoundsModeClipAndNormalize
---@field eScaleToFit EngineTagDataFunctionBoundsModeScaleToFit
Engine.tag.functionBoundsMode = {} 

---@class EngineTagDataFunctionScaleByEnum : Enum 

---@class EngineTagDataFunctionScaleByNone : EngineTagDataFunctionScaleByEnum 
---@class EngineTagDataFunctionScaleByAIn : EngineTagDataFunctionScaleByEnum 
---@class EngineTagDataFunctionScaleByBIn : EngineTagDataFunctionScaleByEnum 
---@class EngineTagDataFunctionScaleByCIn : EngineTagDataFunctionScaleByEnum 
---@class EngineTagDataFunctionScaleByDIn : EngineTagDataFunctionScaleByEnum 
---@class EngineTagDataFunctionScaleByAOut : EngineTagDataFunctionScaleByEnum 
---@class EngineTagDataFunctionScaleByBOut : EngineTagDataFunctionScaleByEnum 
---@class EngineTagDataFunctionScaleByCOut : EngineTagDataFunctionScaleByEnum 
---@class EngineTagDataFunctionScaleByDOut : EngineTagDataFunctionScaleByEnum 

---@alias EngineTagDataFunctionScaleBy 
---| EngineTagDataFunctionScaleByNone
---| EngineTagDataFunctionScaleByAIn
---| EngineTagDataFunctionScaleByBIn
---| EngineTagDataFunctionScaleByCIn
---| EngineTagDataFunctionScaleByDIn
---| EngineTagDataFunctionScaleByAOut
---| EngineTagDataFunctionScaleByBOut
---| EngineTagDataFunctionScaleByCOut
---| EngineTagDataFunctionScaleByDOut

---@class EngineTagDataFunctionScaleByTable 
---@field yNone EngineTagDataFunctionScaleByNone
---@field yAIn EngineTagDataFunctionScaleByAIn
---@field yBIn EngineTagDataFunctionScaleByBIn
---@field yCIn EngineTagDataFunctionScaleByCIn
---@field yDIn EngineTagDataFunctionScaleByDIn
---@field yAOut EngineTagDataFunctionScaleByAOut
---@field yBOut EngineTagDataFunctionScaleByBOut
---@field yCOut EngineTagDataFunctionScaleByCOut
---@field yDOut EngineTagDataFunctionScaleByDOut
Engine.tag.functionScaleBy = {} 

---@class EngineTagDataFunctionNameNullableEnum : Enum 

---@class EngineTagDataFunctionNameNullableNone : EngineTagDataFunctionNameNullableEnum 
---@class EngineTagDataFunctionNameNullableA : EngineTagDataFunctionNameNullableEnum 
---@class EngineTagDataFunctionNameNullableB : EngineTagDataFunctionNameNullableEnum 
---@class EngineTagDataFunctionNameNullableC : EngineTagDataFunctionNameNullableEnum 
---@class EngineTagDataFunctionNameNullableD : EngineTagDataFunctionNameNullableEnum 

---@alias EngineTagDataFunctionNameNullable 
---| EngineTagDataFunctionNameNullableNone
---| EngineTagDataFunctionNameNullableA
---| EngineTagDataFunctionNameNullableB
---| EngineTagDataFunctionNameNullableC
---| EngineTagDataFunctionNameNullableD

---@class EngineTagDataFunctionNameNullableTable 
---@field eNone EngineTagDataFunctionNameNullableNone
---@field eA EngineTagDataFunctionNameNullableA
---@field eB EngineTagDataFunctionNameNullableB
---@field eC EngineTagDataFunctionNameNullableC
---@field eD EngineTagDataFunctionNameNullableD
Engine.tag.functionNameNullable = {} 

---@class EngineTagDataGrenadeTypeEnum : Enum 

---@class EngineTagDataGrenadeTypeHumanFragmentation : EngineTagDataGrenadeTypeEnum 
---@class EngineTagDataGrenadeTypeCovenantPlasma : EngineTagDataGrenadeTypeEnum 
---@class EngineTagDataGrenadeTypeGrenadeType_2 : EngineTagDataGrenadeTypeEnum 
---@class EngineTagDataGrenadeTypeGrenadeType_3 : EngineTagDataGrenadeTypeEnum 

---@alias EngineTagDataGrenadeType 
---| EngineTagDataGrenadeTypeHumanFragmentation
---| EngineTagDataGrenadeTypeCovenantPlasma
---| EngineTagDataGrenadeTypeGrenadeType_2
---| EngineTagDataGrenadeTypeGrenadeType_3

---@class EngineTagDataGrenadeTypeTable 
---@field humanFragmentation EngineTagDataGrenadeTypeHumanFragmentation
---@field covenantPlasma EngineTagDataGrenadeTypeCovenantPlasma
---@field grenadeType_2 EngineTagDataGrenadeTypeGrenadeType_2
---@field grenadeType_3 EngineTagDataGrenadeTypeGrenadeType_3
Engine.tag.grenadeType = {} 

---@class EngineTagDataVertexTypeEnum : Enum 

---@class EngineTagDataVertexTypeStructureBspUncompressedRenderedVertices : EngineTagDataVertexTypeEnum 
---@class EngineTagDataVertexTypeStructureBspCompressedRenderedVertices : EngineTagDataVertexTypeEnum 
---@class EngineTagDataVertexTypeStructureBspUncompressedLightmapVertices : EngineTagDataVertexTypeEnum 
---@class EngineTagDataVertexTypeStructureBspCompressedLightmapVertices : EngineTagDataVertexTypeEnum 
---@class EngineTagDataVertexTypeModelUncompressed : EngineTagDataVertexTypeEnum 
---@class EngineTagDataVertexTypeModelCompressed : EngineTagDataVertexTypeEnum 

---@alias EngineTagDataVertexType 
---| EngineTagDataVertexTypeStructureBspUncompressedRenderedVertices
---| EngineTagDataVertexTypeStructureBspCompressedRenderedVertices
---| EngineTagDataVertexTypeStructureBspUncompressedLightmapVertices
---| EngineTagDataVertexTypeStructureBspCompressedLightmapVertices
---| EngineTagDataVertexTypeModelUncompressed
---| EngineTagDataVertexTypeModelCompressed

---@class EngineTagDataVertexTypeTable 
---@field structureBspUncompressedRenderedVertices EngineTagDataVertexTypeStructureBspUncompressedRenderedVertices
---@field structureBspCompressedRenderedVertices EngineTagDataVertexTypeStructureBspCompressedRenderedVertices
---@field structureBspUncompressedLightmapVertices EngineTagDataVertexTypeStructureBspUncompressedLightmapVertices
---@field structureBspCompressedLightmapVertices EngineTagDataVertexTypeStructureBspCompressedLightmapVertices
---@field modelUncompressed EngineTagDataVertexTypeModelUncompressed
---@field modelCompressed EngineTagDataVertexTypeModelCompressed
Engine.tag.vertexType = {} 

---@class EngineTagDataBitmapDataTypeEnum : Enum 

---@class EngineTagDataBitmapDataType_2dTexture : EngineTagDataBitmapDataTypeEnum 
---@class EngineTagDataBitmapDataType_3dTexture : EngineTagDataBitmapDataTypeEnum 
---@class EngineTagDataBitmapDataTypeCubeMap : EngineTagDataBitmapDataTypeEnum 
---@class EngineTagDataBitmapDataTypeWhite : EngineTagDataBitmapDataTypeEnum 

---@alias EngineTagDataBitmapDataType 
---| EngineTagDataBitmapDataType_2dTexture
---| EngineTagDataBitmapDataType_3dTexture
---| EngineTagDataBitmapDataTypeCubeMap
---| EngineTagDataBitmapDataTypeWhite

---@class EngineTagDataBitmapDataTypeTable 
---@field e_2dTexture EngineTagDataBitmapDataType_2dTexture
---@field e_3dTexture EngineTagDataBitmapDataType_3dTexture
---@field eCubeMap EngineTagDataBitmapDataTypeCubeMap
---@field eWhite EngineTagDataBitmapDataTypeWhite
Engine.tag.bitmapDataType = {} 

---@class EngineTagDataBitmapDataFormatEnum : Enum 

---@class EngineTagDataBitmapDataFormatA8 : EngineTagDataBitmapDataFormatEnum 
---@class EngineTagDataBitmapDataFormatY8 : EngineTagDataBitmapDataFormatEnum 
---@class EngineTagDataBitmapDataFormatAy8 : EngineTagDataBitmapDataFormatEnum 
---@class EngineTagDataBitmapDataFormatA8y8 : EngineTagDataBitmapDataFormatEnum 
---@class EngineTagDataBitmapDataFormatUnused1 : EngineTagDataBitmapDataFormatEnum 
---@class EngineTagDataBitmapDataFormatUnused2 : EngineTagDataBitmapDataFormatEnum 
---@class EngineTagDataBitmapDataFormatR5g6b5 : EngineTagDataBitmapDataFormatEnum 
---@class EngineTagDataBitmapDataFormatUnused3 : EngineTagDataBitmapDataFormatEnum 
---@class EngineTagDataBitmapDataFormatA1r5g5b5 : EngineTagDataBitmapDataFormatEnum 
---@class EngineTagDataBitmapDataFormatA4r4g4b4 : EngineTagDataBitmapDataFormatEnum 
---@class EngineTagDataBitmapDataFormatX8r8g8b8 : EngineTagDataBitmapDataFormatEnum 
---@class EngineTagDataBitmapDataFormatA8r8g8b8 : EngineTagDataBitmapDataFormatEnum 
---@class EngineTagDataBitmapDataFormatUnused4 : EngineTagDataBitmapDataFormatEnum 
---@class EngineTagDataBitmapDataFormatUnused5 : EngineTagDataBitmapDataFormatEnum 
---@class EngineTagDataBitmapDataFormatDxt1 : EngineTagDataBitmapDataFormatEnum 
---@class EngineTagDataBitmapDataFormatDxt3 : EngineTagDataBitmapDataFormatEnum 
---@class EngineTagDataBitmapDataFormatDxt5 : EngineTagDataBitmapDataFormatEnum 
---@class EngineTagDataBitmapDataFormatP8Bump : EngineTagDataBitmapDataFormatEnum 

---@alias EngineTagDataBitmapDataFormat 
---| EngineTagDataBitmapDataFormatA8
---| EngineTagDataBitmapDataFormatY8
---| EngineTagDataBitmapDataFormatAy8
---| EngineTagDataBitmapDataFormatA8y8
---| EngineTagDataBitmapDataFormatUnused1
---| EngineTagDataBitmapDataFormatUnused2
---| EngineTagDataBitmapDataFormatR5g6b5
---| EngineTagDataBitmapDataFormatUnused3
---| EngineTagDataBitmapDataFormatA1r5g5b5
---| EngineTagDataBitmapDataFormatA4r4g4b4
---| EngineTagDataBitmapDataFormatX8r8g8b8
---| EngineTagDataBitmapDataFormatA8r8g8b8
---| EngineTagDataBitmapDataFormatUnused4
---| EngineTagDataBitmapDataFormatUnused5
---| EngineTagDataBitmapDataFormatDxt1
---| EngineTagDataBitmapDataFormatDxt3
---| EngineTagDataBitmapDataFormatDxt5
---| EngineTagDataBitmapDataFormatP8Bump

---@class EngineTagDataBitmapDataFormatTable 
---@field tA8 EngineTagDataBitmapDataFormatA8
---@field tY8 EngineTagDataBitmapDataFormatY8
---@field tAy8 EngineTagDataBitmapDataFormatAy8
---@field tA8y8 EngineTagDataBitmapDataFormatA8y8
---@field tUnused1 EngineTagDataBitmapDataFormatUnused1
---@field tUnused2 EngineTagDataBitmapDataFormatUnused2
---@field tR5g6b5 EngineTagDataBitmapDataFormatR5g6b5
---@field tUnused3 EngineTagDataBitmapDataFormatUnused3
---@field tA1r5g5b5 EngineTagDataBitmapDataFormatA1r5g5b5
---@field tA4r4g4b4 EngineTagDataBitmapDataFormatA4r4g4b4
---@field tX8r8g8b8 EngineTagDataBitmapDataFormatX8r8g8b8
---@field tA8r8g8b8 EngineTagDataBitmapDataFormatA8r8g8b8
---@field tUnused4 EngineTagDataBitmapDataFormatUnused4
---@field tUnused5 EngineTagDataBitmapDataFormatUnused5
---@field tDxt1 EngineTagDataBitmapDataFormatDxt1
---@field tDxt3 EngineTagDataBitmapDataFormatDxt3
---@field tDxt5 EngineTagDataBitmapDataFormatDxt5
---@field tP8Bump EngineTagDataBitmapDataFormatP8Bump
Engine.tag.bitmapDataFormat = {} 

---@class EngineTagDataBitmapTypeEnum : Enum 

---@class EngineTagDataBitmapType_2dTextures : EngineTagDataBitmapTypeEnum 
---@class EngineTagDataBitmapType_3dTextures : EngineTagDataBitmapTypeEnum 
---@class EngineTagDataBitmapTypeCubeMaps : EngineTagDataBitmapTypeEnum 
---@class EngineTagDataBitmapTypeSprites : EngineTagDataBitmapTypeEnum 
---@class EngineTagDataBitmapTypeInterfaceBitmaps : EngineTagDataBitmapTypeEnum 

---@alias EngineTagDataBitmapType 
---| EngineTagDataBitmapType_2dTextures
---| EngineTagDataBitmapType_3dTextures
---| EngineTagDataBitmapTypeCubeMaps
---| EngineTagDataBitmapTypeSprites
---| EngineTagDataBitmapTypeInterfaceBitmaps

---@class EngineTagDataBitmapTypeTable 
---@field _2dTextures EngineTagDataBitmapType_2dTextures
---@field _3dTextures EngineTagDataBitmapType_3dTextures
---@field cubeMaps EngineTagDataBitmapTypeCubeMaps
---@field sprites EngineTagDataBitmapTypeSprites
---@field interfaceBitmaps EngineTagDataBitmapTypeInterfaceBitmaps
Engine.tag.bitmapType = {} 

---@class EngineTagDataBitmapFormatEnum : Enum 

---@class EngineTagDataBitmapFormatDxt1 : EngineTagDataBitmapFormatEnum 
---@class EngineTagDataBitmapFormatDxt3 : EngineTagDataBitmapFormatEnum 
---@class EngineTagDataBitmapFormatDxt5 : EngineTagDataBitmapFormatEnum 
---@class EngineTagDataBitmapFormat_16Bit : EngineTagDataBitmapFormatEnum 
---@class EngineTagDataBitmapFormat_32Bit : EngineTagDataBitmapFormatEnum 
---@class EngineTagDataBitmapFormatMonochrome : EngineTagDataBitmapFormatEnum 

---@alias EngineTagDataBitmapFormat 
---| EngineTagDataBitmapFormatDxt1
---| EngineTagDataBitmapFormatDxt3
---| EngineTagDataBitmapFormatDxt5
---| EngineTagDataBitmapFormat_16Bit
---| EngineTagDataBitmapFormat_32Bit
---| EngineTagDataBitmapFormatMonochrome

---@class EngineTagDataBitmapFormatTable 
---@field dxt1 EngineTagDataBitmapFormatDxt1
---@field dxt3 EngineTagDataBitmapFormatDxt3
---@field dxt5 EngineTagDataBitmapFormatDxt5
---@field _16Bit EngineTagDataBitmapFormat_16Bit
---@field _32Bit EngineTagDataBitmapFormat_32Bit
---@field monochrome EngineTagDataBitmapFormatMonochrome
Engine.tag.bitmapFormat = {} 

---@class EngineTagDataBitmapUsageEnum : Enum 

---@class EngineTagDataBitmapUsageAlphaBlend : EngineTagDataBitmapUsageEnum 
---@class EngineTagDataBitmapUsageDefault : EngineTagDataBitmapUsageEnum 
---@class EngineTagDataBitmapUsageHeightMap : EngineTagDataBitmapUsageEnum 
---@class EngineTagDataBitmapUsageDetailMap : EngineTagDataBitmapUsageEnum 
---@class EngineTagDataBitmapUsageLightMap : EngineTagDataBitmapUsageEnum 
---@class EngineTagDataBitmapUsageVectorMap : EngineTagDataBitmapUsageEnum 

---@alias EngineTagDataBitmapUsage 
---| EngineTagDataBitmapUsageAlphaBlend
---| EngineTagDataBitmapUsageDefault
---| EngineTagDataBitmapUsageHeightMap
---| EngineTagDataBitmapUsageDetailMap
---| EngineTagDataBitmapUsageLightMap
---| EngineTagDataBitmapUsageVectorMap

---@class EngineTagDataBitmapUsageTable 
---@field alphaBlend EngineTagDataBitmapUsageAlphaBlend
---@field default EngineTagDataBitmapUsageDefault
---@field heightMap EngineTagDataBitmapUsageHeightMap
---@field detailMap EngineTagDataBitmapUsageDetailMap
---@field lightMap EngineTagDataBitmapUsageLightMap
---@field vectorMap EngineTagDataBitmapUsageVectorMap
Engine.tag.bitmapUsage = {} 

---@class EngineTagDataBitmapSpriteBudgetSizeEnum : Enum 

---@class EngineTagDataBitmapSpriteBudgetSize_32x32 : EngineTagDataBitmapSpriteBudgetSizeEnum 
---@class EngineTagDataBitmapSpriteBudgetSize_64x64 : EngineTagDataBitmapSpriteBudgetSizeEnum 
---@class EngineTagDataBitmapSpriteBudgetSize_128x128 : EngineTagDataBitmapSpriteBudgetSizeEnum 
---@class EngineTagDataBitmapSpriteBudgetSize_256x256 : EngineTagDataBitmapSpriteBudgetSizeEnum 
---@class EngineTagDataBitmapSpriteBudgetSize_512x512 : EngineTagDataBitmapSpriteBudgetSizeEnum 
---@class EngineTagDataBitmapSpriteBudgetSize_1024x1024 : EngineTagDataBitmapSpriteBudgetSizeEnum 

---@alias EngineTagDataBitmapSpriteBudgetSize 
---| EngineTagDataBitmapSpriteBudgetSize_32x32
---| EngineTagDataBitmapSpriteBudgetSize_64x64
---| EngineTagDataBitmapSpriteBudgetSize_128x128
---| EngineTagDataBitmapSpriteBudgetSize_256x256
---| EngineTagDataBitmapSpriteBudgetSize_512x512
---| EngineTagDataBitmapSpriteBudgetSize_1024x1024

---@class EngineTagDataBitmapSpriteBudgetSizeTable 
---@field ze_32x32 EngineTagDataBitmapSpriteBudgetSize_32x32
---@field ze_64x64 EngineTagDataBitmapSpriteBudgetSize_64x64
---@field ze_128x128 EngineTagDataBitmapSpriteBudgetSize_128x128
---@field ze_256x256 EngineTagDataBitmapSpriteBudgetSize_256x256
---@field ze_512x512 EngineTagDataBitmapSpriteBudgetSize_512x512
---@field ze_1024x1024 EngineTagDataBitmapSpriteBudgetSize_1024x1024
Engine.tag.bitmapSpriteBudgetSize = {} 

---@class EngineTagDataBitmapSpriteUsageEnum : Enum 

---@class EngineTagDataBitmapSpriteUsageBlendAddSubtractMax : EngineTagDataBitmapSpriteUsageEnum 
---@class EngineTagDataBitmapSpriteUsageMultiplyMin : EngineTagDataBitmapSpriteUsageEnum 
---@class EngineTagDataBitmapSpriteUsageDoubleMultiply : EngineTagDataBitmapSpriteUsageEnum 

---@alias EngineTagDataBitmapSpriteUsage 
---| EngineTagDataBitmapSpriteUsageBlendAddSubtractMax
---| EngineTagDataBitmapSpriteUsageMultiplyMin
---| EngineTagDataBitmapSpriteUsageDoubleMultiply

---@class EngineTagDataBitmapSpriteUsageTable 
---@field eBlendAddSubtractMax EngineTagDataBitmapSpriteUsageBlendAddSubtractMax
---@field eMultiplyMin EngineTagDataBitmapSpriteUsageMultiplyMin
---@field eDoubleMultiply EngineTagDataBitmapSpriteUsageDoubleMultiply
Engine.tag.bitmapSpriteUsage = {} 

---@class MetaEngineTagDataBitmapDataFlags 
---@field powerOfTwoDimensions boolean 
---@field compressed boolean 
---@field palettized boolean 
---@field swizzled boolean 
---@field linear boolean 
---@field v16u16 boolean 
---@field unused boolean 
---@field makeItActuallyWork boolean 
---@field external boolean 
---@field environment boolean 

---@class MetaEngineTagDataBitmapFlags 
---@field enableDiffusionDithering boolean 
---@field disableHeightMapCompression boolean 
---@field uniformSpriteSequences boolean 
---@field filthySpriteBugFix boolean 
---@field halfHudScale boolean 

---@class MetaEngineTagDataBitmapGroupSprite 
---@field bitmapIndex MetaEngineIndex 
---@field left number 
---@field right number 
---@field top number 
---@field bottom number 
---@field registrationPoint MetaEnginePoint2D 

---@class MetaEngineTagDataBitmapGroupSequence 
---@field name MetaEngineTagString 
---@field firstBitmapIndex MetaEngineIndex 
---@field bitmapCount integer 
---@field sprites table<MetaEngineTagDataBitmapGroupSprite> 

---@class MetaEngineTagDataBitmapData 
---@field bitmapClass EngineTagClass 
---@field width integer 
---@field height integer 
---@field depth integer 
---@field type EngineTagDataBitmapDataType 
---@field format EngineTagDataBitmapDataFormat 
---@field flags MetaEngineTagDataBitmapDataFlags 
---@field registrationPoint MetaEnginePoint2DInt 
---@field mipmapCount integer 
---@field pixelDataOffset integer 
---@field pixelDataSize integer 
---@field bitmapTagHandle EngineTagHandle 
---@field textureCacheId integer 
---@field texture integer 
---@field pixelsBuffer integer 

---@class MetaEngineTagDataBitmap 
---@field type EngineTagDataBitmapType 
---@field encodingFormat EngineTagDataBitmapFormat 
---@field usage EngineTagDataBitmapUsage 
---@field flags MetaEngineTagDataBitmapFlags 
---@field detailFadeFactor MetaEngineFraction 
---@field sharpenAmount MetaEngineFraction 
---@field bumpHeight MetaEngineFraction 
---@field spriteBudgetSize EngineTagDataBitmapSpriteBudgetSize 
---@field spriteBudgetCount integer 
---@field colorPlateWidth integer 
---@field colorPlateHeight integer 
---@field compressedColorPlateData MetaEngineTagDataOffset 
---@field processedPixelData MetaEngineTagDataOffset 
---@field blurFilterSize number 
---@field alphaBias number 
---@field mipmapCount integer 
---@field spriteUsage EngineTagDataBitmapSpriteUsage 
---@field spriteSpacing integer 
---@field bitmapGroupSequence table<MetaEngineTagDataBitmapGroupSequence> 
---@field bitmapData table<MetaEngineTagDataBitmapData> 

---@class MetaEngineTagDataLightningMarkerFlag 
---@field notConnectedToNextMarker boolean 

---@class MetaEngineTagDataLightningMarker 
---@field attachmentMarker MetaEngineTagString 
---@field flags MetaEngineTagDataLightningMarkerFlag 
---@field octavesToNextMarker integer 
---@field randomPositionBounds MetaEngineVector3D 
---@field randomJitter number 
---@field thickness number 
---@field tint MetaEngineColorARGB 

---@class MetaEngineTagDataLightningShader 
---@field makeItWork integer 
---@field shaderFlags MetaEngineTagDataParticleShaderFlags 
---@field framebufferBlendFunction EngineTagDataFramebufferBlendFunction 
---@field framebufferFadeMode EngineTagDataFramebufferFadeMode 
---@field mapFlags MetaEngineTagDataIsUnfilteredFlag 
---@field someMoreStuffThatShouldBeSetForSomeReason integer 

---@class MetaEngineTagDataLightning 
---@field count integer 
---@field nearFadeDistance number 
---@field farFadeDistance number 
---@field jitterScaleSource EngineTagDataFunctionOut 
---@field thicknessScaleSource EngineTagDataFunctionOut 
---@field tintModulationSource EngineTagDataFunctionNameNullable 
---@field brightnessScaleSource EngineTagDataFunctionOut 
---@field bitmap MetaEngineTagDependency 
---@field markers table<MetaEngineTagDataLightningMarker> 
---@field shader table<MetaEngineTagDataLightningShader> 

---@class EngineTagDataInputDeviceDefaultsDeviceTypeEnum : Enum 

---@class EngineTagDataInputDeviceDefaultsDeviceTypeMouseAndKeyboard : EngineTagDataInputDeviceDefaultsDeviceTypeEnum 
---@class EngineTagDataInputDeviceDefaultsDeviceTypeJoysticksGamepadsEtc : EngineTagDataInputDeviceDefaultsDeviceTypeEnum 
---@class EngineTagDataInputDeviceDefaultsDeviceTypeFullProfileDefinition : EngineTagDataInputDeviceDefaultsDeviceTypeEnum 

---@alias EngineTagDataInputDeviceDefaultsDeviceType 
---| EngineTagDataInputDeviceDefaultsDeviceTypeMouseAndKeyboard
---| EngineTagDataInputDeviceDefaultsDeviceTypeJoysticksGamepadsEtc
---| EngineTagDataInputDeviceDefaultsDeviceTypeFullProfileDefinition

---@class EngineTagDataInputDeviceDefaultsDeviceTypeTable 
---@field ypeMouseAndKeyboard EngineTagDataInputDeviceDefaultsDeviceTypeMouseAndKeyboard
---@field ypeJoysticksGamepadsEtc EngineTagDataInputDeviceDefaultsDeviceTypeJoysticksGamepadsEtc
---@field ypeFullProfileDefinition EngineTagDataInputDeviceDefaultsDeviceTypeFullProfileDefinition
Engine.tag.inputDeviceDefaultsDeviceType = {} 

---@class MetaEngineTagDataInputDeviceDefaultsFlags 
---@field unused boolean 

---@class MetaEngineTagDataInputDeviceDefaults 
---@field deviceType EngineTagDataInputDeviceDefaultsDeviceType 
---@field flags MetaEngineTagDataInputDeviceDefaultsFlags 
---@field deviceId MetaEngineTagDataOffset 
---@field profile MetaEngineTagDataOffset 

---@class EngineTagDataVirtualKeyboardKeyboardKeyEnum : Enum 

---@class EngineTagDataVirtualKeyboardKeyboardKey_1 : EngineTagDataVirtualKeyboardKeyboardKeyEnum 
---@class EngineTagDataVirtualKeyboardKeyboardKey_2 : EngineTagDataVirtualKeyboardKeyboardKeyEnum 
---@class EngineTagDataVirtualKeyboardKeyboardKey_3 : EngineTagDataVirtualKeyboardKeyboardKeyEnum 
---@class EngineTagDataVirtualKeyboardKeyboardKey_4 : EngineTagDataVirtualKeyboardKeyboardKeyEnum 
---@class EngineTagDataVirtualKeyboardKeyboardKey_5 : EngineTagDataVirtualKeyboardKeyboardKeyEnum 
---@class EngineTagDataVirtualKeyboardKeyboardKey_6 : EngineTagDataVirtualKeyboardKeyboardKeyEnum 
---@class EngineTagDataVirtualKeyboardKeyboardKey_7 : EngineTagDataVirtualKeyboardKeyboardKeyEnum 
---@class EngineTagDataVirtualKeyboardKeyboardKey_8 : EngineTagDataVirtualKeyboardKeyboardKeyEnum 
---@class EngineTagDataVirtualKeyboardKeyboardKey_9 : EngineTagDataVirtualKeyboardKeyboardKeyEnum 
---@class EngineTagDataVirtualKeyboardKeyboardKey_0 : EngineTagDataVirtualKeyboardKeyboardKeyEnum 
---@class EngineTagDataVirtualKeyboardKeyboardKeyA : EngineTagDataVirtualKeyboardKeyboardKeyEnum 
---@class EngineTagDataVirtualKeyboardKeyboardKeyB : EngineTagDataVirtualKeyboardKeyboardKeyEnum 
---@class EngineTagDataVirtualKeyboardKeyboardKeyC : EngineTagDataVirtualKeyboardKeyboardKeyEnum 
---@class EngineTagDataVirtualKeyboardKeyboardKeyD : EngineTagDataVirtualKeyboardKeyboardKeyEnum 
---@class EngineTagDataVirtualKeyboardKeyboardKeyE : EngineTagDataVirtualKeyboardKeyboardKeyEnum 
---@class EngineTagDataVirtualKeyboardKeyboardKeyF : EngineTagDataVirtualKeyboardKeyboardKeyEnum 
---@class EngineTagDataVirtualKeyboardKeyboardKeyG : EngineTagDataVirtualKeyboardKeyboardKeyEnum 
---@class EngineTagDataVirtualKeyboardKeyboardKeyH : EngineTagDataVirtualKeyboardKeyboardKeyEnum 
---@class EngineTagDataVirtualKeyboardKeyboardKeyI : EngineTagDataVirtualKeyboardKeyboardKeyEnum 
---@class EngineTagDataVirtualKeyboardKeyboardKeyJ : EngineTagDataVirtualKeyboardKeyboardKeyEnum 
---@class EngineTagDataVirtualKeyboardKeyboardKeyK : EngineTagDataVirtualKeyboardKeyboardKeyEnum 
---@class EngineTagDataVirtualKeyboardKeyboardKeyL : EngineTagDataVirtualKeyboardKeyboardKeyEnum 
---@class EngineTagDataVirtualKeyboardKeyboardKeyM : EngineTagDataVirtualKeyboardKeyboardKeyEnum 
---@class EngineTagDataVirtualKeyboardKeyboardKeyN : EngineTagDataVirtualKeyboardKeyboardKeyEnum 
---@class EngineTagDataVirtualKeyboardKeyboardKeyO : EngineTagDataVirtualKeyboardKeyboardKeyEnum 
---@class EngineTagDataVirtualKeyboardKeyboardKeyP : EngineTagDataVirtualKeyboardKeyboardKeyEnum 
---@class EngineTagDataVirtualKeyboardKeyboardKeyQ : EngineTagDataVirtualKeyboardKeyboardKeyEnum 
---@class EngineTagDataVirtualKeyboardKeyboardKeyR : EngineTagDataVirtualKeyboardKeyboardKeyEnum 
---@class EngineTagDataVirtualKeyboardKeyboardKeyS : EngineTagDataVirtualKeyboardKeyboardKeyEnum 
---@class EngineTagDataVirtualKeyboardKeyboardKeyT : EngineTagDataVirtualKeyboardKeyboardKeyEnum 
---@class EngineTagDataVirtualKeyboardKeyboardKeyU : EngineTagDataVirtualKeyboardKeyboardKeyEnum 
---@class EngineTagDataVirtualKeyboardKeyboardKeyV : EngineTagDataVirtualKeyboardKeyboardKeyEnum 
---@class EngineTagDataVirtualKeyboardKeyboardKeyW : EngineTagDataVirtualKeyboardKeyboardKeyEnum 
---@class EngineTagDataVirtualKeyboardKeyboardKeyX : EngineTagDataVirtualKeyboardKeyboardKeyEnum 
---@class EngineTagDataVirtualKeyboardKeyboardKeyY : EngineTagDataVirtualKeyboardKeyboardKeyEnum 
---@class EngineTagDataVirtualKeyboardKeyboardKeyZ : EngineTagDataVirtualKeyboardKeyboardKeyEnum 
---@class EngineTagDataVirtualKeyboardKeyboardKeyDone : EngineTagDataVirtualKeyboardKeyboardKeyEnum 
---@class EngineTagDataVirtualKeyboardKeyboardKeyShift : EngineTagDataVirtualKeyboardKeyboardKeyEnum 
---@class EngineTagDataVirtualKeyboardKeyboardKeyCapsLock : EngineTagDataVirtualKeyboardKeyboardKeyEnum 
---@class EngineTagDataVirtualKeyboardKeyboardKeySymbols : EngineTagDataVirtualKeyboardKeyboardKeyEnum 
---@class EngineTagDataVirtualKeyboardKeyboardKeyBackspace : EngineTagDataVirtualKeyboardKeyboardKeyEnum 
---@class EngineTagDataVirtualKeyboardKeyboardKeyLeft : EngineTagDataVirtualKeyboardKeyboardKeyEnum 
---@class EngineTagDataVirtualKeyboardKeyboardKeyRight : EngineTagDataVirtualKeyboardKeyboardKeyEnum 
---@class EngineTagDataVirtualKeyboardKeyboardKeySpace : EngineTagDataVirtualKeyboardKeyboardKeyEnum 

---@alias EngineTagDataVirtualKeyboardKeyboardKey 
---| EngineTagDataVirtualKeyboardKeyboardKey_1
---| EngineTagDataVirtualKeyboardKeyboardKey_2
---| EngineTagDataVirtualKeyboardKeyboardKey_3
---| EngineTagDataVirtualKeyboardKeyboardKey_4
---| EngineTagDataVirtualKeyboardKeyboardKey_5
---| EngineTagDataVirtualKeyboardKeyboardKey_6
---| EngineTagDataVirtualKeyboardKeyboardKey_7
---| EngineTagDataVirtualKeyboardKeyboardKey_8
---| EngineTagDataVirtualKeyboardKeyboardKey_9
---| EngineTagDataVirtualKeyboardKeyboardKey_0
---| EngineTagDataVirtualKeyboardKeyboardKeyA
---| EngineTagDataVirtualKeyboardKeyboardKeyB
---| EngineTagDataVirtualKeyboardKeyboardKeyC
---| EngineTagDataVirtualKeyboardKeyboardKeyD
---| EngineTagDataVirtualKeyboardKeyboardKeyE
---| EngineTagDataVirtualKeyboardKeyboardKeyF
---| EngineTagDataVirtualKeyboardKeyboardKeyG
---| EngineTagDataVirtualKeyboardKeyboardKeyH
---| EngineTagDataVirtualKeyboardKeyboardKeyI
---| EngineTagDataVirtualKeyboardKeyboardKeyJ
---| EngineTagDataVirtualKeyboardKeyboardKeyK
---| EngineTagDataVirtualKeyboardKeyboardKeyL
---| EngineTagDataVirtualKeyboardKeyboardKeyM
---| EngineTagDataVirtualKeyboardKeyboardKeyN
---| EngineTagDataVirtualKeyboardKeyboardKeyO
---| EngineTagDataVirtualKeyboardKeyboardKeyP
---| EngineTagDataVirtualKeyboardKeyboardKeyQ
---| EngineTagDataVirtualKeyboardKeyboardKeyR
---| EngineTagDataVirtualKeyboardKeyboardKeyS
---| EngineTagDataVirtualKeyboardKeyboardKeyT
---| EngineTagDataVirtualKeyboardKeyboardKeyU
---| EngineTagDataVirtualKeyboardKeyboardKeyV
---| EngineTagDataVirtualKeyboardKeyboardKeyW
---| EngineTagDataVirtualKeyboardKeyboardKeyX
---| EngineTagDataVirtualKeyboardKeyboardKeyY
---| EngineTagDataVirtualKeyboardKeyboardKeyZ
---| EngineTagDataVirtualKeyboardKeyboardKeyDone
---| EngineTagDataVirtualKeyboardKeyboardKeyShift
---| EngineTagDataVirtualKeyboardKeyboardKeyCapsLock
---| EngineTagDataVirtualKeyboardKeyboardKeySymbols
---| EngineTagDataVirtualKeyboardKeyboardKeyBackspace
---| EngineTagDataVirtualKeyboardKeyboardKeyLeft
---| EngineTagDataVirtualKeyboardKeyboardKeyRight
---| EngineTagDataVirtualKeyboardKeyboardKeySpace

---@class EngineTagDataVirtualKeyboardKeyboardKeyTable 
---@field ey_1 EngineTagDataVirtualKeyboardKeyboardKey_1
---@field ey_2 EngineTagDataVirtualKeyboardKeyboardKey_2
---@field ey_3 EngineTagDataVirtualKeyboardKeyboardKey_3
---@field ey_4 EngineTagDataVirtualKeyboardKeyboardKey_4
---@field ey_5 EngineTagDataVirtualKeyboardKeyboardKey_5
---@field ey_6 EngineTagDataVirtualKeyboardKeyboardKey_6
---@field ey_7 EngineTagDataVirtualKeyboardKeyboardKey_7
---@field ey_8 EngineTagDataVirtualKeyboardKeyboardKey_8
---@field ey_9 EngineTagDataVirtualKeyboardKeyboardKey_9
---@field ey_0 EngineTagDataVirtualKeyboardKeyboardKey_0
---@field eyA EngineTagDataVirtualKeyboardKeyboardKeyA
---@field eyB EngineTagDataVirtualKeyboardKeyboardKeyB
---@field eyC EngineTagDataVirtualKeyboardKeyboardKeyC
---@field eyD EngineTagDataVirtualKeyboardKeyboardKeyD
---@field eyE EngineTagDataVirtualKeyboardKeyboardKeyE
---@field eyF EngineTagDataVirtualKeyboardKeyboardKeyF
---@field eyG EngineTagDataVirtualKeyboardKeyboardKeyG
---@field eyH EngineTagDataVirtualKeyboardKeyboardKeyH
---@field eyI EngineTagDataVirtualKeyboardKeyboardKeyI
---@field eyJ EngineTagDataVirtualKeyboardKeyboardKeyJ
---@field eyK EngineTagDataVirtualKeyboardKeyboardKeyK
---@field eyL EngineTagDataVirtualKeyboardKeyboardKeyL
---@field eyM EngineTagDataVirtualKeyboardKeyboardKeyM
---@field eyN EngineTagDataVirtualKeyboardKeyboardKeyN
---@field eyO EngineTagDataVirtualKeyboardKeyboardKeyO
---@field eyP EngineTagDataVirtualKeyboardKeyboardKeyP
---@field eyQ EngineTagDataVirtualKeyboardKeyboardKeyQ
---@field eyR EngineTagDataVirtualKeyboardKeyboardKeyR
---@field eyS EngineTagDataVirtualKeyboardKeyboardKeyS
---@field eyT EngineTagDataVirtualKeyboardKeyboardKeyT
---@field eyU EngineTagDataVirtualKeyboardKeyboardKeyU
---@field eyV EngineTagDataVirtualKeyboardKeyboardKeyV
---@field eyW EngineTagDataVirtualKeyboardKeyboardKeyW
---@field eyX EngineTagDataVirtualKeyboardKeyboardKeyX
---@field eyY EngineTagDataVirtualKeyboardKeyboardKeyY
---@field eyZ EngineTagDataVirtualKeyboardKeyboardKeyZ
---@field eyDone EngineTagDataVirtualKeyboardKeyboardKeyDone
---@field eyShift EngineTagDataVirtualKeyboardKeyboardKeyShift
---@field eyCapsLock EngineTagDataVirtualKeyboardKeyboardKeyCapsLock
---@field eySymbols EngineTagDataVirtualKeyboardKeyboardKeySymbols
---@field eyBackspace EngineTagDataVirtualKeyboardKeyboardKeyBackspace
---@field eyLeft EngineTagDataVirtualKeyboardKeyboardKeyLeft
---@field eyRight EngineTagDataVirtualKeyboardKeyboardKeyRight
---@field eySpace EngineTagDataVirtualKeyboardKeyboardKeySpace
Engine.tag.virtualKeyboardKeyboardKey = {} 

---@class MetaEngineTagDataVirtualKeyboardVirtualKey 
---@field keyboardKey EngineTagDataVirtualKeyboardKeyboardKey 
---@field lowercaseCharacter integer 
---@field shiftCharacter integer 
---@field capsCharacter integer 
---@field symbolsCharacter integer 
---@field shiftCapsCharacter integer 
---@field shiftSymbolsCharacter integer 
---@field capsSymbolsCharacter integer 
---@field unselectedBackgroundBitmap MetaEngineTagDependency 
---@field selectedBackgroundBitmap MetaEngineTagDependency 
---@field activeBackgroundBitmap MetaEngineTagDependency 
---@field stickyBackgroundBitmap MetaEngineTagDependency 

---@class MetaEngineTagDataVirtualKeyboard 
---@field displayFont MetaEngineTagDependency 
---@field backgroundBitmap MetaEngineTagDependency 
---@field specialKeyLabelsStringList MetaEngineTagDependency 
---@field virtualKeys table<MetaEngineTagDataVirtualKeyboardVirtualKey> 

---@class EngineTagDataHUDInterfaceDestinationTypeEnum : Enum 

---@class EngineTagDataHUDInterfaceDestinationTypeTint_0_1 : EngineTagDataHUDInterfaceDestinationTypeEnum 
---@class EngineTagDataHUDInterfaceDestinationTypeHorizontalOffset : EngineTagDataHUDInterfaceDestinationTypeEnum 
---@class EngineTagDataHUDInterfaceDestinationTypeVerticalOffset : EngineTagDataHUDInterfaceDestinationTypeEnum 
---@class EngineTagDataHUDInterfaceDestinationTypeFade_0_1 : EngineTagDataHUDInterfaceDestinationTypeEnum 

---@alias EngineTagDataHUDInterfaceDestinationType 
---| EngineTagDataHUDInterfaceDestinationTypeTint_0_1
---| EngineTagDataHUDInterfaceDestinationTypeHorizontalOffset
---| EngineTagDataHUDInterfaceDestinationTypeVerticalOffset
---| EngineTagDataHUDInterfaceDestinationTypeFade_0_1

---@class EngineTagDataHUDInterfaceDestinationTypeTable 
---@field typeTint_0_1 EngineTagDataHUDInterfaceDestinationTypeTint_0_1
---@field typeHorizontalOffset EngineTagDataHUDInterfaceDestinationTypeHorizontalOffset
---@field typeVerticalOffset EngineTagDataHUDInterfaceDestinationTypeVerticalOffset
---@field typeFade_0_1 EngineTagDataHUDInterfaceDestinationTypeFade_0_1
Engine.tag.hUDInterfaceDestinationType = {} 

---@class EngineTagDataHUDInterfaceDestinationEnum : Enum 

---@class EngineTagDataHUDInterfaceDestinationGeometryOffset : EngineTagDataHUDInterfaceDestinationEnum 
---@class EngineTagDataHUDInterfaceDestinationPrimaryMap : EngineTagDataHUDInterfaceDestinationEnum 
---@class EngineTagDataHUDInterfaceDestinationSecondaryMap : EngineTagDataHUDInterfaceDestinationEnum 
---@class EngineTagDataHUDInterfaceDestinationTertiaryMap : EngineTagDataHUDInterfaceDestinationEnum 

---@alias EngineTagDataHUDInterfaceDestination 
---| EngineTagDataHUDInterfaceDestinationGeometryOffset
---| EngineTagDataHUDInterfaceDestinationPrimaryMap
---| EngineTagDataHUDInterfaceDestinationSecondaryMap
---| EngineTagDataHUDInterfaceDestinationTertiaryMap

---@class EngineTagDataHUDInterfaceDestinationTable 
---@field ionGeometryOffset EngineTagDataHUDInterfaceDestinationGeometryOffset
---@field ionPrimaryMap EngineTagDataHUDInterfaceDestinationPrimaryMap
---@field ionSecondaryMap EngineTagDataHUDInterfaceDestinationSecondaryMap
---@field ionTertiaryMap EngineTagDataHUDInterfaceDestinationTertiaryMap
Engine.tag.hUDInterfaceDestination = {} 

---@class EngineTagDataHUDInterfaceSourceEnum : Enum 

---@class EngineTagDataHUDInterfaceSourcePlayerPitch : EngineTagDataHUDInterfaceSourceEnum 
---@class EngineTagDataHUDInterfaceSourcePlayerPitchTangent : EngineTagDataHUDInterfaceSourceEnum 
---@class EngineTagDataHUDInterfaceSourcePlayerYaw : EngineTagDataHUDInterfaceSourceEnum 
---@class EngineTagDataHUDInterfaceSourceWeaponAmmoTotal : EngineTagDataHUDInterfaceSourceEnum 
---@class EngineTagDataHUDInterfaceSourceWeaponAmmoLoaded : EngineTagDataHUDInterfaceSourceEnum 
---@class EngineTagDataHUDInterfaceSourceWeaponHeat : EngineTagDataHUDInterfaceSourceEnum 
---@class EngineTagDataHUDInterfaceSourceExplicitUsesLowBound : EngineTagDataHUDInterfaceSourceEnum 
---@class EngineTagDataHUDInterfaceSourceWeaponZoomLevel : EngineTagDataHUDInterfaceSourceEnum 

---@alias EngineTagDataHUDInterfaceSource 
---| EngineTagDataHUDInterfaceSourcePlayerPitch
---| EngineTagDataHUDInterfaceSourcePlayerPitchTangent
---| EngineTagDataHUDInterfaceSourcePlayerYaw
---| EngineTagDataHUDInterfaceSourceWeaponAmmoTotal
---| EngineTagDataHUDInterfaceSourceWeaponAmmoLoaded
---| EngineTagDataHUDInterfaceSourceWeaponHeat
---| EngineTagDataHUDInterfaceSourceExplicitUsesLowBound
---| EngineTagDataHUDInterfaceSourceWeaponZoomLevel

---@class EngineTagDataHUDInterfaceSourceTable 
---@field rcePlayerPitch EngineTagDataHUDInterfaceSourcePlayerPitch
---@field rcePlayerPitchTangent EngineTagDataHUDInterfaceSourcePlayerPitchTangent
---@field rcePlayerYaw EngineTagDataHUDInterfaceSourcePlayerYaw
---@field rceWeaponAmmoTotal EngineTagDataHUDInterfaceSourceWeaponAmmoTotal
---@field rceWeaponAmmoLoaded EngineTagDataHUDInterfaceSourceWeaponAmmoLoaded
---@field rceWeaponHeat EngineTagDataHUDInterfaceSourceWeaponHeat
---@field rceExplicitUsesLowBound EngineTagDataHUDInterfaceSourceExplicitUsesLowBound
---@field rceWeaponZoomLevel EngineTagDataHUDInterfaceSourceWeaponZoomLevel
Engine.tag.hUDInterfaceSource = {} 

---@class EngineTagDataHUDInterfaceMultitextureOverlayAnchorEnum : Enum 

---@class EngineTagDataHUDInterfaceMultitextureOverlayAnchorTexture : EngineTagDataHUDInterfaceMultitextureOverlayAnchorEnum 
---@class EngineTagDataHUDInterfaceMultitextureOverlayAnchorScreen : EngineTagDataHUDInterfaceMultitextureOverlayAnchorEnum 

---@alias EngineTagDataHUDInterfaceMultitextureOverlayAnchor 
---| EngineTagDataHUDInterfaceMultitextureOverlayAnchorTexture
---| EngineTagDataHUDInterfaceMultitextureOverlayAnchorScreen

---@class EngineTagDataHUDInterfaceMultitextureOverlayAnchorTable 
---@field nchorTexture EngineTagDataHUDInterfaceMultitextureOverlayAnchorTexture
---@field nchorScreen EngineTagDataHUDInterfaceMultitextureOverlayAnchorScreen
Engine.tag.hUDInterfaceMultitextureOverlayAnchor = {} 

---@class EngineTagDataHUDInterfaceZeroToOneBlendFunctionEnum : Enum 

---@class EngineTagDataHUDInterfaceZeroToOneBlendFunctionAdd : EngineTagDataHUDInterfaceZeroToOneBlendFunctionEnum 
---@class EngineTagDataHUDInterfaceZeroToOneBlendFunctionSubtract : EngineTagDataHUDInterfaceZeroToOneBlendFunctionEnum 
---@class EngineTagDataHUDInterfaceZeroToOneBlendFunctionMultiply : EngineTagDataHUDInterfaceZeroToOneBlendFunctionEnum 
---@class EngineTagDataHUDInterfaceZeroToOneBlendFunctionMultiply2x : EngineTagDataHUDInterfaceZeroToOneBlendFunctionEnum 
---@class EngineTagDataHUDInterfaceZeroToOneBlendFunctionDot : EngineTagDataHUDInterfaceZeroToOneBlendFunctionEnum 

---@alias EngineTagDataHUDInterfaceZeroToOneBlendFunction 
---| EngineTagDataHUDInterfaceZeroToOneBlendFunctionAdd
---| EngineTagDataHUDInterfaceZeroToOneBlendFunctionSubtract
---| EngineTagDataHUDInterfaceZeroToOneBlendFunctionMultiply
---| EngineTagDataHUDInterfaceZeroToOneBlendFunctionMultiply2x
---| EngineTagDataHUDInterfaceZeroToOneBlendFunctionDot

---@class EngineTagDataHUDInterfaceZeroToOneBlendFunctionTable 
---@field unctionAdd EngineTagDataHUDInterfaceZeroToOneBlendFunctionAdd
---@field unctionSubtract EngineTagDataHUDInterfaceZeroToOneBlendFunctionSubtract
---@field unctionMultiply EngineTagDataHUDInterfaceZeroToOneBlendFunctionMultiply
---@field unctionMultiply2x EngineTagDataHUDInterfaceZeroToOneBlendFunctionMultiply2x
---@field unctionDot EngineTagDataHUDInterfaceZeroToOneBlendFunctionDot
Engine.tag.hUDInterfaceZeroToOneBlendFunction = {} 

---@class EngineTagDataHUDInterfaceWrapModeEnum : Enum 

---@class EngineTagDataHUDInterfaceWrapModeClamp : EngineTagDataHUDInterfaceWrapModeEnum 
---@class EngineTagDataHUDInterfaceWrapModeWrap : EngineTagDataHUDInterfaceWrapModeEnum 

---@alias EngineTagDataHUDInterfaceWrapMode 
---| EngineTagDataHUDInterfaceWrapModeClamp
---| EngineTagDataHUDInterfaceWrapModeWrap

---@class EngineTagDataHUDInterfaceWrapModeTable 
---@field modeClamp EngineTagDataHUDInterfaceWrapModeClamp
---@field modeWrap EngineTagDataHUDInterfaceWrapModeWrap
Engine.tag.hUDInterfaceWrapMode = {} 

---@class EngineTagDataHUDInterfaceAnchorEnum : Enum 

---@class EngineTagDataHUDInterfaceAnchorTopLeft : EngineTagDataHUDInterfaceAnchorEnum 
---@class EngineTagDataHUDInterfaceAnchorTopRight : EngineTagDataHUDInterfaceAnchorEnum 
---@class EngineTagDataHUDInterfaceAnchorBottomLeft : EngineTagDataHUDInterfaceAnchorEnum 
---@class EngineTagDataHUDInterfaceAnchorBottomRight : EngineTagDataHUDInterfaceAnchorEnum 
---@class EngineTagDataHUDInterfaceAnchorCenter : EngineTagDataHUDInterfaceAnchorEnum 

---@alias EngineTagDataHUDInterfaceAnchor 
---| EngineTagDataHUDInterfaceAnchorTopLeft
---| EngineTagDataHUDInterfaceAnchorTopRight
---| EngineTagDataHUDInterfaceAnchorBottomLeft
---| EngineTagDataHUDInterfaceAnchorBottomRight
---| EngineTagDataHUDInterfaceAnchorCenter

---@class EngineTagDataHUDInterfaceAnchorTable 
---@field horTopLeft EngineTagDataHUDInterfaceAnchorTopLeft
---@field horTopRight EngineTagDataHUDInterfaceAnchorTopRight
---@field horBottomLeft EngineTagDataHUDInterfaceAnchorBottomLeft
---@field horBottomRight EngineTagDataHUDInterfaceAnchorBottomRight
---@field horCenter EngineTagDataHUDInterfaceAnchorCenter
Engine.tag.hUDInterfaceAnchor = {} 

---@class EngineTagDataHUDInterfaceChildAnchorEnum : Enum 

---@class EngineTagDataHUDInterfaceChildAnchorFromParent : EngineTagDataHUDInterfaceChildAnchorEnum 
---@class EngineTagDataHUDInterfaceChildAnchorTopLeft : EngineTagDataHUDInterfaceChildAnchorEnum 
---@class EngineTagDataHUDInterfaceChildAnchorTopRight : EngineTagDataHUDInterfaceChildAnchorEnum 
---@class EngineTagDataHUDInterfaceChildAnchorBottomLeft : EngineTagDataHUDInterfaceChildAnchorEnum 
---@class EngineTagDataHUDInterfaceChildAnchorBottomRight : EngineTagDataHUDInterfaceChildAnchorEnum 
---@class EngineTagDataHUDInterfaceChildAnchorCenter : EngineTagDataHUDInterfaceChildAnchorEnum 

---@alias EngineTagDataHUDInterfaceChildAnchor 
---| EngineTagDataHUDInterfaceChildAnchorFromParent
---| EngineTagDataHUDInterfaceChildAnchorTopLeft
---| EngineTagDataHUDInterfaceChildAnchorTopRight
---| EngineTagDataHUDInterfaceChildAnchorBottomLeft
---| EngineTagDataHUDInterfaceChildAnchorBottomRight
---| EngineTagDataHUDInterfaceChildAnchorCenter

---@class EngineTagDataHUDInterfaceChildAnchorTable 
---@field chorFromParent EngineTagDataHUDInterfaceChildAnchorFromParent
---@field chorTopLeft EngineTagDataHUDInterfaceChildAnchorTopLeft
---@field chorTopRight EngineTagDataHUDInterfaceChildAnchorTopRight
---@field chorBottomLeft EngineTagDataHUDInterfaceChildAnchorBottomLeft
---@field chorBottomRight EngineTagDataHUDInterfaceChildAnchorBottomRight
---@field chorCenter EngineTagDataHUDInterfaceChildAnchorCenter
Engine.tag.hUDInterfaceChildAnchor = {} 

---@class MetaEngineTagDataHUDInterfaceMeterFlags 
---@field useMinMaxForStateChanges boolean 
---@field interpolateBetweenMinMaxFlashColorsAsStateChanges boolean 
---@field interpolateColorAlongHsvSpace boolean 
---@field moreColorsForHsvInterpolation boolean 
---@field invertInterpolation boolean 
---@field useXboxShading boolean 

---@class MetaEngineTagDataHUDInterfaceScalingFlags 
---@field dontScaleOffset boolean 
---@field dontScaleSize boolean 
---@field useHighResScale boolean 

---@class MetaEngineTagDataHUDInterfaceFlashFlags 
---@field reverseDefaultFlashingColors boolean 

---@class MetaEngineTagDataHUDInterfaceNumberFlags 
---@field showLeadingZeros boolean 
---@field onlyShowWhenZoomed boolean 
---@field drawATrailingM boolean 

---@class MetaEngineTagDataHUDInterfaceOverlayFlashFlags 
---@field flashesWhenActive boolean 

---@class MetaEngineTagDataHUDInterfaceMessagingFlags 
---@field useTextFromStringListInstead boolean 
---@field overrideDefaultColor boolean 
---@field widthOffsetIsAbsoluteIconWidth boolean 

---@class MetaEngineTagDataHUDInterfaceMultitextureOverlayEffector 
---@field destinationType EngineTagDataHUDInterfaceDestinationType 
---@field destination EngineTagDataHUDInterfaceDestination 
---@field source EngineTagDataHUDInterfaceSource 
---@field inBounds number 
---@field outBounds number 
---@field tintColorLowerBound MetaEngineColorRGB 
---@field tintColorUpperBound MetaEngineColorRGB 
---@field periodicFunction EngineTagDataWaveFunction 
---@field functionPeriod number 
---@field functionPhase number 

---@class MetaEngineTagDataHUDInterfaceMultitextureOverlay 
---@field type integer 
---@field framebufferBlendFunction EngineTagDataFramebufferBlendFunction 
---@field primaryAnchor EngineTagDataHUDInterfaceMultitextureOverlayAnchor 
---@field secondaryAnchor EngineTagDataHUDInterfaceMultitextureOverlayAnchor 
---@field tertiaryAnchor EngineTagDataHUDInterfaceMultitextureOverlayAnchor 
---@field zeroToOneBlendFunction EngineTagDataHUDInterfaceZeroToOneBlendFunction 
---@field oneToTwoBlendFunction EngineTagDataHUDInterfaceZeroToOneBlendFunction 
---@field primaryScale MetaEnginePoint2D 
---@field secondaryScale MetaEnginePoint2D 
---@field tertiaryScale MetaEnginePoint2D 
---@field primaryOffset MetaEnginePoint2D 
---@field secondaryOffset MetaEnginePoint2D 
---@field tertiaryOffset MetaEnginePoint2D 
---@field primary MetaEngineTagDependency 
---@field secondary MetaEngineTagDependency 
---@field tertiary MetaEngineTagDependency 
---@field primaryWrapMode EngineTagDataHUDInterfaceWrapMode 
---@field secondaryWrapMode EngineTagDataHUDInterfaceWrapMode 
---@field tertiaryWrapMode EngineTagDataHUDInterfaceWrapMode 
---@field effectors table<MetaEngineTagDataHUDInterfaceMultitextureOverlayEffector> 

---@class EngineTagDataDecalTypeEnum : Enum 

---@class EngineTagDataDecalTypeScratch : EngineTagDataDecalTypeEnum 
---@class EngineTagDataDecalTypeSplatter : EngineTagDataDecalTypeEnum 
---@class EngineTagDataDecalTypeBurn : EngineTagDataDecalTypeEnum 
---@class EngineTagDataDecalTypePaintedSign : EngineTagDataDecalTypeEnum 

---@alias EngineTagDataDecalType 
---| EngineTagDataDecalTypeScratch
---| EngineTagDataDecalTypeSplatter
---| EngineTagDataDecalTypeBurn
---| EngineTagDataDecalTypePaintedSign

---@class EngineTagDataDecalTypeTable 
---@field scratch EngineTagDataDecalTypeScratch
---@field splatter EngineTagDataDecalTypeSplatter
---@field burn EngineTagDataDecalTypeBurn
---@field paintedSign EngineTagDataDecalTypePaintedSign
Engine.tag.decalType = {} 

---@class EngineTagDataDecalLayerEnum : Enum 

---@class EngineTagDataDecalLayerPrimary : EngineTagDataDecalLayerEnum 
---@class EngineTagDataDecalLayerSecondary : EngineTagDataDecalLayerEnum 
---@class EngineTagDataDecalLayerLight : EngineTagDataDecalLayerEnum 
---@class EngineTagDataDecalLayerAlphaTested : EngineTagDataDecalLayerEnum 
---@class EngineTagDataDecalLayerWater : EngineTagDataDecalLayerEnum 

---@alias EngineTagDataDecalLayer 
---| EngineTagDataDecalLayerPrimary
---| EngineTagDataDecalLayerSecondary
---| EngineTagDataDecalLayerLight
---| EngineTagDataDecalLayerAlphaTested
---| EngineTagDataDecalLayerWater

---@class EngineTagDataDecalLayerTable 
---@field primary EngineTagDataDecalLayerPrimary
---@field secondary EngineTagDataDecalLayerSecondary
---@field light EngineTagDataDecalLayerLight
---@field alphaTested EngineTagDataDecalLayerAlphaTested
---@field water EngineTagDataDecalLayerWater
Engine.tag.decalLayer = {} 

---@class MetaEngineTagDataDecalFlags 
---@field geometryInheritedByNextDecalInChain boolean 
---@field interpolateColorInHsv boolean 
---@field moreColors boolean 
---@field noRandomRotation boolean 
---@field waterEffect boolean 
---@field sapienSnapToAxis boolean 
---@field sapienIncrementalCounter boolean 
---@field animationLoop boolean 
---@field preserveAspect boolean 
---@field disabledInAnniversaryByBloodSetting boolean 

---@class MetaEngineTagDataDecal 
---@field flags MetaEngineTagDataDecalFlags 
---@field type EngineTagDataDecalType 
---@field layer EngineTagDataDecalLayer 
---@field nextDecalInChain MetaEngineTagDependency 
---@field radius number 
---@field intensity MetaEngineFraction 
---@field colorLowerBounds MetaEngineColorRGB 
---@field colorUpperBounds MetaEngineColorRGB 
---@field animationLoopFrame integer 
---@field animationSpeed integer 
---@field lifetime number 
---@field decayTime number 
---@field framebufferBlendFunction EngineTagDataFramebufferBlendFunction 
---@field map MetaEngineTagDependency 
---@field maximumSpriteExtent number 

---@class EngineTagDataDetailObjectCollectionTypeEnum : Enum 

---@class EngineTagDataDetailObjectCollectionTypeScreenFacing : EngineTagDataDetailObjectCollectionTypeEnum 
---@class EngineTagDataDetailObjectCollectionTypeViewerFacing : EngineTagDataDetailObjectCollectionTypeEnum 

---@alias EngineTagDataDetailObjectCollectionType 
---| EngineTagDataDetailObjectCollectionTypeScreenFacing
---| EngineTagDataDetailObjectCollectionTypeViewerFacing

---@class EngineTagDataDetailObjectCollectionTypeTable 
---@field peScreenFacing EngineTagDataDetailObjectCollectionTypeScreenFacing
---@field peViewerFacing EngineTagDataDetailObjectCollectionTypeViewerFacing
Engine.tag.detailObjectCollectionType = {} 

---@class MetaEngineTagDataDetailObjectCollectionTypeFlags 
---@field unusedA boolean 
---@field unusedB boolean 
---@field interpolateColorInHsv boolean 
---@field moreColors boolean 

---@class MetaEngineTagDataDetailObjectCollectionObjectType 
---@field name MetaEngineTagString 
---@field sequenceIndex integer 
---@field flags MetaEngineTagDataDetailObjectCollectionTypeFlags 
---@field firstSpriteIndex integer 
---@field spriteCount integer 
---@field colorOverrideFactor MetaEngineFraction 
---@field nearFadeDistance number 
---@field farFadeDistance number 
---@field size number 
---@field minimumColor MetaEngineColorRGB 
---@field maximumColor MetaEngineColorRGB 
---@field ambientColor MetaEngineColorARGBInt 

---@class MetaEngineTagDataDetailObjectCollection 
---@field collectionType EngineTagDataDetailObjectCollectionType 
---@field globalZOffset number 
---@field spritePlate MetaEngineTagDependency 
---@field types table<MetaEngineTagDataDetailObjectCollectionObjectType> 

---@class MetaEngineTagDataDialogue 
---@field idleNoncombat MetaEngineTagDependency 
---@field idleCombat MetaEngineTagDependency 
---@field idleFlee MetaEngineTagDependency 
---@field painBodyMinor MetaEngineTagDependency 
---@field painBodyMajor MetaEngineTagDependency 
---@field painShield MetaEngineTagDependency 
---@field painFalling MetaEngineTagDependency 
---@field screamFear MetaEngineTagDependency 
---@field screamPain MetaEngineTagDependency 
---@field maimedLimb MetaEngineTagDependency 
---@field maimedHead MetaEngineTagDependency 
---@field deathQuiet MetaEngineTagDependency 
---@field deathViolent MetaEngineTagDependency 
---@field deathFalling MetaEngineTagDependency 
---@field deathAgonizing MetaEngineTagDependency 
---@field deathInstant MetaEngineTagDependency 
---@field deathFlying MetaEngineTagDependency 
---@field damagedFriend MetaEngineTagDependency 
---@field damagedFriendPlayer MetaEngineTagDependency 
---@field damagedEnemy MetaEngineTagDependency 
---@field damagedEnemyCm MetaEngineTagDependency 
---@field hurtFriend MetaEngineTagDependency 
---@field hurtFriendRe MetaEngineTagDependency 
---@field hurtFriendPlayer MetaEngineTagDependency 
---@field hurtEnemy MetaEngineTagDependency 
---@field hurtEnemyRe MetaEngineTagDependency 
---@field hurtEnemyCm MetaEngineTagDependency 
---@field hurtEnemyBullet MetaEngineTagDependency 
---@field hurtEnemyNeedler MetaEngineTagDependency 
---@field hurtEnemyPlasma MetaEngineTagDependency 
---@field hurtEnemySniper MetaEngineTagDependency 
---@field hurtEnemyGrenade MetaEngineTagDependency 
---@field hurtEnemyExplosion MetaEngineTagDependency 
---@field hurtEnemyMelee MetaEngineTagDependency 
---@field hurtEnemyFlame MetaEngineTagDependency 
---@field hurtEnemyShotgun MetaEngineTagDependency 
---@field hurtEnemyVehicle MetaEngineTagDependency 
---@field hurtEnemyMountedweapon MetaEngineTagDependency 
---@field killedFriend MetaEngineTagDependency 
---@field killedFriendCm MetaEngineTagDependency 
---@field killedFriendPlayer MetaEngineTagDependency 
---@field killedFriendPlayerCm MetaEngineTagDependency 
---@field killedEnemy MetaEngineTagDependency 
---@field killedEnemyCm MetaEngineTagDependency 
---@field killedEnemyPlayer MetaEngineTagDependency 
---@field killedEnemyPlayerCm MetaEngineTagDependency 
---@field killedEnemyCovenant MetaEngineTagDependency 
---@field killedEnemyCovenantCm MetaEngineTagDependency 
---@field killedEnemyFloodcombat MetaEngineTagDependency 
---@field killedEnemyFloodcombatCm MetaEngineTagDependency 
---@field killedEnemyFloodcarrier MetaEngineTagDependency 
---@field killedEnemyFloodcarrierCm MetaEngineTagDependency 
---@field killedEnemySentinel MetaEngineTagDependency 
---@field killedEnemySentinelCm MetaEngineTagDependency 
---@field killedEnemyBullet MetaEngineTagDependency 
---@field killedEnemyNeedler MetaEngineTagDependency 
---@field killedEnemyPlasma MetaEngineTagDependency 
---@field killedEnemySniper MetaEngineTagDependency 
---@field killedEnemyGrenade MetaEngineTagDependency 
---@field killedEnemyExplosion MetaEngineTagDependency 
---@field killedEnemyMelee MetaEngineTagDependency 
---@field killedEnemyFlame MetaEngineTagDependency 
---@field killedEnemyShotgun MetaEngineTagDependency 
---@field killedEnemyVehicle MetaEngineTagDependency 
---@field killedEnemyMountedweapon MetaEngineTagDependency 
---@field killingSpree MetaEngineTagDependency 
---@field playerKillCm MetaEngineTagDependency 
---@field playerKillBulletCm MetaEngineTagDependency 
---@field playerKillNeedlerCm MetaEngineTagDependency 
---@field playerKillPlasmaCm MetaEngineTagDependency 
---@field playerKillSniperCm MetaEngineTagDependency 
---@field anyoneKillGrenadeCm MetaEngineTagDependency 
---@field playerKillExplosionCm MetaEngineTagDependency 
---@field playerKillMeleeCm MetaEngineTagDependency 
---@field playerKillFlameCm MetaEngineTagDependency 
---@field playerKillShotgunCm MetaEngineTagDependency 
---@field playerKillVehicleCm MetaEngineTagDependency 
---@field playerKillMountedweaponCm MetaEngineTagDependency 
---@field playerKilllingSpreeCm MetaEngineTagDependency 
---@field friendDied MetaEngineTagDependency 
---@field friendPlayerDied MetaEngineTagDependency 
---@field friendKilledByFriend MetaEngineTagDependency 
---@field friendKilledByFriendlyPlayer MetaEngineTagDependency 
---@field friendKilledByEnemy MetaEngineTagDependency 
---@field friendKilledByEnemyPlayer MetaEngineTagDependency 
---@field friendKilledByCovenant MetaEngineTagDependency 
---@field friendKilledByFlood MetaEngineTagDependency 
---@field friendKilledBySentinel MetaEngineTagDependency 
---@field friendBetrayed MetaEngineTagDependency 
---@field newCombatAlone MetaEngineTagDependency 
---@field newEnemyRecentCombat MetaEngineTagDependency 
---@field oldEnemySighted MetaEngineTagDependency 
---@field unexpectedEnemy MetaEngineTagDependency 
---@field deadFriendFound MetaEngineTagDependency 
---@field allianceBroken MetaEngineTagDependency 
---@field allianceReformed MetaEngineTagDependency 
---@field grenadeThrowing MetaEngineTagDependency 
---@field grenadeSighted MetaEngineTagDependency 
---@field grenadeStartle MetaEngineTagDependency 
---@field grenadeDangerEnemy MetaEngineTagDependency 
---@field grenadeDangerSelf MetaEngineTagDependency 
---@field grenadeDangerFriend MetaEngineTagDependency 
---@field newCombatGroupRe MetaEngineTagDependency 
---@field newCombatNearbyRe MetaEngineTagDependency 
---@field alertFriend MetaEngineTagDependency 
---@field alertFriendRe MetaEngineTagDependency 
---@field alertLostContact MetaEngineTagDependency 
---@field alertLostContactRe MetaEngineTagDependency 
---@field blocked MetaEngineTagDependency 
---@field blockedRe MetaEngineTagDependency 
---@field searchStart MetaEngineTagDependency 
---@field searchQuery MetaEngineTagDependency 
---@field searchQueryRe MetaEngineTagDependency 
---@field searchReport MetaEngineTagDependency 
---@field searchAbandon MetaEngineTagDependency 
---@field searchGroupAbandon MetaEngineTagDependency 
---@field groupUncover MetaEngineTagDependency 
---@field groupUncoverRe MetaEngineTagDependency 
---@field advance MetaEngineTagDependency 
---@field advanceRe MetaEngineTagDependency 
---@field retreat MetaEngineTagDependency 
---@field retreatRe MetaEngineTagDependency 
---@field cover MetaEngineTagDependency 
---@field sightedFriendPlayer MetaEngineTagDependency 
---@field shooting MetaEngineTagDependency 
---@field shootingVehicle MetaEngineTagDependency 
---@field shootingBerserk MetaEngineTagDependency 
---@field shootingGroup MetaEngineTagDependency 
---@field shootingTraitor MetaEngineTagDependency 
---@field taunt MetaEngineTagDependency 
---@field tauntRe MetaEngineTagDependency 
---@field flee MetaEngineTagDependency 
---@field fleeRe MetaEngineTagDependency 
---@field fleeLeaderDied MetaEngineTagDependency 
---@field attemptedFlee MetaEngineTagDependency 
---@field attemptedFleeRe MetaEngineTagDependency 
---@field lostContact MetaEngineTagDependency 
---@field hidingFinished MetaEngineTagDependency 
---@field vehicleEntry MetaEngineTagDependency 
---@field vehicleExit MetaEngineTagDependency 
---@field vehicleWoohoo MetaEngineTagDependency 
---@field vehicleScared MetaEngineTagDependency 
---@field vehicleCollision MetaEngineTagDependency 
---@field partiallySighted MetaEngineTagDependency 
---@field nothingThere MetaEngineTagDependency 
---@field pleading MetaEngineTagDependency 
---@field surprise MetaEngineTagDependency 
---@field berserk MetaEngineTagDependency 
---@field meleeAttack MetaEngineTagDependency 
---@field dive MetaEngineTagDependency 
---@field uncoverExclamation MetaEngineTagDependency 
---@field leapAttack MetaEngineTagDependency 
---@field resurrection MetaEngineTagDependency 
---@field celebration MetaEngineTagDependency 
---@field checkBodyEnemy MetaEngineTagDependency 
---@field checkBodyFriend MetaEngineTagDependency 
---@field shootingDeadEnemy MetaEngineTagDependency 
---@field shootingDeadEnemyPlayer MetaEngineTagDependency 
---@field alone MetaEngineTagDependency 
---@field unscathed MetaEngineTagDependency 
---@field seriouslyWounded MetaEngineTagDependency 
---@field seriouslyWoundedRe MetaEngineTagDependency 
---@field massacre MetaEngineTagDependency 
---@field massacreRe MetaEngineTagDependency 
---@field rout MetaEngineTagDependency 
---@field routRe MetaEngineTagDependency 

---@class MetaEngineTagDataShaderTransparentMeterFlags 
---@field decal boolean 
---@field twoSided boolean 
---@field flashColorIsNegative boolean 
---@field tintMode_2 boolean 
---@field unfiltered boolean 

---@class MetaEngineTagDataShaderTransparentMeter: MetaEngineTagDataShader  
---@field meterFlags MetaEngineTagDataShaderTransparentMeterFlags 
---@field map MetaEngineTagDependency 
---@field gradientMinColor MetaEngineColorRGB 
---@field gradientMaxColor MetaEngineColorRGB 
---@field backgroundColor MetaEngineColorRGB 
---@field flashColor MetaEngineColorRGB 
---@field meterTintColor MetaEngineColorRGB 
---@field meterTransparency MetaEngineFraction 
---@field backgroundTransparency MetaEngineFraction 
---@field meterBrightnessSource EngineTagDataFunctionOut 
---@field flashBrightnessSource EngineTagDataFunctionOut 
---@field valueSource EngineTagDataFunctionOut 
---@field gradientSource EngineTagDataFunctionOut 
---@field flashExtensionSource EngineTagDataFunctionOut 

---@class EngineTagDataDeviceInEnum : Enum 

---@class EngineTagDataDeviceInNone : EngineTagDataDeviceInEnum 
---@class EngineTagDataDeviceInPower : EngineTagDataDeviceInEnum 
---@class EngineTagDataDeviceInChangeInPower : EngineTagDataDeviceInEnum 
---@class EngineTagDataDeviceInPosition : EngineTagDataDeviceInEnum 
---@class EngineTagDataDeviceInChangeInPosition : EngineTagDataDeviceInEnum 
---@class EngineTagDataDeviceInLocked : EngineTagDataDeviceInEnum 
---@class EngineTagDataDeviceInDelay : EngineTagDataDeviceInEnum 

---@alias EngineTagDataDeviceIn 
---| EngineTagDataDeviceInNone
---| EngineTagDataDeviceInPower
---| EngineTagDataDeviceInChangeInPower
---| EngineTagDataDeviceInPosition
---| EngineTagDataDeviceInChangeInPosition
---| EngineTagDataDeviceInLocked
---| EngineTagDataDeviceInDelay

---@class EngineTagDataDeviceInTable 
---@field none EngineTagDataDeviceInNone
---@field power EngineTagDataDeviceInPower
---@field changeInPower EngineTagDataDeviceInChangeInPower
---@field position EngineTagDataDeviceInPosition
---@field changeInPosition EngineTagDataDeviceInChangeInPosition
---@field locked EngineTagDataDeviceInLocked
---@field delay EngineTagDataDeviceInDelay
Engine.tag.deviceIn = {} 

---@class MetaEngineTagDataDeviceFlags 
---@field positionLoops boolean 
---@field positionNotInterpolated boolean 

---@class MetaEngineTagDataDevice: MetaEngineTagDataObject  
---@field deviceFlags MetaEngineTagDataDeviceFlags 
---@field powerTransitionTime number 
---@field powerAccelerationTime number 
---@field positionTransitionTime number 
---@field positionAccelerationTime number 
---@field depoweredPositionTransitionTime number 
---@field depoweredPositionAccelerationTime number 
---@field deviceAIn EngineTagDataDeviceIn 
---@field deviceBIn EngineTagDataDeviceIn 
---@field deviceCIn EngineTagDataDeviceIn 
---@field deviceDIn EngineTagDataDeviceIn 
---@field open MetaEngineTagDependency 
---@field close MetaEngineTagDependency 
---@field opened MetaEngineTagDependency 
---@field closed MetaEngineTagDependency 
---@field depowered MetaEngineTagDependency 
---@field repowered MetaEngineTagDependency 
---@field delayTime number 
---@field delayEffect MetaEngineTagDependency 
---@field automaticActivationRadius number 
---@field inversePowerAccelerationTime number 
---@field inversePowerTransitionTime number 
---@field inverseDepoweredPositionAccelerationTime number 
---@field inverseDepoweredPositionTransitionTime number 
---@field inversePositionAccelerationTime number 
---@field inversePositionTransitionTime number 
---@field delayTimeTicks number 

---@class EngineTagDataSoundFormatEnum : Enum 

---@class EngineTagDataSoundFormat_16BitPcm : EngineTagDataSoundFormatEnum 
---@class EngineTagDataSoundFormatXboxAdpcm : EngineTagDataSoundFormatEnum 
---@class EngineTagDataSoundFormatImaAdpcm : EngineTagDataSoundFormatEnum 
---@class EngineTagDataSoundFormatOggVorbis : EngineTagDataSoundFormatEnum 

---@alias EngineTagDataSoundFormat 
---| EngineTagDataSoundFormat_16BitPcm
---| EngineTagDataSoundFormatXboxAdpcm
---| EngineTagDataSoundFormatImaAdpcm
---| EngineTagDataSoundFormatOggVorbis

---@class EngineTagDataSoundFormatTable 
---@field _16BitPcm EngineTagDataSoundFormat_16BitPcm
---@field xboxAdpcm EngineTagDataSoundFormatXboxAdpcm
---@field imaAdpcm EngineTagDataSoundFormatImaAdpcm
---@field oggVorbis EngineTagDataSoundFormatOggVorbis
Engine.tag.soundFormat = {} 

---@class EngineTagDataSoundClassEnum : Enum 

---@class EngineTagDataSoundClassProjectileImpact : EngineTagDataSoundClassEnum 
---@class EngineTagDataSoundClassProjectileDetonation : EngineTagDataSoundClassEnum 
---@class EngineTagDataSoundClassUnused : EngineTagDataSoundClassEnum 
---@class EngineTagDataSoundClassUnused1 : EngineTagDataSoundClassEnum 
---@class EngineTagDataSoundClassWeaponFire : EngineTagDataSoundClassEnum 
---@class EngineTagDataSoundClassWeaponReady : EngineTagDataSoundClassEnum 
---@class EngineTagDataSoundClassWeaponReload : EngineTagDataSoundClassEnum 
---@class EngineTagDataSoundClassWeaponEmpty : EngineTagDataSoundClassEnum 
---@class EngineTagDataSoundClassWeaponCharge : EngineTagDataSoundClassEnum 
---@class EngineTagDataSoundClassWeaponOverheat : EngineTagDataSoundClassEnum 
---@class EngineTagDataSoundClassWeaponIdle : EngineTagDataSoundClassEnum 
---@class EngineTagDataSoundClassUnused2 : EngineTagDataSoundClassEnum 
---@class EngineTagDataSoundClassUnused3 : EngineTagDataSoundClassEnum 
---@class EngineTagDataSoundClassObjectImpacts : EngineTagDataSoundClassEnum 
---@class EngineTagDataSoundClassParticleImpacts : EngineTagDataSoundClassEnum 
---@class EngineTagDataSoundClassSlowParticleImpacts : EngineTagDataSoundClassEnum 
---@class EngineTagDataSoundClassUnused4 : EngineTagDataSoundClassEnum 
---@class EngineTagDataSoundClassUnused5 : EngineTagDataSoundClassEnum 
---@class EngineTagDataSoundClassUnitFootsteps : EngineTagDataSoundClassEnum 
---@class EngineTagDataSoundClassUnitDialog : EngineTagDataSoundClassEnum 
---@class EngineTagDataSoundClassUnused6 : EngineTagDataSoundClassEnum 
---@class EngineTagDataSoundClassUnused7 : EngineTagDataSoundClassEnum 
---@class EngineTagDataSoundClassVehicleCollision : EngineTagDataSoundClassEnum 
---@class EngineTagDataSoundClassVehicleEngine : EngineTagDataSoundClassEnum 
---@class EngineTagDataSoundClassUnused8 : EngineTagDataSoundClassEnum 
---@class EngineTagDataSoundClassUnused9 : EngineTagDataSoundClassEnum 
---@class EngineTagDataSoundClassDeviceDoor : EngineTagDataSoundClassEnum 
---@class EngineTagDataSoundClassDeviceForceField : EngineTagDataSoundClassEnum 
---@class EngineTagDataSoundClassDeviceMachinery : EngineTagDataSoundClassEnum 
---@class EngineTagDataSoundClassDeviceNature : EngineTagDataSoundClassEnum 
---@class EngineTagDataSoundClassDeviceComputers : EngineTagDataSoundClassEnum 
---@class EngineTagDataSoundClassUnused10 : EngineTagDataSoundClassEnum 
---@class EngineTagDataSoundClassMusic : EngineTagDataSoundClassEnum 
---@class EngineTagDataSoundClassAmbientNature : EngineTagDataSoundClassEnum 
---@class EngineTagDataSoundClassAmbientMachinery : EngineTagDataSoundClassEnum 
---@class EngineTagDataSoundClassAmbientComputers : EngineTagDataSoundClassEnum 
---@class EngineTagDataSoundClassUnused11 : EngineTagDataSoundClassEnum 
---@class EngineTagDataSoundClassUnused12 : EngineTagDataSoundClassEnum 
---@class EngineTagDataSoundClassUnused13 : EngineTagDataSoundClassEnum 
---@class EngineTagDataSoundClassFirstPersonDamage : EngineTagDataSoundClassEnum 
---@class EngineTagDataSoundClassUnused14 : EngineTagDataSoundClassEnum 
---@class EngineTagDataSoundClassUnused15 : EngineTagDataSoundClassEnum 
---@class EngineTagDataSoundClassUnused16 : EngineTagDataSoundClassEnum 
---@class EngineTagDataSoundClassUnused17 : EngineTagDataSoundClassEnum 
---@class EngineTagDataSoundClassScriptedDialogPlayer : EngineTagDataSoundClassEnum 
---@class EngineTagDataSoundClassScriptedEffect : EngineTagDataSoundClassEnum 
---@class EngineTagDataSoundClassScriptedDialogOther : EngineTagDataSoundClassEnum 
---@class EngineTagDataSoundClassScriptedDialogForceUnspatialized : EngineTagDataSoundClassEnum 
---@class EngineTagDataSoundClassUnused18 : EngineTagDataSoundClassEnum 
---@class EngineTagDataSoundClassUnused19 : EngineTagDataSoundClassEnum 
---@class EngineTagDataSoundClassGameEvent : EngineTagDataSoundClassEnum 

---@alias EngineTagDataSoundClass 
---| EngineTagDataSoundClassProjectileImpact
---| EngineTagDataSoundClassProjectileDetonation
---| EngineTagDataSoundClassUnused
---| EngineTagDataSoundClassUnused1
---| EngineTagDataSoundClassWeaponFire
---| EngineTagDataSoundClassWeaponReady
---| EngineTagDataSoundClassWeaponReload
---| EngineTagDataSoundClassWeaponEmpty
---| EngineTagDataSoundClassWeaponCharge
---| EngineTagDataSoundClassWeaponOverheat
---| EngineTagDataSoundClassWeaponIdle
---| EngineTagDataSoundClassUnused2
---| EngineTagDataSoundClassUnused3
---| EngineTagDataSoundClassObjectImpacts
---| EngineTagDataSoundClassParticleImpacts
---| EngineTagDataSoundClassSlowParticleImpacts
---| EngineTagDataSoundClassUnused4
---| EngineTagDataSoundClassUnused5
---| EngineTagDataSoundClassUnitFootsteps
---| EngineTagDataSoundClassUnitDialog
---| EngineTagDataSoundClassUnused6
---| EngineTagDataSoundClassUnused7
---| EngineTagDataSoundClassVehicleCollision
---| EngineTagDataSoundClassVehicleEngine
---| EngineTagDataSoundClassUnused8
---| EngineTagDataSoundClassUnused9
---| EngineTagDataSoundClassDeviceDoor
---| EngineTagDataSoundClassDeviceForceField
---| EngineTagDataSoundClassDeviceMachinery
---| EngineTagDataSoundClassDeviceNature
---| EngineTagDataSoundClassDeviceComputers
---| EngineTagDataSoundClassUnused10
---| EngineTagDataSoundClassMusic
---| EngineTagDataSoundClassAmbientNature
---| EngineTagDataSoundClassAmbientMachinery
---| EngineTagDataSoundClassAmbientComputers
---| EngineTagDataSoundClassUnused11
---| EngineTagDataSoundClassUnused12
---| EngineTagDataSoundClassUnused13
---| EngineTagDataSoundClassFirstPersonDamage
---| EngineTagDataSoundClassUnused14
---| EngineTagDataSoundClassUnused15
---| EngineTagDataSoundClassUnused16
---| EngineTagDataSoundClassUnused17
---| EngineTagDataSoundClassScriptedDialogPlayer
---| EngineTagDataSoundClassScriptedEffect
---| EngineTagDataSoundClassScriptedDialogOther
---| EngineTagDataSoundClassScriptedDialogForceUnspatialized
---| EngineTagDataSoundClassUnused18
---| EngineTagDataSoundClassUnused19
---| EngineTagDataSoundClassGameEvent

---@class EngineTagDataSoundClassTable 
---@field projectileImpact EngineTagDataSoundClassProjectileImpact
---@field projectileDetonation EngineTagDataSoundClassProjectileDetonation
---@field unused EngineTagDataSoundClassUnused
---@field unused1 EngineTagDataSoundClassUnused1
---@field weaponFire EngineTagDataSoundClassWeaponFire
---@field weaponReady EngineTagDataSoundClassWeaponReady
---@field weaponReload EngineTagDataSoundClassWeaponReload
---@field weaponEmpty EngineTagDataSoundClassWeaponEmpty
---@field weaponCharge EngineTagDataSoundClassWeaponCharge
---@field weaponOverheat EngineTagDataSoundClassWeaponOverheat
---@field weaponIdle EngineTagDataSoundClassWeaponIdle
---@field unused2 EngineTagDataSoundClassUnused2
---@field unused3 EngineTagDataSoundClassUnused3
---@field objectImpacts EngineTagDataSoundClassObjectImpacts
---@field particleImpacts EngineTagDataSoundClassParticleImpacts
---@field slowParticleImpacts EngineTagDataSoundClassSlowParticleImpacts
---@field unused4 EngineTagDataSoundClassUnused4
---@field unused5 EngineTagDataSoundClassUnused5
---@field unitFootsteps EngineTagDataSoundClassUnitFootsteps
---@field unitDialog EngineTagDataSoundClassUnitDialog
---@field unused6 EngineTagDataSoundClassUnused6
---@field unused7 EngineTagDataSoundClassUnused7
---@field vehicleCollision EngineTagDataSoundClassVehicleCollision
---@field vehicleEngine EngineTagDataSoundClassVehicleEngine
---@field unused8 EngineTagDataSoundClassUnused8
---@field unused9 EngineTagDataSoundClassUnused9
---@field deviceDoor EngineTagDataSoundClassDeviceDoor
---@field deviceForceField EngineTagDataSoundClassDeviceForceField
---@field deviceMachinery EngineTagDataSoundClassDeviceMachinery
---@field deviceNature EngineTagDataSoundClassDeviceNature
---@field deviceComputers EngineTagDataSoundClassDeviceComputers
---@field unused10 EngineTagDataSoundClassUnused10
---@field music EngineTagDataSoundClassMusic
---@field ambientNature EngineTagDataSoundClassAmbientNature
---@field ambientMachinery EngineTagDataSoundClassAmbientMachinery
---@field ambientComputers EngineTagDataSoundClassAmbientComputers
---@field unused11 EngineTagDataSoundClassUnused11
---@field unused12 EngineTagDataSoundClassUnused12
---@field unused13 EngineTagDataSoundClassUnused13
---@field firstPersonDamage EngineTagDataSoundClassFirstPersonDamage
---@field unused14 EngineTagDataSoundClassUnused14
---@field unused15 EngineTagDataSoundClassUnused15
---@field unused16 EngineTagDataSoundClassUnused16
---@field unused17 EngineTagDataSoundClassUnused17
---@field scriptedDialogPlayer EngineTagDataSoundClassScriptedDialogPlayer
---@field scriptedEffect EngineTagDataSoundClassScriptedEffect
---@field scriptedDialogOther EngineTagDataSoundClassScriptedDialogOther
---@field scriptedDialogForceUnspatialized EngineTagDataSoundClassScriptedDialogForceUnspatialized
---@field unused18 EngineTagDataSoundClassUnused18
---@field unused19 EngineTagDataSoundClassUnused19
---@field gameEvent EngineTagDataSoundClassGameEvent
Engine.tag.soundClass = {} 

---@class EngineTagDataSoundSampleRateEnum : Enum 

---@class EngineTagDataSoundSampleRate_22050_Hz : EngineTagDataSoundSampleRateEnum 
---@class EngineTagDataSoundSampleRate_44100_Hz : EngineTagDataSoundSampleRateEnum 

---@alias EngineTagDataSoundSampleRate 
---| EngineTagDataSoundSampleRate_22050_Hz
---| EngineTagDataSoundSampleRate_44100_Hz

---@class EngineTagDataSoundSampleRateTable 
---@field e_22050_Hz EngineTagDataSoundSampleRate_22050_Hz
---@field e_44100_Hz EngineTagDataSoundSampleRate_44100_Hz
Engine.tag.soundSampleRate = {} 

---@class EngineTagDataSoundChannelCountEnum : Enum 

---@class EngineTagDataSoundChannelCountMono : EngineTagDataSoundChannelCountEnum 
---@class EngineTagDataSoundChannelCountStereo : EngineTagDataSoundChannelCountEnum 

---@alias EngineTagDataSoundChannelCount 
---| EngineTagDataSoundChannelCountMono
---| EngineTagDataSoundChannelCountStereo

---@class EngineTagDataSoundChannelCountTable 
---@field tMono EngineTagDataSoundChannelCountMono
---@field tStereo EngineTagDataSoundChannelCountStereo
Engine.tag.soundChannelCount = {} 

---@class MetaEngineTagDataSoundFlags 
---@field fitToAdpcmBlocksize boolean 
---@field splitLongSoundIntoPermutations boolean 
---@field thirstyGrunt boolean 

---@class MetaEngineTagDataSoundPermutation 
---@field name MetaEngineTagString 
---@field skipFraction MetaEngineFraction 
---@field gain MetaEngineFraction 
---@field format EngineTagDataSoundFormat 
---@field nextPermutationIndex MetaEngineIndex 
---@field unknownTagHandle EngineTagHandle 
---@field samplesPointer integer 
---@field soundTagHandle_0 EngineTagHandle 
---@field bufferSize integer 
---@field soundTagHandle_1 EngineTagHandle 
---@field samples MetaEngineTagDataOffset 
---@field mouthData MetaEngineTagDataOffset 
---@field subtitleData MetaEngineTagDataOffset 

---@class MetaEngineTagDataSoundPitchRange 
---@field name MetaEngineTagString 
---@field naturalPitch number 
---@field bendBounds number 
---@field actualPermutationCount integer 
---@field playbackRate number 
---@field unknownFfffffff_0 integer 
---@field unknownFfffffff_1 integer 
---@field permutations table<MetaEngineTagDataSoundPermutation> 

---@class MetaEngineTagDataSound 
---@field flags MetaEngineTagDataSoundFlags 
---@field soundClass EngineTagDataSoundClass 
---@field sampleRate EngineTagDataSoundSampleRate 
---@field minimumDistance number 
---@field maximumDistance number 
---@field skipFraction MetaEngineFraction 
---@field randomPitchBounds number 
---@field innerConeAngle MetaEngineAngle 
---@field outerConeAngle MetaEngineAngle 
---@field outerConeGain MetaEngineFraction 
---@field randomGainModifier number 
---@field maximumBendPerSecond number 
---@field zeroSkipFractionModifier number 
---@field zeroGainModifier number 
---@field zeroPitchModifier number 
---@field oneSkipFractionModifier number 
---@field oneGainModifier number 
---@field onePitchModifier number 
---@field channelCount EngineTagDataSoundChannelCount 
---@field format EngineTagDataSoundFormat 
---@field promotionSound MetaEngineTagDependency 
---@field promotionCount integer 
---@field longestPermutationLength integer 
---@field unknownFfffffff_0 integer 
---@field unknownFfffffff_1 integer 
---@field pitchRanges table<MetaEngineTagDataSoundPitchRange> 

---@class MetaEngineTagDataDeviceLightFixture: MetaEngineTagDataDevice  

---@class MetaEngineTagDataAntennaVertex 
---@field springStrengthCoefficient MetaEngineFraction 
---@field angles MetaEngineEuler2D 
---@field length number 
---@field sequenceIndex MetaEngineIndex 
---@field color MetaEngineColorARGB 
---@field lodColor MetaEngineColorARGB 
---@field offset MetaEnginePoint3D 

---@class MetaEngineTagDataAntenna 
---@field attachmentMarkerName MetaEngineTagString 
---@field bitmaps MetaEngineTagDependency 
---@field physics MetaEngineTagDependency 
---@field springStrengthCoefficient MetaEngineFraction 
---@field falloffPixels number 
---@field cutoffPixels number 
---@field length number 
---@field vertices table<MetaEngineTagDataAntennaVertex> 

---@class MetaEngineTagDataSoundEnvironment 
---@field unknown integer 
---@field priority integer 
---@field roomIntensity MetaEngineFraction 
---@field roomIntensityHf MetaEngineFraction 
---@field roomRolloff number 
---@field decayTime number 
---@field decayHfRatio number 
---@field reflectionsIntensity MetaEngineFraction 
---@field reflectionsDelay number 
---@field reverbIntensity MetaEngineFraction 
---@field reverbDelay number 
---@field diffusion number 
---@field density number 
---@field hfReference number 

---@class EngineTagDataVehicleTypeEnum : Enum 

---@class EngineTagDataVehicleTypeHumanTank : EngineTagDataVehicleTypeEnum 
---@class EngineTagDataVehicleTypeHumanJeep : EngineTagDataVehicleTypeEnum 
---@class EngineTagDataVehicleTypeHumanBoat : EngineTagDataVehicleTypeEnum 
---@class EngineTagDataVehicleTypeHumanPlane : EngineTagDataVehicleTypeEnum 
---@class EngineTagDataVehicleTypeAlienScout : EngineTagDataVehicleTypeEnum 
---@class EngineTagDataVehicleTypeAlienFighter : EngineTagDataVehicleTypeEnum 
---@class EngineTagDataVehicleTypeTurret : EngineTagDataVehicleTypeEnum 

---@alias EngineTagDataVehicleType 
---| EngineTagDataVehicleTypeHumanTank
---| EngineTagDataVehicleTypeHumanJeep
---| EngineTagDataVehicleTypeHumanBoat
---| EngineTagDataVehicleTypeHumanPlane
---| EngineTagDataVehicleTypeAlienScout
---| EngineTagDataVehicleTypeAlienFighter
---| EngineTagDataVehicleTypeTurret

---@class EngineTagDataVehicleTypeTable 
---@field humanTank EngineTagDataVehicleTypeHumanTank
---@field humanJeep EngineTagDataVehicleTypeHumanJeep
---@field humanBoat EngineTagDataVehicleTypeHumanBoat
---@field humanPlane EngineTagDataVehicleTypeHumanPlane
---@field alienScout EngineTagDataVehicleTypeAlienScout
---@field alienFighter EngineTagDataVehicleTypeAlienFighter
---@field turret EngineTagDataVehicleTypeTurret
Engine.tag.vehicleType = {} 

---@class EngineTagDataVehicleFunctionInEnum : Enum 

---@class EngineTagDataVehicleFunctionInNone : EngineTagDataVehicleFunctionInEnum 
---@class EngineTagDataVehicleFunctionInSpeedAbsolute : EngineTagDataVehicleFunctionInEnum 
---@class EngineTagDataVehicleFunctionInSpeedForward : EngineTagDataVehicleFunctionInEnum 
---@class EngineTagDataVehicleFunctionInSpeedBackward : EngineTagDataVehicleFunctionInEnum 
---@class EngineTagDataVehicleFunctionInSlideAbsolute : EngineTagDataVehicleFunctionInEnum 
---@class EngineTagDataVehicleFunctionInSlideLeft : EngineTagDataVehicleFunctionInEnum 
---@class EngineTagDataVehicleFunctionInSlideRight : EngineTagDataVehicleFunctionInEnum 
---@class EngineTagDataVehicleFunctionInSpeedSlideMaximum : EngineTagDataVehicleFunctionInEnum 
---@class EngineTagDataVehicleFunctionInTurnAbsolute : EngineTagDataVehicleFunctionInEnum 
---@class EngineTagDataVehicleFunctionInTurnLeft : EngineTagDataVehicleFunctionInEnum 
---@class EngineTagDataVehicleFunctionInTurnRight : EngineTagDataVehicleFunctionInEnum 
---@class EngineTagDataVehicleFunctionInCrouch : EngineTagDataVehicleFunctionInEnum 
---@class EngineTagDataVehicleFunctionInJump : EngineTagDataVehicleFunctionInEnum 
---@class EngineTagDataVehicleFunctionInWalk : EngineTagDataVehicleFunctionInEnum 
---@class EngineTagDataVehicleFunctionInVelocityAir : EngineTagDataVehicleFunctionInEnum 
---@class EngineTagDataVehicleFunctionInVelocityWater : EngineTagDataVehicleFunctionInEnum 
---@class EngineTagDataVehicleFunctionInVelocityGround : EngineTagDataVehicleFunctionInEnum 
---@class EngineTagDataVehicleFunctionInVelocityForward : EngineTagDataVehicleFunctionInEnum 
---@class EngineTagDataVehicleFunctionInVelocityLeft : EngineTagDataVehicleFunctionInEnum 
---@class EngineTagDataVehicleFunctionInVelocityUp : EngineTagDataVehicleFunctionInEnum 
---@class EngineTagDataVehicleFunctionInLeftTreadPosition : EngineTagDataVehicleFunctionInEnum 
---@class EngineTagDataVehicleFunctionInRightTreadPosition : EngineTagDataVehicleFunctionInEnum 
---@class EngineTagDataVehicleFunctionInLeftTreadVelocity : EngineTagDataVehicleFunctionInEnum 
---@class EngineTagDataVehicleFunctionInRightTreadVelocity : EngineTagDataVehicleFunctionInEnum 
---@class EngineTagDataVehicleFunctionInFrontLeftTirePosition : EngineTagDataVehicleFunctionInEnum 
---@class EngineTagDataVehicleFunctionInFrontRightTirePosition : EngineTagDataVehicleFunctionInEnum 
---@class EngineTagDataVehicleFunctionInBackLeftTirePosition : EngineTagDataVehicleFunctionInEnum 
---@class EngineTagDataVehicleFunctionInBackRightTirePosition : EngineTagDataVehicleFunctionInEnum 
---@class EngineTagDataVehicleFunctionInFrontLeftTireVelocity : EngineTagDataVehicleFunctionInEnum 
---@class EngineTagDataVehicleFunctionInFrontRightTireVelocity : EngineTagDataVehicleFunctionInEnum 
---@class EngineTagDataVehicleFunctionInBackLeftTireVelocity : EngineTagDataVehicleFunctionInEnum 
---@class EngineTagDataVehicleFunctionInBackRightTireVelocity : EngineTagDataVehicleFunctionInEnum 
---@class EngineTagDataVehicleFunctionInWingtipContrail : EngineTagDataVehicleFunctionInEnum 
---@class EngineTagDataVehicleFunctionInHover : EngineTagDataVehicleFunctionInEnum 
---@class EngineTagDataVehicleFunctionInThrust : EngineTagDataVehicleFunctionInEnum 
---@class EngineTagDataVehicleFunctionInEngineHack : EngineTagDataVehicleFunctionInEnum 
---@class EngineTagDataVehicleFunctionInWingtipContrailNew : EngineTagDataVehicleFunctionInEnum 

---@alias EngineTagDataVehicleFunctionIn 
---| EngineTagDataVehicleFunctionInNone
---| EngineTagDataVehicleFunctionInSpeedAbsolute
---| EngineTagDataVehicleFunctionInSpeedForward
---| EngineTagDataVehicleFunctionInSpeedBackward
---| EngineTagDataVehicleFunctionInSlideAbsolute
---| EngineTagDataVehicleFunctionInSlideLeft
---| EngineTagDataVehicleFunctionInSlideRight
---| EngineTagDataVehicleFunctionInSpeedSlideMaximum
---| EngineTagDataVehicleFunctionInTurnAbsolute
---| EngineTagDataVehicleFunctionInTurnLeft
---| EngineTagDataVehicleFunctionInTurnRight
---| EngineTagDataVehicleFunctionInCrouch
---| EngineTagDataVehicleFunctionInJump
---| EngineTagDataVehicleFunctionInWalk
---| EngineTagDataVehicleFunctionInVelocityAir
---| EngineTagDataVehicleFunctionInVelocityWater
---| EngineTagDataVehicleFunctionInVelocityGround
---| EngineTagDataVehicleFunctionInVelocityForward
---| EngineTagDataVehicleFunctionInVelocityLeft
---| EngineTagDataVehicleFunctionInVelocityUp
---| EngineTagDataVehicleFunctionInLeftTreadPosition
---| EngineTagDataVehicleFunctionInRightTreadPosition
---| EngineTagDataVehicleFunctionInLeftTreadVelocity
---| EngineTagDataVehicleFunctionInRightTreadVelocity
---| EngineTagDataVehicleFunctionInFrontLeftTirePosition
---| EngineTagDataVehicleFunctionInFrontRightTirePosition
---| EngineTagDataVehicleFunctionInBackLeftTirePosition
---| EngineTagDataVehicleFunctionInBackRightTirePosition
---| EngineTagDataVehicleFunctionInFrontLeftTireVelocity
---| EngineTagDataVehicleFunctionInFrontRightTireVelocity
---| EngineTagDataVehicleFunctionInBackLeftTireVelocity
---| EngineTagDataVehicleFunctionInBackRightTireVelocity
---| EngineTagDataVehicleFunctionInWingtipContrail
---| EngineTagDataVehicleFunctionInHover
---| EngineTagDataVehicleFunctionInThrust
---| EngineTagDataVehicleFunctionInEngineHack
---| EngineTagDataVehicleFunctionInWingtipContrailNew

---@class EngineTagDataVehicleFunctionInTable 
---@field nNone EngineTagDataVehicleFunctionInNone
---@field nSpeedAbsolute EngineTagDataVehicleFunctionInSpeedAbsolute
---@field nSpeedForward EngineTagDataVehicleFunctionInSpeedForward
---@field nSpeedBackward EngineTagDataVehicleFunctionInSpeedBackward
---@field nSlideAbsolute EngineTagDataVehicleFunctionInSlideAbsolute
---@field nSlideLeft EngineTagDataVehicleFunctionInSlideLeft
---@field nSlideRight EngineTagDataVehicleFunctionInSlideRight
---@field nSpeedSlideMaximum EngineTagDataVehicleFunctionInSpeedSlideMaximum
---@field nTurnAbsolute EngineTagDataVehicleFunctionInTurnAbsolute
---@field nTurnLeft EngineTagDataVehicleFunctionInTurnLeft
---@field nTurnRight EngineTagDataVehicleFunctionInTurnRight
---@field nCrouch EngineTagDataVehicleFunctionInCrouch
---@field nJump EngineTagDataVehicleFunctionInJump
---@field nWalk EngineTagDataVehicleFunctionInWalk
---@field nVelocityAir EngineTagDataVehicleFunctionInVelocityAir
---@field nVelocityWater EngineTagDataVehicleFunctionInVelocityWater
---@field nVelocityGround EngineTagDataVehicleFunctionInVelocityGround
---@field nVelocityForward EngineTagDataVehicleFunctionInVelocityForward
---@field nVelocityLeft EngineTagDataVehicleFunctionInVelocityLeft
---@field nVelocityUp EngineTagDataVehicleFunctionInVelocityUp
---@field nLeftTreadPosition EngineTagDataVehicleFunctionInLeftTreadPosition
---@field nRightTreadPosition EngineTagDataVehicleFunctionInRightTreadPosition
---@field nLeftTreadVelocity EngineTagDataVehicleFunctionInLeftTreadVelocity
---@field nRightTreadVelocity EngineTagDataVehicleFunctionInRightTreadVelocity
---@field nFrontLeftTirePosition EngineTagDataVehicleFunctionInFrontLeftTirePosition
---@field nFrontRightTirePosition EngineTagDataVehicleFunctionInFrontRightTirePosition
---@field nBackLeftTirePosition EngineTagDataVehicleFunctionInBackLeftTirePosition
---@field nBackRightTirePosition EngineTagDataVehicleFunctionInBackRightTirePosition
---@field nFrontLeftTireVelocity EngineTagDataVehicleFunctionInFrontLeftTireVelocity
---@field nFrontRightTireVelocity EngineTagDataVehicleFunctionInFrontRightTireVelocity
---@field nBackLeftTireVelocity EngineTagDataVehicleFunctionInBackLeftTireVelocity
---@field nBackRightTireVelocity EngineTagDataVehicleFunctionInBackRightTireVelocity
---@field nWingtipContrail EngineTagDataVehicleFunctionInWingtipContrail
---@field nHover EngineTagDataVehicleFunctionInHover
---@field nThrust EngineTagDataVehicleFunctionInThrust
---@field nEngineHack EngineTagDataVehicleFunctionInEngineHack
---@field nWingtipContrailNew EngineTagDataVehicleFunctionInWingtipContrailNew
Engine.tag.vehicleFunctionIn = {} 

---@class MetaEngineTagDataVehicleFlags 
---@field speedWakesPhysics boolean 
---@field turnWakesPhysics boolean 
---@field driverPowerWakesPhysics boolean 
---@field gunnerPowerWakesPhysics boolean 
---@field controlOppositeSpeedSetsBrake boolean 
---@field slideWakesPhysics boolean 
---@field killsRidersAtTerminalVelocity boolean 
---@field causesCollisionDamage boolean 
---@field aiWeaponCannotRotate boolean 
---@field aiDoesNotRequireDriver boolean 
---@field aiUnused boolean 
---@field aiDriverEnable boolean 
---@field aiDriverFlying boolean 
---@field aiDriverCanSidestep boolean 
---@field aiDriverHovering boolean 
---@field vehicleSteersDirectly boolean 
---@field unused boolean 
---@field hasEbrake boolean 
---@field noncombatVehicle boolean 
---@field noFrictionWithDriver boolean 
---@field canTriggerAutomaticOpeningDoors boolean 
---@field autoaimWhenTeamless boolean 

---@class MetaEngineTagDataVehicle: MetaEngineTagDataUnit  
---@field vehicleFlags MetaEngineTagDataVehicleFlags 
---@field vehicleType EngineTagDataVehicleType 
---@field maximumForwardSpeed number 
---@field maximumReverseSpeed number 
---@field speedAcceleration number 
---@field speedDeceleration number 
---@field maximumLeftTurn number 
---@field maximumRightTurn number 
---@field wheelCircumference number 
---@field turnRate number 
---@field blurSpeed number 
---@field vehicleAIn EngineTagDataVehicleFunctionIn 
---@field vehicleBIn EngineTagDataVehicleFunctionIn 
---@field vehicleCIn EngineTagDataVehicleFunctionIn 
---@field vehicleDIn EngineTagDataVehicleFunctionIn 
---@field maximumLeftSlide number 
---@field maximumRightSlide number 
---@field slideAcceleration number 
---@field slideDeceleration number 
---@field minimumFlippingAngularVelocity number 
---@field maximumFlippingAngularVelocity number 
---@field fixedGunYaw number 
---@field fixedGunPitch number 
---@field aiSideslipDistance number 
---@field aiDestinationRadius number 
---@field aiAvoidanceDistance number 
---@field aiPathfindingRadius number 
---@field aiChargeRepeatTimeout number 
---@field aiStrafingAbortRange number 
---@field aiOversteeringBounds number 
---@field aiSteeringMaximum MetaEngineAngle 
---@field aiThrottleMaximum number 
---@field aiMovePositionTime number 
---@field suspensionSound MetaEngineTagDependency 
---@field crashSound MetaEngineTagDependency 
---@field materialEffects MetaEngineTagDependency 
---@field effect MetaEngineTagDependency 

---@class MetaEngineTagDataMultiplayerScenarioDescriptionScenarioDescription 
---@field descriptiveBitmap MetaEngineTagDependency 
---@field displayedMapName MetaEngineTagDependency 
---@field scenarioTagDirectoryPath MetaEngineTagString 

---@class MetaEngineTagDataMultiplayerScenarioDescription 
---@field multiplayerScenarios table<MetaEngineTagDataMultiplayerScenarioDescriptionScenarioDescription> 

---@class EngineTagDataDamageEffectScreenFlashTypeEnum : Enum 

---@class EngineTagDataDamageEffectScreenFlashTypeNone : EngineTagDataDamageEffectScreenFlashTypeEnum 
---@class EngineTagDataDamageEffectScreenFlashTypeLighten : EngineTagDataDamageEffectScreenFlashTypeEnum 
---@class EngineTagDataDamageEffectScreenFlashTypeDarken : EngineTagDataDamageEffectScreenFlashTypeEnum 
---@class EngineTagDataDamageEffectScreenFlashTypeMax : EngineTagDataDamageEffectScreenFlashTypeEnum 
---@class EngineTagDataDamageEffectScreenFlashTypeMin : EngineTagDataDamageEffectScreenFlashTypeEnum 
---@class EngineTagDataDamageEffectScreenFlashTypeInvert : EngineTagDataDamageEffectScreenFlashTypeEnum 
---@class EngineTagDataDamageEffectScreenFlashTypeTint : EngineTagDataDamageEffectScreenFlashTypeEnum 

---@alias EngineTagDataDamageEffectScreenFlashType 
---| EngineTagDataDamageEffectScreenFlashTypeNone
---| EngineTagDataDamageEffectScreenFlashTypeLighten
---| EngineTagDataDamageEffectScreenFlashTypeDarken
---| EngineTagDataDamageEffectScreenFlashTypeMax
---| EngineTagDataDamageEffectScreenFlashTypeMin
---| EngineTagDataDamageEffectScreenFlashTypeInvert
---| EngineTagDataDamageEffectScreenFlashTypeTint

---@class EngineTagDataDamageEffectScreenFlashTypeTable 
---@field ypeNone EngineTagDataDamageEffectScreenFlashTypeNone
---@field ypeLighten EngineTagDataDamageEffectScreenFlashTypeLighten
---@field ypeDarken EngineTagDataDamageEffectScreenFlashTypeDarken
---@field ypeMax EngineTagDataDamageEffectScreenFlashTypeMax
---@field ypeMin EngineTagDataDamageEffectScreenFlashTypeMin
---@field ypeInvert EngineTagDataDamageEffectScreenFlashTypeInvert
---@field ypeTint EngineTagDataDamageEffectScreenFlashTypeTint
Engine.tag.damageEffectScreenFlashType = {} 

---@class EngineTagDataDamageEffectScreenFlashPriorityEnum : Enum 

---@class EngineTagDataDamageEffectScreenFlashPriorityLow : EngineTagDataDamageEffectScreenFlashPriorityEnum 
---@class EngineTagDataDamageEffectScreenFlashPriorityMedium : EngineTagDataDamageEffectScreenFlashPriorityEnum 
---@class EngineTagDataDamageEffectScreenFlashPriorityHigh : EngineTagDataDamageEffectScreenFlashPriorityEnum 

---@alias EngineTagDataDamageEffectScreenFlashPriority 
---| EngineTagDataDamageEffectScreenFlashPriorityLow
---| EngineTagDataDamageEffectScreenFlashPriorityMedium
---| EngineTagDataDamageEffectScreenFlashPriorityHigh

---@class EngineTagDataDamageEffectScreenFlashPriorityTable 
---@field ityLow EngineTagDataDamageEffectScreenFlashPriorityLow
---@field ityMedium EngineTagDataDamageEffectScreenFlashPriorityMedium
---@field ityHigh EngineTagDataDamageEffectScreenFlashPriorityHigh
Engine.tag.damageEffectScreenFlashPriority = {} 

---@class EngineTagDataDamageEffectSideEffectEnum : Enum 

---@class EngineTagDataDamageEffectSideEffectNone : EngineTagDataDamageEffectSideEffectEnum 
---@class EngineTagDataDamageEffectSideEffectHarmless : EngineTagDataDamageEffectSideEffectEnum 
---@class EngineTagDataDamageEffectSideEffectLethalToTheUnsuspecting : EngineTagDataDamageEffectSideEffectEnum 
---@class EngineTagDataDamageEffectSideEffectEmp : EngineTagDataDamageEffectSideEffectEnum 

---@alias EngineTagDataDamageEffectSideEffect 
---| EngineTagDataDamageEffectSideEffectNone
---| EngineTagDataDamageEffectSideEffectHarmless
---| EngineTagDataDamageEffectSideEffectLethalToTheUnsuspecting
---| EngineTagDataDamageEffectSideEffectEmp

---@class EngineTagDataDamageEffectSideEffectTable 
---@field ctNone EngineTagDataDamageEffectSideEffectNone
---@field ctHarmless EngineTagDataDamageEffectSideEffectHarmless
---@field ctLethalToTheUnsuspecting EngineTagDataDamageEffectSideEffectLethalToTheUnsuspecting
---@field ctEmp EngineTagDataDamageEffectSideEffectEmp
Engine.tag.damageEffectSideEffect = {} 

---@class EngineTagDataDamageEffectCategoryEnum : Enum 

---@class EngineTagDataDamageEffectCategoryNone : EngineTagDataDamageEffectCategoryEnum 
---@class EngineTagDataDamageEffectCategoryFalling : EngineTagDataDamageEffectCategoryEnum 
---@class EngineTagDataDamageEffectCategoryBullet : EngineTagDataDamageEffectCategoryEnum 
---@class EngineTagDataDamageEffectCategoryGrenade : EngineTagDataDamageEffectCategoryEnum 
---@class EngineTagDataDamageEffectCategoryHighExplosive : EngineTagDataDamageEffectCategoryEnum 
---@class EngineTagDataDamageEffectCategorySniper : EngineTagDataDamageEffectCategoryEnum 
---@class EngineTagDataDamageEffectCategoryMelee : EngineTagDataDamageEffectCategoryEnum 
---@class EngineTagDataDamageEffectCategoryFlame : EngineTagDataDamageEffectCategoryEnum 
---@class EngineTagDataDamageEffectCategoryMountedWeapon : EngineTagDataDamageEffectCategoryEnum 
---@class EngineTagDataDamageEffectCategoryVehicle : EngineTagDataDamageEffectCategoryEnum 
---@class EngineTagDataDamageEffectCategoryPlasma : EngineTagDataDamageEffectCategoryEnum 
---@class EngineTagDataDamageEffectCategoryNeedle : EngineTagDataDamageEffectCategoryEnum 
---@class EngineTagDataDamageEffectCategoryShotgun : EngineTagDataDamageEffectCategoryEnum 

---@alias EngineTagDataDamageEffectCategory 
---| EngineTagDataDamageEffectCategoryNone
---| EngineTagDataDamageEffectCategoryFalling
---| EngineTagDataDamageEffectCategoryBullet
---| EngineTagDataDamageEffectCategoryGrenade
---| EngineTagDataDamageEffectCategoryHighExplosive
---| EngineTagDataDamageEffectCategorySniper
---| EngineTagDataDamageEffectCategoryMelee
---| EngineTagDataDamageEffectCategoryFlame
---| EngineTagDataDamageEffectCategoryMountedWeapon
---| EngineTagDataDamageEffectCategoryVehicle
---| EngineTagDataDamageEffectCategoryPlasma
---| EngineTagDataDamageEffectCategoryNeedle
---| EngineTagDataDamageEffectCategoryShotgun

---@class EngineTagDataDamageEffectCategoryTable 
---@field yNone EngineTagDataDamageEffectCategoryNone
---@field yFalling EngineTagDataDamageEffectCategoryFalling
---@field yBullet EngineTagDataDamageEffectCategoryBullet
---@field yGrenade EngineTagDataDamageEffectCategoryGrenade
---@field yHighExplosive EngineTagDataDamageEffectCategoryHighExplosive
---@field ySniper EngineTagDataDamageEffectCategorySniper
---@field yMelee EngineTagDataDamageEffectCategoryMelee
---@field yFlame EngineTagDataDamageEffectCategoryFlame
---@field yMountedWeapon EngineTagDataDamageEffectCategoryMountedWeapon
---@field yVehicle EngineTagDataDamageEffectCategoryVehicle
---@field yPlasma EngineTagDataDamageEffectCategoryPlasma
---@field yNeedle EngineTagDataDamageEffectCategoryNeedle
---@field yShotgun EngineTagDataDamageEffectCategoryShotgun
Engine.tag.damageEffectCategory = {} 

---@class MetaEngineTagDataDamageEffectDamageFlags 
---@field doesNotHurtOwner boolean 
---@field canCauseHeadshots boolean 
---@field pingsResistantUnits boolean 
---@field doesNotHurtFriends boolean 
---@field doesNotPingUnits boolean 
---@field detonatesExplosives boolean 
---@field onlyHurtsShields boolean 
---@field causesFlamingDeath boolean 
---@field damageIndicatorsAlwaysPointDown boolean 
---@field skipsShields boolean 
---@field onlyHurtsOneInfectionForm boolean 
---@field canCauseMultiplayerHeadshots boolean 
---@field infectionFormPop boolean 
---@field ignoreSeatScaleForDirDmg boolean 
---@field forcesHardPing boolean 
---@field doesNotHurtPlayers boolean 
---@field use_3dInstantaneousAcceleration boolean 
---@field allowAnyNonZeroAccelerationValue boolean 

---@class MetaEngineTagDataDamageEffectFlags 
---@field doNotScaleDamageByDistance boolean 

---@class MetaEngineTagDataDamageEffect 
---@field radius number 
---@field cutoffScale number 
---@field flags MetaEngineTagDataDamageEffectFlags 
---@field type EngineTagDataDamageEffectScreenFlashType 
---@field priority EngineTagDataDamageEffectScreenFlashPriority 
---@field duration number 
---@field fadeFunction EngineTagDataFunctionType 
---@field maximumIntensity number 
---@field color MetaEngineColorARGB 
---@field lowFrequencyVibrateFrequency number 
---@field lowFrequencyVibrateDuration number 
---@field lowFrequencyVibrateFadeFunction EngineTagDataFunctionType 
---@field highFrequencyVibrateFrequency number 
---@field highFrequencyVibrateDuration number 
---@field highFrequencyVibrateFadeFunction EngineTagDataFunctionType 
---@field temporaryCameraImpulseDuration number 
---@field temporaryCameraImpulseFadeFunction EngineTagDataFunctionType 
---@field temporaryCameraImpulseRotation MetaEngineAngle 
---@field temporaryCameraImpulsePushback number 
---@field jitter number 
---@field permanentCameraImpulseAngle MetaEngineAngle 
---@field cameraShakingDuration number 
---@field cameraShakingFalloffFunction EngineTagDataFunctionType 
---@field cameraShakingRandomTranslation number 
---@field cameraShakingRandomRotation MetaEngineAngle 
---@field cameraShakingWobbleFunction EngineTagDataWaveFunction 
---@field cameraShakingWobblePeriod number 
---@field cameraShakingWobbleWeight number 
---@field sound MetaEngineTagDependency 
---@field breakingEffectForwardVelocity number 
---@field breakingEffectForwardRadius number 
---@field breakingEffectForwardExponent number 
---@field breakingEffectOutwardVelocity number 
---@field breakingEffectOutwardRadius number 
---@field breakingEffectOutwardExponent number 
---@field damageSideEffect EngineTagDataDamageEffectSideEffect 
---@field damageCategory EngineTagDataDamageEffectCategory 
---@field damageFlags MetaEngineTagDataDamageEffectDamageFlags 
---@field damageAoeCoreRadius number 
---@field damageLowerBound number 
---@field damageUpperBound number 
---@field damageVehiclePassthroughPenalty number 
---@field damageActiveCamouflageDamage number 
---@field damageStun number 
---@field damageMaximumStun number 
---@field damageStunTime number 
---@field damageInstantaneousAcceleration MetaEngineVector3D 
---@field dirt number 
---@field sand number 
---@field stone number 
---@field snow number 
---@field wood number 
---@field metalHollow number 
---@field metalThin number 
---@field metalThick number 
---@field rubber number 
---@field glass number 
---@field forceField number 
---@field grunt number 
---@field hunterArmor number 
---@field hunterSkin number 
---@field elite number 
---@field jackal number 
---@field jackalEnergyShield number 
---@field engineerSkin number 
---@field engineerForceField number 
---@field floodCombatForm number 
---@field floodCarrierForm number 
---@field cyborgArmor number 
---@field cyborgEnergyShield number 
---@field humanArmor number 
---@field humanSkin number 
---@field sentinel number 
---@field monitor number 
---@field plastic number 
---@field water number 
---@field leaves number 
---@field eliteEnergyShield number 
---@field ice number 
---@field hunterShield number 

---@class MetaEngineTagDataSkyLightFlags 
---@field affectsExteriors boolean 
---@field affectsInteriors boolean 

---@class MetaEngineTagDataSkyFunction 
---@field functionName MetaEngineTagString 

---@class MetaEngineTagDataSkyAnimation 
---@field animationIndex integer 
---@field period number 

---@class MetaEngineTagDataSkyLight 
---@field lensFlare MetaEngineTagDependency 
---@field lensFlareMarkerName MetaEngineTagString 
---@field flags MetaEngineTagDataSkyLightFlags 
---@field color MetaEngineColorRGB 
---@field power number 
---@field testDistance number 
---@field direction MetaEngineEuler2D 
---@field diameter number 

---@class MetaEngineTagDataSky 
---@field model MetaEngineTagDependency 
---@field animationGraph MetaEngineTagDependency 
---@field indoorAmbientRadiosityColor MetaEngineColorRGB 
---@field indoorAmbientRadiosityPower number 
---@field outdoorAmbientRadiosityColor MetaEngineColorRGB 
---@field outdoorAmbientRadiosityPower number 
---@field outdoorFogColor MetaEngineColorRGB 
---@field outdoorFogMaximumDensity MetaEngineFraction 
---@field outdoorFogStartDistance number 
---@field outdoorFogOpaqueDistance number 
---@field indoorFogColor MetaEngineColorRGB 
---@field indoorFogMaximumDensity MetaEngineFraction 
---@field indoorFogStartDistance number 
---@field indoorFogOpaqueDistance number 
---@field indoorFogScreen MetaEngineTagDependency 
---@field shaderFunctions table<MetaEngineTagDataSkyFunction> 
---@field animations table<MetaEngineTagDataSkyAnimation> 
---@field lights table<MetaEngineTagDataSkyLight> 

---@class MetaEngineTagDataItemFlags 
---@field alwaysMaintainsZUp boolean 
---@field destroyedByExplosions boolean 
---@field unaffectedByGravity boolean 

---@class MetaEngineTagDataItem: MetaEngineTagDataObject  
---@field itemFlags MetaEngineTagDataItemFlags 
---@field pickupTextIndex MetaEngineIndex 
---@field sortOrder integer 
---@field scale number 
---@field hudMessageValueScale integer 
---@field itemAIn EngineTagDataObjectFunctionIn 
---@field itemBIn EngineTagDataObjectFunctionIn 
---@field itemCIn EngineTagDataObjectFunctionIn 
---@field itemDIn EngineTagDataObjectFunctionIn 
---@field materialEffects MetaEngineTagDependency 
---@field collisionSound MetaEngineTagDependency 
---@field detonationDelay number 
---@field detonatingEffect MetaEngineTagDependency 
---@field detonationEffect MetaEngineTagDependency 

---@class EngineTagDataProjectileResponseEnum : Enum 

---@class EngineTagDataProjectileResponseDisappear : EngineTagDataProjectileResponseEnum 
---@class EngineTagDataProjectileResponseDetonate : EngineTagDataProjectileResponseEnum 
---@class EngineTagDataProjectileResponseReflect : EngineTagDataProjectileResponseEnum 
---@class EngineTagDataProjectileResponseOverpenetrate : EngineTagDataProjectileResponseEnum 
---@class EngineTagDataProjectileResponseAttach : EngineTagDataProjectileResponseEnum 

---@alias EngineTagDataProjectileResponse 
---| EngineTagDataProjectileResponseDisappear
---| EngineTagDataProjectileResponseDetonate
---| EngineTagDataProjectileResponseReflect
---| EngineTagDataProjectileResponseOverpenetrate
---| EngineTagDataProjectileResponseAttach

---@class EngineTagDataProjectileResponseTable 
---@field disappear EngineTagDataProjectileResponseDisappear
---@field detonate EngineTagDataProjectileResponseDetonate
---@field reflect EngineTagDataProjectileResponseReflect
---@field overpenetrate EngineTagDataProjectileResponseOverpenetrate
---@field attach EngineTagDataProjectileResponseAttach
Engine.tag.projectileResponse = {} 

---@class EngineTagDataProjectileScaleEffectsByEnum : Enum 

---@class EngineTagDataProjectileScaleEffectsByDamage : EngineTagDataProjectileScaleEffectsByEnum 
---@class EngineTagDataProjectileScaleEffectsByAngle : EngineTagDataProjectileScaleEffectsByEnum 

---@alias EngineTagDataProjectileScaleEffectsBy 
---| EngineTagDataProjectileScaleEffectsByDamage
---| EngineTagDataProjectileScaleEffectsByAngle

---@class EngineTagDataProjectileScaleEffectsByTable 
---@field byDamage EngineTagDataProjectileScaleEffectsByDamage
---@field byAngle EngineTagDataProjectileScaleEffectsByAngle
Engine.tag.projectileScaleEffectsBy = {} 

---@class EngineTagDataProjectileDetonationTimerStartsEnum : Enum 

---@class EngineTagDataProjectileDetonationTimerStartsImmediately : EngineTagDataProjectileDetonationTimerStartsEnum 
---@class EngineTagDataProjectileDetonationTimerStartsAfterFirstBounce : EngineTagDataProjectileDetonationTimerStartsEnum 
---@class EngineTagDataProjectileDetonationTimerStartsWhenAtRest : EngineTagDataProjectileDetonationTimerStartsEnum 

---@alias EngineTagDataProjectileDetonationTimerStarts 
---| EngineTagDataProjectileDetonationTimerStartsImmediately
---| EngineTagDataProjectileDetonationTimerStartsAfterFirstBounce
---| EngineTagDataProjectileDetonationTimerStartsWhenAtRest

---@class EngineTagDataProjectileDetonationTimerStartsTable 
---@field tsImmediately EngineTagDataProjectileDetonationTimerStartsImmediately
---@field tsAfterFirstBounce EngineTagDataProjectileDetonationTimerStartsAfterFirstBounce
---@field tsWhenAtRest EngineTagDataProjectileDetonationTimerStartsWhenAtRest
Engine.tag.projectileDetonationTimerStarts = {} 

---@class EngineTagDataProjectileFunctionInEnum : Enum 

---@class EngineTagDataProjectileFunctionInNone : EngineTagDataProjectileFunctionInEnum 
---@class EngineTagDataProjectileFunctionInRangeRemaining : EngineTagDataProjectileFunctionInEnum 
---@class EngineTagDataProjectileFunctionInTimeRemaining : EngineTagDataProjectileFunctionInEnum 
---@class EngineTagDataProjectileFunctionInTracer : EngineTagDataProjectileFunctionInEnum 

---@alias EngineTagDataProjectileFunctionIn 
---| EngineTagDataProjectileFunctionInNone
---| EngineTagDataProjectileFunctionInRangeRemaining
---| EngineTagDataProjectileFunctionInTimeRemaining
---| EngineTagDataProjectileFunctionInTracer

---@class EngineTagDataProjectileFunctionInTable 
---@field nNone EngineTagDataProjectileFunctionInNone
---@field nRangeRemaining EngineTagDataProjectileFunctionInRangeRemaining
---@field nTimeRemaining EngineTagDataProjectileFunctionInTimeRemaining
---@field nTracer EngineTagDataProjectileFunctionInTracer
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
---@field projectileMaterialResponse table<MetaEngineTagDataProjectileMaterialResponse> 

---@class EngineTagDataWeatherParticleSystemRenderDirectionSourceEnum : Enum 

---@class EngineTagDataWeatherParticleSystemRenderDirectionSourceFromVelocity : EngineTagDataWeatherParticleSystemRenderDirectionSourceEnum 
---@class EngineTagDataWeatherParticleSystemRenderDirectionSourceFromAcceleration : EngineTagDataWeatherParticleSystemRenderDirectionSourceEnum 

---@alias EngineTagDataWeatherParticleSystemRenderDirectionSource 
---| EngineTagDataWeatherParticleSystemRenderDirectionSourceFromVelocity
---| EngineTagDataWeatherParticleSystemRenderDirectionSourceFromAcceleration

---@class EngineTagDataWeatherParticleSystemRenderDirectionSourceTable 
---@field urceFromVelocity EngineTagDataWeatherParticleSystemRenderDirectionSourceFromVelocity
---@field urceFromAcceleration EngineTagDataWeatherParticleSystemRenderDirectionSourceFromAcceleration
Engine.tag.weatherParticleSystemRenderDirectionSource = {} 

---@class MetaEngineTagDataWeatherParticleSystemParticleTypeFlags 
---@field interpolateColorsInHsv boolean 
---@field alongLongHuePath boolean 
---@field randomRotation boolean 

---@class MetaEngineTagDataWeatherParticleSystemParticleType 
---@field name MetaEngineTagString 
---@field flags MetaEngineTagDataWeatherParticleSystemParticleTypeFlags 
---@field fadeInStartDistance number 
---@field fadeInEndDistance number 
---@field fadeOutStartDistance number 
---@field fadeOutEndDistance number 
---@field fadeInStartHeight number 
---@field fadeInEndHeight number 
---@field fadeOutStartHeight number 
---@field fadeOutEndHeight number 
---@field particleCount number 
---@field physics MetaEngineTagDependency 
---@field accelerationMagnitude number 
---@field accelerationTurningRate MetaEngineFraction 
---@field accelerationChangeRate number 
---@field particleRadius number 
---@field animationRate number 
---@field rotationRate MetaEngineAngle 
---@field colorLowerBound MetaEngineColorARGB 
---@field colorUpperBound MetaEngineColorARGB 
---@field spriteSize number 
---@field spriteBitmap MetaEngineTagDependency 
---@field renderMode EngineTagDataParticleOrientation 
---@field renderDirectionSource EngineTagDataWeatherParticleSystemRenderDirectionSource 
---@field notBroken integer 
---@field shaderFlags MetaEngineTagDataParticleShaderFlags 
---@field framebufferBlendFunction EngineTagDataFramebufferBlendFunction 
---@field framebufferFadeMode EngineTagDataFramebufferFadeMode 
---@field mapFlags MetaEngineTagDataIsUnfilteredFlag 
---@field bitmap MetaEngineTagDependency 
---@field anchor EngineTagDataParticleAnchor 
---@field flags_1 MetaEngineTagDataIsUnfilteredFlag 
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
---@field rotationAnimationScale MetaEngineAngle 
---@field rotationAnimationCenter MetaEnginePoint2D 
---@field zspriteRadiusScale number 

---@class MetaEngineTagDataWeatherParticleSystem 
---@field flags MetaEngineTagDataIsUnusedFlag 
---@field particleTypes table<MetaEngineTagDataWeatherParticleSystemParticleType> 

---@class MetaEngineTagDataMaterialEffectsMaterialEffectMaterial 
---@field effect MetaEngineTagDependency 
---@field sound MetaEngineTagDependency 

---@class MetaEngineTagDataMaterialEffectsMaterialEffect 
---@field materials table<MetaEngineTagDataMaterialEffectsMaterialEffectMaterial> 

---@class MetaEngineTagDataMaterialEffects 
---@field effects table<MetaEngineTagDataMaterialEffectsMaterialEffect> 

---@class EngineTagDataUIGameDataInputReferenceFunctionEnum : Enum 

---@class EngineTagDataUIGameDataInputReferenceFunctionNull : EngineTagDataUIGameDataInputReferenceFunctionEnum 
---@class EngineTagDataUIGameDataInputReferenceFunctionPlayerSettingsMenuUpdateDesc : EngineTagDataUIGameDataInputReferenceFunctionEnum 
---@class EngineTagDataUIGameDataInputReferenceFunctionUnused : EngineTagDataUIGameDataInputReferenceFunctionEnum 
---@class EngineTagDataUIGameDataInputReferenceFunctionPlaylistSettingsMenuUpdateDesc : EngineTagDataUIGameDataInputReferenceFunctionEnum 
---@class EngineTagDataUIGameDataInputReferenceFunctionGametypeSelectMenuUpdateDesc : EngineTagDataUIGameDataInputReferenceFunctionEnum 
---@class EngineTagDataUIGameDataInputReferenceFunctionMultiplayerTypeMenuUpdateDesc : EngineTagDataUIGameDataInputReferenceFunctionEnum 
---@class EngineTagDataUIGameDataInputReferenceFunctionSoloLevelSelectUpdate : EngineTagDataUIGameDataInputReferenceFunctionEnum 
---@class EngineTagDataUIGameDataInputReferenceFunctionDifficultyMenuUpdateDesc : EngineTagDataUIGameDataInputReferenceFunctionEnum 
---@class EngineTagDataUIGameDataInputReferenceFunctionBuildNumberTextboxOnly : EngineTagDataUIGameDataInputReferenceFunctionEnum 
---@class EngineTagDataUIGameDataInputReferenceFunctionServerListUpdate : EngineTagDataUIGameDataInputReferenceFunctionEnum 
---@class EngineTagDataUIGameDataInputReferenceFunctionNetworkPregameStatusUpdate : EngineTagDataUIGameDataInputReferenceFunctionEnum 
---@class EngineTagDataUIGameDataInputReferenceFunctionSplitscreenPregameStatusUpdate : EngineTagDataUIGameDataInputReferenceFunctionEnum 
---@class EngineTagDataUIGameDataInputReferenceFunctionNetSplitscreenPrejoinPlayers : EngineTagDataUIGameDataInputReferenceFunctionEnum 
---@class EngineTagDataUIGameDataInputReferenceFunctionMpProfileListUpdate : EngineTagDataUIGameDataInputReferenceFunctionEnum 
---@class EngineTagDataUIGameDataInputReferenceFunction_3widePlayerProfileListUpdate : EngineTagDataUIGameDataInputReferenceFunctionEnum 
---@class EngineTagDataUIGameDataInputReferenceFunctionPlyrProfEditSelectMenuUpd8 : EngineTagDataUIGameDataInputReferenceFunctionEnum 
---@class EngineTagDataUIGameDataInputReferenceFunctionPlayerProfileSmallMenuUpdate : EngineTagDataUIGameDataInputReferenceFunctionEnum 
---@class EngineTagDataUIGameDataInputReferenceFunctionGameSettingsListsTextUpdate : EngineTagDataUIGameDataInputReferenceFunctionEnum 
---@class EngineTagDataUIGameDataInputReferenceFunctionSoloGameObjectiveText : EngineTagDataUIGameDataInputReferenceFunctionEnum 
---@class EngineTagDataUIGameDataInputReferenceFunctionColorPickerUpdate : EngineTagDataUIGameDataInputReferenceFunctionEnum 
---@class EngineTagDataUIGameDataInputReferenceFunctionGameSettingsListsPicUpdate : EngineTagDataUIGameDataInputReferenceFunctionEnum 
---@class EngineTagDataUIGameDataInputReferenceFunctionMainMenuFakeAnimate : EngineTagDataUIGameDataInputReferenceFunctionEnum 
---@class EngineTagDataUIGameDataInputReferenceFunctionMpLevelSelectUpdate : EngineTagDataUIGameDataInputReferenceFunctionEnum 
---@class EngineTagDataUIGameDataInputReferenceFunctionGetActivePlyrProfileName : EngineTagDataUIGameDataInputReferenceFunctionEnum 
---@class EngineTagDataUIGameDataInputReferenceFunctionGetEditPlyrProfileName : EngineTagDataUIGameDataInputReferenceFunctionEnum 
---@class EngineTagDataUIGameDataInputReferenceFunctionGetEditGameSettingsName : EngineTagDataUIGameDataInputReferenceFunctionEnum 
---@class EngineTagDataUIGameDataInputReferenceFunctionGetActivePlyrProfileColor : EngineTagDataUIGameDataInputReferenceFunctionEnum 
---@class EngineTagDataUIGameDataInputReferenceFunctionMpSetTextboxMapName : EngineTagDataUIGameDataInputReferenceFunctionEnum 
---@class EngineTagDataUIGameDataInputReferenceFunctionMpSetTextboxGameRuleset : EngineTagDataUIGameDataInputReferenceFunctionEnum 
---@class EngineTagDataUIGameDataInputReferenceFunctionMpSetTextboxTeamsNoteams : EngineTagDataUIGameDataInputReferenceFunctionEnum 
---@class EngineTagDataUIGameDataInputReferenceFunctionMpSetTextboxScoreLimit : EngineTagDataUIGameDataInputReferenceFunctionEnum 
---@class EngineTagDataUIGameDataInputReferenceFunctionMpSetTextboxScoreLimitType : EngineTagDataUIGameDataInputReferenceFunctionEnum 
---@class EngineTagDataUIGameDataInputReferenceFunctionMpSetBitmapForMap : EngineTagDataUIGameDataInputReferenceFunctionEnum 
---@class EngineTagDataUIGameDataInputReferenceFunctionMpSetBitmapForRuleset : EngineTagDataUIGameDataInputReferenceFunctionEnum 
---@class EngineTagDataUIGameDataInputReferenceFunctionMpSetTextbox : EngineTagDataUIGameDataInputReferenceFunctionEnum 
---@class EngineTagDataUIGameDataInputReferenceFunctionMpEditProfileSetRuleText : EngineTagDataUIGameDataInputReferenceFunctionEnum 
---@class EngineTagDataUIGameDataInputReferenceFunctionSystemLinkStatusCheck : EngineTagDataUIGameDataInputReferenceFunctionEnum 
---@class EngineTagDataUIGameDataInputReferenceFunctionMpGameDirections : EngineTagDataUIGameDataInputReferenceFunctionEnum 
---@class EngineTagDataUIGameDataInputReferenceFunctionTeamsNoTeamsBitmapUpdate : EngineTagDataUIGameDataInputReferenceFunctionEnum 
---@class EngineTagDataUIGameDataInputReferenceFunctionWarnIfDiffWillNukeSavedGame : EngineTagDataUIGameDataInputReferenceFunctionEnum 
---@class EngineTagDataUIGameDataInputReferenceFunctionDimIfNoNetCable : EngineTagDataUIGameDataInputReferenceFunctionEnum 
---@class EngineTagDataUIGameDataInputReferenceFunctionPauseGameSetTextboxInverted : EngineTagDataUIGameDataInputReferenceFunctionEnum 
---@class EngineTagDataUIGameDataInputReferenceFunctionDimUnlessTwoControllers : EngineTagDataUIGameDataInputReferenceFunctionEnum 
---@class EngineTagDataUIGameDataInputReferenceFunctionControlsUpdateMenu : EngineTagDataUIGameDataInputReferenceFunctionEnum 
---@class EngineTagDataUIGameDataInputReferenceFunctionVideoMenuUpdate : EngineTagDataUIGameDataInputReferenceFunctionEnum 
---@class EngineTagDataUIGameDataInputReferenceFunctionGamespyScreenUpdate : EngineTagDataUIGameDataInputReferenceFunctionEnum 
---@class EngineTagDataUIGameDataInputReferenceFunctionCommonButtonBarUpdate : EngineTagDataUIGameDataInputReferenceFunctionEnum 
---@class EngineTagDataUIGameDataInputReferenceFunctionGamepadUpdateMenu : EngineTagDataUIGameDataInputReferenceFunctionEnum 
---@class EngineTagDataUIGameDataInputReferenceFunctionServerSettingsUpdate : EngineTagDataUIGameDataInputReferenceFunctionEnum 
---@class EngineTagDataUIGameDataInputReferenceFunctionAudioMenuUpdate : EngineTagDataUIGameDataInputReferenceFunctionEnum 
---@class EngineTagDataUIGameDataInputReferenceFunctionMpProfVehiclesUpdate : EngineTagDataUIGameDataInputReferenceFunctionEnum 
---@class EngineTagDataUIGameDataInputReferenceFunctionSoloMapListUpdate : EngineTagDataUIGameDataInputReferenceFunctionEnum 
---@class EngineTagDataUIGameDataInputReferenceFunctionMpMapListUpdate : EngineTagDataUIGameDataInputReferenceFunctionEnum 
---@class EngineTagDataUIGameDataInputReferenceFunctionGtSelectListUpdate : EngineTagDataUIGameDataInputReferenceFunctionEnum 
---@class EngineTagDataUIGameDataInputReferenceFunctionGtEditListUpdate : EngineTagDataUIGameDataInputReferenceFunctionEnum 
---@class EngineTagDataUIGameDataInputReferenceFunctionLoadGameListUpdate : EngineTagDataUIGameDataInputReferenceFunctionEnum 
---@class EngineTagDataUIGameDataInputReferenceFunctionCheckingForUpdates : EngineTagDataUIGameDataInputReferenceFunctionEnum 
---@class EngineTagDataUIGameDataInputReferenceFunctionDirectIpConnectUpdate : EngineTagDataUIGameDataInputReferenceFunctionEnum 
---@class EngineTagDataUIGameDataInputReferenceFunctionNetworkSettingsUpdate : EngineTagDataUIGameDataInputReferenceFunctionEnum 

---@alias EngineTagDataUIGameDataInputReferenceFunction 
---| EngineTagDataUIGameDataInputReferenceFunctionNull
---| EngineTagDataUIGameDataInputReferenceFunctionPlayerSettingsMenuUpdateDesc
---| EngineTagDataUIGameDataInputReferenceFunctionUnused
---| EngineTagDataUIGameDataInputReferenceFunctionPlaylistSettingsMenuUpdateDesc
---| EngineTagDataUIGameDataInputReferenceFunctionGametypeSelectMenuUpdateDesc
---| EngineTagDataUIGameDataInputReferenceFunctionMultiplayerTypeMenuUpdateDesc
---| EngineTagDataUIGameDataInputReferenceFunctionSoloLevelSelectUpdate
---| EngineTagDataUIGameDataInputReferenceFunctionDifficultyMenuUpdateDesc
---| EngineTagDataUIGameDataInputReferenceFunctionBuildNumberTextboxOnly
---| EngineTagDataUIGameDataInputReferenceFunctionServerListUpdate
---| EngineTagDataUIGameDataInputReferenceFunctionNetworkPregameStatusUpdate
---| EngineTagDataUIGameDataInputReferenceFunctionSplitscreenPregameStatusUpdate
---| EngineTagDataUIGameDataInputReferenceFunctionNetSplitscreenPrejoinPlayers
---| EngineTagDataUIGameDataInputReferenceFunctionMpProfileListUpdate
---| EngineTagDataUIGameDataInputReferenceFunction_3widePlayerProfileListUpdate
---| EngineTagDataUIGameDataInputReferenceFunctionPlyrProfEditSelectMenuUpd8
---| EngineTagDataUIGameDataInputReferenceFunctionPlayerProfileSmallMenuUpdate
---| EngineTagDataUIGameDataInputReferenceFunctionGameSettingsListsTextUpdate
---| EngineTagDataUIGameDataInputReferenceFunctionSoloGameObjectiveText
---| EngineTagDataUIGameDataInputReferenceFunctionColorPickerUpdate
---| EngineTagDataUIGameDataInputReferenceFunctionGameSettingsListsPicUpdate
---| EngineTagDataUIGameDataInputReferenceFunctionMainMenuFakeAnimate
---| EngineTagDataUIGameDataInputReferenceFunctionMpLevelSelectUpdate
---| EngineTagDataUIGameDataInputReferenceFunctionGetActivePlyrProfileName
---| EngineTagDataUIGameDataInputReferenceFunctionGetEditPlyrProfileName
---| EngineTagDataUIGameDataInputReferenceFunctionGetEditGameSettingsName
---| EngineTagDataUIGameDataInputReferenceFunctionGetActivePlyrProfileColor
---| EngineTagDataUIGameDataInputReferenceFunctionMpSetTextboxMapName
---| EngineTagDataUIGameDataInputReferenceFunctionMpSetTextboxGameRuleset
---| EngineTagDataUIGameDataInputReferenceFunctionMpSetTextboxTeamsNoteams
---| EngineTagDataUIGameDataInputReferenceFunctionMpSetTextboxScoreLimit
---| EngineTagDataUIGameDataInputReferenceFunctionMpSetTextboxScoreLimitType
---| EngineTagDataUIGameDataInputReferenceFunctionMpSetBitmapForMap
---| EngineTagDataUIGameDataInputReferenceFunctionMpSetBitmapForRuleset
---| EngineTagDataUIGameDataInputReferenceFunctionMpSetTextbox
---| EngineTagDataUIGameDataInputReferenceFunctionMpEditProfileSetRuleText
---| EngineTagDataUIGameDataInputReferenceFunctionSystemLinkStatusCheck
---| EngineTagDataUIGameDataInputReferenceFunctionMpGameDirections
---| EngineTagDataUIGameDataInputReferenceFunctionTeamsNoTeamsBitmapUpdate
---| EngineTagDataUIGameDataInputReferenceFunctionWarnIfDiffWillNukeSavedGame
---| EngineTagDataUIGameDataInputReferenceFunctionDimIfNoNetCable
---| EngineTagDataUIGameDataInputReferenceFunctionPauseGameSetTextboxInverted
---| EngineTagDataUIGameDataInputReferenceFunctionDimUnlessTwoControllers
---| EngineTagDataUIGameDataInputReferenceFunctionControlsUpdateMenu
---| EngineTagDataUIGameDataInputReferenceFunctionVideoMenuUpdate
---| EngineTagDataUIGameDataInputReferenceFunctionGamespyScreenUpdate
---| EngineTagDataUIGameDataInputReferenceFunctionCommonButtonBarUpdate
---| EngineTagDataUIGameDataInputReferenceFunctionGamepadUpdateMenu
---| EngineTagDataUIGameDataInputReferenceFunctionServerSettingsUpdate
---| EngineTagDataUIGameDataInputReferenceFunctionAudioMenuUpdate
---| EngineTagDataUIGameDataInputReferenceFunctionMpProfVehiclesUpdate
---| EngineTagDataUIGameDataInputReferenceFunctionSoloMapListUpdate
---| EngineTagDataUIGameDataInputReferenceFunctionMpMapListUpdate
---| EngineTagDataUIGameDataInputReferenceFunctionGtSelectListUpdate
---| EngineTagDataUIGameDataInputReferenceFunctionGtEditListUpdate
---| EngineTagDataUIGameDataInputReferenceFunctionLoadGameListUpdate
---| EngineTagDataUIGameDataInputReferenceFunctionCheckingForUpdates
---| EngineTagDataUIGameDataInputReferenceFunctionDirectIpConnectUpdate
---| EngineTagDataUIGameDataInputReferenceFunctionNetworkSettingsUpdate

---@class EngineTagDataUIGameDataInputReferenceFunctionTable 
---@field ctionNull EngineTagDataUIGameDataInputReferenceFunctionNull
---@field ctionPlayerSettingsMenuUpdateDesc EngineTagDataUIGameDataInputReferenceFunctionPlayerSettingsMenuUpdateDesc
---@field ctionUnused EngineTagDataUIGameDataInputReferenceFunctionUnused
---@field ctionPlaylistSettingsMenuUpdateDesc EngineTagDataUIGameDataInputReferenceFunctionPlaylistSettingsMenuUpdateDesc
---@field ctionGametypeSelectMenuUpdateDesc EngineTagDataUIGameDataInputReferenceFunctionGametypeSelectMenuUpdateDesc
---@field ctionMultiplayerTypeMenuUpdateDesc EngineTagDataUIGameDataInputReferenceFunctionMultiplayerTypeMenuUpdateDesc
---@field ctionSoloLevelSelectUpdate EngineTagDataUIGameDataInputReferenceFunctionSoloLevelSelectUpdate
---@field ctionDifficultyMenuUpdateDesc EngineTagDataUIGameDataInputReferenceFunctionDifficultyMenuUpdateDesc
---@field ctionBuildNumberTextboxOnly EngineTagDataUIGameDataInputReferenceFunctionBuildNumberTextboxOnly
---@field ctionServerListUpdate EngineTagDataUIGameDataInputReferenceFunctionServerListUpdate
---@field ctionNetworkPregameStatusUpdate EngineTagDataUIGameDataInputReferenceFunctionNetworkPregameStatusUpdate
---@field ctionSplitscreenPregameStatusUpdate EngineTagDataUIGameDataInputReferenceFunctionSplitscreenPregameStatusUpdate
---@field ctionNetSplitscreenPrejoinPlayers EngineTagDataUIGameDataInputReferenceFunctionNetSplitscreenPrejoinPlayers
---@field ctionMpProfileListUpdate EngineTagDataUIGameDataInputReferenceFunctionMpProfileListUpdate
---@field ction_3widePlayerProfileListUpdate EngineTagDataUIGameDataInputReferenceFunction_3widePlayerProfileListUpdate
---@field ctionPlyrProfEditSelectMenuUpd8 EngineTagDataUIGameDataInputReferenceFunctionPlyrProfEditSelectMenuUpd8
---@field ctionPlayerProfileSmallMenuUpdate EngineTagDataUIGameDataInputReferenceFunctionPlayerProfileSmallMenuUpdate
---@field ctionGameSettingsListsTextUpdate EngineTagDataUIGameDataInputReferenceFunctionGameSettingsListsTextUpdate
---@field ctionSoloGameObjectiveText EngineTagDataUIGameDataInputReferenceFunctionSoloGameObjectiveText
---@field ctionColorPickerUpdate EngineTagDataUIGameDataInputReferenceFunctionColorPickerUpdate
---@field ctionGameSettingsListsPicUpdate EngineTagDataUIGameDataInputReferenceFunctionGameSettingsListsPicUpdate
---@field ctionMainMenuFakeAnimate EngineTagDataUIGameDataInputReferenceFunctionMainMenuFakeAnimate
---@field ctionMpLevelSelectUpdate EngineTagDataUIGameDataInputReferenceFunctionMpLevelSelectUpdate
---@field ctionGetActivePlyrProfileName EngineTagDataUIGameDataInputReferenceFunctionGetActivePlyrProfileName
---@field ctionGetEditPlyrProfileName EngineTagDataUIGameDataInputReferenceFunctionGetEditPlyrProfileName
---@field ctionGetEditGameSettingsName EngineTagDataUIGameDataInputReferenceFunctionGetEditGameSettingsName
---@field ctionGetActivePlyrProfileColor EngineTagDataUIGameDataInputReferenceFunctionGetActivePlyrProfileColor
---@field ctionMpSetTextboxMapName EngineTagDataUIGameDataInputReferenceFunctionMpSetTextboxMapName
---@field ctionMpSetTextboxGameRuleset EngineTagDataUIGameDataInputReferenceFunctionMpSetTextboxGameRuleset
---@field ctionMpSetTextboxTeamsNoteams EngineTagDataUIGameDataInputReferenceFunctionMpSetTextboxTeamsNoteams
---@field ctionMpSetTextboxScoreLimit EngineTagDataUIGameDataInputReferenceFunctionMpSetTextboxScoreLimit
---@field ctionMpSetTextboxScoreLimitType EngineTagDataUIGameDataInputReferenceFunctionMpSetTextboxScoreLimitType
---@field ctionMpSetBitmapForMap EngineTagDataUIGameDataInputReferenceFunctionMpSetBitmapForMap
---@field ctionMpSetBitmapForRuleset EngineTagDataUIGameDataInputReferenceFunctionMpSetBitmapForRuleset
---@field ctionMpSetTextbox EngineTagDataUIGameDataInputReferenceFunctionMpSetTextbox
---@field ctionMpEditProfileSetRuleText EngineTagDataUIGameDataInputReferenceFunctionMpEditProfileSetRuleText
---@field ctionSystemLinkStatusCheck EngineTagDataUIGameDataInputReferenceFunctionSystemLinkStatusCheck
---@field ctionMpGameDirections EngineTagDataUIGameDataInputReferenceFunctionMpGameDirections
---@field ctionTeamsNoTeamsBitmapUpdate EngineTagDataUIGameDataInputReferenceFunctionTeamsNoTeamsBitmapUpdate
---@field ctionWarnIfDiffWillNukeSavedGame EngineTagDataUIGameDataInputReferenceFunctionWarnIfDiffWillNukeSavedGame
---@field ctionDimIfNoNetCable EngineTagDataUIGameDataInputReferenceFunctionDimIfNoNetCable
---@field ctionPauseGameSetTextboxInverted EngineTagDataUIGameDataInputReferenceFunctionPauseGameSetTextboxInverted
---@field ctionDimUnlessTwoControllers EngineTagDataUIGameDataInputReferenceFunctionDimUnlessTwoControllers
---@field ctionControlsUpdateMenu EngineTagDataUIGameDataInputReferenceFunctionControlsUpdateMenu
---@field ctionVideoMenuUpdate EngineTagDataUIGameDataInputReferenceFunctionVideoMenuUpdate
---@field ctionGamespyScreenUpdate EngineTagDataUIGameDataInputReferenceFunctionGamespyScreenUpdate
---@field ctionCommonButtonBarUpdate EngineTagDataUIGameDataInputReferenceFunctionCommonButtonBarUpdate
---@field ctionGamepadUpdateMenu EngineTagDataUIGameDataInputReferenceFunctionGamepadUpdateMenu
---@field ctionServerSettingsUpdate EngineTagDataUIGameDataInputReferenceFunctionServerSettingsUpdate
---@field ctionAudioMenuUpdate EngineTagDataUIGameDataInputReferenceFunctionAudioMenuUpdate
---@field ctionMpProfVehiclesUpdate EngineTagDataUIGameDataInputReferenceFunctionMpProfVehiclesUpdate
---@field ctionSoloMapListUpdate EngineTagDataUIGameDataInputReferenceFunctionSoloMapListUpdate
---@field ctionMpMapListUpdate EngineTagDataUIGameDataInputReferenceFunctionMpMapListUpdate
---@field ctionGtSelectListUpdate EngineTagDataUIGameDataInputReferenceFunctionGtSelectListUpdate
---@field ctionGtEditListUpdate EngineTagDataUIGameDataInputReferenceFunctionGtEditListUpdate
---@field ctionLoadGameListUpdate EngineTagDataUIGameDataInputReferenceFunctionLoadGameListUpdate
---@field ctionCheckingForUpdates EngineTagDataUIGameDataInputReferenceFunctionCheckingForUpdates
---@field ctionDirectIpConnectUpdate EngineTagDataUIGameDataInputReferenceFunctionDirectIpConnectUpdate
---@field ctionNetworkSettingsUpdate EngineTagDataUIGameDataInputReferenceFunctionNetworkSettingsUpdate
Engine.tag.uIGameDataInputReferenceFunction = {} 

---@class EngineTagDataUIEventTypeEnum : Enum 

---@class EngineTagDataUIEventTypeAButton : EngineTagDataUIEventTypeEnum 
---@class EngineTagDataUIEventTypeBButton : EngineTagDataUIEventTypeEnum 
---@class EngineTagDataUIEventTypeXButton : EngineTagDataUIEventTypeEnum 
---@class EngineTagDataUIEventTypeYButton : EngineTagDataUIEventTypeEnum 
---@class EngineTagDataUIEventTypeBlackButton : EngineTagDataUIEventTypeEnum 
---@class EngineTagDataUIEventTypeWhiteButton : EngineTagDataUIEventTypeEnum 
---@class EngineTagDataUIEventTypeLeftTrigger : EngineTagDataUIEventTypeEnum 
---@class EngineTagDataUIEventTypeRightTrigger : EngineTagDataUIEventTypeEnum 
---@class EngineTagDataUIEventTypeDpadUp : EngineTagDataUIEventTypeEnum 
---@class EngineTagDataUIEventTypeDpadDown : EngineTagDataUIEventTypeEnum 
---@class EngineTagDataUIEventTypeDpadLeft : EngineTagDataUIEventTypeEnum 
---@class EngineTagDataUIEventTypeDpadRight : EngineTagDataUIEventTypeEnum 
---@class EngineTagDataUIEventTypeStartButton : EngineTagDataUIEventTypeEnum 
---@class EngineTagDataUIEventTypeBackButton : EngineTagDataUIEventTypeEnum 
---@class EngineTagDataUIEventTypeLeftThumb : EngineTagDataUIEventTypeEnum 
---@class EngineTagDataUIEventTypeRightThumb : EngineTagDataUIEventTypeEnum 
---@class EngineTagDataUIEventTypeLeftAnalogStickUp : EngineTagDataUIEventTypeEnum 
---@class EngineTagDataUIEventTypeLeftAnalogStickDown : EngineTagDataUIEventTypeEnum 
---@class EngineTagDataUIEventTypeLeftAnalogStickLeft : EngineTagDataUIEventTypeEnum 
---@class EngineTagDataUIEventTypeLeftAnalogStickRight : EngineTagDataUIEventTypeEnum 
---@class EngineTagDataUIEventTypeLeftAnalogStickUp_1 : EngineTagDataUIEventTypeEnum 
---@class EngineTagDataUIEventTypeRightAnalogStickDown : EngineTagDataUIEventTypeEnum 
---@class EngineTagDataUIEventTypeRightAnalogStickLeft : EngineTagDataUIEventTypeEnum 
---@class EngineTagDataUIEventTypeRightAnalogStickRight : EngineTagDataUIEventTypeEnum 
---@class EngineTagDataUIEventTypeCreated : EngineTagDataUIEventTypeEnum 
---@class EngineTagDataUIEventTypeDeleted : EngineTagDataUIEventTypeEnum 
---@class EngineTagDataUIEventTypeGetFocus : EngineTagDataUIEventTypeEnum 
---@class EngineTagDataUIEventTypeLoseFocus : EngineTagDataUIEventTypeEnum 
---@class EngineTagDataUIEventTypeLeftMouse : EngineTagDataUIEventTypeEnum 
---@class EngineTagDataUIEventTypeMiddleMouse : EngineTagDataUIEventTypeEnum 
---@class EngineTagDataUIEventTypeRightMouse : EngineTagDataUIEventTypeEnum 
---@class EngineTagDataUIEventTypeDoubleClick : EngineTagDataUIEventTypeEnum 
---@class EngineTagDataUIEventTypeCustomActivation : EngineTagDataUIEventTypeEnum 
---@class EngineTagDataUIEventTypePostRender : EngineTagDataUIEventTypeEnum 

---@alias EngineTagDataUIEventType 
---| EngineTagDataUIEventTypeAButton
---| EngineTagDataUIEventTypeBButton
---| EngineTagDataUIEventTypeXButton
---| EngineTagDataUIEventTypeYButton
---| EngineTagDataUIEventTypeBlackButton
---| EngineTagDataUIEventTypeWhiteButton
---| EngineTagDataUIEventTypeLeftTrigger
---| EngineTagDataUIEventTypeRightTrigger
---| EngineTagDataUIEventTypeDpadUp
---| EngineTagDataUIEventTypeDpadDown
---| EngineTagDataUIEventTypeDpadLeft
---| EngineTagDataUIEventTypeDpadRight
---| EngineTagDataUIEventTypeStartButton
---| EngineTagDataUIEventTypeBackButton
---| EngineTagDataUIEventTypeLeftThumb
---| EngineTagDataUIEventTypeRightThumb
---| EngineTagDataUIEventTypeLeftAnalogStickUp
---| EngineTagDataUIEventTypeLeftAnalogStickDown
---| EngineTagDataUIEventTypeLeftAnalogStickLeft
---| EngineTagDataUIEventTypeLeftAnalogStickRight
---| EngineTagDataUIEventTypeLeftAnalogStickUp_1
---| EngineTagDataUIEventTypeRightAnalogStickDown
---| EngineTagDataUIEventTypeRightAnalogStickLeft
---| EngineTagDataUIEventTypeRightAnalogStickRight
---| EngineTagDataUIEventTypeCreated
---| EngineTagDataUIEventTypeDeleted
---| EngineTagDataUIEventTypeGetFocus
---| EngineTagDataUIEventTypeLoseFocus
---| EngineTagDataUIEventTypeLeftMouse
---| EngineTagDataUIEventTypeMiddleMouse
---| EngineTagDataUIEventTypeRightMouse
---| EngineTagDataUIEventTypeDoubleClick
---| EngineTagDataUIEventTypeCustomActivation
---| EngineTagDataUIEventTypePostRender

---@class EngineTagDataUIEventTypeTable 
---@field peAButton EngineTagDataUIEventTypeAButton
---@field peBButton EngineTagDataUIEventTypeBButton
---@field peXButton EngineTagDataUIEventTypeXButton
---@field peYButton EngineTagDataUIEventTypeYButton
---@field peBlackButton EngineTagDataUIEventTypeBlackButton
---@field peWhiteButton EngineTagDataUIEventTypeWhiteButton
---@field peLeftTrigger EngineTagDataUIEventTypeLeftTrigger
---@field peRightTrigger EngineTagDataUIEventTypeRightTrigger
---@field peDpadUp EngineTagDataUIEventTypeDpadUp
---@field peDpadDown EngineTagDataUIEventTypeDpadDown
---@field peDpadLeft EngineTagDataUIEventTypeDpadLeft
---@field peDpadRight EngineTagDataUIEventTypeDpadRight
---@field peStartButton EngineTagDataUIEventTypeStartButton
---@field peBackButton EngineTagDataUIEventTypeBackButton
---@field peLeftThumb EngineTagDataUIEventTypeLeftThumb
---@field peRightThumb EngineTagDataUIEventTypeRightThumb
---@field peLeftAnalogStickUp EngineTagDataUIEventTypeLeftAnalogStickUp
---@field peLeftAnalogStickDown EngineTagDataUIEventTypeLeftAnalogStickDown
---@field peLeftAnalogStickLeft EngineTagDataUIEventTypeLeftAnalogStickLeft
---@field peLeftAnalogStickRight EngineTagDataUIEventTypeLeftAnalogStickRight
---@field peLeftAnalogStickUp_1 EngineTagDataUIEventTypeLeftAnalogStickUp_1
---@field peRightAnalogStickDown EngineTagDataUIEventTypeRightAnalogStickDown
---@field peRightAnalogStickLeft EngineTagDataUIEventTypeRightAnalogStickLeft
---@field peRightAnalogStickRight EngineTagDataUIEventTypeRightAnalogStickRight
---@field peCreated EngineTagDataUIEventTypeCreated
---@field peDeleted EngineTagDataUIEventTypeDeleted
---@field peGetFocus EngineTagDataUIEventTypeGetFocus
---@field peLoseFocus EngineTagDataUIEventTypeLoseFocus
---@field peLeftMouse EngineTagDataUIEventTypeLeftMouse
---@field peMiddleMouse EngineTagDataUIEventTypeMiddleMouse
---@field peRightMouse EngineTagDataUIEventTypeRightMouse
---@field peDoubleClick EngineTagDataUIEventTypeDoubleClick
---@field peCustomActivation EngineTagDataUIEventTypeCustomActivation
---@field pePostRender EngineTagDataUIEventTypePostRender
Engine.tag.uIEventType = {} 

---@class EngineTagDataUIEventHandlerReferenceFunctionEnum : Enum 

---@class EngineTagDataUIEventHandlerReferenceFunctionNull : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionListGotoNextItem : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionListGotoPreviousItem : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionUnused : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionUnused1 : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionInitializeSpLevelListSolo : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionInitializeSpLevelListCoop : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionDisposeSpLevelList : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionSoloLevelSetMap : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionSetDifficulty : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionStartNewGame : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionPauseGameRestartAtCheckpoint : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionPauseGameRestartLevel : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionPauseGameReturnToMainMenu : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionClearMultiplayerPlayerJoins : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionJoinControllerToMpGame : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionInitializeNetGameServerList : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionStartNetworkGameServer : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionDisposeNetGameServerList : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionShutdownNetworkGame : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionNetGameJoinFromServerList : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionSplitScreenGameInitialize : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionCoopGameInitialize : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionMainMenuIntialize : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionMpTypeMenuInitialize : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionPickPlayStageForQuickStart : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionMpLevelListInitialize : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionMpLevelListDispose : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionMpLevelSelect : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionMpProfilesListInitialize : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionMpProfilesListDispose : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionMpProfileSetForGame : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionSwapPlayerTeam : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionNetGameJoinPlayer : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionPlayerProfileListInitialize : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionPlayerProfileListDispose : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunction_3widePlyrProfSetForGame : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunction_1widePlyrProfSetForGame : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionMpProfileBeginEditing : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionMpProfileEndEditing : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionMpProfileSetGameEngine : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionMpProfileChangeName : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionMpProfileSetCtfRules : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionMpProfileSetKothRules : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionMpProfileSetSlayerRules : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionMpProfileSetOddballRules : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionMpProfileSetRacingRules : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionMpProfileSetPlayerOptions : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionMpProfileSetItemOptions : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionMpProfileSetIndicatorOpts : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionMpProfileInitGameEngine : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionMpProfileInitName : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionMpProfileInitCtfRules : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionMpProfileInitKothRules : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionMpProfileInitSlayerRules : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionMpProfileInitOddballRules : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionMpProfileInitRacingRules : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionMpProfileInitPlayerOpts : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionMpProfileInitItemOptions : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionMpProfileInitIndicatorOpts : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionMpProfileSaveChanges : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionColorPickerMenuInitialize : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionColorPickerMenuDispose : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionColorPickerSelectColor : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionPlayerProfileBeginEditing : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionPlayerProfileEndEditing : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionPlayerProfileChangeName : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionPlayerProfileSaveChanges : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionPlyrPrfInitCntlSettings : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionPlyrPrfInitAdvCntlSet : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionPlyrPrfSaveCntlSettings : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionPlyrPrfSaveAdvCntlSet : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionMpGamePlayerQuit : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionMainMenuSwitchToSoloGame : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionRequestDelPlayerProfile : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionRequestDelPlaylistProfile : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionFinalDelPlayerProfile : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionFinalDelPlaylistProfile : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionCancelProfileDelete : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionCreateEditPlaylistProfile : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionCreateEditPlayerProfile : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionNetGameSpeedStart : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionNetGameDelayStart : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionNetServerAcceptConx : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionNetServerDeferStart : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionNetServerAllowStart : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionDisableIfNoXdemos : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionRunXdemos : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionSpResetControllerChoices : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionSpSetP1ControllerChoice : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionSpSetP2ControllerChoice : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionErrorIfNoNetworkConnection : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionStartServerIfNoneAdvertised : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionNetGameUnjoinPlayer : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionCloseIfNotEditingProfile : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionExitToXboxDashboard : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionNewCampaignChosen : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionNewCampaignDecision : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionPopHistoryStackOnce : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionDifficultyMenuInit : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionBeginMusicFadeOut : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionNewGameIfNoPlyrProfiles : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionExitGracefullyToXboxDashboard : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionPauseGameInvertPitch : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionStartNewCoopGame : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionPauseGameInvertSpinnerGet : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionPauseGameInvertSpinnerSet : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionMainMenuQuitGame : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionMouseEmitAcceptEvent : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionMouseEmitBackEvent : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionMouseEmitDpadLeftEvent : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionMouseEmitDpadRightEvent : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionMouseSpinner_3wideClick : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionControlsScreenInit : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionVideoScreenInit : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionControlsBeginBinding : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionGamespyScreenInit : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionGamespyScreenDispose : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionGamespySelectHeader : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionGamespySelectItem : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionGamespySelectButton : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionPlrProfInitMouseSet : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionPlrProfChangeMouseSet : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionPlrProfInitAudioSet : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionPlrProfChangeAudioSet : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionPlrProfChangeVideoSet : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionControlsScreenDispose : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionControlsScreenChangeSet : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionMouseEmitXEvent : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionGamepadScreenInit : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionGamepadScreenDispose : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionGamepadScreenChangeGamepads : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionGamepadScreenSelectItem : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionMouseScreenDefaults : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionAudioScreenDefaults : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionVideoScreenDefaults : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionControlsScreenDefaults : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionProfileSetEditBegin : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionProfileManagerDelete : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionProfileManagerSelect : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionGamespyDismissError : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionServerSettingsInit : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionSsEditServerName : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionSsEditServerPassword : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionSsStartGame : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionVideoTestDialogInit : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionVideoTestDialogDispose : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionVideoTestDialogAccept : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionGamespyDismissFilters : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionGamespyUpdateFilterSettings : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionGamespyBackHandler : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionMouseSpinner_1wideClick : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionControlsBackHandler : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionControlsAdvancedLaunch : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionControlsAdvancedOk : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionMpPauseMenuOpen : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionMpGameOptionsOpen : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionMpChooseTeam : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionMpProfInitVehicleOptions : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionMpProfSaveVehicleOptions : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionSinglePrevClItemActivated : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionMpProfInitTeamplayOptions : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionMpProfSaveTeamplayOptions : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionMpGameOptionsChoose : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionEmitCustomActivationEvent : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionPlrProfCancelAudioSet : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionPlrProfInitNetworkOptions : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionPlrProfSaveNetworkOptions : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionCreditsPostRender : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionDifficultyItemSelect : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionCreditsInitialize : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionCreditsDispose : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionGamespyGetPatch : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionVideoScreenDispose : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionCampaignMenuInit : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionCampaignMenuContinue : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionLoadGameMenuInit : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionLoadGameMenuDispose : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionLoadGameMenuActivated : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionSoloMenuSaveCheckpoint : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionMpTypeSetMode : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionCheckingForUpdatesOk : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionCheckingForUpdatesDismiss : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionDirectIpConnectInit : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionDirectIpConnectGo : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionDirectIpEditField : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionNetworkSettingsEditAPort : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionNetworkSettingsDefaults : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionLoadGameMenuDeleteRequest : EngineTagDataUIEventHandlerReferenceFunctionEnum 
---@class EngineTagDataUIEventHandlerReferenceFunctionLoadGameMenuDeleteFinish : EngineTagDataUIEventHandlerReferenceFunctionEnum 

---@alias EngineTagDataUIEventHandlerReferenceFunction 
---| EngineTagDataUIEventHandlerReferenceFunctionNull
---| EngineTagDataUIEventHandlerReferenceFunctionListGotoNextItem
---| EngineTagDataUIEventHandlerReferenceFunctionListGotoPreviousItem
---| EngineTagDataUIEventHandlerReferenceFunctionUnused
---| EngineTagDataUIEventHandlerReferenceFunctionUnused1
---| EngineTagDataUIEventHandlerReferenceFunctionInitializeSpLevelListSolo
---| EngineTagDataUIEventHandlerReferenceFunctionInitializeSpLevelListCoop
---| EngineTagDataUIEventHandlerReferenceFunctionDisposeSpLevelList
---| EngineTagDataUIEventHandlerReferenceFunctionSoloLevelSetMap
---| EngineTagDataUIEventHandlerReferenceFunctionSetDifficulty
---| EngineTagDataUIEventHandlerReferenceFunctionStartNewGame
---| EngineTagDataUIEventHandlerReferenceFunctionPauseGameRestartAtCheckpoint
---| EngineTagDataUIEventHandlerReferenceFunctionPauseGameRestartLevel
---| EngineTagDataUIEventHandlerReferenceFunctionPauseGameReturnToMainMenu
---| EngineTagDataUIEventHandlerReferenceFunctionClearMultiplayerPlayerJoins
---| EngineTagDataUIEventHandlerReferenceFunctionJoinControllerToMpGame
---| EngineTagDataUIEventHandlerReferenceFunctionInitializeNetGameServerList
---| EngineTagDataUIEventHandlerReferenceFunctionStartNetworkGameServer
---| EngineTagDataUIEventHandlerReferenceFunctionDisposeNetGameServerList
---| EngineTagDataUIEventHandlerReferenceFunctionShutdownNetworkGame
---| EngineTagDataUIEventHandlerReferenceFunctionNetGameJoinFromServerList
---| EngineTagDataUIEventHandlerReferenceFunctionSplitScreenGameInitialize
---| EngineTagDataUIEventHandlerReferenceFunctionCoopGameInitialize
---| EngineTagDataUIEventHandlerReferenceFunctionMainMenuIntialize
---| EngineTagDataUIEventHandlerReferenceFunctionMpTypeMenuInitialize
---| EngineTagDataUIEventHandlerReferenceFunctionPickPlayStageForQuickStart
---| EngineTagDataUIEventHandlerReferenceFunctionMpLevelListInitialize
---| EngineTagDataUIEventHandlerReferenceFunctionMpLevelListDispose
---| EngineTagDataUIEventHandlerReferenceFunctionMpLevelSelect
---| EngineTagDataUIEventHandlerReferenceFunctionMpProfilesListInitialize
---| EngineTagDataUIEventHandlerReferenceFunctionMpProfilesListDispose
---| EngineTagDataUIEventHandlerReferenceFunctionMpProfileSetForGame
---| EngineTagDataUIEventHandlerReferenceFunctionSwapPlayerTeam
---| EngineTagDataUIEventHandlerReferenceFunctionNetGameJoinPlayer
---| EngineTagDataUIEventHandlerReferenceFunctionPlayerProfileListInitialize
---| EngineTagDataUIEventHandlerReferenceFunctionPlayerProfileListDispose
---| EngineTagDataUIEventHandlerReferenceFunction_3widePlyrProfSetForGame
---| EngineTagDataUIEventHandlerReferenceFunction_1widePlyrProfSetForGame
---| EngineTagDataUIEventHandlerReferenceFunctionMpProfileBeginEditing
---| EngineTagDataUIEventHandlerReferenceFunctionMpProfileEndEditing
---| EngineTagDataUIEventHandlerReferenceFunctionMpProfileSetGameEngine
---| EngineTagDataUIEventHandlerReferenceFunctionMpProfileChangeName
---| EngineTagDataUIEventHandlerReferenceFunctionMpProfileSetCtfRules
---| EngineTagDataUIEventHandlerReferenceFunctionMpProfileSetKothRules
---| EngineTagDataUIEventHandlerReferenceFunctionMpProfileSetSlayerRules
---| EngineTagDataUIEventHandlerReferenceFunctionMpProfileSetOddballRules
---| EngineTagDataUIEventHandlerReferenceFunctionMpProfileSetRacingRules
---| EngineTagDataUIEventHandlerReferenceFunctionMpProfileSetPlayerOptions
---| EngineTagDataUIEventHandlerReferenceFunctionMpProfileSetItemOptions
---| EngineTagDataUIEventHandlerReferenceFunctionMpProfileSetIndicatorOpts
---| EngineTagDataUIEventHandlerReferenceFunctionMpProfileInitGameEngine
---| EngineTagDataUIEventHandlerReferenceFunctionMpProfileInitName
---| EngineTagDataUIEventHandlerReferenceFunctionMpProfileInitCtfRules
---| EngineTagDataUIEventHandlerReferenceFunctionMpProfileInitKothRules
---| EngineTagDataUIEventHandlerReferenceFunctionMpProfileInitSlayerRules
---| EngineTagDataUIEventHandlerReferenceFunctionMpProfileInitOddballRules
---| EngineTagDataUIEventHandlerReferenceFunctionMpProfileInitRacingRules
---| EngineTagDataUIEventHandlerReferenceFunctionMpProfileInitPlayerOpts
---| EngineTagDataUIEventHandlerReferenceFunctionMpProfileInitItemOptions
---| EngineTagDataUIEventHandlerReferenceFunctionMpProfileInitIndicatorOpts
---| EngineTagDataUIEventHandlerReferenceFunctionMpProfileSaveChanges
---| EngineTagDataUIEventHandlerReferenceFunctionColorPickerMenuInitialize
---| EngineTagDataUIEventHandlerReferenceFunctionColorPickerMenuDispose
---| EngineTagDataUIEventHandlerReferenceFunctionColorPickerSelectColor
---| EngineTagDataUIEventHandlerReferenceFunctionPlayerProfileBeginEditing
---| EngineTagDataUIEventHandlerReferenceFunctionPlayerProfileEndEditing
---| EngineTagDataUIEventHandlerReferenceFunctionPlayerProfileChangeName
---| EngineTagDataUIEventHandlerReferenceFunctionPlayerProfileSaveChanges
---| EngineTagDataUIEventHandlerReferenceFunctionPlyrPrfInitCntlSettings
---| EngineTagDataUIEventHandlerReferenceFunctionPlyrPrfInitAdvCntlSet
---| EngineTagDataUIEventHandlerReferenceFunctionPlyrPrfSaveCntlSettings
---| EngineTagDataUIEventHandlerReferenceFunctionPlyrPrfSaveAdvCntlSet
---| EngineTagDataUIEventHandlerReferenceFunctionMpGamePlayerQuit
---| EngineTagDataUIEventHandlerReferenceFunctionMainMenuSwitchToSoloGame
---| EngineTagDataUIEventHandlerReferenceFunctionRequestDelPlayerProfile
---| EngineTagDataUIEventHandlerReferenceFunctionRequestDelPlaylistProfile
---| EngineTagDataUIEventHandlerReferenceFunctionFinalDelPlayerProfile
---| EngineTagDataUIEventHandlerReferenceFunctionFinalDelPlaylistProfile
---| EngineTagDataUIEventHandlerReferenceFunctionCancelProfileDelete
---| EngineTagDataUIEventHandlerReferenceFunctionCreateEditPlaylistProfile
---| EngineTagDataUIEventHandlerReferenceFunctionCreateEditPlayerProfile
---| EngineTagDataUIEventHandlerReferenceFunctionNetGameSpeedStart
---| EngineTagDataUIEventHandlerReferenceFunctionNetGameDelayStart
---| EngineTagDataUIEventHandlerReferenceFunctionNetServerAcceptConx
---| EngineTagDataUIEventHandlerReferenceFunctionNetServerDeferStart
---| EngineTagDataUIEventHandlerReferenceFunctionNetServerAllowStart
---| EngineTagDataUIEventHandlerReferenceFunctionDisableIfNoXdemos
---| EngineTagDataUIEventHandlerReferenceFunctionRunXdemos
---| EngineTagDataUIEventHandlerReferenceFunctionSpResetControllerChoices
---| EngineTagDataUIEventHandlerReferenceFunctionSpSetP1ControllerChoice
---| EngineTagDataUIEventHandlerReferenceFunctionSpSetP2ControllerChoice
---| EngineTagDataUIEventHandlerReferenceFunctionErrorIfNoNetworkConnection
---| EngineTagDataUIEventHandlerReferenceFunctionStartServerIfNoneAdvertised
---| EngineTagDataUIEventHandlerReferenceFunctionNetGameUnjoinPlayer
---| EngineTagDataUIEventHandlerReferenceFunctionCloseIfNotEditingProfile
---| EngineTagDataUIEventHandlerReferenceFunctionExitToXboxDashboard
---| EngineTagDataUIEventHandlerReferenceFunctionNewCampaignChosen
---| EngineTagDataUIEventHandlerReferenceFunctionNewCampaignDecision
---| EngineTagDataUIEventHandlerReferenceFunctionPopHistoryStackOnce
---| EngineTagDataUIEventHandlerReferenceFunctionDifficultyMenuInit
---| EngineTagDataUIEventHandlerReferenceFunctionBeginMusicFadeOut
---| EngineTagDataUIEventHandlerReferenceFunctionNewGameIfNoPlyrProfiles
---| EngineTagDataUIEventHandlerReferenceFunctionExitGracefullyToXboxDashboard
---| EngineTagDataUIEventHandlerReferenceFunctionPauseGameInvertPitch
---| EngineTagDataUIEventHandlerReferenceFunctionStartNewCoopGame
---| EngineTagDataUIEventHandlerReferenceFunctionPauseGameInvertSpinnerGet
---| EngineTagDataUIEventHandlerReferenceFunctionPauseGameInvertSpinnerSet
---| EngineTagDataUIEventHandlerReferenceFunctionMainMenuQuitGame
---| EngineTagDataUIEventHandlerReferenceFunctionMouseEmitAcceptEvent
---| EngineTagDataUIEventHandlerReferenceFunctionMouseEmitBackEvent
---| EngineTagDataUIEventHandlerReferenceFunctionMouseEmitDpadLeftEvent
---| EngineTagDataUIEventHandlerReferenceFunctionMouseEmitDpadRightEvent
---| EngineTagDataUIEventHandlerReferenceFunctionMouseSpinner_3wideClick
---| EngineTagDataUIEventHandlerReferenceFunctionControlsScreenInit
---| EngineTagDataUIEventHandlerReferenceFunctionVideoScreenInit
---| EngineTagDataUIEventHandlerReferenceFunctionControlsBeginBinding
---| EngineTagDataUIEventHandlerReferenceFunctionGamespyScreenInit
---| EngineTagDataUIEventHandlerReferenceFunctionGamespyScreenDispose
---| EngineTagDataUIEventHandlerReferenceFunctionGamespySelectHeader
---| EngineTagDataUIEventHandlerReferenceFunctionGamespySelectItem
---| EngineTagDataUIEventHandlerReferenceFunctionGamespySelectButton
---| EngineTagDataUIEventHandlerReferenceFunctionPlrProfInitMouseSet
---| EngineTagDataUIEventHandlerReferenceFunctionPlrProfChangeMouseSet
---| EngineTagDataUIEventHandlerReferenceFunctionPlrProfInitAudioSet
---| EngineTagDataUIEventHandlerReferenceFunctionPlrProfChangeAudioSet
---| EngineTagDataUIEventHandlerReferenceFunctionPlrProfChangeVideoSet
---| EngineTagDataUIEventHandlerReferenceFunctionControlsScreenDispose
---| EngineTagDataUIEventHandlerReferenceFunctionControlsScreenChangeSet
---| EngineTagDataUIEventHandlerReferenceFunctionMouseEmitXEvent
---| EngineTagDataUIEventHandlerReferenceFunctionGamepadScreenInit
---| EngineTagDataUIEventHandlerReferenceFunctionGamepadScreenDispose
---| EngineTagDataUIEventHandlerReferenceFunctionGamepadScreenChangeGamepads
---| EngineTagDataUIEventHandlerReferenceFunctionGamepadScreenSelectItem
---| EngineTagDataUIEventHandlerReferenceFunctionMouseScreenDefaults
---| EngineTagDataUIEventHandlerReferenceFunctionAudioScreenDefaults
---| EngineTagDataUIEventHandlerReferenceFunctionVideoScreenDefaults
---| EngineTagDataUIEventHandlerReferenceFunctionControlsScreenDefaults
---| EngineTagDataUIEventHandlerReferenceFunctionProfileSetEditBegin
---| EngineTagDataUIEventHandlerReferenceFunctionProfileManagerDelete
---| EngineTagDataUIEventHandlerReferenceFunctionProfileManagerSelect
---| EngineTagDataUIEventHandlerReferenceFunctionGamespyDismissError
---| EngineTagDataUIEventHandlerReferenceFunctionServerSettingsInit
---| EngineTagDataUIEventHandlerReferenceFunctionSsEditServerName
---| EngineTagDataUIEventHandlerReferenceFunctionSsEditServerPassword
---| EngineTagDataUIEventHandlerReferenceFunctionSsStartGame
---| EngineTagDataUIEventHandlerReferenceFunctionVideoTestDialogInit
---| EngineTagDataUIEventHandlerReferenceFunctionVideoTestDialogDispose
---| EngineTagDataUIEventHandlerReferenceFunctionVideoTestDialogAccept
---| EngineTagDataUIEventHandlerReferenceFunctionGamespyDismissFilters
---| EngineTagDataUIEventHandlerReferenceFunctionGamespyUpdateFilterSettings
---| EngineTagDataUIEventHandlerReferenceFunctionGamespyBackHandler
---| EngineTagDataUIEventHandlerReferenceFunctionMouseSpinner_1wideClick
---| EngineTagDataUIEventHandlerReferenceFunctionControlsBackHandler
---| EngineTagDataUIEventHandlerReferenceFunctionControlsAdvancedLaunch
---| EngineTagDataUIEventHandlerReferenceFunctionControlsAdvancedOk
---| EngineTagDataUIEventHandlerReferenceFunctionMpPauseMenuOpen
---| EngineTagDataUIEventHandlerReferenceFunctionMpGameOptionsOpen
---| EngineTagDataUIEventHandlerReferenceFunctionMpChooseTeam
---| EngineTagDataUIEventHandlerReferenceFunctionMpProfInitVehicleOptions
---| EngineTagDataUIEventHandlerReferenceFunctionMpProfSaveVehicleOptions
---| EngineTagDataUIEventHandlerReferenceFunctionSinglePrevClItemActivated
---| EngineTagDataUIEventHandlerReferenceFunctionMpProfInitTeamplayOptions
---| EngineTagDataUIEventHandlerReferenceFunctionMpProfSaveTeamplayOptions
---| EngineTagDataUIEventHandlerReferenceFunctionMpGameOptionsChoose
---| EngineTagDataUIEventHandlerReferenceFunctionEmitCustomActivationEvent
---| EngineTagDataUIEventHandlerReferenceFunctionPlrProfCancelAudioSet
---| EngineTagDataUIEventHandlerReferenceFunctionPlrProfInitNetworkOptions
---| EngineTagDataUIEventHandlerReferenceFunctionPlrProfSaveNetworkOptions
---| EngineTagDataUIEventHandlerReferenceFunctionCreditsPostRender
---| EngineTagDataUIEventHandlerReferenceFunctionDifficultyItemSelect
---| EngineTagDataUIEventHandlerReferenceFunctionCreditsInitialize
---| EngineTagDataUIEventHandlerReferenceFunctionCreditsDispose
---| EngineTagDataUIEventHandlerReferenceFunctionGamespyGetPatch
---| EngineTagDataUIEventHandlerReferenceFunctionVideoScreenDispose
---| EngineTagDataUIEventHandlerReferenceFunctionCampaignMenuInit
---| EngineTagDataUIEventHandlerReferenceFunctionCampaignMenuContinue
---| EngineTagDataUIEventHandlerReferenceFunctionLoadGameMenuInit
---| EngineTagDataUIEventHandlerReferenceFunctionLoadGameMenuDispose
---| EngineTagDataUIEventHandlerReferenceFunctionLoadGameMenuActivated
---| EngineTagDataUIEventHandlerReferenceFunctionSoloMenuSaveCheckpoint
---| EngineTagDataUIEventHandlerReferenceFunctionMpTypeSetMode
---| EngineTagDataUIEventHandlerReferenceFunctionCheckingForUpdatesOk
---| EngineTagDataUIEventHandlerReferenceFunctionCheckingForUpdatesDismiss
---| EngineTagDataUIEventHandlerReferenceFunctionDirectIpConnectInit
---| EngineTagDataUIEventHandlerReferenceFunctionDirectIpConnectGo
---| EngineTagDataUIEventHandlerReferenceFunctionDirectIpEditField
---| EngineTagDataUIEventHandlerReferenceFunctionNetworkSettingsEditAPort
---| EngineTagDataUIEventHandlerReferenceFunctionNetworkSettingsDefaults
---| EngineTagDataUIEventHandlerReferenceFunctionLoadGameMenuDeleteRequest
---| EngineTagDataUIEventHandlerReferenceFunctionLoadGameMenuDeleteFinish

---@class EngineTagDataUIEventHandlerReferenceFunctionTable 
---@field tionNull EngineTagDataUIEventHandlerReferenceFunctionNull
---@field tionListGotoNextItem EngineTagDataUIEventHandlerReferenceFunctionListGotoNextItem
---@field tionListGotoPreviousItem EngineTagDataUIEventHandlerReferenceFunctionListGotoPreviousItem
---@field tionUnused EngineTagDataUIEventHandlerReferenceFunctionUnused
---@field tionUnused1 EngineTagDataUIEventHandlerReferenceFunctionUnused1
---@field tionInitializeSpLevelListSolo EngineTagDataUIEventHandlerReferenceFunctionInitializeSpLevelListSolo
---@field tionInitializeSpLevelListCoop EngineTagDataUIEventHandlerReferenceFunctionInitializeSpLevelListCoop
---@field tionDisposeSpLevelList EngineTagDataUIEventHandlerReferenceFunctionDisposeSpLevelList
---@field tionSoloLevelSetMap EngineTagDataUIEventHandlerReferenceFunctionSoloLevelSetMap
---@field tionSetDifficulty EngineTagDataUIEventHandlerReferenceFunctionSetDifficulty
---@field tionStartNewGame EngineTagDataUIEventHandlerReferenceFunctionStartNewGame
---@field tionPauseGameRestartAtCheckpoint EngineTagDataUIEventHandlerReferenceFunctionPauseGameRestartAtCheckpoint
---@field tionPauseGameRestartLevel EngineTagDataUIEventHandlerReferenceFunctionPauseGameRestartLevel
---@field tionPauseGameReturnToMainMenu EngineTagDataUIEventHandlerReferenceFunctionPauseGameReturnToMainMenu
---@field tionClearMultiplayerPlayerJoins EngineTagDataUIEventHandlerReferenceFunctionClearMultiplayerPlayerJoins
---@field tionJoinControllerToMpGame EngineTagDataUIEventHandlerReferenceFunctionJoinControllerToMpGame
---@field tionInitializeNetGameServerList EngineTagDataUIEventHandlerReferenceFunctionInitializeNetGameServerList
---@field tionStartNetworkGameServer EngineTagDataUIEventHandlerReferenceFunctionStartNetworkGameServer
---@field tionDisposeNetGameServerList EngineTagDataUIEventHandlerReferenceFunctionDisposeNetGameServerList
---@field tionShutdownNetworkGame EngineTagDataUIEventHandlerReferenceFunctionShutdownNetworkGame
---@field tionNetGameJoinFromServerList EngineTagDataUIEventHandlerReferenceFunctionNetGameJoinFromServerList
---@field tionSplitScreenGameInitialize EngineTagDataUIEventHandlerReferenceFunctionSplitScreenGameInitialize
---@field tionCoopGameInitialize EngineTagDataUIEventHandlerReferenceFunctionCoopGameInitialize
---@field tionMainMenuIntialize EngineTagDataUIEventHandlerReferenceFunctionMainMenuIntialize
---@field tionMpTypeMenuInitialize EngineTagDataUIEventHandlerReferenceFunctionMpTypeMenuInitialize
---@field tionPickPlayStageForQuickStart EngineTagDataUIEventHandlerReferenceFunctionPickPlayStageForQuickStart
---@field tionMpLevelListInitialize EngineTagDataUIEventHandlerReferenceFunctionMpLevelListInitialize
---@field tionMpLevelListDispose EngineTagDataUIEventHandlerReferenceFunctionMpLevelListDispose
---@field tionMpLevelSelect EngineTagDataUIEventHandlerReferenceFunctionMpLevelSelect
---@field tionMpProfilesListInitialize EngineTagDataUIEventHandlerReferenceFunctionMpProfilesListInitialize
---@field tionMpProfilesListDispose EngineTagDataUIEventHandlerReferenceFunctionMpProfilesListDispose
---@field tionMpProfileSetForGame EngineTagDataUIEventHandlerReferenceFunctionMpProfileSetForGame
---@field tionSwapPlayerTeam EngineTagDataUIEventHandlerReferenceFunctionSwapPlayerTeam
---@field tionNetGameJoinPlayer EngineTagDataUIEventHandlerReferenceFunctionNetGameJoinPlayer
---@field tionPlayerProfileListInitialize EngineTagDataUIEventHandlerReferenceFunctionPlayerProfileListInitialize
---@field tionPlayerProfileListDispose EngineTagDataUIEventHandlerReferenceFunctionPlayerProfileListDispose
---@field tion_3widePlyrProfSetForGame EngineTagDataUIEventHandlerReferenceFunction_3widePlyrProfSetForGame
---@field tion_1widePlyrProfSetForGame EngineTagDataUIEventHandlerReferenceFunction_1widePlyrProfSetForGame
---@field tionMpProfileBeginEditing EngineTagDataUIEventHandlerReferenceFunctionMpProfileBeginEditing
---@field tionMpProfileEndEditing EngineTagDataUIEventHandlerReferenceFunctionMpProfileEndEditing
---@field tionMpProfileSetGameEngine EngineTagDataUIEventHandlerReferenceFunctionMpProfileSetGameEngine
---@field tionMpProfileChangeName EngineTagDataUIEventHandlerReferenceFunctionMpProfileChangeName
---@field tionMpProfileSetCtfRules EngineTagDataUIEventHandlerReferenceFunctionMpProfileSetCtfRules
---@field tionMpProfileSetKothRules EngineTagDataUIEventHandlerReferenceFunctionMpProfileSetKothRules
---@field tionMpProfileSetSlayerRules EngineTagDataUIEventHandlerReferenceFunctionMpProfileSetSlayerRules
---@field tionMpProfileSetOddballRules EngineTagDataUIEventHandlerReferenceFunctionMpProfileSetOddballRules
---@field tionMpProfileSetRacingRules EngineTagDataUIEventHandlerReferenceFunctionMpProfileSetRacingRules
---@field tionMpProfileSetPlayerOptions EngineTagDataUIEventHandlerReferenceFunctionMpProfileSetPlayerOptions
---@field tionMpProfileSetItemOptions EngineTagDataUIEventHandlerReferenceFunctionMpProfileSetItemOptions
---@field tionMpProfileSetIndicatorOpts EngineTagDataUIEventHandlerReferenceFunctionMpProfileSetIndicatorOpts
---@field tionMpProfileInitGameEngine EngineTagDataUIEventHandlerReferenceFunctionMpProfileInitGameEngine
---@field tionMpProfileInitName EngineTagDataUIEventHandlerReferenceFunctionMpProfileInitName
---@field tionMpProfileInitCtfRules EngineTagDataUIEventHandlerReferenceFunctionMpProfileInitCtfRules
---@field tionMpProfileInitKothRules EngineTagDataUIEventHandlerReferenceFunctionMpProfileInitKothRules
---@field tionMpProfileInitSlayerRules EngineTagDataUIEventHandlerReferenceFunctionMpProfileInitSlayerRules
---@field tionMpProfileInitOddballRules EngineTagDataUIEventHandlerReferenceFunctionMpProfileInitOddballRules
---@field tionMpProfileInitRacingRules EngineTagDataUIEventHandlerReferenceFunctionMpProfileInitRacingRules
---@field tionMpProfileInitPlayerOpts EngineTagDataUIEventHandlerReferenceFunctionMpProfileInitPlayerOpts
---@field tionMpProfileInitItemOptions EngineTagDataUIEventHandlerReferenceFunctionMpProfileInitItemOptions
---@field tionMpProfileInitIndicatorOpts EngineTagDataUIEventHandlerReferenceFunctionMpProfileInitIndicatorOpts
---@field tionMpProfileSaveChanges EngineTagDataUIEventHandlerReferenceFunctionMpProfileSaveChanges
---@field tionColorPickerMenuInitialize EngineTagDataUIEventHandlerReferenceFunctionColorPickerMenuInitialize
---@field tionColorPickerMenuDispose EngineTagDataUIEventHandlerReferenceFunctionColorPickerMenuDispose
---@field tionColorPickerSelectColor EngineTagDataUIEventHandlerReferenceFunctionColorPickerSelectColor
---@field tionPlayerProfileBeginEditing EngineTagDataUIEventHandlerReferenceFunctionPlayerProfileBeginEditing
---@field tionPlayerProfileEndEditing EngineTagDataUIEventHandlerReferenceFunctionPlayerProfileEndEditing
---@field tionPlayerProfileChangeName EngineTagDataUIEventHandlerReferenceFunctionPlayerProfileChangeName
---@field tionPlayerProfileSaveChanges EngineTagDataUIEventHandlerReferenceFunctionPlayerProfileSaveChanges
---@field tionPlyrPrfInitCntlSettings EngineTagDataUIEventHandlerReferenceFunctionPlyrPrfInitCntlSettings
---@field tionPlyrPrfInitAdvCntlSet EngineTagDataUIEventHandlerReferenceFunctionPlyrPrfInitAdvCntlSet
---@field tionPlyrPrfSaveCntlSettings EngineTagDataUIEventHandlerReferenceFunctionPlyrPrfSaveCntlSettings
---@field tionPlyrPrfSaveAdvCntlSet EngineTagDataUIEventHandlerReferenceFunctionPlyrPrfSaveAdvCntlSet
---@field tionMpGamePlayerQuit EngineTagDataUIEventHandlerReferenceFunctionMpGamePlayerQuit
---@field tionMainMenuSwitchToSoloGame EngineTagDataUIEventHandlerReferenceFunctionMainMenuSwitchToSoloGame
---@field tionRequestDelPlayerProfile EngineTagDataUIEventHandlerReferenceFunctionRequestDelPlayerProfile
---@field tionRequestDelPlaylistProfile EngineTagDataUIEventHandlerReferenceFunctionRequestDelPlaylistProfile
---@field tionFinalDelPlayerProfile EngineTagDataUIEventHandlerReferenceFunctionFinalDelPlayerProfile
---@field tionFinalDelPlaylistProfile EngineTagDataUIEventHandlerReferenceFunctionFinalDelPlaylistProfile
---@field tionCancelProfileDelete EngineTagDataUIEventHandlerReferenceFunctionCancelProfileDelete
---@field tionCreateEditPlaylistProfile EngineTagDataUIEventHandlerReferenceFunctionCreateEditPlaylistProfile
---@field tionCreateEditPlayerProfile EngineTagDataUIEventHandlerReferenceFunctionCreateEditPlayerProfile
---@field tionNetGameSpeedStart EngineTagDataUIEventHandlerReferenceFunctionNetGameSpeedStart
---@field tionNetGameDelayStart EngineTagDataUIEventHandlerReferenceFunctionNetGameDelayStart
---@field tionNetServerAcceptConx EngineTagDataUIEventHandlerReferenceFunctionNetServerAcceptConx
---@field tionNetServerDeferStart EngineTagDataUIEventHandlerReferenceFunctionNetServerDeferStart
---@field tionNetServerAllowStart EngineTagDataUIEventHandlerReferenceFunctionNetServerAllowStart
---@field tionDisableIfNoXdemos EngineTagDataUIEventHandlerReferenceFunctionDisableIfNoXdemos
---@field tionRunXdemos EngineTagDataUIEventHandlerReferenceFunctionRunXdemos
---@field tionSpResetControllerChoices EngineTagDataUIEventHandlerReferenceFunctionSpResetControllerChoices
---@field tionSpSetP1ControllerChoice EngineTagDataUIEventHandlerReferenceFunctionSpSetP1ControllerChoice
---@field tionSpSetP2ControllerChoice EngineTagDataUIEventHandlerReferenceFunctionSpSetP2ControllerChoice
---@field tionErrorIfNoNetworkConnection EngineTagDataUIEventHandlerReferenceFunctionErrorIfNoNetworkConnection
---@field tionStartServerIfNoneAdvertised EngineTagDataUIEventHandlerReferenceFunctionStartServerIfNoneAdvertised
---@field tionNetGameUnjoinPlayer EngineTagDataUIEventHandlerReferenceFunctionNetGameUnjoinPlayer
---@field tionCloseIfNotEditingProfile EngineTagDataUIEventHandlerReferenceFunctionCloseIfNotEditingProfile
---@field tionExitToXboxDashboard EngineTagDataUIEventHandlerReferenceFunctionExitToXboxDashboard
---@field tionNewCampaignChosen EngineTagDataUIEventHandlerReferenceFunctionNewCampaignChosen
---@field tionNewCampaignDecision EngineTagDataUIEventHandlerReferenceFunctionNewCampaignDecision
---@field tionPopHistoryStackOnce EngineTagDataUIEventHandlerReferenceFunctionPopHistoryStackOnce
---@field tionDifficultyMenuInit EngineTagDataUIEventHandlerReferenceFunctionDifficultyMenuInit
---@field tionBeginMusicFadeOut EngineTagDataUIEventHandlerReferenceFunctionBeginMusicFadeOut
---@field tionNewGameIfNoPlyrProfiles EngineTagDataUIEventHandlerReferenceFunctionNewGameIfNoPlyrProfiles
---@field tionExitGracefullyToXboxDashboard EngineTagDataUIEventHandlerReferenceFunctionExitGracefullyToXboxDashboard
---@field tionPauseGameInvertPitch EngineTagDataUIEventHandlerReferenceFunctionPauseGameInvertPitch
---@field tionStartNewCoopGame EngineTagDataUIEventHandlerReferenceFunctionStartNewCoopGame
---@field tionPauseGameInvertSpinnerGet EngineTagDataUIEventHandlerReferenceFunctionPauseGameInvertSpinnerGet
---@field tionPauseGameInvertSpinnerSet EngineTagDataUIEventHandlerReferenceFunctionPauseGameInvertSpinnerSet
---@field tionMainMenuQuitGame EngineTagDataUIEventHandlerReferenceFunctionMainMenuQuitGame
---@field tionMouseEmitAcceptEvent EngineTagDataUIEventHandlerReferenceFunctionMouseEmitAcceptEvent
---@field tionMouseEmitBackEvent EngineTagDataUIEventHandlerReferenceFunctionMouseEmitBackEvent
---@field tionMouseEmitDpadLeftEvent EngineTagDataUIEventHandlerReferenceFunctionMouseEmitDpadLeftEvent
---@field tionMouseEmitDpadRightEvent EngineTagDataUIEventHandlerReferenceFunctionMouseEmitDpadRightEvent
---@field tionMouseSpinner_3wideClick EngineTagDataUIEventHandlerReferenceFunctionMouseSpinner_3wideClick
---@field tionControlsScreenInit EngineTagDataUIEventHandlerReferenceFunctionControlsScreenInit
---@field tionVideoScreenInit EngineTagDataUIEventHandlerReferenceFunctionVideoScreenInit
---@field tionControlsBeginBinding EngineTagDataUIEventHandlerReferenceFunctionControlsBeginBinding
---@field tionGamespyScreenInit EngineTagDataUIEventHandlerReferenceFunctionGamespyScreenInit
---@field tionGamespyScreenDispose EngineTagDataUIEventHandlerReferenceFunctionGamespyScreenDispose
---@field tionGamespySelectHeader EngineTagDataUIEventHandlerReferenceFunctionGamespySelectHeader
---@field tionGamespySelectItem EngineTagDataUIEventHandlerReferenceFunctionGamespySelectItem
---@field tionGamespySelectButton EngineTagDataUIEventHandlerReferenceFunctionGamespySelectButton
---@field tionPlrProfInitMouseSet EngineTagDataUIEventHandlerReferenceFunctionPlrProfInitMouseSet
---@field tionPlrProfChangeMouseSet EngineTagDataUIEventHandlerReferenceFunctionPlrProfChangeMouseSet
---@field tionPlrProfInitAudioSet EngineTagDataUIEventHandlerReferenceFunctionPlrProfInitAudioSet
---@field tionPlrProfChangeAudioSet EngineTagDataUIEventHandlerReferenceFunctionPlrProfChangeAudioSet
---@field tionPlrProfChangeVideoSet EngineTagDataUIEventHandlerReferenceFunctionPlrProfChangeVideoSet
---@field tionControlsScreenDispose EngineTagDataUIEventHandlerReferenceFunctionControlsScreenDispose
---@field tionControlsScreenChangeSet EngineTagDataUIEventHandlerReferenceFunctionControlsScreenChangeSet
---@field tionMouseEmitXEvent EngineTagDataUIEventHandlerReferenceFunctionMouseEmitXEvent
---@field tionGamepadScreenInit EngineTagDataUIEventHandlerReferenceFunctionGamepadScreenInit
---@field tionGamepadScreenDispose EngineTagDataUIEventHandlerReferenceFunctionGamepadScreenDispose
---@field tionGamepadScreenChangeGamepads EngineTagDataUIEventHandlerReferenceFunctionGamepadScreenChangeGamepads
---@field tionGamepadScreenSelectItem EngineTagDataUIEventHandlerReferenceFunctionGamepadScreenSelectItem
---@field tionMouseScreenDefaults EngineTagDataUIEventHandlerReferenceFunctionMouseScreenDefaults
---@field tionAudioScreenDefaults EngineTagDataUIEventHandlerReferenceFunctionAudioScreenDefaults
---@field tionVideoScreenDefaults EngineTagDataUIEventHandlerReferenceFunctionVideoScreenDefaults
---@field tionControlsScreenDefaults EngineTagDataUIEventHandlerReferenceFunctionControlsScreenDefaults
---@field tionProfileSetEditBegin EngineTagDataUIEventHandlerReferenceFunctionProfileSetEditBegin
---@field tionProfileManagerDelete EngineTagDataUIEventHandlerReferenceFunctionProfileManagerDelete
---@field tionProfileManagerSelect EngineTagDataUIEventHandlerReferenceFunctionProfileManagerSelect
---@field tionGamespyDismissError EngineTagDataUIEventHandlerReferenceFunctionGamespyDismissError
---@field tionServerSettingsInit EngineTagDataUIEventHandlerReferenceFunctionServerSettingsInit
---@field tionSsEditServerName EngineTagDataUIEventHandlerReferenceFunctionSsEditServerName
---@field tionSsEditServerPassword EngineTagDataUIEventHandlerReferenceFunctionSsEditServerPassword
---@field tionSsStartGame EngineTagDataUIEventHandlerReferenceFunctionSsStartGame
---@field tionVideoTestDialogInit EngineTagDataUIEventHandlerReferenceFunctionVideoTestDialogInit
---@field tionVideoTestDialogDispose EngineTagDataUIEventHandlerReferenceFunctionVideoTestDialogDispose
---@field tionVideoTestDialogAccept EngineTagDataUIEventHandlerReferenceFunctionVideoTestDialogAccept
---@field tionGamespyDismissFilters EngineTagDataUIEventHandlerReferenceFunctionGamespyDismissFilters
---@field tionGamespyUpdateFilterSettings EngineTagDataUIEventHandlerReferenceFunctionGamespyUpdateFilterSettings
---@field tionGamespyBackHandler EngineTagDataUIEventHandlerReferenceFunctionGamespyBackHandler
---@field tionMouseSpinner_1wideClick EngineTagDataUIEventHandlerReferenceFunctionMouseSpinner_1wideClick
---@field tionControlsBackHandler EngineTagDataUIEventHandlerReferenceFunctionControlsBackHandler
---@field tionControlsAdvancedLaunch EngineTagDataUIEventHandlerReferenceFunctionControlsAdvancedLaunch
---@field tionControlsAdvancedOk EngineTagDataUIEventHandlerReferenceFunctionControlsAdvancedOk
---@field tionMpPauseMenuOpen EngineTagDataUIEventHandlerReferenceFunctionMpPauseMenuOpen
---@field tionMpGameOptionsOpen EngineTagDataUIEventHandlerReferenceFunctionMpGameOptionsOpen
---@field tionMpChooseTeam EngineTagDataUIEventHandlerReferenceFunctionMpChooseTeam
---@field tionMpProfInitVehicleOptions EngineTagDataUIEventHandlerReferenceFunctionMpProfInitVehicleOptions
---@field tionMpProfSaveVehicleOptions EngineTagDataUIEventHandlerReferenceFunctionMpProfSaveVehicleOptions
---@field tionSinglePrevClItemActivated EngineTagDataUIEventHandlerReferenceFunctionSinglePrevClItemActivated
---@field tionMpProfInitTeamplayOptions EngineTagDataUIEventHandlerReferenceFunctionMpProfInitTeamplayOptions
---@field tionMpProfSaveTeamplayOptions EngineTagDataUIEventHandlerReferenceFunctionMpProfSaveTeamplayOptions
---@field tionMpGameOptionsChoose EngineTagDataUIEventHandlerReferenceFunctionMpGameOptionsChoose
---@field tionEmitCustomActivationEvent EngineTagDataUIEventHandlerReferenceFunctionEmitCustomActivationEvent
---@field tionPlrProfCancelAudioSet EngineTagDataUIEventHandlerReferenceFunctionPlrProfCancelAudioSet
---@field tionPlrProfInitNetworkOptions EngineTagDataUIEventHandlerReferenceFunctionPlrProfInitNetworkOptions
---@field tionPlrProfSaveNetworkOptions EngineTagDataUIEventHandlerReferenceFunctionPlrProfSaveNetworkOptions
---@field tionCreditsPostRender EngineTagDataUIEventHandlerReferenceFunctionCreditsPostRender
---@field tionDifficultyItemSelect EngineTagDataUIEventHandlerReferenceFunctionDifficultyItemSelect
---@field tionCreditsInitialize EngineTagDataUIEventHandlerReferenceFunctionCreditsInitialize
---@field tionCreditsDispose EngineTagDataUIEventHandlerReferenceFunctionCreditsDispose
---@field tionGamespyGetPatch EngineTagDataUIEventHandlerReferenceFunctionGamespyGetPatch
---@field tionVideoScreenDispose EngineTagDataUIEventHandlerReferenceFunctionVideoScreenDispose
---@field tionCampaignMenuInit EngineTagDataUIEventHandlerReferenceFunctionCampaignMenuInit
---@field tionCampaignMenuContinue EngineTagDataUIEventHandlerReferenceFunctionCampaignMenuContinue
---@field tionLoadGameMenuInit EngineTagDataUIEventHandlerReferenceFunctionLoadGameMenuInit
---@field tionLoadGameMenuDispose EngineTagDataUIEventHandlerReferenceFunctionLoadGameMenuDispose
---@field tionLoadGameMenuActivated EngineTagDataUIEventHandlerReferenceFunctionLoadGameMenuActivated
---@field tionSoloMenuSaveCheckpoint EngineTagDataUIEventHandlerReferenceFunctionSoloMenuSaveCheckpoint
---@field tionMpTypeSetMode EngineTagDataUIEventHandlerReferenceFunctionMpTypeSetMode
---@field tionCheckingForUpdatesOk EngineTagDataUIEventHandlerReferenceFunctionCheckingForUpdatesOk
---@field tionCheckingForUpdatesDismiss EngineTagDataUIEventHandlerReferenceFunctionCheckingForUpdatesDismiss
---@field tionDirectIpConnectInit EngineTagDataUIEventHandlerReferenceFunctionDirectIpConnectInit
---@field tionDirectIpConnectGo EngineTagDataUIEventHandlerReferenceFunctionDirectIpConnectGo
---@field tionDirectIpEditField EngineTagDataUIEventHandlerReferenceFunctionDirectIpEditField
---@field tionNetworkSettingsEditAPort EngineTagDataUIEventHandlerReferenceFunctionNetworkSettingsEditAPort
---@field tionNetworkSettingsDefaults EngineTagDataUIEventHandlerReferenceFunctionNetworkSettingsDefaults
---@field tionLoadGameMenuDeleteRequest EngineTagDataUIEventHandlerReferenceFunctionLoadGameMenuDeleteRequest
---@field tionLoadGameMenuDeleteFinish EngineTagDataUIEventHandlerReferenceFunctionLoadGameMenuDeleteFinish
Engine.tag.uIEventHandlerReferenceFunction = {} 

---@class EngineTagDataUIReplaceFunctionEnum : Enum 

---@class EngineTagDataUIReplaceFunctionNull : EngineTagDataUIReplaceFunctionEnum 
---@class EngineTagDataUIReplaceFunctionWidgetSController : EngineTagDataUIReplaceFunctionEnum 
---@class EngineTagDataUIReplaceFunctionBuildNumber : EngineTagDataUIReplaceFunctionEnum 
---@class EngineTagDataUIReplaceFunctionPid : EngineTagDataUIReplaceFunctionEnum 

---@alias EngineTagDataUIReplaceFunction 
---| EngineTagDataUIReplaceFunctionNull
---| EngineTagDataUIReplaceFunctionWidgetSController
---| EngineTagDataUIReplaceFunctionBuildNumber
---| EngineTagDataUIReplaceFunctionPid

---@class EngineTagDataUIReplaceFunctionTable 
---@field onNull EngineTagDataUIReplaceFunctionNull
---@field onWidgetSController EngineTagDataUIReplaceFunctionWidgetSController
---@field onBuildNumber EngineTagDataUIReplaceFunctionBuildNumber
---@field onPid EngineTagDataUIReplaceFunctionPid
Engine.tag.uIReplaceFunction = {} 

---@class EngineTagDataUIWidgetTypeEnum : Enum 

---@class EngineTagDataUIWidgetTypeContainer : EngineTagDataUIWidgetTypeEnum 
---@class EngineTagDataUIWidgetTypeTextBox : EngineTagDataUIWidgetTypeEnum 
---@class EngineTagDataUIWidgetTypeSpinnerList : EngineTagDataUIWidgetTypeEnum 
---@class EngineTagDataUIWidgetTypeColumnList : EngineTagDataUIWidgetTypeEnum 
---@class EngineTagDataUIWidgetTypeGameModelNotImplemented : EngineTagDataUIWidgetTypeEnum 
---@class EngineTagDataUIWidgetTypeMovieNotImplemented : EngineTagDataUIWidgetTypeEnum 
---@class EngineTagDataUIWidgetTypeCustomNotImplemented : EngineTagDataUIWidgetTypeEnum 

---@alias EngineTagDataUIWidgetType 
---| EngineTagDataUIWidgetTypeContainer
---| EngineTagDataUIWidgetTypeTextBox
---| EngineTagDataUIWidgetTypeSpinnerList
---| EngineTagDataUIWidgetTypeColumnList
---| EngineTagDataUIWidgetTypeGameModelNotImplemented
---| EngineTagDataUIWidgetTypeMovieNotImplemented
---| EngineTagDataUIWidgetTypeCustomNotImplemented

---@class EngineTagDataUIWidgetTypeTable 
---@field peContainer EngineTagDataUIWidgetTypeContainer
---@field peTextBox EngineTagDataUIWidgetTypeTextBox
---@field peSpinnerList EngineTagDataUIWidgetTypeSpinnerList
---@field peColumnList EngineTagDataUIWidgetTypeColumnList
---@field peGameModelNotImplemented EngineTagDataUIWidgetTypeGameModelNotImplemented
---@field peMovieNotImplemented EngineTagDataUIWidgetTypeMovieNotImplemented
---@field peCustomNotImplemented EngineTagDataUIWidgetTypeCustomNotImplemented
Engine.tag.uIWidgetType = {} 

---@class EngineTagDataUIControllerIndexEnum : Enum 

---@class EngineTagDataUIControllerIndexPlayer_1 : EngineTagDataUIControllerIndexEnum 
---@class EngineTagDataUIControllerIndexPlayer_2 : EngineTagDataUIControllerIndexEnum 
---@class EngineTagDataUIControllerIndexPlayer_3 : EngineTagDataUIControllerIndexEnum 
---@class EngineTagDataUIControllerIndexPlayer_4 : EngineTagDataUIControllerIndexEnum 
---@class EngineTagDataUIControllerIndexAnyPlayer : EngineTagDataUIControllerIndexEnum 

---@alias EngineTagDataUIControllerIndex 
---| EngineTagDataUIControllerIndexPlayer_1
---| EngineTagDataUIControllerIndexPlayer_2
---| EngineTagDataUIControllerIndexPlayer_3
---| EngineTagDataUIControllerIndexPlayer_4
---| EngineTagDataUIControllerIndexAnyPlayer

---@class EngineTagDataUIControllerIndexTable 
---@field exPlayer_1 EngineTagDataUIControllerIndexPlayer_1
---@field exPlayer_2 EngineTagDataUIControllerIndexPlayer_2
---@field exPlayer_3 EngineTagDataUIControllerIndexPlayer_3
---@field exPlayer_4 EngineTagDataUIControllerIndexPlayer_4
---@field exAnyPlayer EngineTagDataUIControllerIndexAnyPlayer
Engine.tag.uIControllerIndex = {} 

---@class EngineTagDataUIJustificationEnum : Enum 

---@class EngineTagDataUIJustificationLeftJustify : EngineTagDataUIJustificationEnum 
---@class EngineTagDataUIJustificationRightJustify : EngineTagDataUIJustificationEnum 
---@class EngineTagDataUIJustificationCenterJustify : EngineTagDataUIJustificationEnum 

---@alias EngineTagDataUIJustification 
---| EngineTagDataUIJustificationLeftJustify
---| EngineTagDataUIJustificationRightJustify
---| EngineTagDataUIJustificationCenterJustify

---@class EngineTagDataUIJustificationTable 
---@field nLeftJustify EngineTagDataUIJustificationLeftJustify
---@field nRightJustify EngineTagDataUIJustificationRightJustify
---@field nCenterJustify EngineTagDataUIJustificationCenterJustify
Engine.tag.uIJustification = {} 

---@class MetaEngineTagDataEventHandlerReferencesFlags 
---@field closeCurrentWidget boolean 
---@field closeOtherWidget boolean 
---@field closeAllWidgets boolean 
---@field openWidget boolean 
---@field reloadSelf boolean 
---@field reloadOtherWidget boolean 
---@field giveFocusToWidget boolean 
---@field runFunction boolean 
---@field replaceSelfWWidget boolean 
---@field goBackToPreviousWidget boolean 
---@field runScenarioScript boolean 
---@field tryToBranchOnFailure boolean 

---@class MetaEngineTagDataConditionalWidgetReferenceFlags 
---@field loadIfEventHandlerFunctionFails boolean 

---@class MetaEngineTagDataChildWidgetReferenceFlags 
---@field useCustomControllerIndex boolean 

---@class MetaEngineTagDataUIWidgetDefinitionFlags 
---@field passUnhandledEventsToFocusedChild boolean 
---@field pauseGameTime boolean 
---@field flashBackgroundBitmap boolean 
---@field dpadUpDownTabsThruChildren boolean 
---@field dpadLeftRightTabsThruChildren boolean 
---@field dpadUpDownTabsThruListItems boolean 
---@field dpadLeftRightTabsThruListItems boolean 
---@field dontFocusASpecificChildWidget boolean 
---@field passUnhandledEventsToAllChildren boolean 
---@field renderRegardlessOfControllerIndex boolean 
---@field passHandledEventsToAllChildren boolean 
---@field returnToMainMenuIfNoHistory boolean 
---@field alwaysUseTagControllerIndex boolean 
---@field alwaysUseNiftyRenderFx boolean 
---@field dontPushHistory boolean 
---@field forceHandleMouse boolean 

---@class MetaEngineTagDataUIWidgetDefinitionFlags1 
---@field editable boolean 
---@field password boolean 
---@field flashing boolean 
---@field dontDoThatWeirdFocusTest boolean 

---@class MetaEngineTagDataUIWidgetDefinitionFlags2 
---@field listItemsGeneratedInCode boolean 
---@field listItemsFromStringListTag boolean 
---@field listItemsOnlyOneTooltip boolean 
---@field listSinglePreviewNoScroll boolean 

---@class MetaEngineTagDataGameDataInputReference 
---@field function EngineTagDataUIGameDataInputReferenceFunction 

---@class MetaEngineTagDataEventHandlerReference 
---@field flags MetaEngineTagDataEventHandlerReferencesFlags 
---@field eventType EngineTagDataUIEventType 
---@field function EngineTagDataUIEventHandlerReferenceFunction 
---@field widgetTag MetaEngineTagDependency 
---@field soundEffect MetaEngineTagDependency 
---@field script MetaEngineTagString 

---@class MetaEngineTagDataSearchAndReplaceReference 
---@field searchString MetaEngineTagString 
---@field replaceFunction EngineTagDataUIReplaceFunction 

---@class MetaEngineTagDataConditionalWidgetReference 
---@field widgetTag MetaEngineTagDependency 
---@field name MetaEngineTagString 
---@field flags MetaEngineTagDataConditionalWidgetReferenceFlags 
---@field customControllerIndex MetaEngineIndex 

---@class MetaEngineTagDataChildWidgetReference 
---@field widgetTag MetaEngineTagDependency 
---@field name MetaEngineTagString 
---@field flags MetaEngineTagDataChildWidgetReferenceFlags 
---@field customControllerIndex MetaEngineIndex 
---@field verticalOffset integer 
---@field horizontalOffset integer 

---@class MetaEngineTagDataUiWidgetDefinition 
---@field widgetType EngineTagDataUIWidgetType 
---@field controllerIndex EngineTagDataUIControllerIndex 
---@field name MetaEngineTagString 
---@field bounds MetaEngineRectangle2D 
---@field flags MetaEngineTagDataUIWidgetDefinitionFlags 
---@field millisecondsToAutoClose integer 
---@field millisecondsAutoCloseFadeTime integer 
---@field backgroundBitmap MetaEngineTagDependency 
---@field gameDataInputs table<MetaEngineTagDataGameDataInputReference> 
---@field eventHandlers table<MetaEngineTagDataEventHandlerReference> 
---@field searchAndReplaceFunctions table<MetaEngineTagDataSearchAndReplaceReference> 
---@field textLabelUnicodeStringsList MetaEngineTagDependency 
---@field textFont MetaEngineTagDependency 
---@field textColor MetaEngineColorARGB 
---@field justification EngineTagDataUIJustification 
---@field flags_1 MetaEngineTagDataUIWidgetDefinitionFlags1 
---@field stringListIndex MetaEngineIndex 
---@field horizOffset integer 
---@field vertOffset integer 
---@field flags_2 MetaEngineTagDataUIWidgetDefinitionFlags2 
---@field listHeaderBitmap MetaEngineTagDependency 
---@field listFooterBitmap MetaEngineTagDependency 
---@field headerBounds MetaEngineRectangle2D 
---@field footerBounds MetaEngineRectangle2D 
---@field extendedDescriptionWidget MetaEngineTagDependency 
---@field conditionalWidgets table<MetaEngineTagDataConditionalWidgetReference> 
---@field childWidgets table<MetaEngineTagDataChildWidgetReference> 

---@class EngineTagDataEffectCreateInEnum : Enum 

---@class EngineTagDataEffectCreateInAnyEnvironment : EngineTagDataEffectCreateInEnum 
---@class EngineTagDataEffectCreateInAirOnly : EngineTagDataEffectCreateInEnum 
---@class EngineTagDataEffectCreateInWaterOnly : EngineTagDataEffectCreateInEnum 
---@class EngineTagDataEffectCreateInSpaceOnly : EngineTagDataEffectCreateInEnum 

---@alias EngineTagDataEffectCreateIn 
---| EngineTagDataEffectCreateInAnyEnvironment
---| EngineTagDataEffectCreateInAirOnly
---| EngineTagDataEffectCreateInWaterOnly
---| EngineTagDataEffectCreateInSpaceOnly

---@class EngineTagDataEffectCreateInTable 
---@field nAnyEnvironment EngineTagDataEffectCreateInAnyEnvironment
---@field nAirOnly EngineTagDataEffectCreateInAirOnly
---@field nWaterOnly EngineTagDataEffectCreateInWaterOnly
---@field nSpaceOnly EngineTagDataEffectCreateInSpaceOnly
Engine.tag.effectCreateIn = {} 

---@class EngineTagDataEffectViolenceModeEnum : Enum 

---@class EngineTagDataEffectViolenceModeEitherMode : EngineTagDataEffectViolenceModeEnum 
---@class EngineTagDataEffectViolenceModeViolentModeOnly : EngineTagDataEffectViolenceModeEnum 
---@class EngineTagDataEffectViolenceModeNonviolentModeOnly : EngineTagDataEffectViolenceModeEnum 

---@alias EngineTagDataEffectViolenceMode 
---| EngineTagDataEffectViolenceModeEitherMode
---| EngineTagDataEffectViolenceModeViolentModeOnly
---| EngineTagDataEffectViolenceModeNonviolentModeOnly

---@class EngineTagDataEffectViolenceModeTable 
---@field eEitherMode EngineTagDataEffectViolenceModeEitherMode
---@field eViolentModeOnly EngineTagDataEffectViolenceModeViolentModeOnly
---@field eNonviolentModeOnly EngineTagDataEffectViolenceModeNonviolentModeOnly
Engine.tag.effectViolenceMode = {} 

---@class EngineTagDataEffectCreateEnum : Enum 

---@class EngineTagDataEffectCreateIndependentOfCameraMode : EngineTagDataEffectCreateEnum 
---@class EngineTagDataEffectCreateOnlyInFirstPerson : EngineTagDataEffectCreateEnum 
---@class EngineTagDataEffectCreateOnlyInThirdPerson : EngineTagDataEffectCreateEnum 
---@class EngineTagDataEffectCreateInFirstPersonIfPossible : EngineTagDataEffectCreateEnum 

---@alias EngineTagDataEffectCreate 
---| EngineTagDataEffectCreateIndependentOfCameraMode
---| EngineTagDataEffectCreateOnlyInFirstPerson
---| EngineTagDataEffectCreateOnlyInThirdPerson
---| EngineTagDataEffectCreateInFirstPersonIfPossible

---@class EngineTagDataEffectCreateTable 
---@field independentOfCameraMode EngineTagDataEffectCreateIndependentOfCameraMode
---@field onlyInFirstPerson EngineTagDataEffectCreateOnlyInFirstPerson
---@field onlyInThirdPerson EngineTagDataEffectCreateOnlyInThirdPerson
---@field inFirstPersonIfPossible EngineTagDataEffectCreateInFirstPersonIfPossible
Engine.tag.effectCreate = {} 

---@class EngineTagDataEffectDistributionFunctionEnum : Enum 

---@class EngineTagDataEffectDistributionFunctionStart : EngineTagDataEffectDistributionFunctionEnum 
---@class EngineTagDataEffectDistributionFunctionEnd : EngineTagDataEffectDistributionFunctionEnum 
---@class EngineTagDataEffectDistributionFunctionConstant : EngineTagDataEffectDistributionFunctionEnum 
---@class EngineTagDataEffectDistributionFunctionBuildup : EngineTagDataEffectDistributionFunctionEnum 
---@class EngineTagDataEffectDistributionFunctionFalloff : EngineTagDataEffectDistributionFunctionEnum 
---@class EngineTagDataEffectDistributionFunctionBuildupAndFalloff : EngineTagDataEffectDistributionFunctionEnum 

---@alias EngineTagDataEffectDistributionFunction 
---| EngineTagDataEffectDistributionFunctionStart
---| EngineTagDataEffectDistributionFunctionEnd
---| EngineTagDataEffectDistributionFunctionConstant
---| EngineTagDataEffectDistributionFunctionBuildup
---| EngineTagDataEffectDistributionFunctionFalloff
---| EngineTagDataEffectDistributionFunctionBuildupAndFalloff

---@class EngineTagDataEffectDistributionFunctionTable 
---@field nStart EngineTagDataEffectDistributionFunctionStart
---@field nEnd EngineTagDataEffectDistributionFunctionEnd
---@field nConstant EngineTagDataEffectDistributionFunctionConstant
---@field nBuildup EngineTagDataEffectDistributionFunctionBuildup
---@field nFalloff EngineTagDataEffectDistributionFunctionFalloff
---@field nBuildupAndFalloff EngineTagDataEffectDistributionFunctionBuildupAndFalloff
Engine.tag.effectDistributionFunction = {} 

---@class MetaEngineTagDataEffectPartFlags 
---@field faceDownRegardlessOfLocationDecals boolean 
---@field unused boolean 
---@field makeEffectWork boolean 

---@class MetaEngineTagDataEffectPartScalesValues 
---@field velocity boolean 
---@field velocityDelta boolean 
---@field velocityConeAngle boolean 
---@field angularVelocity boolean 
---@field angularVelocityDelta boolean 
---@field typeSpecificScale boolean 

---@class MetaEngineTagDataEffectParticleFlags 
---@field stayAttachedToMarker boolean 
---@field randomInitialAngle boolean 
---@field tintFromObjectColor boolean 
---@field interpolateTintAsHsv boolean 
---@field acrossTheLongHuePath boolean 

---@class MetaEngineTagDataEffectParticleScalesValues 
---@field velocity boolean 
---@field velocityDelta boolean 
---@field velocityConeAngle boolean 
---@field angularVelocity boolean 
---@field angularVelocityDelta boolean 
---@field count boolean 
---@field countDelta boolean 
---@field distributionRadius boolean 
---@field distributionRadiusDelta boolean 
---@field particleRadius boolean 
---@field particleRadiusDelta boolean 
---@field tint boolean 

---@class MetaEngineTagDataEffectFlags 
---@field deletedWhenAttachmentDeactivates boolean 
---@field mustBeDeterministicXbox boolean 
---@field mustBeDeterministicPc boolean 
---@field disabledInAnniversaryByBloodSetting boolean 

---@class MetaEngineTagDataEffectLocation 
---@field markerName MetaEngineTagString 

---@class MetaEngineTagDataEffectPart 
---@field createIn EngineTagDataEffectCreateIn 
---@field violenceMode EngineTagDataEffectViolenceMode 
---@field location MetaEngineIndex 
---@field flags MetaEngineTagDataEffectPartFlags 
---@field typeClass integer 
---@field type MetaEngineTagDependency 
---@field velocityBounds number 
---@field velocityConeAngle MetaEngineAngle 
---@field angularVelocityBounds MetaEngineAngle 
---@field radiusModifierBounds number 
---@field aScalesValues MetaEngineTagDataEffectPartScalesValues 
---@field bScalesValues MetaEngineTagDataEffectPartScalesValues 

---@class MetaEngineTagDataEffectParticle 
---@field createIn EngineTagDataEffectCreateIn 
---@field violenceMode EngineTagDataEffectViolenceMode 
---@field create EngineTagDataEffectCreate 
---@field location MetaEngineIndex 
---@field relativeDirection MetaEngineEuler2D 
---@field relativeOffset MetaEnginePoint3D 
---@field relativeDirectionVector MetaEngineVector3D 
---@field particleType MetaEngineTagDependency 
---@field flags MetaEngineTagDataEffectParticleFlags 
---@field distributionFunction EngineTagDataEffectDistributionFunction 
---@field count integer 
---@field distributionRadius number 
---@field velocity number 
---@field velocityConeAngle MetaEngineAngle 
---@field angularVelocity MetaEngineAngle 
---@field radius number 
---@field tintLowerBound MetaEngineColorARGB 
---@field tintUpperBound MetaEngineColorARGB 
---@field aScalesValues MetaEngineTagDataEffectParticleScalesValues 
---@field bScalesValues MetaEngineTagDataEffectParticleScalesValues 

---@class MetaEngineTagDataEffectEvent 
---@field skipFraction MetaEngineFraction 
---@field delayBounds number 
---@field durationBounds number 
---@field parts table<MetaEngineTagDataEffectPart> 
---@field particles table<MetaEngineTagDataEffectParticle> 

---@class MetaEngineTagDataEffect 
---@field flags MetaEngineTagDataEffectFlags 
---@field loopStartEvent MetaEngineIndex 
---@field loopStopEvent MetaEngineIndex 
---@field maximumDamageRadius number 
---@field locations table<MetaEngineTagDataEffectLocation> 
---@field events table<MetaEngineTagDataEffectEvent> 

---@class EngineTagDataUnitHUDInterfacePanelTypeEnum : Enum 

---@class EngineTagDataUnitHUDInterfacePanelTypeIntegratedLight : EngineTagDataUnitHUDInterfacePanelTypeEnum 

---@alias EngineTagDataUnitHUDInterfacePanelType 
---| EngineTagDataUnitHUDInterfacePanelTypeIntegratedLight

---@class EngineTagDataUnitHUDInterfacePanelTypeTable 
---@field typeIntegratedLight EngineTagDataUnitHUDInterfacePanelTypeIntegratedLight
Engine.tag.unitHUDInterfacePanelType = {} 

---@class MetaEngineTagDataUnitHUDInterfaceAuxiliaryOverlayFlags 
---@field useTeamColor boolean 

---@class MetaEngineTagDataUnitHUDInterfaceHUDSoundLatchedTo 
---@field shieldRecharging boolean 
---@field shieldDamaged boolean 
---@field shieldLow boolean 
---@field shieldEmpty boolean 
---@field healthLow boolean 
---@field healthEmpty boolean 
---@field healthMinorDamage boolean 
---@field healthMajorDamage boolean 

---@class MetaEngineTagDataUnitHUDInterfaceAuxiliaryPanelMeterMoreFlags 
---@field showOnlyWhenActive boolean 
---@field flashOnceIfActivatedWhileDisabled boolean 

---@class MetaEngineTagDataUnitHUDInterfaceAuxiliaryOverlay 
---@field anchorOffset MetaEnginePoint2DInt 
---@field widthScale number 
---@field heightScale number 
---@field scalingFlags MetaEngineTagDataHUDInterfaceScalingFlags 
---@field interfaceBitmap MetaEngineTagDependency 
---@field defaultColor MetaEngineColorARGBInt 
---@field flashingColor MetaEngineColorARGBInt 
---@field flashPeriod number 
---@field flashDelay number 
---@field numberOfFlashes integer 
---@field flashFlags MetaEngineTagDataHUDInterfaceFlashFlags 
---@field flashLength number 
---@field disabledColor MetaEngineColorARGBInt 
---@field sequenceIndex MetaEngineIndex 
---@field multitexOverlay table<MetaEngineTagDataHUDInterfaceMultitextureOverlay> 
---@field type EngineTagDataUnitHUDInterfacePanelType 
---@field flags MetaEngineTagDataUnitHUDInterfaceAuxiliaryOverlayFlags 

---@class MetaEngineTagDataUnitHUDInterfaceHUDSound 
---@field sound MetaEngineTagDependency 
---@field latchedTo MetaEngineTagDataUnitHUDInterfaceHUDSoundLatchedTo 
---@field scale number 

---@class MetaEngineTagDataUnitHUDInterfaceAuxiliaryPanel 
---@field type EngineTagDataUnitHUDInterfacePanelType 
---@field backgroundAnchorOffset MetaEnginePoint2DInt 
---@field backgroundWidthScale number 
---@field backgroundHeightScale number 
---@field backgroundScalingFlags MetaEngineTagDataHUDInterfaceScalingFlags 
---@field backgroundInterfaceBitmap MetaEngineTagDependency 
---@field backgroundDefaultColor MetaEngineColorARGBInt 
---@field backgroundFlashingColor MetaEngineColorARGBInt 
---@field backgroundFlashPeriod number 
---@field backgroundFlashDelay number 
---@field backgroundNumberOfFlashes integer 
---@field backgroundFlashFlags MetaEngineTagDataHUDInterfaceFlashFlags 
---@field backgroundFlashLength number 
---@field backgroundDisabledColor MetaEngineColorARGBInt 
---@field backgroundSequenceIndex MetaEngineIndex 
---@field backgroundMultitexOverlay table<MetaEngineTagDataHUDInterfaceMultitextureOverlay> 
---@field meterAnchorOffset MetaEnginePoint2DInt 
---@field meterWidthScale number 
---@field meterHeightScale number 
---@field meterScalingFlags MetaEngineTagDataHUDInterfaceScalingFlags 
---@field meterMeterBitmap MetaEngineTagDependency 
---@field meterColorAtMeterMinimum MetaEngineColorARGBInt 
---@field meterColorAtMeterMaximum MetaEngineColorARGBInt 
---@field meterFlashColor MetaEngineColorARGBInt 
---@field meterEmptyColor MetaEngineColorARGBInt 
---@field meterFlags MetaEngineTagDataHUDInterfaceMeterFlags 
---@field meterMinimumMeterValue integer 
---@field meterSequenceIndex MetaEngineIndex 
---@field meterAlphaMultiplier integer 
---@field meterAlphaBias integer 
---@field meterValueScale integer 
---@field meterOpacity number 
---@field meterTranslucency number 
---@field meterDisabledColor MetaEngineColorARGBInt 
---@field meterMinAlpha number 
---@field meterMinimumFractionCutoff number 
---@field meterMoreFlags MetaEngineTagDataUnitHUDInterfaceAuxiliaryPanelMeterMoreFlags 

---@class MetaEngineTagDataUnitHudInterface 
---@field anchor EngineTagDataHUDInterfaceAnchor 
---@field hudBackgroundAnchorOffset MetaEnginePoint2DInt 
---@field hudBackgroundWidthScale number 
---@field hudBackgroundHeightScale number 
---@field hudBackgroundScalingFlags MetaEngineTagDataHUDInterfaceScalingFlags 
---@field hudBackgroundInterfaceBitmap MetaEngineTagDependency 
---@field hudBackgroundDefaultColor MetaEngineColorARGBInt 
---@field hudBackgroundFlashingColor MetaEngineColorARGBInt 
---@field hudBackgroundFlashPeriod number 
---@field hudBackgroundFlashDelay number 
---@field hudBackgroundNumberOfFlashes integer 
---@field hudBackgroundFlashFlags MetaEngineTagDataHUDInterfaceFlashFlags 
---@field hudBackgroundFlashLength number 
---@field hudBackgroundDisabledColor MetaEngineColorARGBInt 
---@field hudBackgroundSequenceIndex MetaEngineIndex 
---@field hudBackgroundMultitexOverlay table<MetaEngineTagDataHUDInterfaceMultitextureOverlay> 
---@field shieldPanelBackgroundAnchorOffset MetaEnginePoint2DInt 
---@field shieldPanelBackgroundWidthScale number 
---@field shieldPanelBackgroundHeightScale number 
---@field shieldPanelBackgroundScalingFlags MetaEngineTagDataHUDInterfaceScalingFlags 
---@field shieldPanelBackgroundInterfaceBitmap MetaEngineTagDependency 
---@field shieldPanelBackgroundDefaultColor MetaEngineColorARGBInt 
---@field shieldPanelBackgroundFlashingColor MetaEngineColorARGBInt 
---@field shieldPanelBackgroundFlashPeriod number 
---@field shieldPanelBackgroundFlashDelay number 
---@field shieldPanelBackgroundNumberOfFlashes integer 
---@field shieldPanelBackgroundFlashFlags MetaEngineTagDataHUDInterfaceFlashFlags 
---@field shieldPanelBackgroundFlashLength number 
---@field shieldPanelBackgroundDisabledColor MetaEngineColorARGBInt 
---@field shieldPanelBackgroundSequenceIndex MetaEngineIndex 
---@field shieldPanelBackgroundMultitexOverlay table<MetaEngineTagDataHUDInterfaceMultitextureOverlay> 
---@field shieldPanelMeterAnchorOffset MetaEnginePoint2DInt 
---@field shieldPanelMeterWidthScale number 
---@field shieldPanelMeterHeightScale number 
---@field shieldPanelMeterScalingFlags MetaEngineTagDataHUDInterfaceScalingFlags 
---@field shieldPanelMeterMeterBitmap MetaEngineTagDependency 
---@field shieldPanelMeterColorAtMeterMinimum MetaEngineColorARGBInt 
---@field shieldPanelMeterColorAtMeterMaximum MetaEngineColorARGBInt 
---@field shieldPanelMeterFlashColor MetaEngineColorARGBInt 
---@field shieldPanelMeterEmptyColor MetaEngineColorARGBInt 
---@field shieldPanelMeterFlags MetaEngineTagDataHUDInterfaceMeterFlags 
---@field shieldPanelMeterMinimumMeterValue integer 
---@field shieldPanelMeterSequenceIndex MetaEngineIndex 
---@field shieldPanelMeterAlphaMultiplier integer 
---@field shieldPanelMeterAlphaBias integer 
---@field shieldPanelMeterValueScale integer 
---@field shieldPanelMeterOpacity number 
---@field shieldPanelMeterTranslucency number 
---@field shieldPanelMeterDisabledColor MetaEngineColorARGBInt 
---@field shieldPanelMeterMinAlpha number 
---@field shieldPanelMeterOverchargeMinimumColor MetaEngineColorARGBInt 
---@field shieldPanelMeterOverchargeMaximumColor MetaEngineColorARGBInt 
---@field shieldPanelMeterOverchargeFlashColor MetaEngineColorARGBInt 
---@field shieldPanelMeterOverchargeEmptyColor MetaEngineColorARGBInt 
---@field healthPanelBackgroundAnchorOffset MetaEnginePoint2DInt 
---@field healthPanelBackgroundWidthScale number 
---@field healthPanelBackgroundHeightScale number 
---@field healthPanelBackgroundScalingFlags MetaEngineTagDataHUDInterfaceScalingFlags 
---@field healthPanelBackgroundInterfaceBitmap MetaEngineTagDependency 
---@field healthPanelBackgroundDefaultColor MetaEngineColorARGBInt 
---@field healthPanelBackgroundFlashingColor MetaEngineColorARGBInt 
---@field healthPanelBackgroundFlashPeriod number 
---@field healthPanelBackgroundFlashDelay number 
---@field healthPanelBackgroundNumberOfFlashes integer 
---@field healthPanelBackgroundFlashFlags MetaEngineTagDataHUDInterfaceFlashFlags 
---@field healthPanelBackgroundFlashLength number 
---@field healthPanelBackgroundDisabledColor MetaEngineColorARGBInt 
---@field healthPanelBackgroundSequenceIndex MetaEngineIndex 
---@field healthPanelBackgroundMultitexOverlay table<MetaEngineTagDataHUDInterfaceMultitextureOverlay> 
---@field healthPanelMeterAnchorOffset MetaEnginePoint2DInt 
---@field healthPanelMeterWidthScale number 
---@field healthPanelMeterHeightScale number 
---@field healthPanelMeterScalingFlags MetaEngineTagDataHUDInterfaceScalingFlags 
---@field healthPanelMeterMeterBitmap MetaEngineTagDependency 
---@field healthPanelMeterColorAtMeterMinimum MetaEngineColorARGBInt 
---@field healthPanelMeterColorAtMeterMaximum MetaEngineColorARGBInt 
---@field healthPanelMeterFlashColor MetaEngineColorARGBInt 
---@field healthPanelMeterEmptyColor MetaEngineColorARGBInt 
---@field healthPanelMeterFlags MetaEngineTagDataHUDInterfaceMeterFlags 
---@field healthPanelMeterMinimumMeterValue integer 
---@field healthPanelMeterSequenceIndex MetaEngineIndex 
---@field healthPanelMeterAlphaMultiplier integer 
---@field healthPanelMeterAlphaBias integer 
---@field healthPanelMeterValueScale integer 
---@field healthPanelMeterOpacity number 
---@field healthPanelMeterTranslucency number 
---@field healthPanelMeterDisabledColor MetaEngineColorARGBInt 
---@field healthPanelMeterMinAlpha number 
---@field healthPanelMeterMediumHealthLeftColor MetaEngineColorARGBInt 
---@field healthPanelMeterMaxColorHealthFractionCutoff number 
---@field healthPanelMeterMinColorHealthFractionCutoff number 
---@field motionSensorBackgroundAnchorOffset MetaEnginePoint2DInt 
---@field motionSensorBackgroundWidthScale number 
---@field motionSensorBackgroundHeightScale number 
---@field motionSensorBackgroundScalingFlags MetaEngineTagDataHUDInterfaceScalingFlags 
---@field motionSensorBackgroundInterfaceBitmap MetaEngineTagDependency 
---@field motionSensorBackgroundDefaultColor MetaEngineColorARGBInt 
---@field motionSensorBackgroundFlashingColor MetaEngineColorARGBInt 
---@field motionSensorBackgroundFlashPeriod number 
---@field motionSensorBackgroundFlashDelay number 
---@field motionSensorBackgroundNumberOfFlashes integer 
---@field motionSensorBackgroundFlashFlags MetaEngineTagDataHUDInterfaceFlashFlags 
---@field motionSensorBackgroundFlashLength number 
---@field motionSensorBackgroundDisabledColor MetaEngineColorARGBInt 
---@field motionSensorBackgroundSequenceIndex MetaEngineIndex 
---@field motionSensorBackgroundMultitexOverlays table<MetaEngineTagDataHUDInterfaceMultitextureOverlay> 
---@field motionSensorForegroundAnchorOffset MetaEnginePoint2DInt 
---@field motionSensorForegroundWidthScale number 
---@field motionSensorForegroundHeightScale number 
---@field motionSensorForegroundScalingFlags MetaEngineTagDataHUDInterfaceScalingFlags 
---@field motionSensorForegroundInterfaceBitmap MetaEngineTagDependency 
---@field motionSensorForegroundDefaultColor MetaEngineColorARGBInt 
---@field motionSensorForegroundFlashingColor MetaEngineColorARGBInt 
---@field motionSensorForegroundFlashPeriod number 
---@field motionSensorForegroundFlashDelay number 
---@field motionSensorForegroundNumberOfFlashes integer 
---@field motionSensorForegroundFlashFlags MetaEngineTagDataHUDInterfaceFlashFlags 
---@field motionSensorForegroundFlashLength number 
---@field motionSensorForegroundDisabledColor MetaEngineColorARGBInt 
---@field motionSensorForegroundSequenceIndex MetaEngineIndex 
---@field motionSensorForegroundMultitexOverlays table<MetaEngineTagDataHUDInterfaceMultitextureOverlay> 
---@field motionSensorCenterAnchorOffset MetaEnginePoint2DInt 
---@field motionSensorCenterWidthScale number 
---@field motionSensorCenterHeightScale number 
---@field motionSensorCenterScalingFlags MetaEngineTagDataHUDInterfaceScalingFlags 
---@field auxiliaryOverlayAnchor EngineTagDataHUDInterfaceAnchor 
---@field overlays table<MetaEngineTagDataUnitHUDInterfaceAuxiliaryOverlay> 
---@field sounds table<MetaEngineTagDataUnitHUDInterfaceHUDSound> 
---@field meters table<MetaEngineTagDataUnitHUDInterfaceAuxiliaryPanel> 

---@class MetaEngineTagDataSoundLoopingTrackFlags 
---@field fadeInAtStart boolean 
---@field fadeOutAtStop boolean 
---@field fadeInAlternate boolean 

---@class MetaEngineTagDataSoundLoopingDetailFlags 
---@field dontPlayWithAlternate boolean 
---@field dontPlayWithoutAlternate boolean 

---@class MetaEngineTagDataSoundLoopingFlags 
---@field deafeningToAis boolean 
---@field notALoop boolean 
---@field stopsMusic boolean 
---@field siegeOfMadrigal boolean 

---@class MetaEngineTagDataSoundLoopingTrack 
---@field flags MetaEngineTagDataSoundLoopingTrackFlags 
---@field gain MetaEngineFraction 
---@field fadeInDuration number 
---@field fadeOutDuration number 
---@field start MetaEngineTagDependency 
---@field loop MetaEngineTagDependency 
---@field end MetaEngineTagDependency 
---@field alternateLoop MetaEngineTagDependency 
---@field alternateEnd MetaEngineTagDependency 

---@class MetaEngineTagDataSoundLoopingDetail 
---@field sound MetaEngineTagDependency 
---@field randomPeriodBounds number 
---@field gain MetaEngineFraction 
---@field flags MetaEngineTagDataSoundLoopingDetailFlags 
---@field yawBounds MetaEngineAngle 
---@field pitchBounds MetaEngineAngle 
---@field distanceBounds number 

---@class MetaEngineTagDataSoundLooping 
---@field flags MetaEngineTagDataSoundLoopingFlags 
---@field zeroDetailSoundPeriod number 
---@field zeroDetailUnknownFloats number 
---@field oneDetailSoundPeriod number 
---@field oneDetailUnknownFloats number 
---@field unknownInt integer 
---@field maximumDistance number 
---@field continuousDamageEffect MetaEngineTagDependency 
---@field tracks table<MetaEngineTagDataSoundLoopingTrack> 
---@field detailSounds table<MetaEngineTagDataSoundLoopingDetail> 

---@class EngineTagDataMachineTypeEnum : Enum 

---@class EngineTagDataMachineTypeDoor : EngineTagDataMachineTypeEnum 
---@class EngineTagDataMachineTypePlatform : EngineTagDataMachineTypeEnum 
---@class EngineTagDataMachineTypeGear : EngineTagDataMachineTypeEnum 

---@alias EngineTagDataMachineType 
---| EngineTagDataMachineTypeDoor
---| EngineTagDataMachineTypePlatform
---| EngineTagDataMachineTypeGear

---@class EngineTagDataMachineTypeTable 
---@field door EngineTagDataMachineTypeDoor
---@field platform EngineTagDataMachineTypePlatform
---@field gear EngineTagDataMachineTypeGear
Engine.tag.machineType = {} 

---@class EngineTagDataMachineCollisionResponseEnum : Enum 

---@class EngineTagDataMachineCollisionResponsePauseUntilCrushed : EngineTagDataMachineCollisionResponseEnum 
---@class EngineTagDataMachineCollisionResponseReverseDirections : EngineTagDataMachineCollisionResponseEnum 

---@alias EngineTagDataMachineCollisionResponse 
---| EngineTagDataMachineCollisionResponsePauseUntilCrushed
---| EngineTagDataMachineCollisionResponseReverseDirections

---@class EngineTagDataMachineCollisionResponseTable 
---@field ePauseUntilCrushed EngineTagDataMachineCollisionResponsePauseUntilCrushed
---@field eReverseDirections EngineTagDataMachineCollisionResponseReverseDirections
Engine.tag.machineCollisionResponse = {} 

---@class MetaEngineTagDataMachineFlags 
---@field pathfindingObstacle boolean 
---@field butNotWhenOpen boolean 
---@field elevator boolean 

---@class MetaEngineTagDataDeviceMachine: MetaEngineTagDataDevice  
---@field machineType EngineTagDataMachineType 
---@field machineFlags MetaEngineTagDataMachineFlags 
---@field doorOpenTime number 
---@field collisionResponse EngineTagDataMachineCollisionResponse 
---@field elevatorNode MetaEngineIndex 
---@field doorOpenTimeTicks integer 

---@class MetaEngineTagDataIsUnusedFlag 
---@field unused boolean 

---@class MetaEngineTagDataIsUnfilteredFlag 
---@field unfiltered boolean 

---@class MetaEngineTagDataColorInterpolationFlags 
---@field blendInHsv boolean 
---@field moreColors boolean 

---@class MetaEngineTagDataWind 
---@field velocity number 
---@field variationArea MetaEngineEuler2D 
---@field localVariationWeight number 
---@field localVariationRate number 
---@field damping number 

---@class MetaEngineTagDataHudNumber 
---@field digitsBitmap MetaEngineTagDependency 
---@field bitmapDigitWidth integer 
---@field screenDigitWidth integer 
---@field xOffset integer 
---@field yOffset integer 
---@field decimalPointWidth integer 
---@field colonWidth integer 

---@class EngineTagDataWeaponHUDInterfaceStateAttachedToEnum : Enum 

---@class EngineTagDataWeaponHUDInterfaceStateAttachedToTotalAmmo : EngineTagDataWeaponHUDInterfaceStateAttachedToEnum 
---@class EngineTagDataWeaponHUDInterfaceStateAttachedToLoadedAmmo : EngineTagDataWeaponHUDInterfaceStateAttachedToEnum 
---@class EngineTagDataWeaponHUDInterfaceStateAttachedToHeat : EngineTagDataWeaponHUDInterfaceStateAttachedToEnum 
---@class EngineTagDataWeaponHUDInterfaceStateAttachedToAge : EngineTagDataWeaponHUDInterfaceStateAttachedToEnum 
---@class EngineTagDataWeaponHUDInterfaceStateAttachedToSecondaryWeaponTotalAmmo : EngineTagDataWeaponHUDInterfaceStateAttachedToEnum 
---@class EngineTagDataWeaponHUDInterfaceStateAttachedToSecondaryWeaponLoadedAmmo : EngineTagDataWeaponHUDInterfaceStateAttachedToEnum 
---@class EngineTagDataWeaponHUDInterfaceStateAttachedToDistanceToTarget : EngineTagDataWeaponHUDInterfaceStateAttachedToEnum 
---@class EngineTagDataWeaponHUDInterfaceStateAttachedToElevationToTarget : EngineTagDataWeaponHUDInterfaceStateAttachedToEnum 

---@alias EngineTagDataWeaponHUDInterfaceStateAttachedTo 
---| EngineTagDataWeaponHUDInterfaceStateAttachedToTotalAmmo
---| EngineTagDataWeaponHUDInterfaceStateAttachedToLoadedAmmo
---| EngineTagDataWeaponHUDInterfaceStateAttachedToHeat
---| EngineTagDataWeaponHUDInterfaceStateAttachedToAge
---| EngineTagDataWeaponHUDInterfaceStateAttachedToSecondaryWeaponTotalAmmo
---| EngineTagDataWeaponHUDInterfaceStateAttachedToSecondaryWeaponLoadedAmmo
---| EngineTagDataWeaponHUDInterfaceStateAttachedToDistanceToTarget
---| EngineTagDataWeaponHUDInterfaceStateAttachedToElevationToTarget

---@class EngineTagDataWeaponHUDInterfaceStateAttachedToTable 
---@field hedToTotalAmmo EngineTagDataWeaponHUDInterfaceStateAttachedToTotalAmmo
---@field hedToLoadedAmmo EngineTagDataWeaponHUDInterfaceStateAttachedToLoadedAmmo
---@field hedToHeat EngineTagDataWeaponHUDInterfaceStateAttachedToHeat
---@field hedToAge EngineTagDataWeaponHUDInterfaceStateAttachedToAge
---@field hedToSecondaryWeaponTotalAmmo EngineTagDataWeaponHUDInterfaceStateAttachedToSecondaryWeaponTotalAmmo
---@field hedToSecondaryWeaponLoadedAmmo EngineTagDataWeaponHUDInterfaceStateAttachedToSecondaryWeaponLoadedAmmo
---@field hedToDistanceToTarget EngineTagDataWeaponHUDInterfaceStateAttachedToDistanceToTarget
---@field hedToElevationToTarget EngineTagDataWeaponHUDInterfaceStateAttachedToElevationToTarget
Engine.tag.weaponHUDInterfaceStateAttachedTo = {} 

---@class EngineTagDataWeaponHUDInterfaceViewTypeEnum : Enum 

---@class EngineTagDataWeaponHUDInterfaceViewTypeAny : EngineTagDataWeaponHUDInterfaceViewTypeEnum 
---@class EngineTagDataWeaponHUDInterfaceViewTypeFullscreen : EngineTagDataWeaponHUDInterfaceViewTypeEnum 
---@class EngineTagDataWeaponHUDInterfaceViewTypeSplitscreen : EngineTagDataWeaponHUDInterfaceViewTypeEnum 

---@alias EngineTagDataWeaponHUDInterfaceViewType 
---| EngineTagDataWeaponHUDInterfaceViewTypeAny
---| EngineTagDataWeaponHUDInterfaceViewTypeFullscreen
---| EngineTagDataWeaponHUDInterfaceViewTypeSplitscreen

---@class EngineTagDataWeaponHUDInterfaceViewTypeTable 
---@field typeAny EngineTagDataWeaponHUDInterfaceViewTypeAny
---@field typeFullscreen EngineTagDataWeaponHUDInterfaceViewTypeFullscreen
---@field typeSplitscreen EngineTagDataWeaponHUDInterfaceViewTypeSplitscreen
Engine.tag.weaponHUDInterfaceViewType = {} 

---@class EngineTagDataWeaponHUDInterfaceCrosshairTypeEnum : Enum 

---@class EngineTagDataWeaponHUDInterfaceCrosshairTypeAim : EngineTagDataWeaponHUDInterfaceCrosshairTypeEnum 
---@class EngineTagDataWeaponHUDInterfaceCrosshairTypeZoomOverlay : EngineTagDataWeaponHUDInterfaceCrosshairTypeEnum 
---@class EngineTagDataWeaponHUDInterfaceCrosshairTypeCharge : EngineTagDataWeaponHUDInterfaceCrosshairTypeEnum 
---@class EngineTagDataWeaponHUDInterfaceCrosshairTypeShouldReload : EngineTagDataWeaponHUDInterfaceCrosshairTypeEnum 
---@class EngineTagDataWeaponHUDInterfaceCrosshairTypeFlashHeat : EngineTagDataWeaponHUDInterfaceCrosshairTypeEnum 
---@class EngineTagDataWeaponHUDInterfaceCrosshairTypeFlashTotalAmmo : EngineTagDataWeaponHUDInterfaceCrosshairTypeEnum 
---@class EngineTagDataWeaponHUDInterfaceCrosshairTypeFlashBattery : EngineTagDataWeaponHUDInterfaceCrosshairTypeEnum 
---@class EngineTagDataWeaponHUDInterfaceCrosshairTypeReloadOverheat : EngineTagDataWeaponHUDInterfaceCrosshairTypeEnum 
---@class EngineTagDataWeaponHUDInterfaceCrosshairTypeFlashWhenFiringAndNoAmmo : EngineTagDataWeaponHUDInterfaceCrosshairTypeEnum 
---@class EngineTagDataWeaponHUDInterfaceCrosshairTypeFlashWhenThrowingAndNoGrenade : EngineTagDataWeaponHUDInterfaceCrosshairTypeEnum 
---@class EngineTagDataWeaponHUDInterfaceCrosshairTypeLowAmmoAndNoneLeftToReload : EngineTagDataWeaponHUDInterfaceCrosshairTypeEnum 
---@class EngineTagDataWeaponHUDInterfaceCrosshairTypeShouldReloadSecondaryTrigger : EngineTagDataWeaponHUDInterfaceCrosshairTypeEnum 
---@class EngineTagDataWeaponHUDInterfaceCrosshairTypeFlashSecondaryTotalAmmo : EngineTagDataWeaponHUDInterfaceCrosshairTypeEnum 
---@class EngineTagDataWeaponHUDInterfaceCrosshairTypeFlashSecondaryReload : EngineTagDataWeaponHUDInterfaceCrosshairTypeEnum 
---@class EngineTagDataWeaponHUDInterfaceCrosshairTypeFlashWhenFiringSecondaryTriggerWithNoAmmo : EngineTagDataWeaponHUDInterfaceCrosshairTypeEnum 
---@class EngineTagDataWeaponHUDInterfaceCrosshairTypeLowSecondaryAmmoAndNoneLeftToReload : EngineTagDataWeaponHUDInterfaceCrosshairTypeEnum 
---@class EngineTagDataWeaponHUDInterfaceCrosshairTypePrimaryTriggerReady : EngineTagDataWeaponHUDInterfaceCrosshairTypeEnum 
---@class EngineTagDataWeaponHUDInterfaceCrosshairTypeSecondaryTriggerReady : EngineTagDataWeaponHUDInterfaceCrosshairTypeEnum 
---@class EngineTagDataWeaponHUDInterfaceCrosshairTypeFlashWhenFiringWithDepletedBattery : EngineTagDataWeaponHUDInterfaceCrosshairTypeEnum 

---@alias EngineTagDataWeaponHUDInterfaceCrosshairType 
---| EngineTagDataWeaponHUDInterfaceCrosshairTypeAim
---| EngineTagDataWeaponHUDInterfaceCrosshairTypeZoomOverlay
---| EngineTagDataWeaponHUDInterfaceCrosshairTypeCharge
---| EngineTagDataWeaponHUDInterfaceCrosshairTypeShouldReload
---| EngineTagDataWeaponHUDInterfaceCrosshairTypeFlashHeat
---| EngineTagDataWeaponHUDInterfaceCrosshairTypeFlashTotalAmmo
---| EngineTagDataWeaponHUDInterfaceCrosshairTypeFlashBattery
---| EngineTagDataWeaponHUDInterfaceCrosshairTypeReloadOverheat
---| EngineTagDataWeaponHUDInterfaceCrosshairTypeFlashWhenFiringAndNoAmmo
---| EngineTagDataWeaponHUDInterfaceCrosshairTypeFlashWhenThrowingAndNoGrenade
---| EngineTagDataWeaponHUDInterfaceCrosshairTypeLowAmmoAndNoneLeftToReload
---| EngineTagDataWeaponHUDInterfaceCrosshairTypeShouldReloadSecondaryTrigger
---| EngineTagDataWeaponHUDInterfaceCrosshairTypeFlashSecondaryTotalAmmo
---| EngineTagDataWeaponHUDInterfaceCrosshairTypeFlashSecondaryReload
---| EngineTagDataWeaponHUDInterfaceCrosshairTypeFlashWhenFiringSecondaryTriggerWithNoAmmo
---| EngineTagDataWeaponHUDInterfaceCrosshairTypeLowSecondaryAmmoAndNoneLeftToReload
---| EngineTagDataWeaponHUDInterfaceCrosshairTypePrimaryTriggerReady
---| EngineTagDataWeaponHUDInterfaceCrosshairTypeSecondaryTriggerReady
---| EngineTagDataWeaponHUDInterfaceCrosshairTypeFlashWhenFiringWithDepletedBattery

---@class EngineTagDataWeaponHUDInterfaceCrosshairTypeTable 
---@field typeAim EngineTagDataWeaponHUDInterfaceCrosshairTypeAim
---@field typeZoomOverlay EngineTagDataWeaponHUDInterfaceCrosshairTypeZoomOverlay
---@field typeCharge EngineTagDataWeaponHUDInterfaceCrosshairTypeCharge
---@field typeShouldReload EngineTagDataWeaponHUDInterfaceCrosshairTypeShouldReload
---@field typeFlashHeat EngineTagDataWeaponHUDInterfaceCrosshairTypeFlashHeat
---@field typeFlashTotalAmmo EngineTagDataWeaponHUDInterfaceCrosshairTypeFlashTotalAmmo
---@field typeFlashBattery EngineTagDataWeaponHUDInterfaceCrosshairTypeFlashBattery
---@field typeReloadOverheat EngineTagDataWeaponHUDInterfaceCrosshairTypeReloadOverheat
---@field typeFlashWhenFiringAndNoAmmo EngineTagDataWeaponHUDInterfaceCrosshairTypeFlashWhenFiringAndNoAmmo
---@field typeFlashWhenThrowingAndNoGrenade EngineTagDataWeaponHUDInterfaceCrosshairTypeFlashWhenThrowingAndNoGrenade
---@field typeLowAmmoAndNoneLeftToReload EngineTagDataWeaponHUDInterfaceCrosshairTypeLowAmmoAndNoneLeftToReload
---@field typeShouldReloadSecondaryTrigger EngineTagDataWeaponHUDInterfaceCrosshairTypeShouldReloadSecondaryTrigger
---@field typeFlashSecondaryTotalAmmo EngineTagDataWeaponHUDInterfaceCrosshairTypeFlashSecondaryTotalAmmo
---@field typeFlashSecondaryReload EngineTagDataWeaponHUDInterfaceCrosshairTypeFlashSecondaryReload
---@field typeFlashWhenFiringSecondaryTriggerWithNoAmmo EngineTagDataWeaponHUDInterfaceCrosshairTypeFlashWhenFiringSecondaryTriggerWithNoAmmo
---@field typeLowSecondaryAmmoAndNoneLeftToReload EngineTagDataWeaponHUDInterfaceCrosshairTypeLowSecondaryAmmoAndNoneLeftToReload
---@field typePrimaryTriggerReady EngineTagDataWeaponHUDInterfaceCrosshairTypePrimaryTriggerReady
---@field typeSecondaryTriggerReady EngineTagDataWeaponHUDInterfaceCrosshairTypeSecondaryTriggerReady
---@field typeFlashWhenFiringWithDepletedBattery EngineTagDataWeaponHUDInterfaceCrosshairTypeFlashWhenFiringWithDepletedBattery
Engine.tag.weaponHUDInterfaceCrosshairType = {} 

---@class MetaEngineTagDataWeaponHUDInterfaceCrosshairTypeFlags 
---@field aim boolean 
---@field zoomOverlay boolean 
---@field charge boolean 
---@field shouldReload boolean 
---@field flashHeat boolean 
---@field flashTotalAmmo boolean 
---@field flashBattery boolean 
---@field reloadOverheat boolean 
---@field flashWhenFiringAndNoAmmo boolean 
---@field flashWhenThrowingAndNoGrenade boolean 
---@field lowAmmoAndNoneLeftToReload boolean 
---@field shouldReloadSecondaryTrigger boolean 
---@field flashSecondaryTotalAmmo boolean 
---@field flashSecondaryReload boolean 
---@field flashWhenFiringSecondaryTriggerWithNoAmmo boolean 
---@field lowSecondaryAmmoAndNoneLeftToReload boolean 
---@field primaryTriggerReady boolean 
---@field secondaryTriggerReady boolean 
---@field flashWhenFiringWithDepletedBattery boolean 

---@class MetaEngineTagDataWeaponHUDInterfaceNumberWeaponSpecificFlags 
---@field divideNumberByClipSize boolean 

---@class MetaEngineTagDataWeaponHUDInterfaceCrosshairOverlayFlags 
---@field flashesWhenActive boolean 
---@field notASprite boolean 
---@field showOnlyWhenZoomed boolean 
---@field showSniperData boolean 
---@field hideAreaOutsideReticle boolean 
---@field oneZoomLevel boolean 
---@field dontShowWhenZoomed boolean 

---@class MetaEngineTagDataWeaponHUDInterfaceOverlayType 
---@field showOnFlashing boolean 
---@field showOnEmpty boolean 
---@field showOnReloadOverheating boolean 
---@field showOnDefault boolean 
---@field showAlways boolean 

---@class MetaEngineTagDataWeaponHUDInterfaceScreenEffectDefinitionMaskFlags 
---@field onlyWhenZoomed boolean 

---@class MetaEngineTagDataWeaponHUDInterfaceScreenEffectDefinitionNightVisionFlags 
---@field onlyWhenZoomed boolean 
---@field connectToFlashlight boolean 
---@field masked boolean 

---@class MetaEngineTagDataWeaponHUDInterfaceScreenEffectDefinitionDesaturationFlags 
---@field onlyWhenZoomed boolean 
---@field connectToFlashlight boolean 
---@field additive boolean 
---@field masked boolean 

---@class MetaEngineTagDataWeaponHUDInterfaceFlags 
---@field useParentHudFlashingParameters boolean 

---@class MetaEngineTagDataWeaponHUDInterfaceStaticElement 
---@field stateAttachedTo EngineTagDataWeaponHUDInterfaceStateAttachedTo 
---@field allowedViewType EngineTagDataWeaponHUDInterfaceViewType 
---@field anchor EngineTagDataHUDInterfaceChildAnchor 
---@field anchorOffset MetaEnginePoint2DInt 
---@field widthScale number 
---@field heightScale number 
---@field scalingFlags MetaEngineTagDataHUDInterfaceScalingFlags 
---@field interfaceBitmap MetaEngineTagDependency 
---@field defaultColor MetaEngineColorARGBInt 
---@field flashingColor MetaEngineColorARGBInt 
---@field flashPeriod number 
---@field flashDelay number 
---@field numberOfFlashes integer 
---@field flashFlags MetaEngineTagDataHUDInterfaceFlashFlags 
---@field flashLength number 
---@field disabledColor MetaEngineColorARGBInt 
---@field sequenceIndex MetaEngineIndex 
---@field multitextureOverlays table<MetaEngineTagDataHUDInterfaceMultitextureOverlay> 

---@class MetaEngineTagDataWeaponHUDInterfaceMeter 
---@field stateAttachedTo EngineTagDataWeaponHUDInterfaceStateAttachedTo 
---@field allowedViewType EngineTagDataWeaponHUDInterfaceViewType 
---@field anchor EngineTagDataHUDInterfaceChildAnchor 
---@field anchorOffset MetaEnginePoint2DInt 
---@field widthScale number 
---@field heightScale number 
---@field scalingFlags MetaEngineTagDataHUDInterfaceScalingFlags 
---@field meterBitmap MetaEngineTagDependency 
---@field colorAtMeterMinimum MetaEngineColorARGBInt 
---@field colorAtMeterMaximum MetaEngineColorARGBInt 
---@field flashColor MetaEngineColorARGBInt 
---@field emptyColor MetaEngineColorARGBInt 
---@field flags MetaEngineTagDataHUDInterfaceMeterFlags 
---@field minimumMeterValue integer 
---@field sequenceIndex MetaEngineIndex 
---@field alphaMultiplier integer 
---@field alphaBias integer 
---@field valueScale integer 
---@field opacity number 
---@field translucency number 
---@field disabledColor MetaEngineColorARGBInt 
---@field minAlpha number 

---@class MetaEngineTagDataWeaponHUDInterfaceNumber 
---@field stateAttachedTo EngineTagDataWeaponHUDInterfaceStateAttachedTo 
---@field allowedViewType EngineTagDataWeaponHUDInterfaceViewType 
---@field anchor EngineTagDataHUDInterfaceChildAnchor 
---@field anchorOffset MetaEnginePoint2DInt 
---@field widthScale number 
---@field heightScale number 
---@field scalingFlags MetaEngineTagDataHUDInterfaceScalingFlags 
---@field defaultColor MetaEngineColorARGBInt 
---@field flashingColor MetaEngineColorARGBInt 
---@field flashPeriod number 
---@field flashDelay number 
---@field numberOfFlashes integer 
---@field flashFlags MetaEngineTagDataHUDInterfaceFlashFlags 
---@field flashLength number 
---@field disabledColor MetaEngineColorARGBInt 
---@field maximumNumberOfDigits integer 
---@field flags MetaEngineTagDataHUDInterfaceNumberFlags 
---@field numberOfFractionalDigits integer 
---@field weaponSpecificFlags MetaEngineTagDataWeaponHUDInterfaceNumberWeaponSpecificFlags 

---@class MetaEngineTagDataWeaponHUDInterfaceCrosshairOverlay 
---@field anchorOffset MetaEnginePoint2DInt 
---@field widthScale number 
---@field heightScale number 
---@field scalingFlags MetaEngineTagDataHUDInterfaceScalingFlags 
---@field defaultColor MetaEngineColorARGBInt 
---@field flashingColor MetaEngineColorARGBInt 
---@field flashPeriod number 
---@field flashDelay number 
---@field numberOfFlashes integer 
---@field flashFlags MetaEngineTagDataHUDInterfaceFlashFlags 
---@field flashLength number 
---@field disabledColor MetaEngineColorARGBInt 
---@field frameRate integer 
---@field sequenceIndex MetaEngineIndex 
---@field flags MetaEngineTagDataWeaponHUDInterfaceCrosshairOverlayFlags 

---@class MetaEngineTagDataWeaponHUDInterfaceCrosshair 
---@field crosshairType EngineTagDataWeaponHUDInterfaceCrosshairType 
---@field allowedViewType EngineTagDataWeaponHUDInterfaceViewType 
---@field crosshairBitmap MetaEngineTagDependency 
---@field crosshairOverlays table<MetaEngineTagDataWeaponHUDInterfaceCrosshairOverlay> 

---@class MetaEngineTagDataWeaponHUDInterfaceOverlay 
---@field anchorOffset MetaEnginePoint2DInt 
---@field widthScale number 
---@field heightScale number 
---@field scalingFlags MetaEngineTagDataHUDInterfaceScalingFlags 
---@field defaultColor MetaEngineColorARGBInt 
---@field flashingColor MetaEngineColorARGBInt 
---@field flashPeriod number 
---@field flashDelay number 
---@field numberOfFlashes integer 
---@field flashFlags MetaEngineTagDataHUDInterfaceFlashFlags 
---@field flashLength number 
---@field disabledColor MetaEngineColorARGBInt 
---@field frameRate integer 
---@field sequenceIndex MetaEngineIndex 
---@field type MetaEngineTagDataWeaponHUDInterfaceOverlayType 
---@field flags MetaEngineTagDataHUDInterfaceOverlayFlashFlags 

---@class MetaEngineTagDataWeaponHUDInterfaceOverlayElement 
---@field stateAttachedTo EngineTagDataWeaponHUDInterfaceStateAttachedTo 
---@field allowedViewType EngineTagDataWeaponHUDInterfaceViewType 
---@field anchor EngineTagDataHUDInterfaceChildAnchor 
---@field overlayBitmap MetaEngineTagDependency 
---@field overlays table<MetaEngineTagDataWeaponHUDInterfaceOverlay> 

---@class MetaEngineTagDataWeaponHUDInterfaceScreenEffect 
---@field maskFlags MetaEngineTagDataWeaponHUDInterfaceScreenEffectDefinitionMaskFlags 
---@field maskFullscreen MetaEngineTagDependency 
---@field maskSplitscreen MetaEngineTagDependency 
---@field convolutionFlags MetaEngineTagDataWeaponHUDInterfaceScreenEffectDefinitionMaskFlags 
---@field convolutionFovInBounds MetaEngineAngle 
---@field convolutionRadiusOutBounds number 
---@field evenMoreFlags MetaEngineTagDataWeaponHUDInterfaceScreenEffectDefinitionNightVisionFlags 
---@field nightVisionScriptSource integer 
---@field nightVisionIntensity MetaEngineFraction 
---@field desaturationFlags MetaEngineTagDataWeaponHUDInterfaceScreenEffectDefinitionDesaturationFlags 
---@field desaturationScriptSource integer 
---@field desaturationIntensity MetaEngineFraction 
---@field effectTint MetaEngineColorRGB 

---@class MetaEngineTagDataWeaponHudInterface 
---@field childHud MetaEngineTagDependency 
---@field flags MetaEngineTagDataWeaponHUDInterfaceFlags 
---@field totalAmmoCutoff integer 
---@field loadedAmmoCutoff integer 
---@field heatCutoff integer 
---@field ageCutoff integer 
---@field anchor EngineTagDataHUDInterfaceAnchor 
---@field staticElements table<MetaEngineTagDataWeaponHUDInterfaceStaticElement> 
---@field meterElements table<MetaEngineTagDataWeaponHUDInterfaceMeter> 
---@field numberElements table<MetaEngineTagDataWeaponHUDInterfaceNumber> 
---@field crosshairs table<MetaEngineTagDataWeaponHUDInterfaceCrosshair> 
---@field overlayElements table<MetaEngineTagDataWeaponHUDInterfaceOverlayElement> 
---@field crosshairTypes MetaEngineTagDataWeaponHUDInterfaceCrosshairTypeFlags 
---@field screenEffect table<MetaEngineTagDataWeaponHUDInterfaceScreenEffect> 
---@field sequenceIndex MetaEngineIndex 
---@field widthOffset integer 
---@field offsetFromReferenceCorner MetaEnginePoint2DInt 
---@field overrideIconColor MetaEngineColorARGBInt 
---@field frameRate integer 
---@field moreFlags MetaEngineTagDataHUDInterfaceMessagingFlags 
---@field textIndex MetaEngineIndex 

---@class EngineTagDataWeaponSecondaryTriggerModeEnum : Enum 

---@class EngineTagDataWeaponSecondaryTriggerModeNormal : EngineTagDataWeaponSecondaryTriggerModeEnum 
---@class EngineTagDataWeaponSecondaryTriggerModeSlavedToPrimary : EngineTagDataWeaponSecondaryTriggerModeEnum 
---@class EngineTagDataWeaponSecondaryTriggerModeInhibitsPrimary : EngineTagDataWeaponSecondaryTriggerModeEnum 
---@class EngineTagDataWeaponSecondaryTriggerModeLoadsAlterateAmmunition : EngineTagDataWeaponSecondaryTriggerModeEnum 
---@class EngineTagDataWeaponSecondaryTriggerModeLoadsMultiplePrimaryAmmunition : EngineTagDataWeaponSecondaryTriggerModeEnum 

---@alias EngineTagDataWeaponSecondaryTriggerMode 
---| EngineTagDataWeaponSecondaryTriggerModeNormal
---| EngineTagDataWeaponSecondaryTriggerModeSlavedToPrimary
---| EngineTagDataWeaponSecondaryTriggerModeInhibitsPrimary
---| EngineTagDataWeaponSecondaryTriggerModeLoadsAlterateAmmunition
---| EngineTagDataWeaponSecondaryTriggerModeLoadsMultiplePrimaryAmmunition

---@class EngineTagDataWeaponSecondaryTriggerModeTable 
---@field deNormal EngineTagDataWeaponSecondaryTriggerModeNormal
---@field deSlavedToPrimary EngineTagDataWeaponSecondaryTriggerModeSlavedToPrimary
---@field deInhibitsPrimary EngineTagDataWeaponSecondaryTriggerModeInhibitsPrimary
---@field deLoadsAlterateAmmunition EngineTagDataWeaponSecondaryTriggerModeLoadsAlterateAmmunition
---@field deLoadsMultiplePrimaryAmmunition EngineTagDataWeaponSecondaryTriggerModeLoadsMultiplePrimaryAmmunition
Engine.tag.weaponSecondaryTriggerMode = {} 

---@class EngineTagDataWeaponFunctionInEnum : Enum 

---@class EngineTagDataWeaponFunctionInNone : EngineTagDataWeaponFunctionInEnum 
---@class EngineTagDataWeaponFunctionInHeat : EngineTagDataWeaponFunctionInEnum 
---@class EngineTagDataWeaponFunctionInPrimaryAmmunition : EngineTagDataWeaponFunctionInEnum 
---@class EngineTagDataWeaponFunctionInSecondaryAmmunition : EngineTagDataWeaponFunctionInEnum 
---@class EngineTagDataWeaponFunctionInPrimaryRateOfFire : EngineTagDataWeaponFunctionInEnum 
---@class EngineTagDataWeaponFunctionInSecondaryRateOfFire : EngineTagDataWeaponFunctionInEnum 
---@class EngineTagDataWeaponFunctionInReady : EngineTagDataWeaponFunctionInEnum 
---@class EngineTagDataWeaponFunctionInPrimaryEjectionPort : EngineTagDataWeaponFunctionInEnum 
---@class EngineTagDataWeaponFunctionInSecondaryEjectionPort : EngineTagDataWeaponFunctionInEnum 
---@class EngineTagDataWeaponFunctionInOverheated : EngineTagDataWeaponFunctionInEnum 
---@class EngineTagDataWeaponFunctionInPrimaryCharged : EngineTagDataWeaponFunctionInEnum 
---@class EngineTagDataWeaponFunctionInSecondaryCharged : EngineTagDataWeaponFunctionInEnum 
---@class EngineTagDataWeaponFunctionInIllumination : EngineTagDataWeaponFunctionInEnum 
---@class EngineTagDataWeaponFunctionInAge : EngineTagDataWeaponFunctionInEnum 
---@class EngineTagDataWeaponFunctionInIntegratedLight : EngineTagDataWeaponFunctionInEnum 
---@class EngineTagDataWeaponFunctionInPrimaryFiring : EngineTagDataWeaponFunctionInEnum 
---@class EngineTagDataWeaponFunctionInSecondaryFiring : EngineTagDataWeaponFunctionInEnum 
---@class EngineTagDataWeaponFunctionInPrimaryFiringOn : EngineTagDataWeaponFunctionInEnum 
---@class EngineTagDataWeaponFunctionInSecondaryFiringOn : EngineTagDataWeaponFunctionInEnum 

---@alias EngineTagDataWeaponFunctionIn 
---| EngineTagDataWeaponFunctionInNone
---| EngineTagDataWeaponFunctionInHeat
---| EngineTagDataWeaponFunctionInPrimaryAmmunition
---| EngineTagDataWeaponFunctionInSecondaryAmmunition
---| EngineTagDataWeaponFunctionInPrimaryRateOfFire
---| EngineTagDataWeaponFunctionInSecondaryRateOfFire
---| EngineTagDataWeaponFunctionInReady
---| EngineTagDataWeaponFunctionInPrimaryEjectionPort
---| EngineTagDataWeaponFunctionInSecondaryEjectionPort
---| EngineTagDataWeaponFunctionInOverheated
---| EngineTagDataWeaponFunctionInPrimaryCharged
---| EngineTagDataWeaponFunctionInSecondaryCharged
---| EngineTagDataWeaponFunctionInIllumination
---| EngineTagDataWeaponFunctionInAge
---| EngineTagDataWeaponFunctionInIntegratedLight
---| EngineTagDataWeaponFunctionInPrimaryFiring
---| EngineTagDataWeaponFunctionInSecondaryFiring
---| EngineTagDataWeaponFunctionInPrimaryFiringOn
---| EngineTagDataWeaponFunctionInSecondaryFiringOn

---@class EngineTagDataWeaponFunctionInTable 
---@field nNone EngineTagDataWeaponFunctionInNone
---@field nHeat EngineTagDataWeaponFunctionInHeat
---@field nPrimaryAmmunition EngineTagDataWeaponFunctionInPrimaryAmmunition
---@field nSecondaryAmmunition EngineTagDataWeaponFunctionInSecondaryAmmunition
---@field nPrimaryRateOfFire EngineTagDataWeaponFunctionInPrimaryRateOfFire
---@field nSecondaryRateOfFire EngineTagDataWeaponFunctionInSecondaryRateOfFire
---@field nReady EngineTagDataWeaponFunctionInReady
---@field nPrimaryEjectionPort EngineTagDataWeaponFunctionInPrimaryEjectionPort
---@field nSecondaryEjectionPort EngineTagDataWeaponFunctionInSecondaryEjectionPort
---@field nOverheated EngineTagDataWeaponFunctionInOverheated
---@field nPrimaryCharged EngineTagDataWeaponFunctionInPrimaryCharged
---@field nSecondaryCharged EngineTagDataWeaponFunctionInSecondaryCharged
---@field nIllumination EngineTagDataWeaponFunctionInIllumination
---@field nAge EngineTagDataWeaponFunctionInAge
---@field nIntegratedLight EngineTagDataWeaponFunctionInIntegratedLight
---@field nPrimaryFiring EngineTagDataWeaponFunctionInPrimaryFiring
---@field nSecondaryFiring EngineTagDataWeaponFunctionInSecondaryFiring
---@field nPrimaryFiringOn EngineTagDataWeaponFunctionInPrimaryFiringOn
---@field nSecondaryFiringOn EngineTagDataWeaponFunctionInSecondaryFiringOn
Engine.tag.weaponFunctionIn = {} 

---@class EngineTagDataWeaponMovementPenalizedEnum : Enum 

---@class EngineTagDataWeaponMovementPenalizedAlways : EngineTagDataWeaponMovementPenalizedEnum 
---@class EngineTagDataWeaponMovementPenalizedWhenZoomed : EngineTagDataWeaponMovementPenalizedEnum 
---@class EngineTagDataWeaponMovementPenalizedWhenZoomedOrReloading : EngineTagDataWeaponMovementPenalizedEnum 

---@alias EngineTagDataWeaponMovementPenalized 
---| EngineTagDataWeaponMovementPenalizedAlways
---| EngineTagDataWeaponMovementPenalizedWhenZoomed
---| EngineTagDataWeaponMovementPenalizedWhenZoomedOrReloading

---@class EngineTagDataWeaponMovementPenalizedTable 
---@field dAlways EngineTagDataWeaponMovementPenalizedAlways
---@field dWhenZoomed EngineTagDataWeaponMovementPenalizedWhenZoomed
---@field dWhenZoomedOrReloading EngineTagDataWeaponMovementPenalizedWhenZoomedOrReloading
Engine.tag.weaponMovementPenalized = {} 

---@class EngineTagDataWeaponTypeEnum : Enum 

---@class EngineTagDataWeaponTypeUndefined : EngineTagDataWeaponTypeEnum 
---@class EngineTagDataWeaponTypeShotgun : EngineTagDataWeaponTypeEnum 
---@class EngineTagDataWeaponTypeNeedler : EngineTagDataWeaponTypeEnum 
---@class EngineTagDataWeaponTypePlasmaPistol : EngineTagDataWeaponTypeEnum 
---@class EngineTagDataWeaponTypePlasmaRifle : EngineTagDataWeaponTypeEnum 
---@class EngineTagDataWeaponTypeRocketLauncher : EngineTagDataWeaponTypeEnum 

---@alias EngineTagDataWeaponType 
---| EngineTagDataWeaponTypeUndefined
---| EngineTagDataWeaponTypeShotgun
---| EngineTagDataWeaponTypeNeedler
---| EngineTagDataWeaponTypePlasmaPistol
---| EngineTagDataWeaponTypePlasmaRifle
---| EngineTagDataWeaponTypeRocketLauncher

---@class EngineTagDataWeaponTypeTable 
---@field undefined EngineTagDataWeaponTypeUndefined
---@field shotgun EngineTagDataWeaponTypeShotgun
---@field needler EngineTagDataWeaponTypeNeedler
---@field plasmaPistol EngineTagDataWeaponTypePlasmaPistol
---@field plasmaRifle EngineTagDataWeaponTypePlasmaRifle
---@field rocketLauncher EngineTagDataWeaponTypeRocketLauncher
Engine.tag.weaponType = {} 

---@class EngineTagDataWeaponPredictionTypeEnum : Enum 

---@class EngineTagDataWeaponPredictionTypeNone : EngineTagDataWeaponPredictionTypeEnum 
---@class EngineTagDataWeaponPredictionTypeContinuous : EngineTagDataWeaponPredictionTypeEnum 
---@class EngineTagDataWeaponPredictionTypeInstant : EngineTagDataWeaponPredictionTypeEnum 

---@alias EngineTagDataWeaponPredictionType 
---| EngineTagDataWeaponPredictionTypeNone
---| EngineTagDataWeaponPredictionTypeContinuous
---| EngineTagDataWeaponPredictionTypeInstant

---@class EngineTagDataWeaponPredictionTypeTable 
---@field eNone EngineTagDataWeaponPredictionTypeNone
---@field eContinuous EngineTagDataWeaponPredictionTypeContinuous
---@field eInstant EngineTagDataWeaponPredictionTypeInstant
Engine.tag.weaponPredictionType = {} 

---@class EngineTagDataWeaponOverchargedActionEnum : Enum 

---@class EngineTagDataWeaponOverchargedActionNone : EngineTagDataWeaponOverchargedActionEnum 
---@class EngineTagDataWeaponOverchargedActionExplode : EngineTagDataWeaponOverchargedActionEnum 
---@class EngineTagDataWeaponOverchargedActionDischarge : EngineTagDataWeaponOverchargedActionEnum 

---@alias EngineTagDataWeaponOverchargedAction 
---| EngineTagDataWeaponOverchargedActionNone
---| EngineTagDataWeaponOverchargedActionExplode
---| EngineTagDataWeaponOverchargedActionDischarge

---@class EngineTagDataWeaponOverchargedActionTable 
---@field nNone EngineTagDataWeaponOverchargedActionNone
---@field nExplode EngineTagDataWeaponOverchargedActionExplode
---@field nDischarge EngineTagDataWeaponOverchargedActionDischarge
Engine.tag.weaponOverchargedAction = {} 

---@class EngineTagDataWeaponDistributionFunctionEnum : Enum 

---@class EngineTagDataWeaponDistributionFunctionPoint : EngineTagDataWeaponDistributionFunctionEnum 
---@class EngineTagDataWeaponDistributionFunctionHorizontalFan : EngineTagDataWeaponDistributionFunctionEnum 

---@alias EngineTagDataWeaponDistributionFunction 
---| EngineTagDataWeaponDistributionFunctionPoint
---| EngineTagDataWeaponDistributionFunctionHorizontalFan

---@class EngineTagDataWeaponDistributionFunctionTable 
---@field nPoint EngineTagDataWeaponDistributionFunctionPoint
---@field nHorizontalFan EngineTagDataWeaponDistributionFunctionHorizontalFan
Engine.tag.weaponDistributionFunction = {} 

---@class MetaEngineTagDataWeaponMagazineFlags 
---@field wastesRoundsWhenReloaded boolean 
---@field everyRoundMustBeChambered boolean 

---@class MetaEngineTagDataWeaponTriggerFlags 
---@field tracksFiredProjectile boolean 
---@field randomFiringEffects boolean 
---@field canFireWithPartialAmmo boolean 
---@field doesNotRepeatAutomatically boolean 
---@field locksInOnOffState boolean 
---@field projectilesUseWeaponOrigin boolean 
---@field sticksWhenDropped boolean 
---@field ejectsDuringChamber boolean 
---@field dischargingSpews boolean 
---@field analogRateOfFire boolean 
---@field useErrorWhenUnzoomed boolean 
---@field projectileVectorCannotBeAdjusted boolean 
---@field projectilesHaveIdenticalError boolean 
---@field projectileIsClientSideOnly boolean 
---@field useOriginalUnitAdjustProjectileRay boolean 

---@class MetaEngineTagDataWeaponFlags 
---@field verticalHeatDisplay boolean 
---@field mutuallyExclusiveTriggers boolean 
---@field attacksAutomaticallyOnBump boolean 
---@field mustBeReadied boolean 
---@field doesntCountTowardMaximum boolean 
---@field aimAssistsOnlyWhenZoomed boolean 
---@field preventsGrenadeThrowing boolean 
---@field mustBePickedUp boolean 
---@field holdsTriggersWhenDropped boolean 
---@field preventsMeleeAttack boolean 
---@field detonatesWhenDropped boolean 
---@field cannotFireAtMaximumAge boolean 
---@field secondaryTriggerOverridesGrenades boolean 
---@field obsoleteDoesNotDepowerActiveCamoInMultilplayer boolean 
---@field enablesIntegratedNightVision boolean 
---@field aisUseWeaponMeleeDamage boolean 

---@class MetaEngineTagDataWeaponMagazineObject 
---@field rounds integer 
---@field equipment MetaEngineTagDependency 

---@class MetaEngineTagDataWeaponMagazine 
---@field flags MetaEngineTagDataWeaponMagazineFlags 
---@field roundsRecharged integer 
---@field roundsTotalInitial integer 
---@field roundsReservedMaximum integer 
---@field roundsLoadedMaximum integer 
---@field reloadTime number 
---@field roundsReloaded integer 
---@field chamberTime number 
---@field reloadingEffect MetaEngineTagDependency 
---@field chamberingEffect MetaEngineTagDependency 
---@field magazineObjects table<MetaEngineTagDataWeaponMagazineObject> 

---@class MetaEngineTagDataWeaponTriggerFiringEffect 
---@field shotCountLowerBound integer 
---@field shotCountUpperBound integer 
---@field firingEffect MetaEngineTagDependency 
---@field misfireEffect MetaEngineTagDependency 
---@field emptyEffect MetaEngineTagDependency 
---@field firingDamage MetaEngineTagDependency 
---@field misfireDamage MetaEngineTagDependency 
---@field emptyDamage MetaEngineTagDependency 

---@class MetaEngineTagDataWeaponTrigger 
---@field flags MetaEngineTagDataWeaponTriggerFlags 
---@field maximumRateOfFire number 
---@field accelerationTime number 
---@field decelerationTime number 
---@field blurredRateOfFire MetaEngineFraction 
---@field magazine MetaEngineIndex 
---@field roundsPerShot integer 
---@field minimumRoundsLoaded integer 
---@field projectilesBetweenContrails integer 
---@field predictionType EngineTagDataWeaponPredictionType 
---@field firingNoise EngineTagDataObjectNoise 
---@field error number 
---@field errorAccelerationTime number 
---@field errorDecelerationTime number 
---@field chargingTime number 
---@field chargedTime number 
---@field overchargedAction EngineTagDataWeaponOverchargedAction 
---@field chargedIllumination number 
---@field spewTime number 
---@field chargingEffect MetaEngineTagDependency 
---@field distributionFunction EngineTagDataWeaponDistributionFunction 
---@field projectilesPerShot integer 
---@field distributionAngle MetaEngineAngle 
---@field minimumError MetaEngineAngle 
---@field errorAngle MetaEngineAngle 
---@field firstPersonOffset MetaEnginePoint3D 
---@field projectile MetaEngineTagDependency 
---@field ejectionPortRecoveryTime number 
---@field illuminationRecoveryTime number 
---@field heatGeneratedPerRound MetaEngineFraction 
---@field ageGeneratedPerRound MetaEngineFraction 
---@field overloadTime number 
---@field illuminationRecoveryRate number 
---@field ejectionPortRecoveryRate number 
---@field firingAccelerationRate number 
---@field firingDecelerationRate number 
---@field errorAccelerationRate number 
---@field errorDecelerationRate number 
---@field firingEffects table<MetaEngineTagDataWeaponTriggerFiringEffect> 

---@class MetaEngineTagDataWeapon: MetaEngineTagDataItem  
---@field weaponFlags MetaEngineTagDataWeaponFlags 
---@field label MetaEngineTagString 
---@field secondaryTriggerMode EngineTagDataWeaponSecondaryTriggerMode 
---@field maximumAlternateShotsLoaded integer 
---@field weaponAIn EngineTagDataWeaponFunctionIn 
---@field weaponBIn EngineTagDataWeaponFunctionIn 
---@field weaponCIn EngineTagDataWeaponFunctionIn 
---@field weaponDIn EngineTagDataWeaponFunctionIn 
---@field readyTime number 
---@field readyEffect MetaEngineTagDependency 
---@field heatRecoveryThreshold MetaEngineFraction 
---@field overheatedThreshold MetaEngineFraction 
---@field heatDetonationThreshold MetaEngineFraction 
---@field heatDetonationFraction MetaEngineFraction 
---@field heatLossRate MetaEngineFraction 
---@field heatIllumination MetaEngineFraction 
---@field overheated MetaEngineTagDependency 
---@field overheatDetonation MetaEngineTagDependency 
---@field playerMeleeDamage MetaEngineTagDependency 
---@field playerMeleeResponse MetaEngineTagDependency 
---@field actorFiringParameters MetaEngineTagDependency 
---@field nearReticleRange number 
---@field farReticleRange number 
---@field intersectionReticleRange number 
---@field zoomLevels integer 
---@field zoomMagnificationRange number 
---@field autoaimAngle MetaEngineAngle 
---@field autoaimRange number 
---@field magnetismAngle MetaEngineAngle 
---@field magnetismRange number 
---@field deviationAngle MetaEngineAngle 
---@field movementPenalized EngineTagDataWeaponMovementPenalized 
---@field forwardMovementPenalty MetaEngineFraction 
---@field sidewaysMovementPenalty MetaEngineFraction 
---@field minimumTargetRange number 
---@field lookingTimeModifier number 
---@field lightPowerOnTime number 
---@field lightPowerOffTime number 
---@field lightPowerOnEffect MetaEngineTagDependency 
---@field lightPowerOffEffect MetaEngineTagDependency 
---@field ageHeatRecoveryPenalty number 
---@field ageRateOfFirePenalty number 
---@field ageMisfireStart MetaEngineFraction 
---@field ageMisfireChance MetaEngineFraction 
---@field firstPersonModel MetaEngineTagDependency 
---@field firstPersonAnimations MetaEngineTagDependency 
---@field hudInterface MetaEngineTagDependency 
---@field pickupSound MetaEngineTagDependency 
---@field zoomInSound MetaEngineTagDependency 
---@field zoomOutSound MetaEngineTagDependency 
---@field activeCamoDing number 
---@field activeCamoRegrowthRate number 
---@field weaponType EngineTagDataWeaponType 
---@field morePredictedResources table<MetaEngineTagDataPredictedResource> 
---@field magazines table<MetaEngineTagDataWeaponMagazine> 
---@field triggers table<MetaEngineTagDataWeaponTrigger> 

---@class MetaEngineTagDataUnicodeStringListString 
---@field string MetaEngineTagDataOffset 

---@class MetaEngineTagDataUnicodeStringList 
---@field strings table<MetaEngineTagDataUnicodeStringListString> 

---@class MetaEngineTagDataTagCollectionTag 
---@field reference MetaEngineTagDependency 

---@class MetaEngineTagDataTagCollection 
---@field tags table<MetaEngineTagDataTagCollectionTag> 

---@class MetaEngineTagDataStringListString 
---@field string MetaEngineTagDataOffset 

---@class MetaEngineTagDataStringList 
---@field strings table<MetaEngineTagDataStringListString> 

---@class EngineTagDataShaderDetailLevelEnum : Enum 

---@class EngineTagDataShaderDetailLevelHigh : EngineTagDataShaderDetailLevelEnum 
---@class EngineTagDataShaderDetailLevelMedium : EngineTagDataShaderDetailLevelEnum 
---@class EngineTagDataShaderDetailLevelLow : EngineTagDataShaderDetailLevelEnum 
---@class EngineTagDataShaderDetailLevelTurd : EngineTagDataShaderDetailLevelEnum 

---@alias EngineTagDataShaderDetailLevel 
---| EngineTagDataShaderDetailLevelHigh
---| EngineTagDataShaderDetailLevelMedium
---| EngineTagDataShaderDetailLevelLow
---| EngineTagDataShaderDetailLevelTurd

---@class EngineTagDataShaderDetailLevelTable 
---@field lHigh EngineTagDataShaderDetailLevelHigh
---@field lMedium EngineTagDataShaderDetailLevelMedium
---@field lLow EngineTagDataShaderDetailLevelLow
---@field lTurd EngineTagDataShaderDetailLevelTurd
Engine.tag.shaderDetailLevel = {} 

---@class EngineTagDataShaderColorFunctionTypeEnum : Enum 

---@class EngineTagDataShaderColorFunctionTypeCurrent : EngineTagDataShaderColorFunctionTypeEnum 
---@class EngineTagDataShaderColorFunctionTypeNextMap : EngineTagDataShaderColorFunctionTypeEnum 
---@class EngineTagDataShaderColorFunctionTypeMultiply : EngineTagDataShaderColorFunctionTypeEnum 
---@class EngineTagDataShaderColorFunctionTypeDoubleMultiply : EngineTagDataShaderColorFunctionTypeEnum 
---@class EngineTagDataShaderColorFunctionTypeAdd : EngineTagDataShaderColorFunctionTypeEnum 
---@class EngineTagDataShaderColorFunctionTypeAddSignedCurrent : EngineTagDataShaderColorFunctionTypeEnum 
---@class EngineTagDataShaderColorFunctionTypeAddSignedNextMap : EngineTagDataShaderColorFunctionTypeEnum 
---@class EngineTagDataShaderColorFunctionTypeSubtractCurrent : EngineTagDataShaderColorFunctionTypeEnum 
---@class EngineTagDataShaderColorFunctionTypeSubtractNextMap : EngineTagDataShaderColorFunctionTypeEnum 
---@class EngineTagDataShaderColorFunctionTypeBlendCurrentAlpha : EngineTagDataShaderColorFunctionTypeEnum 
---@class EngineTagDataShaderColorFunctionTypeBlendCurrentAlphaInverse : EngineTagDataShaderColorFunctionTypeEnum 
---@class EngineTagDataShaderColorFunctionTypeBlendNextMapAlpha : EngineTagDataShaderColorFunctionTypeEnum 
---@class EngineTagDataShaderColorFunctionTypeBlendNextMapAlphaInverse : EngineTagDataShaderColorFunctionTypeEnum 

---@alias EngineTagDataShaderColorFunctionType 
---| EngineTagDataShaderColorFunctionTypeCurrent
---| EngineTagDataShaderColorFunctionTypeNextMap
---| EngineTagDataShaderColorFunctionTypeMultiply
---| EngineTagDataShaderColorFunctionTypeDoubleMultiply
---| EngineTagDataShaderColorFunctionTypeAdd
---| EngineTagDataShaderColorFunctionTypeAddSignedCurrent
---| EngineTagDataShaderColorFunctionTypeAddSignedNextMap
---| EngineTagDataShaderColorFunctionTypeSubtractCurrent
---| EngineTagDataShaderColorFunctionTypeSubtractNextMap
---| EngineTagDataShaderColorFunctionTypeBlendCurrentAlpha
---| EngineTagDataShaderColorFunctionTypeBlendCurrentAlphaInverse
---| EngineTagDataShaderColorFunctionTypeBlendNextMapAlpha
---| EngineTagDataShaderColorFunctionTypeBlendNextMapAlphaInverse

---@class EngineTagDataShaderColorFunctionTypeTable 
---@field peCurrent EngineTagDataShaderColorFunctionTypeCurrent
---@field peNextMap EngineTagDataShaderColorFunctionTypeNextMap
---@field peMultiply EngineTagDataShaderColorFunctionTypeMultiply
---@field peDoubleMultiply EngineTagDataShaderColorFunctionTypeDoubleMultiply
---@field peAdd EngineTagDataShaderColorFunctionTypeAdd
---@field peAddSignedCurrent EngineTagDataShaderColorFunctionTypeAddSignedCurrent
---@field peAddSignedNextMap EngineTagDataShaderColorFunctionTypeAddSignedNextMap
---@field peSubtractCurrent EngineTagDataShaderColorFunctionTypeSubtractCurrent
---@field peSubtractNextMap EngineTagDataShaderColorFunctionTypeSubtractNextMap
---@field peBlendCurrentAlpha EngineTagDataShaderColorFunctionTypeBlendCurrentAlpha
---@field peBlendCurrentAlphaInverse EngineTagDataShaderColorFunctionTypeBlendCurrentAlphaInverse
---@field peBlendNextMapAlpha EngineTagDataShaderColorFunctionTypeBlendNextMapAlpha
---@field peBlendNextMapAlphaInverse EngineTagDataShaderColorFunctionTypeBlendNextMapAlphaInverse
Engine.tag.shaderColorFunctionType = {} 

---@class EngineTagDataShaderFirstMapTypeEnum : Enum 

---@class EngineTagDataShaderFirstMapType_2dMap : EngineTagDataShaderFirstMapTypeEnum 
---@class EngineTagDataShaderFirstMapTypeFirstMapIsReflectionCubeMap : EngineTagDataShaderFirstMapTypeEnum 
---@class EngineTagDataShaderFirstMapTypeFirstMapIsObjectCenteredCubeMap : EngineTagDataShaderFirstMapTypeEnum 
---@class EngineTagDataShaderFirstMapTypeFirstMapIsViewerCenteredCubeMap : EngineTagDataShaderFirstMapTypeEnum 

---@alias EngineTagDataShaderFirstMapType 
---| EngineTagDataShaderFirstMapType_2dMap
---| EngineTagDataShaderFirstMapTypeFirstMapIsReflectionCubeMap
---| EngineTagDataShaderFirstMapTypeFirstMapIsObjectCenteredCubeMap
---| EngineTagDataShaderFirstMapTypeFirstMapIsViewerCenteredCubeMap

---@class EngineTagDataShaderFirstMapTypeTable 
---@field pe_2dMap EngineTagDataShaderFirstMapType_2dMap
---@field peFirstMapIsReflectionCubeMap EngineTagDataShaderFirstMapTypeFirstMapIsReflectionCubeMap
---@field peFirstMapIsObjectCenteredCubeMap EngineTagDataShaderFirstMapTypeFirstMapIsObjectCenteredCubeMap
---@field peFirstMapIsViewerCenteredCubeMap EngineTagDataShaderFirstMapTypeFirstMapIsViewerCenteredCubeMap
Engine.tag.shaderFirstMapType = {} 

---@class EngineTagDataShaderTypeEnum : Enum 

---@class EngineTagDataShaderTypeUnused : EngineTagDataShaderTypeEnum 
---@class EngineTagDataShaderTypeUnused1 : EngineTagDataShaderTypeEnum 
---@class EngineTagDataShaderTypeUnused2 : EngineTagDataShaderTypeEnum 
---@class EngineTagDataShaderTypeShaderEnvironment : EngineTagDataShaderTypeEnum 
---@class EngineTagDataShaderTypeShaderModel : EngineTagDataShaderTypeEnum 
---@class EngineTagDataShaderTypeShaderTransparentGeneric : EngineTagDataShaderTypeEnum 
---@class EngineTagDataShaderTypeShaderTransparentChicago : EngineTagDataShaderTypeEnum 
---@class EngineTagDataShaderTypeShaderTransparentChicagoExtended : EngineTagDataShaderTypeEnum 
---@class EngineTagDataShaderTypeShaderTransparentWater : EngineTagDataShaderTypeEnum 
---@class EngineTagDataShaderTypeShaderTransparentGlass : EngineTagDataShaderTypeEnum 
---@class EngineTagDataShaderTypeShaderTransparentMeter : EngineTagDataShaderTypeEnum 
---@class EngineTagDataShaderTypeShaderTransparentPlasma : EngineTagDataShaderTypeEnum 

---@alias EngineTagDataShaderType 
---| EngineTagDataShaderTypeUnused
---| EngineTagDataShaderTypeUnused1
---| EngineTagDataShaderTypeUnused2
---| EngineTagDataShaderTypeShaderEnvironment
---| EngineTagDataShaderTypeShaderModel
---| EngineTagDataShaderTypeShaderTransparentGeneric
---| EngineTagDataShaderTypeShaderTransparentChicago
---| EngineTagDataShaderTypeShaderTransparentChicagoExtended
---| EngineTagDataShaderTypeShaderTransparentWater
---| EngineTagDataShaderTypeShaderTransparentGlass
---| EngineTagDataShaderTypeShaderTransparentMeter
---| EngineTagDataShaderTypeShaderTransparentPlasma

---@class EngineTagDataShaderTypeTable 
---@field unused EngineTagDataShaderTypeUnused
---@field unused1 EngineTagDataShaderTypeUnused1
---@field unused2 EngineTagDataShaderTypeUnused2
---@field shaderEnvironment EngineTagDataShaderTypeShaderEnvironment
---@field shaderModel EngineTagDataShaderTypeShaderModel
---@field shaderTransparentGeneric EngineTagDataShaderTypeShaderTransparentGeneric
---@field shaderTransparentChicago EngineTagDataShaderTypeShaderTransparentChicago
---@field shaderTransparentChicagoExtended EngineTagDataShaderTypeShaderTransparentChicagoExtended
---@field shaderTransparentWater EngineTagDataShaderTypeShaderTransparentWater
---@field shaderTransparentGlass EngineTagDataShaderTypeShaderTransparentGlass
---@field shaderTransparentMeter EngineTagDataShaderTypeShaderTransparentMeter
---@field shaderTransparentPlasma EngineTagDataShaderTypeShaderTransparentPlasma
Engine.tag.shaderType = {} 

---@class EngineTagDataShaderDetailFunctionEnum : Enum 

---@class EngineTagDataShaderDetailFunctionDoubleBiasedMultiply : EngineTagDataShaderDetailFunctionEnum 
---@class EngineTagDataShaderDetailFunctionMultiply : EngineTagDataShaderDetailFunctionEnum 
---@class EngineTagDataShaderDetailFunctionDoubleBiasedAdd : EngineTagDataShaderDetailFunctionEnum 

---@alias EngineTagDataShaderDetailFunction 
---| EngineTagDataShaderDetailFunctionDoubleBiasedMultiply
---| EngineTagDataShaderDetailFunctionMultiply
---| EngineTagDataShaderDetailFunctionDoubleBiasedAdd

---@class EngineTagDataShaderDetailFunctionTable 
---@field nDoubleBiasedMultiply EngineTagDataShaderDetailFunctionDoubleBiasedMultiply
---@field nMultiply EngineTagDataShaderDetailFunctionMultiply
---@field nDoubleBiasedAdd EngineTagDataShaderDetailFunctionDoubleBiasedAdd
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

---@class MetaEngineTagDataShaderTransparentPlasma: MetaEngineTagDataShader  
---@field intensitySource EngineTagDataFunctionOut 
---@field intensityExponent number 
---@field offsetSource EngineTagDataFunctionOut 
---@field offsetAmount number 
---@field offsetExponent number 
---@field perpendicularBrightness MetaEngineFraction 
---@field perpendicularTintColor MetaEngineColorRGB 
---@field parallelBrightness MetaEngineFraction 
---@field parallelTintColor MetaEngineColorRGB 
---@field tintColorSource EngineTagDataFunctionNameNullable 
---@field primaryAnimationPeriod number 
---@field primaryAnimationDirection MetaEngineVector3D 
---@field primaryNoiseMapScale number 
---@field primaryNoiseMap MetaEngineTagDependency 
---@field secondaryAnimationPeriod number 
---@field secondaryAnimationDirection MetaEngineVector3D 
---@field secondaryNoiseMapScale number 
---@field secondaryNoiseMap MetaEngineTagDependency 

---@class MetaEngineTagDataPointPhysicsFlags 
---@field flamethrowerParticleCollision boolean 
---@field collidesWithStructures boolean 
---@field collidesWithWaterSurface boolean 
---@field usesSimpleWind boolean 
---@field usesDampedWind boolean 
---@field noGravity boolean 

---@class MetaEngineTagDataPointPhysics 
---@field flags MetaEngineTagDataPointPhysicsFlags 
---@field unknownConstant number 
---@field waterGravityScale number 
---@field airGravityScale number 
---@field density number 
---@field airFriction number 
---@field waterFriction number 
---@field surfaceFriction number 
---@field elasticity number 

---@class MetaEngineTagDataScenery: MetaEngineTagDataBasicObject  

---@class EngineTagDataShaderTransparentGenericStageInputColorEnum : Enum 

---@class EngineTagDataShaderTransparentGenericStageInputColorZero : EngineTagDataShaderTransparentGenericStageInputColorEnum 
---@class EngineTagDataShaderTransparentGenericStageInputColorOne : EngineTagDataShaderTransparentGenericStageInputColorEnum 
---@class EngineTagDataShaderTransparentGenericStageInputColorOneHalf : EngineTagDataShaderTransparentGenericStageInputColorEnum 
---@class EngineTagDataShaderTransparentGenericStageInputColorNegativeOne : EngineTagDataShaderTransparentGenericStageInputColorEnum 
---@class EngineTagDataShaderTransparentGenericStageInputColorNegativeOneHalf : EngineTagDataShaderTransparentGenericStageInputColorEnum 
---@class EngineTagDataShaderTransparentGenericStageInputColorMapColor_0 : EngineTagDataShaderTransparentGenericStageInputColorEnum 
---@class EngineTagDataShaderTransparentGenericStageInputColorMapColor_1 : EngineTagDataShaderTransparentGenericStageInputColorEnum 
---@class EngineTagDataShaderTransparentGenericStageInputColorMapColor_2 : EngineTagDataShaderTransparentGenericStageInputColorEnum 
---@class EngineTagDataShaderTransparentGenericStageInputColorMapColor_3 : EngineTagDataShaderTransparentGenericStageInputColorEnum 
---@class EngineTagDataShaderTransparentGenericStageInputColorVertexColor_0DiffuseLight : EngineTagDataShaderTransparentGenericStageInputColorEnum 
---@class EngineTagDataShaderTransparentGenericStageInputColorVertexColor_1FadePerpendicular : EngineTagDataShaderTransparentGenericStageInputColorEnum 
---@class EngineTagDataShaderTransparentGenericStageInputColorScratchColor_0 : EngineTagDataShaderTransparentGenericStageInputColorEnum 
---@class EngineTagDataShaderTransparentGenericStageInputColorScratchColor_1 : EngineTagDataShaderTransparentGenericStageInputColorEnum 
---@class EngineTagDataShaderTransparentGenericStageInputColorConstantColor_0 : EngineTagDataShaderTransparentGenericStageInputColorEnum 
---@class EngineTagDataShaderTransparentGenericStageInputColorConstantColor_1 : EngineTagDataShaderTransparentGenericStageInputColorEnum 
---@class EngineTagDataShaderTransparentGenericStageInputColorMapAlpha_0 : EngineTagDataShaderTransparentGenericStageInputColorEnum 
---@class EngineTagDataShaderTransparentGenericStageInputColorMapAlpha_1 : EngineTagDataShaderTransparentGenericStageInputColorEnum 
---@class EngineTagDataShaderTransparentGenericStageInputColorMapAlpha_2 : EngineTagDataShaderTransparentGenericStageInputColorEnum 
---@class EngineTagDataShaderTransparentGenericStageInputColorMapAlpha_3 : EngineTagDataShaderTransparentGenericStageInputColorEnum 
---@class EngineTagDataShaderTransparentGenericStageInputColorVertexAlpha_0FadeNone : EngineTagDataShaderTransparentGenericStageInputColorEnum 
---@class EngineTagDataShaderTransparentGenericStageInputColorVertexAlpha_1FadePerpendicular : EngineTagDataShaderTransparentGenericStageInputColorEnum 
---@class EngineTagDataShaderTransparentGenericStageInputColorScratchAlpha_0 : EngineTagDataShaderTransparentGenericStageInputColorEnum 
---@class EngineTagDataShaderTransparentGenericStageInputColorScratchAlpha_1 : EngineTagDataShaderTransparentGenericStageInputColorEnum 
---@class EngineTagDataShaderTransparentGenericStageInputColorConstantAlpha_0 : EngineTagDataShaderTransparentGenericStageInputColorEnum 
---@class EngineTagDataShaderTransparentGenericStageInputColorConstantAlpha_1 : EngineTagDataShaderTransparentGenericStageInputColorEnum 

---@alias EngineTagDataShaderTransparentGenericStageInputColor 
---| EngineTagDataShaderTransparentGenericStageInputColorZero
---| EngineTagDataShaderTransparentGenericStageInputColorOne
---| EngineTagDataShaderTransparentGenericStageInputColorOneHalf
---| EngineTagDataShaderTransparentGenericStageInputColorNegativeOne
---| EngineTagDataShaderTransparentGenericStageInputColorNegativeOneHalf
---| EngineTagDataShaderTransparentGenericStageInputColorMapColor_0
---| EngineTagDataShaderTransparentGenericStageInputColorMapColor_1
---| EngineTagDataShaderTransparentGenericStageInputColorMapColor_2
---| EngineTagDataShaderTransparentGenericStageInputColorMapColor_3
---| EngineTagDataShaderTransparentGenericStageInputColorVertexColor_0DiffuseLight
---| EngineTagDataShaderTransparentGenericStageInputColorVertexColor_1FadePerpendicular
---| EngineTagDataShaderTransparentGenericStageInputColorScratchColor_0
---| EngineTagDataShaderTransparentGenericStageInputColorScratchColor_1
---| EngineTagDataShaderTransparentGenericStageInputColorConstantColor_0
---| EngineTagDataShaderTransparentGenericStageInputColorConstantColor_1
---| EngineTagDataShaderTransparentGenericStageInputColorMapAlpha_0
---| EngineTagDataShaderTransparentGenericStageInputColorMapAlpha_1
---| EngineTagDataShaderTransparentGenericStageInputColorMapAlpha_2
---| EngineTagDataShaderTransparentGenericStageInputColorMapAlpha_3
---| EngineTagDataShaderTransparentGenericStageInputColorVertexAlpha_0FadeNone
---| EngineTagDataShaderTransparentGenericStageInputColorVertexAlpha_1FadePerpendicular
---| EngineTagDataShaderTransparentGenericStageInputColorScratchAlpha_0
---| EngineTagDataShaderTransparentGenericStageInputColorScratchAlpha_1
---| EngineTagDataShaderTransparentGenericStageInputColorConstantAlpha_0
---| EngineTagDataShaderTransparentGenericStageInputColorConstantAlpha_1

---@class EngineTagDataShaderTransparentGenericStageInputColorTable 
---@field olorZero EngineTagDataShaderTransparentGenericStageInputColorZero
---@field olorOne EngineTagDataShaderTransparentGenericStageInputColorOne
---@field olorOneHalf EngineTagDataShaderTransparentGenericStageInputColorOneHalf
---@field olorNegativeOne EngineTagDataShaderTransparentGenericStageInputColorNegativeOne
---@field olorNegativeOneHalf EngineTagDataShaderTransparentGenericStageInputColorNegativeOneHalf
---@field olorMapColor_0 EngineTagDataShaderTransparentGenericStageInputColorMapColor_0
---@field olorMapColor_1 EngineTagDataShaderTransparentGenericStageInputColorMapColor_1
---@field olorMapColor_2 EngineTagDataShaderTransparentGenericStageInputColorMapColor_2
---@field olorMapColor_3 EngineTagDataShaderTransparentGenericStageInputColorMapColor_3
---@field olorVertexColor_0DiffuseLight EngineTagDataShaderTransparentGenericStageInputColorVertexColor_0DiffuseLight
---@field olorVertexColor_1FadePerpendicular EngineTagDataShaderTransparentGenericStageInputColorVertexColor_1FadePerpendicular
---@field olorScratchColor_0 EngineTagDataShaderTransparentGenericStageInputColorScratchColor_0
---@field olorScratchColor_1 EngineTagDataShaderTransparentGenericStageInputColorScratchColor_1
---@field olorConstantColor_0 EngineTagDataShaderTransparentGenericStageInputColorConstantColor_0
---@field olorConstantColor_1 EngineTagDataShaderTransparentGenericStageInputColorConstantColor_1
---@field olorMapAlpha_0 EngineTagDataShaderTransparentGenericStageInputColorMapAlpha_0
---@field olorMapAlpha_1 EngineTagDataShaderTransparentGenericStageInputColorMapAlpha_1
---@field olorMapAlpha_2 EngineTagDataShaderTransparentGenericStageInputColorMapAlpha_2
---@field olorMapAlpha_3 EngineTagDataShaderTransparentGenericStageInputColorMapAlpha_3
---@field olorVertexAlpha_0FadeNone EngineTagDataShaderTransparentGenericStageInputColorVertexAlpha_0FadeNone
---@field olorVertexAlpha_1FadePerpendicular EngineTagDataShaderTransparentGenericStageInputColorVertexAlpha_1FadePerpendicular
---@field olorScratchAlpha_0 EngineTagDataShaderTransparentGenericStageInputColorScratchAlpha_0
---@field olorScratchAlpha_1 EngineTagDataShaderTransparentGenericStageInputColorScratchAlpha_1
---@field olorConstantAlpha_0 EngineTagDataShaderTransparentGenericStageInputColorConstantAlpha_0
---@field olorConstantAlpha_1 EngineTagDataShaderTransparentGenericStageInputColorConstantAlpha_1
Engine.tag.shaderTransparentGenericStageInputColor = {} 

---@class EngineTagDataShaderTransparentGenericStageInputAlphaEnum : Enum 

---@class EngineTagDataShaderTransparentGenericStageInputAlphaZero : EngineTagDataShaderTransparentGenericStageInputAlphaEnum 
---@class EngineTagDataShaderTransparentGenericStageInputAlphaOne : EngineTagDataShaderTransparentGenericStageInputAlphaEnum 
---@class EngineTagDataShaderTransparentGenericStageInputAlphaOneHalf : EngineTagDataShaderTransparentGenericStageInputAlphaEnum 
---@class EngineTagDataShaderTransparentGenericStageInputAlphaNegativeOne : EngineTagDataShaderTransparentGenericStageInputAlphaEnum 
---@class EngineTagDataShaderTransparentGenericStageInputAlphaNegativeOneHalf : EngineTagDataShaderTransparentGenericStageInputAlphaEnum 
---@class EngineTagDataShaderTransparentGenericStageInputAlphaMapAlpha_0 : EngineTagDataShaderTransparentGenericStageInputAlphaEnum 
---@class EngineTagDataShaderTransparentGenericStageInputAlphaMapAlpha_1 : EngineTagDataShaderTransparentGenericStageInputAlphaEnum 
---@class EngineTagDataShaderTransparentGenericStageInputAlphaMapAlpha_2 : EngineTagDataShaderTransparentGenericStageInputAlphaEnum 
---@class EngineTagDataShaderTransparentGenericStageInputAlphaMapAlpha_3 : EngineTagDataShaderTransparentGenericStageInputAlphaEnum 
---@class EngineTagDataShaderTransparentGenericStageInputAlphaVertexAlpha_0FadeNone : EngineTagDataShaderTransparentGenericStageInputAlphaEnum 
---@class EngineTagDataShaderTransparentGenericStageInputAlphaVertexAlpha_1FadePerpendicular : EngineTagDataShaderTransparentGenericStageInputAlphaEnum 
---@class EngineTagDataShaderTransparentGenericStageInputAlphaScratchAlpha_0 : EngineTagDataShaderTransparentGenericStageInputAlphaEnum 
---@class EngineTagDataShaderTransparentGenericStageInputAlphaScratchAlpha_1 : EngineTagDataShaderTransparentGenericStageInputAlphaEnum 
---@class EngineTagDataShaderTransparentGenericStageInputAlphaConstantAlpha_0 : EngineTagDataShaderTransparentGenericStageInputAlphaEnum 
---@class EngineTagDataShaderTransparentGenericStageInputAlphaConstantAlpha_1 : EngineTagDataShaderTransparentGenericStageInputAlphaEnum 
---@class EngineTagDataShaderTransparentGenericStageInputAlphaMapBlue_0 : EngineTagDataShaderTransparentGenericStageInputAlphaEnum 
---@class EngineTagDataShaderTransparentGenericStageInputAlphaMapBlue_1 : EngineTagDataShaderTransparentGenericStageInputAlphaEnum 
---@class EngineTagDataShaderTransparentGenericStageInputAlphaMapBlue_2 : EngineTagDataShaderTransparentGenericStageInputAlphaEnum 
---@class EngineTagDataShaderTransparentGenericStageInputAlphaMapBlue_3 : EngineTagDataShaderTransparentGenericStageInputAlphaEnum 
---@class EngineTagDataShaderTransparentGenericStageInputAlphaVertexBlue_0BlueLight : EngineTagDataShaderTransparentGenericStageInputAlphaEnum 
---@class EngineTagDataShaderTransparentGenericStageInputAlphaVertexBlue_1FadeParallel : EngineTagDataShaderTransparentGenericStageInputAlphaEnum 
---@class EngineTagDataShaderTransparentGenericStageInputAlphaScratchBlue_0 : EngineTagDataShaderTransparentGenericStageInputAlphaEnum 
---@class EngineTagDataShaderTransparentGenericStageInputAlphaScratchBlue_1 : EngineTagDataShaderTransparentGenericStageInputAlphaEnum 
---@class EngineTagDataShaderTransparentGenericStageInputAlphaConstantBlue_0 : EngineTagDataShaderTransparentGenericStageInputAlphaEnum 
---@class EngineTagDataShaderTransparentGenericStageInputAlphaConstantBlue_1 : EngineTagDataShaderTransparentGenericStageInputAlphaEnum 

---@alias EngineTagDataShaderTransparentGenericStageInputAlpha 
---| EngineTagDataShaderTransparentGenericStageInputAlphaZero
---| EngineTagDataShaderTransparentGenericStageInputAlphaOne
---| EngineTagDataShaderTransparentGenericStageInputAlphaOneHalf
---| EngineTagDataShaderTransparentGenericStageInputAlphaNegativeOne
---| EngineTagDataShaderTransparentGenericStageInputAlphaNegativeOneHalf
---| EngineTagDataShaderTransparentGenericStageInputAlphaMapAlpha_0
---| EngineTagDataShaderTransparentGenericStageInputAlphaMapAlpha_1
---| EngineTagDataShaderTransparentGenericStageInputAlphaMapAlpha_2
---| EngineTagDataShaderTransparentGenericStageInputAlphaMapAlpha_3
---| EngineTagDataShaderTransparentGenericStageInputAlphaVertexAlpha_0FadeNone
---| EngineTagDataShaderTransparentGenericStageInputAlphaVertexAlpha_1FadePerpendicular
---| EngineTagDataShaderTransparentGenericStageInputAlphaScratchAlpha_0
---| EngineTagDataShaderTransparentGenericStageInputAlphaScratchAlpha_1
---| EngineTagDataShaderTransparentGenericStageInputAlphaConstantAlpha_0
---| EngineTagDataShaderTransparentGenericStageInputAlphaConstantAlpha_1
---| EngineTagDataShaderTransparentGenericStageInputAlphaMapBlue_0
---| EngineTagDataShaderTransparentGenericStageInputAlphaMapBlue_1
---| EngineTagDataShaderTransparentGenericStageInputAlphaMapBlue_2
---| EngineTagDataShaderTransparentGenericStageInputAlphaMapBlue_3
---| EngineTagDataShaderTransparentGenericStageInputAlphaVertexBlue_0BlueLight
---| EngineTagDataShaderTransparentGenericStageInputAlphaVertexBlue_1FadeParallel
---| EngineTagDataShaderTransparentGenericStageInputAlphaScratchBlue_0
---| EngineTagDataShaderTransparentGenericStageInputAlphaScratchBlue_1
---| EngineTagDataShaderTransparentGenericStageInputAlphaConstantBlue_0
---| EngineTagDataShaderTransparentGenericStageInputAlphaConstantBlue_1

---@class EngineTagDataShaderTransparentGenericStageInputAlphaTable 
---@field lphaZero EngineTagDataShaderTransparentGenericStageInputAlphaZero
---@field lphaOne EngineTagDataShaderTransparentGenericStageInputAlphaOne
---@field lphaOneHalf EngineTagDataShaderTransparentGenericStageInputAlphaOneHalf
---@field lphaNegativeOne EngineTagDataShaderTransparentGenericStageInputAlphaNegativeOne
---@field lphaNegativeOneHalf EngineTagDataShaderTransparentGenericStageInputAlphaNegativeOneHalf
---@field lphaMapAlpha_0 EngineTagDataShaderTransparentGenericStageInputAlphaMapAlpha_0
---@field lphaMapAlpha_1 EngineTagDataShaderTransparentGenericStageInputAlphaMapAlpha_1
---@field lphaMapAlpha_2 EngineTagDataShaderTransparentGenericStageInputAlphaMapAlpha_2
---@field lphaMapAlpha_3 EngineTagDataShaderTransparentGenericStageInputAlphaMapAlpha_3
---@field lphaVertexAlpha_0FadeNone EngineTagDataShaderTransparentGenericStageInputAlphaVertexAlpha_0FadeNone
---@field lphaVertexAlpha_1FadePerpendicular EngineTagDataShaderTransparentGenericStageInputAlphaVertexAlpha_1FadePerpendicular
---@field lphaScratchAlpha_0 EngineTagDataShaderTransparentGenericStageInputAlphaScratchAlpha_0
---@field lphaScratchAlpha_1 EngineTagDataShaderTransparentGenericStageInputAlphaScratchAlpha_1
---@field lphaConstantAlpha_0 EngineTagDataShaderTransparentGenericStageInputAlphaConstantAlpha_0
---@field lphaConstantAlpha_1 EngineTagDataShaderTransparentGenericStageInputAlphaConstantAlpha_1
---@field lphaMapBlue_0 EngineTagDataShaderTransparentGenericStageInputAlphaMapBlue_0
---@field lphaMapBlue_1 EngineTagDataShaderTransparentGenericStageInputAlphaMapBlue_1
---@field lphaMapBlue_2 EngineTagDataShaderTransparentGenericStageInputAlphaMapBlue_2
---@field lphaMapBlue_3 EngineTagDataShaderTransparentGenericStageInputAlphaMapBlue_3
---@field lphaVertexBlue_0BlueLight EngineTagDataShaderTransparentGenericStageInputAlphaVertexBlue_0BlueLight
---@field lphaVertexBlue_1FadeParallel EngineTagDataShaderTransparentGenericStageInputAlphaVertexBlue_1FadeParallel
---@field lphaScratchBlue_0 EngineTagDataShaderTransparentGenericStageInputAlphaScratchBlue_0
---@field lphaScratchBlue_1 EngineTagDataShaderTransparentGenericStageInputAlphaScratchBlue_1
---@field lphaConstantBlue_0 EngineTagDataShaderTransparentGenericStageInputAlphaConstantBlue_0
---@field lphaConstantBlue_1 EngineTagDataShaderTransparentGenericStageInputAlphaConstantBlue_1
Engine.tag.shaderTransparentGenericStageInputAlpha = {} 

---@class EngineTagDataShaderTransparentGenericStageInputMappingColorEnum : Enum 

---@class EngineTagDataShaderTransparentGenericStageInputMappingColorClampX : EngineTagDataShaderTransparentGenericStageInputMappingColorEnum 
---@class EngineTagDataShaderTransparentGenericStageInputMappingColor_1ClampX : EngineTagDataShaderTransparentGenericStageInputMappingColorEnum 
---@class EngineTagDataShaderTransparentGenericStageInputMappingColor_2 : EngineTagDataShaderTransparentGenericStageInputMappingColorEnum 
---@class EngineTagDataShaderTransparentGenericStageInputMappingColor_1_2 : EngineTagDataShaderTransparentGenericStageInputMappingColorEnum 
---@class EngineTagDataShaderTransparentGenericStageInputMappingColorClampX_1_2 : EngineTagDataShaderTransparentGenericStageInputMappingColorEnum 
---@class EngineTagDataShaderTransparentGenericStageInputMappingColor_1_2ClampX : EngineTagDataShaderTransparentGenericStageInputMappingColorEnum 
---@class EngineTagDataShaderTransparentGenericStageInputMappingColorX : EngineTagDataShaderTransparentGenericStageInputMappingColorEnum 
---@class EngineTagDataShaderTransparentGenericStageInputMappingColorX_1 : EngineTagDataShaderTransparentGenericStageInputMappingColorEnum 

---@alias EngineTagDataShaderTransparentGenericStageInputMappingColor 
---| EngineTagDataShaderTransparentGenericStageInputMappingColorClampX
---| EngineTagDataShaderTransparentGenericStageInputMappingColor_1ClampX
---| EngineTagDataShaderTransparentGenericStageInputMappingColor_2
---| EngineTagDataShaderTransparentGenericStageInputMappingColor_1_2
---| EngineTagDataShaderTransparentGenericStageInputMappingColorClampX_1_2
---| EngineTagDataShaderTransparentGenericStageInputMappingColor_1_2ClampX
---| EngineTagDataShaderTransparentGenericStageInputMappingColorX
---| EngineTagDataShaderTransparentGenericStageInputMappingColorX_1

---@class EngineTagDataShaderTransparentGenericStageInputMappingColorTable 
---@field colorClampX EngineTagDataShaderTransparentGenericStageInputMappingColorClampX
---@field color_1ClampX EngineTagDataShaderTransparentGenericStageInputMappingColor_1ClampX
---@field color_2 EngineTagDataShaderTransparentGenericStageInputMappingColor_2
---@field color_1_2 EngineTagDataShaderTransparentGenericStageInputMappingColor_1_2
---@field colorClampX_1_2 EngineTagDataShaderTransparentGenericStageInputMappingColorClampX_1_2
---@field color_1_2ClampX EngineTagDataShaderTransparentGenericStageInputMappingColor_1_2ClampX
---@field colorX EngineTagDataShaderTransparentGenericStageInputMappingColorX
---@field colorX_1 EngineTagDataShaderTransparentGenericStageInputMappingColorX_1
Engine.tag.shaderTransparentGenericStageInputMappingColor = {} 

---@class EngineTagDataShaderTransparentGenericStageOutputFunctionEnum : Enum 

---@class EngineTagDataShaderTransparentGenericStageOutputFunctionMultiply : EngineTagDataShaderTransparentGenericStageOutputFunctionEnum 
---@class EngineTagDataShaderTransparentGenericStageOutputFunctionDotProduct : EngineTagDataShaderTransparentGenericStageOutputFunctionEnum 

---@alias EngineTagDataShaderTransparentGenericStageOutputFunction 
---| EngineTagDataShaderTransparentGenericStageOutputFunctionMultiply
---| EngineTagDataShaderTransparentGenericStageOutputFunctionDotProduct

---@class EngineTagDataShaderTransparentGenericStageOutputFunctionTable 
---@field tionMultiply EngineTagDataShaderTransparentGenericStageOutputFunctionMultiply
---@field tionDotProduct EngineTagDataShaderTransparentGenericStageOutputFunctionDotProduct
Engine.tag.shaderTransparentGenericStageOutputFunction = {} 

---@class EngineTagDataShaderTransparentGenericStageOutputMappingEnum : Enum 

---@class EngineTagDataShaderTransparentGenericStageOutputMappingColorIdentity : EngineTagDataShaderTransparentGenericStageOutputMappingEnum 
---@class EngineTagDataShaderTransparentGenericStageOutputMappingColorScaleBy_1_2 : EngineTagDataShaderTransparentGenericStageOutputMappingEnum 
---@class EngineTagDataShaderTransparentGenericStageOutputMappingColorScaleBy_2 : EngineTagDataShaderTransparentGenericStageOutputMappingEnum 
---@class EngineTagDataShaderTransparentGenericStageOutputMappingColorScaleBy_4 : EngineTagDataShaderTransparentGenericStageOutputMappingEnum 
---@class EngineTagDataShaderTransparentGenericStageOutputMappingColorBiasBy_1_2 : EngineTagDataShaderTransparentGenericStageOutputMappingEnum 
---@class EngineTagDataShaderTransparentGenericStageOutputMappingColorExpandNormal : EngineTagDataShaderTransparentGenericStageOutputMappingEnum 

---@alias EngineTagDataShaderTransparentGenericStageOutputMapping 
---| EngineTagDataShaderTransparentGenericStageOutputMappingColorIdentity
---| EngineTagDataShaderTransparentGenericStageOutputMappingColorScaleBy_1_2
---| EngineTagDataShaderTransparentGenericStageOutputMappingColorScaleBy_2
---| EngineTagDataShaderTransparentGenericStageOutputMappingColorScaleBy_4
---| EngineTagDataShaderTransparentGenericStageOutputMappingColorBiasBy_1_2
---| EngineTagDataShaderTransparentGenericStageOutputMappingColorExpandNormal

---@class EngineTagDataShaderTransparentGenericStageOutputMappingTable 
---@field pingColorIdentity EngineTagDataShaderTransparentGenericStageOutputMappingColorIdentity
---@field pingColorScaleBy_1_2 EngineTagDataShaderTransparentGenericStageOutputMappingColorScaleBy_1_2
---@field pingColorScaleBy_2 EngineTagDataShaderTransparentGenericStageOutputMappingColorScaleBy_2
---@field pingColorScaleBy_4 EngineTagDataShaderTransparentGenericStageOutputMappingColorScaleBy_4
---@field pingColorBiasBy_1_2 EngineTagDataShaderTransparentGenericStageOutputMappingColorBiasBy_1_2
---@field pingColorExpandNormal EngineTagDataShaderTransparentGenericStageOutputMappingColorExpandNormal
Engine.tag.shaderTransparentGenericStageOutputMapping = {} 

---@class EngineTagDataShaderTransparentGenericStageOutputEnum : Enum 

---@class EngineTagDataShaderTransparentGenericStageOutputAlphaDiscard : EngineTagDataShaderTransparentGenericStageOutputEnum 
---@class EngineTagDataShaderTransparentGenericStageOutputAlphaScratchAlpha_0FinalAlpha : EngineTagDataShaderTransparentGenericStageOutputEnum 
---@class EngineTagDataShaderTransparentGenericStageOutputAlphaScratchAlpha_1 : EngineTagDataShaderTransparentGenericStageOutputEnum 
---@class EngineTagDataShaderTransparentGenericStageOutputAlphaVertexAlpha_0Fog : EngineTagDataShaderTransparentGenericStageOutputEnum 
---@class EngineTagDataShaderTransparentGenericStageOutputAlphaVertexAlpha_1 : EngineTagDataShaderTransparentGenericStageOutputEnum 
---@class EngineTagDataShaderTransparentGenericStageOutputAlphaMapAlpha_0 : EngineTagDataShaderTransparentGenericStageOutputEnum 
---@class EngineTagDataShaderTransparentGenericStageOutputAlphaMapAlpha_1 : EngineTagDataShaderTransparentGenericStageOutputEnum 
---@class EngineTagDataShaderTransparentGenericStageOutputAlphaMapAlpha_2 : EngineTagDataShaderTransparentGenericStageOutputEnum 
---@class EngineTagDataShaderTransparentGenericStageOutputAlphaMapAlpha_3 : EngineTagDataShaderTransparentGenericStageOutputEnum 

---@alias EngineTagDataShaderTransparentGenericStageOutput 
---| EngineTagDataShaderTransparentGenericStageOutputAlphaDiscard
---| EngineTagDataShaderTransparentGenericStageOutputAlphaScratchAlpha_0FinalAlpha
---| EngineTagDataShaderTransparentGenericStageOutputAlphaScratchAlpha_1
---| EngineTagDataShaderTransparentGenericStageOutputAlphaVertexAlpha_0Fog
---| EngineTagDataShaderTransparentGenericStageOutputAlphaVertexAlpha_1
---| EngineTagDataShaderTransparentGenericStageOutputAlphaMapAlpha_0
---| EngineTagDataShaderTransparentGenericStageOutputAlphaMapAlpha_1
---| EngineTagDataShaderTransparentGenericStageOutputAlphaMapAlpha_2
---| EngineTagDataShaderTransparentGenericStageOutputAlphaMapAlpha_3

---@class EngineTagDataShaderTransparentGenericStageOutputTable 
---@field putAlphaDiscard EngineTagDataShaderTransparentGenericStageOutputAlphaDiscard
---@field putAlphaScratchAlpha_0FinalAlpha EngineTagDataShaderTransparentGenericStageOutputAlphaScratchAlpha_0FinalAlpha
---@field putAlphaScratchAlpha_1 EngineTagDataShaderTransparentGenericStageOutputAlphaScratchAlpha_1
---@field putAlphaVertexAlpha_0Fog EngineTagDataShaderTransparentGenericStageOutputAlphaVertexAlpha_0Fog
---@field putAlphaVertexAlpha_1 EngineTagDataShaderTransparentGenericStageOutputAlphaVertexAlpha_1
---@field putAlphaMapAlpha_0 EngineTagDataShaderTransparentGenericStageOutputAlphaMapAlpha_0
---@field putAlphaMapAlpha_1 EngineTagDataShaderTransparentGenericStageOutputAlphaMapAlpha_1
---@field putAlphaMapAlpha_2 EngineTagDataShaderTransparentGenericStageOutputAlphaMapAlpha_2
---@field putAlphaMapAlpha_3 EngineTagDataShaderTransparentGenericStageOutputAlphaMapAlpha_3
Engine.tag.shaderTransparentGenericStageOutput = {} 

---@class MetaEngineTagDataShaderTransparentGenericMapFlag 
---@field unfiltered boolean 
---@field uClamped boolean 
---@field vClamped boolean 

---@class MetaEngineTagDataShaderTransparentGenericStageFlags 
---@field colorMux boolean 
---@field alphaMux boolean 
---@field aOutControlsColor0Animation boolean 

---@class MetaEngineTagDataShaderTransparentGenericFlags 
---@field alphaTested boolean 
---@field decal boolean 
---@field twoSided boolean 
---@field firstMapIsInScreenspace boolean 
---@field drawBeforeWater boolean 
---@field ignoreEffect boolean 
---@field scaleFirstMapWithDistance boolean 
---@field numeric boolean 

---@class MetaEngineTagDataShaderTransparentGenericMap 
---@field flags MetaEngineTagDataShaderTransparentGenericMapFlag 
---@field mapUScale number 
---@field mapVScale number 
---@field mapUOffset number 
---@field mapVOffset number 
---@field mapRotation number 
---@field mapmapBias MetaEngineFraction 
---@field map MetaEngineTagDependency 
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

---@class MetaEngineTagDataShaderTransparentGenericStage 
---@field flags MetaEngineTagDataShaderTransparentGenericStageFlags 
---@field color0Source EngineTagDataFunctionNameNullable 
---@field color0AnimationFunction EngineTagDataWaveFunction 
---@field color0AnimationPeriod number 
---@field color0AnimationLowerBound MetaEngineColorARGB 
---@field color0AnimationUpperBound MetaEngineColorARGB 
---@field color1 MetaEngineColorARGB 
---@field inputA EngineTagDataShaderTransparentGenericStageInputColor 
---@field inputAMapping EngineTagDataShaderTransparentGenericStageInputMappingColor 
---@field inputB EngineTagDataShaderTransparentGenericStageInputColor 
---@field inputBMapping EngineTagDataShaderTransparentGenericStageInputMappingColor 
---@field inputC EngineTagDataShaderTransparentGenericStageInputColor 
---@field inputCMapping EngineTagDataShaderTransparentGenericStageInputMappingColor 
---@field inputD EngineTagDataShaderTransparentGenericStageInputColor 
---@field inputDMapping EngineTagDataShaderTransparentGenericStageInputMappingColor 
---@field outputAb EngineTagDataShaderTransparentGenericStageOutput 
---@field outputAbFunction EngineTagDataShaderTransparentGenericStageOutputFunction 
---@field outputBc EngineTagDataShaderTransparentGenericStageOutput 
---@field outputCdFunction EngineTagDataShaderTransparentGenericStageOutputFunction 
---@field outputAbCdMuxSum EngineTagDataShaderTransparentGenericStageOutput 
---@field outputMappingColor EngineTagDataShaderTransparentGenericStageOutputMapping 
---@field inputAAlpha EngineTagDataShaderTransparentGenericStageInputAlpha 
---@field inputAMappingAlpha EngineTagDataShaderTransparentGenericStageInputMappingColor 
---@field inputBAlpha EngineTagDataShaderTransparentGenericStageInputAlpha 
---@field inputBMappingAlpha EngineTagDataShaderTransparentGenericStageInputMappingColor 
---@field inputCAlpha EngineTagDataShaderTransparentGenericStageInputAlpha 
---@field inputCMappingAlpha EngineTagDataShaderTransparentGenericStageInputMappingColor 
---@field inputDAlpha EngineTagDataShaderTransparentGenericStageInputAlpha 
---@field inputDMappingAlpha EngineTagDataShaderTransparentGenericStageInputMappingColor 
---@field outputAbAlpha EngineTagDataShaderTransparentGenericStageOutput 
---@field outputCdAlpha EngineTagDataShaderTransparentGenericStageOutput 
---@field outputAbCdMuxSumAlpha EngineTagDataShaderTransparentGenericStageOutput 
---@field outputMappingAlpha EngineTagDataShaderTransparentGenericStageOutputMapping 

---@class MetaEngineTagDataShaderTransparentGeneric: MetaEngineTagDataShader  
---@field numericCounterLimit integer 
---@field shaderTransparentGenericFlags MetaEngineTagDataShaderTransparentGenericFlags 
---@field firstMapType EngineTagDataShaderFirstMapType 
---@field framebufferBlendFunction EngineTagDataFramebufferBlendFunction 
---@field framebufferFadeMode EngineTagDataFramebufferFadeMode 
---@field framebufferFadeSource EngineTagDataFunctionOut 
---@field lensFlareSpacing number 
---@field lensFlare MetaEngineTagDependency 
---@field extraLayers table<MetaEngineTagDataShaderTransparentExtraLayer> 
---@field maps table<MetaEngineTagDataShaderTransparentGenericMap> 
---@field stages table<MetaEngineTagDataShaderTransparentGenericStage> 

---@class MetaEngineTagDataHUDMessageTextElement 
---@field type integer 
---@field data integer 

---@class MetaEngineTagDataHUDMessageTextMessage 
---@field name MetaEngineTagString 
---@field startIndexIntoTextBlob MetaEngineIndex 
---@field startIndexOfMessageBlock MetaEngineIndex 
---@field panelCount integer 

---@class MetaEngineTagDataHudMessageText 
---@field textData MetaEngineTagDataOffset 
---@field messageElements table<MetaEngineTagDataHUDMessageTextElement> 
---@field messages table<MetaEngineTagDataHUDMessageTextMessage> 

---@class MetaEngineTagDataPreferencesNetworkGame 
---@field name MetaEngineTagString 
---@field primaryColor MetaEngineColorRGB 
---@field secondaryColor MetaEngineColorRGB 
---@field pattern MetaEngineTagDependency 
---@field patternBitmapIndex MetaEngineIndex 
---@field decal MetaEngineTagDependency 
---@field decalBitmapIndex MetaEngineIndex 

---@class MetaEngineTagDataShaderTransparentChicagoExtended: MetaEngineTagDataShader  
---@field numericCounterLimit integer 
---@field shaderTransparentChicagoExtendedFlags MetaEngineTagDataShaderTransparentGenericFlags 
---@field firstMapType EngineTagDataShaderFirstMapType 
---@field framebufferBlendFunction EngineTagDataFramebufferBlendFunction 
---@field framebufferFadeMode EngineTagDataFramebufferFadeMode 
---@field framebufferFadeSource EngineTagDataFunctionOut 
---@field lensFlareSpacing number 
---@field lensFlare MetaEngineTagDependency 
---@field extraLayers table<MetaEngineTagDataShaderTransparentExtraLayer> 
---@field maps_4Stage table<MetaEngineTagDataShaderTransparentChicagoMap> 
---@field maps_2Stage table<MetaEngineTagDataShaderTransparentChicagoMap> 
---@field extraFlags MetaEngineTagDataShaderTransparentChicagoExtraFlags 

---@class EngineTagDataBipedFunctionInEnum : Enum 

---@class EngineTagDataBipedFunctionInNone : EngineTagDataBipedFunctionInEnum 
---@class EngineTagDataBipedFunctionInFlyingVelocity : EngineTagDataBipedFunctionInEnum 

---@alias EngineTagDataBipedFunctionIn 
---| EngineTagDataBipedFunctionInNone
---| EngineTagDataBipedFunctionInFlyingVelocity

---@class EngineTagDataBipedFunctionInTable 
---@field nNone EngineTagDataBipedFunctionInNone
---@field nFlyingVelocity EngineTagDataBipedFunctionInFlyingVelocity
Engine.tag.bipedFunctionIn = {} 

---@class MetaEngineTagDataBipedFlags 
---@field turnsWithoutAnimating boolean 
---@field usesPlayerPhysics boolean 
---@field flying boolean 
---@field physicsPillCenteredAtOrigin boolean 
---@field spherical boolean 
---@field passesThroughOtherBipeds boolean 
---@field canClimbAnySurface boolean 
---@field immuneToFallingDamage boolean 
---@field rotateWhileAirborne boolean 
---@field usesLimpBodyPhysics boolean 
---@field hasNoDyingAirborne boolean 
---@field randomSpeedIncrease boolean 
---@field unitUsesOldNtscPlayerPhysics boolean 

---@class MetaEngineTagDataBipedContactPoint 
---@field markerName MetaEngineTagString 

---@class MetaEngineTagDataBiped: MetaEngineTagDataUnit  
---@field movingTurningSpeed MetaEngineAngle 
---@field bipedFlags MetaEngineTagDataBipedFlags 
---@field stationaryTurningThreshold MetaEngineAngle 
---@field bipedAIn EngineTagDataBipedFunctionIn 
---@field bipedBIn EngineTagDataBipedFunctionIn 
---@field bipedCIn EngineTagDataBipedFunctionIn 
---@field bipedDIn EngineTagDataBipedFunctionIn 
---@field dontUse MetaEngineTagDependency 
---@field bankAngle MetaEngineAngle 
---@field bankApplyTime number 
---@field bankDecayTime number 
---@field pitchRatio number 
---@field maxVelocity number 
---@field maxSidestepVelocity number 
---@field acceleration number 
---@field deceleration number 
---@field angularVelocityMaximum MetaEngineAngle 
---@field angularAccelerationMaximum MetaEngineAngle 
---@field crouchVelocityModifier number 
---@field maximumSlopeAngle MetaEngineAngle 
---@field downhillFalloffAngle MetaEngineAngle 
---@field downhillCutoffAngle MetaEngineAngle 
---@field downhillVelocityScale number 
---@field uphillFalloffAngle MetaEngineAngle 
---@field uphillCutoffAngle MetaEngineAngle 
---@field uphillVelocityScale number 
---@field footsteps MetaEngineTagDependency 
---@field jumpVelocity number 
---@field maximumSoftLandingTime number 
---@field maximumHardLandingTime number 
---@field minimumSoftLandingVelocity number 
---@field minimumHardLandingVelocity number 
---@field maximumHardLandingVelocity number 
---@field deathHardLandingVelocity number 
---@field standingCameraHeight number 
---@field crouchingCameraHeight number 
---@field crouchTransitionTime number 
---@field standingCollisionHeight number 
---@field crouchingCollisionHeight number 
---@field collisionRadius number 
---@field autoaimWidth number 
---@field cosineStationaryTurningThreshold number 
---@field crouchCameraVelocity number 
---@field cosineMaximumSlopeAngle number 
---@field negativeSineDownhillFalloffAngle number 
---@field negativeSineDownhillCutoffAngle number 
---@field sineUphillFalloffAngle number 
---@field sineUphillCutoffAngle number 
---@field pelvisModelNodeIndex MetaEngineIndex 
---@field headModelNodeIndex MetaEngineIndex 
---@field contactPoint table<MetaEngineTagDataBipedContactPoint> 

---@class MetaEngineTagDataLightVolumeFlags 
---@field interpolateColorInHsv boolean 
---@field moreColors boolean 

---@class MetaEngineTagDataLightVolumeFrame 
---@field offsetFromMarker number 
---@field offsetExponent number 
---@field length number 
---@field radiusHither number 
---@field radiusYon number 
---@field radiusExponent number 
---@field tintColorHither MetaEngineColorARGB 
---@field tintColorYon MetaEngineColorARGB 
---@field tintColorExponent number 
---@field brightnessExponent number 

---@class MetaEngineTagDataLightVolume 
---@field attachmentMarker MetaEngineTagString 
---@field flags MetaEngineTagDataLightVolumeFlags 
---@field nearFadeDistance number 
---@field farFadeDistance number 
---@field perpendicularBrightnessScale MetaEngineFraction 
---@field parallelBrightnessScale MetaEngineFraction 
---@field brightnessScaleSource EngineTagDataFunctionOut 
---@field map MetaEngineTagDependency 
---@field sequenceIndex MetaEngineIndex 
---@field count integer 
---@field frameAnimationSource EngineTagDataFunctionOut 
---@field frames table<MetaEngineTagDataLightVolumeFrame> 

---@class MetaEngineTagDataShaderTransparentChicagoMapFlags 
---@field unfiltered boolean 
---@field alphaReplicate boolean 
---@field uClamped boolean 
---@field vClamped boolean 

---@class MetaEngineTagDataShaderTransparentChicagoExtraFlags 
---@field dontFadeActiveCamouflage boolean 
---@field numericCountdownTimer boolean 
---@field customEditionBlending boolean 

---@class MetaEngineTagDataShaderTransparentChicagoMap 
---@field flags MetaEngineTagDataShaderTransparentChicagoMapFlags 
---@field colorFunction EngineTagDataShaderColorFunctionType 
---@field alphaFunction EngineTagDataShaderColorFunctionType 
---@field mapUScale number 
---@field mapVScale number 
---@field mapUOffset number 
---@field mapVOffset number 
---@field mapRotation number 
---@field mipmapBias MetaEngineFraction 
---@field map MetaEngineTagDependency 
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

---@class MetaEngineTagDataShaderTransparentChicago: MetaEngineTagDataShader  
---@field numericCounterLimit integer 
---@field shaderTransparentChicagoFlags MetaEngineTagDataShaderTransparentGenericFlags 
---@field firstMapType EngineTagDataShaderFirstMapType 
---@field framebufferBlendFunction EngineTagDataFramebufferBlendFunction 
---@field framebufferFadeMode EngineTagDataFramebufferFadeMode 
---@field framebufferFadeSource EngineTagDataFunctionOut 
---@field lensFlareSpacing number 
---@field lensFlare MetaEngineTagDependency 
---@field extraLayers table<MetaEngineTagDataShaderTransparentExtraLayer> 
---@field maps table<MetaEngineTagDataShaderTransparentChicagoMap> 
---@field extraFlags MetaEngineTagDataShaderTransparentChicagoExtraFlags 

---@class MetaEngineTagDataGBXModelGeometryPart: MetaEngineTagDataModelGeometryPart  
---@field localNodeCount integer 
---@field localNodeIndices integer 

---@class MetaEngineTagDataGBXModelGeometry 
---@field flags MetaEngineTagDataIsUnusedFlag 
---@field parts table<MetaEngineTagDataGBXModelGeometryPart> 

---@class MetaEngineTagDataGbxmodel 
---@field flags MetaEngineTagDataModelFlags 
---@field nodeListChecksum integer 
---@field superHighDetailCutoff number 
---@field highDetailCutoff number 
---@field mediumDetailCutoff number 
---@field lowDetailCutoff number 
---@field superLowDetailCutoff number 
---@field superLowDetailNodeCount integer 
---@field lowDetailNodeCount integer 
---@field mediumDetailNodeCount integer 
---@field highDetailNodeCount integer 
---@field superHighDetailNodeCount integer 
---@field baseMapUScale number 
---@field baseMapVScale number 
---@field markers table<MetaEngineTagDataModelMarker> 
---@field nodes table<MetaEngineTagDataModelNode> 
---@field regions table<MetaEngineTagDataModelRegion> 
---@field geometries table<MetaEngineTagDataGBXModelGeometry> 
---@field shaders table<MetaEngineTagDataModelShaderReference> 

---@class MetaEngineTagDataSoundScenery: MetaEngineTagDataBasicObject  

---@class EngineTagDataAnimationFunctionEnum : Enum 

---@class EngineTagDataAnimationFunctionAOut : EngineTagDataAnimationFunctionEnum 
---@class EngineTagDataAnimationFunctionBOut : EngineTagDataAnimationFunctionEnum 
---@class EngineTagDataAnimationFunctionCOut : EngineTagDataAnimationFunctionEnum 
---@class EngineTagDataAnimationFunctionDOut : EngineTagDataAnimationFunctionEnum 

---@alias EngineTagDataAnimationFunction 
---| EngineTagDataAnimationFunctionAOut
---| EngineTagDataAnimationFunctionBOut
---| EngineTagDataAnimationFunctionCOut
---| EngineTagDataAnimationFunctionDOut

---@class EngineTagDataAnimationFunctionTable 
---@field aOut EngineTagDataAnimationFunctionAOut
---@field bOut EngineTagDataAnimationFunctionBOut
---@field cOut EngineTagDataAnimationFunctionCOut
---@field dOut EngineTagDataAnimationFunctionDOut
Engine.tag.animationFunction = {} 

---@class EngineTagDataAnimationFunctionControlsEnum : Enum 

---@class EngineTagDataAnimationFunctionControlsFrame : EngineTagDataAnimationFunctionControlsEnum 
---@class EngineTagDataAnimationFunctionControlsScale : EngineTagDataAnimationFunctionControlsEnum 

---@alias EngineTagDataAnimationFunctionControls 
---| EngineTagDataAnimationFunctionControlsFrame
---| EngineTagDataAnimationFunctionControlsScale

---@class EngineTagDataAnimationFunctionControlsTable 
---@field sFrame EngineTagDataAnimationFunctionControlsFrame
---@field sScale EngineTagDataAnimationFunctionControlsScale
Engine.tag.animationFunctionControls = {} 

---@class EngineTagDataAnimationTypeEnum : Enum 

---@class EngineTagDataAnimationTypeBase : EngineTagDataAnimationTypeEnum 
---@class EngineTagDataAnimationTypeOverlay : EngineTagDataAnimationTypeEnum 
---@class EngineTagDataAnimationTypeReplacement : EngineTagDataAnimationTypeEnum 

---@alias EngineTagDataAnimationType 
---| EngineTagDataAnimationTypeBase
---| EngineTagDataAnimationTypeOverlay
---| EngineTagDataAnimationTypeReplacement

---@class EngineTagDataAnimationTypeTable 
---@field base EngineTagDataAnimationTypeBase
---@field overlay EngineTagDataAnimationTypeOverlay
---@field replacement EngineTagDataAnimationTypeReplacement
Engine.tag.animationType = {} 

---@class EngineTagDataAnimationFrameInfoTypeEnum : Enum 

---@class EngineTagDataAnimationFrameInfoTypeNone : EngineTagDataAnimationFrameInfoTypeEnum 
---@class EngineTagDataAnimationFrameInfoTypeDxDy : EngineTagDataAnimationFrameInfoTypeEnum 
---@class EngineTagDataAnimationFrameInfoTypeDxDyDyaw : EngineTagDataAnimationFrameInfoTypeEnum 
---@class EngineTagDataAnimationFrameInfoTypeDxDyDzDyaw : EngineTagDataAnimationFrameInfoTypeEnum 

---@alias EngineTagDataAnimationFrameInfoType 
---| EngineTagDataAnimationFrameInfoTypeNone
---| EngineTagDataAnimationFrameInfoTypeDxDy
---| EngineTagDataAnimationFrameInfoTypeDxDyDyaw
---| EngineTagDataAnimationFrameInfoTypeDxDyDzDyaw

---@class EngineTagDataAnimationFrameInfoTypeTable 
---@field peNone EngineTagDataAnimationFrameInfoTypeNone
---@field peDxDy EngineTagDataAnimationFrameInfoTypeDxDy
---@field peDxDyDyaw EngineTagDataAnimationFrameInfoTypeDxDyDyaw
---@field peDxDyDzDyaw EngineTagDataAnimationFrameInfoTypeDxDyDzDyaw
Engine.tag.animationFrameInfoType = {} 

---@class MetaEngineTagDataModelAnimationsAnimationGraphNodeFlags 
---@field ballSocket boolean 
---@field hinge boolean 
---@field noMovement boolean 

---@class MetaEngineTagDataModelAnimationsAnimationFlags 
---@field compressedData boolean 
---@field worldRelative boolean 
---@field _25hzPal boolean 

---@class MetaEngineTagDataModelAnimationsFlags 
---@field compressAllAnimations boolean 
---@field forceIdleCompression boolean 

---@class MetaEngineTagDataModelAnimationsRotation 
---@field rotation integer 

---@class MetaEngineTagDataModelAnimationsTransform 
---@field transform MetaEnginePoint3D 

---@class MetaEngineTagDataModelAnimationscale 
---@field scale MetaEngineFraction 

---@class MetaEngineTagDataModelAnimationsFrameInfoDxDy 
---@field dx number 
---@field dy number 

---@class MetaEngineTagDataModelAnimationsFrameInfoDxDyDyaw 
---@field dx number 
---@field dy number 
---@field dyaw number 

---@class MetaEngineTagDataModelAnimationsFrameInfoDxDyDzDyaw 
---@field dx number 
---@field dy number 
---@field dz number 
---@field dyaw number 

---@class MetaEngineTagDataModelAnimationsAnimationGraphObjectOverlay 
---@field animation MetaEngineIndex 
---@field function EngineTagDataAnimationFunction 
---@field functionControls EngineTagDataAnimationFunctionControls 

---@class MetaEngineTagDataModelAnimationsUnitSeatAnimation 
---@field animation MetaEngineIndex 

---@class MetaEngineTagDataModelAnimationsAnimationGraphUnitSeatikPoint 
---@field marker MetaEngineTagString 
---@field attachToMarker MetaEngineTagString 

---@class MetaEngineTagDataModelAnimationsAnimationWeaponClassAnimation 
---@field animation MetaEngineIndex 

---@class MetaEngineTagDataModelAnimationsAnimationWeaponTypeAnimation 
---@field animation MetaEngineIndex 

---@class MetaEngineTagDataModelAnimationsAnimationGraphWeaponType 
---@field label MetaEngineTagString 
---@field animations table<MetaEngineTagDataModelAnimationsAnimationWeaponTypeAnimation> 

---@class MetaEngineTagDataModelAnimationsAnimationGraphWeapon 
---@field name MetaEngineTagString 
---@field gripMarker MetaEngineTagString 
---@field handMarker MetaEngineTagString 
---@field rightYawPerFrame MetaEngineAngle 
---@field leftYawPerFrame MetaEngineAngle 
---@field rightFrameCount integer 
---@field leftFrameCount integer 
---@field downPitchPerFrame MetaEngineAngle 
---@field upPitchPerFrame MetaEngineAngle 
---@field downPitchFrameCount integer 
---@field upPitchFrameCount integer 
---@field animations table<MetaEngineTagDataModelAnimationsAnimationWeaponClassAnimation> 
---@field ikPoint table<MetaEngineTagDataModelAnimationsAnimationGraphUnitSeatikPoint> 
---@field weaponTypes table<MetaEngineTagDataModelAnimationsAnimationGraphWeaponType> 

---@class MetaEngineTagDataModelAnimationsAnimationGraphUnitSeat 
---@field label MetaEngineTagString 
---@field rightYawPerFrame MetaEngineAngle 
---@field leftYawPerFrame MetaEngineAngle 
---@field rightFrameCount integer 
---@field leftFrameCount integer 
---@field downPitchPerFrame MetaEngineAngle 
---@field upPitchPerFrame MetaEngineAngle 
---@field downPitchFrameCount integer 
---@field upPitchFrameCount integer 
---@field animations table<MetaEngineTagDataModelAnimationsAnimationWeaponClassAnimation> 
---@field ikPoints table<MetaEngineTagDataModelAnimationsAnimationGraphUnitSeatikPoint> 
---@field weapons table<MetaEngineTagDataModelAnimationsAnimationGraphWeapon> 

---@class MetaEngineTagDataModelAnimationsWeaponAnimation 
---@field animation MetaEngineIndex 

---@class MetaEngineTagDataModelAnimationsAnimationGraphWeaponAnimations 
---@field animations table<MetaEngineTagDataModelAnimationsWeaponAnimation> 

---@class MetaEngineTagDataModelAnimationsVehicleAnimation 
---@field animation MetaEngineIndex 

---@class MetaEngineTagDataModelAnimationSuspensionAnimation 
---@field massPointIndex MetaEngineIndex 
---@field animation MetaEngineIndex 
---@field fullExtensionGroundDepth number 
---@field fullCompressionGroundDepth number 

---@class MetaEngineTagDataModelAnimationsAnimationGraphVehicleAnimations 
---@field rightYawPerFrame MetaEngineAngle 
---@field leftYawPerFrame MetaEngineAngle 
---@field rightFrameCount integer 
---@field leftFrameCount integer 
---@field downPitchPerFrame MetaEngineAngle 
---@field upPitchPerFrame MetaEngineAngle 
---@field downPitchFrameCount integer 
---@field upPitchFrameCount integer 
---@field animations table<MetaEngineTagDataModelAnimationsVehicleAnimation> 
---@field suspensionAnimations table<MetaEngineTagDataModelAnimationSuspensionAnimation> 

---@class MetaEngineTagDataModelAnimationsDeviceAnimation 
---@field animation MetaEngineIndex 

---@class MetaEngineTagDataModelAnimationsDeviceAnimations 
---@field animations table<MetaEngineTagDataModelAnimationsDeviceAnimation> 

---@class MetaEngineTagDataModelAnimationsUnitDamageAnimations 
---@field animation MetaEngineIndex 

---@class MetaEngineTagDataModelAnimationsFirstPersonWeapon 
---@field animation MetaEngineIndex 

---@class MetaEngineTagDataModelAnimationsAnimationGraphFirstPersonWeaponAnimations 
---@field animations table<MetaEngineTagDataModelAnimationsFirstPersonWeapon> 

---@class MetaEngineTagDataModelAnimationsAnimationGraphSoundReference 
---@field sound MetaEngineTagDependency 

---@class MetaEngineTagDataModelAnimationsAnimationGraphNode 
---@field name MetaEngineTagString 
---@field nextSiblingNodeIndex MetaEngineIndex 
---@field firstChildNodeIndex MetaEngineIndex 
---@field parentNodeIndex MetaEngineIndex 
---@field nodeJointFlags MetaEngineTagDataModelAnimationsAnimationGraphNodeFlags 
---@field baseVector MetaEngineVector3D 
---@field vectorRange number 

---@class MetaEngineTagDataModelAnimationsAnimation 
---@field name MetaEngineTagString 
---@field type EngineTagDataAnimationType 
---@field frameCount integer 
---@field frameSize integer 
---@field frameInfoType EngineTagDataAnimationFrameInfoType 
---@field nodeListChecksum integer 
---@field nodeCount integer 
---@field loopFrameIndex MetaEngineIndex 
---@field weight MetaEngineFraction 
---@field keyFrameIndex MetaEngineIndex 
---@field secondKeyFrameIndex MetaEngineIndex 
---@field nextAnimation MetaEngineIndex 
---@field flags MetaEngineTagDataModelAnimationsAnimationFlags 
---@field sound MetaEngineIndex 
---@field soundFrameIndex MetaEngineIndex 
---@field leftFootFrameIndex integer 
---@field rightFootFrameIndex integer 
---@field mainAnimationIndex integer 
---@field relativeWeight number 
---@field frameInfo MetaEngineTagDataOffset 
---@field nodeTransformFlagData integer 
---@field nodeRotationFlagData integer 
---@field nodeScaleFlagData integer 
---@field offsetToCompressedData integer 
---@field defaultData MetaEngineTagDataOffset 
---@field frameData MetaEngineTagDataOffset 

---@class MetaEngineTagDataModelAnimations 
---@field objects table<MetaEngineTagDataModelAnimationsAnimationGraphObjectOverlay> 
---@field units table<MetaEngineTagDataModelAnimationsAnimationGraphUnitSeat> 
---@field weapons table<MetaEngineTagDataModelAnimationsAnimationGraphWeaponAnimations> 
---@field vehicles table<MetaEngineTagDataModelAnimationsAnimationGraphVehicleAnimations> 
---@field devices table<MetaEngineTagDataModelAnimationsDeviceAnimations> 
---@field unitDamage table<MetaEngineTagDataModelAnimationsUnitDamageAnimations> 
---@field firstPersonWeapons table<MetaEngineTagDataModelAnimationsAnimationGraphFirstPersonWeaponAnimations> 
---@field soundReferences table<MetaEngineTagDataModelAnimationsAnimationGraphSoundReference> 
---@field limpBodyNodeRadius number 
---@field flags MetaEngineTagDataModelAnimationsFlags 
---@field nodes table<MetaEngineTagDataModelAnimationsAnimationGraphNode> 
---@field animations table<MetaEngineTagDataModelAnimationsAnimation> 

---@class MetaEngineTagDataGarbage: MetaEngineTagDataItem  

---@class EngineTagDataDeviceTypeEnum : Enum 

---@class EngineTagDataDeviceTypeToggleSwitch : EngineTagDataDeviceTypeEnum 
---@class EngineTagDataDeviceTypeOnButton : EngineTagDataDeviceTypeEnum 
---@class EngineTagDataDeviceTypeOffButton : EngineTagDataDeviceTypeEnum 
---@class EngineTagDataDeviceTypeCallButton : EngineTagDataDeviceTypeEnum 

---@alias EngineTagDataDeviceType 
---| EngineTagDataDeviceTypeToggleSwitch
---| EngineTagDataDeviceTypeOnButton
---| EngineTagDataDeviceTypeOffButton
---| EngineTagDataDeviceTypeCallButton

---@class EngineTagDataDeviceTypeTable 
---@field toggleSwitch EngineTagDataDeviceTypeToggleSwitch
---@field onButton EngineTagDataDeviceTypeOnButton
---@field offButton EngineTagDataDeviceTypeOffButton
---@field callButton EngineTagDataDeviceTypeCallButton
Engine.tag.deviceType = {} 

---@class EngineTagDataDeviceTriggersWhenEnum : Enum 

---@class EngineTagDataDeviceTriggersWhenTouchedByPlayer : EngineTagDataDeviceTriggersWhenEnum 
---@class EngineTagDataDeviceTriggersWhenDestroyed : EngineTagDataDeviceTriggersWhenEnum 

---@alias EngineTagDataDeviceTriggersWhen 
---| EngineTagDataDeviceTriggersWhenTouchedByPlayer
---| EngineTagDataDeviceTriggersWhenDestroyed

---@class EngineTagDataDeviceTriggersWhenTable 
---@field nTouchedByPlayer EngineTagDataDeviceTriggersWhenTouchedByPlayer
---@field nDestroyed EngineTagDataDeviceTriggersWhenDestroyed
Engine.tag.deviceTriggersWhen = {} 

---@class MetaEngineTagDataDeviceControl: MetaEngineTagDataDevice  
---@field type EngineTagDataDeviceType 
---@field triggersWhen EngineTagDataDeviceTriggersWhen 
---@field callValue number 
---@field on MetaEngineTagDependency 
---@field off MetaEngineTagDependency 
---@field deny MetaEngineTagDependency 

---@class EngineTagDataPhysicsFrictionTypeEnum : Enum 

---@class EngineTagDataPhysicsFrictionTypePoint : EngineTagDataPhysicsFrictionTypeEnum 
---@class EngineTagDataPhysicsFrictionTypeForward : EngineTagDataPhysicsFrictionTypeEnum 
---@class EngineTagDataPhysicsFrictionTypeLeft : EngineTagDataPhysicsFrictionTypeEnum 
---@class EngineTagDataPhysicsFrictionTypeUp : EngineTagDataPhysicsFrictionTypeEnum 

---@alias EngineTagDataPhysicsFrictionType 
---| EngineTagDataPhysicsFrictionTypePoint
---| EngineTagDataPhysicsFrictionTypeForward
---| EngineTagDataPhysicsFrictionTypeLeft
---| EngineTagDataPhysicsFrictionTypeUp

---@class EngineTagDataPhysicsFrictionTypeTable 
---@field ePoint EngineTagDataPhysicsFrictionTypePoint
---@field eForward EngineTagDataPhysicsFrictionTypeForward
---@field eLeft EngineTagDataPhysicsFrictionTypeLeft
---@field eUp EngineTagDataPhysicsFrictionTypeUp
Engine.tag.physicsFrictionType = {} 

---@class MetaEngineTagDataPhysicsPoweredMassPointFlags 
---@field groundFriction boolean 
---@field waterFriction boolean 
---@field airFriction boolean 
---@field waterLift boolean 
---@field airLift boolean 
---@field thrust boolean 
---@field antigrav boolean 

---@class MetaEngineTagDataPhysicsMassPointFlags 
---@field metallic boolean 

---@class MetaEngineTagDataPhysicsInertialMatrix 
---@field matrix MetaEngineMatrix 

---@class MetaEngineTagDataPhysicsPoweredMassPoint 
---@field name MetaEngineTagString 
---@field flags MetaEngineTagDataPhysicsPoweredMassPointFlags 
---@field antigravStrength number 
---@field antigravOffset number 
---@field antigravHeight number 
---@field antigravDampFraction number 
---@field antigravNormalK1 number 
---@field antigravNormalK0 number 

---@class MetaEngineTagDataPhysicsMassPoint 
---@field name MetaEngineTagString 
---@field poweredMassPoint integer 
---@field modelNode integer 
---@field flags MetaEngineTagDataPhysicsMassPointFlags 
---@field relativeMass number 
---@field mass number 
---@field relativeDensity number 
---@field density number 
---@field position MetaEnginePoint3D 
---@field forward MetaEngineVector3D 
---@field up MetaEngineVector3D 
---@field frictionType EngineTagDataPhysicsFrictionType 
---@field frictionParallelScale number 
---@field frictionPerpendicularScale number 
---@field radius number 

---@class MetaEngineTagDataPhysics 
---@field radius number 
---@field momentScale MetaEngineFraction 
---@field mass number 
---@field centerOfMass MetaEnginePoint3D 
---@field density number 
---@field gravityScale number 
---@field groundFriction number 
---@field groundDepth number 
---@field groundDampFraction MetaEngineFraction 
---@field groundNormalK1 number 
---@field groundNormalK0 number 
---@field waterFriction number 
---@field waterDepth number 
---@field waterDensity number 
---@field airFriction MetaEngineFraction 
---@field xxMoment number 
---@field yyMoment number 
---@field zzMoment number 
---@field inertialMatrixAndInverse table<MetaEngineTagDataPhysicsInertialMatrix> 
---@field poweredMassPoints table<MetaEngineTagDataPhysicsPoweredMassPoint> 
---@field massPoints table<MetaEngineTagDataPhysicsMassPoint> 

---@class MetaEngineTagDataPlaceholder: MetaEngineTagDataBasicObject  

---@class EngineTagDataContrailRenderTypeEnum : Enum 

---@class EngineTagDataContrailRenderTypeVerticalOrientation : EngineTagDataContrailRenderTypeEnum 
---@class EngineTagDataContrailRenderTypeHorizontalOrientation : EngineTagDataContrailRenderTypeEnum 
---@class EngineTagDataContrailRenderTypeMediaMapped : EngineTagDataContrailRenderTypeEnum 
---@class EngineTagDataContrailRenderTypeGroundMapped : EngineTagDataContrailRenderTypeEnum 
---@class EngineTagDataContrailRenderTypeViewerFacing : EngineTagDataContrailRenderTypeEnum 
---@class EngineTagDataContrailRenderTypeDoubleMarkerLinked : EngineTagDataContrailRenderTypeEnum 

---@alias EngineTagDataContrailRenderType 
---| EngineTagDataContrailRenderTypeVerticalOrientation
---| EngineTagDataContrailRenderTypeHorizontalOrientation
---| EngineTagDataContrailRenderTypeMediaMapped
---| EngineTagDataContrailRenderTypeGroundMapped
---| EngineTagDataContrailRenderTypeViewerFacing
---| EngineTagDataContrailRenderTypeDoubleMarkerLinked

---@class EngineTagDataContrailRenderTypeTable 
---@field eVerticalOrientation EngineTagDataContrailRenderTypeVerticalOrientation
---@field eHorizontalOrientation EngineTagDataContrailRenderTypeHorizontalOrientation
---@field eMediaMapped EngineTagDataContrailRenderTypeMediaMapped
---@field eGroundMapped EngineTagDataContrailRenderTypeGroundMapped
---@field eViewerFacing EngineTagDataContrailRenderTypeViewerFacing
---@field eDoubleMarkerLinked EngineTagDataContrailRenderTypeDoubleMarkerLinked
Engine.tag.contrailRenderType = {} 

---@class MetaEngineTagDataContrailPointStateScaleFlags 
---@field duration boolean 
---@field durationDelta boolean 
---@field transitionDuration boolean 
---@field transitionDurationDelta boolean 
---@field width boolean 
---@field color boolean 

---@class MetaEngineTagDataContrailFlags 
---@field firstPointUnfaded boolean 
---@field lastPointUnfaded boolean 
---@field pointsStartPinnedToMedia boolean 
---@field pointsStartPinnedToGround boolean 
---@field pointsAlwaysPinnedToMedia boolean 
---@field pointsAlwaysPinnedToGround boolean 
---@field edgeEffectFadesSlowly boolean 

---@class MetaEngineTagDataContrailScaleFlags 
---@field pointGenerationRate boolean 
---@field pointVelocity boolean 
---@field pointVelocityDelta boolean 
---@field pointVelocityConeAngle boolean 
---@field inheritedVelocityFraction boolean 
---@field sequenceAnimationRate boolean 
---@field textureScaleU boolean 
---@field textureScaleV boolean 
---@field textureAnimationU boolean 
---@field textureAnimationV boolean 

---@class MetaEngineTagDataContrailPointState 
---@field duration number 
---@field transitionDuration number 
---@field physics MetaEngineTagDependency 
---@field width number 
---@field colorLowerBound MetaEngineColorARGB 
---@field colorUpperBound MetaEngineColorARGB 
---@field scaleFlags MetaEngineTagDataContrailPointStateScaleFlags 

---@class MetaEngineTagDataContrail 
---@field flags MetaEngineTagDataContrailFlags 
---@field scaleFlags MetaEngineTagDataContrailScaleFlags 
---@field pointGenerationRate number 
---@field pointVelocity number 
---@field pointVelocityConeAngle MetaEngineAngle 
---@field inheritedVelocityFraction MetaEngineFraction 
---@field renderType EngineTagDataContrailRenderType 
---@field textureRepeatsU number 
---@field textureRepeatsV number 
---@field textureAnimationU number 
---@field textureAnimationV number 
---@field animationRate number 
---@field bitmap MetaEngineTagDependency 
---@field firstSequenceIndex MetaEngineIndex 
---@field sequenceCount integer 
---@field unknownInt integer 
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
---@field rotationAnimationScale MetaEngineAngle 
---@field rotationAnimationCenter MetaEnginePoint2D 
---@field zspriteRadiusScale number 
---@field pointStates table<MetaEngineTagDataContrailPointState> 

---@class MetaEngineTagDataCameraTrackControlPoint 
---@field position MetaEnginePoint3D 
---@field orientation MetaEngineQuaternion 

---@class MetaEngineTagDataCameraTrack 
---@field flags MetaEngineTagDataIsUnusedFlag 
---@field controlPoints table<MetaEngineTagDataCameraTrackControlPoint> 

---@class MetaEngineTagDataLightFlags 
---@field dynamic boolean 
---@field noSpecular boolean 
---@field dontLightOwnObject boolean 
---@field supersizeInFirstPerson boolean 
---@field firstPersonFlashlight boolean 
---@field dontFadeActiveCamouflage boolean 

---@class MetaEngineTagDataLight 
---@field flags MetaEngineTagDataLightFlags 
---@field radius number 
---@field radiusModifer number 
---@field falloffAngle MetaEngineAngle 
---@field cutoffAngle MetaEngineAngle 
---@field lensFlareOnlyRadius number 
---@field cosFalloffAngle number 
---@field cosCutoffAngle number 
---@field unknownTwo number 
---@field sinCutoffAngle number 
---@field interpolationFlags MetaEngineTagDataColorInterpolationFlags 
---@field colorLowerBound MetaEngineColorARGB 
---@field colorUpperBound MetaEngineColorARGB 
---@field primaryCubeMap MetaEngineTagDependency 
---@field textureAnimationFunction EngineTagDataWaveFunction 
---@field textureAnimationPeriod number 
---@field secondaryCubeMap MetaEngineTagDependency 
---@field yawFunction EngineTagDataWaveFunction 
---@field yawPeriod number 
---@field rollFunction EngineTagDataWaveFunction 
---@field rollPeriod number 
---@field pitchFunction EngineTagDataWaveFunction 
---@field pitchPeriod number 
---@field lensFlare MetaEngineTagDependency 
---@field intensity number 
---@field color MetaEngineColorRGB 
---@field duration number 
---@field falloffFunction EngineTagDataFunctionType 

---@class MetaEngineTagDataScenarioStructureBSPMaterialFlags 
---@field coplanar boolean 
---@field fogPlane boolean 

---@class MetaEngineTagDataScenarioStructureBSPClusterPortalFlags 
---@field aiCanSimplyNotHearThroughAllThisAmazingStuffDarnIt boolean 

---@class MetaEngineTagDataScenarioStructureBSPCollisionMaterial 
---@field shader MetaEngineTagDependency 
---@field material EngineTagDataMaterialType 

---@class MetaEngineTagDataScenarioStructureBSPNode 
---@field nodeStuff integer 

---@class MetaEngineTagDataScenarioStructureBSPLeaf 
---@field vertices integer 
---@field cluster MetaEngineIndex 
---@field surfaceReferenceCount integer 
---@field surfaceReferences integer 

---@class MetaEngineTagDataScenarioStructureBSPSurfaceReference 
---@field surface integer 
---@field node integer 

---@class MetaEngineTagDataScenarioStructureBSPSurface 
---@field vertex0Index MetaEngineIndex 
---@field vertex1Index MetaEngineIndex 
---@field vertex2Index MetaEngineIndex 

---@class MetaEngineTagDataScenarioStructureBSPMaterialUncompressedRenderedVertex 
---@field position MetaEnginePoint3D 
---@field normal MetaEngineVector3D 
---@field binormal MetaEngineVector3D 
---@field tangent MetaEngineVector3D 
---@field textureCoords MetaEnginePoint2D 

---@class MetaEngineTagDataScenarioStructureBSPMaterialCompressedRenderedVertex 
---@field position MetaEnginePoint3D 
---@field normal integer 
---@field binormal integer 
---@field tangent integer 
---@field textureCoords MetaEnginePoint2D 

---@class MetaEngineTagDataScenarioStructureBSPMaterialUncompressedLightmapVertex 
---@field normal MetaEngineVector3D 
---@field textureCoords MetaEnginePoint2D 

---@class MetaEngineTagDataScenarioStructureBSPMaterialCompressedLightmapVertex 
---@field normal integer 
---@field textureCoordinateX integer 
---@field textureCoordinateY integer 

---@class MetaEngineTagDataScenarioStructureBSPMaterial 
---@field shader MetaEngineTagDependency 
---@field shaderPermutation MetaEngineIndex 
---@field flags MetaEngineTagDataScenarioStructureBSPMaterialFlags 
---@field surfaces integer 
---@field surfaceCount integer 
---@field centroid MetaEnginePoint3D 
---@field ambientColor MetaEngineColorRGB 
---@field distantLightCount integer 
---@field distantLight_0Color MetaEngineColorRGB 
---@field distantLight_0Direction MetaEngineVector3D 
---@field distantLight_1Color MetaEngineColorRGB 
---@field distantLight_1Direction MetaEngineVector3D 
---@field reflectionTint MetaEngineColorARGB 
---@field shadowVector MetaEngineVector3D 
---@field shadowColor MetaEngineColorRGB 
---@field plane MetaEnginePlane3D 
---@field breakableSurface MetaEngineIndex 
---@field renderedVerticesType EngineTagDataVertexType 
---@field renderedVerticesCount integer 
---@field renderedVerticesOffset integer 
---@field renderedVerticesIndexPointer integer 
---@field lightmapVerticesType EngineTagDataVertexType 
---@field lightmapVerticesCount integer 
---@field lightmapVerticesOffset integer 
---@field lightmapVerticesIndexPointer integer 
---@field uncompressedVertices MetaEngineTagDataOffset 
---@field compressedVertices MetaEngineTagDataOffset 

---@class MetaEngineTagDataScenarioStructureBSPLightmap 
---@field bitmap MetaEngineIndex 
---@field materials table<MetaEngineTagDataScenarioStructureBSPMaterial> 

---@class MetaEngineTagDataScenarioStructureBSPLensFlare 
---@field lens MetaEngineTagDependency 

---@class MetaEngineTagDataScenarioStructureBSPLensFlareMarker 
---@field position MetaEnginePoint3D 
---@field directionIComponent integer 
---@field directionJComponent integer 
---@field directionKComponent integer 
---@field lensFlareIndex integer 

---@class MetaEngineTagDataScenarioStructureBSPSubclusterSurfaceIndex 
---@field index integer 

---@class MetaEngineTagDataScenarioStructureBSPSubcluster 
---@field worldBoundsX number 
---@field worldBoundsY number 
---@field worldBoundsZ number 
---@field surfaceIndices table<MetaEngineTagDataScenarioStructureBSPSubclusterSurfaceIndex> 

---@class MetaEngineTagDataScenarioStructureBSPClusterSurfaceIndex 
---@field index integer 

---@class MetaEngineTagDataScenarioStructureBSPMirrorVertex 
---@field point MetaEnginePoint3D 

---@class MetaEngineTagDataScenarioStructureBSPMirror 
---@field plane MetaEnginePlane3D 
---@field shader MetaEngineTagDependency 
---@field vertices table<MetaEngineTagDataScenarioStructureBSPMirrorVertex> 

---@class MetaEngineTagDataScenarioStructureBSPClusterPortalIndex 
---@field portal MetaEngineIndex 

---@class MetaEngineTagDataScenarioStructureBSPCluster 
---@field sky MetaEngineIndex 
---@field fog MetaEngineIndex 
---@field backgroundSound MetaEngineIndex 
---@field soundEnvironment MetaEngineIndex 
---@field weather MetaEngineIndex 
---@field transitionStructureBsp MetaEngineIndex 
---@field firstDecalIndex MetaEngineIndex 
---@field decalCount integer 
---@field predictedResources table<MetaEngineTagDataPredictedResource> 
---@field subclusters table<MetaEngineTagDataScenarioStructureBSPSubcluster> 
---@field firstLensFlareMarkerIndex MetaEngineIndex 
---@field lensFlareMarkerCount integer 
---@field surfaceIndices table<MetaEngineTagDataScenarioStructureBSPClusterSurfaceIndex> 
---@field mirrors table<MetaEngineTagDataScenarioStructureBSPMirror> 
---@field portals table<MetaEngineTagDataScenarioStructureBSPClusterPortalIndex> 

---@class MetaEngineTagDataScenarioStructureBSPClusterPortalVertex 
---@field point MetaEnginePoint3D 

---@class MetaEngineTagDataScenarioStructureBSPClusterPortal 
---@field frontCluster MetaEngineIndex 
---@field backCluster MetaEngineIndex 
---@field planeIndex integer 
---@field centroid MetaEnginePoint3D 
---@field boundingRadius number 
---@field flags MetaEngineTagDataScenarioStructureBSPClusterPortalFlags 
---@field vertices table<MetaEngineTagDataScenarioStructureBSPClusterPortalVertex> 

---@class MetaEngineTagDataScenarioStructureBSPBreakableSurface 
---@field centroid MetaEnginePoint3D 
---@field radius number 
---@field collisionSurfaceIndex integer 

---@class MetaEngineTagDataScenarioStructureBSPFogPlaneVertex 
---@field point MetaEnginePoint3D 

---@class MetaEngineTagDataScenarioStructureBSPFogPlane 
---@field frontRegion MetaEngineIndex 
---@field materialType EngineTagDataMaterialType 
---@field plane MetaEnginePlane3D 
---@field vertices table<MetaEngineTagDataScenarioStructureBSPFogPlaneVertex> 

---@class MetaEngineTagDataScenarioStructureBSPFogRegion 
---@field fog MetaEngineIndex 
---@field weatherPalette MetaEngineIndex 

---@class MetaEngineTagDataScenarioStructureBSPFogPalette 
---@field name MetaEngineTagString 
---@field fog MetaEngineTagDependency 
---@field fogScaleFunction MetaEngineTagString 

---@class MetaEngineTagDataScenarioStructureBSPWeatherPalette 
---@field name MetaEngineTagString 
---@field particleSystem MetaEngineTagDependency 
---@field particleSystemScaleFunction MetaEngineTagString 
---@field wind MetaEngineTagDependency 
---@field windDirection MetaEngineVector3D 
---@field windMagnitude number 
---@field windScaleFunction MetaEngineTagString 

---@class MetaEngineTagDataScenarioStructureBSPWeatherPolyhedronPlane 
---@field plane MetaEnginePlane3D 

---@class MetaEngineTagDataScenarioStructureBSPWeatherPolyhedron 
---@field boundingSphereCenter MetaEnginePoint3D 
---@field boundingSphereRadius number 
---@field planes table<MetaEngineTagDataScenarioStructureBSPWeatherPolyhedronPlane> 

---@class MetaEngineTagDataScenarioStructureBSPPathfindingSurface 
---@field data integer 

---@class MetaEngineTagDataScenarioStructureBSPPathfindingEdge 
---@field midpoint integer 

---@class MetaEngineTagDataScenarioStructureBSPBackgroundSoundPalette 
---@field name MetaEngineTagString 
---@field backgroundSound MetaEngineTagDependency 
---@field scaleFunction MetaEngineTagString 

---@class MetaEngineTagDataScenarioStructureBSPSoundEnvironmentPalette 
---@field name MetaEngineTagString 
---@field soundEnvironment MetaEngineTagDependency 

---@class MetaEngineTagDataScenarioStructureBSPMarker 
---@field name MetaEngineTagString 
---@field rotation MetaEngineQuaternion 
---@field position MetaEnginePoint3D 

---@class MetaEngineTagDataScenarioStructureBSPGlobalDetailObjectCell 
---@field cellX integer 
---@field cellY integer 
---@field cellZ integer 
---@field offsetZ integer 
---@field validLayersFlags integer 
---@field startIndex integer 
---@field countIndex integer 

---@class MetaEngineTagDataScenarioStructureBSPGlobalDetailObject 
---@field positionX integer 
---@field positionY integer 
---@field positionZ integer 
---@field data integer 
---@field color integer 

---@class MetaEngineTagDataScenarioStructureBSPGlobalDetailObjectCount 
---@field count integer 

---@class MetaEngineTagDataScenarioStructureBSPGlobalZReferenceVector 
---@field zReferenceI number 
---@field zReferenceJ number 
---@field zReferenceK number 
---@field zReferenceL number 

---@class MetaEngineTagDataScenarioStructureBSPDetailObjectData 
---@field cells table<MetaEngineTagDataScenarioStructureBSPGlobalDetailObjectCell> 
---@field instances table<MetaEngineTagDataScenarioStructureBSPGlobalDetailObject> 
---@field counts table<MetaEngineTagDataScenarioStructureBSPGlobalDetailObjectCount> 
---@field zReferenceVectors table<MetaEngineTagDataScenarioStructureBSPGlobalZReferenceVector> 
---@field bullshit integer 

---@class MetaEngineTagDataScenarioStructureBSPRuntimeDecal 
---@field position MetaEnginePoint3D 
---@field decalType MetaEngineIndex 
---@field yaw integer 
---@field pitch integer 

---@class MetaEngineTagDataScenarioStructureBSPMapLeafFaceVertex 
---@field vertex MetaEnginePoint2D 

---@class MetaEngineTagDataScenarioStructureBSPMapLeafFace 
---@field nodeIndex integer 
---@field vertices table<MetaEngineTagDataScenarioStructureBSPMapLeafFaceVertex> 

---@class MetaEngineTagDataScenarioStructureBSPMapLeafPortalIndex 
---@field portalIndex integer 

---@class MetaEngineTagDataScenarioStructureBSPGlobalMapLeaf 
---@field faces table<MetaEngineTagDataScenarioStructureBSPMapLeafFace> 
---@field portalIndices table<MetaEngineTagDataScenarioStructureBSPMapLeafPortalIndex> 

---@class MetaEngineTagDataScenarioStructureBSPLeafPortalVertex 
---@field point MetaEnginePoint3D 

---@class MetaEngineTagDataScenarioStructureBSPGlobalLeafPortal 
---@field planeIndex integer 
---@field backLeafIndex integer 
---@field frontLeafIndex integer 
---@field vertices table<MetaEngineTagDataScenarioStructureBSPLeafPortalVertex> 

---@class MetaEngineTagDataScenarioStructureBsp 
---@field lightmapsBitmap MetaEngineTagDependency 
---@field vehicleFloor number 
---@field vehicleCeiling number 
---@field defaultAmbientColor MetaEngineColorRGB 
---@field defaultDistantLight_0Color MetaEngineColorRGB 
---@field defaultDistantLight_0Direction MetaEngineVector3D 
---@field defaultDistantLight_1Color MetaEngineColorRGB 
---@field defaultDistantLight_1Direction MetaEngineVector3D 
---@field defaultReflectionTint MetaEngineColorARGB 
---@field defaultShadowVector MetaEngineVector3D 
---@field defaultShadowColor MetaEngineColorRGB 
---@field collisionMaterials table<MetaEngineTagDataScenarioStructureBSPCollisionMaterial> 
---@field collisionBsp table<MetaEngineTagDataModelCollisionGeometryBSP> 
---@field nodes table<MetaEngineTagDataScenarioStructureBSPNode> 
---@field worldBoundsX number 
---@field worldBoundsY number 
---@field worldBoundsZ number 
---@field leaves table<MetaEngineTagDataScenarioStructureBSPLeaf> 
---@field leafSurfaces table<MetaEngineTagDataScenarioStructureBSPSurfaceReference> 
---@field surfaces table<MetaEngineTagDataScenarioStructureBSPSurface> 
---@field lightmaps table<MetaEngineTagDataScenarioStructureBSPLightmap> 
---@field lensFlares table<MetaEngineTagDataScenarioStructureBSPLensFlare> 
---@field lensFlareMarkers table<MetaEngineTagDataScenarioStructureBSPLensFlareMarker> 
---@field clusters table<MetaEngineTagDataScenarioStructureBSPCluster> 
---@field clusterData MetaEngineTagDataOffset 
---@field clusterPortals table<MetaEngineTagDataScenarioStructureBSPClusterPortal> 
---@field breakableSurfaces table<MetaEngineTagDataScenarioStructureBSPBreakableSurface> 
---@field fogPlanes table<MetaEngineTagDataScenarioStructureBSPFogPlane> 
---@field fogRegions table<MetaEngineTagDataScenarioStructureBSPFogRegion> 
---@field fogPalette table<MetaEngineTagDataScenarioStructureBSPFogPalette> 
---@field weatherPalette table<MetaEngineTagDataScenarioStructureBSPWeatherPalette> 
---@field weatherPolyhedra table<MetaEngineTagDataScenarioStructureBSPWeatherPolyhedron> 
---@field pathfindingSurfaces table<MetaEngineTagDataScenarioStructureBSPPathfindingSurface> 
---@field pathfindingEdges table<MetaEngineTagDataScenarioStructureBSPPathfindingEdge> 
---@field backgroundSoundPalette table<MetaEngineTagDataScenarioStructureBSPBackgroundSoundPalette> 
---@field soundEnvironmentPalette table<MetaEngineTagDataScenarioStructureBSPSoundEnvironmentPalette> 
---@field soundPasData MetaEngineTagDataOffset 
---@field markers table<MetaEngineTagDataScenarioStructureBSPMarker> 
---@field detailObjects table<MetaEngineTagDataScenarioStructureBSPDetailObjectData> 
---@field runtimeDecals table<MetaEngineTagDataScenarioStructureBSPRuntimeDecal> 
---@field leafMapLeaves table<MetaEngineTagDataScenarioStructureBSPGlobalMapLeaf> 
---@field leafMapPortals table<MetaEngineTagDataScenarioStructureBSPGlobalLeafPortal> 

---@class MetaEngineTagDataScenarioStructureBSPCompiledHeader 
---@field pointer integer 
---@field lightmapMaterialCount integer 
---@field renderedVertices integer 
---@field lightmapMaterialCountAgain integer 
---@field lightmapVertices integer 
---@field signature EngineTagClass 

---@class MetaEngineTagDataScenarioStructureBSPCompiledHeaderCEA 
---@field pointer integer 
---@field lightmapVertexSize integer 
---@field lightmapVertices integer 
---@field signature EngineTagClass 

---@class MetaEngineTagDataFogFlags 
---@field isWater boolean 
---@field atmosphereDominant boolean 
---@field fogScreenOnly boolean 

---@class MetaEngineTagDataFogScreenFlags 
---@field noEnvironmentMultipass boolean 
---@field noModelMultipass boolean 
---@field noTextureBasedFalloff boolean 

---@class MetaEngineTagDataFog 
---@field flags MetaEngineTagDataFogFlags 
---@field maximumDensity MetaEngineFraction 
---@field opaqueDistance number 
---@field opaqueDepth number 
---@field distanceToWaterPlane number 
---@field color MetaEngineColorRGB 
---@field flags_1 MetaEngineTagDataFogScreenFlags 
---@field layerCount integer 
---@field distanceGradient number 
---@field densityGradient MetaEngineFraction 
---@field startDistanceFromFogPlane number 
---@field screenLayersColor MetaEngineColorARGBInt 
---@field rotationMultiplier MetaEngineFraction 
---@field strafingMultiplier MetaEngineFraction 
---@field zoomMultiplier MetaEngineFraction 
---@field mapScale number 
---@field map MetaEngineTagDependency 
---@field animationPeriod number 
---@field windVelocity number 
---@field windPeriod number 
---@field windAccelerationWeight MetaEngineFraction 
---@field windPerpendicularWeight MetaEngineFraction 
---@field backgroundSound MetaEngineTagDependency 
---@field soundEnvironment MetaEngineTagDependency 

---@class EngineTagDataMultiplayerInformationSoundEnum : Enum 

---@class EngineTagDataMultiplayerInformationSoundPlayBall : EngineTagDataMultiplayerInformationSoundEnum 
---@class EngineTagDataMultiplayerInformationSoundGameOver : EngineTagDataMultiplayerInformationSoundEnum 
---@class EngineTagDataMultiplayerInformationSoundOneMinuteToWin : EngineTagDataMultiplayerInformationSoundEnum 
---@class EngineTagDataMultiplayerInformationSound_30SecondsToWin : EngineTagDataMultiplayerInformationSoundEnum 
---@class EngineTagDataMultiplayerInformationSoundRedTeamMinuteToWin : EngineTagDataMultiplayerInformationSoundEnum 
---@class EngineTagDataMultiplayerInformationSoundRedTeam_30ToWin : EngineTagDataMultiplayerInformationSoundEnum 
---@class EngineTagDataMultiplayerInformationSoundBlueTeamMinuteToWin : EngineTagDataMultiplayerInformationSoundEnum 
---@class EngineTagDataMultiplayerInformationSoundBlueTeam_30ToWin : EngineTagDataMultiplayerInformationSoundEnum 
---@class EngineTagDataMultiplayerInformationSoundBlueTeamHasTheFlag : EngineTagDataMultiplayerInformationSoundEnum 
---@class EngineTagDataMultiplayerInformationSoundBlueTeamFlagReturned : EngineTagDataMultiplayerInformationSoundEnum 
---@class EngineTagDataMultiplayerInformationSoundBlueTeamScore : EngineTagDataMultiplayerInformationSoundEnum 
---@class EngineTagDataMultiplayerInformationSoundRedTeamHasTheFlag : EngineTagDataMultiplayerInformationSoundEnum 
---@class EngineTagDataMultiplayerInformationSoundRedTeamFlagReturned : EngineTagDataMultiplayerInformationSoundEnum 
---@class EngineTagDataMultiplayerInformationSoundRedTeamScore : EngineTagDataMultiplayerInformationSoundEnum 
---@class EngineTagDataMultiplayerInformationSoundDoubleKill : EngineTagDataMultiplayerInformationSoundEnum 
---@class EngineTagDataMultiplayerInformationSoundTripleKill : EngineTagDataMultiplayerInformationSoundEnum 
---@class EngineTagDataMultiplayerInformationSoundKilltacular : EngineTagDataMultiplayerInformationSoundEnum 
---@class EngineTagDataMultiplayerInformationSoundRunningRiot : EngineTagDataMultiplayerInformationSoundEnum 
---@class EngineTagDataMultiplayerInformationSoundKillingSpree : EngineTagDataMultiplayerInformationSoundEnum 
---@class EngineTagDataMultiplayerInformationSoundOddball : EngineTagDataMultiplayerInformationSoundEnum 
---@class EngineTagDataMultiplayerInformationSoundRace : EngineTagDataMultiplayerInformationSoundEnum 
---@class EngineTagDataMultiplayerInformationSoundSlayer : EngineTagDataMultiplayerInformationSoundEnum 
---@class EngineTagDataMultiplayerInformationSoundCaptureTheFlag : EngineTagDataMultiplayerInformationSoundEnum 
---@class EngineTagDataMultiplayerInformationSoundWarthog : EngineTagDataMultiplayerInformationSoundEnum 
---@class EngineTagDataMultiplayerInformationSoundGhost : EngineTagDataMultiplayerInformationSoundEnum 
---@class EngineTagDataMultiplayerInformationSoundScorpion : EngineTagDataMultiplayerInformationSoundEnum 
---@class EngineTagDataMultiplayerInformationSoundCountdownTimer : EngineTagDataMultiplayerInformationSoundEnum 
---@class EngineTagDataMultiplayerInformationSoundTeleporterActivate : EngineTagDataMultiplayerInformationSoundEnum 
---@class EngineTagDataMultiplayerInformationSoundFlagFailure : EngineTagDataMultiplayerInformationSoundEnum 
---@class EngineTagDataMultiplayerInformationSoundCountdownForRespawn : EngineTagDataMultiplayerInformationSoundEnum 
---@class EngineTagDataMultiplayerInformationSoundHillMove : EngineTagDataMultiplayerInformationSoundEnum 
---@class EngineTagDataMultiplayerInformationSoundPlayerRespawn : EngineTagDataMultiplayerInformationSoundEnum 
---@class EngineTagDataMultiplayerInformationSoundTeamKingOfTheHill : EngineTagDataMultiplayerInformationSoundEnum 
---@class EngineTagDataMultiplayerInformationSoundTeamOddball : EngineTagDataMultiplayerInformationSoundEnum 
---@class EngineTagDataMultiplayerInformationSoundTeamRace : EngineTagDataMultiplayerInformationSoundEnum 
---@class EngineTagDataMultiplayerInformationSoundTeamSlayer : EngineTagDataMultiplayerInformationSoundEnum 
---@class EngineTagDataMultiplayerInformationSoundKingOfTheHill : EngineTagDataMultiplayerInformationSoundEnum 
---@class EngineTagDataMultiplayerInformationSoundBlueTeamCtf : EngineTagDataMultiplayerInformationSoundEnum 
---@class EngineTagDataMultiplayerInformationSoundRedTeamCtf : EngineTagDataMultiplayerInformationSoundEnum 
---@class EngineTagDataMultiplayerInformationSoundHillContested : EngineTagDataMultiplayerInformationSoundEnum 
---@class EngineTagDataMultiplayerInformationSoundHillControlled : EngineTagDataMultiplayerInformationSoundEnum 
---@class EngineTagDataMultiplayerInformationSoundHillOccupied : EngineTagDataMultiplayerInformationSoundEnum 
---@class EngineTagDataMultiplayerInformationSoundCountdownTimerEnd : EngineTagDataMultiplayerInformationSoundEnum 
---@class EngineTagDataMultiplayerInformationSoundTing : EngineTagDataMultiplayerInformationSoundEnum 

---@alias EngineTagDataMultiplayerInformationSound 
---| EngineTagDataMultiplayerInformationSoundPlayBall
---| EngineTagDataMultiplayerInformationSoundGameOver
---| EngineTagDataMultiplayerInformationSoundOneMinuteToWin
---| EngineTagDataMultiplayerInformationSound_30SecondsToWin
---| EngineTagDataMultiplayerInformationSoundRedTeamMinuteToWin
---| EngineTagDataMultiplayerInformationSoundRedTeam_30ToWin
---| EngineTagDataMultiplayerInformationSoundBlueTeamMinuteToWin
---| EngineTagDataMultiplayerInformationSoundBlueTeam_30ToWin
---| EngineTagDataMultiplayerInformationSoundBlueTeamHasTheFlag
---| EngineTagDataMultiplayerInformationSoundBlueTeamFlagReturned
---| EngineTagDataMultiplayerInformationSoundBlueTeamScore
---| EngineTagDataMultiplayerInformationSoundRedTeamHasTheFlag
---| EngineTagDataMultiplayerInformationSoundRedTeamFlagReturned
---| EngineTagDataMultiplayerInformationSoundRedTeamScore
---| EngineTagDataMultiplayerInformationSoundDoubleKill
---| EngineTagDataMultiplayerInformationSoundTripleKill
---| EngineTagDataMultiplayerInformationSoundKilltacular
---| EngineTagDataMultiplayerInformationSoundRunningRiot
---| EngineTagDataMultiplayerInformationSoundKillingSpree
---| EngineTagDataMultiplayerInformationSoundOddball
---| EngineTagDataMultiplayerInformationSoundRace
---| EngineTagDataMultiplayerInformationSoundSlayer
---| EngineTagDataMultiplayerInformationSoundCaptureTheFlag
---| EngineTagDataMultiplayerInformationSoundWarthog
---| EngineTagDataMultiplayerInformationSoundGhost
---| EngineTagDataMultiplayerInformationSoundScorpion
---| EngineTagDataMultiplayerInformationSoundCountdownTimer
---| EngineTagDataMultiplayerInformationSoundTeleporterActivate
---| EngineTagDataMultiplayerInformationSoundFlagFailure
---| EngineTagDataMultiplayerInformationSoundCountdownForRespawn
---| EngineTagDataMultiplayerInformationSoundHillMove
---| EngineTagDataMultiplayerInformationSoundPlayerRespawn
---| EngineTagDataMultiplayerInformationSoundTeamKingOfTheHill
---| EngineTagDataMultiplayerInformationSoundTeamOddball
---| EngineTagDataMultiplayerInformationSoundTeamRace
---| EngineTagDataMultiplayerInformationSoundTeamSlayer
---| EngineTagDataMultiplayerInformationSoundKingOfTheHill
---| EngineTagDataMultiplayerInformationSoundBlueTeamCtf
---| EngineTagDataMultiplayerInformationSoundRedTeamCtf
---| EngineTagDataMultiplayerInformationSoundHillContested
---| EngineTagDataMultiplayerInformationSoundHillControlled
---| EngineTagDataMultiplayerInformationSoundHillOccupied
---| EngineTagDataMultiplayerInformationSoundCountdownTimerEnd
---| EngineTagDataMultiplayerInformationSoundTing

---@class EngineTagDataMultiplayerInformationSoundTable 
---@field dPlayBall EngineTagDataMultiplayerInformationSoundPlayBall
---@field dGameOver EngineTagDataMultiplayerInformationSoundGameOver
---@field dOneMinuteToWin EngineTagDataMultiplayerInformationSoundOneMinuteToWin
---@field d_30SecondsToWin EngineTagDataMultiplayerInformationSound_30SecondsToWin
---@field dRedTeamMinuteToWin EngineTagDataMultiplayerInformationSoundRedTeamMinuteToWin
---@field dRedTeam_30ToWin EngineTagDataMultiplayerInformationSoundRedTeam_30ToWin
---@field dBlueTeamMinuteToWin EngineTagDataMultiplayerInformationSoundBlueTeamMinuteToWin
---@field dBlueTeam_30ToWin EngineTagDataMultiplayerInformationSoundBlueTeam_30ToWin
---@field dBlueTeamHasTheFlag EngineTagDataMultiplayerInformationSoundBlueTeamHasTheFlag
---@field dBlueTeamFlagReturned EngineTagDataMultiplayerInformationSoundBlueTeamFlagReturned
---@field dBlueTeamScore EngineTagDataMultiplayerInformationSoundBlueTeamScore
---@field dRedTeamHasTheFlag EngineTagDataMultiplayerInformationSoundRedTeamHasTheFlag
---@field dRedTeamFlagReturned EngineTagDataMultiplayerInformationSoundRedTeamFlagReturned
---@field dRedTeamScore EngineTagDataMultiplayerInformationSoundRedTeamScore
---@field dDoubleKill EngineTagDataMultiplayerInformationSoundDoubleKill
---@field dTripleKill EngineTagDataMultiplayerInformationSoundTripleKill
---@field dKilltacular EngineTagDataMultiplayerInformationSoundKilltacular
---@field dRunningRiot EngineTagDataMultiplayerInformationSoundRunningRiot
---@field dKillingSpree EngineTagDataMultiplayerInformationSoundKillingSpree
---@field dOddball EngineTagDataMultiplayerInformationSoundOddball
---@field dRace EngineTagDataMultiplayerInformationSoundRace
---@field dSlayer EngineTagDataMultiplayerInformationSoundSlayer
---@field dCaptureTheFlag EngineTagDataMultiplayerInformationSoundCaptureTheFlag
---@field dWarthog EngineTagDataMultiplayerInformationSoundWarthog
---@field dGhost EngineTagDataMultiplayerInformationSoundGhost
---@field dScorpion EngineTagDataMultiplayerInformationSoundScorpion
---@field dCountdownTimer EngineTagDataMultiplayerInformationSoundCountdownTimer
---@field dTeleporterActivate EngineTagDataMultiplayerInformationSoundTeleporterActivate
---@field dFlagFailure EngineTagDataMultiplayerInformationSoundFlagFailure
---@field dCountdownForRespawn EngineTagDataMultiplayerInformationSoundCountdownForRespawn
---@field dHillMove EngineTagDataMultiplayerInformationSoundHillMove
---@field dPlayerRespawn EngineTagDataMultiplayerInformationSoundPlayerRespawn
---@field dTeamKingOfTheHill EngineTagDataMultiplayerInformationSoundTeamKingOfTheHill
---@field dTeamOddball EngineTagDataMultiplayerInformationSoundTeamOddball
---@field dTeamRace EngineTagDataMultiplayerInformationSoundTeamRace
---@field dTeamSlayer EngineTagDataMultiplayerInformationSoundTeamSlayer
---@field dKingOfTheHill EngineTagDataMultiplayerInformationSoundKingOfTheHill
---@field dBlueTeamCtf EngineTagDataMultiplayerInformationSoundBlueTeamCtf
---@field dRedTeamCtf EngineTagDataMultiplayerInformationSoundRedTeamCtf
---@field dHillContested EngineTagDataMultiplayerInformationSoundHillContested
---@field dHillControlled EngineTagDataMultiplayerInformationSoundHillControlled
---@field dHillOccupied EngineTagDataMultiplayerInformationSoundHillOccupied
---@field dCountdownTimerEnd EngineTagDataMultiplayerInformationSoundCountdownTimerEnd
---@field dTing EngineTagDataMultiplayerInformationSoundTing
Engine.tag.multiplayerInformationSound = {} 

---@class MetaEngineTagDataGlobalsRasterizerDataFlags 
---@field tintEdgeDensity boolean 

---@class MetaEngineTagDataGlobalsBreakableSurfaceParticleEffectFlags 
---@field interpolateColorInHsv boolean 
---@field moreColors boolean 

---@class MetaEngineTagDataGlobalsSound 
---@field sound MetaEngineTagDependency 

---@class MetaEngineTagDataGlobalsCamera 
---@field defaultUnitCameraTrack MetaEngineTagDependency 

---@class MetaEngineTagDataGlobalsLookFunction 
---@field scale number 

---@class MetaEngineTagDataGlobalsPlayerControl 
---@field magnetismFriction number 
---@field magnetismAdhesion number 
---@field inconsequentialTargetScale number 
---@field lookAccelerationTime number 
---@field lookAccelerationScale number 
---@field lookPegThreshold number 
---@field lookDefaultPitchRate number 
---@field lookDefaultYawRate number 
---@field lookAutolevellingScale number 
---@field minimumWeaponSwapTicks integer 
---@field minimumAutolevellingTicks integer 
---@field minimumAngleForVehicleFlipping MetaEngineAngle 
---@field lookFunction table<MetaEngineTagDataGlobalsLookFunction> 

---@class MetaEngineTagDataGlobalsDifficulty 
---@field easyEnemyDamage number 
---@field normalEnemyDamage number 
---@field hardEnemyDamage number 
---@field impossEnemyDamage number 
---@field easyEnemyVitality number 
---@field normalEnemyVitality number 
---@field hardEnemyVitality number 
---@field impossEnemyVitality number 
---@field easyEnemyShield number 
---@field normalEnemyShield number 
---@field hardEnemyShield number 
---@field impossEnemyShield number 
---@field easyEnemyRecharge number 
---@field normalEnemyRecharge number 
---@field hardEnemyRecharge number 
---@field impossEnemyRecharge number 
---@field easyFriendDamage number 
---@field normalFriendDamage number 
---@field hardFriendDamage number 
---@field impossFriendDamage number 
---@field easyFriendVitality number 
---@field normalFriendVitality number 
---@field hardFriendVitality number 
---@field impossFriendVitality number 
---@field easyFriendShield number 
---@field normalFriendShield number 
---@field hardFriendShield number 
---@field impossFriendShield number 
---@field easyFriendRecharge number 
---@field normalFriendRecharge number 
---@field hardFriendRecharge number 
---@field impossFriendRecharge number 
---@field easyInfectionForms number 
---@field normalInfectionForms number 
---@field hardInfectionForms number 
---@field impossInfectionForms number 
---@field easyRateOfFire number 
---@field normalRateOfFire number 
---@field hardRateOfFire number 
---@field impossRateOfFire number 
---@field easyProjectileError number 
---@field normalProjectileError number 
---@field hardProjectileError number 
---@field impossProjectileError number 
---@field easyBurstError number 
---@field normalBurstError number 
---@field hardBurstError number 
---@field impossBurstError number 
---@field easyNewTargetDelay number 
---@field normalNewTargetDelay number 
---@field hardNewTargetDelay number 
---@field impossNewTargetDelay number 
---@field easyBurstSeparation number 
---@field normalBurstSeparation number 
---@field hardBurstSeparation number 
---@field impossBurstSeparation number 
---@field easyTargetTracking number 
---@field normalTargetTracking number 
---@field hardTargetTracking number 
---@field impossTargetTracking number 
---@field easyTargetLeading number 
---@field normalTargetLeading number 
---@field hardTargetLeading number 
---@field impossTargetLeading number 
---@field easyOverchargeChance number 
---@field normalOverchargeChance number 
---@field hardOverchargeChance number 
---@field impossOverchargeChance number 
---@field easySpecialFireDelay number 
---@field normalSpecialFireDelay number 
---@field hardSpecialFireDelay number 
---@field impossSpecialFireDelay number 
---@field easyGuidanceVsPlayer number 
---@field normalGuidanceVsPlayer number 
---@field hardGuidanceVsPlayer number 
---@field impossGuidanceVsPlayer number 
---@field easyMeleeDelayBase number 
---@field normalMeleeDelayBase number 
---@field hardMeleeDelayBase number 
---@field impossMeleeDelayBase number 
---@field easyMeleeDelayScale number 
---@field normalMeleeDelayScale number 
---@field hardMeleeDelayScale number 
---@field impossMeleeDelayScale number 
---@field easyGrenadeChanceScale number 
---@field normalGrenadeChanceScale number 
---@field hardGrenadeChanceScale number 
---@field impossGrenadeChanceScale number 
---@field easyGrenadeTimerScale number 
---@field normalGrenadeTimerScale number 
---@field hardGrenadeTimerScale number 
---@field impossGrenadeTimerScale number 
---@field easyMajorUpgrade number 
---@field normalMajorUpgrade number 
---@field hardMajorUpgrade number 
---@field impossMajorUpgrade number 
---@field easyMajorUpgrade_1 number 
---@field normalMajorUpgrade_1 number 
---@field hardMajorUpgrade_1 number 
---@field impossMajorUpgrade_1 number 
---@field easyMajorUpgrade_2 number 
---@field normalMajorUpgrade_2 number 
---@field hardMajorUpgrade_2 number 
---@field impossMajorUpgrade_2 number 

---@class MetaEngineTagDataGlobalsGrenade 
---@field maximumCount integer 
---@field mpSpawnDefault integer 
---@field throwingEffect MetaEngineTagDependency 
---@field hudInterface MetaEngineTagDependency 
---@field equipment MetaEngineTagDependency 
---@field projectile MetaEngineTagDependency 

---@class MetaEngineTagDataGlobalsRasterizerData 
---@field distanceAttenuation MetaEngineTagDependency 
---@field vectorNormalization MetaEngineTagDependency 
---@field atmosphericFogDensity MetaEngineTagDependency 
---@field planarFogDensity MetaEngineTagDependency 
---@field linearCornerFade MetaEngineTagDependency 
---@field activeCamouflageDistortion MetaEngineTagDependency 
---@field glow MetaEngineTagDependency 
---@field default_2d MetaEngineTagDependency 
---@field default_3d MetaEngineTagDependency 
---@field defaultCubeMap MetaEngineTagDependency 
---@field test_0 MetaEngineTagDependency 
---@field test_1 MetaEngineTagDependency 
---@field test_2 MetaEngineTagDependency 
---@field test_3 MetaEngineTagDependency 
---@field videoScanlineMap MetaEngineTagDependency 
---@field videoNoiseMap MetaEngineTagDependency 
---@field flags MetaEngineTagDataGlobalsRasterizerDataFlags 
---@field refractionAmount number 
---@field distanceFalloff number 
---@field tintColor MetaEngineColorRGB 
---@field hyperStealthRefraction number 
---@field hyperStealthDistanceFalloff number 
---@field hyperStealthTintColor MetaEngineColorRGB 
---@field distanceAttenuation_2d MetaEngineTagDependency 

---@class MetaEngineTagDataGlobalsInterfaceBitmaps 
---@field fontSystem MetaEngineTagDependency 
---@field fontTerminal MetaEngineTagDependency 
---@field screenColorTable MetaEngineTagDependency 
---@field hudColorTable MetaEngineTagDependency 
---@field editorColorTable MetaEngineTagDependency 
---@field dialogColorTable MetaEngineTagDependency 
---@field hudGlobals MetaEngineTagDependency 
---@field motionSensorSweepBitmap MetaEngineTagDependency 
---@field motionSensorSweepBitmapMask MetaEngineTagDependency 
---@field multiplayerHudBitmap MetaEngineTagDependency 
---@field localization MetaEngineTagDependency 
---@field hudDigitsDefinition MetaEngineTagDependency 
---@field motionSensorBlipBitmap MetaEngineTagDependency 
---@field interfaceGooMap1 MetaEngineTagDependency 
---@field interfaceGooMap2 MetaEngineTagDependency 
---@field interfaceGooMap3 MetaEngineTagDependency 

---@class MetaEngineTagDataGlobalsWeapon 
---@field weapon MetaEngineTagDependency 

---@class MetaEngineTagDataGlobalsCheatPowerup 
---@field powerup MetaEngineTagDependency 

---@class MetaEngineTagDataGlobalsVehicle 
---@field vehicle MetaEngineTagDependency 

---@class MetaEngineTagDataGlobalsMultiplayerInformation 
---@field flag MetaEngineTagDependency 
---@field unit MetaEngineTagDependency 
---@field vehicles table<MetaEngineTagDataGlobalsVehicle> 
---@field hillShader MetaEngineTagDependency 
---@field flagShader MetaEngineTagDependency 
---@field ball MetaEngineTagDependency 
---@field sounds table<MetaEngineTagDataGlobalsSound> 

---@class MetaEngineTagDataGlobalsPlayerInformation 
---@field unit MetaEngineTagDependency 
---@field walkingSpeed number 
---@field doubleSpeedMultiplier number 
---@field runForward number 
---@field runBackward number 
---@field runSideways number 
---@field runAcceleration number 
---@field sneakForward number 
---@field sneakBackward number 
---@field sneakSideways number 
---@field sneakAcceleration number 
---@field airborneAcceleration number 
---@field speedMultiplier number 
---@field grenadeOrigin MetaEnginePoint3D 
---@field stunMovementPenalty number 
---@field stunTurningPenalty number 
---@field stunJumpingPenalty number 
---@field minimumStunTime number 
---@field maximumStunTime number 
---@field firstPersonIdleTime number 
---@field firstPersonSkipFraction number 
---@field coopRespawnEffect MetaEngineTagDependency 

---@class MetaEngineTagDataGlobalsFirstPersonInterface 
---@field firstPersonHands MetaEngineTagDependency 
---@field baseBitmap MetaEngineTagDependency 
---@field shieldMeter MetaEngineTagDependency 
---@field shieldMeterOrigin MetaEnginePoint2DInt 
---@field bodyMeter MetaEngineTagDependency 
---@field bodyMeterOrigin MetaEnginePoint2DInt 
---@field nightVisionOnEffect MetaEngineTagDependency 
---@field nightVisionOffEffect MetaEngineTagDependency 

---@class MetaEngineTagDataGlobalsFallingDamage 
---@field harmfulFallingDistance number 
---@field fallingDamage MetaEngineTagDependency 
---@field maximumFallingDistance number 
---@field distanceDamage MetaEngineTagDependency 
---@field vehicleEnvironmentCollisionDamage MetaEngineTagDependency 
---@field vehicleKilledUnitDamage MetaEngineTagDependency 
---@field vehicleCollisionDamage MetaEngineTagDependency 
---@field flamingDeathDamage MetaEngineTagDependency 
---@field maximumFallingVelocity number 
---@field harmfulFallingVelocity number 

---@class MetaEngineTagDataGlobalsBreakableSurfaceParticleEffect 
---@field particleType MetaEngineTagDependency 
---@field flags MetaEngineTagDataGlobalsBreakableSurfaceParticleEffectFlags 
---@field density number 
---@field velocityScale number 
---@field angularVelocity number 
---@field radius number 
---@field tintLowerBound MetaEngineColorARGB 
---@field tintUpperBound MetaEngineColorARGB 

---@class MetaEngineTagDataGlobalsMaterial 
---@field groundFrictionScale number 
---@field groundFrictionNormalK1Scale number 
---@field groundFrictionNormalK0Scale number 
---@field groundDepthScale number 
---@field groundDampFractionScale number 
---@field maximumVitality number 
---@field effect MetaEngineTagDependency 
---@field sound MetaEngineTagDependency 
---@field particleEffects table<MetaEngineTagDataGlobalsBreakableSurfaceParticleEffect> 
---@field meleeHitSound MetaEngineTagDependency 

---@class MetaEngineTagDataGlobalsPlaylistMember 
---@field mapName MetaEngineTagString 
---@field gameVariant MetaEngineTagString 
---@field minimumExperience integer 
---@field maximumExperience integer 
---@field minimumPlayerCount integer 
---@field maximumPlayerCount integer 
---@field rating integer 

---@class MetaEngineTagDataGlobals 
---@field sounds table<MetaEngineTagDataGlobalsSound> 
---@field camera table<MetaEngineTagDataGlobalsCamera> 
---@field playerControl table<MetaEngineTagDataGlobalsPlayerControl> 
---@field difficulty table<MetaEngineTagDataGlobalsDifficulty> 
---@field grenades table<MetaEngineTagDataGlobalsGrenade> 
---@field rasterizerData table<MetaEngineTagDataGlobalsRasterizerData> 
---@field interfaceBitmaps table<MetaEngineTagDataGlobalsInterfaceBitmaps> 
---@field weaponList table<MetaEngineTagDataGlobalsWeapon> 
---@field cheatPowerups table<MetaEngineTagDataGlobalsCheatPowerup> 
---@field multiplayerInformation table<MetaEngineTagDataGlobalsMultiplayerInformation> 
---@field playerInformation table<MetaEngineTagDataGlobalsPlayerInformation> 
---@field firstPersonInterface table<MetaEngineTagDataGlobalsFirstPersonInterface> 
---@field fallingDamage table<MetaEngineTagDataGlobalsFallingDamage> 
---@field materials table<MetaEngineTagDataGlobalsMaterial> 
---@field playlistMembers table<MetaEngineTagDataGlobalsPlaylistMember> 

---@class MetaEngineTagDataContinuousDamageEffect 
---@field radius number 
---@field cutoffScale number 
---@field lowFrequencyVibrateFrequency number 
---@field highFrequencyVibrateFrequency number 
---@field cameraShakingRandomTranslation number 
---@field cameraShakingRandomRotation MetaEngineAngle 
---@field cameraShakingWobbleFunction EngineTagDataWaveFunction 
---@field cameraShakingWobblePeriod number 
---@field cameraShakingWobbleWeight number 
---@field damageSideEffect EngineTagDataDamageEffectSideEffect 
---@field damageCategory EngineTagDataDamageEffectCategory 
---@field damageFlags MetaEngineTagDataDamageEffectDamageFlags 
---@field damageLowerBound number 
---@field damageUpperBound number 
---@field damageVehiclePassthroughPenalty number 
---@field damageStun number 
---@field damageMaximumStun number 
---@field damageStunTime number 
---@field damageInstantaneousAcceleration MetaEngineVector3D 
---@field dirt number 
---@field sand number 
---@field stone number 
---@field snow number 
---@field wood number 
---@field metalHollow number 
---@field metalThin number 
---@field metalThick number 
---@field rubber number 
---@field glass number 
---@field forceField number 
---@field grunt number 
---@field hunterArmor number 
---@field hunterSkin number 
---@field elite number 
---@field jackal number 
---@field jackalEnergyShield number 
---@field engineerSkin number 
---@field engineerForceField number 
---@field floodCombatForm number 
---@field floodCarrierForm number 
---@field cyborgArmor number 
---@field cyborgEnergyShield number 
---@field humanArmor number 
---@field humanSkin number 
---@field sentinel number 
---@field monitor number 
---@field plastic number 
---@field water number 
---@field leaves number 
---@field eliteEnergyShield number 
---@field ice number 
---@field hunterShield number 

---@class EngineTagDataParticleSystemParticleCreationPhysicsEnum : Enum 

---@class EngineTagDataParticleSystemParticleCreationPhysicsDefault : EngineTagDataParticleSystemParticleCreationPhysicsEnum 
---@class EngineTagDataParticleSystemParticleCreationPhysicsExplosion : EngineTagDataParticleSystemParticleCreationPhysicsEnum 
---@class EngineTagDataParticleSystemParticleCreationPhysicsJet : EngineTagDataParticleSystemParticleCreationPhysicsEnum 

---@alias EngineTagDataParticleSystemParticleCreationPhysics 
---| EngineTagDataParticleSystemParticleCreationPhysicsDefault
---| EngineTagDataParticleSystemParticleCreationPhysicsExplosion
---| EngineTagDataParticleSystemParticleCreationPhysicsJet

---@class EngineTagDataParticleSystemParticleCreationPhysicsTable 
---@field icsDefault EngineTagDataParticleSystemParticleCreationPhysicsDefault
---@field icsExplosion EngineTagDataParticleSystemParticleCreationPhysicsExplosion
---@field icsJet EngineTagDataParticleSystemParticleCreationPhysicsJet
Engine.tag.particleSystemParticleCreationPhysics = {} 

---@class EngineTagDataParticleSystemParticleUpdatePhysicsEnum : Enum 

---@class EngineTagDataParticleSystemParticleUpdatePhysicsDefault : EngineTagDataParticleSystemParticleUpdatePhysicsEnum 

---@alias EngineTagDataParticleSystemParticleUpdatePhysics 
---| EngineTagDataParticleSystemParticleUpdatePhysicsDefault

---@class EngineTagDataParticleSystemParticleUpdatePhysicsTable 
---@field icsDefault EngineTagDataParticleSystemParticleUpdatePhysicsDefault
Engine.tag.particleSystemParticleUpdatePhysics = {} 

---@class EngineTagDataParticleSystemComplexSpriteRenderModesEnum : Enum 

---@class EngineTagDataParticleSystemComplexSpriteRenderModesSimple : EngineTagDataParticleSystemComplexSpriteRenderModesEnum 
---@class EngineTagDataParticleSystemComplexSpriteRenderModesRotational : EngineTagDataParticleSystemComplexSpriteRenderModesEnum 

---@alias EngineTagDataParticleSystemComplexSpriteRenderModes 
---| EngineTagDataParticleSystemComplexSpriteRenderModesSimple
---| EngineTagDataParticleSystemComplexSpriteRenderModesRotational

---@class EngineTagDataParticleSystemComplexSpriteRenderModesTable 
---@field odesSimple EngineTagDataParticleSystemComplexSpriteRenderModesSimple
---@field odesRotational EngineTagDataParticleSystemComplexSpriteRenderModesRotational
Engine.tag.particleSystemComplexSpriteRenderModes = {} 

---@class EngineTagDataParticleSystemSystemUpdatePhysicsEnum : Enum 

---@class EngineTagDataParticleSystemSystemUpdatePhysicsDefault : EngineTagDataParticleSystemSystemUpdatePhysicsEnum 
---@class EngineTagDataParticleSystemSystemUpdatePhysicsExplosion : EngineTagDataParticleSystemSystemUpdatePhysicsEnum 

---@alias EngineTagDataParticleSystemSystemUpdatePhysics 
---| EngineTagDataParticleSystemSystemUpdatePhysicsDefault
---| EngineTagDataParticleSystemSystemUpdatePhysicsExplosion

---@class EngineTagDataParticleSystemSystemUpdatePhysicsTable 
---@field icsDefault EngineTagDataParticleSystemSystemUpdatePhysicsDefault
---@field icsExplosion EngineTagDataParticleSystemSystemUpdatePhysicsExplosion
Engine.tag.particleSystemSystemUpdatePhysics = {} 

---@class MetaEngineTagDataParticleSystemTypeFlags 
---@field typeStatesLoop boolean 
---@field forwardBackward boolean 
---@field particleStatesLoop boolean 
---@field forwardBackward_1 boolean 
---@field particlesDieInWater boolean 
---@field particlesDieInAir boolean 
---@field particlesDieOnGround boolean 
---@field rotationalSpritesAnimateSideways boolean 
---@field disabled boolean 
---@field tintByEffectColor boolean 
---@field initialCountScalesWithEffect boolean 
---@field minimumCountScalesWithEffect boolean 
---@field creationRateScalesWithEffect boolean 
---@field scaleScalesWithEffect boolean 
---@field animationRateScalesWithEffect boolean 
---@field rotationRateScalesWithEffect boolean 
---@field doNotDrawInFirstPerson boolean 
---@field doNotDrawInThirdPerson boolean 

---@class MetaEngineTagDataParticleSystemPhysicsConstant 
---@field k number 

---@class MetaEngineTagDataParticleSystemTypeStates 
---@field name MetaEngineTagString 
---@field durationBounds number 
---@field transitionTimeBounds number 
---@field scaleMultiplier number 
---@field animationRateMultiplier number 
---@field rotationRateMultiplier number 
---@field colorMultiplier MetaEngineColorARGB 
---@field radiusMultiplier number 
---@field minimumParticleCount number 
---@field particleCreationRate number 
---@field particleCreationPhysics EngineTagDataParticleSystemParticleCreationPhysics 
---@field particleUpdatePhysics EngineTagDataParticleSystemParticleUpdatePhysics 
---@field physicsConstants table<MetaEngineTagDataParticleSystemPhysicsConstant> 

---@class MetaEngineTagDataParticleSystemTypeParticleState 
---@field name MetaEngineTagString 
---@field durationBounds number 
---@field transitionTimeBounds number 
---@field bitmaps MetaEngineTagDependency 
---@field sequenceIndex MetaEngineIndex 
---@field scale number 
---@field animationRate number 
---@field rotationRate MetaEngineAngle 
---@field color_1 MetaEngineColorARGB 
---@field color_2 MetaEngineColorARGB 
---@field radiusMultiplier number 
---@field pointPhysics MetaEngineTagDependency 
---@field unknownInt integer 
---@field shaderFlags MetaEngineTagDataParticleShaderFlags 
---@field framebufferBlendFunction EngineTagDataFramebufferBlendFunction 
---@field framebufferFadeMode EngineTagDataFramebufferFadeMode 
---@field mapFlags MetaEngineTagDataIsUnfilteredFlag 
---@field secondaryMapBitmap MetaEngineTagDependency 
---@field anchor EngineTagDataParticleAnchor 
---@field flags MetaEngineTagDataIsUnfilteredFlag 
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
---@field physicsConstants table<MetaEngineTagDataParticleSystemPhysicsConstant> 

---@class MetaEngineTagDataParticleSystemType 
---@field name MetaEngineTagString 
---@field flags MetaEngineTagDataParticleSystemTypeFlags 
---@field initialParticleCount integer 
---@field complexSpriteRenderModes EngineTagDataParticleSystemComplexSpriteRenderModes 
---@field radius number 
---@field particleCreationPhysics EngineTagDataParticleSystemParticleCreationPhysics 
---@field physicsFlags MetaEngineTagDataIsUnusedFlag 
---@field physicsConstants table<MetaEngineTagDataParticleSystemPhysicsConstant> 
---@field states table<MetaEngineTagDataParticleSystemTypeStates> 
---@field particleStates table<MetaEngineTagDataParticleSystemTypeParticleState> 

---@class MetaEngineTagDataParticleSystem 
---@field pointPhysics MetaEngineTagDependency 
---@field systemUpdatePhysics EngineTagDataParticleSystemSystemUpdatePhysics 
---@field physicsFlags MetaEngineTagDataIsUnusedFlag 
---@field physicsConstants table<MetaEngineTagDataParticleSystemPhysicsConstant> 
---@field particleTypes table<MetaEngineTagDataParticleSystemType> 

---@class MetaEngineTagDataFontCharacterIndex 
---@field characterIndex MetaEngineIndex 

---@class MetaEngineTagDataFontCharacterTables 
---@field characterTable table<MetaEngineTagDataFontCharacterIndex> 

---@class MetaEngineTagDataFontCharacter 
---@field character integer 
---@field characterWidth integer 
---@field bitmapWidth integer 
---@field bitmapHeight integer 
---@field bitmapOriginX integer 
---@field bitmapOriginY integer 
---@field hardwareCharacterIndex integer 
---@field pixelsOffset integer 

---@class MetaEngineTagDataFont 
---@field flags integer 
---@field ascendingHeight integer 
---@field descendingHeight integer 
---@field leadingHeight integer 
---@field leadingWidth integer 
---@field characterTables table<MetaEngineTagDataFontCharacterTables> 
---@field bold MetaEngineTagDependency 
---@field italic MetaEngineTagDependency 
---@field condense MetaEngineTagDependency 
---@field underline MetaEngineTagDependency 
---@field characters table<MetaEngineTagDataFontCharacter> 
---@field pixels MetaEngineTagDataOffset 

---@class EngineTagDataEquipmentPowerupTypeEnum : Enum 

---@class EngineTagDataEquipmentPowerupTypeNone : EngineTagDataEquipmentPowerupTypeEnum 
---@class EngineTagDataEquipmentPowerupTypeDoubleSpeed : EngineTagDataEquipmentPowerupTypeEnum 
---@class EngineTagDataEquipmentPowerupTypeOverShield : EngineTagDataEquipmentPowerupTypeEnum 
---@class EngineTagDataEquipmentPowerupTypeActiveCamouflage : EngineTagDataEquipmentPowerupTypeEnum 
---@class EngineTagDataEquipmentPowerupTypeFullSpectrumVision : EngineTagDataEquipmentPowerupTypeEnum 
---@class EngineTagDataEquipmentPowerupTypeHealth : EngineTagDataEquipmentPowerupTypeEnum 
---@class EngineTagDataEquipmentPowerupTypeGrenade : EngineTagDataEquipmentPowerupTypeEnum 

---@alias EngineTagDataEquipmentPowerupType 
---| EngineTagDataEquipmentPowerupTypeNone
---| EngineTagDataEquipmentPowerupTypeDoubleSpeed
---| EngineTagDataEquipmentPowerupTypeOverShield
---| EngineTagDataEquipmentPowerupTypeActiveCamouflage
---| EngineTagDataEquipmentPowerupTypeFullSpectrumVision
---| EngineTagDataEquipmentPowerupTypeHealth
---| EngineTagDataEquipmentPowerupTypeGrenade

---@class EngineTagDataEquipmentPowerupTypeTable 
---@field eNone EngineTagDataEquipmentPowerupTypeNone
---@field eDoubleSpeed EngineTagDataEquipmentPowerupTypeDoubleSpeed
---@field eOverShield EngineTagDataEquipmentPowerupTypeOverShield
---@field eActiveCamouflage EngineTagDataEquipmentPowerupTypeActiveCamouflage
---@field eFullSpectrumVision EngineTagDataEquipmentPowerupTypeFullSpectrumVision
---@field eHealth EngineTagDataEquipmentPowerupTypeHealth
---@field eGrenade EngineTagDataEquipmentPowerupTypeGrenade
Engine.tag.equipmentPowerupType = {} 

---@class MetaEngineTagDataEquipment: MetaEngineTagDataItem  
---@field powerupType EngineTagDataEquipmentPowerupType 
---@field grenadeType EngineTagDataGrenadeType 
---@field powerupTime number 
---@field pickupSound MetaEngineTagDependency 

---@class EngineTagDataFlagTrailingEdgeShapeEnum : Enum 

---@class EngineTagDataFlagTrailingEdgeShapeFlat : EngineTagDataFlagTrailingEdgeShapeEnum 
---@class EngineTagDataFlagTrailingEdgeShapeConcaveTriangular : EngineTagDataFlagTrailingEdgeShapeEnum 
---@class EngineTagDataFlagTrailingEdgeShapeConvexTriangular : EngineTagDataFlagTrailingEdgeShapeEnum 
---@class EngineTagDataFlagTrailingEdgeShapeTrapezoidShortTop : EngineTagDataFlagTrailingEdgeShapeEnum 
---@class EngineTagDataFlagTrailingEdgeShapeTrapezoidShortBottom : EngineTagDataFlagTrailingEdgeShapeEnum 

---@alias EngineTagDataFlagTrailingEdgeShape 
---| EngineTagDataFlagTrailingEdgeShapeFlat
---| EngineTagDataFlagTrailingEdgeShapeConcaveTriangular
---| EngineTagDataFlagTrailingEdgeShapeConvexTriangular
---| EngineTagDataFlagTrailingEdgeShapeTrapezoidShortTop
---| EngineTagDataFlagTrailingEdgeShapeTrapezoidShortBottom

---@class EngineTagDataFlagTrailingEdgeShapeTable 
---@field peFlat EngineTagDataFlagTrailingEdgeShapeFlat
---@field peConcaveTriangular EngineTagDataFlagTrailingEdgeShapeConcaveTriangular
---@field peConvexTriangular EngineTagDataFlagTrailingEdgeShapeConvexTriangular
---@field peTrapezoidShortTop EngineTagDataFlagTrailingEdgeShapeTrapezoidShortTop
---@field peTrapezoidShortBottom EngineTagDataFlagTrailingEdgeShapeTrapezoidShortBottom
Engine.tag.flagTrailingEdgeShape = {} 

---@class EngineTagDataFlagAttachedEdgeShapeEnum : Enum 

---@class EngineTagDataFlagAttachedEdgeShapeFlat : EngineTagDataFlagAttachedEdgeShapeEnum 
---@class EngineTagDataFlagAttachedEdgeShapeConcaveTriangular : EngineTagDataFlagAttachedEdgeShapeEnum 

---@alias EngineTagDataFlagAttachedEdgeShape 
---| EngineTagDataFlagAttachedEdgeShapeFlat
---| EngineTagDataFlagAttachedEdgeShapeConcaveTriangular

---@class EngineTagDataFlagAttachedEdgeShapeTable 
---@field peFlat EngineTagDataFlagAttachedEdgeShapeFlat
---@field peConcaveTriangular EngineTagDataFlagAttachedEdgeShapeConcaveTriangular
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
---@field attachmentPoints table<MetaEngineTagDataFlagAttachmentPoint> 

---@class EngineTagDataGlowBoundaryEffectEnum : Enum 

---@class EngineTagDataGlowBoundaryEffectBounce : EngineTagDataGlowBoundaryEffectEnum 
---@class EngineTagDataGlowBoundaryEffectWrap : EngineTagDataGlowBoundaryEffectEnum 

---@alias EngineTagDataGlowBoundaryEffect 
---| EngineTagDataGlowBoundaryEffectBounce
---| EngineTagDataGlowBoundaryEffectWrap

---@class EngineTagDataGlowBoundaryEffectTable 
---@field tBounce EngineTagDataGlowBoundaryEffectBounce
---@field tWrap EngineTagDataGlowBoundaryEffectWrap
Engine.tag.glowBoundaryEffect = {} 

---@class EngineTagDataGlowNormalParticleDistributionEnum : Enum 

---@class EngineTagDataGlowNormalParticleDistributionDistributedRandomly : EngineTagDataGlowNormalParticleDistributionEnum 
---@class EngineTagDataGlowNormalParticleDistributionDistributedUniformly : EngineTagDataGlowNormalParticleDistributionEnum 

---@alias EngineTagDataGlowNormalParticleDistribution 
---| EngineTagDataGlowNormalParticleDistributionDistributedRandomly
---| EngineTagDataGlowNormalParticleDistributionDistributedUniformly

---@class EngineTagDataGlowNormalParticleDistributionTable 
---@field onDistributedRandomly EngineTagDataGlowNormalParticleDistributionDistributedRandomly
---@field onDistributedUniformly EngineTagDataGlowNormalParticleDistributionDistributedUniformly
Engine.tag.glowNormalParticleDistribution = {} 

---@class EngineTagDataGlowTrailingParticleDistributionEnum : Enum 

---@class EngineTagDataGlowTrailingParticleDistributionEmitVertically : EngineTagDataGlowTrailingParticleDistributionEnum 
---@class EngineTagDataGlowTrailingParticleDistributionEmitNormalUp : EngineTagDataGlowTrailingParticleDistributionEnum 
---@class EngineTagDataGlowTrailingParticleDistributionEmitRandomly : EngineTagDataGlowTrailingParticleDistributionEnum 

---@alias EngineTagDataGlowTrailingParticleDistribution 
---| EngineTagDataGlowTrailingParticleDistributionEmitVertically
---| EngineTagDataGlowTrailingParticleDistributionEmitNormalUp
---| EngineTagDataGlowTrailingParticleDistributionEmitRandomly

---@class EngineTagDataGlowTrailingParticleDistributionTable 
---@field onEmitVertically EngineTagDataGlowTrailingParticleDistributionEmitVertically
---@field onEmitNormalUp EngineTagDataGlowTrailingParticleDistributionEmitNormalUp
---@field onEmitRandomly EngineTagDataGlowTrailingParticleDistributionEmitRandomly
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
---@field attachment_0 EngineTagDataFunctionOut 
---@field particleRotationalVelocity number 
---@field particleRotVelMulLow number 
---@field particleRotVelMulHigh number 
---@field attachment_1 EngineTagDataFunctionOut 
---@field effectRotationalVelocity number 
---@field effectRotVelMulLow number 
---@field effectRotVelMulHigh number 
---@field attachment_2 EngineTagDataFunctionOut 
---@field effectTranslationalVelocity number 
---@field effectTransVelMulLow number 
---@field effectTransVelMulHigh number 
---@field attachment_3 EngineTagDataFunctionOut 
---@field minDistanceParticleToObject number 
---@field maxDistanceParticleToObject number 
---@field distanceToObjectMulLow number 
---@field distanceToObjectMulHigh number 
---@field attachment_4 EngineTagDataFunctionOut 
---@field particleSizeBounds number 
---@field sizeAttachmentMultiplier number 
---@field attachment_5 EngineTagDataFunctionOut 
---@field colorBound_0 MetaEngineColorARGB 
---@field colorBound_1 MetaEngineColorARGB 
---@field scaleColor_0 MetaEngineColorARGB 
---@field scaleColor_1 MetaEngineColorARGB 
---@field colorRateOfChange number 
---@field fadingPercentageOfGlow number 
---@field particleGenerationFreq number 
---@field lifetimeOfTrailingParticles number 
---@field velocityOfTrailingParticles number 
---@field trailingParticleMinimumT number 
---@field trailingParticleMaximumT number 
---@field texture MetaEngineTagDependency 

---@class EngineTagDataHUDGlobalsAnniversaryRemapTargetLanguageEnum : Enum 

---@class EngineTagDataHUDGlobalsAnniversaryRemapTargetLanguageEnglish : EngineTagDataHUDGlobalsAnniversaryRemapTargetLanguageEnum 
---@class EngineTagDataHUDGlobalsAnniversaryRemapTargetLanguageFrench : EngineTagDataHUDGlobalsAnniversaryRemapTargetLanguageEnum 
---@class EngineTagDataHUDGlobalsAnniversaryRemapTargetLanguageSpanish : EngineTagDataHUDGlobalsAnniversaryRemapTargetLanguageEnum 
---@class EngineTagDataHUDGlobalsAnniversaryRemapTargetLanguageItalian : EngineTagDataHUDGlobalsAnniversaryRemapTargetLanguageEnum 
---@class EngineTagDataHUDGlobalsAnniversaryRemapTargetLanguageGerman : EngineTagDataHUDGlobalsAnniversaryRemapTargetLanguageEnum 
---@class EngineTagDataHUDGlobalsAnniversaryRemapTargetLanguageTraditionalChinese : EngineTagDataHUDGlobalsAnniversaryRemapTargetLanguageEnum 
---@class EngineTagDataHUDGlobalsAnniversaryRemapTargetLanguageJapanese : EngineTagDataHUDGlobalsAnniversaryRemapTargetLanguageEnum 
---@class EngineTagDataHUDGlobalsAnniversaryRemapTargetLanguageKorean : EngineTagDataHUDGlobalsAnniversaryRemapTargetLanguageEnum 
---@class EngineTagDataHUDGlobalsAnniversaryRemapTargetLanguagePortuguese : EngineTagDataHUDGlobalsAnniversaryRemapTargetLanguageEnum 
---@class EngineTagDataHUDGlobalsAnniversaryRemapTargetLanguageLatamSpanish : EngineTagDataHUDGlobalsAnniversaryRemapTargetLanguageEnum 
---@class EngineTagDataHUDGlobalsAnniversaryRemapTargetLanguagePolish : EngineTagDataHUDGlobalsAnniversaryRemapTargetLanguageEnum 
---@class EngineTagDataHUDGlobalsAnniversaryRemapTargetLanguageRussian : EngineTagDataHUDGlobalsAnniversaryRemapTargetLanguageEnum 
---@class EngineTagDataHUDGlobalsAnniversaryRemapTargetLanguageSimplifiedChinese : EngineTagDataHUDGlobalsAnniversaryRemapTargetLanguageEnum 

---@alias EngineTagDataHUDGlobalsAnniversaryRemapTargetLanguage 
---| EngineTagDataHUDGlobalsAnniversaryRemapTargetLanguageEnglish
---| EngineTagDataHUDGlobalsAnniversaryRemapTargetLanguageFrench
---| EngineTagDataHUDGlobalsAnniversaryRemapTargetLanguageSpanish
---| EngineTagDataHUDGlobalsAnniversaryRemapTargetLanguageItalian
---| EngineTagDataHUDGlobalsAnniversaryRemapTargetLanguageGerman
---| EngineTagDataHUDGlobalsAnniversaryRemapTargetLanguageTraditionalChinese
---| EngineTagDataHUDGlobalsAnniversaryRemapTargetLanguageJapanese
---| EngineTagDataHUDGlobalsAnniversaryRemapTargetLanguageKorean
---| EngineTagDataHUDGlobalsAnniversaryRemapTargetLanguagePortuguese
---| EngineTagDataHUDGlobalsAnniversaryRemapTargetLanguageLatamSpanish
---| EngineTagDataHUDGlobalsAnniversaryRemapTargetLanguagePolish
---| EngineTagDataHUDGlobalsAnniversaryRemapTargetLanguageRussian
---| EngineTagDataHUDGlobalsAnniversaryRemapTargetLanguageSimplifiedChinese

---@class EngineTagDataHUDGlobalsAnniversaryRemapTargetLanguageTable 
---@field nguageEnglish EngineTagDataHUDGlobalsAnniversaryRemapTargetLanguageEnglish
---@field nguageFrench EngineTagDataHUDGlobalsAnniversaryRemapTargetLanguageFrench
---@field nguageSpanish EngineTagDataHUDGlobalsAnniversaryRemapTargetLanguageSpanish
---@field nguageItalian EngineTagDataHUDGlobalsAnniversaryRemapTargetLanguageItalian
---@field nguageGerman EngineTagDataHUDGlobalsAnniversaryRemapTargetLanguageGerman
---@field nguageTraditionalChinese EngineTagDataHUDGlobalsAnniversaryRemapTargetLanguageTraditionalChinese
---@field nguageJapanese EngineTagDataHUDGlobalsAnniversaryRemapTargetLanguageJapanese
---@field nguageKorean EngineTagDataHUDGlobalsAnniversaryRemapTargetLanguageKorean
---@field nguagePortuguese EngineTagDataHUDGlobalsAnniversaryRemapTargetLanguagePortuguese
---@field nguageLatamSpanish EngineTagDataHUDGlobalsAnniversaryRemapTargetLanguageLatamSpanish
---@field nguagePolish EngineTagDataHUDGlobalsAnniversaryRemapTargetLanguagePolish
---@field nguageRussian EngineTagDataHUDGlobalsAnniversaryRemapTargetLanguageRussian
---@field nguageSimplifiedChinese EngineTagDataHUDGlobalsAnniversaryRemapTargetLanguageSimplifiedChinese
Engine.tag.hUDGlobalsAnniversaryRemapTargetLanguage = {} 

---@class MetaEngineTagDataHUDGlobalsWaypointArrowFlags 
---@field dontRotateWhenPointingOffscreen boolean 

---@class MetaEngineTagDataHUDGlobalsAnniversaryRemapTargetFlags 
---@field legacyMode boolean 

---@class MetaEngineTagDataHUDGlobalsButtonIcon 
---@field sequenceIndex MetaEngineIndex 
---@field widthOffset integer 
---@field offsetFromReferenceCorner MetaEnginePoint2DInt 
---@field overrideIconColor MetaEngineColorARGBInt 
---@field frameRate integer 
---@field flags MetaEngineTagDataHUDInterfaceMessagingFlags 
---@field textIndex MetaEngineIndex 

---@class MetaEngineTagDataHUDGlobalsAnniversaryRemapTarget 
---@field targetBitmap MetaEngineTagDependency 
---@field language EngineTagDataHUDGlobalsAnniversaryRemapTargetLanguage 
---@field flags MetaEngineTagDataHUDGlobalsAnniversaryRemapTargetFlags 

---@class MetaEngineTagDataHUDGlobalsAnniversaryRemap 
---@field sourceBitmap MetaEngineTagDependency 
---@field targets table<MetaEngineTagDataHUDGlobalsAnniversaryRemapTarget> 

---@class MetaEngineTagDataHUDGlobalsWaypointArrow 
---@field name MetaEngineTagString 
---@field color MetaEngineColorARGBInt 
---@field opacity number 
---@field translucency number 
---@field onScreenSequenceIndex MetaEngineIndex 
---@field offScreenSequenceIndex MetaEngineIndex 
---@field occludedSequenceIndex MetaEngineIndex 
---@field flags MetaEngineTagDataHUDGlobalsWaypointArrowFlags 

---@class MetaEngineTagDataHudGlobals 
---@field anchor EngineTagDataHUDInterfaceAnchor 
---@field anchorOffset MetaEnginePoint2DInt 
---@field widthScale number 
---@field heightScale number 
---@field scalingFlags MetaEngineTagDataHUDInterfaceScalingFlags 
---@field singlePlayerFont MetaEngineTagDependency 
---@field multiPlayerFont MetaEngineTagDependency 
---@field upTime number 
---@field fadeTime number 
---@field iconColor MetaEngineColorARGB 
---@field textColor MetaEngineColorARGB 
---@field textSpacing number 
---@field itemMessageText MetaEngineTagDependency 
---@field iconBitmap MetaEngineTagDependency 
---@field alternateIconText MetaEngineTagDependency 
---@field buttonIcons table<MetaEngineTagDataHUDGlobalsButtonIcon> 
---@field hudHelpDefaultColor MetaEngineColorARGBInt 
---@field hudHelpFlashingColor MetaEngineColorARGBInt 
---@field hudHelpFlashPeriod number 
---@field hudHelpFlashDelay number 
---@field hudHelpNumberOfFlashes integer 
---@field hudHelpFlashFlags MetaEngineTagDataHUDInterfaceFlashFlags 
---@field hudHelpFlashLength number 
---@field hudHelpDisabledColor MetaEngineColorARGBInt 
---@field hudMessages MetaEngineTagDependency 
---@field objectiveDefaultColor MetaEngineColorARGBInt 
---@field objectiveFlashingColor MetaEngineColorARGBInt 
---@field objectiveFlashPeriod number 
---@field objectiveFlashDelay number 
---@field objectiveNumberOfFlashes integer 
---@field objectiveFlashFlags MetaEngineTagDataHUDInterfaceFlashFlags 
---@field objectiveFlashLength number 
---@field objectiveDisabledColor MetaEngineColorARGBInt 
---@field objectiveUptimeTicks integer 
---@field objectiveFadeTicks integer 
---@field topOffset number 
---@field bottomOffset number 
---@field leftOffset number 
---@field rightOffset number 
---@field arrowBitmap MetaEngineTagDependency 
---@field waypointArrows table<MetaEngineTagDataHUDGlobalsWaypointArrow> 
---@field hudScaleInMultiplayer number 
---@field defaultWeaponHud MetaEngineTagDependency 
---@field motionSensorRange number 
---@field motionSensorVelocitySensitivity number 
---@field motionSensorScale number 
---@field defaultChapterTitleBounds MetaEngineRectangle2D 
---@field hudDamageTopOffset integer 
---@field hudDamageBottomOffset integer 
---@field hudDamageLeftOffset integer 
---@field hudDamageRightOffset integer 
---@field hudDamageIndicatorBitmap MetaEngineTagDependency 
---@field hudDamageSequenceIndex MetaEngineIndex 
---@field hudDamageMultiplayerSequenceIndex MetaEngineIndex 
---@field hudDamageColor MetaEngineColorARGBInt 
---@field notMuchTimeLeftDefaultColor MetaEngineColorARGBInt 
---@field notMuchTimeLeftFlashingColor MetaEngineColorARGBInt 
---@field notMuchTimeLeftFlashPeriod number 
---@field notMuchTimeLeftFlashDelay number 
---@field notMuchTimeLeftNumberOfFlashes integer 
---@field notMuchTimeLeftFlashFlags MetaEngineTagDataHUDInterfaceFlashFlags 
---@field notMuchTimeLeftFlashLength number 
---@field notMuchTimeLeftDisabledColor MetaEngineColorARGBInt 
---@field timeOutFlashDefaultColor MetaEngineColorARGBInt 
---@field timeOutFlashFlashingColor MetaEngineColorARGBInt 
---@field timeOutFlashFlashPeriod number 
---@field timeOutFlashFlashDelay number 
---@field timeOutFlashNumberOfFlashes integer 
---@field timeOutFlashFlashFlags MetaEngineTagDataHUDInterfaceFlashFlags 
---@field timeOutFlashFlashLength number 
---@field timeOutFlashDisabledColor MetaEngineColorARGBInt 
---@field carnageReportBitmap MetaEngineTagDependency 
---@field loadingBeginText MetaEngineIndex 
---@field loadingEndText MetaEngineIndex 
---@field checkpointBeginText MetaEngineIndex 
---@field checkpointEndText MetaEngineIndex 
---@field checkpointSound MetaEngineTagDependency 
---@field anniversaryHudRemaps table<MetaEngineTagDataHUDGlobalsAnniversaryRemap> 

---@class EngineTagDataLensFlareRadiusScaledByEnum : Enum 

---@class EngineTagDataLensFlareRadiusScaledByNone : EngineTagDataLensFlareRadiusScaledByEnum 
---@class EngineTagDataLensFlareRadiusScaledByRotation : EngineTagDataLensFlareRadiusScaledByEnum 
---@class EngineTagDataLensFlareRadiusScaledByRotationAndStrafing : EngineTagDataLensFlareRadiusScaledByEnum 
---@class EngineTagDataLensFlareRadiusScaledByDistanceFromCenter : EngineTagDataLensFlareRadiusScaledByEnum 

---@alias EngineTagDataLensFlareRadiusScaledBy 
---| EngineTagDataLensFlareRadiusScaledByNone
---| EngineTagDataLensFlareRadiusScaledByRotation
---| EngineTagDataLensFlareRadiusScaledByRotationAndStrafing
---| EngineTagDataLensFlareRadiusScaledByDistanceFromCenter

---@class EngineTagDataLensFlareRadiusScaledByTable 
---@field byNone EngineTagDataLensFlareRadiusScaledByNone
---@field byRotation EngineTagDataLensFlareRadiusScaledByRotation
---@field byRotationAndStrafing EngineTagDataLensFlareRadiusScaledByRotationAndStrafing
---@field byDistanceFromCenter EngineTagDataLensFlareRadiusScaledByDistanceFromCenter
Engine.tag.lensFlareRadiusScaledBy = {} 

---@class EngineTagDataLensFlareOcclusionOffsetDirectionEnum : Enum 

---@class EngineTagDataLensFlareOcclusionOffsetDirectionTowardViewer : EngineTagDataLensFlareOcclusionOffsetDirectionEnum 
---@class EngineTagDataLensFlareOcclusionOffsetDirectionMarkerForward : EngineTagDataLensFlareOcclusionOffsetDirectionEnum 
---@class EngineTagDataLensFlareOcclusionOffsetDirectionNone : EngineTagDataLensFlareOcclusionOffsetDirectionEnum 

---@alias EngineTagDataLensFlareOcclusionOffsetDirection 
---| EngineTagDataLensFlareOcclusionOffsetDirectionTowardViewer
---| EngineTagDataLensFlareOcclusionOffsetDirectionMarkerForward
---| EngineTagDataLensFlareOcclusionOffsetDirectionNone

---@class EngineTagDataLensFlareOcclusionOffsetDirectionTable 
---@field ionTowardViewer EngineTagDataLensFlareOcclusionOffsetDirectionTowardViewer
---@field ionMarkerForward EngineTagDataLensFlareOcclusionOffsetDirectionMarkerForward
---@field ionNone EngineTagDataLensFlareOcclusionOffsetDirectionNone
Engine.tag.lensFlareOcclusionOffsetDirection = {} 

---@class EngineTagDataLensFlareRotationFunctionEnum : Enum 

---@class EngineTagDataLensFlareRotationFunctionNone : EngineTagDataLensFlareRotationFunctionEnum 
---@class EngineTagDataLensFlareRotationFunctionRotationA : EngineTagDataLensFlareRotationFunctionEnum 
---@class EngineTagDataLensFlareRotationFunctionRotationB : EngineTagDataLensFlareRotationFunctionEnum 
---@class EngineTagDataLensFlareRotationFunctionRotationTranslation : EngineTagDataLensFlareRotationFunctionEnum 
---@class EngineTagDataLensFlareRotationFunctionTranslation : EngineTagDataLensFlareRotationFunctionEnum 

---@alias EngineTagDataLensFlareRotationFunction 
---| EngineTagDataLensFlareRotationFunctionNone
---| EngineTagDataLensFlareRotationFunctionRotationA
---| EngineTagDataLensFlareRotationFunctionRotationB
---| EngineTagDataLensFlareRotationFunctionRotationTranslation
---| EngineTagDataLensFlareRotationFunctionTranslation

---@class EngineTagDataLensFlareRotationFunctionTable 
---@field onNone EngineTagDataLensFlareRotationFunctionNone
---@field onRotationA EngineTagDataLensFlareRotationFunctionRotationA
---@field onRotationB EngineTagDataLensFlareRotationFunctionRotationB
---@field onRotationTranslation EngineTagDataLensFlareRotationFunctionRotationTranslation
---@field onTranslation EngineTagDataLensFlareRotationFunctionTranslation
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
---@field reflections table<MetaEngineTagDataLensFlareReflection> 

---@class MetaEngineTagDataItemCollectionPermutation 
---@field weight number 
---@field item MetaEngineTagDependency 

---@class MetaEngineTagDataItemCollection 
---@field permutations table<MetaEngineTagDataItemCollectionPermutation> 
---@field defaultSpawnTime integer 

---@class MetaEngineTagDataColorTableColor 
---@field name MetaEngineTagString 
---@field color MetaEngineColorARGB 

---@class MetaEngineTagDataColorTable 
---@field colors table<MetaEngineTagDataColorTableColor> 

---@class EngineTagDataPredictedResourceTypeEnum : Enum 

---@class EngineTagDataPredictedResourceTypeBitmap : EngineTagDataPredictedResourceTypeEnum 
---@class EngineTagDataPredictedResourceTypeSound : EngineTagDataPredictedResourceTypeEnum 

---@alias EngineTagDataPredictedResourceType 
---| EngineTagDataPredictedResourceTypeBitmap
---| EngineTagDataPredictedResourceTypeSound

---@class EngineTagDataPredictedResourceTypeTable 
---@field eBitmap EngineTagDataPredictedResourceTypeBitmap
---@field eSound EngineTagDataPredictedResourceTypeSound
Engine.tag.predictedResourceType = {} 

---@class EngineTagDataObjectNoiseEnum : Enum 

---@class EngineTagDataObjectNoiseSilent : EngineTagDataObjectNoiseEnum 
---@class EngineTagDataObjectNoiseMedium : EngineTagDataObjectNoiseEnum 
---@class EngineTagDataObjectNoiseLoud : EngineTagDataObjectNoiseEnum 
---@class EngineTagDataObjectNoiseShout : EngineTagDataObjectNoiseEnum 
---@class EngineTagDataObjectNoiseQuiet : EngineTagDataObjectNoiseEnum 

---@alias EngineTagDataObjectNoise 
---| EngineTagDataObjectNoiseSilent
---| EngineTagDataObjectNoiseMedium
---| EngineTagDataObjectNoiseLoud
---| EngineTagDataObjectNoiseShout
---| EngineTagDataObjectNoiseQuiet

---@class EngineTagDataObjectNoiseTable 
---@field silent EngineTagDataObjectNoiseSilent
---@field medium EngineTagDataObjectNoiseMedium
---@field loud EngineTagDataObjectNoiseLoud
---@field shout EngineTagDataObjectNoiseShout
---@field quiet EngineTagDataObjectNoiseQuiet
Engine.tag.objectNoise = {} 

---@class EngineTagDataObjectFunctionInEnum : Enum 

---@class EngineTagDataObjectFunctionInNone : EngineTagDataObjectFunctionInEnum 
---@class EngineTagDataObjectFunctionInBodyVitality : EngineTagDataObjectFunctionInEnum 
---@class EngineTagDataObjectFunctionInShieldVitality : EngineTagDataObjectFunctionInEnum 
---@class EngineTagDataObjectFunctionInRecentBodyDamage : EngineTagDataObjectFunctionInEnum 
---@class EngineTagDataObjectFunctionInRecentShieldDamage : EngineTagDataObjectFunctionInEnum 
---@class EngineTagDataObjectFunctionInRandomConstant : EngineTagDataObjectFunctionInEnum 
---@class EngineTagDataObjectFunctionInUmbrellaShieldVitality : EngineTagDataObjectFunctionInEnum 
---@class EngineTagDataObjectFunctionInShieldStun : EngineTagDataObjectFunctionInEnum 
---@class EngineTagDataObjectFunctionInRecentUmbrellaShieldVitality : EngineTagDataObjectFunctionInEnum 
---@class EngineTagDataObjectFunctionInUmbrellaShieldStun : EngineTagDataObjectFunctionInEnum 
---@class EngineTagDataObjectFunctionInRegion : EngineTagDataObjectFunctionInEnum 
---@class EngineTagDataObjectFunctionInRegion_1 : EngineTagDataObjectFunctionInEnum 
---@class EngineTagDataObjectFunctionInRegion_2 : EngineTagDataObjectFunctionInEnum 
---@class EngineTagDataObjectFunctionInRegion_3 : EngineTagDataObjectFunctionInEnum 
---@class EngineTagDataObjectFunctionInRegion_4 : EngineTagDataObjectFunctionInEnum 
---@class EngineTagDataObjectFunctionInRegion_5 : EngineTagDataObjectFunctionInEnum 
---@class EngineTagDataObjectFunctionInRegion_6 : EngineTagDataObjectFunctionInEnum 
---@class EngineTagDataObjectFunctionInRegion_7 : EngineTagDataObjectFunctionInEnum 
---@class EngineTagDataObjectFunctionInAlive : EngineTagDataObjectFunctionInEnum 
---@class EngineTagDataObjectFunctionInCompass : EngineTagDataObjectFunctionInEnum 

---@alias EngineTagDataObjectFunctionIn 
---| EngineTagDataObjectFunctionInNone
---| EngineTagDataObjectFunctionInBodyVitality
---| EngineTagDataObjectFunctionInShieldVitality
---| EngineTagDataObjectFunctionInRecentBodyDamage
---| EngineTagDataObjectFunctionInRecentShieldDamage
---| EngineTagDataObjectFunctionInRandomConstant
---| EngineTagDataObjectFunctionInUmbrellaShieldVitality
---| EngineTagDataObjectFunctionInShieldStun
---| EngineTagDataObjectFunctionInRecentUmbrellaShieldVitality
---| EngineTagDataObjectFunctionInUmbrellaShieldStun
---| EngineTagDataObjectFunctionInRegion
---| EngineTagDataObjectFunctionInRegion_1
---| EngineTagDataObjectFunctionInRegion_2
---| EngineTagDataObjectFunctionInRegion_3
---| EngineTagDataObjectFunctionInRegion_4
---| EngineTagDataObjectFunctionInRegion_5
---| EngineTagDataObjectFunctionInRegion_6
---| EngineTagDataObjectFunctionInRegion_7
---| EngineTagDataObjectFunctionInAlive
---| EngineTagDataObjectFunctionInCompass

---@class EngineTagDataObjectFunctionInTable 
---@field nNone EngineTagDataObjectFunctionInNone
---@field nBodyVitality EngineTagDataObjectFunctionInBodyVitality
---@field nShieldVitality EngineTagDataObjectFunctionInShieldVitality
---@field nRecentBodyDamage EngineTagDataObjectFunctionInRecentBodyDamage
---@field nRecentShieldDamage EngineTagDataObjectFunctionInRecentShieldDamage
---@field nRandomConstant EngineTagDataObjectFunctionInRandomConstant
---@field nUmbrellaShieldVitality EngineTagDataObjectFunctionInUmbrellaShieldVitality
---@field nShieldStun EngineTagDataObjectFunctionInShieldStun
---@field nRecentUmbrellaShieldVitality EngineTagDataObjectFunctionInRecentUmbrellaShieldVitality
---@field nUmbrellaShieldStun EngineTagDataObjectFunctionInUmbrellaShieldStun
---@field nRegion EngineTagDataObjectFunctionInRegion
---@field nRegion_1 EngineTagDataObjectFunctionInRegion_1
---@field nRegion_2 EngineTagDataObjectFunctionInRegion_2
---@field nRegion_3 EngineTagDataObjectFunctionInRegion_3
---@field nRegion_4 EngineTagDataObjectFunctionInRegion_4
---@field nRegion_5 EngineTagDataObjectFunctionInRegion_5
---@field nRegion_6 EngineTagDataObjectFunctionInRegion_6
---@field nRegion_7 EngineTagDataObjectFunctionInRegion_7
---@field nAlive EngineTagDataObjectFunctionInAlive
---@field nCompass EngineTagDataObjectFunctionInCompass
Engine.tag.objectFunctionIn = {} 

---@class EngineTagDataObjectTypeEnum : Enum 

---@class EngineTagDataObjectTypeBiped : EngineTagDataObjectTypeEnum 
---@class EngineTagDataObjectTypeVehicle : EngineTagDataObjectTypeEnum 
---@class EngineTagDataObjectTypeWeapon : EngineTagDataObjectTypeEnum 
---@class EngineTagDataObjectTypeEquipment : EngineTagDataObjectTypeEnum 
---@class EngineTagDataObjectTypeGarbage : EngineTagDataObjectTypeEnum 
---@class EngineTagDataObjectTypeProjectile : EngineTagDataObjectTypeEnum 
---@class EngineTagDataObjectTypeScenery : EngineTagDataObjectTypeEnum 
---@class EngineTagDataObjectTypeDeviceMachine : EngineTagDataObjectTypeEnum 
---@class EngineTagDataObjectTypeDeviceControl : EngineTagDataObjectTypeEnum 
---@class EngineTagDataObjectTypeDeviceLightFixture : EngineTagDataObjectTypeEnum 
---@class EngineTagDataObjectTypePlaceholder : EngineTagDataObjectTypeEnum 
---@class EngineTagDataObjectTypeSoundScenery : EngineTagDataObjectTypeEnum 

---@alias EngineTagDataObjectType 
---| EngineTagDataObjectTypeBiped
---| EngineTagDataObjectTypeVehicle
---| EngineTagDataObjectTypeWeapon
---| EngineTagDataObjectTypeEquipment
---| EngineTagDataObjectTypeGarbage
---| EngineTagDataObjectTypeProjectile
---| EngineTagDataObjectTypeScenery
---| EngineTagDataObjectTypeDeviceMachine
---| EngineTagDataObjectTypeDeviceControl
---| EngineTagDataObjectTypeDeviceLightFixture
---| EngineTagDataObjectTypePlaceholder
---| EngineTagDataObjectTypeSoundScenery

---@class EngineTagDataObjectTypeTable 
---@field biped EngineTagDataObjectTypeBiped
---@field vehicle EngineTagDataObjectTypeVehicle
---@field weapon EngineTagDataObjectTypeWeapon
---@field equipment EngineTagDataObjectTypeEquipment
---@field garbage EngineTagDataObjectTypeGarbage
---@field projectile EngineTagDataObjectTypeProjectile
---@field scenery EngineTagDataObjectTypeScenery
---@field deviceMachine EngineTagDataObjectTypeDeviceMachine
---@field deviceControl EngineTagDataObjectTypeDeviceControl
---@field deviceLightFixture EngineTagDataObjectTypeDeviceLightFixture
---@field placeholder EngineTagDataObjectTypePlaceholder
---@field soundScenery EngineTagDataObjectTypeSoundScenery
Engine.tag.objectType = {} 

---@class MetaEngineTagDataObjectFunctionFlags 
---@field invert boolean 
---@field additive boolean 
---@field alwaysActive boolean 

---@class MetaEngineTagDataObjectFlags 
---@field doesNotCastShadow boolean 
---@field transparentSelfOcclusion boolean 
---@field brighterThanItShouldBe boolean 
---@field notAPathfindingObstacle boolean 
---@field extensionOfParent boolean 
---@field castShadowByDefault boolean 
---@field doesNotHaveAnniversaryGeometry boolean 

---@class MetaEngineTagDataBaseObjectFlags 
---@field offInPegasus boolean 

---@class MetaEngineTagDataPredictedResource 
---@field type EngineTagDataPredictedResourceType 
---@field resourceIndex MetaEngineIndex 
---@field tag EngineTagHandle 

---@class MetaEngineTagDataObjectAttachment 
---@field type MetaEngineTagDependency 
---@field marker MetaEngineTagString 
---@field primaryScale EngineTagDataFunctionOut 
---@field secondaryScale EngineTagDataFunctionOut 
---@field changeColor EngineTagDataFunctionNameNullable 

---@class MetaEngineTagDataObjectWidget 
---@field reference MetaEngineTagDependency 

---@class MetaEngineTagDataObjectFunction 
---@field flags MetaEngineTagDataObjectFunctionFlags 
---@field period number 
---@field scalePeriodBy EngineTagDataFunctionScaleBy 
---@field function EngineTagDataWaveFunction 
---@field scaleFunctionBy EngineTagDataFunctionScaleBy 
---@field wobbleFunction EngineTagDataWaveFunction 
---@field wobblePeriod number 
---@field wobbleMagnitude number 
---@field squareWaveThreshold MetaEngineFraction 
---@field stepCount integer 
---@field mapTo EngineTagDataFunctionType 
---@field sawtoothCount integer 
---@field add EngineTagDataFunctionScaleBy 
---@field scaleResultBy EngineTagDataFunctionScaleBy 
---@field boundsMode EngineTagDataFunctionBoundsMode 
---@field bounds MetaEngineFraction 
---@field turnOffWith integer 
---@field scaleBy number 
---@field inverseBounds number 
---@field inverseSawtooth number 
---@field inverseStep number 
---@field inversePeriod number 
---@field usage MetaEngineTagString 

---@class MetaEngineTagDataObjectChangeColorsPermutation 
---@field weight number 
---@field colorLowerBound MetaEngineColorRGB 
---@field colorUpperBound MetaEngineColorRGB 

---@class MetaEngineTagDataObjectChangeColors 
---@field darkenBy EngineTagDataFunctionScaleBy 
---@field scaleBy EngineTagDataFunctionScaleBy 
---@field flags MetaEngineTagDataColorInterpolationFlags 
---@field colorLowerBound MetaEngineColorRGB 
---@field colorUpperBound MetaEngineColorRGB 
---@field permutations table<MetaEngineTagDataObjectChangeColorsPermutation> 

---@class MetaEngineTagDataObject 
---@field objectType EngineTagDataObjectType 
---@field flags MetaEngineTagDataObjectFlags 
---@field boundingRadius number 
---@field boundingOffset MetaEnginePoint3D 
---@field originOffset MetaEnginePoint3D 
---@field accelerationScale number 
---@field scalesChangeColors integer 
---@field model MetaEngineTagDependency 
---@field animationGraph MetaEngineTagDependency 
---@field collisionModel MetaEngineTagDependency 
---@field physics MetaEngineTagDependency 
---@field modifierShader MetaEngineTagDependency 
---@field creationEffect MetaEngineTagDependency 
---@field renderBoundingRadius number 
---@field aIn EngineTagDataObjectFunctionIn 
---@field bIn EngineTagDataObjectFunctionIn 
---@field cIn EngineTagDataObjectFunctionIn 
---@field dIn EngineTagDataObjectFunctionIn 
---@field hudTextMessageIndex integer 
---@field forcedShaderPermutationIndex integer 
---@field attachments table<MetaEngineTagDataObjectAttachment> 
---@field widgets table<MetaEngineTagDataObjectWidget> 
---@field functions table<MetaEngineTagDataObjectFunction> 
---@field changeColors table<MetaEngineTagDataObjectChangeColors> 
---@field predictedResources table<MetaEngineTagDataPredictedResource> 

---@class MetaEngineTagDataBasicObject: MetaEngineTagDataObject  
---@field moreFlags MetaEngineTagDataBaseObjectFlags 


