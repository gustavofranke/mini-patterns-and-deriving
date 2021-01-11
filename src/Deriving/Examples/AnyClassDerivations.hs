{-# LANGUAGE DeriveAnyClass #-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DefaultSignatures #-}

module Deriving.Examples.AnyClassDerivations where

import Data.Text
class MyEq a where
    equal :: a -> a -> Bool

    default equal :: Show a => a -> a -> Bool
    equal x y = show x == show y

data Gift = Gift Text Int
    deriving stock (Show)
    deriving anyclass (MyEq)