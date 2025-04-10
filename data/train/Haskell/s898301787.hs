import Control.Monad (replicateM,unless)
import Data.List (lookup)
import Data.Maybe (fromJust)
import System.IO (isEOF)

type Surface = [String]
type Coord = (Int, Int)

figures :: [([Coord], Char)]
figures = [
    ([(0,0),(1,0),(0,1),(1,1)], 'A'),
    ([(0,0),(0,1),(0,2),(0,3)], 'B'),
    ([(0,0),(1,0),(2,0),(3,0)], 'C'),
    ([(1,0),(0,1),(1,1),(0,2)], 'D'),
    ([(0,0),(1,0),(1,1),(2,1)], 'E'),
    ([(0,0),(0,1),(1,1),(1,2)], 'F'),
    ([(1,0),(2,0),(0,1),(1,1)], 'G')
    ]

main = do
    quit <- isEOF
    if quit then return () else do
        input >>= return . solve >>= output
        main

input :: IO Surface
input = do
    lines <- replicateM 8 getLine

    -- consume empty line unless EOF
    eof <- isEOF
    unless eof (getLine >> return ())

    return lines

output :: Char -> IO ()
output c = putStrLn [c]

solve :: Surface -> Char
solve s = fromJust $ lookup (adjust $ coords s) figures

coords :: Surface -> [Coord]
coords ls = concat $ zipWith lineCoords [0..] ls
    where
    lineCoords y l = lineCoords' y 0 l
    lineCoords' y x "" = []
    lineCoords' y x ('1':cs) = (x,y):lineCoords' y (x+1) cs
    lineCoords' y x (_:cs) = lineCoords' y (x+1) cs

adjust :: [Coord] -> [Coord]
adjust cs = minX `seq` minY `seq` map (`sub` (minX,minY)) cs
    where
    minX = minimum $ map fst cs
    minY = minimum $ map snd cs
    (ax,ay) `sub` (bx,by) = (ax-bx,ay-by)