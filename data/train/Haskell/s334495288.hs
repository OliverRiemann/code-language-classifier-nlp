import Control.Applicative ((<$>), (<*>))
import Control.Monad
import Data.List

main :: IO ()
main = do
  xs <- inpi $ splt toDbl
  mapM_ putStrLn $ solve xs

solve :: [[Double]] -> [String]
solve xs = map pint xs

pint :: [Double] -> String
pint [x1, y1, x2, y2, x3, y3, xp, yp]
  | cr1 > 0 && cr2 > 0 && cr3 > 0 = "YES"
  | cr1 < 0 && cr2 < 0 && cr3 < 0 = "YES"
  | otherwise = "NO"
  where
    p1 = Point x1 y1
    p2 = Point x2 y2
    p3 = Point x3 y3
    pp = Point xp yp
    v1 = toVector p1 p2
    v2 = toVector p2 p3
    v3 = toVector p3 p1
    vp1 = toVector p1 pp
    vp2 = toVector p2 pp
    vp3 = toVector p3 pp
    cr1 = cross v1 vp1
    cr2 = cross v2 vp2
    cr3 = cross v3 vp3
    
toDbl :: String -> Double
toDbl s = read s

splt :: (String -> a) -> String -> [a]
splt f = map f . words

inpi :: (String -> a) -> IO [a]
inpi f = map f . lines <$> getContents

data Point = Point {xop :: Double, yop :: Double} deriving Show
data Vector = Vector {xov :: Double, yov :: Double} deriving Show

cross :: Vector -> Vector -> Double
cross v1 v2 = xov v1 * yov v2 - yov v1 * xov v2

toVector :: Point -> Point -> Vector
toVector p1 p2 = Vector (xop p2 - xop p1) (yop p2 - yop p1)