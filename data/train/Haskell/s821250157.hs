import Control.Applicative
import Control.Monad
import Control.Monad.ST
import qualified Data.ByteString as BS
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
-- templete



data IOHeap e = IOHeap (IORef Int) (IOArray Int e)


newIOHeap :: (Ord e) => Int -> e -> IO (IOHeap e)
newIOHeap n d = do
    count <- newIORef 0
    heap <- newArray (1,n) d
    return $ IOHeap count heap

swapH :: (Ord e) => IOHeap e -> Int -> Int -> IO ()
swapH h@(IOHeap count heap) i j = do
    t <- readArray heap i
    readArray heap j >>= writeArray heap i
    writeArray heap j t

siftUpH :: (Ord e) => IOHeap e -> Int -> IO ()
siftUpH h@(IOHeap count heap) i = when (i>1) $ do
    let parent = i `div` 2
    v_i <- readArray heap i
    v_p <- readArray heap parent
    when (v_i < v_p) $ do
        swapH h i parent
        siftUpH h parent

siftDownH :: (Ord e) => IOHeap e -> Int -> IO ()
siftDownH h@(IOHeap count heap) i = do
    n <- readIORef count
    let left = i * 2
    when (left <= n) $ do
        v_l <- readArray heap left
        let right = left + 1
        child <- if right <= n then do
                      v_r <- readArray heap right
                      return $ if v_l < v_r then left else right
                    else return left
        v_i <- readArray heap i
        v_c <- readArray heap child
        when (v_i > v_c) $ do
            swapH h i child
            siftDownH h child

pushH :: (Ord e) => IOHeap e -> e -> IO ()
pushH h@(IOHeap count heap) e = do
    n <- readIORef count
    let n' = n + 1
    writeIORef count n'
    writeArray heap n' e
    siftUpH h n'

popH :: (Ord e) => IOHeap e -> IO e
popH h@(IOHeap count heap) = do
    n <- readIORef count
    writeIORef count (n-1)
    res <- readArray heap 1
    readArray heap n >>= writeArray heap 1
    siftDownH h 1
    return res

emptyH :: IOHeap e -> IO Bool
emptyH h@(IOHeap count heap) = (==0) <$> readIORef count


main = do
    heap <- newIOHeap 2000000 0 :: IO (IOHeap Int)
    map negate <$> getInts >>= mapM_ (pushH heap)
    replicateM 5 (popH heap) >>= putStrLn . sjoin . map negate


