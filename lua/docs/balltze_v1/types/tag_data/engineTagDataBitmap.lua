---@class EngineTagBitmapDataTypeEnum : Enum 

---@class EngineTagBitmapDataType2dTexture : EngineTagBitmapDataTypeEnum 
---@class EngineTagBitmapDataType3dTexture : EngineTagBitmapDataTypeEnum 
---@class EngineTagBitmapDataTypeCubeMap : EngineTagBitmapDataTypeEnum 
---@class EngineTagBitmapDataTypeWhite : EngineTagBitmapDataTypeEnum 

---@alias EngineTagBitmapDataType 
---| EngineTagBitmapDataType2dTexture
---| EngineTagBitmapDataType3dTexture
---| EngineTagBitmapDataTypeCubeMap
---| EngineTagBitmapDataTypeWhite

---@class EngineTagBitmapDataTypeTable 
---@field e2dTexture EngineTagBitmapDataType2dTexture
---@field e3dTexture EngineTagBitmapDataType3dTexture
---@field eCubeMap EngineTagBitmapDataTypeCubeMap
---@field eWhite EngineTagBitmapDataTypeWhite
Engine.tag.bitmapDataType = {} 

---@class EngineTagBitmapDataFormatEnum : Enum 

---@class EngineTagBitmapDataFormatA8 : EngineTagBitmapDataFormatEnum 
---@class EngineTagBitmapDataFormatY8 : EngineTagBitmapDataFormatEnum 
---@class EngineTagBitmapDataFormatAy8 : EngineTagBitmapDataFormatEnum 
---@class EngineTagBitmapDataFormatA8y8 : EngineTagBitmapDataFormatEnum 
---@class EngineTagBitmapDataFormatUnused1 : EngineTagBitmapDataFormatEnum 
---@class EngineTagBitmapDataFormatUnused2 : EngineTagBitmapDataFormatEnum 
---@class EngineTagBitmapDataFormatR5g6b5 : EngineTagBitmapDataFormatEnum 
---@class EngineTagBitmapDataFormatUnused3 : EngineTagBitmapDataFormatEnum 
---@class EngineTagBitmapDataFormatA1r5g5b5 : EngineTagBitmapDataFormatEnum 
---@class EngineTagBitmapDataFormatA4r4g4b4 : EngineTagBitmapDataFormatEnum 
---@class EngineTagBitmapDataFormatX8r8g8b8 : EngineTagBitmapDataFormatEnum 
---@class EngineTagBitmapDataFormatA8r8g8b8 : EngineTagBitmapDataFormatEnum 
---@class EngineTagBitmapDataFormatUnused4 : EngineTagBitmapDataFormatEnum 
---@class EngineTagBitmapDataFormatUnused5 : EngineTagBitmapDataFormatEnum 
---@class EngineTagBitmapDataFormatDxt1 : EngineTagBitmapDataFormatEnum 
---@class EngineTagBitmapDataFormatDxt3 : EngineTagBitmapDataFormatEnum 
---@class EngineTagBitmapDataFormatDxt5 : EngineTagBitmapDataFormatEnum 
---@class EngineTagBitmapDataFormatP8Bump : EngineTagBitmapDataFormatEnum 

---@alias EngineTagBitmapDataFormat 
---| EngineTagBitmapDataFormatA8
---| EngineTagBitmapDataFormatY8
---| EngineTagBitmapDataFormatAy8
---| EngineTagBitmapDataFormatA8y8
---| EngineTagBitmapDataFormatUnused1
---| EngineTagBitmapDataFormatUnused2
---| EngineTagBitmapDataFormatR5g6b5
---| EngineTagBitmapDataFormatUnused3
---| EngineTagBitmapDataFormatA1r5g5b5
---| EngineTagBitmapDataFormatA4r4g4b4
---| EngineTagBitmapDataFormatX8r8g8b8
---| EngineTagBitmapDataFormatA8r8g8b8
---| EngineTagBitmapDataFormatUnused4
---| EngineTagBitmapDataFormatUnused5
---| EngineTagBitmapDataFormatDxt1
---| EngineTagBitmapDataFormatDxt3
---| EngineTagBitmapDataFormatDxt5
---| EngineTagBitmapDataFormatP8Bump

---@class EngineTagBitmapDataFormatTable 
---@field tA8 EngineTagBitmapDataFormatA8
---@field tY8 EngineTagBitmapDataFormatY8
---@field tAy8 EngineTagBitmapDataFormatAy8
---@field tA8y8 EngineTagBitmapDataFormatA8y8
---@field tUnused1 EngineTagBitmapDataFormatUnused1
---@field tUnused2 EngineTagBitmapDataFormatUnused2
---@field tR5g6b5 EngineTagBitmapDataFormatR5g6b5
---@field tUnused3 EngineTagBitmapDataFormatUnused3
---@field tA1r5g5b5 EngineTagBitmapDataFormatA1r5g5b5
---@field tA4r4g4b4 EngineTagBitmapDataFormatA4r4g4b4
---@field tX8r8g8b8 EngineTagBitmapDataFormatX8r8g8b8
---@field tA8r8g8b8 EngineTagBitmapDataFormatA8r8g8b8
---@field tUnused4 EngineTagBitmapDataFormatUnused4
---@field tUnused5 EngineTagBitmapDataFormatUnused5
---@field tDxt1 EngineTagBitmapDataFormatDxt1
---@field tDxt3 EngineTagBitmapDataFormatDxt3
---@field tDxt5 EngineTagBitmapDataFormatDxt5
---@field tP8Bump EngineTagBitmapDataFormatP8Bump
Engine.tag.bitmapDataFormat = {} 

---@class EngineTagBitmapTypeEnum : Enum 

---@class EngineTagBitmapType2dTextures : EngineTagBitmapTypeEnum 
---@class EngineTagBitmapType3dTextures : EngineTagBitmapTypeEnum 
---@class EngineTagBitmapTypeCubeMaps : EngineTagBitmapTypeEnum 
---@class EngineTagBitmapTypeSprites : EngineTagBitmapTypeEnum 
---@class EngineTagBitmapTypeInterfaceBitmaps : EngineTagBitmapTypeEnum 

---@alias EngineTagBitmapType 
---| EngineTagBitmapType2dTextures
---| EngineTagBitmapType3dTextures
---| EngineTagBitmapTypeCubeMaps
---| EngineTagBitmapTypeSprites
---| EngineTagBitmapTypeInterfaceBitmaps

---@class EngineTagBitmapTypeTable 
---@field 2dTextures EngineTagBitmapType2dTextures
---@field 3dTextures EngineTagBitmapType3dTextures
---@field cubeMaps EngineTagBitmapTypeCubeMaps
---@field sprites EngineTagBitmapTypeSprites
---@field interfaceBitmaps EngineTagBitmapTypeInterfaceBitmaps
Engine.tag.bitmapType = {} 

---@class EngineTagBitmapFormatEnum : Enum 

---@class EngineTagBitmapFormatDxt1 : EngineTagBitmapFormatEnum 
---@class EngineTagBitmapFormatDxt3 : EngineTagBitmapFormatEnum 
---@class EngineTagBitmapFormatDxt5 : EngineTagBitmapFormatEnum 
---@class EngineTagBitmapFormat16Bit : EngineTagBitmapFormatEnum 
---@class EngineTagBitmapFormat32Bit : EngineTagBitmapFormatEnum 
---@class EngineTagBitmapFormatMonochrome : EngineTagBitmapFormatEnum 

---@alias EngineTagBitmapFormat 
---| EngineTagBitmapFormatDxt1
---| EngineTagBitmapFormatDxt3
---| EngineTagBitmapFormatDxt5
---| EngineTagBitmapFormat16Bit
---| EngineTagBitmapFormat32Bit
---| EngineTagBitmapFormatMonochrome

---@class EngineTagBitmapFormatTable 
---@field dxt1 EngineTagBitmapFormatDxt1
---@field dxt3 EngineTagBitmapFormatDxt3
---@field dxt5 EngineTagBitmapFormatDxt5
---@field 16Bit EngineTagBitmapFormat16Bit
---@field 32Bit EngineTagBitmapFormat32Bit
---@field monochrome EngineTagBitmapFormatMonochrome
Engine.tag.bitmapFormat = {} 

---@class EngineTagBitmapUsageEnum : Enum 

---@class EngineTagBitmapUsageAlphaBlend : EngineTagBitmapUsageEnum 
---@class EngineTagBitmapUsageDefault : EngineTagBitmapUsageEnum 
---@class EngineTagBitmapUsageHeightMap : EngineTagBitmapUsageEnum 
---@class EngineTagBitmapUsageDetailMap : EngineTagBitmapUsageEnum 
---@class EngineTagBitmapUsageLightMap : EngineTagBitmapUsageEnum 
---@class EngineTagBitmapUsageVectorMap : EngineTagBitmapUsageEnum 

---@alias EngineTagBitmapUsage 
---| EngineTagBitmapUsageAlphaBlend
---| EngineTagBitmapUsageDefault
---| EngineTagBitmapUsageHeightMap
---| EngineTagBitmapUsageDetailMap
---| EngineTagBitmapUsageLightMap
---| EngineTagBitmapUsageVectorMap

---@class EngineTagBitmapUsageTable 
---@field alphaBlend EngineTagBitmapUsageAlphaBlend
---@field default EngineTagBitmapUsageDefault
---@field heightMap EngineTagBitmapUsageHeightMap
---@field detailMap EngineTagBitmapUsageDetailMap
---@field lightMap EngineTagBitmapUsageLightMap
---@field vectorMap EngineTagBitmapUsageVectorMap
Engine.tag.bitmapUsage = {} 

---@class EngineTagBitmapSpriteBudgetSizeEnum : Enum 

---@class EngineTagBitmapSpriteBudgetSize32x32 : EngineTagBitmapSpriteBudgetSizeEnum 
---@class EngineTagBitmapSpriteBudgetSize64x64 : EngineTagBitmapSpriteBudgetSizeEnum 
---@class EngineTagBitmapSpriteBudgetSize128x128 : EngineTagBitmapSpriteBudgetSizeEnum 
---@class EngineTagBitmapSpriteBudgetSize256x256 : EngineTagBitmapSpriteBudgetSizeEnum 
---@class EngineTagBitmapSpriteBudgetSize512x512 : EngineTagBitmapSpriteBudgetSizeEnum 
---@class EngineTagBitmapSpriteBudgetSize1024x1024 : EngineTagBitmapSpriteBudgetSizeEnum 

---@alias EngineTagBitmapSpriteBudgetSize 
---| EngineTagBitmapSpriteBudgetSize32x32
---| EngineTagBitmapSpriteBudgetSize64x64
---| EngineTagBitmapSpriteBudgetSize128x128
---| EngineTagBitmapSpriteBudgetSize256x256
---| EngineTagBitmapSpriteBudgetSize512x512
---| EngineTagBitmapSpriteBudgetSize1024x1024

---@class EngineTagBitmapSpriteBudgetSizeTable 
---@field ze32x32 EngineTagBitmapSpriteBudgetSize32x32
---@field ze64x64 EngineTagBitmapSpriteBudgetSize64x64
---@field ze128x128 EngineTagBitmapSpriteBudgetSize128x128
---@field ze256x256 EngineTagBitmapSpriteBudgetSize256x256
---@field ze512x512 EngineTagBitmapSpriteBudgetSize512x512
---@field ze1024x1024 EngineTagBitmapSpriteBudgetSize1024x1024
Engine.tag.bitmapSpriteBudgetSize = {} 

---@class EngineTagBitmapSpriteUsageEnum : Enum 

---@class EngineTagBitmapSpriteUsageBlendAddSubtractMax : EngineTagBitmapSpriteUsageEnum 
---@class EngineTagBitmapSpriteUsageMultiplyMin : EngineTagBitmapSpriteUsageEnum 
---@class EngineTagBitmapSpriteUsageDoubleMultiply : EngineTagBitmapSpriteUsageEnum 

---@alias EngineTagBitmapSpriteUsage 
---| EngineTagBitmapSpriteUsageBlendAddSubtractMax
---| EngineTagBitmapSpriteUsageMultiplyMin
---| EngineTagBitmapSpriteUsageDoubleMultiply

---@class EngineTagBitmapSpriteUsageTable 
---@field eBlendAddSubtractMax EngineTagBitmapSpriteUsageBlendAddSubtractMax
---@field eMultiplyMin EngineTagBitmapSpriteUsageMultiplyMin
---@field eDoubleMultiply EngineTagBitmapSpriteUsageDoubleMultiply
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
---@field sprites TagBlock<MetaEngineTagDataBitmapGroupSprite> 

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
---@field bitmapGroupSequence TagBlock<MetaEngineTagDataBitmapGroupSequence> 
---@field bitmapData TagBlock<MetaEngineTagDataBitmapData> 


