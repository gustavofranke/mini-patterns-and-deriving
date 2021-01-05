module UnrepresentablePattern where

-- Make illegal states unrepresentable: Task 1
-- Implement the following function by applying the make illegal states unrepresentable pattern.

-- group sublists of equal elements
-- >>> group "Mississippi"
-- ["M","i","ss","i","ss","i","pp","i"]
-- Hint: Use the NonEmpty list.
group :: Eq a => [a] -> [[a]]
group = undefined

-- Make illegal states unrepresentable: Task 2
-- Improve the following code by applying the make illegal states unrepresentable pattern.

-- this data type can be further simplified based on the fact that we can handle wrapping 1, 2, and 3 elems rather than wrapping the list
data XValueList a
  = Length1List [a]
  | Length2List [a]
  | Length3List [a]

mkXValueList :: [a] -> Either String (XValueList a)
mkXValueList ls = case length ls of
  0 -> Left "Empty list"
  1 -> Right $ Length1List ls
  2 -> Right $ Length2List ls
  3 -> Right $ Length3List ls
  _ -> Left "More than three values"

sumUpToThree :: Num a => XValueList a -> a
sumUpToThree (Length1List [x]) = x
sumUpToThree (Length2List [x, y]) = x + y
sumUpToThree (Length3List [x, y, z]) = x + y + z
