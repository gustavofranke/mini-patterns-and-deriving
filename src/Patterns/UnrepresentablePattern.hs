module Patterns.UnrepresentablePattern where

-- Make illegal states unrepresentable: Task 1
-- Implement the following function by applying the make illegal states unrepresentable pattern.

-- group sublists of equal elements
-- >>> group0 "Mississippi"
-- ["M","i","ss","i","ss","i","pp","i"]
-- Hint: Use the NonEmpty list.
group0 :: (Eq a) => [a] -> [[a]]
group0 = go
  where
    go [] = []
    go (x : xs) = (x : cs) : go rest
      where
        (cs, rest) = span (== x) xs

-- Make illegal states unrepresentable: Task 2
-- Improve the following code by applying the make illegal states unrepresentable pattern.

data XValueList a
  = Length1List a
  | Length2List a a
  | Length3List a a a

mkXValueList :: [a] -> Either String (XValueList a)
mkXValueList ls = case length ls of
  0 -> Left "Empty list"
  1 -> Right $ Length1List (head ls)
  2 -> Right $ Length2List (head ls) (ls !! 1)
  3 -> Right $ Length3List (head ls) (ls !! 1) (ls !! 2)
  _ -> Left "More than three values"

sumUpToThree :: Num a => XValueList a -> a
sumUpToThree (Length1List x) = x
sumUpToThree (Length2List x y) = x + y
sumUpToThree (Length3List x y z) = x + y + z
