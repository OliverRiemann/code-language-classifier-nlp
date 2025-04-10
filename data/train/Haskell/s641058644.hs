import Control.Applicative
import Control.Monad
import Control.Monad.ST
import Data.Functor
import Data.Function
import Data.Monoid
import Data.Maybe
import Data.List
import Data.Foldable (foldMap)
import Data.List.Split
import Data.Char
import Data.Ratio
import Data.Ord
import Data.Tuple
import Data.Array.IO
import Data.Array.ST
import Data.IORef
import Data.STRef
 
readInt = read :: String -> Int
readDouble = read :: String -> Double
getInt = readLn :: IO Int
getInts = map readInt . words <$> getLine
sjoin :: (Show a) => [a] -> String
sjoin = unwords . map show
cond :: a -> a -> Bool -> a
cond t f c = if c then t else f
applyBin :: (b -> c -> d) -> (a -> b) -> (a -> c) -> a -> d
applyBin op f g x = op (f x) $ g x
applyUni :: (a -> b -> c) -> (a -> b) -> a -> c
applyUni op f x = op x $ f x
applyTuple :: (a -> b, a -> c) -> a -> (b, c)
applyTuple (f,g) a = (f a, g a)
-- end of templete

magicsq n = runST $ do
    arr <- newArray ((0,0),(n-1,n-1)) 0 :: ST s (STUArray s (Int,Int) Int)
    forM_ (zip [1..] (take n (iterate next' start) >>= take n . iterate next)) $ \(i, p) -> do
        writeArray arr p i
    sequence [concat <$> sequence [show' <$> readArray arr (x,y) | x <- [0..n-1]] | y <- [0..n-1]]
  where
    start = (div n 2, div n 2 + 1)
    next (x,y) = (mod (x+1) n, mod (y+1) n)
    next' (x,y) = (mod (x-1) n, mod (y+1) n)
    

show' n = replicate (4-length s) ' ' ++ s
  where
    s = show n

main = takeWhile (/=0) . map readInt . lines <$> getContents >>= mapM_ (mapM_ putStrLn . magicsq)