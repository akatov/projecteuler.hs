#!/usr/bin/env runhaskell

[Counting Sundays](http://projecteuler.net/problem=19)

You are given the following information, but you may prefer to do some research
for yourself.

* 1 Jan 1900 was a Monday.
* Thirty days has September,
  April, June and November.
  All the rest have thirty-one,
  Saving February alone,
  Which has twenty-eight, rain or shine.
  And on leap years, twenty-nine.
* A leap year occurs on any year evenly divisible by 4, but not on a century
  unless it is divisible by 400.

How many Sundays fell on the first of the month during the twentieth century
(1 Jan 1901 to 31 Dec 2000)?


Code
----

> leapyear y = mod y 4 == 0 && (mod y 100 /= 0 || mod y 400 == 0)

> daysInMonth y m | m `elem` [9, 4, 6, 11] = 30
>                 | m == 2 = 28 + if leapyear y then 1 else 0
>                 | otherwise = 31

> nextMonth y m | m == 12   = (y+1) 1
>               | otherwise = y (m+1)

> weekdayOfNextFirst weekday (y,m) = mod (weekday + daysInMonth y m) 7

> months = concatMap (\ y -> [(y,m) | m <- [1 .. 12]]) $ iterate (+1) 1900

> firstWeekdays = scanl weekdayOfNextFirst 1 months -- Sunday = 0

> main = let r = length . filter (== 0) . take 1200 . drop 12 $ firstWeekdays
>        in return r


Answer
------

    171
