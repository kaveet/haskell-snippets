module AbsoluteValue where

absoluteValue :: Int -> Int
absoluteValue n | n >= 0 = n
                | otherwise  = -n
