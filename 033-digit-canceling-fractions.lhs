#!/usr/bin/env runhaskell

[Digit canceling fractions](http://projecteuler.net/problem=33)
---------------------------------------------------------------

The fraction 49/98 is a curious fraction, as an inexperienced mathematician in
attempting to simplify it may incorrectly believe that 49/98 = 4/8, which is
correct, is obtained by cancelling the 9s.

We shall consider fractions like, 30/50 = 3/5, to be trivial examples.

There are exactly four non-trivial examples of this type of fraction, less than
one in value, and containing two digits in the numerator and denominator.

If the product of these four fractions is given in its lowest common terms, find
the value of the denominator.


Code
----

> import Data.List

> curiousFraction :: Integer -> Integer -> Bool
> curiousFraction n d =
>     let nn = show n
>         dd = show d
>         c = intersect nn dd
>         nnn = nn \\ c
>         ddd = dd \\ c
>         nnnn = read nnn
>         dddd = read ddd
>         g = gcd n d
>         gg = gcd nnnn dddd
>     in c /= "0" &&
>        length nn == 2 &&
>        length dd == 2 &&
>        length nnn == 1 &&
>        length ddd == 1 &&
>        n `div` g == nnnn `div` gg &&
>        d `div` g == dddd `div` gg &&
>        True

> main :: IO ()
> main = let cs = filter (uncurry curiousFraction) [ (n, d)
>                                                  | n <- [11 .. 99]
>                                                  , d <- [n .. 99]
>                                                  ]
>            (p,q)  = foldl1 (\ (a,b) (c,d) -> (a*c, b*d)) cs
>            g = gcd p q
>            result = q `div` g
>        in print result


Answer
------

    100
