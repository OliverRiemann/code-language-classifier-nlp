import Control.Monad
import Control.Applicative
import Data.Functor
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
getInt = readLn :: IO Int
getInts = map readInt . words <$> getLine
sjoin :: (Show a) => [a] -> String
sjoin = unwords . map show
cond :: a -> a -> Bool -> a
cond t f c = if c then t else f
-- end of templete

judge :: String -> Int -> Int -> ((Int, Int) -> [(Int, Int)]) -> [String] -> Maybe String
judge res w h gen field = res <$ (guard . getAny . foldMap Any . map (all hit) . map gen $ points)
  where
    points = [(x, y) | x <- [0..(8-w)], y <- [0..(8-h)]]
    hit (x, y) = field !! y !! x == '1'

ds :: [(Int, Int)] -> (Int, Int) -> [(Int, Int)]
ds ps (a, b) = [(x+a, y+b) | (x, y) <- ps]

functs = [judge "A" 2 2 $ ds [(0,0),(0,1),(1,0),(1,1)], 
          judge "B" 1 4 $ ds [(0,0),(0,1),(0,2),(0,3)],
          judge "C" 4 1 $ ds [(0,0),(1,0),(2,0),(3,0)],
          judge "D" 2 3 $ ds [(1,0),(0,1),(1,1),(0,2)],
          judge "E" 3 2 $ ds [(0,0),(1,0),(1,1),(2,1)],
          judge "F" 2 3 $ ds [(0,0),(0,1),(1,1),(1,2)],
          judge "G" 3 2 $ ds [(1,0),(2,0),(0,1),(1,1)]
          ]

main = do
    ls <- splitWhen null . lines <$> getContents
    forM_ ls $ \field -> do
        putStrLn $ fromJust $ mconcat $ map ($field) functs