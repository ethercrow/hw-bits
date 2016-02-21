-- |
-- Copyright: 2016 John Ky
-- License: MIT
--
-- Succinct operations.
module HaskellWorks.Data.Succinct
    ( -- * Rank & Select
      BitRank(..)
    , BitSelect(..)
    , BitWise(..)
    , Count(..)
    , PopCount(..)
    , Position(..)
    , Rank(..)
    , Select(..)
    , Shift(..)
    , Simple(..)
    , TestBit(..)
    ) where

import           HaskellWorks.Data.Succinct.Internal
import           HaskellWorks.Data.Succinct.Rank9
import           HaskellWorks.Data.Succinct.Simple
