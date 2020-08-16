module Main where

import API.Champion
import API.ChampionMastery
import API.Spectator
import API.Summoner
import LoLDatas

api_key = "RGAPI-9bfe7ed8-c82a-484b-b52f-6d760d72c61e" --ADD YOUR API KEY

main :: IO ()
main = do
  --今週のフリーチャンピオンの取得
  rotations <- champion_rotations api_key JP1
  print rotations

  --名前からサモナーの情報を取得
  summoner <- summoner_by_name api_key JP1 "kingsbane" --ADD YOUR SOMMONER NAME
  let summoner_id = LoLDatas.id summoner
  print summoner_id

  --サモナーIDからライブゲームの情報を取得
  current_game_info <- spectator_by_summoner api_key JP1 summoner_id
  print current_game_info