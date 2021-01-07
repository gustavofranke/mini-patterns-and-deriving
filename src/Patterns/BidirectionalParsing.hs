{-# LANGUAGE RankNTypes #-}
module Patterns.BidirectionalParsing where

-- Exercise: Implement the inverseMap function.
inverseMap
    :: forall e s . (Bounded e, Enum e, Ord s)
    => (e -> s)
    -> s
    -> Maybe e
inverseMap f x = undefined

-- Task: Implement a function that will take a string of two space-separate words — colour and fruit name — and return them as data types.

-- | Possible colours: red, green, yellow, blue.
data FruitColour = Red | Green | Yellow | Blue deriving (Show)

mkFruitColour :: String -> Maybe FruitColour
mkFruitColour "red" = Just Red
mkFruitColour "green" = Just Green
mkFruitColour "yellow" = Just Yellow
mkFruitColour "blue" = Just Blue
mkFruitColour _ = Nothing

-- | Possible fruits: apple, orange, lemon, blueberry.
data FruitName = Apple | Orange | Lemon | Blueberry deriving (Show)

mkFruitName :: String -> Maybe FruitName
mkFruitName "apple" = Just Apple
mkFruitName "orange" = Just Orange
mkFruitName "lemon" = Just Lemon
mkFruitName "blackberry" = Just Blueberry
mkFruitName _ = Nothing


data Fruit = Fruit
           { fruitColour :: FruitColour 
           , fruitName :: FruitName 
           } deriving (Show)

mkFruit :: String -> String -> Maybe Fruit
mkFruit clr nm = do
    c <- mkFruitColour clr
    n <- mkFruitName nm
    pure $ Fruit c n


-- Example:
-- >>> parseFruit "red apple"
-- Just (Fruit {fruitColour = Red, fruitName = Apple})
parseFruit :: String -> Maybe Fruit
parseFruit str = mkFruit clr nam
    where
        list = words str
        clr = head list
        nam = list !! 1
-- while this works, it's the opposite of the pattern, as these smart constructors use _,
-- which means upon a new case, the compiler won't warn anything
