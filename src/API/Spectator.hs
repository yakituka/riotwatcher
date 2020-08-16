module API.Spectator
    (
        spectator_by_summoner
    ) where

import LoLDatas
import Network.HTTP.Simple
import Data.Aeson

--サモナーIDからライブゲームの情報を取得する。
spectator_by_summoner :: Api_key -> Region -> String -> IO CurrentGameInfo
spectator_by_summoner api_key region summoner_id = do
    url <- parseRequest $ "https://" ++ show region ++ "/lol/spectator/v4/active-games/by-summoner/" ++ summoner_id ++ "?api_key=" ++ api_key
    res <- httpJSON url
    pure $ getResponseBody res