import Control.Monad
import Control.Applicative
import Data.List
import Data.List.Split

data Vec = Vec Double Double

crossp :: Vec -> Vec -> Double
crossp (Vec x1 y1) (Vec x2 y2) = x1 * y2 - x2 * y1

eps :: Double
eps = 0.0000000001

main = do
  xs <- input (map read . splitOn ",") :: IO [[Double]]
  mapM_ putStrLn $ solve xs

solve :: [[Double]] -> [String]
solve = map isConvex

isConvex :: [Double] -> String
isConvex [xa, ya, xb, yb, xc, yc, xd, yd] | ca > eps && cb > eps && cc > eps && cd > eps = "YES"
                                          | ca < (-eps) && cb < (-eps) && cc < (-eps) && cd < (-eps) = "YES"
                                          | otherwise = "NO"
  where
    ca = crossp (Vec (xb - xa) (yb - ya)) (Vec (xc - xb) (yc - yb))
    cb = crossp (Vec (xc - xb) (yc - yb)) (Vec (xd - xc) (yd - yc))
    cc = crossp (Vec (xd - xc) (yd - yc)) (Vec (xa - xd) (ya - yd))
    cd = crossp (Vec (xa - xd) (ya - yd)) (Vec (xb - xa) (yb - ya))

input :: (String -> a) -> IO [a]
input f = map f . lines <$> getContents 