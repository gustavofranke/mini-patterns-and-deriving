module Patterns.RecursiveGo where

-- Recursive go: Task 1
-- Improve the following code by applying the Recursive go pattern.
sum0 :: Num a => [a] -> a
sum0 [] = 0
sum0 (x : xs) = x + sum0 xs

-- |
-- >>> sum0 [1..5]
-- 15
-- >>> sum1 [1..5]
-- 15
sum1 :: Num a => [a] -> a
sum1 = go 0
  where
    go acc [] = acc
    go acc (x : xs) = go (acc + x) xs

-- | Recursive go: Task 2
-- Write the ordNub function with the Recursive go pattern.
-- The function should return all unique elements from a list in the order of their appearance.
--
-- >>> ordNub [3, 3, 3, 2, 2, -1, 1]
-- [3,2,-1,1]
ordNub :: Ord a => [a] -> [a]
ordNub = go []
  where
    go res [] = res
    go res (x : xs) = if x `elem` res then go res xs else go (res ++ [x]) xs
