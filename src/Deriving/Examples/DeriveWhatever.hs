{-# LANGUAGE DeriveFunctor #-}
{-# LANGUAGE DerivingStrategies #-}

module Deriving.Examples.DeriveWhatever where

data Gift a
   = None
   | Some a
   deriving stock (Functor)