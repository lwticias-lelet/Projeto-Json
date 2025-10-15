{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
#if __GLASGOW_HASKELL__ >= 810
{-# OPTIONS_GHC -Wno-prepositive-qualified-module #-}
#endif
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_projeto_json (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude


#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath




bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "C:\\Users\\lelet\\OneDrive\\projeto-json\\.stack-work\\install\\72bc9c57\\bin"
libdir     = "C:\\Users\\lelet\\OneDrive\\projeto-json\\.stack-work\\install\\72bc9c57\\lib\\x86_64-windows-ghc-9.6.6\\projeto-json-0.1.0.0-5ttTvUDGzi0GJ12n7A7is2"
dynlibdir  = "C:\\Users\\lelet\\OneDrive\\projeto-json\\.stack-work\\install\\72bc9c57\\lib\\x86_64-windows-ghc-9.6.6"
datadir    = "C:\\Users\\lelet\\OneDrive\\projeto-json\\.stack-work\\install\\72bc9c57\\share\\x86_64-windows-ghc-9.6.6\\projeto-json-0.1.0.0"
libexecdir = "C:\\Users\\lelet\\OneDrive\\projeto-json\\.stack-work\\install\\72bc9c57\\libexec\\x86_64-windows-ghc-9.6.6\\projeto-json-0.1.0.0"
sysconfdir = "C:\\Users\\lelet\\OneDrive\\projeto-json\\.stack-work\\install\\72bc9c57\\etc"

getBinDir     = catchIO (getEnv "projeto_json_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "projeto_json_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "projeto_json_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "projeto_json_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "projeto_json_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "projeto_json_sysconfdir") (\_ -> return sysconfdir)



joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '\\'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/' || c == '\\'
