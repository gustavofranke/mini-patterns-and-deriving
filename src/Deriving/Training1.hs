{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module Deriving.Training1 where

import Control.Monad.IO.Class (MonadIO)
import Control.Monad.Reader
  ( MonadReader,
    ReaderT (ReaderT),
  )
import Data.Aeson (FromJSON, ToJSON)
import Data.Hashable (Hashable)
import Data.Ix (Ix)
import Data.Text (Text)
import GHC.Generics (Generic)

data MyEnv = MyEnv

-- Training 1: Specify strategy
-- Specify strategies explicitly in the following code:

data GiftType = Toy | Bicycle | Dress | Shoe
  deriving (Show, Read, Eq, Ord, Enum, Bounded, Ix)

newtype Email = Email
  { unEmail :: Text
  }
  deriving stock (Show, Eq, Ord, Generic)
  deriving newtype (Hashable, FromJSON, ToJSON)

newtype App a = App
  { unApp :: ReaderT MyEnv IO a
  }
  deriving newtype (Functor, Applicative, Monad, MonadIO, MonadReader MyEnv)
