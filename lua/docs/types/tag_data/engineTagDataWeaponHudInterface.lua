-- SPDX-License-Identifier: GPL-3.0-only
-- This file is used to document the Lua plugins engine API. It should not be included.

---@meta _

---@class EngineTagWeaponHUDInterfaceStateAttachedToEnum : Enum 

---@class EngineTagWeaponHUDInterfaceStateAttachedToTotalAmmo : EngineTagWeaponHUDInterfaceStateAttachedToEnum 
---@class EngineTagWeaponHUDInterfaceStateAttachedToLoadedAmmo : EngineTagWeaponHUDInterfaceStateAttachedToEnum 
---@class EngineTagWeaponHUDInterfaceStateAttachedToHeat : EngineTagWeaponHUDInterfaceStateAttachedToEnum 
---@class EngineTagWeaponHUDInterfaceStateAttachedToAge : EngineTagWeaponHUDInterfaceStateAttachedToEnum 
---@class EngineTagWeaponHUDInterfaceStateAttachedToSecondaryWeaponTotalAmmo : EngineTagWeaponHUDInterfaceStateAttachedToEnum 
---@class EngineTagWeaponHUDInterfaceStateAttachedToSecondaryWeaponLoadedAmmo : EngineTagWeaponHUDInterfaceStateAttachedToEnum 
---@class EngineTagWeaponHUDInterfaceStateAttachedToDistanceToTarget : EngineTagWeaponHUDInterfaceStateAttachedToEnum 
---@class EngineTagWeaponHUDInterfaceStateAttachedToElevationToTarget : EngineTagWeaponHUDInterfaceStateAttachedToEnum 

---@alias EngineTagWeaponHUDInterfaceStateAttachedTo 
---| EngineTagWeaponHUDInterfaceStateAttachedToTotalAmmo
---| EngineTagWeaponHUDInterfaceStateAttachedToLoadedAmmo
---| EngineTagWeaponHUDInterfaceStateAttachedToHeat
---| EngineTagWeaponHUDInterfaceStateAttachedToAge
---| EngineTagWeaponHUDInterfaceStateAttachedToSecondaryWeaponTotalAmmo
---| EngineTagWeaponHUDInterfaceStateAttachedToSecondaryWeaponLoadedAmmo
---| EngineTagWeaponHUDInterfaceStateAttachedToDistanceToTarget
---| EngineTagWeaponHUDInterfaceStateAttachedToElevationToTarget

---@class EngineTagWeaponHUDInterfaceStateAttachedToTable 
---@field hedToTotalAmmo EngineTagWeaponHUDInterfaceStateAttachedToTotalAmmo
---@field hedToLoadedAmmo EngineTagWeaponHUDInterfaceStateAttachedToLoadedAmmo
---@field hedToHeat EngineTagWeaponHUDInterfaceStateAttachedToHeat
---@field hedToAge EngineTagWeaponHUDInterfaceStateAttachedToAge
---@field hedToSecondaryWeaponTotalAmmo EngineTagWeaponHUDInterfaceStateAttachedToSecondaryWeaponTotalAmmo
---@field hedToSecondaryWeaponLoadedAmmo EngineTagWeaponHUDInterfaceStateAttachedToSecondaryWeaponLoadedAmmo
---@field hedToDistanceToTarget EngineTagWeaponHUDInterfaceStateAttachedToDistanceToTarget
---@field hedToElevationToTarget EngineTagWeaponHUDInterfaceStateAttachedToElevationToTarget
Engine.tag.weaponHUDInterfaceStateAttachedTo = {} 

---@class EngineTagWeaponHUDInterfaceViewTypeEnum : Enum 

---@class EngineTagWeaponHUDInterfaceViewTypeAny : EngineTagWeaponHUDInterfaceViewTypeEnum 
---@class EngineTagWeaponHUDInterfaceViewTypeFullscreen : EngineTagWeaponHUDInterfaceViewTypeEnum 
---@class EngineTagWeaponHUDInterfaceViewTypeSplitscreen : EngineTagWeaponHUDInterfaceViewTypeEnum 

---@alias EngineTagWeaponHUDInterfaceViewType 
---| EngineTagWeaponHUDInterfaceViewTypeAny
---| EngineTagWeaponHUDInterfaceViewTypeFullscreen
---| EngineTagWeaponHUDInterfaceViewTypeSplitscreen

---@class EngineTagWeaponHUDInterfaceViewTypeTable 
---@field typeAny EngineTagWeaponHUDInterfaceViewTypeAny
---@field typeFullscreen EngineTagWeaponHUDInterfaceViewTypeFullscreen
---@field typeSplitscreen EngineTagWeaponHUDInterfaceViewTypeSplitscreen
Engine.tag.weaponHUDInterfaceViewType = {} 

---@class EngineTagWeaponHUDInterfaceCrosshairTypeEnum : Enum 

---@class EngineTagWeaponHUDInterfaceCrosshairTypeAim : EngineTagWeaponHUDInterfaceCrosshairTypeEnum 
---@class EngineTagWeaponHUDInterfaceCrosshairTypeZoomOverlay : EngineTagWeaponHUDInterfaceCrosshairTypeEnum 
---@class EngineTagWeaponHUDInterfaceCrosshairTypeCharge : EngineTagWeaponHUDInterfaceCrosshairTypeEnum 
---@class EngineTagWeaponHUDInterfaceCrosshairTypeShouldReload : EngineTagWeaponHUDInterfaceCrosshairTypeEnum 
---@class EngineTagWeaponHUDInterfaceCrosshairTypeFlashHeat : EngineTagWeaponHUDInterfaceCrosshairTypeEnum 
---@class EngineTagWeaponHUDInterfaceCrosshairTypeFlashTotalAmmo : EngineTagWeaponHUDInterfaceCrosshairTypeEnum 
---@class EngineTagWeaponHUDInterfaceCrosshairTypeFlashBattery : EngineTagWeaponHUDInterfaceCrosshairTypeEnum 
---@class EngineTagWeaponHUDInterfaceCrosshairTypeReloadOverheat : EngineTagWeaponHUDInterfaceCrosshairTypeEnum 
---@class EngineTagWeaponHUDInterfaceCrosshairTypeFlashWhenFiringAndNoAmmo : EngineTagWeaponHUDInterfaceCrosshairTypeEnum 
---@class EngineTagWeaponHUDInterfaceCrosshairTypeFlashWhenThrowingAndNoGrenade : EngineTagWeaponHUDInterfaceCrosshairTypeEnum 
---@class EngineTagWeaponHUDInterfaceCrosshairTypeLowAmmoAndNoneLeftToReload : EngineTagWeaponHUDInterfaceCrosshairTypeEnum 
---@class EngineTagWeaponHUDInterfaceCrosshairTypeShouldReloadSecondaryTrigger : EngineTagWeaponHUDInterfaceCrosshairTypeEnum 
---@class EngineTagWeaponHUDInterfaceCrosshairTypeFlashSecondaryTotalAmmo : EngineTagWeaponHUDInterfaceCrosshairTypeEnum 
---@class EngineTagWeaponHUDInterfaceCrosshairTypeFlashSecondaryReload : EngineTagWeaponHUDInterfaceCrosshairTypeEnum 
---@class EngineTagWeaponHUDInterfaceCrosshairTypeFlashWhenFiringSecondaryTriggerWithNoAmmo : EngineTagWeaponHUDInterfaceCrosshairTypeEnum 
---@class EngineTagWeaponHUDInterfaceCrosshairTypeLowSecondaryAmmoAndNoneLeftToReload : EngineTagWeaponHUDInterfaceCrosshairTypeEnum 
---@class EngineTagWeaponHUDInterfaceCrosshairTypePrimaryTriggerReady : EngineTagWeaponHUDInterfaceCrosshairTypeEnum 
---@class EngineTagWeaponHUDInterfaceCrosshairTypeSecondaryTriggerReady : EngineTagWeaponHUDInterfaceCrosshairTypeEnum 
---@class EngineTagWeaponHUDInterfaceCrosshairTypeFlashWhenFiringWithDepletedBattery : EngineTagWeaponHUDInterfaceCrosshairTypeEnum 

---@alias EngineTagWeaponHUDInterfaceCrosshairType 
---| EngineTagWeaponHUDInterfaceCrosshairTypeAim
---| EngineTagWeaponHUDInterfaceCrosshairTypeZoomOverlay
---| EngineTagWeaponHUDInterfaceCrosshairTypeCharge
---| EngineTagWeaponHUDInterfaceCrosshairTypeShouldReload
---| EngineTagWeaponHUDInterfaceCrosshairTypeFlashHeat
---| EngineTagWeaponHUDInterfaceCrosshairTypeFlashTotalAmmo
---| EngineTagWeaponHUDInterfaceCrosshairTypeFlashBattery
---| EngineTagWeaponHUDInterfaceCrosshairTypeReloadOverheat
---| EngineTagWeaponHUDInterfaceCrosshairTypeFlashWhenFiringAndNoAmmo
---| EngineTagWeaponHUDInterfaceCrosshairTypeFlashWhenThrowingAndNoGrenade
---| EngineTagWeaponHUDInterfaceCrosshairTypeLowAmmoAndNoneLeftToReload
---| EngineTagWeaponHUDInterfaceCrosshairTypeShouldReloadSecondaryTrigger
---| EngineTagWeaponHUDInterfaceCrosshairTypeFlashSecondaryTotalAmmo
---| EngineTagWeaponHUDInterfaceCrosshairTypeFlashSecondaryReload
---| EngineTagWeaponHUDInterfaceCrosshairTypeFlashWhenFiringSecondaryTriggerWithNoAmmo
---| EngineTagWeaponHUDInterfaceCrosshairTypeLowSecondaryAmmoAndNoneLeftToReload
---| EngineTagWeaponHUDInterfaceCrosshairTypePrimaryTriggerReady
---| EngineTagWeaponHUDInterfaceCrosshairTypeSecondaryTriggerReady
---| EngineTagWeaponHUDInterfaceCrosshairTypeFlashWhenFiringWithDepletedBattery

---@class EngineTagWeaponHUDInterfaceCrosshairTypeTable 
---@field typeAim EngineTagWeaponHUDInterfaceCrosshairTypeAim
---@field typeZoomOverlay EngineTagWeaponHUDInterfaceCrosshairTypeZoomOverlay
---@field typeCharge EngineTagWeaponHUDInterfaceCrosshairTypeCharge
---@field typeShouldReload EngineTagWeaponHUDInterfaceCrosshairTypeShouldReload
---@field typeFlashHeat EngineTagWeaponHUDInterfaceCrosshairTypeFlashHeat
---@field typeFlashTotalAmmo EngineTagWeaponHUDInterfaceCrosshairTypeFlashTotalAmmo
---@field typeFlashBattery EngineTagWeaponHUDInterfaceCrosshairTypeFlashBattery
---@field typeReloadOverheat EngineTagWeaponHUDInterfaceCrosshairTypeReloadOverheat
---@field typeFlashWhenFiringAndNoAmmo EngineTagWeaponHUDInterfaceCrosshairTypeFlashWhenFiringAndNoAmmo
---@field typeFlashWhenThrowingAndNoGrenade EngineTagWeaponHUDInterfaceCrosshairTypeFlashWhenThrowingAndNoGrenade
---@field typeLowAmmoAndNoneLeftToReload EngineTagWeaponHUDInterfaceCrosshairTypeLowAmmoAndNoneLeftToReload
---@field typeShouldReloadSecondaryTrigger EngineTagWeaponHUDInterfaceCrosshairTypeShouldReloadSecondaryTrigger
---@field typeFlashSecondaryTotalAmmo EngineTagWeaponHUDInterfaceCrosshairTypeFlashSecondaryTotalAmmo
---@field typeFlashSecondaryReload EngineTagWeaponHUDInterfaceCrosshairTypeFlashSecondaryReload
---@field typeFlashWhenFiringSecondaryTriggerWithNoAmmo EngineTagWeaponHUDInterfaceCrosshairTypeFlashWhenFiringSecondaryTriggerWithNoAmmo
---@field typeLowSecondaryAmmoAndNoneLeftToReload EngineTagWeaponHUDInterfaceCrosshairTypeLowSecondaryAmmoAndNoneLeftToReload
---@field typePrimaryTriggerReady EngineTagWeaponHUDInterfaceCrosshairTypePrimaryTriggerReady
---@field typeSecondaryTriggerReady EngineTagWeaponHUDInterfaceCrosshairTypeSecondaryTriggerReady
---@field typeFlashWhenFiringWithDepletedBattery EngineTagWeaponHUDInterfaceCrosshairTypeFlashWhenFiringWithDepletedBattery
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
---@field multitextureOverlays TagBlock<MetaEngineTagDataHUDInterfaceMultitextureOverlay> 

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
---@field crosshairOverlays TagBlock<MetaEngineTagDataWeaponHUDInterfaceCrosshairOverlay> 

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
---@field overlays TagBlock<MetaEngineTagDataWeaponHUDInterfaceOverlay> 

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
---@field staticElements TagBlock<MetaEngineTagDataWeaponHUDInterfaceStaticElement> 
---@field meterElements TagBlock<MetaEngineTagDataWeaponHUDInterfaceMeter> 
---@field numberElements TagBlock<MetaEngineTagDataWeaponHUDInterfaceNumber> 
---@field crosshairs TagBlock<MetaEngineTagDataWeaponHUDInterfaceCrosshair> 
---@field overlayElements TagBlock<MetaEngineTagDataWeaponHUDInterfaceOverlayElement> 
---@field crosshairTypes MetaEngineTagDataWeaponHUDInterfaceCrosshairTypeFlags 
---@field screenEffect TagBlock<MetaEngineTagDataWeaponHUDInterfaceScreenEffect> 
---@field sequenceIndex MetaEngineIndex 
---@field widthOffset integer 
---@field offsetFromReferenceCorner MetaEnginePoint2DInt 
---@field overrideIconColor MetaEngineColorARGBInt 
---@field frameRate integer 
---@field moreFlags MetaEngineTagDataHUDInterfaceMessagingFlags 
---@field textIndex MetaEngineIndex 


