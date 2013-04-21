#!/usr/bin/env runhaskell

[Lexicographic permutations](http://projecteuler.net/problem=24)

A permutation is an ordered arrangement of objects. For example, 3124 is one
possible permutation of the digits 1, 2, 3 and 4. If all of the permutations are
listed numerically or alphabetically, we call it lexicographic order. The
lexicographic permutations of 0, 1 and 2 are:

    012   021   102   120   201   210

What is the millionth lexicographic permutation of the digits
0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?


Code
----

> selectEach :: [alpha] -> [(alpha, [alpha])]
> selectEach [x] = [(x, [])]
> selectEach (x:xs) = let f (y,ys) = (y, x:ys)
>                     in (x, xs) : map f (selectEach xs)

> -- | the argument is assumed to be in increasing order
> permutations :: [alpha] -> [[alpha]]
> permutations [] = [[]]
> permutations xs = let f (y, ys) = map (y:) $ permutations ys
>                   in concatMap f $ selectEach xs

> pToInt :: Num alpha => [alpha] -> alpha
> pToInt [] = 0
> pToInt (x:xs) = 10 ^ length xs * x + pToInt xs

> main :: IO ()
> main = let result = pToInt $ permutations [0 .. 9] !! 999999 :: Integer
>        in do print result
>              return ()


Answer
------

    2783915460


Performance
-----------

    5.91s user 0.07s system 100% cpu 5.968 total
