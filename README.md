# Haskell Snippets

A series of helpful Haskell functions and implementations for beginners. Note that these implementations emphasize understanding rather than conciseness.

## Contents

* [Sorting Algorithms](#sorting-algorithms)
  * [Quicksort](#quicksort-gist-wiki)
* [List Functions](#list-functions)
  * [Safetail](#safetail-gist)
  * [Reverse](#list-reverese-gist)
  * [Length](#list-length-gist)
  * [Palindrome](#check-palindrome-gist)
  * [Check Sorted](#check-sorted-gist)
* [Miscellaneous](#miscellaneous)
  * [Fibonacci](#fibonacci-sequence-gist)
  * [Factorial](#factorial-gist)
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

```haskell
sorted :: (Ord a) => [a] -> Bool
sorted [] = True
sorted [x] = True
sorted (x:y:xs) = if x <= y then sorted (y:xs) else False
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

## Contributing

Contributions are encouraged and welcome! The motivation of this repository is to collect enlightening Haskell code and to teach by example. Open a pull request after you have done the following:

* Compile code in GHC and verify correctness
* Added code snippet to README.md
* Added necessary Table of Content entries
* Added necessary explanation and/or links

Feel free to @mention yourself to credit your contributions!
