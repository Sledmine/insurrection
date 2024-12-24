---@class EngineTagEffectCreateInEnum : Enum 

---@class EngineTagEffectCreateInAnyEnvironment : EngineTagEffectCreateInEnum 
---@class EngineTagEffectCreateInAirOnly : EngineTagEffectCreateInEnum 
---@class EngineTagEffectCreateInWaterOnly : EngineTagEffectCreateInEnum 
---@class EngineTagEffectCreateInSpaceOnly : EngineTagEffectCreateInEnum 

---@alias EngineTagEffectCreateIn 
---| EngineTagEffectCreateInAnyEnvironment
---| EngineTagEffectCreateInAirOnly
---| EngineTagEffectCreateInWaterOnly
---| EngineTagEffectCreateInSpaceOnly

---@class EngineTagEffectCreateInTable 
---@field nAnyEnvironment EngineTagEffectCreateInAnyEnvironment
---@field nAirOnly EngineTagEffectCreateInAirOnly
---@field nWaterOnly EngineTagEffectCreateInWaterOnly
---@field nSpaceOnly EngineTagEffectCreateInSpaceOnly
Engine.tag.effectCreateIn = {} 

---@class EngineTagEffectViolenceModeEnum : Enum 

---@class EngineTagEffectViolenceModeEitherMode : EngineTagEffectViolenceModeEnum 
---@class EngineTagEffectViolenceModeViolentModeOnly : EngineTagEffectViolenceModeEnum 
---@class EngineTagEffectViolenceModeNonviolentModeOnly : EngineTagEffectViolenceModeEnum 

---@alias EngineTagEffectViolenceMode 
---| EngineTagEffectViolenceModeEitherMode
---| EngineTagEffectViolenceModeViolentModeOnly
---| EngineTagEffectViolenceModeNonviolentModeOnly

---@class EngineTagEffectViolenceModeTable 
---@field eEitherMode EngineTagEffectViolenceModeEitherMode
---@field eViolentModeOnly EngineTagEffectViolenceModeViolentModeOnly
---@field eNonviolentModeOnly EngineTagEffectViolenceModeNonviolentModeOnly
Engine.tag.effectViolenceMode = {} 

---@class EngineTagEffectCreateEnum : Enum 

---@class EngineTagEffectCreateIndependentOfCameraMode : EngineTagEffectCreateEnum 
---@class EngineTagEffectCreateOnlyInFirstPerson : EngineTagEffectCreateEnum 
---@class EngineTagEffectCreateOnlyInThirdPerson : EngineTagEffectCreateEnum 
---@class EngineTagEffectCreateInFirstPersonIfPossible : EngineTagEffectCreateEnum 

---@alias EngineTagEffectCreate 
---| EngineTagEffectCreateIndependentOfCameraMode
---| EngineTagEffectCreateOnlyInFirstPerson
---| EngineTagEffectCreateOnlyInThirdPerson
---| EngineTagEffectCreateInFirstPersonIfPossible

---@class EngineTagEffectCreateTable 
---@field independentOfCameraMode EngineTagEffectCreateIndependentOfCameraMode
---@field onlyInFirstPerson EngineTagEffectCreateOnlyInFirstPerson
---@field onlyInThirdPerson EngineTagEffectCreateOnlyInThirdPerson
---@field inFirstPersonIfPossible EngineTagEffectCreateInFirstPersonIfPossible
Engine.tag.effectCreate = {} 

---@class EngineTagEffectDistributionFunctionEnum : Enum 

---@class EngineTagEffectDistributionFunctionStart : EngineTagEffectDistributionFunctionEnum 
---@class EngineTagEffectDistributionFunctionEnd : EngineTagEffectDistributionFunctionEnum 
---@class EngineTagEffectDistributionFunctionConstant : EngineTagEffectDistributionFunctionEnum 
---@class EngineTagEffectDistributionFunctionBuildup : EngineTagEffectDistributionFunctionEnum 
---@class EngineTagEffectDistributionFunctionFalloff : EngineTagEffectDistributionFunctionEnum 
---@class EngineTagEffectDistributionFunctionBuildupAndFalloff : EngineTagEffectDistributionFunctionEnum 

---@alias EngineTagEffectDistributionFunction 
---| EngineTagEffectDistributionFunctionStart
---| EngineTagEffectDistributionFunctionEnd
---| EngineTagEffectDistributionFunctionConstant
---| EngineTagEffectDistributionFunctionBuildup
---| EngineTagEffectDistributionFunctionFalloff
---| EngineTagEffectDistributionFunctionBuildupAndFalloff

---@class EngineTagEffectDistributionFunctionTable 
---@field nStart EngineTagEffectDistributionFunctionStart
---@field nEnd EngineTagEffectDistributionFunctionEnd
---@field nConstant EngineTagEffectDistributionFunctionConstant
---@field nBuildup EngineTagEffectDistributionFunctionBuildup
---@field nFalloff EngineTagEffectDistributionFunctionFalloff
---@field nBuildupAndFalloff EngineTagEffectDistributionFunctionBuildupAndFalloff
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
---@field parts TagBlock<MetaEngineTagDataEffectPart> 
---@field particles TagBlock<MetaEngineTagDataEffectParticle> 

---@class MetaEngineTagDataEffect 
---@field flags MetaEngineTagDataEffectFlags 
---@field loopStartEvent MetaEngineIndex 
---@field loopStopEvent MetaEngineIndex 
---@field maximumDamageRadius number 
---@field locations TagBlock<MetaEngineTagDataEffectLocation> 
---@field events TagBlock<MetaEngineTagDataEffectEvent> 


