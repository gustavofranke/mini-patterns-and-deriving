{-# OPTIONS_GHC
    -ddump-deriv
    -dsuppress-idinfo
    -dsuppress-coercions
    -dsuppress-type-applications
    -dsuppress-uniques
    -dsuppress-module-prefixes
#-}

module Deriving.Examples.Candies where

newtype CandyCounter = CandyCounter
    { unCandyCounter :: Int
    } deriving (Eq, Ord)

-- $ stack ghc src/Deriving/Examples/Candies.hs 
-- [1 of 1] Compiling Deriving.Examples.Candies ( src/Deriving/Examples/Candies.hs, src/Deriving/Examples/Candies.o )

-- ==================== Derived instances ====================
-- Derived class instances:
--   instance Eq CandyCounter where
--     (==)
--       = coerce
--           @(Int -> Int -> Bool)
--           @(CandyCounter -> CandyCounter -> Bool)
--           ((==) @Int) ::
--           CandyCounter -> CandyCounter -> Bool
--     (/=)
--       = coerce
--           @(Int -> Int -> Bool)
--           @(CandyCounter -> CandyCounter -> Bool)
--           ((/=) @Int) ::
--           CandyCounter -> CandyCounter -> Bool
  
--   instance Ord CandyCounter where
--     compare
--       = coerce
--           @(Int -> Int -> Ordering)
--           @(CandyCounter -> CandyCounter -> Ordering)
--           (compare @Int) ::
--           CandyCounter -> CandyCounter -> Ordering
--     (<)
--       = coerce
--           @(Int -> Int -> Bool)
--           @(CandyCounter -> CandyCounter -> Bool)
--           ((<) @Int) ::
--           CandyCounter -> CandyCounter -> Bool
--     (<=)
--       = coerce
--           @(Int -> Int -> Bool)
--           @(CandyCounter -> CandyCounter -> Bool)
--           ((<=) @Int) ::
--           CandyCounter -> CandyCounter -> Bool
--     (>)
--       = coerce
--           @(Int -> Int -> Bool)
--           @(CandyCounter -> CandyCounter -> Bool)
--           ((>) @Int) ::
--           CandyCounter -> CandyCounter -> Bool
--     (>=)
--       = coerce
--           @(Int -> Int -> Bool)
--           @(CandyCounter -> CandyCounter -> Bool)
--           ((>=) @Int) ::
--           CandyCounter -> CandyCounter -> Bool
--     max
--       = coerce
--           @(Int -> Int -> Int)
--           @(CandyCounter -> CandyCounter -> CandyCounter)
--           (max @Int) ::
--           CandyCounter -> CandyCounter -> CandyCounter
--     min
--       = coerce
--           @(Int -> Int -> Int)
--           @(CandyCounter -> CandyCounter -> CandyCounter)
--           (min @Int) ::
--           CandyCounter -> CandyCounter -> CandyCounter
  

-- Derived type family instances:
