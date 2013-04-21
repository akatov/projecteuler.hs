module Fibonacci where

fibs :: Integral alpha => [alpha]
fibs = 0 : scanl (+) 1 fibs
