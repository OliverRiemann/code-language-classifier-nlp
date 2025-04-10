import Control.Monad
import Control.Applicative
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
import Data.IORef
import Control.Monad.ST
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

f (x,y) 1 = [x,y]
f (x,y) n = f (x+dx,y+dy) (n-1)
  where
    r = sqrt $ x ^ 2 + y ^ 2
    dx = (-y) / r
    dy = x / r

main = map (f (1,0)) . takeWhile (/=(-1)) . map readInt . lines <$> getContents >>= mapM_ (mapM_ print)