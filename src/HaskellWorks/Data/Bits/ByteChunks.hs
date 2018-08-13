{-# LANGUAGE DeriveGeneric #-}

module HaskellWorks.Data.Bits.BitString where

import GHC.Generics

import qualified Data.ByteString as BS

chunkSize :: Int
chunkSize = 4096

newtype ByteChunks = ByteChunks
  { chunks :: [BS.ByteString]
  } deriving (Eq, Show, Generic)

