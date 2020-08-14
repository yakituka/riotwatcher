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

data Region = JP | NA
instance Show Region where
    show JP = "jp1"
    show NA = "na1"