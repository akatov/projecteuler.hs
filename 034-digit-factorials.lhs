#!/usr/bin/env runhaskell

[Digit factorials](http://projecteuler.net/problem=34)
------------------------------------------------------

145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.

Find the sum of all numbers which are equal to the sum of the factorial of
their digits.

Note: as 1! = 1 and 2! = 2 are not sums they are not included.


Idea
----

7 * 9! = 7 * 365880 = 2540160


Code
----

> import Factorial
> import Digits

> curious :: Integer -> Bool
> curious n =
>     n > 2 &&
>     n == (sum . map factorial . digits) n

> main :: IO ()
> main = let result = sum $ filter curious [1 .. 7 * factorial 9]
>        in do print result
>              return ()


Answer
------

    40730


Performance
-----------

    82.03s user 0.90s system 100% cpu 1:22.75 total
