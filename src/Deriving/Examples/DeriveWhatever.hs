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
   deriving stock (Functor)

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
-- Derived type family instances:
