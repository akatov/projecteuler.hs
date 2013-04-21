#!/usr/bin/env runhaskell

[10001st prime](http://projecteuler.net/problem=7)
--------------------------------------------------

By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that
the 6th prime is 13.

What is the 10 001st prime number?


Code
----

> import Data.Numbers.Primes

> main :: IO ()
> main = let result = primes !! 10000 :: Integer
>        in do print result
>              return ()


Answer
------

    104743
