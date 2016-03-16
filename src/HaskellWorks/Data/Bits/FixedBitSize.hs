-- |
-- Copyright: 2016 John Ky
-- License: MIT
--
-- Succinct operations.

module HaskellWorks.Data.Bits.FixedBitSize
    ( FixedBitSize(..)
    ) where

import           Data.Word
import           HaskellWorks.Data.Positioning

class FixedBitSize a where
  fixedBitSize :: a -> Count

instance FixedBitSize Bool where
  fixedBitSize _ = 1

instance FixedBitSize Word8 where
  fixedBitSize _ = 8

instance FixedBitSize Word16 where
  fixedBitSize _ = 16

instance FixedBitSize Word32 where
  fixedBitSize _ = 32

instance FixedBitSize Word64 where
  fixedBitSize _ = 64