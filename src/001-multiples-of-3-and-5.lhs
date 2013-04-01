#!/usr/bin/env runhaskell

## [Multiples of 3 and 5](http://projecteuler.net/problem=1)

If we list all the natural numbers below 10 that are multiples of 3 or 5,
we get 3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.


## Code

> res = sum . filter (\x -> mod x 5 == 0 || mod x 3 == 0). takeWhile (< 1000) $ [1..]

> main = do
>  return res


## Answer

    233168
