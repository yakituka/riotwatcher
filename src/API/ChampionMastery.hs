module API.ChampionMastery
  (   champion_mastery
    , champion_masteries
    , mastery_points
  )
where

import Data.Aeson
import LoLDatas
import Network.HTTP.Simple

--サモナー[summoner_id]の、特定のチャンピオン[champion_id]のマスタリーポイント等に関する情報を取得する。
champion_mastery :: Api_key -> Region -> String -> String -> IO ChampionMasteryDTO
champion_mastery api_key region summoner_id champion_id = do
  url <- parseRequest $ "https://" ++ show region ++ "/lol/champion-mastery/v4/champion-masteries/by-summoner/" ++ summoner_id ++ "/by-champion/" ++ champion_id ++ "?api_key=" ++ api_key
  res <- httpJSON url
  pure $ getResponseBody res

--サモナー[summoner_id]の、マスタリーポイント等に関する情報を取得する。
champion_masteries :: Api_key -> Region -> String -> IO [ChampionMasteryDTO]
champion_masteries api_key region summoner_id = do
    url <- parseRequest $ "https://" ++ show region ++ "/lol/champion-mastery/v4/champion-masteries/by-summoner/" ++ summoner_id ++"?api_key=" ++ api_key
    res <- httpJSON url
    pure $ getResponseBody res

--サモナー[summoner_id]の、マスタリーポイントを取得する。
mastery_points:: Api_key -> Region -> String -> IO Int
mastery_points api_key region summoner_id = do
    url <- parseRequest $ "https://" ++ show region ++ "/lol/champion-mastery/v4/scores/by-summoner/" ++ summoner_id ++"?api_key=" ++ api_key
    res <- httpJSON url
    pure $ getResponseBody res