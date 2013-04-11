#!/usr/bin/env runhaskell

[Smallest multiple](http://projecteuler.net/problem=5)
------------------------------------------------------

2520 is the smallest number that can be divided by each of the numbers from
1 to 10 without any remainder.

What is the smallest positive number that is evenly divisible by all of the
numbers from 1 to 20?


Code
----

> import Data.Numbers.Primes
> import Data.List
> import Control.Arrow

> f ps [] = ps
> f [] qs = qs
> f ((p,a):ps) ((q,b):qs) | p > q = (q,b) : f ((p,a):ps) qs
>                         | p < q = (p,a) : f ps ((q,b):qs)
>                         | otherwise = (p, max a b) : f ps qs

> highestCommonExponents = foldr1 f . map (map (head &&& length) .
>                                          group .
>                                          primeFactors)

> computeProduct = let g acc (p,a) = acc * p ^ a
>                  in foldl g 1

> main = let result = computeProduct . highestCommonExponents $ [1 .. 20]
>        in return result


Answer
------

    232792560
