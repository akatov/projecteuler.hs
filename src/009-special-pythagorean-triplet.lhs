#!/usr/bin/env runhaskell

[Special Pythagorean triplet](http://projecteuler.net/problem=9)
----------------------------------------------------------------

A Pythagorean triplet is a set of three natural numbers, a  b  c, for which,

a^2 + b^2 = c^2
For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.

Ideas
-----

499 1 500

498 1 501
498 2 500
498 3 499

497 1 502
497 2 501
497 3 500
497 4 499
497 5 498

496 1 503
496 2 502
496 3 501
496 4 500
496 5 499
496 6 498
496 7 497


Code
----

> numbersSummingTo n = [ [a, b, n - a - b]
>                      | b <- [499, 498 .. 1]
>                      , a <- [1 .. n - 2 * b -1]
>                      ]

> pythagoreanTriplet [a,b,c] = a^2 + b^2 == c^2

> main = do
>   return . product . head . filter pythagoreanTriplet . numbersSummingTo $ 1000


Answer
------

    31875000
