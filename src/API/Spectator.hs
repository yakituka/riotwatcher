module API.Spectator
    ( spectator_by_summoner
    , spectator_featured_games
    ) where

import           Control.Exception
import           Data.Aeson
import           LoLDatas
import           Network.HTTP.Conduit
import           Network.HTTP.Simple

--サモナーIDからライブゲームの情報を取得する。
spectator_by_summoner :: Api_key -> Region -> String -> IO CurrentGameInfo
spectator_by_summoner api_key region summoner_id = do
    url <- ( parseRequest $ "https://" ++ show region ++ "/lol/spectator/v4/active-games/by-summoner/" ++ summoner_id ++ "?api_key=" ++ api_key )
    res <- httpJSON url
    pure $ getResponseBody res

spectator_featured_games :: Api_key -> Region -> IO FeaturedGames
spectator_featured_games api_key region = do
    url <- ( parseRequest $ "https://" ++ show region ++ " /lol/spectator/v4/featured-games?api_key=" ++ api_key )
    res <- httpJSON url
    pure $ getResponseBody res