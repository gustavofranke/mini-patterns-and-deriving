module EvidencePattern where

import Data.IntMap (IntMap)
import Data.Maybe ( fromJust )

import qualified Data.IntMap as IntMap

-- Exercise: Try refactoring the above code without using isNothing and fromJust functions.
-- Bonus points for using Maybe as a Monad.
add :: (a -> Maybe Int) -> (a -> Maybe Int) -> a -> Maybe Int
add f g x = do
  f1 <- f x
  g1 <- g x
  pure (f1 + g1)

getNearestValues
    :: IntMap Double  -- ^ Map from positions to values
    -> Int            -- ^ Current position
    -> Double
getNearestValues vals pos = case (IntMap.lookup (pos - 1) vals, IntMap.lookup (pos + 1) vals) of
    (Just l, Just r) -> l + r
    (Just l, Nothing) -> l
    (Nothing, Just r) -> r
    (Nothing, Nothing) -> 0.0
