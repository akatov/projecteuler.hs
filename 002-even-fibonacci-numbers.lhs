#!/usr/bin/env runhaskell

## [Problem 2](http://projecteuler.net/problem=2) Even Fibonacci numbers

Each new term in the Fibonacci sequence is generated by adding the previous two
terms. By starting with 1 and 2, the first 10 terms will be:

    1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

By considering the terms in the Fibonacci sequence whose values do not exceed
four million, find the sum of the even-valued terms.

## Code

> fibs = 0:1:(zipWith (+) fibs (tail fibs))

> res = sum . filter (\x -> mod x 2 == 0) . takeWhile (<= 4000000) $ fibs

> main = do
>   return res


## Answer

4613732
