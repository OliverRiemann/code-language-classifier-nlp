import Control.Applicative ((<$>), (<*>))
import Control.Monad
import Data.List
import Text.Printf

main :: IO ()
main = do
  n <- inp toInt
  xs <- inpn n $ splt toDbl
  mapM_ (\[x,y,z] -> printf "%.3f %.3f %.3f\n" (round3 x) (round3 y) (round3 z)) $ solve xs

solve :: [[Double]] -> [[Double]]
solve = map ccircle

ccircle :: [Double] -> [Double]
ccircle (x0:y0:x1:y1:x2:y2:_) = (fromPoint . head $ intersect pla plb) ++ [r]
  where
    p0 = toPoint x0 y0
    p1 = toPoint x1 y1
    p2 = toPoint x2 y2
    va = toVector p1 p0
    vb = toVector p2 p0
    vc = toVector p2 p1
    st = abs $ crossVector va vb / (lenVector va * lenVector vb)
    r = lenVector vc / (2.0 * st)
    la = sqrt $ r ^ 2 - (lenVector va / 2.0) ^ 2
    lb = sqrt $ r ^ 2 - (lenVector vb / 2.0) ^ 2
    pca = cntPoint p0 p1
    pcb = cntPoint p0 p2
    vua = toUVector $ toNVector va
    vub = toUVector $ toNVector vb
    pla = [mvPoint pca (mulSVector la vua), mvPoint pca (mulSVector (negate la) vua)]
    plb = [mvPoint pcb (mulSVector lb vub), mvPoint pcb (mulSVector (negate lb) vub)]
    
toInt :: String -> Int
toInt s = read s

toDbl :: String -> Double
toDbl s = read s

splt :: (String -> a) -> String -> [a]
splt f = map f . words

inp :: (String -> a) -> IO a
inp f = f <$> getLine

inpn :: Int -> (String -> a) -> IO [a]
inpn n f = map f <$> replicateM n getLine

round3 :: Double -> Double
round3 = (/ 1000) . fromIntegral . round . (* 1000)

data Point = Point Double Double deriving Show
data Vector = Vector Double Double deriving Show

toPoint :: Double -> Double -> Point
toPoint x y = Point x y

fromPoint :: Point -> [Double]
fromPoint (Point x y) = [x, y]

cntPoint :: Point -> Point -> Point
cntPoint (Point x0 y0) (Point x1 y1) = toPoint ((x0 + x1) / 2.0) ((y0 + y1) / 2.0)

toVector :: Point -> Point -> Vector
toVector (Point x0 y0) (Point x1 y1) = Vector (x1 - x0) (y1 - y0)

toNVector :: Vector -> Vector
toNVector (Vector x y) = Vector (negate y) x

toUVector :: Vector -> Vector
toUVector (Vector x y) = Vector (x / l) (y / l)
  where l = sqrt $ x ^ 2 + y ^ 2

mulSVector :: Double -> Vector -> Vector
mulSVector s (Vector x y) = Vector (s * x) (s * y)

lenVector :: Vector -> Double
lenVector (Vector x y) = sqrt $ x ^ 2 + y ^ 2

crossVector :: Vector -> Vector -> Double
crossVector (Vector x0 y0) (Vector x1 y1) = x0 * y1 - x1 * y0

mvPoint :: Point -> Vector -> Point
mvPoint (Point px py) (Vector vx vy) = toPoint (px + vx) (py + vy)

instance Eq Point where
  (Point x0 y0) == (Point x1 y1) = (abs (x0 - x1) < 0.000000001) && (abs (y0 - y1) < 0.000000001)