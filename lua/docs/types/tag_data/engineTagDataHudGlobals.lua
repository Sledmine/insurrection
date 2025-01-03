---@class EngineTagHUDGlobalsAnniversaryRemapTargetLanguageEnum : Enum 

---@class EngineTagHUDGlobalsAnniversaryRemapTargetLanguageEnglish : EngineTagHUDGlobalsAnniversaryRemapTargetLanguageEnum 
---@class EngineTagHUDGlobalsAnniversaryRemapTargetLanguageFrench : EngineTagHUDGlobalsAnniversaryRemapTargetLanguageEnum 
---@class EngineTagHUDGlobalsAnniversaryRemapTargetLanguageSpanish : EngineTagHUDGlobalsAnniversaryRemapTargetLanguageEnum 
---@class EngineTagHUDGlobalsAnniversaryRemapTargetLanguageItalian : EngineTagHUDGlobalsAnniversaryRemapTargetLanguageEnum 
---@class EngineTagHUDGlobalsAnniversaryRemapTargetLanguageGerman : EngineTagHUDGlobalsAnniversaryRemapTargetLanguageEnum 
---@class EngineTagHUDGlobalsAnniversaryRemapTargetLanguageTraditionalChinese : EngineTagHUDGlobalsAnniversaryRemapTargetLanguageEnum 
---@class EngineTagHUDGlobalsAnniversaryRemapTargetLanguageJapanese : EngineTagHUDGlobalsAnniversaryRemapTargetLanguageEnum 
---@class EngineTagHUDGlobalsAnniversaryRemapTargetLanguageKorean : EngineTagHUDGlobalsAnniversaryRemapTargetLanguageEnum 
---@class EngineTagHUDGlobalsAnniversaryRemapTargetLanguagePortuguese : EngineTagHUDGlobalsAnniversaryRemapTargetLanguageEnum 
---@class EngineTagHUDGlobalsAnniversaryRemapTargetLanguageLatamSpanish : EngineTagHUDGlobalsAnniversaryRemapTargetLanguageEnum 
---@class EngineTagHUDGlobalsAnniversaryRemapTargetLanguagePolish : EngineTagHUDGlobalsAnniversaryRemapTargetLanguageEnum 
---@class EngineTagHUDGlobalsAnniversaryRemapTargetLanguageRussian : EngineTagHUDGlobalsAnniversaryRemapTargetLanguageEnum 
---@class EngineTagHUDGlobalsAnniversaryRemapTargetLanguageSimplifiedChinese : EngineTagHUDGlobalsAnniversaryRemapTargetLanguageEnum 

---@alias EngineTagHUDGlobalsAnniversaryRemapTargetLanguage 
---| EngineTagHUDGlobalsAnniversaryRemapTargetLanguageEnglish
---| EngineTagHUDGlobalsAnniversaryRemapTargetLanguageFrench
---| EngineTagHUDGlobalsAnniversaryRemapTargetLanguageSpanish
---| EngineTagHUDGlobalsAnniversaryRemapTargetLanguageItalian
---| EngineTagHUDGlobalsAnniversaryRemapTargetLanguageGerman
---| EngineTagHUDGlobalsAnniversaryRemapTargetLanguageTraditionalChinese
---| EngineTagHUDGlobalsAnniversaryRemapTargetLanguageJapanese
---| EngineTagHUDGlobalsAnniversaryRemapTargetLanguageKorean
---| EngineTagHUDGlobalsAnniversaryRemapTargetLanguagePortuguese
---| EngineTagHUDGlobalsAnniversaryRemapTargetLanguageLatamSpanish
---| EngineTagHUDGlobalsAnniversaryRemapTargetLanguagePolish
---| EngineTagHUDGlobalsAnniversaryRemapTargetLanguageRussian
---| EngineTagHUDGlobalsAnniversaryRemapTargetLanguageSimplifiedChinese

---@class EngineTagHUDGlobalsAnniversaryRemapTargetLanguageTable 
---@field nguageEnglish EngineTagHUDGlobalsAnniversaryRemapTargetLanguageEnglish
---@field nguageFrench EngineTagHUDGlobalsAnniversaryRemapTargetLanguageFrench
---@field nguageSpanish EngineTagHUDGlobalsAnniversaryRemapTargetLanguageSpanish
---@field nguageItalian EngineTagHUDGlobalsAnniversaryRemapTargetLanguageItalian
---@field nguageGerman EngineTagHUDGlobalsAnniversaryRemapTargetLanguageGerman
---@field nguageTraditionalChinese EngineTagHUDGlobalsAnniversaryRemapTargetLanguageTraditionalChinese
---@field nguageJapanese EngineTagHUDGlobalsAnniversaryRemapTargetLanguageJapanese
---@field nguageKorean EngineTagHUDGlobalsAnniversaryRemapTargetLanguageKorean
---@field nguagePortuguese EngineTagHUDGlobalsAnniversaryRemapTargetLanguagePortuguese
---@field nguageLatamSpanish EngineTagHUDGlobalsAnniversaryRemapTargetLanguageLatamSpanish
---@field nguagePolish EngineTagHUDGlobalsAnniversaryRemapTargetLanguagePolish
---@field nguageRussian EngineTagHUDGlobalsAnniversaryRemapTargetLanguageRussian
---@field nguageSimplifiedChinese EngineTagHUDGlobalsAnniversaryRemapTargetLanguageSimplifiedChinese
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
---@field targets TagBlock<MetaEngineTagDataHUDGlobalsAnniversaryRemapTarget> 

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
---@field buttonIcons TagBlock<MetaEngineTagDataHUDGlobalsButtonIcon> 
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
---@field waypointArrows TagBlock<MetaEngineTagDataHUDGlobalsWaypointArrow> 
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
---@field anniversaryHudRemaps TagBlock<MetaEngineTagDataHUDGlobalsAnniversaryRemap> 


