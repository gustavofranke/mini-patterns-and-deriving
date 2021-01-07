{-# LANGUAGE DerivingVia #-}
module Deriving.Puzzle2 where

-- Puzzle 2: Infinite deriving
-- Without writing the Show instance explicitly, but using only deriving capabilities,
-- implement a Show instance for the data type that prints nested string "Ho" infinitely.
-- In other words, if you have a data type like this:

newtype Ho a = Ho a deriving Show

-- show (Infinite 0)
-- Ho (Ho (Ho (Ho (Ho (Ho (Ho (Ho (Ho (Ho (Ho (H^C (Ho (Ho (Ho Interrupted.
newtype Infinite = Infinite Int
  deriving Show via Ho Infinite

-- the behaviour of the show function for this type should be the following:
-- ghci> Infinite 0
-- Ho (Ho (Ho (Ho (...