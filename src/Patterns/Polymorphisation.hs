module Patterns.Polymorphisation where

-- Polymorphisation: Task 1
-- Improve the following functions by applying the Polymorphisation pattern.

-- append all elements inside all Just values
-- >>> maybeConcat [Just [1,2,3], Nothing, Just [4,5]]
-- [1,2,3,4,5]
maybeConcat :: [Maybe [Int]] -> [Int]
maybeConcat = undefined

-- | Polymorphisation: Task 2
-- return lists containing a given integer
-- >>> containsInt 3 [[1..5], [2,0], [3,4]]
-- [[1,2,3,4,5],[3,4]]
containsInt :: (Foldable t, Eq a) => a -> [t a] -> [t a]
-- containsInt e = filter (e `elem`)
containsInt = filter . elem

-- Polymorphisation: Task 3
-- split list in two parts stopping when predicate returns false
-- >>> span (< 3) [1, 2, 4, 2]
-- ([1, 2], [4, 2])
span :: (a -> Bool) -> [a] -> ([a], [a])
span = undefined
