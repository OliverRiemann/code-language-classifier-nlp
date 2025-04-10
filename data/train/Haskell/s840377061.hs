import           Data.List
import           Control.Applicative
import           Control.Monad
import           Control.Monad.State

replaceComma :: String -> String
replaceComma []         = []
replaceComma (',' : xs) = ' ' : replaceComma xs
replaceComma (x   : xs) = x : replaceComma xs

readTpl :: IO (Int, Int)
readTpl = do
  (n1 : n2 : _) <- map read . words . replaceComma <$> getLine
  return (n1 - 1, n2 - 1)

elementAt :: Eq a => Int -> [a] -> a
elementAt 0 (a : as) = a
elementAt n (a : as) = elementAt (n - 1) as

changeAt :: Eq a => Int -> a -> [a] -> [a]
changeAt 0 a (_ : ts) = a : ts
changeAt n a (t : ts) = t : changeAt (n - 1) a ts

change :: (Int, Int) -> [Int] -> [Int]
change (a, b) xs = changeAt b a1 $ changeAt a b1 xs
 where
  a1 = elementAt a xs
  b1 = elementAt b xs

changeIO :: StateT [Int] IO ()
changeIO = do
  tpl <- lift readTpl
  modify (change tpl)

main = do
  w       <- readLn
  n       <- readLn
  (_, ns) <- runStateT (replicateM n changeIO) [1 .. w]
  mapM_ print ns

