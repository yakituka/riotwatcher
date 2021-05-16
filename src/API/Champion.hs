module API.Champion
  ( champion_rotations,
  )
where

import Data.Aeson
import LoLDatas
import Network.HTTP.Simple

--フリーチャンピオンに関する情報を取得する。
champion_rotations :: Api_key -> Region -> IO ChampionInfo
champion_rotations api_key region = do
  url <- parseRequest $ "https://" ++ show region ++ "/lol/platform/v3/champion-rotations?api_key=" ++ api_key
  res <- httpJSON url
  pure $ getResponseBody res
