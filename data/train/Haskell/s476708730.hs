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

f :: (IOUArray (Int,Int) Char) -> (Int,Int) -> IO ()
f arr p@(y,x) = do
    c <- readArray arr p
    when (c=='1') $ do
        writeArray arr p '0'
        forM_ [1..3] $ \i -> do
            when (y-i>=1) $ f arr (y-i,x)
            when (y+i<=8) $ f arr (y+i,x)
            when (x-i>=1) $ f arr (y,x-i)
            when (x+i<=8) $ f arr (y,x+i)




main = do
    n <- getInt
    forM_ [1..n] $ \i -> do
        getLine
        field <- replicateM 8 getLine
        [sx, sy] <- replicateM 2 getInt
        arr <- newListArray ((1,1),(8,8)) $ concat field :: IO (IOUArray (Int,Int) Char)
        f arr (sy,sx)
        res <- sequence [sequence [readArray arr (y,x) | x <- [1..8]] | y <- [1..8]]
        putStrLn $ "Data " ++ show i ++ ":"
        mapM_ putStrLn res
        return ()