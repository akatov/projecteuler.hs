#!/usr/bin/env runhaskell

fibs = 0:1:(zipWith (+) fibs (tail fibs))

res = sum . filter (\x -> mod x 2 == 0) . takeWhile (<= 4000000) $ fibs

main = do
  return res
