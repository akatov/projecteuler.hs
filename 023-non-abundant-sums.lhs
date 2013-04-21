#!/usr/bin/env runhaskell

[Non-abundant sums](http://projecteuler.net/problem=23)

A perfect number is a number for which the sum of its proper divisors is exactly
equal to the number. For example, the sum of the proper divisors of 28 would be
1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

A number n is called deficient if the sum of its proper divisors is less than n
and it is called abundant if this sum exceeds n.

As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest
number that can be written as the sum of two abundant numbers is 24. By
mathematical analysis, it can be shown that all integers greater than 28123 can
be written as the sum of two abundant numbers. However, this upper limit cannot
be reduced any further by analysis even though it is known that the greatest
number that cannot be expressed as the sum of two abundant numbers is less than
this limit.

Find the sum of all the positive integers which cannot be written as the sum of
two abundant numbers.

> import Divisors

> ans :: [Integer]
> ans = filter abundant [1 ..]

> isSumOfTwoAns :: Integer -> Bool
> isSumOfTwoAns n = not $ null [ x
>                            | x <- takeWhile (< n) ans
>                            , abundant (n - x)
>                            ]

> main :: IO ()
> main = let result = sum $ filter (not . isSumOfTwoAns) [1 .. 28123]
>        in do print result
>              return ()


Answer
------

    4179871


Performance
-----------

    400.47s user 1.85s system 100% cpu 6:41.46 total
