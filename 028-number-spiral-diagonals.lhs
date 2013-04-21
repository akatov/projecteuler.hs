#!/usr/bin/env runhaskell

[Number spiral diagonals](http://projecteuler.net/problem=28)
-------------------------------------------------------------

Starting with the number 1 and moving to the right in a clockwise direction a
5 by 5 spiral is formed as follows:

    21 22 23 24 25
    20  7  8  9 10
    19  6  1  2 11
    18  5  4  3 12
    17 16 15 14 13

It can be verified that the sum of the numbers on the diagonals is 101.

What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral formed
in the same way?


Code
----

> stepLengths :: [Integer]
> stepLengths = concatMap (replicate 4) [2,4 ..]

> diagonalNumbers :: [Integer]
> diagonalNumbers = scanl (+) 1 stepLengths

> stepsForSpiralOfSize :: Int -> Int
> stepsForSpiralOfSize n = 4 * div n 2 + 1

> main :: IO ()
> main = let result = sum
>                   $ take (stepsForSpiralOfSize 1001) diagonalNumbers
>        in do print result
>              return ()


Answer
------

    669171001
