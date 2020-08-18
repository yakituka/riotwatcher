{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE TemplateHaskell #-}

module LoLDatas where

import Data.Aeson
import Data.Char
import Control.Lens
import GHC.Generics
import Network.HTTP.Simple

data ChampionInfo = ChampionInfo
  { _championInfoFreeChampionIds :: [Int]
  , _championInfoFreeChampionIdsForNewPlayers :: [Int]
  , _championInfoMaxNewPlayerLevel :: Int
  } deriving (Show, Generic)

data ChampionMasteryDTO = ChampionMasteryDTO
  { _championMasteryDTOChampionId :: Int
  , _championMasteryDTOChampionLevel :: Int
  , _championMasteryDTOChampionPoints :: Int
  , _championMasteryDTOLastPlayTime :: Int
  , _championMasteryDTOChampionPointsSinceLastLevel :: Int
  , _championMasteryDTOChampionPointsUntilNextLevel :: Int
  , _championMasteryDTOChestGranted :: Bool
  , _championMasteryDTOTokensEarned :: Int
  , _championMasteryDTOSummonerId :: String
  } deriving (Show, Generic)

data SummonerDTO = SummonerDTO
  { _summonerDTOId :: String
  , _summonerDTOAccountId :: String
  , _summonerDTOPuuid :: String
  , _summonerDTOName :: String
  , _summonerDTOProfileIconId :: Int
  , _summonerDTORevisionDate :: Int
  , _summonerDTOSummonerLevel :: Int
  } deriving (Show, Generic)

data CurrentGameInfo = CurrentGameInfo
  { _currentGameInfoGameId :: Int,
    _currentGameInfoGameType :: String,
    _currentGameInfoGameStartTime :: Int,
    _currentGameInfoMapId :: Int,
    _currentGameInfoGameLength :: Int,
    _currentGameInfoPlatformId :: String,
    _currentGameInfoGameMode :: String,
    _currentGameInfoBannedChampions :: [BannedChampion],
    _currentGameInfoGameQueueConfigId :: Int,
    _currentGameInfoObservers :: Observer,
    _currentGameInfoParticipants :: [CurrentGameParticipant]
  } deriving (Show, Generic)

data BannedChampion = BannedChampion
  { _bannedChampionPickTurn :: Int,
    _bannedChampionChampionId :: Int,
    _bannedChampionTeamId :: Int
  } deriving (Show, Generic)

data Observer = Observer
  { _observerEncryptionKey :: String
  } deriving (Show, Generic)

data CurrentGameParticipant = CurrentGameParticipant
  { _currentGameParticipantChampionId :: Int,
    _currentGameParticipantPerks :: Perks,
    _currentGameParticipantProfileIconId :: Int,
    _currentGameParticipantBot :: Bool,
    _currentGameParticipantTeamId :: Int,
    _currentGameParticipantSummonerName :: String,
    _currentGameParticipantSummonerId :: String,
    _currentGameParticipantSpell1Id :: Int,
    _currentGameParticipantSpell2Id :: Int,
    _currentGameParticipantGameCustomizationObjects :: [GameCustomizationObject]
  } deriving (Show, Generic)

data Perks = Perks
  { _perksPerkIds :: [Int],
    _perksPerkStyle :: Int,
    _perksPerkSubStyle :: Int
  } deriving (Show, Generic)

data GameCustomizationObject = GameCustomizationObject
  { _gameCustomizationObjectCategory :: String,
    _gameCustomizationObjectContent :: String
  } deriving (Show, Generic)

makeFields ''ChampionInfo
makeFields ''ChampionMasteryDTO
makeFields ''SummonerDTO
makeFields ''CurrentGameInfo
makeFields ''BannedChampion
makeFields ''CurrentGameParticipant
makeFields ''GameCustomizationObject

instance FromJSON ChampionInfo where
  parseJSON = genericParseJSON defaultOptions { fieldLabelModifier = (\(s:str) -> toLower s : str) . drop (length "_ChampionInfo") } 
instance FromJSON ChampionMasteryDTO where
  parseJSON = genericParseJSON defaultOptions { fieldLabelModifier = (\(s:str) -> toLower s : str) . drop (length "_ChampionMasteryDTO") }
instance FromJSON SummonerDTO where
  parseJSON = genericParseJSON defaultOptions { fieldLabelModifier = (\(s:str) -> toLower s : str) . drop (length "_SummonerDTO") } 
instance FromJSON CurrentGameInfo where
  parseJSON = genericParseJSON defaultOptions { fieldLabelModifier = (\(s:str) -> toLower s : str) . drop (length "_CurrentGameInfo") } 
instance FromJSON BannedChampion where
  parseJSON = genericParseJSON defaultOptions { fieldLabelModifier = (\(s:str) -> toLower s : str) . drop (length "_BannedChampion") } 
instance FromJSON Observer where
  parseJSON = genericParseJSON defaultOptions { fieldLabelModifier = (\(s:str) -> toLower s : str) . drop (length "_Observer") } 
instance FromJSON CurrentGameParticipant where
  parseJSON = genericParseJSON defaultOptions { fieldLabelModifier = (\(s:str) -> toLower s : str) . drop (length "_CurrentGameParticipant") } 
instance FromJSON Perks where
  parseJSON = genericParseJSON defaultOptions { fieldLabelModifier = (\(s:str) -> toLower s : str) . drop (length "_Perks") } 
instance FromJSON GameCustomizationObject where
  parseJSON = genericParseJSON defaultOptions { fieldLabelModifier = (\(s:str) -> toLower s : str) . drop (length "_GameCustomizationObject") } 

type Api_key = String

data Region = BR1 | EUN1 | EUW1 | JP1 | KR | LA1 | LA2 | NA1 | OC1 | TR1 | RU

instance Show Region where
  show BR1 = "br1.api.riotgames.com"
  show EUN1 = "eun1.api.riotgames.com"
  show EUW1 = "euw1.api.riotgames.com"
  show JP1 = "jp1.api.riotgames.com"
  show KR = "kr.api.riotgames.com"
  show LA1 = "la1.api.riotgames.com"
  show LA2 = "la2.api.riotgames.com"
  show NA1 = "na1.api.riotgames.com"
  show OC1 = "oc1.api.riotgames.com"
  show TR1 = "tr1.api.riotgames.com"
  show RU = "ru.api.riotgames.com"