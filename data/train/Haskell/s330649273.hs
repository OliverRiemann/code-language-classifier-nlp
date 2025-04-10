import Control.Monad
import Control.Applicative
import Data.List
import Data.Char

main = do
  n <- inp toInt
  xs <- inps (2*n) id
  mapM_ putStrLn $ solve xs

solve :: [String] -> [String]
solve [] = []
solve (x:y:ys) = add x y : solve ys

add :: String -> String -> String
add x y = if length rs > 80 then "overflow" else rs
  where rx = map digitToInt $ reverse x
        ry = map digitToInt $ reverse y
        add' :: String -> Int -> [Int] -> [Int] -> String
        add' acc c [] [] = if c == 0 then acc else '1':acc
        add' acc c (x:xs) [] = let (cy,cr) = f (x + c) in add' (cr:acc) cy xs []
        add' acc c [] (y:ys) = let (cy,cr) = f (y + c) in add' (cr:acc) cy [] ys
        add' acc c (x:xs) (y:ys) = let (cy,cr) = f (x + y + c) in add' (cr:acc) cy xs ys
        f :: Int -> (Int, Char)
        f z = if z < 10 then (0,intToDigit z) else (1,intToDigit (z - 10) )
        rs = add' [] 0 rx ry

toInt :: String -> Int
toInt s = read s

inp :: (String -> a) -> IO a
inp f = f <$> getLine

inps :: Int -> (String -> a) -> IO [a]
inps n f = map f <$> replicateM n getLine