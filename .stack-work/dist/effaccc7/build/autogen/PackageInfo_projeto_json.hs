{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module PackageInfo_projeto_json (
    name,
    version,
    synopsis,
    copyright,
    homepage,
  ) where

import Data.Version (Version(..))
import Prelude

name :: String
name = "projeto_json"
version :: Version
version = Version [0,1,0,0] []

synopsis :: String
synopsis = "Simple JSON library"
copyright :: String
copyright = ""
homepage :: String
homepage = ""
