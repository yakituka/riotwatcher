module Main where

import LoLDatas
import Champion
import Summoner
import Spectator

api_key = "RGAPI-c8c3e1ca-6254-4584-8150-c792d44847b3"

main :: IO ()
main = do
    rotations <- champion_rotations api_key JP1
    print rotations
    summoner <- summoner_by_name api_key JP1 "TKD1021"
    let (Just summoner_id) = LoLDatas.id <$> summoner
    print summoner_id
    current_game_info <- spectator_by_summoner api_key JP1 summoner_id
    print current_game_info