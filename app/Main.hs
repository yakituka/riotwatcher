module Main where

import API.Champion
import API.ChampionMastery
import API.Spectator
import API.Summoner
import LoLDatas
import Control.Lens
import Prelude hiding (id)

api_key = "RGAPI-332dedd0-7a60-4b45-86fb-7a34b94d4ed3" --ADD YOUR API KEY

main :: IO ()
main = do
  --今週のフリーチャンピオンの取得
  rotations <- champion_rotations api_key JP1
  putStr "今週のチャンピオン : " >> print ( rotations ^. freeChampionIds )

  --名前からサモナーの情報を取得
  summoner <- summoner_by_name api_key JP1 "ツナカユリコ" --ADD YOUR SOMMONER NAME
  
  putStr "サモナーネーム : " >> print ( summoner ^. name )
  putStr "サモナーレベル : " >> print ( summoner ^. summonerLevel )
  putStr "サモナーid : " >> print ( summoner ^. id )