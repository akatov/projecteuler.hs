#!/usr/bin/env runhaskell

[Number letter counts](http://projecteuler.net/problem=17)

If the numbers 1 to 5 are written out in words: one, two, three, four, five,
then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

If all the numbers from 1 to 1000 (one thousand) inclusive were written out in
words, how many letters would be used?

NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and
forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20
letters. The use of "and" when writing out numbers is in compliance with
British usage.


Code
----

> say :: Integer -> String
> say n | n == 1 = "one"
>       | n == 2 = "two"
>       | n == 3 = "three"
>       | n == 4 = "four"
>       | n == 5 = "five"
>       | n == 6 = "six"
>       | n == 7 = "seven"
>       | n == 8 = "eight"
>       | n == 9 = "nine"
>       | n == 10 = "ten"
>       | n == 11 = "eleven"
>       | n == 12 = "twelve"
>       | n == 13 = "thirteen"
>       | n == 15 = "fifteen"
>       | n == 18 = "eighteen"
>       | n <= 19 = say units ++ "teen"
>       | n == 20 = "twenty"
>       | n == 30 = "thirty"
>       | n == 40 = "forty"
>       | n == 50 = "fifty"
>       | n == 80 = "eighty"
>       | units == 0 && n <= 90 = say tens ++ "ty"
>       | n < 100 = say (tens * 10) ++ "-" ++ say units
>       | n == 1000 = "one thousand"
>       | tens == 0 && units == 0 = say hundreds ++ " hundred"
>       | otherwise = say hundreds ++ " hundred and " ++ say (tens * 10 + units)
>     where units = n `mod` 10
>           tens = (n `div` 10) `mod` 10
>           hundreds = (n `div` 100) `mod` 10

> main = do (return .
>            length .
>            filter (/= ' ') .
>            filter (/= '-') .
>            concat .
>            map say)
>           $ [1 .. 1000]


Answer
------

    21124
