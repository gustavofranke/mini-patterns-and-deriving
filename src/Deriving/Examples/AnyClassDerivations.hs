{-# LANGUAGE DefaultSignatures #-}

module Deriving.Examples.AnyClassDerivations where

class MyEq a where
    equal :: a -> a -> Bool

    default equal :: Show a => a -> a -> Bool
    equal x y = show x == show y

