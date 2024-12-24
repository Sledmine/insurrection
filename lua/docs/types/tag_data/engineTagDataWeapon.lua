---@class EngineTagWeaponSecondaryTriggerModeEnum : Enum 

---@class EngineTagWeaponSecondaryTriggerModeNormal : EngineTagWeaponSecondaryTriggerModeEnum 
---@class EngineTagWeaponSecondaryTriggerModeSlavedToPrimary : EngineTagWeaponSecondaryTriggerModeEnum 
---@class EngineTagWeaponSecondaryTriggerModeInhibitsPrimary : EngineTagWeaponSecondaryTriggerModeEnum 
---@class EngineTagWeaponSecondaryTriggerModeLoadsAlterateAmmunition : EngineTagWeaponSecondaryTriggerModeEnum 
---@class EngineTagWeaponSecondaryTriggerModeLoadsMultiplePrimaryAmmunition : EngineTagWeaponSecondaryTriggerModeEnum 

---@alias EngineTagWeaponSecondaryTriggerMode 
---| EngineTagWeaponSecondaryTriggerModeNormal
---| EngineTagWeaponSecondaryTriggerModeSlavedToPrimary
---| EngineTagWeaponSecondaryTriggerModeInhibitsPrimary
---| EngineTagWeaponSecondaryTriggerModeLoadsAlterateAmmunition
---| EngineTagWeaponSecondaryTriggerModeLoadsMultiplePrimaryAmmunition

---@class EngineTagWeaponSecondaryTriggerModeTable 
---@field deNormal EngineTagWeaponSecondaryTriggerModeNormal
---@field deSlavedToPrimary EngineTagWeaponSecondaryTriggerModeSlavedToPrimary
---@field deInhibitsPrimary EngineTagWeaponSecondaryTriggerModeInhibitsPrimary
---@field deLoadsAlterateAmmunition EngineTagWeaponSecondaryTriggerModeLoadsAlterateAmmunition
---@field deLoadsMultiplePrimaryAmmunition EngineTagWeaponSecondaryTriggerModeLoadsMultiplePrimaryAmmunition
Engine.tag.weaponSecondaryTriggerMode = {} 

---@class EngineTagWeaponFunctionInEnum : Enum 

---@class EngineTagWeaponFunctionInNone : EngineTagWeaponFunctionInEnum 
---@class EngineTagWeaponFunctionInHeat : EngineTagWeaponFunctionInEnum 
---@class EngineTagWeaponFunctionInPrimaryAmmunition : EngineTagWeaponFunctionInEnum 
---@class EngineTagWeaponFunctionInSecondaryAmmunition : EngineTagWeaponFunctionInEnum 
---@class EngineTagWeaponFunctionInPrimaryRateOfFire : EngineTagWeaponFunctionInEnum 
---@class EngineTagWeaponFunctionInSecondaryRateOfFire : EngineTagWeaponFunctionInEnum 
---@class EngineTagWeaponFunctionInReady : EngineTagWeaponFunctionInEnum 
---@class EngineTagWeaponFunctionInPrimaryEjectionPort : EngineTagWeaponFunctionInEnum 
---@class EngineTagWeaponFunctionInSecondaryEjectionPort : EngineTagWeaponFunctionInEnum 
---@class EngineTagWeaponFunctionInOverheated : EngineTagWeaponFunctionInEnum 
---@class EngineTagWeaponFunctionInPrimaryCharged : EngineTagWeaponFunctionInEnum 
---@class EngineTagWeaponFunctionInSecondaryCharged : EngineTagWeaponFunctionInEnum 
---@class EngineTagWeaponFunctionInIllumination : EngineTagWeaponFunctionInEnum 
---@class EngineTagWeaponFunctionInAge : EngineTagWeaponFunctionInEnum 
---@class EngineTagWeaponFunctionInIntegratedLight : EngineTagWeaponFunctionInEnum 
---@class EngineTagWeaponFunctionInPrimaryFiring : EngineTagWeaponFunctionInEnum 
---@class EngineTagWeaponFunctionInSecondaryFiring : EngineTagWeaponFunctionInEnum 
---@class EngineTagWeaponFunctionInPrimaryFiringOn : EngineTagWeaponFunctionInEnum 
---@class EngineTagWeaponFunctionInSecondaryFiringOn : EngineTagWeaponFunctionInEnum 

---@alias EngineTagWeaponFunctionIn 
---| EngineTagWeaponFunctionInNone
---| EngineTagWeaponFunctionInHeat
---| EngineTagWeaponFunctionInPrimaryAmmunition
---| EngineTagWeaponFunctionInSecondaryAmmunition
---| EngineTagWeaponFunctionInPrimaryRateOfFire
---| EngineTagWeaponFunctionInSecondaryRateOfFire
---| EngineTagWeaponFunctionInReady
---| EngineTagWeaponFunctionInPrimaryEjectionPort
---| EngineTagWeaponFunctionInSecondaryEjectionPort
---| EngineTagWeaponFunctionInOverheated
---| EngineTagWeaponFunctionInPrimaryCharged
---| EngineTagWeaponFunctionInSecondaryCharged
---| EngineTagWeaponFunctionInIllumination
---| EngineTagWeaponFunctionInAge
---| EngineTagWeaponFunctionInIntegratedLight
---| EngineTagWeaponFunctionInPrimaryFiring
---| EngineTagWeaponFunctionInSecondaryFiring
---| EngineTagWeaponFunctionInPrimaryFiringOn
---| EngineTagWeaponFunctionInSecondaryFiringOn

---@class EngineTagWeaponFunctionInTable 
---@field nNone EngineTagWeaponFunctionInNone
---@field nHeat EngineTagWeaponFunctionInHeat
---@field nPrimaryAmmunition EngineTagWeaponFunctionInPrimaryAmmunition
---@field nSecondaryAmmunition EngineTagWeaponFunctionInSecondaryAmmunition
---@field nPrimaryRateOfFire EngineTagWeaponFunctionInPrimaryRateOfFire
---@field nSecondaryRateOfFire EngineTagWeaponFunctionInSecondaryRateOfFire
---@field nReady EngineTagWeaponFunctionInReady
---@field nPrimaryEjectionPort EngineTagWeaponFunctionInPrimaryEjectionPort
---@field nSecondaryEjectionPort EngineTagWeaponFunctionInSecondaryEjectionPort
---@field nOverheated EngineTagWeaponFunctionInOverheated
---@field nPrimaryCharged EngineTagWeaponFunctionInPrimaryCharged
---@field nSecondaryCharged EngineTagWeaponFunctionInSecondaryCharged
---@field nIllumination EngineTagWeaponFunctionInIllumination
---@field nAge EngineTagWeaponFunctionInAge
---@field nIntegratedLight EngineTagWeaponFunctionInIntegratedLight
---@field nPrimaryFiring EngineTagWeaponFunctionInPrimaryFiring
---@field nSecondaryFiring EngineTagWeaponFunctionInSecondaryFiring
---@field nPrimaryFiringOn EngineTagWeaponFunctionInPrimaryFiringOn
---@field nSecondaryFiringOn EngineTagWeaponFunctionInSecondaryFiringOn
Engine.tag.weaponFunctionIn = {} 

---@class EngineTagWeaponMovementPenalizedEnum : Enum 

---@class EngineTagWeaponMovementPenalizedAlways : EngineTagWeaponMovementPenalizedEnum 
---@class EngineTagWeaponMovementPenalizedWhenZoomed : EngineTagWeaponMovementPenalizedEnum 
---@class EngineTagWeaponMovementPenalizedWhenZoomedOrReloading : EngineTagWeaponMovementPenalizedEnum 

---@alias EngineTagWeaponMovementPenalized 
---| EngineTagWeaponMovementPenalizedAlways
---| EngineTagWeaponMovementPenalizedWhenZoomed
---| EngineTagWeaponMovementPenalizedWhenZoomedOrReloading

---@class EngineTagWeaponMovementPenalizedTable 
---@field dAlways EngineTagWeaponMovementPenalizedAlways
---@field dWhenZoomed EngineTagWeaponMovementPenalizedWhenZoomed
---@field dWhenZoomedOrReloading EngineTagWeaponMovementPenalizedWhenZoomedOrReloading
Engine.tag.weaponMovementPenalized = {} 

---@class EngineTagWeaponTypeEnum : Enum 

---@class EngineTagWeaponTypeUndefined : EngineTagWeaponTypeEnum 
---@class EngineTagWeaponTypeShotgun : EngineTagWeaponTypeEnum 
---@class EngineTagWeaponTypeNeedler : EngineTagWeaponTypeEnum 
---@class EngineTagWeaponTypePlasmaPistol : EngineTagWeaponTypeEnum 
---@class EngineTagWeaponTypePlasmaRifle : EngineTagWeaponTypeEnum 
---@class EngineTagWeaponTypeRocketLauncher : EngineTagWeaponTypeEnum 

---@alias EngineTagWeaponType 
---| EngineTagWeaponTypeUndefined
---| EngineTagWeaponTypeShotgun
---| EngineTagWeaponTypeNeedler
---| EngineTagWeaponTypePlasmaPistol
---| EngineTagWeaponTypePlasmaRifle
---| EngineTagWeaponTypeRocketLauncher

---@class EngineTagWeaponTypeTable 
---@field undefined EngineTagWeaponTypeUndefined
---@field shotgun EngineTagWeaponTypeShotgun
---@field needler EngineTagWeaponTypeNeedler
---@field plasmaPistol EngineTagWeaponTypePlasmaPistol
---@field plasmaRifle EngineTagWeaponTypePlasmaRifle
---@field rocketLauncher EngineTagWeaponTypeRocketLauncher
Engine.tag.weaponType = {} 

---@class EngineTagWeaponPredictionTypeEnum : Enum 

---@class EngineTagWeaponPredictionTypeNone : EngineTagWeaponPredictionTypeEnum 
---@class EngineTagWeaponPredictionTypeContinuous : EngineTagWeaponPredictionTypeEnum 
---@class EngineTagWeaponPredictionTypeInstant : EngineTagWeaponPredictionTypeEnum 

---@alias EngineTagWeaponPredictionType 
---| EngineTagWeaponPredictionTypeNone
---| EngineTagWeaponPredictionTypeContinuous
---| EngineTagWeaponPredictionTypeInstant

---@class EngineTagWeaponPredictionTypeTable 
---@field eNone EngineTagWeaponPredictionTypeNone
---@field eContinuous EngineTagWeaponPredictionTypeContinuous
---@field eInstant EngineTagWeaponPredictionTypeInstant
Engine.tag.weaponPredictionType = {} 

---@class EngineTagWeaponOverchargedActionEnum : Enum 

---@class EngineTagWeaponOverchargedActionNone : EngineTagWeaponOverchargedActionEnum 
---@class EngineTagWeaponOverchargedActionExplode : EngineTagWeaponOverchargedActionEnum 
---@class EngineTagWeaponOverchargedActionDischarge : EngineTagWeaponOverchargedActionEnum 

---@alias EngineTagWeaponOverchargedAction 
---| EngineTagWeaponOverchargedActionNone
---| EngineTagWeaponOverchargedActionExplode
---| EngineTagWeaponOverchargedActionDischarge

---@class EngineTagWeaponOverchargedActionTable 
---@field nNone EngineTagWeaponOverchargedActionNone
---@field nExplode EngineTagWeaponOverchargedActionExplode
---@field nDischarge EngineTagWeaponOverchargedActionDischarge
Engine.tag.weaponOverchargedAction = {} 

---@class EngineTagWeaponDistributionFunctionEnum : Enum 

---@class EngineTagWeaponDistributionFunctionPoint : EngineTagWeaponDistributionFunctionEnum 
---@class EngineTagWeaponDistributionFunctionHorizontalFan : EngineTagWeaponDistributionFunctionEnum 

---@alias EngineTagWeaponDistributionFunction 
---| EngineTagWeaponDistributionFunctionPoint
---| EngineTagWeaponDistributionFunctionHorizontalFan

---@class EngineTagWeaponDistributionFunctionTable 
---@field nPoint EngineTagWeaponDistributionFunctionPoint
---@field nHorizontalFan EngineTagWeaponDistributionFunctionHorizontalFan
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
---@field magazineObjects TagBlock<MetaEngineTagDataWeaponMagazineObject> 

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
---@field firingEffects TagBlock<MetaEngineTagDataWeaponTriggerFiringEffect> 

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
---@field morePredictedResources TagBlock<MetaEngineTagDataPredictedResource> 
---@field magazines TagBlock<MetaEngineTagDataWeaponMagazine> 
---@field triggers TagBlock<MetaEngineTagDataWeaponTrigger> 


