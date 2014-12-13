-- Program for processing AGA ratings

-- Get all AGA ratings from file "TDListN.txt"
--(before Parsec)

data Player = Player { name   :: String
                     , agaId     :: String
                     , rating :: String
                     , state  :: String
                     } deriving (Show)

agaList :: IO [String]
agaList = do
    contents <- readFile "TDListN.txt"
    return $ lines contents

parsePlayer :: String -> Player
parsePlayer s = Player { name = name'
                       , agaId = agaId'
                       , rating = rating'
                       , state = state'
                       }
    where stringList = words s
          name' = case stringList of
              (x:y:xs) -> x ++ y
              _ -> "error"
          agaId' = case stringList of
              (_:_:x:xs) -> x
              _ -> "error"
          rating' = case stringList of
              (_:_:_:_:x:xs) -> x
              _ -> "error"
          state' = last stringList
