#!/usr/bin/env runhaskell

[Circular primes](http://projecteuler.net/problem=35)
-----------------------------------------------------

The number, 197, is called a circular prime because all rotations of the digits:
197, 971, and 719, are themselves prime.

There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71,
73, 79, and 97.

How many circular primes are there below one million?


Code
----

> import Control.Applicative
> import Data.List
> import Data.Numbers.Primes

> rotations :: [alpha] -> [[alpha]]
> rotations = init . (zipWith (++) <$> tails <*> inits)

> digitRotations :: Integer -> [Integer]
> digitRotations = map read . rotations . show

> circularPrime :: Integer -> Bool
> circularPrime = all isPrime . digitRotations

> main :: IO ()
> main = let result = length
>                   $ filter circularPrime
>                   $ takeWhile (< 10^(6 :: Integer)) primes
>        in print result


Answer
------

    55


Performance
-----------

    14.61s user 0.22s system 100% cpu 14.807 total
