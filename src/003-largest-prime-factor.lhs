#!/usr/bin/env runhaskell

[Largest prime factor](http://projecteuler.net/problem=3)
---------------------------------------------------------

The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ?


Code
----

> import Data.Numbers.Primes

> main = do
>   return . last . primeFactors $ 600851475143


Answer
------

    6857
