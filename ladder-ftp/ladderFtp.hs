-- Script for uploading aga ladder results to massgo.ladder.org
-- add password later?

import Control.Monad
import Data.List
import Network.FTP.Client as FTP
import System.Directory
import System.Environment (getArgs)

data Upload = Upload { server :: String
                     , login :: String
                     , pass :: String
                     , files :: [String]
                     }

main = do
    args <- getArgs
    

    FTP.enableFTPDebugging
    h <- FTP.easyConnectFTP ""
    FTP.login h "" (Just "") Nothing
    FTP.cwd h ""
    FTP.uploadbinary h ""
    FTP.uploadbinary h ""
    FTP.nlst h Nothing >>= mapM_ putStrLn . sort
    FTP.quit h

parseUpload :: [String] -> Maybe Upload
parseUpload xs
