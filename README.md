# Haskell Snippets

A series of helpful Haskell functions and implementations for beginners.

## Contents

* [Sorting Algorithms](#sorting-algorithms)
* [List Functions](#list-functions)
* [Contributing](#contributing)

## Sorting Algorithms

### Quicksort [(Gist)](https://gist.github.com/kaveet/681a5c991f3d7a6eb5bfc4d55897e427) [(Wiki)](https://en.wikipedia.org/wiki/Quicksort)

#### Complexity

| Case        | Complexity |
| ----------- |:----------:|
| Worst       |   O(n^2)   |
| Average     |  O(nlogn)  |

#### Implementation (List Comprehension)

```haskell
quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) = quicksort [y | y <- xs, y <= x] ++ [x] ++ quicksort [y | y <- xs, y > x]
```
#### Implementation
Credit [@aadithpm](https://github.com/aadithpm)

```haskell
quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) = (quicksort small) ++ [x] ++ (quicksort big)
where
        small  = filter (< x) xs
        big = filter (>= x) xs
```

## List Functions

### Safetail [(Gist)](https://gist.github.com/kaveet/6cab6fe7e494b61470870f45a7c2d60f)
A tail function with accommodations for the empty list.

#### Implementation (Conditional)

```haskell
safetail :: Eq a => [a] -> [a]
safetail xs = if xs == [] then [] else tail xs
```
#### Implementation (Guarded)

```haskell
safetail :: Eq a => [a] -> [a]
safetail xs
  | xs == []  = []
  | otherwise = tail xs
```

### List Reverse [(Gist)](https://gist.github.com/kaveet/2fec32c18a35a51476711a912ff442c9)
Reverse a list using pattern matching.

```haskell
reverse :: [a] -> [a]
reverse [] = []
reverse (x:xs) = reverse xs ++ [x]
```

## Miscellaneous

### Fibonacci Sequence [(Gist)](https://gist.github.com/kaveet/924cd0991f320d2195c6823940175725)

#### Implementation

```haskell
fib :: Integer -> Integer
fib 0 = 1
fib 1 = 1
fib n = fib (n-1) + fib (n-2)
```

## Contributing

Contributions are encouraged and welcome! The motivation of this repository is to collect enlightening Haskell code and to teach by example. Open a pull request after you have done the following:

* Compile code in GHC and verify correctness
* Added code snippet to README.md
* Added necessary Table of Content entries
* Added necessary explanation and/or links

Feel free to @mention yourself to credit your contributions!
