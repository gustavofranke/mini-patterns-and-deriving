module Deriving.Examples.Motivation where

import qualified Data.Text as T

data Gift = Gift
    { giftId :: Int
    , giftType :: GiftType
    } deriving (Eq, Ord)

data GiftType
    = Candies CandyCounter
    | Toy Name
    deriving (Eq, Ord)

newtype Name = Name
    { unName :: T.Text
    } deriving (Eq, Ord)

newtype CandyCounter = CandyCounter
    { unCandyCounter :: Int
    } deriving (Eq, Ord)

-- |
-- >>> a
-- LT
a :: Ordering
a = compare
     (Gift 1 (Toy $ Name (T.pack "Strawberry Bear")))
     (Gift 2 (Candies $ CandyCounter 1000))