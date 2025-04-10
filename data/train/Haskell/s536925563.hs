import Control.Applicative ((<$>), (<*>))
import Control.Monad
import Data.List
import Data.Array

main :: IO ()
main = do
  n <- getl toInt
  when (n /= 0) $ do
    m <- getl toInt
    l <- getl toInt
    d <- getl toInt
    xs <- rgetl d id
    putStrLn $ solve n m l d xs
    main
    
solve :: Int -> Int -> Int -> Int -> [String] -> String
solve n m l d xs
  | goal lots d m == l = "0"
  | null rs = "1"
  | otherwise = (show .fst . head) rs ++ " " ++ (show . snd . head) rs
  where
    rs = [(i,j) | i <- [1..d], j <- [1..n-1], lots ! (i, j-1) == '0', lots ! (i, j) == '0', lots ! (i, j+1) == '0', goal (lots // [((i,j),'1')]) d m == l ]
    lots = array ((1,0),(d,n)) els
    els = [((i,0),'0')|i <- [1..d]] ++ [((i,n),'0')|i <- [1..d]] ++ [((i,j), xs !! (i-1) !! (j-1))|i <- [1..d], j <- [1..n-1]]

goal :: Array (Int,Int) Char -> Int -> Int -> Int
goal arr d s = foldl f s [1..d]
  where
    f c r
      | arr ! (r, c-1) == '1' = c-1
      | arr ! (r, c) == '1' = c+1
      | otherwise = c
          
toInt :: String -> Int
toInt s = read s

getl :: (String -> a) -> IO a
getl f = f <$> getLine

rgetl :: Int -> (String -> a) -> IO [a]
rgetl n f = map f <$> replicateM n getLine