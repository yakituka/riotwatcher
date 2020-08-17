{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE TemplateHaskell #-}

module LoLDatas
  ( ChampionInfo (..),
    ChampionMasteryDTO (..),
    SummonerDTO (..),
    CurrentGameInfo (..),
    BannedChampion (..),
    Observer (..),
    CurrentGameParticipant (..),
    Perks (..),
    GameCustomizationObject (..),
    Api_key,
    Region (..),
  )
where

import Data.Aeson
import Data.Char
import Control.Lens
import GHC.Generics
import Network.HTTP.Simple

data ChampionInfo = ChampionInfo
  { _freeChampionIds :: [Int]
  , _freeChampionIdsForNewPlayers :: [Int]
  , _maxNewPlayerLevel :: Int
  } deriving (Show, Generic)

makeLenses ''ChampionInfo

data ChampionMasteryDTO = ChampionMasteryDTO
  { championId :: Int,
    championLevel :: Int,
    championPoints :: Int,
    lastPlayTime :: Int,
    championPointsSinceLastLevel :: Int,
    championPointsUntilNextLevel :: Int,
    chestGranted :: Bool,
    tokensEarned :: Int,
    summonerId :: String
  }
  deriving (Show, Generic)

data SummonerDTO = SummonerDTO
  { id :: String
  , accountId :: String
  , puuid :: String
  , name :: String
  , profileIconId :: Int
  , revisionDate :: Int
  , summonerLevel :: Int
  }
  deriving (Show, Generic)

data CurrentGameInfo = CurrentGameInfo
  { gameId :: Int,
    gameType :: String,
    gameStartTime :: Int,
    mapId :: Int,
    gameLength :: Int,
    platformId :: String,
    gameMode :: String,
    bannedChampions :: [BannedChampion],
    gameQueueConfigId :: Int,
    observers :: Observer,
    participants :: [CurrentGameParticipant]
  }
  deriving (Show, Generic)

data BannedChampion = BannedChampion
  { pickTurn :: Int,
    championId :: Int,
    teamId :: Int
  }
  deriving (Show, Generic)

data Observer = Observer
  { encryptionKey :: String
  }
  deriving (Show, Generic)

data CurrentGameParticipant = CurrentGameParticipant
  { championId :: Int,
    perks :: Perks,
    profileIconId :: Int,
    bot :: Bool,
    teamId :: Int,
    summonerName :: String,
    summonerId :: String,
    spell1Id :: Int,
    spell2Id :: Int,
    gameCustomizationObjects :: [GameCustomizationObject]
  }
  deriving (Show, Generic)

data Perks = Perks
  { perkIds :: [Int],
    perkStyle :: Int,
    perkSubStyle :: Int
  }
  deriving (Show, Generic)

data GameCustomizationObject = GameCustomizationObject
  { category :: String,
    content :: String
  }
  deriving (Show, Generic)

instance FromJSON ChampionInfo where
  parseJSON = genericParseJSON defaultOptions { fieldLabelModifier = drop 1 } 
instance FromJSON ChampionMasteryDTO
instance FromJSON SummonerDTO
instance FromJSON CurrentGameInfo
instance FromJSON BannedChampion
instance FromJSON Observer
instance FromJSON CurrentGameParticipant
instance FromJSON Perks
instance FromJSON GameCustomizationObject

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

--a = ChampionInfo { _championinfofreeChampionIds = [], _championinfofreeChampionIdsForNewPlayers = [], _championinfomaxNewPlayerLevel = 3 } 
--b = a ^. freeChampionIds