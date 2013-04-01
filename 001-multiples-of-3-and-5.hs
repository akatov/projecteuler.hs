#!/usr/bin/env runhaskell

res = sum . filter (\x -> mod x 5 == 0 || mod x 3 == 0). takeWhile (< 1000) $ [1..]

main = do
  return res
