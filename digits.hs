module Digits where

digits :: Integer -> [Integer]
digits = map (read . (:[])) . show

sumOfDigits :: Integer -> Integer
sumOfDigits = sum . digits

numDigits :: Integer -> Int
numDigits = length . digits
