---@class EngineTagAnimationFunctionEnum : Enum 

---@class EngineTagAnimationFunctionAOut : EngineTagAnimationFunctionEnum 
---@class EngineTagAnimationFunctionBOut : EngineTagAnimationFunctionEnum 
---@class EngineTagAnimationFunctionCOut : EngineTagAnimationFunctionEnum 
---@class EngineTagAnimationFunctionDOut : EngineTagAnimationFunctionEnum 

---@alias EngineTagAnimationFunction 
---| EngineTagAnimationFunctionAOut
---| EngineTagAnimationFunctionBOut
---| EngineTagAnimationFunctionCOut
---| EngineTagAnimationFunctionDOut

---@class EngineTagAnimationFunctionTable 
---@field aOut EngineTagAnimationFunctionAOut
---@field bOut EngineTagAnimationFunctionBOut
---@field cOut EngineTagAnimationFunctionCOut
---@field dOut EngineTagAnimationFunctionDOut
Engine.tag.animationFunction = {} 

---@class EngineTagAnimationFunctionControlsEnum : Enum 

---@class EngineTagAnimationFunctionControlsFrame : EngineTagAnimationFunctionControlsEnum 
---@class EngineTagAnimationFunctionControlsScale : EngineTagAnimationFunctionControlsEnum 

---@alias EngineTagAnimationFunctionControls 
---| EngineTagAnimationFunctionControlsFrame
---| EngineTagAnimationFunctionControlsScale

---@class EngineTagAnimationFunctionControlsTable 
---@field sFrame EngineTagAnimationFunctionControlsFrame
---@field sScale EngineTagAnimationFunctionControlsScale
Engine.tag.animationFunctionControls = {} 

---@class EngineTagAnimationTypeEnum : Enum 

---@class EngineTagAnimationTypeBase : EngineTagAnimationTypeEnum 
---@class EngineTagAnimationTypeOverlay : EngineTagAnimationTypeEnum 
---@class EngineTagAnimationTypeReplacement : EngineTagAnimationTypeEnum 

---@alias EngineTagAnimationType 
---| EngineTagAnimationTypeBase
---| EngineTagAnimationTypeOverlay
---| EngineTagAnimationTypeReplacement

---@class EngineTagAnimationTypeTable 
---@field base EngineTagAnimationTypeBase
---@field overlay EngineTagAnimationTypeOverlay
---@field replacement EngineTagAnimationTypeReplacement
Engine.tag.animationType = {} 

---@class EngineTagAnimationFrameInfoTypeEnum : Enum 

---@class EngineTagAnimationFrameInfoTypeNone : EngineTagAnimationFrameInfoTypeEnum 
---@class EngineTagAnimationFrameInfoTypeDxDy : EngineTagAnimationFrameInfoTypeEnum 
---@class EngineTagAnimationFrameInfoTypeDxDyDyaw : EngineTagAnimationFrameInfoTypeEnum 
---@class EngineTagAnimationFrameInfoTypeDxDyDzDyaw : EngineTagAnimationFrameInfoTypeEnum 

---@alias EngineTagAnimationFrameInfoType 
---| EngineTagAnimationFrameInfoTypeNone
---| EngineTagAnimationFrameInfoTypeDxDy
---| EngineTagAnimationFrameInfoTypeDxDyDyaw
---| EngineTagAnimationFrameInfoTypeDxDyDzDyaw

---@class EngineTagAnimationFrameInfoTypeTable 
---@field peNone EngineTagAnimationFrameInfoTypeNone
---@field peDxDy EngineTagAnimationFrameInfoTypeDxDy
---@field peDxDyDyaw EngineTagAnimationFrameInfoTypeDxDyDyaw
---@field peDxDyDzDyaw EngineTagAnimationFrameInfoTypeDxDyDzDyaw
Engine.tag.animationFrameInfoType = {} 

---@class MetaEngineTagDataModelAnimationsAnimationGraphNodeFlags 
---@field ballSocket boolean 
---@field hinge boolean 
---@field noMovement boolean 

---@class MetaEngineTagDataModelAnimationsAnimationFlags 
---@field compressedData boolean 
---@field worldRelative boolean 
---@field 25hzPal boolean 

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
---@field animations TagBlock<MetaEngineTagDataModelAnimationsAnimationWeaponTypeAnimation> 

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
---@field animations TagBlock<MetaEngineTagDataModelAnimationsAnimationWeaponClassAnimation> 
---@field ikPoint TagBlock<MetaEngineTagDataModelAnimationsAnimationGraphUnitSeatikPoint> 
---@field weaponTypes TagBlock<MetaEngineTagDataModelAnimationsAnimationGraphWeaponType> 

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
---@field animations TagBlock<MetaEngineTagDataModelAnimationsAnimationWeaponClassAnimation> 
---@field ikPoints TagBlock<MetaEngineTagDataModelAnimationsAnimationGraphUnitSeatikPoint> 
---@field weapons TagBlock<MetaEngineTagDataModelAnimationsAnimationGraphWeapon> 

---@class MetaEngineTagDataModelAnimationsWeaponAnimation 
---@field animation MetaEngineIndex 

---@class MetaEngineTagDataModelAnimationsAnimationGraphWeaponAnimations 
---@field animations TagBlock<MetaEngineTagDataModelAnimationsWeaponAnimation> 

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
---@field animations TagBlock<MetaEngineTagDataModelAnimationsVehicleAnimation> 
---@field suspensionAnimations TagBlock<MetaEngineTagDataModelAnimationSuspensionAnimation> 

---@class MetaEngineTagDataModelAnimationsDeviceAnimation 
---@field animation MetaEngineIndex 

---@class MetaEngineTagDataModelAnimationsDeviceAnimations 
---@field animations TagBlock<MetaEngineTagDataModelAnimationsDeviceAnimation> 

---@class MetaEngineTagDataModelAnimationsUnitDamageAnimations 
---@field animation MetaEngineIndex 

---@class MetaEngineTagDataModelAnimationsFirstPersonWeapon 
---@field animation MetaEngineIndex 

---@class MetaEngineTagDataModelAnimationsAnimationGraphFirstPersonWeaponAnimations 
---@field animations TagBlock<MetaEngineTagDataModelAnimationsFirstPersonWeapon> 

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
---@field objects TagBlock<MetaEngineTagDataModelAnimationsAnimationGraphObjectOverlay> 
---@field units TagBlock<MetaEngineTagDataModelAnimationsAnimationGraphUnitSeat> 
---@field weapons TagBlock<MetaEngineTagDataModelAnimationsAnimationGraphWeaponAnimations> 
---@field vehicles TagBlock<MetaEngineTagDataModelAnimationsAnimationGraphVehicleAnimations> 
---@field devices TagBlock<MetaEngineTagDataModelAnimationsDeviceAnimations> 
---@field unitDamage TagBlock<MetaEngineTagDataModelAnimationsUnitDamageAnimations> 
---@field firstPersonWeapons TagBlock<MetaEngineTagDataModelAnimationsAnimationGraphFirstPersonWeaponAnimations> 
---@field soundReferences TagBlock<MetaEngineTagDataModelAnimationsAnimationGraphSoundReference> 
---@field limpBodyNodeRadius number 
---@field flags MetaEngineTagDataModelAnimationsFlags 
---@field nodes TagBlock<MetaEngineTagDataModelAnimationsAnimationGraphNode> 
---@field animations TagBlock<MetaEngineTagDataModelAnimationsAnimation> 


