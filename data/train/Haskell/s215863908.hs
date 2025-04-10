import Control.Applicative ((<$>), (<*>))
import Control.Monad
import Data.List
import Data.Array

main :: IO ()
main = do
  xs <- getc split
  mapM_ print $ solve xs

solve :: [[String]] -> [Int]
solve = map noi

noi :: [String] -> Int
noi ss = fst $ foldl count (0, iarr) idx
  where
    iarr = listArray ((0,0),(11,11)) $ concat ss
    idx = [(i,j)|i <- [0..11], j <- [0..11]]

count :: (Int, Array (Int,Int) Char) -> (Int,Int) -> (Int, Array (Int,Int) Char)
count (x, arr) (i,j)
  | arr ! (i,j) == '1' = (x+1, clear arr (i,j))
  | otherwise = (x, arr)

clear :: Array (Int,Int) Char -> (Int,Int) -> Array (Int,Int) Char
clear arr (i,j)
  | i < 0 || i > 11 || j < 0 || j > 11 = arr
  | arr ! (i,j) == '0' = arr
  | otherwise = foldl clear (arr // [((i,j),'0')]) [(i+1,j),(i,j+1),(i-1,j),(i,j-1)]
    
split :: [String] -> [[String]]
split ss
  | null bs = [as]
  | otherwise = as : split (tail bs)
  where
    (as, bs) = span (/= "") ss

getc :: ([String] -> a) -> IO a
getc f = f . lines <$> getContents