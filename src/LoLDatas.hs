{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE TemplateHaskell #-}

module LoLDatas where

import Control.Lens
import Data.Aeson
import Data.Char
import GHC.Generics
import Network.HTTP.Simple

data AccountDTO = AccountDTO
  { _accountDTOPuuid :: String,
    _accountDTOGameName :: String,
    _accountDTOTagLine :: String
  }
  deriving (Show, Generic)

data ChampionInfo = ChampionInfo
  { _championInfoFreeChampionIds :: [Int],
    _championInfoFreeChampionIdsForNewPlayers :: [Int],
    _championInfoMaxNewPlayerLevel :: Int
  }
  deriving (Show, Generic)

data ChampionMasteryDTO = ChampionMasteryDTO
  { _championMasteryDTOChampionId :: Int,
    _championMasteryDTOChampionLevel :: Int,
    _championMasteryDTOChampionPoints :: Int,
    _championMasteryDTOLastPlayTime :: Int,
    _championMasteryDTOChampionPointsSinceLastLevel :: Int,
    _championMasteryDTOChampionPointsUntilNextLevel :: Int,
    _championMasteryDTOChestGranted :: Bool,
    _championMasteryDTOTokensEarned :: Int,
    _championMasteryDTOSummonerId :: String
  }
  deriving (Show, Generic)

data SummonerDTO = SummonerDTO
  { _summonerDTOId :: String,
    _summonerDTOAccountId :: String,
    _summonerDTOPuuid :: String,
    _summonerDTOName :: String,
    _summonerDTOProfileIconId :: Int,
    _summonerDTORevisionDate :: Int,
    _summonerDTOSummonerLevel :: Int
  }
  deriving (Show, Generic)

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
  }
  deriving (Show, Generic)

data FeaturedGames = FeaturedGames
  { _featuredGamesGameList :: [FeaturedGameInfo],
    _featuredGamesClientRefreshInterval :: Int
  }
  deriving (Show, Generic)

data FeaturedGameInfo = FeaturedGameInfo
  { _featuredGameInfoGameMode :: String,
    _featuredGameInfoGameLength :: Int,
    _featuredGameInfoMapId :: Int,
    _featuredGameInfoGameType :: String,
    _featuredGameInfoBannedChampions :: [BannedChampion],
    _featuredGameInfoGameId :: Int,
    _featuredGameInfoObservers :: [Observer],
    _featuredGameInfoGameQueueConfigId :: Int,
    _featuredGameInfoGameSTratTime :: Int,
    _featuredGameInfoParticipants :: [Participant],
    _featuredGameInfoPlatformId :: String
  }
  deriving (Show, Generic)

data Participant = Participant
  { _participantBot :: Bool,
    _participantSpell2Id :: Int,
    _participantProfileIconId :: Int,
    _participantSummonerName :: String,
    _participantChampionId :: Int,
    _participantTeamId :: Int,
    _participantSpell1Id :: Int
  }
  deriving (Show, Generic)

data BannedChampion = BannedChampion
  { _bannedChampionPickTurn :: Int,
    _bannedChampionChampionId :: Int,
    _bannedChampionTeamId :: Int
  }
  deriving (Show, Generic)

data Observer = Observer
  { _observerEncryptionKey :: String
  }
  deriving (Show, Generic)

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
  }
  deriving (Show, Generic)

data Perks = Perks
  { _perksPerkIds :: [Int],
    _perksPerkStyle :: Int,
    _perksPerkSubStyle :: Int
  }
  deriving (Show, Generic)

data GameCustomizationObject = GameCustomizationObject
  { _gameCustomizationObjectCategory :: String,
    _gameCustomizationObjectContent :: String
  }
  deriving (Show, Generic)

data MiniSeriesDTO = MiniSeriesDTO
  { _MiniSeriesDTOLosses :: Int,
    _MiniSeriesDTOProgress :: String,
    _MiniSeriesDTOTarget :: Int,
    _MiniSeriesDTOWins :: Int
  }
  deriving (Show, Generic)

data LeagueItemDTO = LeagueItemDTO
  { _LeagueItemDTOFreshBlood :: Bool,
    _LeagueItemDTOWins :: Int,
    _LeagueItemDTOSummonerName :: String,
    _LeagueItemDTOMiniSeries :: MiniSeriesDTO,
    _LeagueItemDTOInactive :: Bool,
    _LeagueItemDTOVeteran :: Bool,
    _LeagueItemDTOHotStreak :: Bool,
    _LeagueItemDTORank :: String,
    _LeagueItemDTOLeaguePoints :: Int,
    _LeagueItemDTOLosses :: Int,
    _LeagueItemDTOSummonerId :: String
  }
  deriving (Show, Generic)

data LeagueListDTO = LeagueListDTO
  { _leagueListDTOLeagueId :: String,
    _leagueListDTOEntries :: [LeagueItemDTO],
    _leagueListDTOTier :: String,
    _leagueListDTOName :: String,
    _leagueListDTOQueue :: String
  }
  deriving (Show, Generic)

data LeagueEntryDTO = LeagueEntryDTO
  { _leagueEntryDTOLeagueId :: String,
    _leagueEntryDTOSummonerId :: String,
    _leagueEntryDTOSummonerName :: String,
    _leagueEntryDTOQueueType :: String,
    _leagueEntryDTOTier :: String,
    _leagueEntryDTORank :: String,
    _leagueEntryDTOLeaguePoint :: Int,
    _leagueEntryDTOWins :: Int,
    _leagueEntryDTOLoses :: Int,
    _leagueEntryDTOHotStreak :: Bool,
    _leagueEntryDTOVeteran :: Bool,
    _leagueEntryDTOFreshBlood :: Bool,
    _leagueEntryDTOInactive :: Bool,
    _leagueEntryDTOMiniSeries :: MiniSeriesDTO
  }
  deriving (Show, Generic)

data MatchDTO = MatchDTO
  { _matchDTOGameId :: Int,
    _matchDTOParticipantIdentities :: Int,
    _matchDTOQueueId :: Int,
    _matchDTOGameType :: String,
    _matchDTOGameDuration :: Int,
    _matchDTOTeams :: Int,
    _matchDTOPlatformId :: String,
    _matchDTOGameCreation :: Int,
    _matchDTOSessionId :: Int,
    _matchDTOGameVersion :: String,
    _matchDTOMapId :: Int,
    _matchDTOGameMode :: String,
    _matchDTOParticipants :: Int
  }
  deriving (Show, Generic)

data ParticipantIdentityDTO = ParticipantIdentityDTO
  { _participantidentifyDTOParticipantId :: Int,
    _participantidentifyDTOPlayer :: Int
  }
  deriving (Show, Generic)

data PlayerDTO = PlayerDTO
  { _playerDTOProfileIcon :: Int,
    _playerDTOAccountId :: String,
    _playerDTOMatchHistoryUri :: String,
    _playerDTOCurrentAccountId :: String,
    _playerDTOCurrentPlatformId :: String,
    _playerDTOSummonerName :: String,
    _playerDTOSummonerId :: String,
    _playerDTOPlatformId :: String
  }
  deriving (Show, Generic)

data TeamStatsDTO = TeamStatsDTO
  { _teamStatsDTOTowerKills :: Int,
    _teamStatsDTORiftHeraldKills :: Int,
    _teamStatsDTOFirstBlood :: Bool,
    _teamStatsDTOInhibitorKills :: Int,
    _teamStatsDTOBans :: Int,
    _teamStatsDTOFirstBaron :: Bool,
    _teamStatsDTOFirstDragon :: Bool,
    _teamStatsDTODominionVictoryScore :: Int,
    _teamStatsDTODragonKills :: Int,
    _teamStatsDTOBaronKills :: Int,
    _teamStatsDTOFirstInhibitor :: Bool,
    _teamStatsDTOFirstTower :: Bool,
    _teamStatsDTOVilemawKills :: Int,
    _teamStatsDTOFirstRiftHerald :: Bool,
    _teamStatsDTOTeamId :: Int,
    _teamStatsDTOWin :: Bool
  }
  deriving (Show, Generic)

data TeamBansDTO = TeamBansDTO
  { _teamBansDTOChampionId :: Int,
    _teamBansDTOPickTurn :: Int
  }
  deriving (Show, Generic)

data ParticipantDTO = ParticipantDTO
  { _participantDTOParticipantId :: Int,
    _participantDTOChampionId :: Int,
    _participantDTORunes :: Int,
    _participantDTOStats :: Int,
    _participantDTOTeamId :: Int,
    _participantDTOTimeline :: Int,
    _participantDTOSpell1Id :: Int,
    _participantDTOSpell2Id :: Int,
    _participantDTOHighestAchievedSeasonTier :: String,
    _participantDTOMasteries :: Int
  }
  deriving (Show, Generic)

data RuneDTO = RuneDTO
  { _RuneDTORuneId :: Int,
    _RuneDTORank :: Int
  }
  deriving (Show, Generic)

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
makeFields ''MiniSeriesDTO
makeFields ''LeagueItemDTO
makeFields ''LeagueListDTO
makeFields ''LeagueEntryDTO
makeFields ''MatchDTO
makeFields ''ParticipantIdentityDTO
makeFields ''PlayerDTO
makeFields ''TeamStatsDTO
makeFields ''TeamBansDTO
makeFields ''ParticipantDTO
makeFields ''RuneDTO

instance FromJSON AccountDTO where
  parseJSON = genericParseJSON defaultOptions {fieldLabelModifier = (\(s : str) -> toLower s : str) . drop (length "_AccountDTO")}

instance FromJSON ChampionInfo where
  parseJSON = genericParseJSON defaultOptions {fieldLabelModifier = (\(s : str) -> toLower s : str) . drop (length "_ChampionInfo")}

instance FromJSON ChampionMasteryDTO where
  parseJSON = genericParseJSON defaultOptions {fieldLabelModifier = (\(s : str) -> toLower s : str) . drop (length "_ChampionMasteryDTO")}

instance FromJSON SummonerDTO where
  parseJSON = genericParseJSON defaultOptions {fieldLabelModifier = (\(s : str) -> toLower s : str) . drop (length "_SummonerDTO")}

instance FromJSON CurrentGameInfo where
  parseJSON = genericParseJSON defaultOptions {fieldLabelModifier = (\(s : str) -> toLower s : str) . drop (length "_CurrentGameInfo")}

instance FromJSON FeaturedGames where
  parseJSON = genericParseJSON defaultOptions {fieldLabelModifier = (\(s : str) -> toLower s : str) . drop (length "_FeaturdGames")}

instance FromJSON FeaturedGameInfo where
  parseJSON = genericParseJSON defaultOptions {fieldLabelModifier = (\(s : str) -> toLower s : str) . drop (length "_FeaturedGameInfo")}

instance FromJSON Participant where
  parseJSON = genericParseJSON defaultOptions {fieldLabelModifier = (\(s : str) -> toLower s : str) . drop (length "_Participant")}

instance FromJSON BannedChampion where
  parseJSON = genericParseJSON defaultOptions {fieldLabelModifier = (\(s : str) -> toLower s : str) . drop (length "_BannedChampion")}

instance FromJSON Observer where
  parseJSON = genericParseJSON defaultOptions {fieldLabelModifier = (\(s : str) -> toLower s : str) . drop (length "_Observer")}

instance FromJSON CurrentGameParticipant where
  parseJSON = genericParseJSON defaultOptions {fieldLabelModifier = (\(s : str) -> toLower s : str) . drop (length "_CurrentGameParticipant")}

instance FromJSON Perks where
  parseJSON = genericParseJSON defaultOptions {fieldLabelModifier = (\(s : str) -> toLower s : str) . drop (length "_Perks")}

instance FromJSON GameCustomizationObject where
  parseJSON = genericParseJSON defaultOptions {fieldLabelModifier = (\(s : str) -> toLower s : str) . drop (length "_GameCustomizationObject")}

instance FromJSON MiniSeriesDTO where
  parseJSON = genericParseJSON defaultOptions {fieldLabelModifier = (\(s : str) -> toLower s : str) . drop (length "_MiniSeriesDTO")}

instance FromJSON LeagueItemDTO where
  parseJSON = genericParseJSON defaultOptions {fieldLabelModifier = (\(s : str) -> toLower s : str) . drop (length "_LeagueItemDTO")}

instance FromJSON LeagueListDTO where
  parseJSON = genericParseJSON defaultOptions {fieldLabelModifier = (\(s : str) -> toLower s : str) . drop (length "_LeagueListDTO")}

instance FromJSON LeagueEntryDTO where
  parseJSON = genericParseJSON defaultOptions {fieldLabelModifier = (\(s : str) -> toLower s : str) . drop (length "_LeagueEntryDTO")}

instance FromJSON MatchDTO where
  parseJSON = genericParseJSON defaultOptions {fieldLabelModifier = (\(s : str) -> toLower s : str) . drop (length "_MatchDTO")}

instance FromJSON ParticipantIdentityDTO where
  parseJSON = genericParseJSON defaultOptions {fieldLabelModifier = (\(s : str) -> toLower s : str) . drop (length "_ParticipantIdentityDTO")}

instance FromJSON PlayerDTO where
  parseJSON = genericParseJSON defaultOptions {fieldLabelModifier = (\(s : str) -> toLower s : str) . drop (length "_PlayerDTO")}

instance FromJSON TeamStatsDTO where
  parseJSON = genericParseJSON defaultOptions {fieldLabelModifier = (\(s : str) -> toLower s : str) . drop (length "_TeamStatsDTO")}

instance FromJSON TeamBansDTO where
  parseJSON = genericParseJSON defaultOptions {fieldLabelModifier = (\(s : str) -> toLower s : str) . drop (length "_TeamBansDTO")}

instance FromJSON ParticipantDTO where
  parseJSON = genericParseJSON defaultOptions {fieldLabelModifier = (\(s : str) -> toLower s : str) . drop (length "_ParticipantDTO")}

instance FromJSON RuneDTO where
  parseJSON = genericParseJSON defaultOptions {fieldLabelModifier = (\(s : str) -> toLower s : str) . drop (length "_RuneDTO")}

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

data GlobalRegion = ASIA | EUROPE | AMERICAS

instance Show GlobalRegion where
  show ASIA = "asia.api.riotgames.com"
  show EUROPE = "europe.api.riotgames.com"
  show AMERICAS = "americas.api.riotgames.com"
