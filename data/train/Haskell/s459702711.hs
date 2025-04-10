import Control.Applicative ((<$>), (<*>))
import Control.Monad
import Data.List
import Data.Array
import Data.Char (digitToInt)

main :: IO ()
main = do
  xs <- inpi $ map digitToInt
  mapM_ (putStrLn . unwords . map show) $ solve xs

solve :: [[Int]] -> [[Int]]
solve = map puzzle

puzzle :: [Int] -> [Int]
puzzle xs = if null ys then [0] else ys
  where
    iarr = accumArray (+) 0 (1,9) $ (map (\x -> (head x, length x)) . group . sort) xs
    ys = filter (agari iarr) [1..9]
    
agari :: Array Int Int -> Int -> Bool
agari arr i = if arr ! i == 4 then False else findAg ars1
  where
    ar1 = accum (+) arr [(i,1)]
    ars1 = jantou ar1
    ag = accumArray (+) 0 (1,9) [(n,0) | n <- [1..9]]
    findAg xs | null xs = False
              | ag `elem` xs = True
              | otherwise = findAg ((concat [syuntsu a | a <- xs]) ++ (concat [koutsu a | a <- xs]))
    
jantou :: Array Int Int -> [Array Int Int]
jantou arr = [accum (-) arr [(i,2)] | i <- [1..9], arr ! i >= 2]

syuntsu :: Array Int Int -> [Array Int Int]
syuntsu arr = [accum (-) arr [(i,1),(i+1,1),(i+2,1)] | i <- [1..7], arr ! i >= 1, arr ! (i + 1) >= 1, arr ! (i + 2) >= 1]

koutsu :: Array Int Int -> [Array Int Int]
koutsu arr = [accum (-) arr [(i,3)] | i <- [1..9], arr ! i >= 3]

inpi :: (String -> a) -> IO [a]
inpi f = map f . lines <$> getContents