{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}

module Lib
    (
        champion_rotations,
        summoner_by_name,
        ChampionInfo(..),
        SummonerDTO(..),
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

--フリーチャンピオンに関する情報を取得する。
champion_rotations :: Api_key -> Region -> IO (Maybe ChampionInfo)
champion_rotations api_key region = do
    url <- parseRequest $ "https://" ++ show region ++ ".api.riotgames.com/lol/platform/v3/champion-rotations?api_key=" ++ api_key
    res <- httpLbs url
    pure $ ( decode (getResponseBody res) :: Maybe ChampionInfo )

--サモナーの情報を名前から取得する。
summoner_by_name :: Api_key -> Region -> String -> IO (Maybe SummonerDTO)
summoner_by_name api_key region name = do
    url <- parseRequest $ "https://" ++ show region ++ ".api.riotgames.com/lol/summoner/v4/summoners/by-name/" ++ name ++ "?api_key=" ++ api_key
    res <- httpLbs url
    pure $ ( decode (getResponseBody res) :: Maybe SummonerDTO )

--test = do
--    res <- httpLbs "http://ddragon.leagueoflegends.com/cdn/10.16.1/data/ja_JP/champion.json"