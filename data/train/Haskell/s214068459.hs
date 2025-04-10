import Data.Ord (comparing)
import Data.List (foldl',sortBy)
import Data.List.Split (splitOn)
import qualified Data.Map.Strict as Map
import System.IO (isEOF)

type Composition = [(Int,Int)]

main = do
    quit <- isEOF
    if quit then return () else do
        input >>= return . solve >>= output
        main

input :: IO [Int]
input = (map read . splitOn ",") `fmap` getLine

output :: String -> IO ()
output = putStrLn

solve :: [Int] -> String
solve ns = comp `seq` (snd $ head $ filter (\(pred,_) -> pred comp) preds)
    where
    comp = composition ns
    preds = [
        (isFourCard, "four card"),
        (isFullHouse, "full house"),
        (isStraight, "straight"),
        (isThreeCard, "three card"),
        (isTwoPair, "two pair"),
        (isOnePair, "one pair"),
        (const True, "null")]

composition :: [Int] -> Composition
composition ns = sortBy (flip (comparing snd)) $ filter (\(_,c) -> c > 0) $
                 Map.assocs $ foldl' countUp Map.empty ns
    where
    countUp map n = Map.insertWith (+) n 1 map

isFourCard :: Composition -> Bool
isFourCard [(_,4),(_,1)] = True
isFourCard _ = False

isFullHouse :: Composition -> Bool
isFullHouse [(_,3),(_,2)] = True
isFullHouse _ = False

isStraight :: Composition -> Bool
isStraight [(1,1),(10,1),(11,1),(12,1),(13,1)] = True
isStraight [(a,1),(b,1),(c,1),(d,1),(e,1)]
    | b-a==1 && c-b==1 && d-c==1 && e-d==1 = True
isStraight _ = False

isThreeCard :: Composition -> Bool
isThreeCard [(_,3),(_,1),(_,1)] = True
isThreeCard _ = False

isTwoPair :: Composition -> Bool
isTwoPair [(_,2),(_,2),(_,1)] = True
isTwoPair _ = False

isOnePair :: Composition -> Bool
isOnePair [(_,2),(_,1),(_,1),(_,1)] = True
isOnePair _ = False