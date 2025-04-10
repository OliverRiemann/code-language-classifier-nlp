import Control.Applicative
import Control.Monad
import Text.Printf

type Point = (Double, Double)

main :: IO ()
main = do
  n <- readLn
  ls <- replicateM n $ map read . words <$> getLine
  forM_ ls $ \[x1,y1,x2,y2,x3,y3] -> do
    let a = (x1,y1)
        b = (x2,y2)
        c = (x3,y3)
        sin2A = sinT2 a b c
        sin2B = sinT2 b c a
        sin2C = sinT2 c a b
        sinA = sinT a b c
        r = sqrt (distSq b c) / (2*sinA)
        (px, py) = (a`ptProd`sin2A `ptAdd` b`ptProd`sin2B `ptAdd` c`ptProd`sin2C) `ptProd` (recip (sin2A+sin2B+sin2C))
    printf "%.3f %.3f %.3f\n" px py r

distSq :: Point -> Point -> Double
distSq (x1,y1) (x2,y2) = (x2-x1)**2 + (y2-y1)**2

sinT :: Point -> Point -> Point -> Double
sinT p1 p2 p3 = sqrt (1-cosT**2)
  where
    e1 = distSq p2 p3
    e2 = distSq p3 p1
    e3 = distSq p1 p2
    cosT = (e2+e3-e1)/(2*sqrt e2*sqrt e3)

sinT2 :: Point -> Point -> Point -> Double
sinT2 p1 p2 p3 = 2*sqrt (1-cosT**2)*cosT
  where
    e1 = distSq p2 p3
    e2 = distSq p3 p1
    e3 = distSq p1 p2
    cosT = (e2+e3-e1)/(2*sqrt e2*sqrt e3)

infixl 6 `ptAdd`
ptAdd :: Point -> Point -> Point
ptAdd (x1,y1) (x2,y2) = (x1+x2, y1+y2)

infixl 7 `ptProd`
ptProd :: Point -> Double -> Point
ptProd (x,y) k = (k*x, k*y)