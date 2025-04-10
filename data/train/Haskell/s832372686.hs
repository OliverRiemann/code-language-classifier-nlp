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
import Data.Array.IO
import Data.IORef
 
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

toSecond h m s = s + (m + h * 60) * 60
toHMSStr s = intercalate ":" $ map show' [div s 3600, (flip mod 60 . flip div 60) s, mod s 60]
  where show' n = if n<10 then "0" ++ show n else show n

main = takeWhile (any (/=(-1))) . map (map readInt . words) . lines <$> getContents >>= mapM_ (\[h,m,s] -> let remain = toSecond 2 0 0 - toSecond h m s in putStrLn (toHMSStr remain) >> putStrLn (toHMSStr (3 * remain)))