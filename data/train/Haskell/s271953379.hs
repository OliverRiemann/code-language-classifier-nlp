import Control.Applicative
import Control.Monad
import Control.Monad.ST
-- import qualified Data.ByteString as BS
import Data.Functor
import Data.Function
import Data.Monoid
import Data.Maybe
import Data.List
import qualified Data.Foldable as Foldable
import qualified Data.Set as Set
--import qualified Data.Sequence as Sequence
import Data.List.Split
import Data.Bits
import Data.Char
import Data.Ix
import Data.Ratio
import Data.Ord
import Data.Tuple
import Data.Array
--import Data.Array.Unboxed
--import Data.Array.IArray
import Data.Array.MArray
import Data.Array.IO
import Data.Array.ST
import Data.IORef
import Data.STRef
import Text.Printf
import GHC.ST
-- import System.IO.Unsafe
 
-- templete
readInt = read :: String -> Int
readInteger = read :: String -> Integer
readDouble = read :: String -> Double
getInt = readLn :: IO Int
getInts = map readInt . words <$> getLine
getInteger = readLn :: IO Integer
getIntegers = map readInteger . words <$> getLine
getDouble = readLn :: IO Double
getDoubles = map readDouble . words <$> getLine
sjoin :: (Show a) => [a] -> String
sjoin = unwords . map show
tjoin :: (Show a, Show b) => (a, b) -> String
tjoin (x, y) = show x ++ (' ' : show y)
cond :: a -> a -> Bool -> a
cond t f c = if c then t else f
apply2 :: (a -> a -> b) -> [a] -> b
apply2 f [x,y] = f x y
apply3 :: (a -> a -> a -> b) -> [a] -> b
apply3 f [x,y,z] = f x y z
apply4 :: (a -> a -> a -> a -> b) -> [a] -> b
apply4 f [x,y,z,w] = f x y z w
fnTuple :: (a -> b, a -> c) -> a -> (b, c)
fnTuple (f,g) a = (f a, g a)
replace :: (Eq a) => a -> a -> [a] -> [a]
replace x y = map (\z -> if z==x then y else z)
binMap :: (a -> a -> b) -> [a] -> [b]
binMap f (x:xs@(y:_)) = f x y : binMap f xs
binMap _ _ = []
splitRec :: Int -> [a] -> [[a]]
splitRec _ [] = []
splitRec n xs = let (y,ys) = splitAt n xs in y : splitRec n ys
infixl 7 `divCeil`
divCeil :: Integral a => a -> a -> a
x `divCeil` y = (x+y-1) `div` y
coverC :: Ord a => (a, a) -> a -> Bool
coverC (l,r) x = l<=x && x<=r
coverH :: Ord a => (a, a) -> a -> Bool
coverH (l,r) x = l<=x && x<r
ibsearch :: (Int -> Bool) -> (Int,Int) -> Int
ibsearch f (ok,ng) = if abs (ok-ng) <= 1 then ok else let mid = (ok + ng) `div` 2 in ibsearch f (if f mid then (mid,ng) else (ok,mid))
whenM :: Monad m => m Bool -> m () -> m ()
whenM c a = c >>= flip when a
unconsU :: [a] -> (a, [a])
unconsU (x:xs) = (x, xs)
-- templete

calc :: [Double] -> String
calc [a,b,c,d,e,f] = printf "%.3f %.3f" fx fy
  where
    det = a*e - b*d
    det1 = c*e - b*f
    det2 = a*f - c*d
    x = det1 / det
    y = det2 / det
    fx = (/1000) $ fromIntegral $ floor $ 1000*x+0.5 :: Double
    fy = (/1000) $ fromIntegral $ floor $ 1000*y+0.5 :: Double
    

main = map (map readDouble . words) . lines <$> getContents >>= mapM_ (putStrLn . calc)
    
