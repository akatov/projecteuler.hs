#!/usr/bin/env runhaskell

[Amicable numbers](http://projecteuler.net/problem=21)

Let d(n) be defined as the sum of proper divisors of n (numbers less than n
which divide evenly into n).
If d(a) = b and d(b) = a, where a  b, then a and b are an amicable pair and each
of a and b are called amicable numbers.

For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55
and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and
142; so d(284) = 220.

Evaluate the sum of all the amicable numbers under 10000.


Code
----

> import Data.List

> divisors n =
>     let limit = floor . sqrt . fromIntegral $ n
>     in (1:) . nub . concat $ [ [x, div n x] | x <- [2..limit], rem n x == 0 ]

> amicable n =
>     let m = sum . divisors $ n
>         o = sum . divisors $ m
>     in o == n && m /= n

> main = return . sum . filter amicable $ [1 .. 10000]

Answer
------

    31626
