#!/usr/bin/env runhaskell

[Digit fifth powers](http://projecteuler.net/problem=30)
--------------------------------------------------------

Surprisingly there are only three numbers that can be written as the sum of
fourth powers of their digits:

    1634 = 1^4 + 6^4 + 3^4 + 4^4
    8208 = 8^4 + 2^4 + 0^4 + 8^4
    9474 = 9^4 + 4^4 + 7^4 + 4^4

As 1 = 1^4 is not a sum it is not included.

The sum of these numbers is 1634 + 8208 + 9474 = 19316.

Find the sum of all the numbers that can be written as the sum of fifth powers
of their digits.


Idea
-----

9^5 * 6 = 354294 has 6 digits


Code
----

> import Digits

> powerSumIsEqualToNumber :: Int -> Integer -> Bool
> powerSumIsEqualToNumber p n = n == (sum . map (^p) . digits) n

> main :: IO ()
> main = let r = sum
>              $ filter (powerSumIsEqualToNumber 5) [10 .. 9^(5 :: Integer) * 6]
>        in print r


Answer
------

    443839


Performance
-----------

    11.24s user 0.14s system 100% cpu 11.360 total
