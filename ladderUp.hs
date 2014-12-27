-- simple script for updating ladder pages using pandoc binary

import System.Environment (getArgs)
import System.Process

toHtml :: String -> String
toHtml s = takeWhile (/= '.') s ++ ".html" 

toPandocArgs :: String -> [String]
toPandocArgs s = ["-o"] ++ [toHtml s] ++ [s]

main = do
    args <- getArgs
    print args
    print $ map toPandocArgs args
    mapM_ (rawSystem "pandoc") $ map toPandocArgs args
    --e.g. rawSystem "pandoc" ["-o", "index.html", "index.md"]
