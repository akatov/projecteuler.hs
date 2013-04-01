#!/usr/bin/env runhaskell

[Sum square difference](http://projecteuler.net/problem=3)
----------------------------------------------------------

The sum of the squares of the first ten natural numbers is,

    1^2 + 2^2 + ... + 10^2 = 385

The square of the sum of the first ten natural numbers is,

    (1 + 2 + ... + 10)^2 = 552 = 3025

Hence the difference between the sum of the squares of the first ten natural
numbers and the square of the sum is

    3025 - 385 = 2640.

Find the difference between the sum of the squares of the first one hundred
natural numbers and the square of the sum.


Code
----

> differenceBetweenSumOfSquaresAndSquaredSumOfNumbersUpTo n =
>     ((^2) . sum $ [1..n]) - (sum . map (^2) $ [1..n])

> main = do
>        return $ differenceBetweenSumOfSquaresAndSquaredSumOfNumbersUpTo 100


Answer
------

    25164150