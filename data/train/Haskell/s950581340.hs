import Control.Applicative
import Control.Monad
import qualified Data.Array.Unboxed as A
import qualified Data.Array.ST as AS
import Data.List

data Drop = Small | Middle | Large deriving (Enum)
spread :: Drop -> (Int,Int) -> [(Int,Int)]
spread Small = neighbours 1
spread Middle = \(x,y) -> [(x+i,y+j) | i <- [-1..1], j <- [-1..1]]
spread Large = neighbours 2

neighbours :: Int -> (Int,Int) -> [(Int,Int)]
neighbours n (x,y) =
        [(x+i,y+j) | i <- [-n..n], let jw = n - abs i, j <- [-jw..jw]]

dropInk :: [((Int,Int), Drop)] -> A.UArray (Int,Int) Int
dropInk ds = AS.runSTUArray $ do
    paper <- AS.newArray ((0,0), (9,9)) 0
    forM_ ds $ \ (loc, d) ->
        forM_ (spread d loc) $ \ stain ->
            unless (outside stain) $
                AS.readArray paper stain >>= AS.writeArray paper stain . succ
    return paper

outside :: (Int,Int) -> Bool
outside (x,y) = not $ x `elem` [0..9] && y `elem` [0..9]

parseLine :: String -> ((Int,Int), Drop)
parseLine s = let (x:y:d:_) = map read . splitWith ',' $ s
                in ((x,y), toEnum (d-1))

splitWith :: Eq a => a -> [a] -> [[a]]
splitWith c = unfoldr f where
    f [] = Nothing
    f xs = let (pre,post) = break (== c) xs in
        Just (pre, drop 1 post)

main = do
    paper <- A.elems .  dropInk . map parseLine . lines <$> getContents
    print . length . filter (== 0) $ paper
    print . maximum $ paper