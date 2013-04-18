#!/usr/bin/env runhaskell

[Truncatable primes](http://projecteuler.net/problem=37)
--------------------------------------------------------

The number 3797 has an interesting property. Being prime itself, it is possible
to continuously remove digits from left to right, and remain prime at each
stage: 3797, 797, 97, and 7. Similarly we can work from right to left: 3797,
379, 37, and 3.

Find the sum of the only eleven primes that are both truncatable from left to
right and right to left.

NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.


Idea
----

* Every truncatable prime has to start with a right truncatable prime and
  end with a left truncatable prime.
* All right truncatable two digit primes are:
      23, 29, 31, 37, 53, 59, 71, 73, 79
* All left truncatable two digit primes are:
      23, 37, 53, 73, 97
* Any middle digit has to be odd.
* Do a search of all possible numbers starting from the back until we start
  hitting compound numbers only.

Code
----

> import Data.Numbers.Primes
> import Data.List

> attach :: Integer -> Integer -> Integer
> attach as bs = as * 10 ^ (length $ show bs) + bs

> isLeftTruncatablePrime n = isTruncatableWith n tails

> isRightTruncatablePrime n = isTruncatableWith n inits

> isTruncatableWith n f =
>     all isPrime . map read . filter (not . null) . f $ show n

> righTruncatablePrimesStartingWith n
>     | not $ isRightTruncatablePrime n = []
>     | otherwise =
>         let os = concatMap (righTruncatablePrimesStartingWith . attach n) [1, 3, 5, 7, 9]
>         in n:os

> rightTruncatablePrimes = concatMap righTruncatablePrimesStartingWith [23, 29, 31, 37, 53, 59, 71, 73, 79]

> main = let res = sum . filter isLeftTruncatablePrime $ rightTruncatablePrimes
>        in do print res
>              return ()


Answer
------

    748317
