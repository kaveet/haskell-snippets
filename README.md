# Haskell Snippets

A series of helpful Haskell functions and implementations for beginners.

## Contents

* [Sorting Algorithms](#sorting-algorithms)
* [List Functions](#list-functions)

## Sorting Algorithms

### Quicksort [(Gist)](https://gist.github.com/kaveet/681a5c991f3d7a6eb5bfc4d55897e427) [(Wiki)](https://en.wikipedia.org/wiki/Quicksort)

#### Complexity

| Case        | Complexity |
| ----------- |:----------:|
| Worst       |   O(n^2)   |
| Average     |  O(nlogn)  |

#### Implementation

```haskell
quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) = quicksort [y | y <- xs, y <= x] ++ [x] ++ quicksort [y | y <- xs, y > x]
```

## List Functions

### Safetail [(Gist)](https://gist.github.com/kaveet/6cab6fe7e494b61470870f45a7c2d60f)

#### Implementation (Conditional)

```haskell
module Safetail where

safetail :: Eq a => [a] -> [a]
safetail xs = if xs == [] then [] else tail xs
```
#### Implementation (Guarded)

```haskell
module Safetail where

safetail :: Eq a => [a] -> [a]
safetail xs
  | xs == []  = []
  | otherwise = tail xs
```

## Miscellaneous

### Fibonacci Sequence [(Gist)](https://gist.github.com/kaveet/924cd0991f320d2195c6823940175725)

#### Implementation

```haskell
module Fibonacci where

fib :: Integer -> Integer
fib 0 = 1
fib 1 = 1
fib n = fib (n-1) + fib (n-2)
```
