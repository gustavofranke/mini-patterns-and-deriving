{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module Deriving.Puzzle1 where

import Data.Semigroup

-- Puzzle 1: Semigroup and Monoid
-- Semigroup became the superclass of Monoid in base-4.11.0.0 (GHC 8.4.1).
-- That means that now it is required for the data type to be a Semigroup in order to have an instance of Monoid.

-- Besides, base provides the WrappedMonoid newtype that allows deriving Semigroup instance,
-- if you already have a Monoid instance.
-- But is it possible to use such a newtype in the wrong way?

-- What would happen when compiling the following code with -Wall and running it?

-- Gift "hello" <> Gift "how are you"
-- Gift {unGift = " -- and it doesn't terminate, don't doctest this :P
newtype Gift = Gift
    { unGift :: String
    } deriving stock (Show)
      deriving Semigroup via WrappedMonoid Gift

instance Monoid Gift where
    mempty = Gift ""

-- Possible answers:

--  Compiler error
--  Compiler warning
--  Incorrect instance work after termination (exception, wrong results, etc.)
--  Hangs in runtime