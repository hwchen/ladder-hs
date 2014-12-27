-- main for ladder program. This program reads two files:
-- results.txt
-- ladder.txt
-- and outputs to ladder.txt

-- for now, LadderCalc is working. reading files and writing are not.

module Main where

import LadderCalc

main = pprintLadder $ ladder recList ladList
