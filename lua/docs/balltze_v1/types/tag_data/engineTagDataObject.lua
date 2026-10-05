---@class EngineTagPredictedResourceTypeEnum : Enum 

---@class EngineTagPredictedResourceTypeBitmap : EngineTagPredictedResourceTypeEnum 
---@class EngineTagPredictedResourceTypeSound : EngineTagPredictedResourceTypeEnum 

---@alias EngineTagPredictedResourceType 
---| EngineTagPredictedResourceTypeBitmap
---| EngineTagPredictedResourceTypeSound

---@class EngineTagPredictedResourceTypeTable 
---@field eBitmap EngineTagPredictedResourceTypeBitmap
---@field eSound EngineTagPredictedResourceTypeSound
Engine.tag.predictedResourceType = {} 

---@class EngineTagObjectNoiseEnum : Enum 

---@class EngineTagObjectNoiseSilent : EngineTagObjectNoiseEnum 
---@class EngineTagObjectNoiseMedium : EngineTagObjectNoiseEnum 
---@class EngineTagObjectNoiseLoud : EngineTagObjectNoiseEnum 
---@class EngineTagObjectNoiseShout : EngineTagObjectNoiseEnum 
---@class EngineTagObjectNoiseQuiet : EngineTagObjectNoiseEnum 

---@alias EngineTagObjectNoise 
---| EngineTagObjectNoiseSilent
---| EngineTagObjectNoiseMedium
---| EngineTagObjectNoiseLoud
---| EngineTagObjectNoiseShout
---| EngineTagObjectNoiseQuiet

---@class EngineTagObjectNoiseTable 
---@field silent EngineTagObjectNoiseSilent
---@field medium EngineTagObjectNoiseMedium
---@field loud EngineTagObjectNoiseLoud
---@field shout EngineTagObjectNoiseShout
---@field quiet EngineTagObjectNoiseQuiet
Engine.tag.objectNoise = {} 

---@class EngineTagObjectFunctionInEnum : Enum 

---@class EngineTagObjectFunctionInNone : EngineTagObjectFunctionInEnum 
---@class EngineTagObjectFunctionInBodyVitality : EngineTagObjectFunctionInEnum 
---@class EngineTagObjectFunctionInShieldVitality : EngineTagObjectFunctionInEnum 
---@class EngineTagObjectFunctionInRecentBodyDamage : EngineTagObjectFunctionInEnum 
---@class EngineTagObjectFunctionInRecentShieldDamage : EngineTagObjectFunctionInEnum 
---@class EngineTagObjectFunctionInRandomConstant : EngineTagObjectFunctionInEnum 
---@class EngineTagObjectFunctionInUmbrellaShieldVitality : EngineTagObjectFunctionInEnum 
---@class EngineTagObjectFunctionInShieldStun : EngineTagObjectFunctionInEnum 
---@class EngineTagObjectFunctionInRecentUmbrellaShieldVitality : EngineTagObjectFunctionInEnum 
---@class EngineTagObjectFunctionInUmbrellaShieldStun : EngineTagObjectFunctionInEnum 
---@class EngineTagObjectFunctionInRegion : EngineTagObjectFunctionInEnum 
---@class EngineTagObjectFunctionInRegion1 : EngineTagObjectFunctionInEnum 
---@class EngineTagObjectFunctionInRegion2 : EngineTagObjectFunctionInEnum 
---@class EngineTagObjectFunctionInRegion3 : EngineTagObjectFunctionInEnum 
---@class EngineTagObjectFunctionInRegion4 : EngineTagObjectFunctionInEnum 
---@class EngineTagObjectFunctionInRegion5 : EngineTagObjectFunctionInEnum 
---@class EngineTagObjectFunctionInRegion6 : EngineTagObjectFunctionInEnum 
---@class EngineTagObjectFunctionInRegion7 : EngineTagObjectFunctionInEnum 
---@class EngineTagObjectFunctionInAlive : EngineTagObjectFunctionInEnum 
---@class EngineTagObjectFunctionInCompass : EngineTagObjectFunctionInEnum 

---@alias EngineTagObjectFunctionIn 
---| EngineTagObjectFunctionInNone
---| EngineTagObjectFunctionInBodyVitality
---| EngineTagObjectFunctionInShieldVitality
---| EngineTagObjectFunctionInRecentBodyDamage
---| EngineTagObjectFunctionInRecentShieldDamage
---| EngineTagObjectFunctionInRandomConstant
---| EngineTagObjectFunctionInUmbrellaShieldVitality
---| EngineTagObjectFunctionInShieldStun
---| EngineTagObjectFunctionInRecentUmbrellaShieldVitality
---| EngineTagObjectFunctionInUmbrellaShieldStun
---| EngineTagObjectFunctionInRegion
---| EngineTagObjectFunctionInRegion1
---| EngineTagObjectFunctionInRegion2
---| EngineTagObjectFunctionInRegion3
---| EngineTagObjectFunctionInRegion4
---| EngineTagObjectFunctionInRegion5
---| EngineTagObjectFunctionInRegion6
---| EngineTagObjectFunctionInRegion7
---| EngineTagObjectFunctionInAlive
---| EngineTagObjectFunctionInCompass

---@class EngineTagObjectFunctionInTable 
---@field nNone EngineTagObjectFunctionInNone
---@field nBodyVitality EngineTagObjectFunctionInBodyVitality
---@field nShieldVitality EngineTagObjectFunctionInShieldVitality
---@field nRecentBodyDamage EngineTagObjectFunctionInRecentBodyDamage
---@field nRecentShieldDamage EngineTagObjectFunctionInRecentShieldDamage
---@field nRandomConstant EngineTagObjectFunctionInRandomConstant
---@field nUmbrellaShieldVitality EngineTagObjectFunctionInUmbrellaShieldVitality
---@field nShieldStun EngineTagObjectFunctionInShieldStun
---@field nRecentUmbrellaShieldVitality EngineTagObjectFunctionInRecentUmbrellaShieldVitality
---@field nUmbrellaShieldStun EngineTagObjectFunctionInUmbrellaShieldStun
---@field nRegion EngineTagObjectFunctionInRegion
---@field nRegion1 EngineTagObjectFunctionInRegion1
---@field nRegion2 EngineTagObjectFunctionInRegion2
---@field nRegion3 EngineTagObjectFunctionInRegion3
---@field nRegion4 EngineTagObjectFunctionInRegion4
---@field nRegion5 EngineTagObjectFunctionInRegion5
---@field nRegion6 EngineTagObjectFunctionInRegion6
---@field nRegion7 EngineTagObjectFunctionInRegion7
---@field nAlive EngineTagObjectFunctionInAlive
---@field nCompass EngineTagObjectFunctionInCompass
Engine.tag.objectFunctionIn = {} 

---@class EngineTagObjectTypeEnum : Enum 

---@class EngineTagObjectTypeBiped : EngineTagObjectTypeEnum 
---@class EngineTagObjectTypeVehicle : EngineTagObjectTypeEnum 
---@class EngineTagObjectTypeWeapon : EngineTagObjectTypeEnum 
---@class EngineTagObjectTypeEquipment : EngineTagObjectTypeEnum 
---@class EngineTagObjectTypeGarbage : EngineTagObjectTypeEnum 
---@class EngineTagObjectTypeProjectile : EngineTagObjectTypeEnum 
---@class EngineTagObjectTypeScenery : EngineTagObjectTypeEnum 
---@class EngineTagObjectTypeDeviceMachine : EngineTagObjectTypeEnum 
---@class EngineTagObjectTypeDeviceControl : EngineTagObjectTypeEnum 
---@class EngineTagObjectTypeDeviceLightFixture : EngineTagObjectTypeEnum 
---@class EngineTagObjectTypePlaceholder : EngineTagObjectTypeEnum 
---@class EngineTagObjectTypeSoundScenery : EngineTagObjectTypeEnum 

---@alias EngineTagObjectType 
---| EngineTagObjectTypeBiped
---| EngineTagObjectTypeVehicle
---| EngineTagObjectTypeWeapon
---| EngineTagObjectTypeEquipment
---| EngineTagObjectTypeGarbage
---| EngineTagObjectTypeProjectile
---| EngineTagObjectTypeScenery
---| EngineTagObjectTypeDeviceMachine
---| EngineTagObjectTypeDeviceControl
---| EngineTagObjectTypeDeviceLightFixture
---| EngineTagObjectTypePlaceholder
---| EngineTagObjectTypeSoundScenery

---@class EngineTagObjectTypeTable 
---@field biped EngineTagObjectTypeBiped
---@field vehicle EngineTagObjectTypeVehicle
---@field weapon EngineTagObjectTypeWeapon
---@field equipment EngineTagObjectTypeEquipment
---@field garbage EngineTagObjectTypeGarbage
---@field projectile EngineTagObjectTypeProjectile
---@field scenery EngineTagObjectTypeScenery
---@field deviceMachine EngineTagObjectTypeDeviceMachine
---@field deviceControl EngineTagObjectTypeDeviceControl
---@field deviceLightFixture EngineTagObjectTypeDeviceLightFixture
---@field placeholder EngineTagObjectTypePlaceholder
---@field soundScenery EngineTagObjectTypeSoundScenery
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
---@field permutations TagBlock<MetaEngineTagDataObjectChangeColorsPermutation> 

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
---@field attachments TagBlock<MetaEngineTagDataObjectAttachment> 
---@field widgets TagBlock<MetaEngineTagDataObjectWidget> 
---@field functions TagBlock<MetaEngineTagDataObjectFunction> 
---@field changeColors TagBlock<MetaEngineTagDataObjectChangeColors> 
---@field predictedResources TagBlock<MetaEngineTagDataPredictedResource> 

---@class MetaEngineTagDataBasicObject: MetaEngineTagDataObject  
---@field moreFlags MetaEngineTagDataBaseObjectFlags 


