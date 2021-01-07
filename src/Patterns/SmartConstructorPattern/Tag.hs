module Patterns.SmartConstructorPattern.Tag where
-- Task: Improve the following code by applying the Smart constructor pattern.

-- | Tag is a non-empty string.
newtype Tag = Tag String

type TagError = String

mkTag :: String -> Either TagError Tag
mkTag tag
    | null tag = Left "Empty tag!"
    | otherwise = Right (Tag tag)
