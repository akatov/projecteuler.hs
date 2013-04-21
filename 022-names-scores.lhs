#!/usr/bin/env runhaskell

[Names scores](http://projecteuler.net/problem=22)

Using [names.txt](http://projecteuler.net/project/names.txt), a 46K text file
containing over five-thousand first names, begin by sorting it into alphabetical
order. Then working out the alphabetical value for each name, multiply this
value by its alphabetical position in the list to obtain a name score.

For example, when the list is sorted into alphabetical order, COLIN, which is
worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would
obtain a score of 938  53 = 49714.

What is the total of all the name scores in the file?

Code
----

> import Data.List
> import Data.List.Split
> import Data.Char
> import Network.Curl

> readNames :: String -> [String]
> readNames = map read . splitOn ","

> score :: String -> Int
> score = foldl (\ a c -> a + ord c - 64) 0 -- capital letters only

> computeResult :: String -> Int
> computeResult = sum . zipWith (*) [1..] . map score . sort . readNames

> main :: IO ()
> main = do (_, s) <- curlGetString "http://projecteuler.net/project/names.txt" []
>           print $ computeResult s
>           return ()
>                  


Answer
------

    871198282
