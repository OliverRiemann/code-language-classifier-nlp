{-# LANGUAGE OverloadedStrings #-}

import           Control.Arrow  ((&&&))
import           Data.Either    (rights)
import           Data.List      (group, sort)
import qualified Data.Text      as T
import qualified Data.Text.IO   as T
import qualified Data.Text.Read as T

frequency :: Ord a => [a] -> [(Int, a)]
frequency = map (length &&& head) . group . sort

judge :: [Int] -> T.Text
judge = judge' . sort . frequency
    where
        judge' [(1, _), (4, _)] = "four card"
        judge' [(2, _), (3, _)] = "full house"
        judge' [(1, 1), (1, 2), (1, 3), (1, 4), (1, 5)] = "straight"
        judge' [(1, 1), (1, 10), (1, 11), (1, 12), (1, 13)] = "straight"
        judge' [(1, c1), (1, c2), (1, c3), (1, c4), (1, c5)]
            | [c1, c2, c3, c4, c5] == [c1 .. c5] = "straight"
            | otherwise                          = "null"
        judge' [(1, _), (1, _), (3, _)] = "three card"
        judge' [(1, _), (2, _), (2, _)] = "two pair"
        judge' [(1, _), (1, _), (1, _), (2, _)] = "one pair"
        judge' _ = "null"

main :: IO ()
main = T.interact $ T.unlines . map judge . map (map fst) .
    map rights . map (map T.decimal) . map (T.splitOn ",") . T.lines