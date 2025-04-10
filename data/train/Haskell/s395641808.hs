import Control.Applicative ((<$>), (<*>))
import Control.Monad
import Data.List
import Data.Array
import Text.Printf

main :: IO ()
main = do
  n <- getl toInt
  solve n 1

solve :: Int -> Int -> IO ()
solve n i = do
  when (i <= n) $ do
    getLine
    ss <- replicateM 8 getLine
    x <- getl toInt
    y <- getl toInt
    printf "Data %d:\n" i
    mapM_ putStrLn $ bomb ss (y, x)
    solve n (i + 1)

bomb :: [String] -> (Int, Int) -> [String]
bomb ss (y, x) = split8 $ elems $ f fld (y, x)
  where
    fld = listArray ((1,1),(8,8)) $ concat ss
    f arr (i,j)
      | arr ! (i,j) == '0' = arr
      | otherwise = foldl f (arr // [((i,j),'0')]) ps
      where
        ps = [(ii,jj)|(ii,jj) <- [(i+1,j),(i+2,j),(i+3,j),(i-1,j),(i-2,j),(i-3,j),(i,j+1),(i,j+2),(i,j+3),(i,j-1),(i,j-2),(i,j-3)], ii >= 1, ii <= 8, jj >= 1, jj <= 8]
    split8 xs
      | null xs = []
      | otherwise  = take 8 xs : split8 (drop 8 xs)

toInt :: String -> Int
toInt s = read s

getl :: (String -> a) -> IO a
getl f = f <$> getLine