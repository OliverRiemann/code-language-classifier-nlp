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

fill :: (IORef Int) -> (IOUArray (Int, Int) Char) -> (Int, Int) -> IO ()
fill ref arr p = do
    c <- readArray arr p
    when (c=='1') $ do
        modifyIORef ref (+1)
        fill' arr p

fill' :: (IOUArray (Int, Int) Char) -> (Int, Int) -> IO ()
fill' arr p@(x,y) = do
    c <- readArray arr p
    when (c=='1') $ do
        writeArray arr p '0'
        mapM_ (fill' arr) $ [(x+dx, y) | dx <- [1,-1]] ++ [(x,y+dy) | dy <- [1,-1]]


main = do
    d <- map (((replicate 14 '0':) . (++[replicate 14 '0'])) . map (('0':) . (++"0"))) . splitWhen (=="") . lines <$> getContents
    forM_ d $ \f -> do 
        ref <- newIORef 0
        arr <- newListArray ((0,0),(13,13)) $ concat f
        mapM_ (fill ref arr) [(x,y) | x <- [1..12], y <- [1..12]]
        readIORef ref >>= print