module Patterns.SmartConstructorPattern.TagList where

import Data.List.NonEmpty (NonEmpty (..))
import Patterns.SmartConstructorPattern.Tag (Tag, mkTag)
import Data.Either ()

-- | Non-empty list of non-empty tags.
newtype TagsList = TagsList (NonEmpty Tag)

type TagsListError = String

mkTagsList :: [String] -> Either TagsListError TagsList
mkTagsList [] = Left "Empty list of tags"
mkTagsList (tag:tags) = fmap TagsList (sequence (mkTag tag :| map mkTag tags))
