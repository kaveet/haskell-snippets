module Safetails where

safetail :: Eq a => [a] -> [a]
safetail xs = if xs == [] then [] else tail xs

safetail' :: Eq a => [a] -> [a]
safetail' xs
  | xs == []  = []
  | otherwise = tail xs
