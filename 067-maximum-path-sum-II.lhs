#!/usr/bin/env runhaskell

[Maximum path sum II](http://projecteuler.net/problem=67)

By starting at the top of the triangle below and moving to adjacent numbers on
the row below, the maximum total from top to bottom is 23.

       3
      7 4
     2 4 6
    8 5 9 3

That is, 3 + 7 + 4 + 9 = 23.

Find the maximum total from top to bottom in
[triangle.txt](http://projecteuler.net/project/triangle.txt), a 15K text file
containing a triangle with one-hundred rows.

NOTE: This is a much more difficult version of
[Problem 18](https://github.com/akatov/projecteuler.hs/blob/master/src/018-maximum-path-sum-I.lhs).
It is not possible to try every route to solve this problem, as there are 299
altogether! If you could check one trillion (1012) routes every second it would
take over twenty billion years to check them all. There is an efficient
algorithm to solve it. ;o)


Code
----

> import Network.Curl

> downStep :: [Int] -> [Int] -> [Int]
> downStep higher lower = let a = zipWith (+) (minBound:higher) lower
>                             b = zipWith (+) (higher++[minBound]) lower
>                         in zipWith max a b

> lineToInts :: String -> [Int]
> lineToInts = map read . words

> computeResult :: String -> Int
> computeResult = maximum . foldl1 downStep . map lineToInts . lines

> main :: IO ()
> main = do (_, s) <- curlGetString "http://projecteuler.net/project/triangle.txt" []
>           print $ computeResult s
>           return ()


Answer
------

    7273
