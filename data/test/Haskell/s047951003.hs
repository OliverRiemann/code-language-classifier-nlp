import Control.Applicative ((<$>), (<*>))
import Control.Monad
import Data.List
import Data.List.Split (splitOn)

main :: IO ()
main = do
  xs <- readResult []
  ys <- getc toInt
  mapM_ print $ solve xs ys

solve :: [(Int,Int)] -> [Int] -> [Int]
solve tbl qs = map (toRank db) qs
  where
    stbl = sortBy (\i j -> compare (snd j) (snd i)) tbl
    db = setRank 1 [] stbl
    
readResult :: [(Int,Int)] -> IO [(Int,Int)]
readResult acc = do
  [x,y] <- getl $ map toInt . splitOn ","
  if (x == 0 && y == 0)
    then return acc
    else readResult ((x,y) : acc)

setRank :: Int -> [(Int,Int)] -> [(Int,Int)] -> [(Int,Int)]
setRank r acc [(n1, p1)] = (n1, r) : acc
setRank r acc ((n1, p1) : (n2, p2) : xs)
  | p1 == p2 = setRank r ((n1, r) : acc) ((n2,p2) : xs)
  | otherwise = setRank (r + 1) ((n1, r) : acc) ((n2,p2) : xs)

toRank :: [(Int,Int)] -> Int -> Int
toRank db i = let Just r = lookup i db in r
    
toInt :: String -> Int
toInt s = read s

getl :: (String -> a) -> IO a
getl f = f <$> getLine

getc :: (String -> a) -> IO [a]
getc f = map f . lines <$> getContents