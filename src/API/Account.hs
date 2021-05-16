module API.Account
  ( account_by_puuid,
    account_by_riot_id,
  )
where

import Data.Aeson ()
import LoLDatas
import Network.HTTP.Simple

account_by_puuid :: Api_key -> GlobalRegion -> String -> IO AccountDTO
account_by_puuid api_key region puu_id = do
  url <- parseRequest $ "https://" ++ show region ++ "/riot/account/v1/accounts/by-puuid/" ++ puu_id ++ "?api_key=" ++ api_key
  res <- httpJSON url
  pure $ getResponseBody res

account_by_riot_id :: Api_key -> GlobalRegion -> String -> String -> IO AccountDTO
account_by_riot_id api_key region gameName tagLine = do
  url <- parseRequest $ "https://" ++ show region ++ "/riot/account/v1/accounts/by-riot-id/" ++ gameName ++ "/" ++ tagLine ++ "?api_key=" ++ api_key
  res <- httpJSON url
  pure $ getResponseBody res
