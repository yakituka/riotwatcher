module API.League
  ( challenger_leagues
  , grandmaster_leagues
  , leagues_by_league_id
  , master_leagues
  )
  where

import           Data.Aeson
import qualified Data.Set            as Set
import           LoLDatas
import           Network.HTTP.Simple

--フリーチャンピオンに関する情報を取得する。
challenger_leagues :: Api_key -> Region -> String -> IO LeagueListDTO
challenger_leagues api_key region queue = do
    url <- parseRequest $ "https://" ++ show region ++ "/lol/league/v4/challengerleagues/by-queue/"++queue++"?api_key=" ++ api_key
    res <- httpJSON url
    pure $ getResponseBody res

{- TODO!
    -entries_by_summoner_id :: Api_key -> Region -> String -> IO Set [LeagueEntryDTO]
entries_by_summoner_id api_key region summoner_id = do
    url <- parseRequest $ "https://" ++ show region ++ "/lol/league/v4/entries/by-summoner/" ++ summoner_id ++ "?api_key=" ++ api_key
    res <- httpJSON url
    pure $ getResponseBody res-}

grandmaster_leagues :: Api_key -> Region -> String -> IO LeagueListDTO
grandmaster_leagues api_key region queue = do
    url <- parseRequest $ "https://" ++ show region ++ "/lol/league/v4/grandmasterleagues/by-queue/"++queue++"?api_key=" ++ api_key
    res <- httpJSON url
    pure $ getResponseBody res

leagues_by_league_id :: Api_key -> Region -> String -> IO LeagueListDTO
leagues_by_league_id api_key region league_id = do
    url <- parseRequest $ "https://" ++ show region ++ "/lol/league/v4/leagues/" ++ league_id ++ "?api_key=" ++ api_key
    res <- httpJSON url
    pure $ getResponseBody res

master_leagues :: Api_key -> Region -> String -> IO LeagueListDTO
master_leagues api_key region queue = do
    url <- parseRequest $ "https://" ++ show region ++ "/lol/league/v4/masterleagues/by-queue/"++queue++"?api_key=" ++ api_key
    res <- httpJSON url
    pure $ getResponseBody res
