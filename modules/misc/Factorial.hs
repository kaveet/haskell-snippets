-- Compute the factorial of n recrusively

module Factorial where

factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n-1)
