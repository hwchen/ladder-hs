-- Script for uploading aga ladder results
-- should I add error handling? Do it later...
-- uploads all html files from selected directory


import Control.Monad
import Data.List
import Network.FTP.Client as FTP
import System.Directory
import System.Environment (getArgs)

data Upload = Upload { server :: String
                     , username :: String
                     , pass :: String
                     , upDir :: String
                     , localDir :: String
                     }
              deriving Show

main = do
    args <- getArgs
    let up = parseUpload args
    putStrLn "Parameters:"
    print up
   
    fileList  <- getDirectoryContents (localDir up)
    let fileListHtml = getHtml fileList
    putStrLn "Files to Upload:"
    mapM_ putStrLn fileListHtml

    setCurrentDirectory (localDir up)

    FTP.enableFTPDebugging
    h <- FTP.easyConnectFTP (server up)
    FTP.login h (username up) (Just (pass up)) Nothing
    FTP.cwd h (upDir up)
    mapM_ (FTP.uploadbinary h) (fileListHtml)
    FTP.nlst h Nothing >>= mapM_ putStrLn . sort
    FTP.quit h

parseUpload :: [String] -> Upload
parseUpload (a:b:c:d:e:_) = Upload { server = a
                                , username = b
                                , pass = c
                                , upDir = d
                                , localDir = e
                                }
parseUpload _            = error "not enough args"

getHtml :: [FilePath] -> [FilePath]
getHtml = filter (\n -> "html" `isSuffixOf` n)
