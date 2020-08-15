module API.Champion
    (
        champion_rotations
    ) where

import LoLDatas
import Network.HTTP.Simple
import Data.Aeson

--フリーチャンピオンに関する情報を取得する。
champion_rotations :: Api_key -> Region -> IO (Maybe ChampionInfo)
champion_rotations api_key region = do
    url <- parseRequest $ "https://" ++ show region ++ "/lol/platform/v3/champion-rotations?api_key=" ++ api_key
    res <- httpLbs url
    pure $ ( decode (getResponseBody res) :: Maybe ChampionInfo )