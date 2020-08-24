{-# LANGUAGE DeriveGeneric          #-}
{-# LANGUAGE DuplicateRecordFields  #-}
{-# LANGUAGE FlexibleInstances      #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE TemplateHaskell        #-}

module LoLDatas where

import           Control.Lens
import           Data.Aeson
import           Data.Char
import           GHC.Generics
import           Network.HTTP.Simple

data AccountDTO = AccountDTO
  { _accountDTOPuuid    :: String
  , _accountDTOGameName :: String
  , _accountDTOTagLine  :: String

  } deriving (Show, Generic)

data ChampionInfo = ChampionInfo
  { _championInfoFreeChampionIds              :: [Int]
  , _championInfoFreeChampionIdsForNewPlayers :: [Int]
  , _championInfoMaxNewPlayerLevel            :: Int

  } deriving (Show, Generic)

data ChampionMasteryDTO = ChampionMasteryDTO
  { _championMasteryDTOChampionId                   :: Int
  , _championMasteryDTOChampionLevel                :: Int
  , _championMasteryDTOChampionPoints               :: Int
  , _championMasteryDTOLastPlayTime                 :: Int
  , _championMasteryDTOChampionPointsSinceLastLevel :: Int
  , _championMasteryDTOChampionPointsUntilNextLevel :: Int
  , _championMasteryDTOChestGranted                 :: Bool
  , _championMasteryDTOTokensEarned                 :: Int
  , _championMasteryDTOSummonerId                   :: String
  } deriving (Show, Generic)

data SummonerDTO = SummonerDTO
  { _summonerDTOId            :: String
  , _summonerDTOAccountId     :: String
  , _summonerDTOPuuid         :: String
  , _summonerDTOName          :: String
  , _summonerDTOProfileIconId :: Int
  , _summonerDTORevisionDate  :: Int
  , _summonerDTOSummonerLevel :: Int
  } deriving (Show, Generic)

data CurrentGameInfo = CurrentGameInfo
  { _currentGameInfoGameId            :: Int
  , _currentGameInfoGameType          :: String
  , _currentGameInfoGameStartTime     :: Int
  , _currentGameInfoMapId             :: Int
  , _currentGameInfoGameLength        :: Int
  , _currentGameInfoPlatformId        :: String
  , _currentGameInfoGameMode          :: String
  , _currentGameInfoBannedChampions   :: [BannedChampion]
  , _currentGameInfoGameQueueConfigId :: Int
  , _currentGameInfoObservers         :: Observer
  , _currentGameInfoParticipants      :: [CurrentGameParticipant]
  } deriving (Show, Generic)

data FeaturedGames = FeaturedGames
  { _featuredGamesGameList              :: [FeaturedGameInfo]
  , _featuredGamesClientRefreshInterval :: Int
  } deriving (Show, Generic)

data FeaturedGameInfo = FeaturedGameInfo
  { _featuredGameInfoGameMode          :: String
  , _featuredGameInfoGameLength        :: Int
  , _featuredGameInfoMapId             :: Int
  , _featuredGameInfoGameType          :: String
  , _featuredGameInfoBannedChampions   :: [BannedChampion]
  , _featuredGameInfoGameId            :: Int
  , _featuredGameInfoObservers         :: [Observer]
  , _featuredGameInfoGameQueueConfigId :: Int
  , _featuredGameInfoGameSTratTime     :: Int
  , _featuredGameInfoParticipants      :: [Participant]
  , _featuredGameInfoPlatformId        :: String
  } deriving (Show, Generic)

data Participant = Participant
  { _participantBot           :: Bool
  , _participantSpell2Id      :: Int
  , _participantProfileIconId :: Int
  , _participantSummonerName  :: String
  , _participantChampionId    :: Int
  , _participantTeamId        :: Int
  , _participantSpell1Id      :: Int
  } deriving (Show, Generic)

data BannedChampion = BannedChampion
  { _bannedChampionPickTurn   :: Int
  , _bannedChampionChampionId :: Int
  , _bannedChampionTeamId     :: Int
  } deriving (Show, Generic)

data Observer = Observer
  { _observerEncryptionKey :: String
  } deriving (Show, Generic)

data CurrentGameParticipant = CurrentGameParticipant
  { _currentGameParticipantChampionId               :: Int
  , _currentGameParticipantPerks                    :: Perks
  , _currentGameParticipantProfileIconId            :: Int
  , _currentGameParticipantBot                      :: Bool
  , _currentGameParticipantTeamId                   :: Int
  , _currentGameParticipantSummonerName             :: String
  , _currentGameParticipantSummonerId               :: String
  , _currentGameParticipantSpell1Id                 :: Int
  , _currentGameParticipantSpell2Id                 :: Int
  , _currentGameParticipantGameCustomizationObjects :: [GameCustomizationObject]
  } deriving (Show, Generic)

data Perks = Perks
  { _perksPerkIds      :: [Int]
  , _perksPerkStyle    :: Int
  , _perksPerkSubStyle :: Int
  } deriving (Show, Generic)

data GameCustomizationObject = GameCustomizationObject
  { _gameCustomizationObjectCategory :: String
  , _gameCustomizationObjectContent  :: String
  } deriving (Show, Generic)

makeFields ''AccountDTO
makeFields ''ChampionInfo
makeFields ''ChampionMasteryDTO
makeFields ''SummonerDTO
makeFields ''CurrentGameInfo
makeFields ''FeaturedGames
makeFields ''FeaturedGameInfo
makeFields ''Participant
makeFields ''BannedChampion
makeFields ''CurrentGameParticipant
makeFields ''GameCustomizationObject


instance FromJSON AccountDTO where
  parseJSON = genericParseJSON defaultOptions { fieldLabelModifier = (\(s:str) -> toLower s : str) . drop (length "_AccountDTO") }
instance FromJSON ChampionInfo where
  parseJSON = genericParseJSON defaultOptions { fieldLabelModifier = (\(s:str) -> toLower s : str) . drop (length "_ChampionInfo") }
instance FromJSON ChampionMasteryDTO where
  parseJSON = genericParseJSON defaultOptions { fieldLabelModifier = (\(s:str) -> toLower s : str) . drop (length "_ChampionMasteryDTO") }
instance FromJSON SummonerDTO where
  parseJSON = genericParseJSON defaultOptions { fieldLabelModifier = (\(s:str) -> toLower s : str) . drop (length "_SummonerDTO") }
instance FromJSON CurrentGameInfo where
  parseJSON = genericParseJSON defaultOptions { fieldLabelModifier = (\(s:str) -> toLower s : str) . drop (length "_CurrentGameInfo") }
instance FromJSON FeaturedGames where
  parseJSON = genericParseJSON defaultOptions { fieldLabelModifier = (\(s:str) -> toLower s : str) . drop (length "_FeaturdGames") }
instance FromJSON FeaturedGameInfo where
  parseJSON = genericParseJSON defaultOptions { fieldLabelModifier = (\(s:str) -> toLower s : str) . drop (length "_FeaturedGameInfo") }
instance FromJSON Participant where
  parseJSON = genericParseJSON defaultOptions { fieldLabelModifier = (\(s:str) -> toLower s : str) . drop (length "_Participant") }
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
  show BR1  = "br1.api.riotgames.com"
  show EUN1 = "eun1.api.riotgames.com"
  show EUW1 = "euw1.api.riotgames.com"
  show JP1  = "jp1.api.riotgames.com"
  show KR   = "kr.api.riotgames.com"
  show LA1  = "la1.api.riotgames.com"
  show LA2  = "la2.api.riotgames.com"
  show NA1  = "na1.api.riotgames.com"
  show OC1  = "oc1.api.riotgames.com"
  show TR1  = "tr1.api.riotgames.com"
  show RU   = "ru.api.riotgames.com"

data GlobalRegion = ASIA | EUROPE | AMERICAS

instance Show GlobalRegion where
  show ASIA     = "asia.api.riotgames.com"
  show EUROPE   = "europe.api.riotgames.com"
  show AMERICAS = "americas.api.riotgames.com"
