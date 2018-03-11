{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE OverloadedStrings #-}

module Types where

import qualified Language.C.Inline as C
import qualified Language.C.Inline.Unsafe as CU
import           Data.Monoid ((<>))
import           Foreign.C.Types
import           Foreign.Ptr (Ptr)
import           Foreign.Marshal.Array
import qualified Data.Vector.Storable as V

import           Data.Coerce (coerce)
import           Data.Monoid ((<>))
import qualified Data.Vector.Storable as V
import qualified Data.Vector.Storable.Mutable as VM
import           Foreign.C.Types
import           Foreign.ForeignPtr (newForeignPtr_)
import           Foreign.Ptr (Ptr)
import           Foreign.Storable (Storable)
import qualified Language.C.Inline as C
import qualified Language.C.Inline.Unsafe as CU
import           System.IO.Unsafe (unsafePerformIO)

import qualified Language.Haskell.TH as TH
import qualified Language.C.Types as CT
import qualified Data.Map as Map
import           Language.C.Inline.Context


-- This is a lie!!!
type SunIndexType = CLong

sunTypesTable :: Map.Map CT.TypeSpecifier TH.TypeQ
sunTypesTable = Map.fromList
  [
    (CT.TypeName "sunindextype", [t| SunIndexType |] )
  ]

sunctx = mempty {ctxTypesTable = sunTypesTable}

