#!/usr/bin/env runhaskell

[Summation of primes](http://projecteuler.net/problem=10)
---------------------------------------------------------

The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

Find the sum of all the primes below two million.


Code
----

> import Data.Numbers.Primes

> main :: IO ()
> main = let result = sum
>                   $ takeWhile (< 2000000) primes
>                   :: Integer
>        in print result


Answer
------

    142913828922
