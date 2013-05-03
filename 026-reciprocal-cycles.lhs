#!/usr/bin/env runhaskell

[Reciprocal cycles](http://projecteuler.net/problem=26)

A unit fraction contains 1 in the numerator. The decimal representation of the
unit fractions with denominators 2 to 10 are given:

    1/2  =  0.5
    1/3  =  0.(3)
    1/4  =  0.25
    1/5  =  0.2
    1/6  =  0.1(6)
    1/7  =  0.(142857)
    1/8  =  0.125
    1/9  =  0.(1)
    1/10 =  0.1

Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. It can be seen that 1/7 has a 6-digit recurring cycle.

Find the value of d  1000 for which 1/d contains the longest recurring cycle in its decimal fraction part.


Code
----

> import Data.List
> import Data.Numbers.Primes

> longDivision :: Integral alpha => alpha -> alpha -> [(alpha, alpha)]
> longDivision x y | x == 0    = []
>                  | otherwise = let (d, m) = divMod x y
>                                in (d, m) : longDivision (m * 10) y

> cycleLength :: Int -> Int -> Int
> cycleLength x y = let decimable n = isInfixOf (nub $ primeFactors n) [2, 5]
>                       ms = drop y . map snd $ longDivision x y
>                       -- longest cycle of different remainders is y
>                   in if decimable y
>                      then 0
>                      else elemIndices (head ms) ms !! 1

> main :: IO ()
> main = let cs = map (cycleLength 1) [2..999]
>            m = maximum cs
>            i = head $ elemIndices m cs
>            r = i + 2
>        in print r


Answer
------

    983
