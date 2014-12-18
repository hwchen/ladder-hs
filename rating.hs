-- Program for processing AGA ratings

-- Get all AGA ratings from file "TDListN.txt"
--(before Parsec)

-- I need to check for players who do not have a rating, give them "0"
-- also, some people have 3 names. Parsec may make this easier?

data Player = Player { name   :: String
                     , agaId  :: String
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

filterByState :: String -> [Player] -> [Player]
filterByState filterState = filter (\a -> state a == filterState)

massPlayers :: IO [Player]
massPlayers = do
    allRatingsList <- agaList
    return $ filterByState "MA" $ map parsePlayer allRatingsList

main = do
    players <- massPlayers
    mapM_ print players
