import Control.Applicative ((<$>), (<*>))
import Control.Monad
import Data.List
import Text.Printf

main :: IO ()
main = do
  xs <- map (map toDbl . words) . lines <$> getContents
  mapM_ (\(x, y) -> printf "%.3f %.3f\n" x y) $ solve xs

solve :: [[Double]] -> [(Double, Double)]
solve xs = map smeqn xs

toDbl :: String -> Double
toDbl s = read s

smeqn :: [Double] -> (Double, Double)
smeqn xs = (round3 x, round3 y)
  where
    a : b : c : d : e : f : _ = xs
    ma = toMat a b d e
    mb = toMat c 0 f 0
    (Mat x _ y _) = mulMat (revMat ma) mb

round3 :: Double -> Double
round3 = (/ 1000) . fromIntegral . round . (* 1000)

data Mat = Mat Double Double Double Double deriving Show

mulMat :: Mat -> Mat -> Mat
mulMat (Mat a b c d) (Mat e f g h) = Mat (a * e + b * g) (a * f + b * h) (c * e + d * g) (c * f + d * h)

revMat :: Mat -> Mat
revMat (Mat a b c d) = Mat (d / det) (b * (-1) / det) (c * (-1) / det) (a / det)
  where det = a * d - b * c

toMat :: Double -> Double -> Double -> Double -> Mat
toMat a b c d = Mat a b c d

inp :: (String -> a) -> IO a
inp f = f <$> getLine

inps :: Int -> (String -> a) -> IO [a]
inps n f = map f <$> replicateM n getLine