{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module Deriving.Examples.Via where

class Beard faceOfTheWinterHoliday where
    beardDescription :: faceOfTheWinterHoliday -> String

newtype Santa = Santa String
    deriving newtype (Show)

instance Beard Santa where
    beardDescription (Santa name) = name <> " has long white beard"

newtype FatherFrost = FatherFrost String
    deriving newtype (Show)
    deriving Beard via Santa