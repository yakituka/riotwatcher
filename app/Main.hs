module Main where

import API.Account
import API.Champion
import API.ChampionMastery
import API.League
import API.Spectator
import API.Summoner
import Control.Lens
import LoLDatas
import System.Environment
import Prelude hiding (id)

api_key = "RGAPI-49747458-71d7-4907-86cc-de41faa53fb8" --ADD YOUR API KEY

main :: IO ()
main = do
  --今週のフリーチャンピオンの取得
  rotations <- champion_rotations api_key JP1
  putStr "今週のチャンピオン : " >> print (rotations ^. freeChampionIds)

  --名前からサモナーの情報を取得
  summoner <- summoner_by_name api_key JP1 "ツナカユリコ" --ADD YOUR SOMMONER NAME
  putStr "サモナーネーム : " >> print (summoner ^. name)
  putStr "サモナーレベル : " >> print (summoner ^. summonerLevel)
  putStr "サモナーid : " >> print (summoner ^. id)
  putStr "puuid : " >> print (summoner ^. puuid)
