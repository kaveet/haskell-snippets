# haskell-practice
Haskell Snippets for Beginners

## Sorting Algorithms

Quicksort [(Gist)](https://gist.github.com/kaveet/681a5c991f3d7a6eb5bfc4d55897e427)

```haskell
quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) = quicksort [y | y <- xs, y <= x] ++ [x] ++ quicksort [y | y <- xs, y > x]
```

