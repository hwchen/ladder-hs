-- program for calculating the ladder order

module LadderCalc where

import Data.List (foldl')

data Record = Game { white :: Player
                   , black :: Player 
                   , winner :: Winner
                   }
              | AddPlayer Player
              deriving Show

data Winner = White | Black 
              deriving Show

type Player = String
type Ladder = [Player]
type Records = [Record]

applyRecord :: Record -> Ladder -> Ladder
applyRecord _                []  = []
applyRecord (AddPlayer x)    lad = lad ++ [x]
applyRecord (Game w b White) lad = lad
applyRecord (Game w b Black) lad =
    (takeWhile (/= w) lad') ++ [b] ++ (dropWhile (/= w) lad')
        where lad' = filter (/= b) lad

ladder :: Records -> Ladder -> Ladder
ladder rs lad = foldl' (flip applyRecord) lad rs

pprintLadder :: Ladder -> IO()
pprintLadder lad = do
    let lad' = map (\(a,b) -> show a ++ ". " ++ b) $ zip [1..] lad
    mapM_ putStrLn lad'

-- test cases
ladList = ["mawang","chunsun","willluff"]
recList = [record1, record2, record3, record4]
record1 = AddPlayer "waltherchen"
record2 = Game {white="mawang", black="chunsun", winner=White}
record3 = Game {white="chunsun", black="willluff", winner=Black}
record4 = Game {white="willluff", black="waltherchen", winner=Black}

