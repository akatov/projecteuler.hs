#!/usr/bin/env runhaskell

[Longest Collatz sequence](http://projecteuler.net/problem=14)
------------------------------------------------------------------------

The following iterative sequence is defined for the set of positive integers:

    n -> n/2 (n is even)
    n -> 3n + 1 (n is odd)

Using the rule above and starting with 13, we generate the following sequence:

    13 -> 40 -> 20 -> 10 -> 5 -> 16 -> 8 -> 4 -> 2 -> 1

It can be seen that this sequence (starting at 13 and finishing at 1) contains
10 terms. Although it has not been proved yet (Collatz Problem), it is thought
that all starting numbers finish at 1.

Which starting number, under one million, produces the longest chain?

*NOTE*: Once the chain starts the terms are allowed to go above one million.


Code
----

> import qualified Data.MemoCombinators as Memo
> import Data.List

> collatzSequenceLength :: Integer -> Integer
> collatzSequenceLength = Memo.integral csl
>     where csl 1 = 1
>           csl n | mod n 2 == 0 = 1 + collatzSequenceLength (div n 2)
>                 | otherwise = 1 + collatzSequenceLength (3 * n + 1)

> main :: IO ()
> main = let csls = map collatzSequenceLength [1 ..]
>            mx = maximum $ take 1000000 csls
>            Just ix = elemIndex mx csls
>            result = ix + 1
>        in do print result
>              return ()


Answer
------

    837799


Performance
-----------

    26.76s user 0.63s system 100% cpu 27.343 total
