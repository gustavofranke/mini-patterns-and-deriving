module SmartConstructorPattern.Password
  ( Password,
    unPassword,
    mkPassword,
  ) where

import Data.ByteString (ByteString)
import qualified Data.ByteString as ByteString

newtype Password = Password ByteString

unPassword :: Password -> ByteString
unPassword (Password password) = password

-- | Smart constructor. Doesn't allow empty passwords.
mkPassword :: ByteString -> Maybe Password
mkPassword pwd
  | ByteString.null pwd = Nothing
  | otherwise = Just (Password pwd)
