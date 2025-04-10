import Control.Applicative ((<$>), (<*>))
import Control.Monad
import Data.List
import Data.List.Split (splitOn)

main :: IO ()
main = do
  n <- getl toInt
  when (n /= 0) $ do
    xs <- rgetl n $ (\[x,y] -> Point x y) . map toDbl . splitOn ","
    print $ solve xs
    main

solve :: [Point] -> Int
solve ps = length ps - length ups - length lps + 2
  where
    sps = sort ps
    ups = hch sps
    lps = (hch . reverse) sps

isConvex :: Point -> Point -> Point -> Bool
isConvex p0 p1 p2 = cross v0 v1 < 0.0
  where
    v0 = toVect p0 p1
    v1 = toVect p0 p2

ch :: [Point] -> [Point]
ch ps
  | length ps < 3 = ps
  | isConvex p0 p1 p2 = ps
  | otherwise = ch (p2:p0:rs)
  where
    (p2:p1:p0:rs) = ps
    
hch :: [Point] -> [Point]
hch ps = foldl f [] ps
  where
    f xs p = ch (p:xs)
    
toInt :: String -> Int
toInt s = read s

toDbl :: String -> Double
toDbl s = read s

getl :: (String -> a) -> IO a
getl f = f <$> getLine

rgetl :: Int -> (String -> a) -> IO [a]
rgetl n f = map f <$> replicateM n getLine

eps :: Double
eps = 1e-9
 
data Point = Point {xop :: Double, yop :: Double} deriving Show
data Vect = Vect {xov :: Double, yov :: Double} deriving Show

cross :: Vect -> Vect -> Double
cross v1 v2 = xov v1 * yov v2 - yov v1 * xov v2
 
toVect :: Point -> Point -> Vect
toVect p1 p2 = Vect (xop p2 - xop p1) (yop p2 - yop p1)

instance Eq Point where
  x == y = abs (xop x - xop y) < eps && abs (xop x - xop y) < eps

instance Ord Point where
  compare x y 
    | abs (xop x - xop y) < eps && abs (yop x - yop y) < eps = EQ
    | xop x < xop y = LT
    | xop x > xop y = GT
    | abs (xop x - xop y) < eps && yop x < yop y = LT
    | abs (xop x - xop y) < eps && yop x > yop y = GT