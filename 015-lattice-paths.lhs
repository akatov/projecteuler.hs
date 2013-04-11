#!/usr/bin/env runhaskell

[Lattice paths](http://projecteuler.net/problem=15)
------------------------------------------------------------------------

Starting in the top left corner of a 2x2 grid, and only being able to move to the
right and down, there are exactly 6 routes to the bottom right corner.

<img src="http://projecteuler.net/project/images/p_015.gif">

How many such routes are there through a 20x20 grid?

Solution
--------
We need to perform 20 moves to the right out of a total 40 moves. The answer is

    Choose(40, 20)


Code
----

> factorial n = product [1..n]

> choose n k = div (factorial n) (factorial k * factorial (n - k))

> pathsThruGrid x y = choose (x + y) x

> main = let result = pathsThruGrid 20 20
>        in return result


Answer
------

    137846528820
