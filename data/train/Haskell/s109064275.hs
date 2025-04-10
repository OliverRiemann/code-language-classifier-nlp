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

judge c s = any (all ((==c) . (s!!))) $ [[t..t+2] | t <- [0,3,6]] ++ [[t,t+3,t+6] | t <- [0..2]] ++ [[0,4,8], [2,4,6]]
f s = cond "o" (cond "x" "d" $ judge 'x' s) $ judge 'o' s

main = map f . lines <$> getContents >>= mapM_ putStrLn