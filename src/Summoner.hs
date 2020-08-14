module Summoner
    (
        summoner_by_account,
        summoner_by_id,
        summoner_by_name,
        summoner_by_puuid
    ) where

import LoLDatas
import Network.HTTP.Simple
import Data.Aeson

--アカウントIDからサモナーの情報を取得する。
summoner_by_account :: Api_key -> Region -> String -> IO (Maybe SummonerDTO)
summoner_by_account api_key region account_id = do
    url <- parseRequest $ "https://" ++ show region ++ "/lol/summoner/v4/summoners/by-account/" ++ account_id ++ "?api_key=" ++ api_key
    res <- httpLbs url
    pure $ ( decode (getResponseBody res) :: Maybe SummonerDTO )

--サモナーIDからサモナーの情報を取得する。
summoner_by_id :: Api_key -> Region -> String -> IO (Maybe SummonerDTO)
summoner_by_id api_key region summoner_id = do
    url <- parseRequest $ "https://" ++ show region ++ "/lol/summoner/v4/summoners/" ++ summoner_id ++ "?api_key=" ++ api_key
    res <- httpLbs url
    pure $ ( decode (getResponseBody res) :: Maybe SummonerDTO )

--名前からサモナーの情報を取得する。
summoner_by_name :: Api_key -> Region -> String -> IO (Maybe SummonerDTO)
summoner_by_name api_key region summoner_name = do
    url <- parseRequest $ "https://" ++ show region ++ "/lol/summoner/v4/summoners/by-name/" ++ summoner_name ++ "?api_key=" ++ api_key
    res <- httpLbs url
    pure $ ( decode (getResponseBody res) :: Maybe SummonerDTO )

--puuidからサモナーの情報を取得する。
summoner_by_puuid :: Api_key -> Region -> String -> IO (Maybe SummonerDTO)
summoner_by_puuid api_key region puuid = do
    url <- parseRequest $ "https://" ++ show region ++ "/lol/summoner/v4/summoners/by-puuid/" ++ puuid ++ "?api_key=" ++ api_key
    res <- httpLbs url
    pure $ ( decode (getResponseBody res) :: Maybe SummonerDTO )