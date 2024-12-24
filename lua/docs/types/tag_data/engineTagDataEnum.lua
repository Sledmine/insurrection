---@class EngineTagFramebufferBlendFunctionEnum : Enum 

---@class EngineTagFramebufferBlendFunctionAlphaBlend : EngineTagFramebufferBlendFunctionEnum 
---@class EngineTagFramebufferBlendFunctionMultiply : EngineTagFramebufferBlendFunctionEnum 
---@class EngineTagFramebufferBlendFunctionDoubleMultiply : EngineTagFramebufferBlendFunctionEnum 
---@class EngineTagFramebufferBlendFunctionAdd : EngineTagFramebufferBlendFunctionEnum 
---@class EngineTagFramebufferBlendFunctionSubtract : EngineTagFramebufferBlendFunctionEnum 
---@class EngineTagFramebufferBlendFunctionComponentMin : EngineTagFramebufferBlendFunctionEnum 
---@class EngineTagFramebufferBlendFunctionComponentMax : EngineTagFramebufferBlendFunctionEnum 
---@class EngineTagFramebufferBlendFunctionAlphaMultiplyAdd : EngineTagFramebufferBlendFunctionEnum 

---@alias EngineTagFramebufferBlendFunction 
---| EngineTagFramebufferBlendFunctionAlphaBlend
---| EngineTagFramebufferBlendFunctionMultiply
---| EngineTagFramebufferBlendFunctionDoubleMultiply
---| EngineTagFramebufferBlendFunctionAdd
---| EngineTagFramebufferBlendFunctionSubtract
---| EngineTagFramebufferBlendFunctionComponentMin
---| EngineTagFramebufferBlendFunctionComponentMax
---| EngineTagFramebufferBlendFunctionAlphaMultiplyAdd

---@class EngineTagFramebufferBlendFunctionTable 
---@field nAlphaBlend EngineTagFramebufferBlendFunctionAlphaBlend
---@field nMultiply EngineTagFramebufferBlendFunctionMultiply
---@field nDoubleMultiply EngineTagFramebufferBlendFunctionDoubleMultiply
---@field nAdd EngineTagFramebufferBlendFunctionAdd
---@field nSubtract EngineTagFramebufferBlendFunctionSubtract
---@field nComponentMin EngineTagFramebufferBlendFunctionComponentMin
---@field nComponentMax EngineTagFramebufferBlendFunctionComponentMax
---@field nAlphaMultiplyAdd EngineTagFramebufferBlendFunctionAlphaMultiplyAdd
Engine.tag.framebufferBlendFunction = {} 

---@class EngineTagFramebufferFadeModeEnum : Enum 

---@class EngineTagFramebufferFadeModeNone : EngineTagFramebufferFadeModeEnum 
---@class EngineTagFramebufferFadeModeFadeWhenPerpendicular : EngineTagFramebufferFadeModeEnum 
---@class EngineTagFramebufferFadeModeFadeWhenParallel : EngineTagFramebufferFadeModeEnum 

---@alias EngineTagFramebufferFadeMode 
---| EngineTagFramebufferFadeModeNone
---| EngineTagFramebufferFadeModeFadeWhenPerpendicular
---| EngineTagFramebufferFadeModeFadeWhenParallel

---@class EngineTagFramebufferFadeModeTable 
---@field eNone EngineTagFramebufferFadeModeNone
---@field eFadeWhenPerpendicular EngineTagFramebufferFadeModeFadeWhenPerpendicular
---@field eFadeWhenParallel EngineTagFramebufferFadeModeFadeWhenParallel
Engine.tag.framebufferFadeMode = {} 

---@class EngineTagFunctionOutEnum : Enum 

---@class EngineTagFunctionOutNone : EngineTagFunctionOutEnum 
---@class EngineTagFunctionOutAOut : EngineTagFunctionOutEnum 
---@class EngineTagFunctionOutBOut : EngineTagFunctionOutEnum 
---@class EngineTagFunctionOutCOut : EngineTagFunctionOutEnum 
---@class EngineTagFunctionOutDOut : EngineTagFunctionOutEnum 

---@alias EngineTagFunctionOut 
---| EngineTagFunctionOutNone
---| EngineTagFunctionOutAOut
---| EngineTagFunctionOutBOut
---| EngineTagFunctionOutCOut
---| EngineTagFunctionOutDOut

---@class EngineTagFunctionOutTable 
---@field none EngineTagFunctionOutNone
---@field aOut EngineTagFunctionOutAOut
---@field bOut EngineTagFunctionOutBOut
---@field cOut EngineTagFunctionOutCOut
---@field dOut EngineTagFunctionOutDOut
Engine.tag.functionOut = {} 

---@class EngineTagWaveFunctionEnum : Enum 

---@class EngineTagWaveFunctionOne : EngineTagWaveFunctionEnum 
---@class EngineTagWaveFunctionZero : EngineTagWaveFunctionEnum 
---@class EngineTagWaveFunctionCosine : EngineTagWaveFunctionEnum 
---@class EngineTagWaveFunctionCosineVariablePeriod : EngineTagWaveFunctionEnum 
---@class EngineTagWaveFunctionDiagonalWave : EngineTagWaveFunctionEnum 
---@class EngineTagWaveFunctionDiagonalWaveVariablePeriod : EngineTagWaveFunctionEnum 
---@class EngineTagWaveFunctionSlide : EngineTagWaveFunctionEnum 
---@class EngineTagWaveFunctionSlideVariablePeriod : EngineTagWaveFunctionEnum 
---@class EngineTagWaveFunctionNoise : EngineTagWaveFunctionEnum 
---@class EngineTagWaveFunctionJitter : EngineTagWaveFunctionEnum 
---@class EngineTagWaveFunctionWander : EngineTagWaveFunctionEnum 
---@class EngineTagWaveFunctionSpark : EngineTagWaveFunctionEnum 

---@alias EngineTagWaveFunction 
---| EngineTagWaveFunctionOne
---| EngineTagWaveFunctionZero
---| EngineTagWaveFunctionCosine
---| EngineTagWaveFunctionCosineVariablePeriod
---| EngineTagWaveFunctionDiagonalWave
---| EngineTagWaveFunctionDiagonalWaveVariablePeriod
---| EngineTagWaveFunctionSlide
---| EngineTagWaveFunctionSlideVariablePeriod
---| EngineTagWaveFunctionNoise
---| EngineTagWaveFunctionJitter
---| EngineTagWaveFunctionWander
---| EngineTagWaveFunctionSpark

---@class EngineTagWaveFunctionTable 
---@field one EngineTagWaveFunctionOne
---@field zero EngineTagWaveFunctionZero
---@field cosine EngineTagWaveFunctionCosine
---@field cosineVariablePeriod EngineTagWaveFunctionCosineVariablePeriod
---@field diagonalWave EngineTagWaveFunctionDiagonalWave
---@field diagonalWaveVariablePeriod EngineTagWaveFunctionDiagonalWaveVariablePeriod
---@field slide EngineTagWaveFunctionSlide
---@field slideVariablePeriod EngineTagWaveFunctionSlideVariablePeriod
---@field noise EngineTagWaveFunctionNoise
---@field jitter EngineTagWaveFunctionJitter
---@field wander EngineTagWaveFunctionWander
---@field spark EngineTagWaveFunctionSpark
Engine.tag.waveFunction = {} 

---@class EngineTagMaterialTypeEnum : Enum 

---@class EngineTagMaterialTypeDirt : EngineTagMaterialTypeEnum 
---@class EngineTagMaterialTypeSand : EngineTagMaterialTypeEnum 
---@class EngineTagMaterialTypeStone : EngineTagMaterialTypeEnum 
---@class EngineTagMaterialTypeSnow : EngineTagMaterialTypeEnum 
---@class EngineTagMaterialTypeWood : EngineTagMaterialTypeEnum 
---@class EngineTagMaterialTypeMetalHollow : EngineTagMaterialTypeEnum 
---@class EngineTagMaterialTypeMetalThin : EngineTagMaterialTypeEnum 
---@class EngineTagMaterialTypeMetalThick : EngineTagMaterialTypeEnum 
---@class EngineTagMaterialTypeRubber : EngineTagMaterialTypeEnum 
---@class EngineTagMaterialTypeGlass : EngineTagMaterialTypeEnum 
---@class EngineTagMaterialTypeForceField : EngineTagMaterialTypeEnum 
---@class EngineTagMaterialTypeGrunt : EngineTagMaterialTypeEnum 
---@class EngineTagMaterialTypeHunterArmor : EngineTagMaterialTypeEnum 
---@class EngineTagMaterialTypeHunterSkin : EngineTagMaterialTypeEnum 
---@class EngineTagMaterialTypeElite : EngineTagMaterialTypeEnum 
---@class EngineTagMaterialTypeJackal : EngineTagMaterialTypeEnum 
---@class EngineTagMaterialTypeJackalEnergyShield : EngineTagMaterialTypeEnum 
---@class EngineTagMaterialTypeEngineerSkin : EngineTagMaterialTypeEnum 
---@class EngineTagMaterialTypeEngineerForceField : EngineTagMaterialTypeEnum 
---@class EngineTagMaterialTypeFloodCombatForm : EngineTagMaterialTypeEnum 
---@class EngineTagMaterialTypeFloodCarrierForm : EngineTagMaterialTypeEnum 
---@class EngineTagMaterialTypeCyborgArmor : EngineTagMaterialTypeEnum 
---@class EngineTagMaterialTypeCyborgEnergyShield : EngineTagMaterialTypeEnum 
---@class EngineTagMaterialTypeHumanArmor : EngineTagMaterialTypeEnum 
---@class EngineTagMaterialTypeHumanSkin : EngineTagMaterialTypeEnum 
---@class EngineTagMaterialTypeSentinel : EngineTagMaterialTypeEnum 
---@class EngineTagMaterialTypeMonitor : EngineTagMaterialTypeEnum 
---@class EngineTagMaterialTypePlastic : EngineTagMaterialTypeEnum 
---@class EngineTagMaterialTypeWater : EngineTagMaterialTypeEnum 
---@class EngineTagMaterialTypeLeaves : EngineTagMaterialTypeEnum 
---@class EngineTagMaterialTypeEliteEnergyShield : EngineTagMaterialTypeEnum 
---@class EngineTagMaterialTypeIce : EngineTagMaterialTypeEnum 
---@class EngineTagMaterialTypeHunterShield : EngineTagMaterialTypeEnum 

---@alias EngineTagMaterialType 
---| EngineTagMaterialTypeDirt
---| EngineTagMaterialTypeSand
---| EngineTagMaterialTypeStone
---| EngineTagMaterialTypeSnow
---| EngineTagMaterialTypeWood
---| EngineTagMaterialTypeMetalHollow
---| EngineTagMaterialTypeMetalThin
---| EngineTagMaterialTypeMetalThick
---| EngineTagMaterialTypeRubber
---| EngineTagMaterialTypeGlass
---| EngineTagMaterialTypeForceField
---| EngineTagMaterialTypeGrunt
---| EngineTagMaterialTypeHunterArmor
---| EngineTagMaterialTypeHunterSkin
---| EngineTagMaterialTypeElite
---| EngineTagMaterialTypeJackal
---| EngineTagMaterialTypeJackalEnergyShield
---| EngineTagMaterialTypeEngineerSkin
---| EngineTagMaterialTypeEngineerForceField
---| EngineTagMaterialTypeFloodCombatForm
---| EngineTagMaterialTypeFloodCarrierForm
---| EngineTagMaterialTypeCyborgArmor
---| EngineTagMaterialTypeCyborgEnergyShield
---| EngineTagMaterialTypeHumanArmor
---| EngineTagMaterialTypeHumanSkin
---| EngineTagMaterialTypeSentinel
---| EngineTagMaterialTypeMonitor
---| EngineTagMaterialTypePlastic
---| EngineTagMaterialTypeWater
---| EngineTagMaterialTypeLeaves
---| EngineTagMaterialTypeEliteEnergyShield
---| EngineTagMaterialTypeIce
---| EngineTagMaterialTypeHunterShield

---@class EngineTagMaterialTypeTable 
---@field dirt EngineTagMaterialTypeDirt
---@field sand EngineTagMaterialTypeSand
---@field stone EngineTagMaterialTypeStone
---@field snow EngineTagMaterialTypeSnow
---@field wood EngineTagMaterialTypeWood
---@field metalHollow EngineTagMaterialTypeMetalHollow
---@field metalThin EngineTagMaterialTypeMetalThin
---@field metalThick EngineTagMaterialTypeMetalThick
---@field rubber EngineTagMaterialTypeRubber
---@field glass EngineTagMaterialTypeGlass
---@field forceField EngineTagMaterialTypeForceField
---@field grunt EngineTagMaterialTypeGrunt
---@field hunterArmor EngineTagMaterialTypeHunterArmor
---@field hunterSkin EngineTagMaterialTypeHunterSkin
---@field elite EngineTagMaterialTypeElite
---@field jackal EngineTagMaterialTypeJackal
---@field jackalEnergyShield EngineTagMaterialTypeJackalEnergyShield
---@field engineerSkin EngineTagMaterialTypeEngineerSkin
---@field engineerForceField EngineTagMaterialTypeEngineerForceField
---@field floodCombatForm EngineTagMaterialTypeFloodCombatForm
---@field floodCarrierForm EngineTagMaterialTypeFloodCarrierForm
---@field cyborgArmor EngineTagMaterialTypeCyborgArmor
---@field cyborgEnergyShield EngineTagMaterialTypeCyborgEnergyShield
---@field humanArmor EngineTagMaterialTypeHumanArmor
---@field humanSkin EngineTagMaterialTypeHumanSkin
---@field sentinel EngineTagMaterialTypeSentinel
---@field monitor EngineTagMaterialTypeMonitor
---@field plastic EngineTagMaterialTypePlastic
---@field water EngineTagMaterialTypeWater
---@field leaves EngineTagMaterialTypeLeaves
---@field eliteEnergyShield EngineTagMaterialTypeEliteEnergyShield
---@field ice EngineTagMaterialTypeIce
---@field hunterShield EngineTagMaterialTypeHunterShield
Engine.tag.materialType = {} 

---@class EngineTagFunctionTypeEnum : Enum 

---@class EngineTagFunctionTypeLinear : EngineTagFunctionTypeEnum 
---@class EngineTagFunctionTypeEarly : EngineTagFunctionTypeEnum 
---@class EngineTagFunctionTypeVeryEarly : EngineTagFunctionTypeEnum 
---@class EngineTagFunctionTypeLate : EngineTagFunctionTypeEnum 
---@class EngineTagFunctionTypeVeryLate : EngineTagFunctionTypeEnum 
---@class EngineTagFunctionTypeCosine : EngineTagFunctionTypeEnum 

---@alias EngineTagFunctionType 
---| EngineTagFunctionTypeLinear
---| EngineTagFunctionTypeEarly
---| EngineTagFunctionTypeVeryEarly
---| EngineTagFunctionTypeLate
---| EngineTagFunctionTypeVeryLate
---| EngineTagFunctionTypeCosine

---@class EngineTagFunctionTypeTable 
---@field linear EngineTagFunctionTypeLinear
---@field early EngineTagFunctionTypeEarly
---@field veryEarly EngineTagFunctionTypeVeryEarly
---@field late EngineTagFunctionTypeLate
---@field veryLate EngineTagFunctionTypeVeryLate
---@field cosine EngineTagFunctionTypeCosine
Engine.tag.functionType = {} 

---@class EngineTagFunctionBoundsModeEnum : Enum 

---@class EngineTagFunctionBoundsModeClip : EngineTagFunctionBoundsModeEnum 
---@class EngineTagFunctionBoundsModeClipAndNormalize : EngineTagFunctionBoundsModeEnum 
---@class EngineTagFunctionBoundsModeScaleToFit : EngineTagFunctionBoundsModeEnum 

---@alias EngineTagFunctionBoundsMode 
---| EngineTagFunctionBoundsModeClip
---| EngineTagFunctionBoundsModeClipAndNormalize
---| EngineTagFunctionBoundsModeScaleToFit

---@class EngineTagFunctionBoundsModeTable 
---@field eClip EngineTagFunctionBoundsModeClip
---@field eClipAndNormalize EngineTagFunctionBoundsModeClipAndNormalize
---@field eScaleToFit EngineTagFunctionBoundsModeScaleToFit
Engine.tag.functionBoundsMode = {} 

---@class EngineTagFunctionScaleByEnum : Enum 

---@class EngineTagFunctionScaleByNone : EngineTagFunctionScaleByEnum 
---@class EngineTagFunctionScaleByAIn : EngineTagFunctionScaleByEnum 
---@class EngineTagFunctionScaleByBIn : EngineTagFunctionScaleByEnum 
---@class EngineTagFunctionScaleByCIn : EngineTagFunctionScaleByEnum 
---@class EngineTagFunctionScaleByDIn : EngineTagFunctionScaleByEnum 
---@class EngineTagFunctionScaleByAOut : EngineTagFunctionScaleByEnum 
---@class EngineTagFunctionScaleByBOut : EngineTagFunctionScaleByEnum 
---@class EngineTagFunctionScaleByCOut : EngineTagFunctionScaleByEnum 
---@class EngineTagFunctionScaleByDOut : EngineTagFunctionScaleByEnum 

---@alias EngineTagFunctionScaleBy 
---| EngineTagFunctionScaleByNone
---| EngineTagFunctionScaleByAIn
---| EngineTagFunctionScaleByBIn
---| EngineTagFunctionScaleByCIn
---| EngineTagFunctionScaleByDIn
---| EngineTagFunctionScaleByAOut
---| EngineTagFunctionScaleByBOut
---| EngineTagFunctionScaleByCOut
---| EngineTagFunctionScaleByDOut

---@class EngineTagFunctionScaleByTable 
---@field yNone EngineTagFunctionScaleByNone
---@field yAIn EngineTagFunctionScaleByAIn
---@field yBIn EngineTagFunctionScaleByBIn
---@field yCIn EngineTagFunctionScaleByCIn
---@field yDIn EngineTagFunctionScaleByDIn
---@field yAOut EngineTagFunctionScaleByAOut
---@field yBOut EngineTagFunctionScaleByBOut
---@field yCOut EngineTagFunctionScaleByCOut
---@field yDOut EngineTagFunctionScaleByDOut
Engine.tag.functionScaleBy = {} 

---@class EngineTagFunctionNameNullableEnum : Enum 

---@class EngineTagFunctionNameNullableNone : EngineTagFunctionNameNullableEnum 
---@class EngineTagFunctionNameNullableA : EngineTagFunctionNameNullableEnum 
---@class EngineTagFunctionNameNullableB : EngineTagFunctionNameNullableEnum 
---@class EngineTagFunctionNameNullableC : EngineTagFunctionNameNullableEnum 
---@class EngineTagFunctionNameNullableD : EngineTagFunctionNameNullableEnum 

---@alias EngineTagFunctionNameNullable 
---| EngineTagFunctionNameNullableNone
---| EngineTagFunctionNameNullableA
---| EngineTagFunctionNameNullableB
---| EngineTagFunctionNameNullableC
---| EngineTagFunctionNameNullableD

---@class EngineTagFunctionNameNullableTable 
---@field eNone EngineTagFunctionNameNullableNone
---@field eA EngineTagFunctionNameNullableA
---@field eB EngineTagFunctionNameNullableB
---@field eC EngineTagFunctionNameNullableC
---@field eD EngineTagFunctionNameNullableD
Engine.tag.functionNameNullable = {} 

---@class EngineTagGrenadeTypeEnum : Enum 

---@class EngineTagGrenadeTypeHumanFragmentation : EngineTagGrenadeTypeEnum 
---@class EngineTagGrenadeTypeCovenantPlasma : EngineTagGrenadeTypeEnum 
---@class EngineTagGrenadeTypeGrenadeType2 : EngineTagGrenadeTypeEnum 
---@class EngineTagGrenadeTypeGrenadeType3 : EngineTagGrenadeTypeEnum 

---@alias EngineTagGrenadeType 
---| EngineTagGrenadeTypeHumanFragmentation
---| EngineTagGrenadeTypeCovenantPlasma
---| EngineTagGrenadeTypeGrenadeType2
---| EngineTagGrenadeTypeGrenadeType3

---@class EngineTagGrenadeTypeTable 
---@field humanFragmentation EngineTagGrenadeTypeHumanFragmentation
---@field covenantPlasma EngineTagGrenadeTypeCovenantPlasma
---@field grenadeType2 EngineTagGrenadeTypeGrenadeType2
---@field grenadeType3 EngineTagGrenadeTypeGrenadeType3
Engine.tag.grenadeType = {} 

---@class EngineTagVertexTypeEnum : Enum 

---@class EngineTagVertexTypeStructureBspUncompressedRenderedVertices : EngineTagVertexTypeEnum 
---@class EngineTagVertexTypeStructureBspCompressedRenderedVertices : EngineTagVertexTypeEnum 
---@class EngineTagVertexTypeStructureBspUncompressedLightmapVertices : EngineTagVertexTypeEnum 
---@class EngineTagVertexTypeStructureBspCompressedLightmapVertices : EngineTagVertexTypeEnum 
---@class EngineTagVertexTypeModelUncompressed : EngineTagVertexTypeEnum 
---@class EngineTagVertexTypeModelCompressed : EngineTagVertexTypeEnum 

---@alias EngineTagVertexType 
---| EngineTagVertexTypeStructureBspUncompressedRenderedVertices
---| EngineTagVertexTypeStructureBspCompressedRenderedVertices
---| EngineTagVertexTypeStructureBspUncompressedLightmapVertices
---| EngineTagVertexTypeStructureBspCompressedLightmapVertices
---| EngineTagVertexTypeModelUncompressed
---| EngineTagVertexTypeModelCompressed

---@class EngineTagVertexTypeTable 
---@field structureBspUncompressedRenderedVertices EngineTagVertexTypeStructureBspUncompressedRenderedVertices
---@field structureBspCompressedRenderedVertices EngineTagVertexTypeStructureBspCompressedRenderedVertices
---@field structureBspUncompressedLightmapVertices EngineTagVertexTypeStructureBspUncompressedLightmapVertices
---@field structureBspCompressedLightmapVertices EngineTagVertexTypeStructureBspCompressedLightmapVertices
---@field modelUncompressed EngineTagVertexTypeModelUncompressed
---@field modelCompressed EngineTagVertexTypeModelCompressed
Engine.tag.vertexType = {} 


