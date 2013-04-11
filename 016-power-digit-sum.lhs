#!/usr/bin/env runhaskell

[Power digit sum](http://projecteuler.net/problem=16)
-----------------------------------------------------

2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

What is the sum of the digits of the number 2^1000?


Code
----

> sumOfDigits :: Integer -> Integer
> sumOfDigits = sum . map (read . (:[])) . show

> main = let result = sumOfDigits $ 2^1000
>        in return result


Answer
------

    1366
