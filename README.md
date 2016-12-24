# Haskell Snippets

A series of helpful Haskell functions and implementations for beginners. Note that these implementations emphasize understanding rather than conciseness.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) [![star this repo](http://githubbadges.com/star.svg?user=kaveet&repo=haskell-snippets&style=flat)](https://github.com/kaveet/haskell-snippets)
[![fork this repo](http://githubbadges.com/fork.svg?user=kaveet&repo=haskell-snippets&style=flat)](https://github.com/kaveet/haskell-snippets/fork)

## Contents

* [Sorting Algorithms](#sorting-algorithms)
  * [Quicksort](#quicksort-gist-wiki)
  * [Insertion Sort](#insertion-sort-gist-wiki)
  * [Selection Sort](#selection-sort-gist-wiki)
* [List Functions](#list-functions)
  * [Safetail](#safetail-gist)
  * [Reverse](#list-reverse-gist)
  * [Length](#list-length-gist)
  * [Sum](#list-sum-gist)
  * [Palindrome](#check-palindrome-gist)
  * [Check Sorted](#check-sorted-gist)
  * [Duplicate Each Element](#duplicate-each-element-gist)
* [Miscellaneous](#miscellaneous)
  * [Fibonacci](#fibonacci-sequence-gist)
  * [Factorial](#factorial-gist)
  * [Absolute Value](#absolute-value-gist)
* [Practice Problems](#practice-problems)
  1. [Implement `map` with `foldr`](#implement-map-with-foldr-gist)
  1. [Implement `filter` with `foldr`](#implement-filter-with-foldr-gist)
* [Contributing](#contributing)
* [Motivation](#motivation)

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
### Insertion Sort [(Gist)](https://gist.github.com/kaveet/aa15c5007e08df1aef37bd9d9c98af0f) [(Wiki)](https://en.wikipedia.org/wiki/Insertion_sort)

#### Complexity

| Case        | Complexity |
| ----------- |:----------:|
| Worst       |   O(n^2)   |
| Average     |   O(n^2)   |

#### Implementation (Using Insert)
Note: this implementation depends on the function `insert` from the module `Data.List`. See the gist for an example on importing this module selectively with hiding.

```haskell
insertsort :: Ord a => [a] -> [a]
insertsort  =  foldr insert []
```

### Selection Sort [(Gist)](https://gist.github.com/kaveet/f3601316ce415e16fd4d927a3522cd0c) [(Wiki)](https://en.wikipedia.org/wiki/Selection_sort)

#### Complexity

| Case        | Complexity |
| ----------- |:----------:|
| Worst       |   O(n^2)   |
| Average     |   O(n^2)   |

#### Implementation

```haskell
selSort :: (Ord a) => [a] -> [a]
selSort [] = []
selSort xs = let x = maximum xs in selSort (remove x xs) ++ [x] 
  where remove _ [] = []
        remove a (x:xs)
          | x == a = xs
          | otherwise = x : remove a xs
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

#### Implementation

```haskell
reverse :: [a] -> [a]
reverse [] = []
reverse (x:xs) = reverse xs ++ [x]
```

### List Length [(Gist)](https://gist.github.com/kaveet/e1a7e272c44eb79f594d4db3b9d03db8)

#### Implementation (Recursive Strategy)

```haskell
length           :: [a] -> Int
length []        =  0
length (_:xs)    =  1 + length xs
```

### List Sum [(Gist)](https://gist.github.com/kaveet/00570b553d52aeedaeb0f23a6bdd51cd)

#### Implementation

```haskell
sum :: [Int] -> Int
sum [] = 0
sum (x:xs) = x + sum xs
```

### Check Palindrome [(Gist)](https://gist.github.com/kaveet/acf4d9cd6bbfdd8351fe31b6372a3a0e)

#### Implementation (With Prelude Functions)

Note that the prelude function `init` returns a list without its last element, while the function `tail` returns the list without its first element. The composition of the functions (explicity using the `$` operator) results in a list without its first _and_ last elements.

```haskell
palindrome :: Eq a => [a] -> Bool
palindrome []  = True
palindrome [_] = True
palindrome xs  = (head xs) == (last xs) && (palindrome $ init $ tail xs)
```

### Check Sorted [(Gist)](https://gist.github.com/kaveet/b77f2f3add61d9c3afdb6852b7f36b03)
Check if list is sorted in ascending order (smallest to largest values).

#### Implementation

```haskell
sorted :: (Ord a) => [a] -> Bool
sorted [] = True
sorted [x] = True
sorted (x:y:xs) = if x <= y then sorted (y:xs) else False
```

### Duplicate Each Element [(Gist)](https://gist.github.com/kaveet/5b87195010d5eff624534e0dfb1186c7)
Repeat each element in a list twice ([a,b,c] -> [a,a,b,b,c,c])

```haskell
duplicate :: [a] -> [a]
duplicate []     = []
duplicate (x:xs) = [x, x] ++ duplicate xs
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

### Factorial [(Gist)](https://gist.github.com/kaveet/96ca4b81ba395bbd397013749f20717c)
Compute the factorial of n recursively.

```haskell
factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n-1)
```

### Absolute Value [(Gist)](https://gist.github.com/kaveet/2b095ee5e0a063e6a904abeca9d11de5)
Compute the absolute value of an integer n.

```haskell
absoluteValue :: Int -> Int
absoluteValue n | n >= 0 = n
                | otherwise  = -n
```

## Practice Problems

### Implement `map` with `foldr` [(Gist)](https://gist.github.com/kaveet/061beb43f80aaffb3ecdecc99aefd2e0)
Write a function `map'` that mimics the functionality of `map` from the standard prelude, making use of `foldr`

#### Solution
```haskell
map'            :: (a -> b) -> [a] -> [b]
map' f []       = []
map' f (x:xs)   = foldr (\y ys -> (f y):ys) [] xs
```

#### Explanation

Coming soon...

### Implement `filter` with `foldr` [(Gist)](https://gist.github.com/kaveet/a397dab4d01ddd9e692a4d1470d83ced)
Write a function `filter'` that mimics the functionality of `filter` from the standard prelude, making use of `foldr`

#### Solution

```haskell
filter' p = foldr (\x xs -> if p x then x : xs else xs) []
```

#### Explanation

Coming soon...

## Contributing

Contributions are encouraged and welcome! The motivation of this repository is to collect enlightening Haskell code and to teach by example. Open a pull request after you have done the following:

* Compile code in GHC and verify correctness
* Added code snippet to README.md
* Added necessary Table of Content entries
* Added necessary explanation and/or links

Feel free to @mention yourself to credit your contributions!

## Motivation

This repository is both a exercise in Haskell and a resource for beginners in search of transparent, clear examples of common implementations in the Haskell language. Focusing on typical programming problems allows us to juxtapose the thought patterns of this functional language against imperative languages normal to a Computer Science undergraduate program.
