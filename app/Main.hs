module Main where

import LoLDatas
import Summoner

api_key = "RGAPI-c8c3e1ca-6254-4584-8150-c792d44847b3"

main :: IO ()
main = do
    ans <- summoner_by_name api_key JP1 "reo ak"
    print $ ans

