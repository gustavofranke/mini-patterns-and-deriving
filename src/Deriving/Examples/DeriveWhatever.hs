{-# LANGUAGE DeriveFoldable #-}
{-# OPTIONS_GHC
    -ddump-deriv
    -dsuppress-idinfo
    -dsuppress-coercions
    -dsuppress-type-applications
    -dsuppress-uniques
    -dsuppress-module-prefixes
#-}

{-# LANGUAGE DeriveFunctor #-}
{-# LANGUAGE DerivingStrategies #-}

module Deriving.Examples.DeriveWhatever where

data Gift a
   = None
   | Some a
   deriving stock (Functor, Foldable)

-- $ stack ghc src/Deriving/Examples/DeriveWhatever.hs 
-- [1 of 1] Compiling Deriving.Examples.DeriveWhatever ( src/Deriving/Examples/DeriveWhatever.hs, src/Deriving/Examples/DeriveWhatever.o )
-- 
-- ==================== Derived instances ====================
-- Derived class instances:
--   instance Functor Gift where
--     fmap f None = None
--     fmap f (Some a1) = Some (f a1)
--     (<$) z None = None
--     (<$) z (Some a1) = Some ((\ b1 -> z) a1)
-- 
--   instance Foldable Gift where
--     foldr f z None = z
--     foldr f z (Some a1) = f a1 z
--     foldMap f None = mempty
--     foldMap f (Some a1) = f a1
--     null None = True
--     null (Some _) = False
--   
-- 
-- Derived type family instances:
-- 
-- 
-- 
-- ==================== Filling in method body ====================
-- Foldable [Gift]
--   fold = $dmfold @(Gift)
-- 
-- 
-- 
-- ==================== Filling in method body ====================
-- Foldable [Gift]
--   foldMap' = $dmfoldMap' @(Gift)
-- 
-- 
-- 
-- ==================== Filling in method body ====================
-- Foldable [Gift]
--   foldr' = $dmfoldr' @(Gift)
-- 
-- 
-- 
-- ==================== Filling in method body ====================
-- Foldable [Gift]
--   foldl = $dmfoldl @(Gift)
-- 
-- 
-- 
-- ==================== Filling in method body ====================
-- Foldable [Gift]
--   foldl' = $dmfoldl' @(Gift)
-- 
-- 
-- 
-- ==================== Filling in method body ====================
-- Foldable [Gift]
--   foldr1 = $dmfoldr1 @(Gift)
-- 
-- 
-- 
-- ==================== Filling in method body ====================
-- Foldable [Gift]
--   foldl1 = $dmfoldl1 @(Gift)
-- 
-- 
-- 
-- ==================== Filling in method body ====================
-- Foldable [Gift]
--   toList = $dmtoList @(Gift)
-- 
-- 
-- 
-- ==================== Filling in method body ====================
-- Foldable [Gift]
--   length = $dmlength @(Gift)
-- 
-- 
-- 
-- ==================== Filling in method body ====================
-- Foldable [Gift]
--   elem = $dmelem @(Gift)
-- 
-- 
-- 
-- ==================== Filling in method body ====================
-- Foldable [Gift]
--   maximum = $dmmaximum @(Gift)
-- 
-- 
-- 
-- ==================== Filling in method body ====================
-- Foldable [Gift]
--   minimum = $dmminimum @(Gift)
-- 
-- 
-- 
-- ==================== Filling in method body ====================
-- Foldable [Gift]
--   sum = $dmsum @(Gift)
-- 
-- 
-- 
-- ==================== Filling in method body ====================
-- Foldable [Gift]
--   product = $dmproduct @(Gift)
