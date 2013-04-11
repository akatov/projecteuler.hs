module Divisors where

import Data.List

divisors n =
    let limit = floor . sqrt . fromIntegral $ n
    in (1:) . nub . concat $ [ [x, div n x] | x <- [2..limit], rem n x == 0 ]

sumOfDivisors = sum . divisors

amicable n = let m = sumOfDivisors n
                 o = sumOfDivisors m
             in o == n && m /= n

perfect n = sumOfDivisors n == n

deficient n = sumOfDivisors n < n

abundant n = sumOfDivisors n > n
