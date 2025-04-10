import Control.Monad
import Data.Array.IArray
import Data.Char
import System.IO

type Figure     = (FigName,FigPattern)
type FigPattern = (Int,Int) -> [(Int,Int)]
type FigName    = Char

a :: Figure
a = ('A', \(x,y) -> [(i,j) | i <- [x,x+1], j <- [y,y+1]])
b :: Figure
b = ('B', \(x,y) ->[(i,j) | i <- [x..x+3], j <- [y]])
c :: Figure
c = ('C', \(x,y) -> [(i,j) | i <- [x], j <- [y..y+3]])
d :: Figure
d = ('D', \(x,y) -> [(x,y), (x+1,y-1),(x+1,y),(x+2,y-1)])
e :: Figure
e = ('E', \(x,y) -> [(x,y),(x,y+1),(x+1,y+1),(x+1,y+2)])
f :: Figure
f = ('F', \(x,y) -> [(x,y),(x+1,y),(x+1,y+1),(x+2,y+1)])
g :: Figure
g = ('G', \(x,y) -> [(x,y), (x,y+1), (x+1,y-1), (x+1,y)])


main = do
    eof <- isEOF
    if eof then return ()
           else do
               inputField >>= putStrLn.desideFig.searchFigPos
               main

desideFig pos = map fst $ filter (\(n,p) -> p (head pos) == pos) [a,b,c,d,e,f,g]

inputField :: IO (Array (Int, Int) Int)
inputField = do
    field <- replicateM 8 (fmap (map digitToInt) getLine)
    eof <- isEOF
    unless eof (getLine >> return ())
    return $ getField field

getField = listArray ((0,0),(7,7)).concat

searchFigPos field = [(x,y) | x <- [0..7], y <- [0..7], field ! (x,y) == 1]