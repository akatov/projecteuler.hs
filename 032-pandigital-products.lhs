#!/usr/bin/env runhaskell

[Pandigital products](http://projecteuler.net/problem=32)
---------------------------------------------------------

We shall say that an n-digit number is pandigital if it makes use of all the
digits 1 to n exactly once; for example, the 5-digit number, 15234, is 1 through
5 pandigital.

The product 7254 is unusual, as the identity, 39 x 186 = 7254, containing
multiplicand, multiplier, and product is 1 through 9 pandigital.

Find the sum of all products whose multiplicand/multiplier/product identity can
be written as a 1 through 9 pandigital.

HINT: Some products can be obtained in more than one way so be sure to only
include it once in your sum.


Code
----

> import Data.List

> pandigital :: Int -> Int -> Int -> Bool
> pandigital a b c =
>     let digits = show a ++ show b ++ show c
>     in "123456789" == sort digits

> pandigitalTriples :: [(Int, Int, Int)]
> pandigitalTriples =
>     [ (a, b, c)
>     | a <- [1 .. 9]
>     , b <- [1234 .. 9876]
>     , let c = a * b
>     , pandigital a b c
>     ] ++
>     [ (a, b, c)
>     | a <- [12 .. 98]
>     , b <- [123 .. 987]
>     , let c = a * b
>     , pandigital a b c
>     ]

> main :: IO ()
> main = let ps = nub $ map (\ (_,_,c) -> c) pandigitalTriples
>            result = sum ps
>        in do print result
>              return ()


Answer
------

    45228
