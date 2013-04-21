#!/usr/bin/env runhaskell

[Coin sums](http://projecteuler.net/problem=31)
-----------------------------------------------

In England the currency is made up of pound, £, and pence, p, and there are
eight coins in general circulation:

    1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).

It is possible to make £2 in the following way:

    1x£1 + 1x50p + 2x20p + 1x5p + 1x2p + 3x1p

How many different ways can £2 be made using any number of coins?


Code
----

> coins :: [Int]
> coins = [1, 2, 5, 10, 20, 50, 100, 200]

> numParts :: Int -> Int -> Integer
> numParts 0 _ = 1
> numParts n s                  -- s = smallest coin to use
>     | n < s = 0
>     | otherwise =
>         let cs = dropWhile (< s) coins
>         in sum $ map (\ c -> numParts (n-c) c) cs

> main :: IO ()
> main = let result = numParts 200 0
>        in do print result
>              return ()


Answer
------

    73682


Performance
-----------

    8.03s user 0.06s system 100% cpu 8.082 total
