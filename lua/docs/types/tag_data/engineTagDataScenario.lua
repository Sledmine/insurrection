---@class EngineTagScenarioTypeEnum : Enum 

---@class EngineTagScenarioTypeSingleplayer : EngineTagScenarioTypeEnum 
---@class EngineTagScenarioTypeMultiplayer : EngineTagScenarioTypeEnum 
---@class EngineTagScenarioTypeUserInterface : EngineTagScenarioTypeEnum 

---@alias EngineTagScenarioType 
---| EngineTagScenarioTypeSingleplayer
---| EngineTagScenarioTypeMultiplayer
---| EngineTagScenarioTypeUserInterface

---@class EngineTagScenarioTypeTable 
---@field singleplayer EngineTagScenarioTypeSingleplayer
---@field multiplayer EngineTagScenarioTypeMultiplayer
---@field userInterface EngineTagScenarioTypeUserInterface
Engine.tag.scenarioType = {} 

---@class EngineTagScenarioSpawnTypeEnum : Enum 

---@class EngineTagScenarioSpawnTypeNone : EngineTagScenarioSpawnTypeEnum 
---@class EngineTagScenarioSpawnTypeCtf : EngineTagScenarioSpawnTypeEnum 
---@class EngineTagScenarioSpawnTypeSlayer : EngineTagScenarioSpawnTypeEnum 
---@class EngineTagScenarioSpawnTypeOddball : EngineTagScenarioSpawnTypeEnum 
---@class EngineTagScenarioSpawnTypeKingOfTheHill : EngineTagScenarioSpawnTypeEnum 
---@class EngineTagScenarioSpawnTypeRace : EngineTagScenarioSpawnTypeEnum 
---@class EngineTagScenarioSpawnTypeTerminator : EngineTagScenarioSpawnTypeEnum 
---@class EngineTagScenarioSpawnTypeStub : EngineTagScenarioSpawnTypeEnum 
---@class EngineTagScenarioSpawnTypeIgnored1 : EngineTagScenarioSpawnTypeEnum 
---@class EngineTagScenarioSpawnTypeIgnored2 : EngineTagScenarioSpawnTypeEnum 
---@class EngineTagScenarioSpawnTypeIgnored3 : EngineTagScenarioSpawnTypeEnum 
---@class EngineTagScenarioSpawnTypeIgnored4 : EngineTagScenarioSpawnTypeEnum 
---@class EngineTagScenarioSpawnTypeAllGames : EngineTagScenarioSpawnTypeEnum 
---@class EngineTagScenarioSpawnTypeAllExceptCtf : EngineTagScenarioSpawnTypeEnum 
---@class EngineTagScenarioSpawnTypeAllExceptRaceAndCtf : EngineTagScenarioSpawnTypeEnum 

---@alias EngineTagScenarioSpawnType 
---| EngineTagScenarioSpawnTypeNone
---| EngineTagScenarioSpawnTypeCtf
---| EngineTagScenarioSpawnTypeSlayer
---| EngineTagScenarioSpawnTypeOddball
---| EngineTagScenarioSpawnTypeKingOfTheHill
---| EngineTagScenarioSpawnTypeRace
---| EngineTagScenarioSpawnTypeTerminator
---| EngineTagScenarioSpawnTypeStub
---| EngineTagScenarioSpawnTypeIgnored1
---| EngineTagScenarioSpawnTypeIgnored2
---| EngineTagScenarioSpawnTypeIgnored3
---| EngineTagScenarioSpawnTypeIgnored4
---| EngineTagScenarioSpawnTypeAllGames
---| EngineTagScenarioSpawnTypeAllExceptCtf
---| EngineTagScenarioSpawnTypeAllExceptRaceAndCtf

---@class EngineTagScenarioSpawnTypeTable 
---@field eNone EngineTagScenarioSpawnTypeNone
---@field eCtf EngineTagScenarioSpawnTypeCtf
---@field eSlayer EngineTagScenarioSpawnTypeSlayer
---@field eOddball EngineTagScenarioSpawnTypeOddball
---@field eKingOfTheHill EngineTagScenarioSpawnTypeKingOfTheHill
---@field eRace EngineTagScenarioSpawnTypeRace
---@field eTerminator EngineTagScenarioSpawnTypeTerminator
---@field eStub EngineTagScenarioSpawnTypeStub
---@field eIgnored1 EngineTagScenarioSpawnTypeIgnored1
---@field eIgnored2 EngineTagScenarioSpawnTypeIgnored2
---@field eIgnored3 EngineTagScenarioSpawnTypeIgnored3
---@field eIgnored4 EngineTagScenarioSpawnTypeIgnored4
---@field eAllGames EngineTagScenarioSpawnTypeAllGames
---@field eAllExceptCtf EngineTagScenarioSpawnTypeAllExceptCtf
---@field eAllExceptRaceAndCtf EngineTagScenarioSpawnTypeAllExceptRaceAndCtf
Engine.tag.scenarioSpawnType = {} 

---@class EngineTagScenarioNetgameFlagTypeEnum : Enum 

---@class EngineTagScenarioNetgameFlagTypeCtfFlag : EngineTagScenarioNetgameFlagTypeEnum 
---@class EngineTagScenarioNetgameFlagTypeCtfVehicle : EngineTagScenarioNetgameFlagTypeEnum 
---@class EngineTagScenarioNetgameFlagTypeOddballBallSpawn : EngineTagScenarioNetgameFlagTypeEnum 
---@class EngineTagScenarioNetgameFlagTypeRaceTrack : EngineTagScenarioNetgameFlagTypeEnum 
---@class EngineTagScenarioNetgameFlagTypeRaceVehicle : EngineTagScenarioNetgameFlagTypeEnum 
---@class EngineTagScenarioNetgameFlagTypeVegasBank : EngineTagScenarioNetgameFlagTypeEnum 
---@class EngineTagScenarioNetgameFlagTypeTeleportFrom : EngineTagScenarioNetgameFlagTypeEnum 
---@class EngineTagScenarioNetgameFlagTypeTeleportTo : EngineTagScenarioNetgameFlagTypeEnum 
---@class EngineTagScenarioNetgameFlagTypeHillFlag : EngineTagScenarioNetgameFlagTypeEnum 

---@alias EngineTagScenarioNetgameFlagType 
---| EngineTagScenarioNetgameFlagTypeCtfFlag
---| EngineTagScenarioNetgameFlagTypeCtfVehicle
---| EngineTagScenarioNetgameFlagTypeOddballBallSpawn
---| EngineTagScenarioNetgameFlagTypeRaceTrack
---| EngineTagScenarioNetgameFlagTypeRaceVehicle
---| EngineTagScenarioNetgameFlagTypeVegasBank
---| EngineTagScenarioNetgameFlagTypeTeleportFrom
---| EngineTagScenarioNetgameFlagTypeTeleportTo
---| EngineTagScenarioNetgameFlagTypeHillFlag

---@class EngineTagScenarioNetgameFlagTypeTable 
---@field peCtfFlag EngineTagScenarioNetgameFlagTypeCtfFlag
---@field peCtfVehicle EngineTagScenarioNetgameFlagTypeCtfVehicle
---@field peOddballBallSpawn EngineTagScenarioNetgameFlagTypeOddballBallSpawn
---@field peRaceTrack EngineTagScenarioNetgameFlagTypeRaceTrack
---@field peRaceVehicle EngineTagScenarioNetgameFlagTypeRaceVehicle
---@field peVegasBank EngineTagScenarioNetgameFlagTypeVegasBank
---@field peTeleportFrom EngineTagScenarioNetgameFlagTypeTeleportFrom
---@field peTeleportTo EngineTagScenarioNetgameFlagTypeTeleportTo
---@field peHillFlag EngineTagScenarioNetgameFlagTypeHillFlag
Engine.tag.scenarioNetgameFlagType = {} 

---@class EngineTagScenarioReturnStateEnum : Enum 

---@class EngineTagScenarioReturnStateNone : EngineTagScenarioReturnStateEnum 
---@class EngineTagScenarioReturnStateSleeping : EngineTagScenarioReturnStateEnum 
---@class EngineTagScenarioReturnStateAlert : EngineTagScenarioReturnStateEnum 
---@class EngineTagScenarioReturnStateMovingRepeatSamePosition : EngineTagScenarioReturnStateEnum 
---@class EngineTagScenarioReturnStateMovingLoop : EngineTagScenarioReturnStateEnum 
---@class EngineTagScenarioReturnStateMovingLoopBackAndForth : EngineTagScenarioReturnStateEnum 
---@class EngineTagScenarioReturnStateMovingLoopRandomly : EngineTagScenarioReturnStateEnum 
---@class EngineTagScenarioReturnStateMovingRandomly : EngineTagScenarioReturnStateEnum 
---@class EngineTagScenarioReturnStateGuarding : EngineTagScenarioReturnStateEnum 
---@class EngineTagScenarioReturnStateGuardingAtGuardPosition : EngineTagScenarioReturnStateEnum 
---@class EngineTagScenarioReturnStateSearching : EngineTagScenarioReturnStateEnum 
---@class EngineTagScenarioReturnStateFleeing : EngineTagScenarioReturnStateEnum 

---@alias EngineTagScenarioReturnState 
---| EngineTagScenarioReturnStateNone
---| EngineTagScenarioReturnStateSleeping
---| EngineTagScenarioReturnStateAlert
---| EngineTagScenarioReturnStateMovingRepeatSamePosition
---| EngineTagScenarioReturnStateMovingLoop
---| EngineTagScenarioReturnStateMovingLoopBackAndForth
---| EngineTagScenarioReturnStateMovingLoopRandomly
---| EngineTagScenarioReturnStateMovingRandomly
---| EngineTagScenarioReturnStateGuarding
---| EngineTagScenarioReturnStateGuardingAtGuardPosition
---| EngineTagScenarioReturnStateSearching
---| EngineTagScenarioReturnStateFleeing

---@class EngineTagScenarioReturnStateTable 
---@field eNone EngineTagScenarioReturnStateNone
---@field eSleeping EngineTagScenarioReturnStateSleeping
---@field eAlert EngineTagScenarioReturnStateAlert
---@field eMovingRepeatSamePosition EngineTagScenarioReturnStateMovingRepeatSamePosition
---@field eMovingLoop EngineTagScenarioReturnStateMovingLoop
---@field eMovingLoopBackAndForth EngineTagScenarioReturnStateMovingLoopBackAndForth
---@field eMovingLoopRandomly EngineTagScenarioReturnStateMovingLoopRandomly
---@field eMovingRandomly EngineTagScenarioReturnStateMovingRandomly
---@field eGuarding EngineTagScenarioReturnStateGuarding
---@field eGuardingAtGuardPosition EngineTagScenarioReturnStateGuardingAtGuardPosition
---@field eSearching EngineTagScenarioReturnStateSearching
---@field eFleeing EngineTagScenarioReturnStateFleeing
Engine.tag.scenarioReturnState = {} 

---@class EngineTagScenarioUniqueLeaderTypeEnum : Enum 

---@class EngineTagScenarioUniqueLeaderTypeNormal : EngineTagScenarioUniqueLeaderTypeEnum 
---@class EngineTagScenarioUniqueLeaderTypeNone : EngineTagScenarioUniqueLeaderTypeEnum 
---@class EngineTagScenarioUniqueLeaderTypeRandom : EngineTagScenarioUniqueLeaderTypeEnum 
---@class EngineTagScenarioUniqueLeaderTypeSgtJohnson : EngineTagScenarioUniqueLeaderTypeEnum 
---@class EngineTagScenarioUniqueLeaderTypeSgtLehto : EngineTagScenarioUniqueLeaderTypeEnum 

---@alias EngineTagScenarioUniqueLeaderType 
---| EngineTagScenarioUniqueLeaderTypeNormal
---| EngineTagScenarioUniqueLeaderTypeNone
---| EngineTagScenarioUniqueLeaderTypeRandom
---| EngineTagScenarioUniqueLeaderTypeSgtJohnson
---| EngineTagScenarioUniqueLeaderTypeSgtLehto

---@class EngineTagScenarioUniqueLeaderTypeTable 
---@field peNormal EngineTagScenarioUniqueLeaderTypeNormal
---@field peNone EngineTagScenarioUniqueLeaderTypeNone
---@field peRandom EngineTagScenarioUniqueLeaderTypeRandom
---@field peSgtJohnson EngineTagScenarioUniqueLeaderTypeSgtJohnson
---@field peSgtLehto EngineTagScenarioUniqueLeaderTypeSgtLehto
Engine.tag.scenarioUniqueLeaderType = {} 

---@class EngineTagScenarioMajorUpgradeEnum : Enum 

---@class EngineTagScenarioMajorUpgradeNormal : EngineTagScenarioMajorUpgradeEnum 
---@class EngineTagScenarioMajorUpgradeFew : EngineTagScenarioMajorUpgradeEnum 
---@class EngineTagScenarioMajorUpgradeMany : EngineTagScenarioMajorUpgradeEnum 
---@class EngineTagScenarioMajorUpgradeNone : EngineTagScenarioMajorUpgradeEnum 
---@class EngineTagScenarioMajorUpgradeAll : EngineTagScenarioMajorUpgradeEnum 

---@alias EngineTagScenarioMajorUpgrade 
---| EngineTagScenarioMajorUpgradeNormal
---| EngineTagScenarioMajorUpgradeFew
---| EngineTagScenarioMajorUpgradeMany
---| EngineTagScenarioMajorUpgradeNone
---| EngineTagScenarioMajorUpgradeAll

---@class EngineTagScenarioMajorUpgradeTable 
---@field eNormal EngineTagScenarioMajorUpgradeNormal
---@field eFew EngineTagScenarioMajorUpgradeFew
---@field eMany EngineTagScenarioMajorUpgradeMany
---@field eNone EngineTagScenarioMajorUpgradeNone
---@field eAll EngineTagScenarioMajorUpgradeAll
Engine.tag.scenarioMajorUpgrade = {} 

---@class EngineTagScenarioChangeAttackingDefendingStateWhenEnum : Enum 

---@class EngineTagScenarioChangeAttackingDefendingStateWhenNever : EngineTagScenarioChangeAttackingDefendingStateWhenEnum 
---@class EngineTagScenarioChangeAttackingDefendingStateWhen75Strength : EngineTagScenarioChangeAttackingDefendingStateWhenEnum 
---@class EngineTagScenarioChangeAttackingDefendingStateWhen50Strength : EngineTagScenarioChangeAttackingDefendingStateWhenEnum 
---@class EngineTagScenarioChangeAttackingDefendingStateWhen25Strength : EngineTagScenarioChangeAttackingDefendingStateWhenEnum 
---@class EngineTagScenarioChangeAttackingDefendingStateWhenAnybodyDead : EngineTagScenarioChangeAttackingDefendingStateWhenEnum 
---@class EngineTagScenarioChangeAttackingDefendingStateWhen25Dead : EngineTagScenarioChangeAttackingDefendingStateWhenEnum 
---@class EngineTagScenarioChangeAttackingDefendingStateWhen50Dead : EngineTagScenarioChangeAttackingDefendingStateWhenEnum 
---@class EngineTagScenarioChangeAttackingDefendingStateWhen75Dead : EngineTagScenarioChangeAttackingDefendingStateWhenEnum 
---@class EngineTagScenarioChangeAttackingDefendingStateWhenAllButOneDead : EngineTagScenarioChangeAttackingDefendingStateWhenEnum 
---@class EngineTagScenarioChangeAttackingDefendingStateWhenAllDead : EngineTagScenarioChangeAttackingDefendingStateWhenEnum 

---@alias EngineTagScenarioChangeAttackingDefendingStateWhen 
---| EngineTagScenarioChangeAttackingDefendingStateWhenNever
---| EngineTagScenarioChangeAttackingDefendingStateWhen75Strength
---| EngineTagScenarioChangeAttackingDefendingStateWhen50Strength
---| EngineTagScenarioChangeAttackingDefendingStateWhen25Strength
---| EngineTagScenarioChangeAttackingDefendingStateWhenAnybodyDead
---| EngineTagScenarioChangeAttackingDefendingStateWhen25Dead
---| EngineTagScenarioChangeAttackingDefendingStateWhen50Dead
---| EngineTagScenarioChangeAttackingDefendingStateWhen75Dead
---| EngineTagScenarioChangeAttackingDefendingStateWhenAllButOneDead
---| EngineTagScenarioChangeAttackingDefendingStateWhenAllDead

---@class EngineTagScenarioChangeAttackingDefendingStateWhenTable 
---@field whenNever EngineTagScenarioChangeAttackingDefendingStateWhenNever
---@field when75Strength EngineTagScenarioChangeAttackingDefendingStateWhen75Strength
---@field when50Strength EngineTagScenarioChangeAttackingDefendingStateWhen50Strength
---@field when25Strength EngineTagScenarioChangeAttackingDefendingStateWhen25Strength
---@field whenAnybodyDead EngineTagScenarioChangeAttackingDefendingStateWhenAnybodyDead
---@field when25Dead EngineTagScenarioChangeAttackingDefendingStateWhen25Dead
---@field when50Dead EngineTagScenarioChangeAttackingDefendingStateWhen50Dead
---@field when75Dead EngineTagScenarioChangeAttackingDefendingStateWhen75Dead
---@field whenAllButOneDead EngineTagScenarioChangeAttackingDefendingStateWhenAllButOneDead
---@field whenAllDead EngineTagScenarioChangeAttackingDefendingStateWhenAllDead
Engine.tag.scenarioChangeAttackingDefendingStateWhen = {} 

---@class EngineTagScenarioGroupIndexEnum : Enum 

---@class EngineTagScenarioGroupIndexA : EngineTagScenarioGroupIndexEnum 
---@class EngineTagScenarioGroupIndexB : EngineTagScenarioGroupIndexEnum 
---@class EngineTagScenarioGroupIndexC : EngineTagScenarioGroupIndexEnum 
---@class EngineTagScenarioGroupIndexD : EngineTagScenarioGroupIndexEnum 
---@class EngineTagScenarioGroupIndexE : EngineTagScenarioGroupIndexEnum 
---@class EngineTagScenarioGroupIndexF : EngineTagScenarioGroupIndexEnum 
---@class EngineTagScenarioGroupIndexG : EngineTagScenarioGroupIndexEnum 
---@class EngineTagScenarioGroupIndexH : EngineTagScenarioGroupIndexEnum 
---@class EngineTagScenarioGroupIndexI : EngineTagScenarioGroupIndexEnum 
---@class EngineTagScenarioGroupIndexJ : EngineTagScenarioGroupIndexEnum 
---@class EngineTagScenarioGroupIndexK : EngineTagScenarioGroupIndexEnum 
---@class EngineTagScenarioGroupIndexL : EngineTagScenarioGroupIndexEnum 
---@class EngineTagScenarioGroupIndexM : EngineTagScenarioGroupIndexEnum 
---@class EngineTagScenarioGroupIndexN : EngineTagScenarioGroupIndexEnum 
---@class EngineTagScenarioGroupIndexO : EngineTagScenarioGroupIndexEnum 
---@class EngineTagScenarioGroupIndexP : EngineTagScenarioGroupIndexEnum 
---@class EngineTagScenarioGroupIndexQ : EngineTagScenarioGroupIndexEnum 
---@class EngineTagScenarioGroupIndexR : EngineTagScenarioGroupIndexEnum 
---@class EngineTagScenarioGroupIndexS : EngineTagScenarioGroupIndexEnum 
---@class EngineTagScenarioGroupIndexT : EngineTagScenarioGroupIndexEnum 
---@class EngineTagScenarioGroupIndexU : EngineTagScenarioGroupIndexEnum 
---@class EngineTagScenarioGroupIndexV : EngineTagScenarioGroupIndexEnum 
---@class EngineTagScenarioGroupIndexW : EngineTagScenarioGroupIndexEnum 
---@class EngineTagScenarioGroupIndexX : EngineTagScenarioGroupIndexEnum 
---@class EngineTagScenarioGroupIndexY : EngineTagScenarioGroupIndexEnum 
---@class EngineTagScenarioGroupIndexZ : EngineTagScenarioGroupIndexEnum 

---@alias EngineTagScenarioGroupIndex 
---| EngineTagScenarioGroupIndexA
---| EngineTagScenarioGroupIndexB
---| EngineTagScenarioGroupIndexC
---| EngineTagScenarioGroupIndexD
---| EngineTagScenarioGroupIndexE
---| EngineTagScenarioGroupIndexF
---| EngineTagScenarioGroupIndexG
---| EngineTagScenarioGroupIndexH
---| EngineTagScenarioGroupIndexI
---| EngineTagScenarioGroupIndexJ
---| EngineTagScenarioGroupIndexK
---| EngineTagScenarioGroupIndexL
---| EngineTagScenarioGroupIndexM
---| EngineTagScenarioGroupIndexN
---| EngineTagScenarioGroupIndexO
---| EngineTagScenarioGroupIndexP
---| EngineTagScenarioGroupIndexQ
---| EngineTagScenarioGroupIndexR
---| EngineTagScenarioGroupIndexS
---| EngineTagScenarioGroupIndexT
---| EngineTagScenarioGroupIndexU
---| EngineTagScenarioGroupIndexV
---| EngineTagScenarioGroupIndexW
---| EngineTagScenarioGroupIndexX
---| EngineTagScenarioGroupIndexY
---| EngineTagScenarioGroupIndexZ

---@class EngineTagScenarioGroupIndexTable 
---@field xA EngineTagScenarioGroupIndexA
---@field xB EngineTagScenarioGroupIndexB
---@field xC EngineTagScenarioGroupIndexC
---@field xD EngineTagScenarioGroupIndexD
---@field xE EngineTagScenarioGroupIndexE
---@field xF EngineTagScenarioGroupIndexF
---@field xG EngineTagScenarioGroupIndexG
---@field xH EngineTagScenarioGroupIndexH
---@field xI EngineTagScenarioGroupIndexI
---@field xJ EngineTagScenarioGroupIndexJ
---@field xK EngineTagScenarioGroupIndexK
---@field xL EngineTagScenarioGroupIndexL
---@field xM EngineTagScenarioGroupIndexM
---@field xN EngineTagScenarioGroupIndexN
---@field xO EngineTagScenarioGroupIndexO
---@field xP EngineTagScenarioGroupIndexP
---@field xQ EngineTagScenarioGroupIndexQ
---@field xR EngineTagScenarioGroupIndexR
---@field xS EngineTagScenarioGroupIndexS
---@field xT EngineTagScenarioGroupIndexT
---@field xU EngineTagScenarioGroupIndexU
---@field xV EngineTagScenarioGroupIndexV
---@field xW EngineTagScenarioGroupIndexW
---@field xX EngineTagScenarioGroupIndexX
---@field xY EngineTagScenarioGroupIndexY
---@field xZ EngineTagScenarioGroupIndexZ
Engine.tag.scenarioGroupIndex = {} 

---@class EngineTagScenarioTeamIndexEnum : Enum 

---@class EngineTagScenarioTeamIndexDefaultByUnit : EngineTagScenarioTeamIndexEnum 
---@class EngineTagScenarioTeamIndexPlayer : EngineTagScenarioTeamIndexEnum 
---@class EngineTagScenarioTeamIndexHuman : EngineTagScenarioTeamIndexEnum 
---@class EngineTagScenarioTeamIndexCovenant : EngineTagScenarioTeamIndexEnum 
---@class EngineTagScenarioTeamIndexFlood : EngineTagScenarioTeamIndexEnum 
---@class EngineTagScenarioTeamIndexSentinel : EngineTagScenarioTeamIndexEnum 
---@class EngineTagScenarioTeamIndexUnused6 : EngineTagScenarioTeamIndexEnum 
---@class EngineTagScenarioTeamIndexUnused7 : EngineTagScenarioTeamIndexEnum 
---@class EngineTagScenarioTeamIndexUnused8 : EngineTagScenarioTeamIndexEnum 
---@class EngineTagScenarioTeamIndexUnused9 : EngineTagScenarioTeamIndexEnum 

---@alias EngineTagScenarioTeamIndex 
---| EngineTagScenarioTeamIndexDefaultByUnit
---| EngineTagScenarioTeamIndexPlayer
---| EngineTagScenarioTeamIndexHuman
---| EngineTagScenarioTeamIndexCovenant
---| EngineTagScenarioTeamIndexFlood
---| EngineTagScenarioTeamIndexSentinel
---| EngineTagScenarioTeamIndexUnused6
---| EngineTagScenarioTeamIndexUnused7
---| EngineTagScenarioTeamIndexUnused8
---| EngineTagScenarioTeamIndexUnused9

---@class EngineTagScenarioTeamIndexTable 
---@field xDefaultByUnit EngineTagScenarioTeamIndexDefaultByUnit
---@field xPlayer EngineTagScenarioTeamIndexPlayer
---@field xHuman EngineTagScenarioTeamIndexHuman
---@field xCovenant EngineTagScenarioTeamIndexCovenant
---@field xFlood EngineTagScenarioTeamIndexFlood
---@field xSentinel EngineTagScenarioTeamIndexSentinel
---@field xUnused6 EngineTagScenarioTeamIndexUnused6
---@field xUnused7 EngineTagScenarioTeamIndexUnused7
---@field xUnused8 EngineTagScenarioTeamIndexUnused8
---@field xUnused9 EngineTagScenarioTeamIndexUnused9
Engine.tag.scenarioTeamIndex = {} 

---@class EngineTagScenarioSearchBehaviorEnum : Enum 

---@class EngineTagScenarioSearchBehaviorNormal : EngineTagScenarioSearchBehaviorEnum 
---@class EngineTagScenarioSearchBehaviorNever : EngineTagScenarioSearchBehaviorEnum 
---@class EngineTagScenarioSearchBehaviorTenacious : EngineTagScenarioSearchBehaviorEnum 

---@alias EngineTagScenarioSearchBehavior 
---| EngineTagScenarioSearchBehaviorNormal
---| EngineTagScenarioSearchBehaviorNever
---| EngineTagScenarioSearchBehaviorTenacious

---@class EngineTagScenarioSearchBehaviorTable 
---@field rNormal EngineTagScenarioSearchBehaviorNormal
---@field rNever EngineTagScenarioSearchBehaviorNever
---@field rTenacious EngineTagScenarioSearchBehaviorTenacious
Engine.tag.scenarioSearchBehavior = {} 

---@class EngineTagScenarioAtomTypeEnum : Enum 

---@class EngineTagScenarioAtomTypePause : EngineTagScenarioAtomTypeEnum 
---@class EngineTagScenarioAtomTypeGoTo : EngineTagScenarioAtomTypeEnum 
---@class EngineTagScenarioAtomTypeGoToAndFace : EngineTagScenarioAtomTypeEnum 
---@class EngineTagScenarioAtomTypeMoveInDirection : EngineTagScenarioAtomTypeEnum 
---@class EngineTagScenarioAtomTypeLook : EngineTagScenarioAtomTypeEnum 
---@class EngineTagScenarioAtomTypeAnimationMode : EngineTagScenarioAtomTypeEnum 
---@class EngineTagScenarioAtomTypeCrouch : EngineTagScenarioAtomTypeEnum 
---@class EngineTagScenarioAtomTypeShoot : EngineTagScenarioAtomTypeEnum 
---@class EngineTagScenarioAtomTypeGrenade : EngineTagScenarioAtomTypeEnum 
---@class EngineTagScenarioAtomTypeVehicle : EngineTagScenarioAtomTypeEnum 
---@class EngineTagScenarioAtomTypeRunningJump : EngineTagScenarioAtomTypeEnum 
---@class EngineTagScenarioAtomTypeTargetedJump : EngineTagScenarioAtomTypeEnum 
---@class EngineTagScenarioAtomTypeScript : EngineTagScenarioAtomTypeEnum 
---@class EngineTagScenarioAtomTypeAnimate : EngineTagScenarioAtomTypeEnum 
---@class EngineTagScenarioAtomTypeRecording : EngineTagScenarioAtomTypeEnum 
---@class EngineTagScenarioAtomTypeAction : EngineTagScenarioAtomTypeEnum 
---@class EngineTagScenarioAtomTypeVocalize : EngineTagScenarioAtomTypeEnum 
---@class EngineTagScenarioAtomTypeTargeting : EngineTagScenarioAtomTypeEnum 
---@class EngineTagScenarioAtomTypeInitiative : EngineTagScenarioAtomTypeEnum 
---@class EngineTagScenarioAtomTypeWait : EngineTagScenarioAtomTypeEnum 
---@class EngineTagScenarioAtomTypeLoop : EngineTagScenarioAtomTypeEnum 
---@class EngineTagScenarioAtomTypeDie : EngineTagScenarioAtomTypeEnum 
---@class EngineTagScenarioAtomTypeMoveImmediate : EngineTagScenarioAtomTypeEnum 
---@class EngineTagScenarioAtomTypeLookRandom : EngineTagScenarioAtomTypeEnum 
---@class EngineTagScenarioAtomTypeLookPlayer : EngineTagScenarioAtomTypeEnum 
---@class EngineTagScenarioAtomTypeLookObject : EngineTagScenarioAtomTypeEnum 
---@class EngineTagScenarioAtomTypeSetRadius : EngineTagScenarioAtomTypeEnum 
---@class EngineTagScenarioAtomTypeTeleport : EngineTagScenarioAtomTypeEnum 

---@alias EngineTagScenarioAtomType 
---| EngineTagScenarioAtomTypePause
---| EngineTagScenarioAtomTypeGoTo
---| EngineTagScenarioAtomTypeGoToAndFace
---| EngineTagScenarioAtomTypeMoveInDirection
---| EngineTagScenarioAtomTypeLook
---| EngineTagScenarioAtomTypeAnimationMode
---| EngineTagScenarioAtomTypeCrouch
---| EngineTagScenarioAtomTypeShoot
---| EngineTagScenarioAtomTypeGrenade
---| EngineTagScenarioAtomTypeVehicle
---| EngineTagScenarioAtomTypeRunningJump
---| EngineTagScenarioAtomTypeTargetedJump
---| EngineTagScenarioAtomTypeScript
---| EngineTagScenarioAtomTypeAnimate
---| EngineTagScenarioAtomTypeRecording
---| EngineTagScenarioAtomTypeAction
---| EngineTagScenarioAtomTypeVocalize
---| EngineTagScenarioAtomTypeTargeting
---| EngineTagScenarioAtomTypeInitiative
---| EngineTagScenarioAtomTypeWait
---| EngineTagScenarioAtomTypeLoop
---| EngineTagScenarioAtomTypeDie
---| EngineTagScenarioAtomTypeMoveImmediate
---| EngineTagScenarioAtomTypeLookRandom
---| EngineTagScenarioAtomTypeLookPlayer
---| EngineTagScenarioAtomTypeLookObject
---| EngineTagScenarioAtomTypeSetRadius
---| EngineTagScenarioAtomTypeTeleport

---@class EngineTagScenarioAtomTypeTable 
---@field ePause EngineTagScenarioAtomTypePause
---@field eGoTo EngineTagScenarioAtomTypeGoTo
---@field eGoToAndFace EngineTagScenarioAtomTypeGoToAndFace
---@field eMoveInDirection EngineTagScenarioAtomTypeMoveInDirection
---@field eLook EngineTagScenarioAtomTypeLook
---@field eAnimationMode EngineTagScenarioAtomTypeAnimationMode
---@field eCrouch EngineTagScenarioAtomTypeCrouch
---@field eShoot EngineTagScenarioAtomTypeShoot
---@field eGrenade EngineTagScenarioAtomTypeGrenade
---@field eVehicle EngineTagScenarioAtomTypeVehicle
---@field eRunningJump EngineTagScenarioAtomTypeRunningJump
---@field eTargetedJump EngineTagScenarioAtomTypeTargetedJump
---@field eScript EngineTagScenarioAtomTypeScript
---@field eAnimate EngineTagScenarioAtomTypeAnimate
---@field eRecording EngineTagScenarioAtomTypeRecording
---@field eAction EngineTagScenarioAtomTypeAction
---@field eVocalize EngineTagScenarioAtomTypeVocalize
---@field eTargeting EngineTagScenarioAtomTypeTargeting
---@field eInitiative EngineTagScenarioAtomTypeInitiative
---@field eWait EngineTagScenarioAtomTypeWait
---@field eLoop EngineTagScenarioAtomTypeLoop
---@field eDie EngineTagScenarioAtomTypeDie
---@field eMoveImmediate EngineTagScenarioAtomTypeMoveImmediate
---@field eLookRandom EngineTagScenarioAtomTypeLookRandom
---@field eLookPlayer EngineTagScenarioAtomTypeLookPlayer
---@field eLookObject EngineTagScenarioAtomTypeLookObject
---@field eSetRadius EngineTagScenarioAtomTypeSetRadius
---@field eTeleport EngineTagScenarioAtomTypeTeleport
Engine.tag.scenarioAtomType = {} 

---@class EngineTagScenarioSelectionTypeEnum : Enum 

---@class EngineTagScenarioSelectionTypeFriendlyActor : EngineTagScenarioSelectionTypeEnum 
---@class EngineTagScenarioSelectionTypeDisembodied : EngineTagScenarioSelectionTypeEnum 
---@class EngineTagScenarioSelectionTypeInPlayerSVehicle : EngineTagScenarioSelectionTypeEnum 
---@class EngineTagScenarioSelectionTypeNotInAVehicle : EngineTagScenarioSelectionTypeEnum 
---@class EngineTagScenarioSelectionTypePreferSergeant : EngineTagScenarioSelectionTypeEnum 
---@class EngineTagScenarioSelectionTypeAnyActor : EngineTagScenarioSelectionTypeEnum 
---@class EngineTagScenarioSelectionTypeRadioUnit : EngineTagScenarioSelectionTypeEnum 
---@class EngineTagScenarioSelectionTypeRadioSergeant : EngineTagScenarioSelectionTypeEnum 

---@alias EngineTagScenarioSelectionType 
---| EngineTagScenarioSelectionTypeFriendlyActor
---| EngineTagScenarioSelectionTypeDisembodied
---| EngineTagScenarioSelectionTypeInPlayerSVehicle
---| EngineTagScenarioSelectionTypeNotInAVehicle
---| EngineTagScenarioSelectionTypePreferSergeant
---| EngineTagScenarioSelectionTypeAnyActor
---| EngineTagScenarioSelectionTypeRadioUnit
---| EngineTagScenarioSelectionTypeRadioSergeant

---@class EngineTagScenarioSelectionTypeTable 
---@field eFriendlyActor EngineTagScenarioSelectionTypeFriendlyActor
---@field eDisembodied EngineTagScenarioSelectionTypeDisembodied
---@field eInPlayerSVehicle EngineTagScenarioSelectionTypeInPlayerSVehicle
---@field eNotInAVehicle EngineTagScenarioSelectionTypeNotInAVehicle
---@field ePreferSergeant EngineTagScenarioSelectionTypePreferSergeant
---@field eAnyActor EngineTagScenarioSelectionTypeAnyActor
---@field eRadioUnit EngineTagScenarioSelectionTypeRadioUnit
---@field eRadioSergeant EngineTagScenarioSelectionTypeRadioSergeant
Engine.tag.scenarioSelectionType = {} 

---@class EngineTagScenarioAddresseeEnum : Enum 

---@class EngineTagScenarioAddresseeNone : EngineTagScenarioAddresseeEnum 
---@class EngineTagScenarioAddresseePlayer : EngineTagScenarioAddresseeEnum 
---@class EngineTagScenarioAddresseeParticipant : EngineTagScenarioAddresseeEnum 

---@alias EngineTagScenarioAddressee 
---| EngineTagScenarioAddresseeNone
---| EngineTagScenarioAddresseePlayer
---| EngineTagScenarioAddresseeParticipant

---@class EngineTagScenarioAddresseeTable 
---@field none EngineTagScenarioAddresseeNone
---@field player EngineTagScenarioAddresseePlayer
---@field participant EngineTagScenarioAddresseeParticipant
Engine.tag.scenarioAddressee = {} 

---@class EngineTagScenarioScriptTypeEnum : Enum 

---@class EngineTagScenarioScriptTypeStartup : EngineTagScenarioScriptTypeEnum 
---@class EngineTagScenarioScriptTypeDormant : EngineTagScenarioScriptTypeEnum 
---@class EngineTagScenarioScriptTypeContinuous : EngineTagScenarioScriptTypeEnum 
---@class EngineTagScenarioScriptTypeStatic : EngineTagScenarioScriptTypeEnum 
---@class EngineTagScenarioScriptTypeStub : EngineTagScenarioScriptTypeEnum 

---@alias EngineTagScenarioScriptType 
---| EngineTagScenarioScriptTypeStartup
---| EngineTagScenarioScriptTypeDormant
---| EngineTagScenarioScriptTypeContinuous
---| EngineTagScenarioScriptTypeStatic
---| EngineTagScenarioScriptTypeStub

---@class EngineTagScenarioScriptTypeTable 
---@field eStartup EngineTagScenarioScriptTypeStartup
---@field eDormant EngineTagScenarioScriptTypeDormant
---@field eContinuous EngineTagScenarioScriptTypeContinuous
---@field eStatic EngineTagScenarioScriptTypeStatic
---@field eStub EngineTagScenarioScriptTypeStub
Engine.tag.scenarioScriptType = {} 

---@class EngineTagScenarioScriptValueTypeEnum : Enum 

---@class EngineTagScenarioScriptValueTypeUnparsed : EngineTagScenarioScriptValueTypeEnum 
---@class EngineTagScenarioScriptValueTypeSpecialForm : EngineTagScenarioScriptValueTypeEnum 
---@class EngineTagScenarioScriptValueTypeFunctionName : EngineTagScenarioScriptValueTypeEnum 
---@class EngineTagScenarioScriptValueTypePassthrough : EngineTagScenarioScriptValueTypeEnum 
---@class EngineTagScenarioScriptValueTypeVoid : EngineTagScenarioScriptValueTypeEnum 
---@class EngineTagScenarioScriptValueTypeBoolean : EngineTagScenarioScriptValueTypeEnum 
---@class EngineTagScenarioScriptValueTypeReal : EngineTagScenarioScriptValueTypeEnum 
---@class EngineTagScenarioScriptValueTypeShort : EngineTagScenarioScriptValueTypeEnum 
---@class EngineTagScenarioScriptValueTypeLong : EngineTagScenarioScriptValueTypeEnum 
---@class EngineTagScenarioScriptValueTypeString : EngineTagScenarioScriptValueTypeEnum 
---@class EngineTagScenarioScriptValueTypeScript : EngineTagScenarioScriptValueTypeEnum 
---@class EngineTagScenarioScriptValueTypeTriggerVolume : EngineTagScenarioScriptValueTypeEnum 
---@class EngineTagScenarioScriptValueTypeCutsceneFlag : EngineTagScenarioScriptValueTypeEnum 
---@class EngineTagScenarioScriptValueTypeCutsceneCameraPoint : EngineTagScenarioScriptValueTypeEnum 
---@class EngineTagScenarioScriptValueTypeCutsceneTitle : EngineTagScenarioScriptValueTypeEnum 
---@class EngineTagScenarioScriptValueTypeCutsceneRecording : EngineTagScenarioScriptValueTypeEnum 
---@class EngineTagScenarioScriptValueTypeDeviceGroup : EngineTagScenarioScriptValueTypeEnum 
---@class EngineTagScenarioScriptValueTypeAi : EngineTagScenarioScriptValueTypeEnum 
---@class EngineTagScenarioScriptValueTypeAiCommandList : EngineTagScenarioScriptValueTypeEnum 
---@class EngineTagScenarioScriptValueTypeStartingProfile : EngineTagScenarioScriptValueTypeEnum 
---@class EngineTagScenarioScriptValueTypeConversation : EngineTagScenarioScriptValueTypeEnum 
---@class EngineTagScenarioScriptValueTypeNavpoint : EngineTagScenarioScriptValueTypeEnum 
---@class EngineTagScenarioScriptValueTypeHudMessage : EngineTagScenarioScriptValueTypeEnum 
---@class EngineTagScenarioScriptValueTypeObjectList : EngineTagScenarioScriptValueTypeEnum 
---@class EngineTagScenarioScriptValueTypeSound : EngineTagScenarioScriptValueTypeEnum 
---@class EngineTagScenarioScriptValueTypeEffect : EngineTagScenarioScriptValueTypeEnum 
---@class EngineTagScenarioScriptValueTypeDamage : EngineTagScenarioScriptValueTypeEnum 
---@class EngineTagScenarioScriptValueTypeLoopingSound : EngineTagScenarioScriptValueTypeEnum 
---@class EngineTagScenarioScriptValueTypeAnimationGraph : EngineTagScenarioScriptValueTypeEnum 
---@class EngineTagScenarioScriptValueTypeActorVariant : EngineTagScenarioScriptValueTypeEnum 
---@class EngineTagScenarioScriptValueTypeDamageEffect : EngineTagScenarioScriptValueTypeEnum 
---@class EngineTagScenarioScriptValueTypeObjectDefinition : EngineTagScenarioScriptValueTypeEnum 
---@class EngineTagScenarioScriptValueTypeGameDifficulty : EngineTagScenarioScriptValueTypeEnum 
---@class EngineTagScenarioScriptValueTypeTeam : EngineTagScenarioScriptValueTypeEnum 
---@class EngineTagScenarioScriptValueTypeAiDefaultState : EngineTagScenarioScriptValueTypeEnum 
---@class EngineTagScenarioScriptValueTypeActorType : EngineTagScenarioScriptValueTypeEnum 
---@class EngineTagScenarioScriptValueTypeHudCorner : EngineTagScenarioScriptValueTypeEnum 
---@class EngineTagScenarioScriptValueTypeObject : EngineTagScenarioScriptValueTypeEnum 
---@class EngineTagScenarioScriptValueTypeUnit : EngineTagScenarioScriptValueTypeEnum 
---@class EngineTagScenarioScriptValueTypeVehicle : EngineTagScenarioScriptValueTypeEnum 
---@class EngineTagScenarioScriptValueTypeWeapon : EngineTagScenarioScriptValueTypeEnum 
---@class EngineTagScenarioScriptValueTypeDevice : EngineTagScenarioScriptValueTypeEnum 
---@class EngineTagScenarioScriptValueTypeScenery : EngineTagScenarioScriptValueTypeEnum 
---@class EngineTagScenarioScriptValueTypeObjectName : EngineTagScenarioScriptValueTypeEnum 
---@class EngineTagScenarioScriptValueTypeUnitName : EngineTagScenarioScriptValueTypeEnum 
---@class EngineTagScenarioScriptValueTypeVehicleName : EngineTagScenarioScriptValueTypeEnum 
---@class EngineTagScenarioScriptValueTypeWeaponName : EngineTagScenarioScriptValueTypeEnum 
---@class EngineTagScenarioScriptValueTypeDeviceName : EngineTagScenarioScriptValueTypeEnum 
---@class EngineTagScenarioScriptValueTypeSceneryName : EngineTagScenarioScriptValueTypeEnum 

---@alias EngineTagScenarioScriptValueType 
---| EngineTagScenarioScriptValueTypeUnparsed
---| EngineTagScenarioScriptValueTypeSpecialForm
---| EngineTagScenarioScriptValueTypeFunctionName
---| EngineTagScenarioScriptValueTypePassthrough
---| EngineTagScenarioScriptValueTypeVoid
---| EngineTagScenarioScriptValueTypeBoolean
---| EngineTagScenarioScriptValueTypeReal
---| EngineTagScenarioScriptValueTypeShort
---| EngineTagScenarioScriptValueTypeLong
---| EngineTagScenarioScriptValueTypeString
---| EngineTagScenarioScriptValueTypeScript
---| EngineTagScenarioScriptValueTypeTriggerVolume
---| EngineTagScenarioScriptValueTypeCutsceneFlag
---| EngineTagScenarioScriptValueTypeCutsceneCameraPoint
---| EngineTagScenarioScriptValueTypeCutsceneTitle
---| EngineTagScenarioScriptValueTypeCutsceneRecording
---| EngineTagScenarioScriptValueTypeDeviceGroup
---| EngineTagScenarioScriptValueTypeAi
---| EngineTagScenarioScriptValueTypeAiCommandList
---| EngineTagScenarioScriptValueTypeStartingProfile
---| EngineTagScenarioScriptValueTypeConversation
---| EngineTagScenarioScriptValueTypeNavpoint
---| EngineTagScenarioScriptValueTypeHudMessage
---| EngineTagScenarioScriptValueTypeObjectList
---| EngineTagScenarioScriptValueTypeSound
---| EngineTagScenarioScriptValueTypeEffect
---| EngineTagScenarioScriptValueTypeDamage
---| EngineTagScenarioScriptValueTypeLoopingSound
---| EngineTagScenarioScriptValueTypeAnimationGraph
---| EngineTagScenarioScriptValueTypeActorVariant
---| EngineTagScenarioScriptValueTypeDamageEffect
---| EngineTagScenarioScriptValueTypeObjectDefinition
---| EngineTagScenarioScriptValueTypeGameDifficulty
---| EngineTagScenarioScriptValueTypeTeam
---| EngineTagScenarioScriptValueTypeAiDefaultState
---| EngineTagScenarioScriptValueTypeActorType
---| EngineTagScenarioScriptValueTypeHudCorner
---| EngineTagScenarioScriptValueTypeObject
---| EngineTagScenarioScriptValueTypeUnit
---| EngineTagScenarioScriptValueTypeVehicle
---| EngineTagScenarioScriptValueTypeWeapon
---| EngineTagScenarioScriptValueTypeDevice
---| EngineTagScenarioScriptValueTypeScenery
---| EngineTagScenarioScriptValueTypeObjectName
---| EngineTagScenarioScriptValueTypeUnitName
---| EngineTagScenarioScriptValueTypeVehicleName
---| EngineTagScenarioScriptValueTypeWeaponName
---| EngineTagScenarioScriptValueTypeDeviceName
---| EngineTagScenarioScriptValueTypeSceneryName

---@class EngineTagScenarioScriptValueTypeTable 
---@field peUnparsed EngineTagScenarioScriptValueTypeUnparsed
---@field peSpecialForm EngineTagScenarioScriptValueTypeSpecialForm
---@field peFunctionName EngineTagScenarioScriptValueTypeFunctionName
---@field pePassthrough EngineTagScenarioScriptValueTypePassthrough
---@field peVoid EngineTagScenarioScriptValueTypeVoid
---@field peBoolean EngineTagScenarioScriptValueTypeBoolean
---@field peReal EngineTagScenarioScriptValueTypeReal
---@field peShort EngineTagScenarioScriptValueTypeShort
---@field peLong EngineTagScenarioScriptValueTypeLong
---@field peString EngineTagScenarioScriptValueTypeString
---@field peScript EngineTagScenarioScriptValueTypeScript
---@field peTriggerVolume EngineTagScenarioScriptValueTypeTriggerVolume
---@field peCutsceneFlag EngineTagScenarioScriptValueTypeCutsceneFlag
---@field peCutsceneCameraPoint EngineTagScenarioScriptValueTypeCutsceneCameraPoint
---@field peCutsceneTitle EngineTagScenarioScriptValueTypeCutsceneTitle
---@field peCutsceneRecording EngineTagScenarioScriptValueTypeCutsceneRecording
---@field peDeviceGroup EngineTagScenarioScriptValueTypeDeviceGroup
---@field peAi EngineTagScenarioScriptValueTypeAi
---@field peAiCommandList EngineTagScenarioScriptValueTypeAiCommandList
---@field peStartingProfile EngineTagScenarioScriptValueTypeStartingProfile
---@field peConversation EngineTagScenarioScriptValueTypeConversation
---@field peNavpoint EngineTagScenarioScriptValueTypeNavpoint
---@field peHudMessage EngineTagScenarioScriptValueTypeHudMessage
---@field peObjectList EngineTagScenarioScriptValueTypeObjectList
---@field peSound EngineTagScenarioScriptValueTypeSound
---@field peEffect EngineTagScenarioScriptValueTypeEffect
---@field peDamage EngineTagScenarioScriptValueTypeDamage
---@field peLoopingSound EngineTagScenarioScriptValueTypeLoopingSound
---@field peAnimationGraph EngineTagScenarioScriptValueTypeAnimationGraph
---@field peActorVariant EngineTagScenarioScriptValueTypeActorVariant
---@field peDamageEffect EngineTagScenarioScriptValueTypeDamageEffect
---@field peObjectDefinition EngineTagScenarioScriptValueTypeObjectDefinition
---@field peGameDifficulty EngineTagScenarioScriptValueTypeGameDifficulty
---@field peTeam EngineTagScenarioScriptValueTypeTeam
---@field peAiDefaultState EngineTagScenarioScriptValueTypeAiDefaultState
---@field peActorType EngineTagScenarioScriptValueTypeActorType
---@field peHudCorner EngineTagScenarioScriptValueTypeHudCorner
---@field peObject EngineTagScenarioScriptValueTypeObject
---@field peUnit EngineTagScenarioScriptValueTypeUnit
---@field peVehicle EngineTagScenarioScriptValueTypeVehicle
---@field peWeapon EngineTagScenarioScriptValueTypeWeapon
---@field peDevice EngineTagScenarioScriptValueTypeDevice
---@field peScenery EngineTagScenarioScriptValueTypeScenery
---@field peObjectName EngineTagScenarioScriptValueTypeObjectName
---@field peUnitName EngineTagScenarioScriptValueTypeUnitName
---@field peVehicleName EngineTagScenarioScriptValueTypeVehicleName
---@field peWeaponName EngineTagScenarioScriptValueTypeWeaponName
---@field peDeviceName EngineTagScenarioScriptValueTypeDeviceName
---@field peSceneryName EngineTagScenarioScriptValueTypeSceneryName
Engine.tag.scenarioScriptValueType = {} 

---@class EngineTagScenarioTextStyleEnum : Enum 

---@class EngineTagScenarioTextStylePlain : EngineTagScenarioTextStyleEnum 
---@class EngineTagScenarioTextStyleBold : EngineTagScenarioTextStyleEnum 
---@class EngineTagScenarioTextStyleItalic : EngineTagScenarioTextStyleEnum 
---@class EngineTagScenarioTextStyleCondense : EngineTagScenarioTextStyleEnum 
---@class EngineTagScenarioTextStyleUnderline : EngineTagScenarioTextStyleEnum 

---@alias EngineTagScenarioTextStyle 
---| EngineTagScenarioTextStylePlain
---| EngineTagScenarioTextStyleBold
---| EngineTagScenarioTextStyleItalic
---| EngineTagScenarioTextStyleCondense
---| EngineTagScenarioTextStyleUnderline

---@class EngineTagScenarioTextStyleTable 
---@field ePlain EngineTagScenarioTextStylePlain
---@field eBold EngineTagScenarioTextStyleBold
---@field eItalic EngineTagScenarioTextStyleItalic
---@field eCondense EngineTagScenarioTextStyleCondense
---@field eUnderline EngineTagScenarioTextStyleUnderline
Engine.tag.scenarioTextStyle = {} 

---@class EngineTagScenarioJustificationEnum : Enum 

---@class EngineTagScenarioJustificationLeft : EngineTagScenarioJustificationEnum 
---@class EngineTagScenarioJustificationRight : EngineTagScenarioJustificationEnum 
---@class EngineTagScenarioJustificationCenter : EngineTagScenarioJustificationEnum 

---@alias EngineTagScenarioJustification 
---| EngineTagScenarioJustificationLeft
---| EngineTagScenarioJustificationRight
---| EngineTagScenarioJustificationCenter

---@class EngineTagScenarioJustificationTable 
---@field left EngineTagScenarioJustificationLeft
---@field right EngineTagScenarioJustificationRight
---@field center EngineTagScenarioJustificationCenter
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
---@field 3dFiringPositions boolean 
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
---@field type0 EngineTagDataScenarioSpawnType 
---@field type1 EngineTagDataScenarioSpawnType 
---@field type2 EngineTagDataScenarioSpawnType 
---@field type3 EngineTagDataScenarioSpawnType 

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
---@field type0 EngineTagDataScenarioSpawnType 
---@field type1 EngineTagDataScenarioSpawnType 
---@field type2 EngineTagDataScenarioSpawnType 
---@field type3 EngineTagDataScenarioSpawnType 
---@field teamIndex MetaEngineIndex 
---@field spawnTime integer 
---@field unknownFfffffff integer 
---@field position MetaEnginePoint3D 
---@field facing MetaEngineAngle 
---@field itemCollection MetaEngineTagDependency 

---@class MetaEngineTagDataScenarioStartingEquipment 
---@field flags MetaEngineTagDataScenarioStartingEquipmentFlags 
---@field type0 EngineTagDataScenarioSpawnType 
---@field type1 EngineTagDataScenarioSpawnType 
---@field type2 EngineTagDataScenarioSpawnType 
---@field type3 EngineTagDataScenarioSpawnType 
---@field itemCollection1 MetaEngineTagDependency 
---@field itemCollection2 MetaEngineTagDependency 
---@field itemCollection3 MetaEngineTagDependency 
---@field itemCollection4 MetaEngineTagDependency 
---@field itemCollection5 MetaEngineTagDependency 
---@field itemCollection6 MetaEngineTagDependency 

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
---@field movePositions TagBlock<MetaEngineTagDataScenarioMovePosition> 
---@field startingLocations TagBlock<MetaEngineTagDataScenarioActorStartingLocation> 

---@class MetaEngineTagDataScenarioPlatoon 
---@field name MetaEngineTagString 
---@field flags MetaEngineTagDataScenarioPlatoonFlags 
---@field changeAttackingDefendingStateWhen EngineTagDataScenarioChangeAttackingDefendingStateWhen 
---@field happensTo MetaEngineIndex 
---@field maneuverWhen EngineTagDataScenarioChangeAttackingDefendingStateWhen 
---@field happensTo1 MetaEngineIndex 

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
---@field squads TagBlock<MetaEngineTagDataScenarioSquad> 
---@field platoons TagBlock<MetaEngineTagDataScenarioPlatoon> 
---@field firingPositions TagBlock<MetaEngineTagDataScenarioFiringPosition> 
---@field playerStartingLocations TagBlock<MetaEngineTagDataScenarioPlayerStartingLocation> 

---@class MetaEngineTagDataScenarioCommand 
---@field atomType EngineTagDataScenarioAtomType 
---@field atomModifier integer 
---@field parameter1 number 
---@field parameter2 number 
---@field point1 MetaEngineIndex 
---@field point2 MetaEngineIndex 
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
---@field commands TagBlock<MetaEngineTagDataScenarioCommand> 
---@field points TagBlock<MetaEngineTagDataScenarioCommandPoint> 

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
---@field variant1 MetaEngineTagDependency 
---@field variant2 MetaEngineTagDependency 
---@field variant3 MetaEngineTagDependency 
---@field variant4 MetaEngineTagDependency 
---@field variant5 MetaEngineTagDependency 
---@field variant6 MetaEngineTagDependency 

---@class MetaEngineTagDataScenarioAIConversation 
---@field name MetaEngineTagString 
---@field flags MetaEngineTagDataScenarioAIConversationFlags 
---@field triggerDistance number 
---@field runToPlayerDist number 
---@field participants TagBlock<MetaEngineTagDataScenarioAIConversationParticipant> 
---@field lines TagBlock<MetaEngineTagDataScenarioAIConversationLine> 

---@class MetaEngineTagDataScenarioScriptParameter 
---@field name MetaEngineTagString 
---@field returnType EngineTagDataScenarioScriptValueType 

---@class MetaEngineTagDataScenarioScript 
---@field name MetaEngineTagString 
---@field scriptType EngineTagDataScenarioScriptType 
---@field returnType EngineTagDataScenarioScriptValueType 
---@field rootExpressionIndex integer 
---@field parameters TagBlock<MetaEngineTagDataScenarioScriptParameter> 

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
---@field skies TagBlock<MetaEngineTagDataScenarioSky> 
---@field type EngineTagDataScenarioType 
---@field flags MetaEngineTagDataScenarioFlags 
---@field childScenarios TagBlock<MetaEngineTagDataScenarioChildScenario> 
---@field localNorth number 
---@field predictedResources TagBlock<MetaEngineTagDataPredictedResource> 
---@field functions TagBlock<MetaEngineTagDataScenarioFunction> 
---@field editorScenarioData MetaEngineTagDataOffset 
---@field comments TagBlock<MetaEngineTagDataScenarioEditorComment> 
---@field scavengerHuntObjects TagBlock<MetaEngineTagDataScenarioScavengerHuntObjects> 
---@field objectNames TagBlock<MetaEngineTagDataScenarioObjectName> 
---@field scenery TagBlock<MetaEngineTagDataScenarioScenery> 
---@field sceneryPalette TagBlock<MetaEngineTagDataScenarioSceneryPalette> 
---@field bipeds TagBlock<MetaEngineTagDataScenarioBiped> 
---@field bipedPalette TagBlock<MetaEngineTagDataScenarioBipedPalette> 
---@field vehicles TagBlock<MetaEngineTagDataScenarioVehicle> 
---@field vehiclePalette TagBlock<MetaEngineTagDataScenarioVehiclePalette> 
---@field equipment TagBlock<MetaEngineTagDataScenarioEquipment> 
---@field equipmentPalette TagBlock<MetaEngineTagDataScenarioEquipmentPalette> 
---@field weapons TagBlock<MetaEngineTagDataScenarioWeapon> 
---@field weaponPalette TagBlock<MetaEngineTagDataScenarioWeaponPalette> 
---@field deviceGroups TagBlock<MetaEngineTagDataScenarioDeviceGroup> 
---@field machines TagBlock<MetaEngineTagDataScenarioMachine> 
---@field machinePalette TagBlock<MetaEngineTagDataScenarioMachinePalette> 
---@field controls TagBlock<MetaEngineTagDataScenarioControl> 
---@field controlPalette TagBlock<MetaEngineTagDataScenarioControlPalette> 
---@field lightFixtures TagBlock<MetaEngineTagDataScenarioLightFixture> 
---@field lightFixturePalette TagBlock<MetaEngineTagDataScenarioLightFixturePalette> 
---@field soundScenery TagBlock<MetaEngineTagDataScenarioSoundScenery> 
---@field soundSceneryPalette TagBlock<MetaEngineTagDataScenarioSoundSceneryPalette> 
---@field playerStartingProfile TagBlock<MetaEngineTagDataScenarioPlayerStartingProfile> 
---@field playerStartingLocations TagBlock<MetaEngineTagDataScenarioPlayerStartingLocation> 
---@field triggerVolumes TagBlock<MetaEngineTagDataScenarioTriggerVolume> 
---@field recordedAnimations TagBlock<MetaEngineTagDataScenarioRecordedAnimation> 
---@field netgameFlags TagBlock<MetaEngineTagDataScenarioNetgameFlags> 
---@field netgameEquipment TagBlock<MetaEngineTagDataScenarioNetgameEquipment> 
---@field startingEquipment TagBlock<MetaEngineTagDataScenarioStartingEquipment> 
---@field bspSwitchTriggerVolumes TagBlock<MetaEngineTagDataScenarioBSPSwitchTriggerVolume> 
---@field decals TagBlock<MetaEngineTagDataScenarioDecal> 
---@field decalPalette TagBlock<MetaEngineTagDataScenarioDecalPalette> 
---@field detailObjectCollectionPalette TagBlock<MetaEngineTagDataScenarioDetailObjectCollectionPalette> 
---@field actorPalette TagBlock<MetaEngineTagDataScenarioActorPalette> 
---@field encounters TagBlock<MetaEngineTagDataScenarioEncounter> 
---@field commandLists TagBlock<MetaEngineTagDataScenarioCommandList> 
---@field aiAnimationReferences TagBlock<MetaEngineTagDataScenarioAIAnimationReference> 
---@field aiScriptReferences TagBlock<MetaEngineTagDataScenarioAIScriptReference> 
---@field aiRecordingReferences TagBlock<MetaEngineTagDataScenarioAIRecordingReference> 
---@field aiConversations TagBlock<MetaEngineTagDataScenarioAIConversation> 
---@field scriptSyntaxData MetaEngineTagDataOffset 
---@field scriptStringData MetaEngineTagDataOffset 
---@field scripts TagBlock<MetaEngineTagDataScenarioScript> 
---@field globals TagBlock<MetaEngineTagDataScenarioGlobal> 
---@field references TagBlock<MetaEngineTagDataScenarioReference> 
---@field sourceFiles TagBlock<MetaEngineTagDataScenarioSourceFile> 
---@field cutsceneFlags TagBlock<MetaEngineTagDataScenarioCutsceneFlag> 
---@field cutsceneCameraPoints TagBlock<MetaEngineTagDataScenarioCutsceneCameraPoint> 
---@field cutsceneTitles TagBlock<MetaEngineTagDataScenarioCutsceneTitle> 
---@field customObjectNames MetaEngineTagDependency 
---@field ingameHelpText MetaEngineTagDependency 
---@field hudMessages MetaEngineTagDependency 
---@field structureBsps TagBlock<MetaEngineTagDataScenarioBSP> 


