module Main where

import Lib

main :: IO ()
main = do
    ans <- getFreeRotationChampions
    print ans

