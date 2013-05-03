#!/usr/bin/env runhaskell

[Double-base palindromes](http://projecteuler.net/problem=36)

The decimal number, 585 = 1001001001_2 (binary), is palindromic in both bases.

Find the sum of all numbers, less than one million, which are palindromic in
base 10 and base 2.

(Please note that the palindromic number, in either base, may not include
leading zeros.)


Code
----

> import Numeric

> showBase :: Integer -> Integer -> String
> showBase b n = showIntAtBase b (head . show) n ""

> isPalindromicNumberInBase :: Integer -> Integer -> Bool
> isPalindromicNumberInBase b n =
>     let s = showBase b n
>     in s == reverse s

> isPalindromicNumberInBases :: [Integer] -> Integer -> Bool
> isPalindromicNumberInBases bs n = all (`isPalindromicNumberInBase` n) bs

> main :: IO ()
> main = let result = sum
>                   $ filter (isPalindromicNumberInBases [2, 10])
>                     [1 .. 10^(6 :: Integer)]
>        in print result


Answer
------

    872187


Performance
-----------

    3.85s user 0.07s system 100% cpu 3.920 total
