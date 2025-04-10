import Control.Applicative ((<$>), (<*>))
import Control.Monad
import Data.List
import Data.Array

main :: IO ()
main = do
  n <- getl toInt
  when (n /= 0) $ do
    putStr $ solve n
    main

solve :: Int -> String
solve n = unlines . map concat . split n . map toStr $ elems msqr
  where
    (_,msqr) = foldl putnum (((n+1) `div` 2 + 1, (n+1) `div` 2),(listArray ((1,1),(n,n)) $ repeat 0)) [1..n^2]
    putnum :: ((Int,Int), Array (Int,Int) Int) -> Int -> ((Int,Int), Array (Int,Int) Int)
    putnum ((i,j),ar) k = let nar = ar // [((i,j),k)] in (next nar (i+1,j+1),nar)
    next ar (y, x)
      | y == n+1 && x == n+1 = next ar (1,1)
      | y == n+1 && x == 0 = next ar (1,n)
      | y == n+1 = next ar (1,x)
      | x == n+1 = next ar (y,1)
      | x == 0 = next ar (y,n)
      | ar ! (y,x) /= 0 = next ar (y+1,x-1)
      | otherwise = (y,x)
        
toStr :: Int -> String
toStr x
  | x >= 100 = " " ++ show x
  | x >= 10 = "  " ++ show x
  | otherwise = "   " ++ show x

split :: Int -> [a] -> [[a]]
split n xs
  | null zs = [ys]
  | otherwise = ys : split n zs
  where
    (ys,zs) = splitAt n xs

toInt :: String -> Int
toInt s = read s

getl :: (String -> a) -> IO a
getl f = f <$> getLine