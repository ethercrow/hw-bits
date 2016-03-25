{-# OPTIONS_GHC -fno-warn-incomplete-patterns #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE ScopedTypeVariables        #-}

module HaskellWorks.Data.Succinct.RankSelect.Binary.Poppy512Spec (spec) where

import qualified Data.Vector.Storable                                     as DVS
import           Data.Word
import           HaskellWorks.Data.Bits.BitPrint
import           HaskellWorks.Data.Bits.BitString
import           HaskellWorks.Data.Positioning
import           HaskellWorks.Data.Succinct.RankSelect.Binary.Basic.Rank1
import           HaskellWorks.Data.Succinct.RankSelect.Binary.Poppy512
import           HaskellWorks.Data.Vector.VectorLike
import           Test.Hspec
import           Test.QuickCheck

{-# ANN module ("HLint: ignore Redundant do" :: String) #-}
{-# ANN module ("HLint: ignore Reduce duplication"  :: String) #-}

newtype ShowVector a = ShowVector a deriving (Eq, BitPrint)

instance (BitPrint a) => Show (ShowVector a) where
  show a = bitPrint a ""

vectorSizedBetween :: Int -> Int -> Gen (ShowVector (DVS.Vector Word64))
vectorSizedBetween a b = do
  n   <- choose (a, b)
  xs  <- sequence [ arbitrary | _ <- [1 .. n] ]
  return $ ShowVector (DVS.fromList xs)

spec :: Spec
spec = describe "HaskellWorks.Data.Succinct.RankSelect.Binary.Poppy512.Rank1Spec" $ do
  describe "rank1 for Vector Word64 is equivalent to rank1 for Poppy512" $ do
    it "on empty bitvector" $
      let v = DVS.empty in
      let w = makePoppy512 v in
      let i = 0 in
      rank1 v i === rank1 w i
    it "on one basic block" $
      forAll (vectorSizedBetween 1 8) $ \(ShowVector v) ->
      forAll (choose (0, vLength v * 8)) $ \i ->
      let w = makePoppy512 v in
      rank1 v i === rank1 w i
    it "on two basic blocks" $
      forAll (vectorSizedBetween 9 16) $ \(ShowVector v) ->
      forAll (choose (0, vLength v * 8)) $ \i ->
      let w = makePoppy512 v in
      rank1 v i === rank1 w i
    it "on three basic blocks" $
      forAll (vectorSizedBetween 17 24) $ \(ShowVector v) ->
      forAll (choose (0, vLength v * 8)) $ \i ->
      let w = makePoppy512 v in
      rank1 v i === rank1 w i
