#!/usr/bin/env runhaskell

[Factorial digit sum](http://projecteuler.net/problem=20)

n! means n  (n  1)  ...  3  2  1

For example, 10! = 10 x 9 x ... x 3 x 2 x 1 = 3628800,
and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

Find the sum of the digits in the number 100!


Code
----

> sumOfDigits :: Integer -> Integer
> sumOfDigits = sum . map (read . (:[])) . show

> factorial n = product [1 .. n]

> main = let result = sumOfDigits . factorial $ 100
>        in return result


Answer
------

    648
