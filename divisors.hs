module Divisors where

import Data.List

divisors :: Integer -> [Integer]
divisors n =
    let rlimit = sqrt $ fromIntegral n :: Double
        limit = floor rlimit
    in (1:) . nub . concat
     $ [ [x, div n x] | x <- [2..limit], rem n x == 0 ]

sumOfDivisors :: Integer -> Integer
sumOfDivisors = sum . divisors

amicable :: Integer -> Bool
amicable n = let m = sumOfDivisors n
                 o = sumOfDivisors m
             in o == n && m /= n

perfect :: Integer -> Bool
perfect n = sumOfDivisors n == n

deficient :: Integer -> Bool
deficient n = sumOfDivisors n < n

abundant :: Integer -> Bool
abundant n = sumOfDivisors n > n
