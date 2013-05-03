#!/usr/bin/env runhaskell

[Largest palindrome product](http://projecteuler.net/problem=4)
---------------------------------------------------------------

A palindromic number reads the same both ways. The largest palindrome made from
the product of two 2-digit numbers is 9009 = 91 x 99.

Find the largest palindrome made from the product of two 3-digit numbers.


Idea
----

Generate the pairs in the following order to assure (decreasing) monotonicity:

    999 * 999
    999 * 998
    998 * 998, 999 * 997
    998 * 997, 999 * 996
    997 * 997, 998 * 996, 999 * 995
    997 * 996, 998 * 995, 999 * 994
    ...

Code
----

> isPalindromicNumber :: Integer -> Bool
> isPalindromicNumber n = let s = show n
>                         in s == reverse s

> f :: Integer -> Integer -> Integer -> Integer -> [Integer]
> f l u x y = [ (x + d) * (y - d) | d <- [0 .. min (u - x) (y - l)]]

> g :: Integer -> Integer -> Integer -> [Integer]
> g l u x = f l u x x ++ f l u x (x - 1)

> h :: Integer -> Integer -> [Integer]
> h l u = concatMap (g l u) [u, u - 1 .. l]

> main :: IO ()
> main = let result = head
>                   $ filter isPalindromicNumber
>                   $ h 100 999
>        in print result


Answer
------

    906609
