# Haskell Snippets

A series of helpful Haskell functions and implementations for beginners.

## Sorting Algorithms

### Quicksort [(Gist)](https://gist.github.com/kaveet/681a5c991f3d7a6eb5bfc4d55897e427)

Complexity

| Case        | Complexity |
| ----------- |:----------:|
| Worst       |   O(n^2)   |
| Average     |  O(nlogn)  |

```haskell
quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) = quicksort [y | y <- xs, y <= x] ++ [x] ++ quicksort [y | y <- xs, y > x]
```
