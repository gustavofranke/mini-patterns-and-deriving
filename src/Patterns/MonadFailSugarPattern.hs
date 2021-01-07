{-# LANGUAGE LambdaCase #-}

module Patterns.MonadFailSugarPattern where

import Text.Read ( readMaybe )
import Data.Text (unpack, pack,  splitOn)

data Buffer

bufferLastLine :: Buffer -> Maybe String
bufferLastLine = undefined

--  Exercise: Desugar the above code manually.
cmdSequence :: Buffer -> Maybe String
cmdSequence buffer = do
  line <- bufferLastLine buffer
  ["CMD", number, cmd] <- Just $ words line
  42 <- readMaybe number
  pure cmd

cmdSequence2 :: Buffer -> Maybe String
cmdSequence2 buffer =
  bufferLastLine buffer
    >>= ( \line ->
            Just (words line)
              >>= ( \case
                      ["CMD", number, cmd] -> readMaybe number >>= (\42 -> pure cmd)
                      [] -> Nothing
                  )
        )

-- Exercise: Try implementing the keepOnlySameRights functions without list comprehensions and the MonadFail instance for list.
keepOnlySameRights :: [(Either e1 Int, Either e2 Int)] -> [Int]
keepOnlySameRights xs = [n | (Right n, Right m) <- xs, n == m]

keepOnlySameRights2 :: [(Either e1 Int, Either e2 Int)] -> [Int]
keepOnlySameRights2 xs = xs >>= (\(Right n, Right m) -> if n == m then [n] else [])

-- Task 1 Implement the following functions applying the MonadFail sugar pattern.

-- returns sum of exactly 3 numbers separated by spaces in a string
-- >>> sumThree "10 20 15"
-- Just 45

-- >>> sumThree "10 7"
-- Nothing

sumThree :: String -> Maybe Int
sumThree str = do
  [a, b, c] <- Just (fmap (\n -> readMaybe (Data.Text.unpack n) :: Maybe Int) (splitOn (Data.Text.pack " ") (Data.Text.pack str)))
  do
    x <- a
    y <- b
    z <- c
    pure (x + y + z)

-- Task 2 Implement the following functions applying the MonadFail sugar pattern.

-- return only values inside Just
catMaybes :: [Maybe a] -> [a]
catMaybes mas = do
  Just x <- mas
  pure x

-- MonadFail sugar: Task 3 Implement the following functions applying the MonadFail sugar pattern.

-- return 'b's only from 'Just'
mapMaybe :: (a -> Maybe b) -> [a] -> [b]
mapMaybe f as = do
  x <- fmap f as
  Just y <- [x]
  pure y

-- MonadFail sugar: Task 4 Implement the following functions applying the MonadFail sugar pattern.

-- >>> threeNothing Nothing Nothing Nothing
-- Just ()

-- return @Just ()@ only if all three arguments are Nothing
threeNothing :: Maybe a -> Maybe b -> Maybe c -> Maybe ()
threeNothing ma mb mc = do
  Nothing <- Just ma
  Nothing <- Just mb
  Nothing <- Just mc
  pure ()
