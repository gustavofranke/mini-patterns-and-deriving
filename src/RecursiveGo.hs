module RecursiveGo where

-- Recursive go: Task 1
-- Improve the following code by applying the Recursive go pattern.
sum0 :: Num a => [a] -> a
sum0 [] = 0
sum0 (x:xs) = x + sum0 xs

-- Recursive go: Task 2
-- Write the ordNub function with the Recursive go pattern. The function should return all unique elements from a list in the order of their appearance.
ordNub :: Ord a => [a] -> [a]
ordNub = undefined 
-- >>> ordNub [3, 3, 3, 2, 2, -1, 1]
-- [3,2,-1,1]