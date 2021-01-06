module PhantomTypeParamsPattern where

-- Task: Improve the following code by applying the Phantom type parameters pattern.
-- Don’t worry about function implementations, they are not important in this task.

import Data.Binary (Binary)
import Data.ByteString (ByteString)

newtype Key a = Key {unKey :: ByteString}

newtype Private = Private {unPrivate :: ByteString}

newtype Public = Public {unPublic :: ByteString}

newtype Signature = Signature ByteString

-- | Derive public key from secret key.
createPublicKey :: Key Private -> Key Public
createPublicKey = error "Not implemented"

-- | Sign the data using the given 'PrivateKey'.
sign :: Binary a => Key Private -> a -> Signature
sign = error "Not implemented"

-- | Check that the signature is produced by the 'PublicKey', derived for the
-- corresponding 'PrivateKey' that signed the same type of data
verifySignature :: Binary a => Key Public -> Signature -> a -> Bool
verifySignature = error "Not implemented"
