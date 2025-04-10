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
-- end of templete

f cs@[c1,c2,c3] = cond "YES" "NO" $ (>=4) $ length $ filter (<=20) $ map (+my) remain
  where
    remain = [x | x <- [1..10], x `notElem` cs]
    my = c1+c2

main = do
    input <- lines <$> getContents
    let (list, (_:remain)) = break (=="0,0") input
    let rank = zip [1..] $ map (map head) $ groupBy (on (==) (!!1)) $ sortBy (on (flip compare) (!!1)) $ map (map readInt . wordsBy (==',')) list 
    forM_ (map readInt remain) $ \i -> print $ fst $ fromJust $ find (elem i . snd) rank