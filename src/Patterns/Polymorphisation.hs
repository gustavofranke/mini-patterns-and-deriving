module Patterns.Polymorphisation where

import Data.Maybe ( catMaybes )
import Data.Foldable ( Foldable(fold) )

-- | Polymorphisation: Task 1
-- Improve the following functions by applying the Polymorphisation pattern.

-- append all elements inside all Just values
-- >>> maybeConcat [Just [1,2,3], Nothing, Just [4,5]]
-- [1,2,3,4,5]
maybeConcat :: [Maybe [a]] -> [a]
-- maybeConcat ls = concat $ map fromJust $ snd $ partition isNothing ls
-- maybeConcat ls = concatMap fromJust (snd $ partition isNothing ls)
maybeConcat = concat . catMaybes

maybeConcatM :: Monoid m => [Maybe [m]] -> [m]
maybeConcatM = mconcat . catMaybes

maybeConcatFM :: (Foldable f, Monoid m) => f (Maybe m) -> m
maybeConcatFM = fold . fold

-- | Polymorphisation: Task 2
-- return lists containing a given integer
-- >>> containsInt 3 [[1..5], [2,0], [3,4]]
-- [[1,2,3,4,5],[3,4]]
containsInt :: (Foldable t, Eq a) => a -> [t a] -> [t a]
-- containsInt e = filter (e `elem`)
containsInt = filter . elem

-- Polymorphisation: Task 3
-- split list in two parts stopping when predicate returns false
-- >>> span0 (< 3) [1, 2, 4, 2]
-- ([1,2],[4,2])
span0 :: (a -> Bool) -> [a] -> ([a], [a])
span0 fu ls = go fu ls ([], [])
  where
    go _ [] res = res
    go f (x : xs) (ys, ns) =
      if f x
        then go f xs (ys ++ [x], ns)
        else (ys, x : xs)
