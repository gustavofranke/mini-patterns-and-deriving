{-# LANGUAGE DeriveAnyClass #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module Deriving.Training2 where

-- Training 2: Disambiguate
-- Having the following extensions enabled in the module:
-- what would happen when compiling with -Wall the following code?

import Data.Aeson (FromJSON, ToJSON)
import Data.String (IsString, fromString)
import Data.Text (Text)
import GHC.Generics (Generic)

-- >>> show (ToyName (Data.Text.pack "hello"))
-- "ToyName {unToyName = \"hello\"}"
-- >>> show (ToyName (fromString "hello"))
-- "ToyName {unToyName = \"hello\"}"
newtype ToyName = ToyName
  { unToyName :: Text
  }
  deriving (Show, Read, Generic, IsString, FromJSON, ToJSON)

-- Possible answers:

--  It won’t compile
--  There will be (a) warning(s) but it will compile and work properly
--  Warnings and wrong runtime behaviour
--  No warnings during compilation, works as expected
--  No warnings during compilation, runtime error

----------------
-- /Users/frankeg/workspace/personal/mini-patterns-and-deriving/src/Deriving/Training2.hs:19:34: warning:
--     • Both DeriveAnyClass and GeneralizedNewtypeDeriving are enabled
--       Defaulting to the DeriveAnyClass strategy for instantiating IsString
--       Use DerivingStrategies to pick a different strategy
--     • In the newtype declaration for ‘ToyName’
--    |
-- 19 |   deriving (Show, Read, Generic, IsString, FromJSON, ToJSON)
--    |                                  ^^^^^^^^

-- /Users/frankeg/workspace/personal/mini-patterns-and-deriving/src/Deriving/Training2.hs:19:34: warning: [-Wmissing-methods]
--     • No explicit implementation for
--         ‘Data.String.fromString’
--     • In the instance declaration for ‘IsString ToyName’
--    |
-- 19 |   deriving (Show, Read, Generic, IsString, FromJSON, ToJSON)
--    |                                  ^^^^^^^^

-- /Users/frankeg/workspace/personal/mini-patterns-and-deriving/src/Deriving/Training2.hs:19:44: warning:
--     • Both DeriveAnyClass and GeneralizedNewtypeDeriving are enabled
--       Defaulting to the DeriveAnyClass strategy for instantiating FromJSON
--       Use DerivingStrategies to pick a different strategy
--     • In the newtype declaration for ‘ToyName’
--    |
-- 19 |   deriving (Show, Read, Generic, IsString, FromJSON, ToJSON)
--    |                                            ^^^^^^^^

-- /Users/frankeg/workspace/personal/mini-patterns-and-deriving/src/Deriving/Training2.hs:19:54: warning:
--     • Both DeriveAnyClass and GeneralizedNewtypeDeriving are enabled
--       Defaulting to the DeriveAnyClass strategy for instantiating ToJSON
--       Use DerivingStrategies to pick a different strategy
--     • In the newtype declaration for ‘ToyName’
--    |
-- 19 |   deriving (Show, Read, Generic, IsString, FromJSON, ToJSON)
--    |                                                      ^^^^^^
