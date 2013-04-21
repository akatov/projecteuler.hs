module Factorial where

factorial :: Integral alpha => alpha -> alpha
factorial n = product [1 .. n]
