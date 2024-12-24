---@class EngineTagHUDInterfaceDestinationTypeEnum : Enum 

---@class EngineTagHUDInterfaceDestinationTypeTint01 : EngineTagHUDInterfaceDestinationTypeEnum 
---@class EngineTagHUDInterfaceDestinationTypeHorizontalOffset : EngineTagHUDInterfaceDestinationTypeEnum 
---@class EngineTagHUDInterfaceDestinationTypeVerticalOffset : EngineTagHUDInterfaceDestinationTypeEnum 
---@class EngineTagHUDInterfaceDestinationTypeFade01 : EngineTagHUDInterfaceDestinationTypeEnum 

---@alias EngineTagHUDInterfaceDestinationType 
---| EngineTagHUDInterfaceDestinationTypeTint01
---| EngineTagHUDInterfaceDestinationTypeHorizontalOffset
---| EngineTagHUDInterfaceDestinationTypeVerticalOffset
---| EngineTagHUDInterfaceDestinationTypeFade01

---@class EngineTagHUDInterfaceDestinationTypeTable 
---@field typeTint01 EngineTagHUDInterfaceDestinationTypeTint01
---@field typeHorizontalOffset EngineTagHUDInterfaceDestinationTypeHorizontalOffset
---@field typeVerticalOffset EngineTagHUDInterfaceDestinationTypeVerticalOffset
---@field typeFade01 EngineTagHUDInterfaceDestinationTypeFade01
Engine.tag.hUDInterfaceDestinationType = {} 

---@class EngineTagHUDInterfaceDestinationEnum : Enum 

---@class EngineTagHUDInterfaceDestinationGeometryOffset : EngineTagHUDInterfaceDestinationEnum 
---@class EngineTagHUDInterfaceDestinationPrimaryMap : EngineTagHUDInterfaceDestinationEnum 
---@class EngineTagHUDInterfaceDestinationSecondaryMap : EngineTagHUDInterfaceDestinationEnum 
---@class EngineTagHUDInterfaceDestinationTertiaryMap : EngineTagHUDInterfaceDestinationEnum 

---@alias EngineTagHUDInterfaceDestination 
---| EngineTagHUDInterfaceDestinationGeometryOffset
---| EngineTagHUDInterfaceDestinationPrimaryMap
---| EngineTagHUDInterfaceDestinationSecondaryMap
---| EngineTagHUDInterfaceDestinationTertiaryMap

---@class EngineTagHUDInterfaceDestinationTable 
---@field ionGeometryOffset EngineTagHUDInterfaceDestinationGeometryOffset
---@field ionPrimaryMap EngineTagHUDInterfaceDestinationPrimaryMap
---@field ionSecondaryMap EngineTagHUDInterfaceDestinationSecondaryMap
---@field ionTertiaryMap EngineTagHUDInterfaceDestinationTertiaryMap
Engine.tag.hUDInterfaceDestination = {} 

---@class EngineTagHUDInterfaceSourceEnum : Enum 

---@class EngineTagHUDInterfaceSourcePlayerPitch : EngineTagHUDInterfaceSourceEnum 
---@class EngineTagHUDInterfaceSourcePlayerPitchTangent : EngineTagHUDInterfaceSourceEnum 
---@class EngineTagHUDInterfaceSourcePlayerYaw : EngineTagHUDInterfaceSourceEnum 
---@class EngineTagHUDInterfaceSourceWeaponAmmoTotal : EngineTagHUDInterfaceSourceEnum 
---@class EngineTagHUDInterfaceSourceWeaponAmmoLoaded : EngineTagHUDInterfaceSourceEnum 
---@class EngineTagHUDInterfaceSourceWeaponHeat : EngineTagHUDInterfaceSourceEnum 
---@class EngineTagHUDInterfaceSourceExplicitUsesLowBound : EngineTagHUDInterfaceSourceEnum 
---@class EngineTagHUDInterfaceSourceWeaponZoomLevel : EngineTagHUDInterfaceSourceEnum 

---@alias EngineTagHUDInterfaceSource 
---| EngineTagHUDInterfaceSourcePlayerPitch
---| EngineTagHUDInterfaceSourcePlayerPitchTangent
---| EngineTagHUDInterfaceSourcePlayerYaw
---| EngineTagHUDInterfaceSourceWeaponAmmoTotal
---| EngineTagHUDInterfaceSourceWeaponAmmoLoaded
---| EngineTagHUDInterfaceSourceWeaponHeat
---| EngineTagHUDInterfaceSourceExplicitUsesLowBound
---| EngineTagHUDInterfaceSourceWeaponZoomLevel

---@class EngineTagHUDInterfaceSourceTable 
---@field rcePlayerPitch EngineTagHUDInterfaceSourcePlayerPitch
---@field rcePlayerPitchTangent EngineTagHUDInterfaceSourcePlayerPitchTangent
---@field rcePlayerYaw EngineTagHUDInterfaceSourcePlayerYaw
---@field rceWeaponAmmoTotal EngineTagHUDInterfaceSourceWeaponAmmoTotal
---@field rceWeaponAmmoLoaded EngineTagHUDInterfaceSourceWeaponAmmoLoaded
---@field rceWeaponHeat EngineTagHUDInterfaceSourceWeaponHeat
---@field rceExplicitUsesLowBound EngineTagHUDInterfaceSourceExplicitUsesLowBound
---@field rceWeaponZoomLevel EngineTagHUDInterfaceSourceWeaponZoomLevel
Engine.tag.hUDInterfaceSource = {} 

---@class EngineTagHUDInterfaceMultitextureOverlayAnchorEnum : Enum 

---@class EngineTagHUDInterfaceMultitextureOverlayAnchorTexture : EngineTagHUDInterfaceMultitextureOverlayAnchorEnum 
---@class EngineTagHUDInterfaceMultitextureOverlayAnchorScreen : EngineTagHUDInterfaceMultitextureOverlayAnchorEnum 

---@alias EngineTagHUDInterfaceMultitextureOverlayAnchor 
---| EngineTagHUDInterfaceMultitextureOverlayAnchorTexture
---| EngineTagHUDInterfaceMultitextureOverlayAnchorScreen

---@class EngineTagHUDInterfaceMultitextureOverlayAnchorTable 
---@field nchorTexture EngineTagHUDInterfaceMultitextureOverlayAnchorTexture
---@field nchorScreen EngineTagHUDInterfaceMultitextureOverlayAnchorScreen
Engine.tag.hUDInterfaceMultitextureOverlayAnchor = {} 

---@class EngineTagHUDInterfaceZeroToOneBlendFunctionEnum : Enum 

---@class EngineTagHUDInterfaceZeroToOneBlendFunctionAdd : EngineTagHUDInterfaceZeroToOneBlendFunctionEnum 
---@class EngineTagHUDInterfaceZeroToOneBlendFunctionSubtract : EngineTagHUDInterfaceZeroToOneBlendFunctionEnum 
---@class EngineTagHUDInterfaceZeroToOneBlendFunctionMultiply : EngineTagHUDInterfaceZeroToOneBlendFunctionEnum 
---@class EngineTagHUDInterfaceZeroToOneBlendFunctionMultiply2x : EngineTagHUDInterfaceZeroToOneBlendFunctionEnum 
---@class EngineTagHUDInterfaceZeroToOneBlendFunctionDot : EngineTagHUDInterfaceZeroToOneBlendFunctionEnum 

---@alias EngineTagHUDInterfaceZeroToOneBlendFunction 
---| EngineTagHUDInterfaceZeroToOneBlendFunctionAdd
---| EngineTagHUDInterfaceZeroToOneBlendFunctionSubtract
---| EngineTagHUDInterfaceZeroToOneBlendFunctionMultiply
---| EngineTagHUDInterfaceZeroToOneBlendFunctionMultiply2x
---| EngineTagHUDInterfaceZeroToOneBlendFunctionDot

---@class EngineTagHUDInterfaceZeroToOneBlendFunctionTable 
---@field unctionAdd EngineTagHUDInterfaceZeroToOneBlendFunctionAdd
---@field unctionSubtract EngineTagHUDInterfaceZeroToOneBlendFunctionSubtract
---@field unctionMultiply EngineTagHUDInterfaceZeroToOneBlendFunctionMultiply
---@field unctionMultiply2x EngineTagHUDInterfaceZeroToOneBlendFunctionMultiply2x
---@field unctionDot EngineTagHUDInterfaceZeroToOneBlendFunctionDot
Engine.tag.hUDInterfaceZeroToOneBlendFunction = {} 

---@class EngineTagHUDInterfaceWrapModeEnum : Enum 

---@class EngineTagHUDInterfaceWrapModeClamp : EngineTagHUDInterfaceWrapModeEnum 
---@class EngineTagHUDInterfaceWrapModeWrap : EngineTagHUDInterfaceWrapModeEnum 

---@alias EngineTagHUDInterfaceWrapMode 
---| EngineTagHUDInterfaceWrapModeClamp
---| EngineTagHUDInterfaceWrapModeWrap

---@class EngineTagHUDInterfaceWrapModeTable 
---@field modeClamp EngineTagHUDInterfaceWrapModeClamp
---@field modeWrap EngineTagHUDInterfaceWrapModeWrap
Engine.tag.hUDInterfaceWrapMode = {} 

---@class EngineTagHUDInterfaceAnchorEnum : Enum 

---@class EngineTagHUDInterfaceAnchorTopLeft : EngineTagHUDInterfaceAnchorEnum 
---@class EngineTagHUDInterfaceAnchorTopRight : EngineTagHUDInterfaceAnchorEnum 
---@class EngineTagHUDInterfaceAnchorBottomLeft : EngineTagHUDInterfaceAnchorEnum 
---@class EngineTagHUDInterfaceAnchorBottomRight : EngineTagHUDInterfaceAnchorEnum 
---@class EngineTagHUDInterfaceAnchorCenter : EngineTagHUDInterfaceAnchorEnum 

---@alias EngineTagHUDInterfaceAnchor 
---| EngineTagHUDInterfaceAnchorTopLeft
---| EngineTagHUDInterfaceAnchorTopRight
---| EngineTagHUDInterfaceAnchorBottomLeft
---| EngineTagHUDInterfaceAnchorBottomRight
---| EngineTagHUDInterfaceAnchorCenter

---@class EngineTagHUDInterfaceAnchorTable 
---@field horTopLeft EngineTagHUDInterfaceAnchorTopLeft
---@field horTopRight EngineTagHUDInterfaceAnchorTopRight
---@field horBottomLeft EngineTagHUDInterfaceAnchorBottomLeft
---@field horBottomRight EngineTagHUDInterfaceAnchorBottomRight
---@field horCenter EngineTagHUDInterfaceAnchorCenter
Engine.tag.hUDInterfaceAnchor = {} 

---@class EngineTagHUDInterfaceChildAnchorEnum : Enum 

---@class EngineTagHUDInterfaceChildAnchorFromParent : EngineTagHUDInterfaceChildAnchorEnum 
---@class EngineTagHUDInterfaceChildAnchorTopLeft : EngineTagHUDInterfaceChildAnchorEnum 
---@class EngineTagHUDInterfaceChildAnchorTopRight : EngineTagHUDInterfaceChildAnchorEnum 
---@class EngineTagHUDInterfaceChildAnchorBottomLeft : EngineTagHUDInterfaceChildAnchorEnum 
---@class EngineTagHUDInterfaceChildAnchorBottomRight : EngineTagHUDInterfaceChildAnchorEnum 
---@class EngineTagHUDInterfaceChildAnchorCenter : EngineTagHUDInterfaceChildAnchorEnum 

---@alias EngineTagHUDInterfaceChildAnchor 
---| EngineTagHUDInterfaceChildAnchorFromParent
---| EngineTagHUDInterfaceChildAnchorTopLeft
---| EngineTagHUDInterfaceChildAnchorTopRight
---| EngineTagHUDInterfaceChildAnchorBottomLeft
---| EngineTagHUDInterfaceChildAnchorBottomRight
---| EngineTagHUDInterfaceChildAnchorCenter

---@class EngineTagHUDInterfaceChildAnchorTable 
---@field chorFromParent EngineTagHUDInterfaceChildAnchorFromParent
---@field chorTopLeft EngineTagHUDInterfaceChildAnchorTopLeft
---@field chorTopRight EngineTagHUDInterfaceChildAnchorTopRight
---@field chorBottomLeft EngineTagHUDInterfaceChildAnchorBottomLeft
---@field chorBottomRight EngineTagHUDInterfaceChildAnchorBottomRight
---@field chorCenter EngineTagHUDInterfaceChildAnchorCenter
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
---@field effectors TagBlock<MetaEngineTagDataHUDInterfaceMultitextureOverlayEffector> 


