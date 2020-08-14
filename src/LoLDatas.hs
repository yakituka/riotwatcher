{-# LANGUAGE DeriveGeneric #-}

module LoLDatas
    (
        ChampionInfo(..),
        SummonerDTO(..),
        Api_key,
        Region(..)
    ) where

import Network.HTTP.Simple
import Data.Aeson
import GHC.Generics

data ChampionInfo = ChampionInfo { freeChampionIds :: [Int], freeChampionIdsForNewPlayers :: [Int], maxNewPlayerLevel :: Int } deriving (Show, Generic)
instance FromJSON ChampionInfo

data SummonerDTO = SummonerDTO { id :: String, accountId :: String, puuid :: String, name :: String, profileIconId :: Int, revisionDate :: Int, summonerLevel :: Int } deriving (Show, Generic)
instance FromJSON SummonerDTO

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