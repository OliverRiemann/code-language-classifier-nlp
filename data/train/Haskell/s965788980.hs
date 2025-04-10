module Main (main) where
import Data.List.Split
import Control.Monad
import Control.Applicative
import Text.Printf
main :: IO ()
main = do
  n <- readLn
  replicateM_ n $ do
    ps <- getPoints
    let (x,y,z) = solve ps
    printf "%.3f %.3f %.3f\n" x y z


type Point = (Double,Double)

getPoints :: IO [Point]
getPoints = map mkPair . chunksOf 2 . map read . words <$> getLine
  where
    mkPair (x:y:_) = (x,y)


{-
(x - px)^2 + (y-py)^2 = (x-qx)^2 + (y - qy)^2
2(qx - px)x + 2(qy - py) = qx^2 + qy^2 - px^2 - py^2
2(rx - px)x + 2(ry - py) = rx^2 + ry^2 - px^2 - py^2
-}

subst (p,q) (r,s) = (p - r,q - s)

solve :: [(Double, Double)] -> (Double, Double, Double)
solve (p@(px,py):(qx,qy):(rx,ry):_) = (x,y,sqrt $ ax*ax + ay*ay)
  where
    (ax,ay) = subst p o
    o@(x,y) = solveEq a b c d e f
    a = 2 * (qx - px)
    b = 2 * (qy - py)
    c = qx*qx + qy*qy - px*px - py*py
    d = 2 * (rx - px)
    e = 2 * (ry - py)
    f = rx*rx + ry * ry - px*px - py*py


solveEq :: Double -> Double -> Double -> Double -> Double -> Double -> (Double, Double)
solveEq a b c d e f = (x,y)
  where
    x = (e * c - b * f) / (a * e - d * b)
    y = (a * f - d * c) / (a * e - d * b)