import           System.IO
import           Text.Printf
import           Data.List
import           Control.Monad

sosuExe :: [Int] -> [Int]
sosuExe (x : tail) = x : (sosuExe $ filter (\n -> mod n x /= 0) tail)

sosus = sosuExe [2 ..]

yakus :: Int -> [Int]
yakus 1 = []
yakus n = x : next
 where
  x = case filter (\a -> mod n a == 0) $ filter (\a -> n >= a) sosus of
    []      -> n
    (w : _) -> w
  next = if x == n then [] else yakus $ div n x

rmi :: Eq a => Int -> [a] -> [a]
rmi n xs = let (h, t) = splitAt n xs in h ++ tail t

interL :: Eq a => [a] -> [a] -> [a]
interL [] _        = []
interL _  []       = []
interL ls (r : rs) = case elemIndex r ls of
  Just x  -> ls !! x : interL (rmi x ls) rs
  Nothing -> interL ls rs

diffL :: Eq a => [a] -> [a] -> [a]
diffL [] _        = []
diffL ls []       = ls
diffL ls (r : rs) = case elemIndex r ls of
  Just x  -> diffL (rmi x ls) rs
  Nothing -> ls

main = do
  (l : r : _) <- fmap (map (yakus . read) . words) getLine
  let res = interL l r
  putStrLn $ printf "%d %d"
                    (product res)
                    (product $ (diffL l res) ++ (diffL r res) ++ res)
  eof <- isEOF
  unless eof $ main

