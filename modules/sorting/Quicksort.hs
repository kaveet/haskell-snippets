module Quicksort where

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) = quicksort [y | y <- xs, y <= x] ++ [x] ++ quicksort [y | y <- xs, y > x]

quicksort' :: (Ord a) => [a] -> [a]
quicksort' [] = []
quicksort' (x:xs) = (quicksort' small) ++ [x] ++ (quicksort' big)
    where
        small  = filter (< x) xs
        big = filter (>= x) xs
