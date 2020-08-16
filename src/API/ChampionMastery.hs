module API.ChampionMastery
  ( champion_mastery,
  )
where

import Data.Aeson
import LoLDatas
import Network.HTTP.Simple

--フリーチャンピオンに関する情報を取得する。
champion_mastery :: Api_key -> Region -> String -> String -> IO (Maybe ChampionMasteryDTO)
champion_mastery api_key region summoner_id champion_id = do
  url <- parseRequest $ "https://" ++ show region ++ "/lol/champion-mastery/v4/champion-masteries/by-summoner/" ++ summoner_id ++ "/by-champion/" ++ champion_id ++ "?api_key=" ++ api_key
  res <- httpLbs url
  pure $ (decode (getResponseBody res) :: Maybe ChampionMasteryDTO)