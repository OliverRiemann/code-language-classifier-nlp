import Control.Monad
import Text.Printf

solveCenter1 :: (Double, Double, Double, Double, Double, Double) -> (Double, Double)
solveCenter1 (_, b, c, d, e, f) = (x, y)
    where y = c / b
          x = (f - e * y) / d

solveCenter2 :: (Double, Double, Double, Double, Double, Double) -> (Double, Double)
solveCenter2 (a, b, c, d, e, f) = (x, y)
    where y = (a * f - c * d) / (a * e - b * d)
          x = (c - b * y) / a

solveCenter :: (Double, Double, Double, Double, Double, Double) -> (Double, Double)
solveCenter (a, b, c, d, e, f)
    | a == 0    = solveCenter1 (a, b, c, d, e, f)
    | otherwise = solveCenter2 (a, b, c, d, e, f)

solve :: [Double]-> (Double, Double, Double)
solve xs = (x, y, r)
    where x1     = xs !! 0
          y1     = xs !! 1
          x2     = xs !! 2
          y2     = xs !! 3
          x3     = xs !! 4
          y3     = xs !! 5
          a      = 2 * (x1 - x2)
          b      = 2 * (y1 - y2)
          c      = x1 ^ 2 - x2 ^ 2 + y1 ^ 2 - y2 ^ 2
          d      = 2 * (x1 - x3)
          e      = 2 * (y1 - y3)
          f      = x1 ^ 2 - x3 ^ 2 + y1 ^ 2 - y3 ^ 2
          (x, y) = solveCenter (a, b, c, d, e, f)
          r      = sqrt ((x1 - x) ^ 2 + (y1 - y) ^ 2)

format :: (Double, Double, Double) -> String
format (x, y, r) = printf "%.3f %.3f %.3f" x y r

main :: IO ()
main = do
    n     <- readLn
    lines <- replicateM n getLine
    mapM_ (putStrLn . format . solve . map read . words) lines