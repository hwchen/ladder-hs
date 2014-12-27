module Paths_ladder (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,1,0,0], versionTags = []}
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/hwchen/.cabal/bin"
libdir     = "/home/hwchen/.cabal/lib/x86_64-linux-ghc-7.8.3/ladder-0.1.0.0"
datadir    = "/home/hwchen/.cabal/share/x86_64-linux-ghc-7.8.3/ladder-0.1.0.0"
libexecdir = "/home/hwchen/.cabal/libexec"
sysconfdir = "/home/hwchen/.cabal/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "ladder_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "ladder_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "ladder_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "ladder_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "ladder_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
