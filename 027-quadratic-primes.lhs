#!/usr/bin/env runhaskell

[Quadratic primes](http://projecteuler.net/problem=27)
------------------------------------------------------

Euler published the remarkable quadratic formula:

    n² + n + 41

It turns out that the formula will produce 40 primes for the consecutive values
n = 0 to 39. However, when n = 40, 402 + 40 + 41 = 40(40 + 1) + 41 is divisible
by 41, and certainly when n = 41, 41² + 41 + 41 is clearly divisible by 41.

Using computers, the incredible formula  n² - 79n + 1601 was discovered, which
produces 80 primes for the consecutive values n = 0 to 79. The product of the
coefficients, -79 and 1601, is -126479.

Considering quadratics of the form:

    n² + an + b, where |a|  1000 and |b|  1000

    where |n| is the modulus/absolute value of n
    e.g. |11| = 11 and |-4| = 4

Find the product of the coefficients, a and b, for the quadratic expression that
produces the maximum number of primes for consecutive values of n, starting with
n = 0.

Idea
----

* n = 0 yields b, so b must be a prime.
* n = 1 yields 1 + a + b which must be > 1, so a > -b
* if b is odd, n^2 + an must be even, so a must be odd.
* We know that the sequence length has to be at least 40.


Code
----

> import Data.List
> import Data.Numbers.Primes

> quadratic :: Integer -> Integer -> Integer -> Integer
> quadratic a b n = n ^(2 :: Integer) + a * n + b

> primeSeqLength :: (Integer, Integer) -> Int
> primeSeqLength (a,b) = length
>                      $ takeWhile isPrime
>                      $ map (quadratic a b) [0 ..]

> cs = [ (l, (a,b))
>      | b <- takeWhile (< 1000) primes
>      , a <- [-b, -b+2 .. 999]
>      , let l = primeSeqLength (a,b)
>      , l >= 40
>      ]

> cmp (c, _) (d, _) = compare c d

> main = let (_, (a,b)) = maximumBy cmp cs
>            res = a * b 
>        in print res


Answer
------

    -59231


Performance
-----------

    3.33s user 0.06s system 100% cpu 3.392 total
