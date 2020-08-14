{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}

module Lib
    ( someFunc,
      getFreeRotationChampions
    ) where

import Network.HTTP.Simple
import Data.Aeson
import GHC.Generics

data Champions = Champions { freeChampionIds :: [Int], freeChampionIdsForNewPlayers :: [Int], maxNewPlayerLevel :: Int } deriving (Show, Generic)
instance FromJSON Champions

--api_key = "RGAPI-d4e70b01-83f2-4d2f-bbc8-49e7aff6b8d0"

getFreeRotationChampions :: IO (Maybe [Int])
getFreeRotationChampions = do
    res <- httpLbs "https://jp1.api.riotgames.com/lol/platform/v3/champion-rotations?api_key=RGAPI-d4e70b01-83f2-4d2f-bbc8-49e7aff6b8d0"
    let ans = decode (getResponseBody res) :: Maybe Champions
    pure $ freeChampionIds <$> ans

test = do
    res <- httpLbs "http://ddragon.leagueoflegends.com/cdn/10.16.1/data/ja_JP/champion.json"
    

someFunc :: IO ()
someFunc = putStrLn "someFunc"
