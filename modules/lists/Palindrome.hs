module Palindrome where

palindrome :: Eq a => [a] -> Bool
palindrome []  = True
palindrome [_] = True
palindrome xs  = (head xs) == (last xs) && (palindrome $ init $ tail xs)
