import Control.Applicative
import Control.Monad

main :: IO ()
main = solve <$> replicateM 9 f >>= putStrLn
  where
    f = map g <$> getLine
    g '0' = False
    g '1' = True

solve :: [[Bool]] -> String
solve mp = f (0, 0) [R]
  where
    f (i, j) (R:rs)
      | i > 0 && mp !! (i-1) !! (j+1) = f (i-1, j+1) (U:R:rs)
      | j < 3 && mp !! i !! (j+1) = f (i, j+1) (R:R:rs)
      | i < 8 && mp !! (i+1) !! (j+1) = f (i+1, j+1) (D:R:rs)
      | otherwise = f (i, j) (L:R:rs)
    f (i, j) (D:rs)
      | j < 4 && mp !! (i+1) !! j = f (i+1, j) (R:D:rs)
      | i < 7 && mp !! (i+2) !! j = f (i+2, j) (D:D:rs)
      | j > 0 = f (i+1, j-1) (L:D:rs)
      | otherwise = f (i, j) (U:D:rs)
    f (0, 0) (L:rs) = concatMap show . reverse $ L:rs
    f (i, j) (L:rs)
      | i < 8 && mp !! (i+1) !! j = f (i+1, j) (D:L:rs)
      | j > 0 && mp !! i !! (j-1) = f (i, j-1) (L:L:rs)
      | i > 0 && mp !! (i-1) !! j = f (i-1, j) (U:L:rs)
      | otherwise = f (i, j) (R:L:rs)
    f (1, 0) (U:rs) = concatMap show . reverse $ U:rs
    f (i, j) (U:rs)
      | j > 0 && mp !! (i-1) !! (j-1) = f (i-1, j-1) (L:U:rs)
      | i > 1 && mp !! (i-2) !! j = f (i-2, j) (U:U:rs)
      | j < 4 && mp !! (i-1) !! j = f (i-1, j) (R:U:rs)
      | otherwise = f (i, j) (D:U:rs)

data Dir = R | D | L | U deriving (Show, Eq)

