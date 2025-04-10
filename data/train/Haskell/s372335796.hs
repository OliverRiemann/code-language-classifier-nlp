import Data.Array (Array, listArray, bounds, accum, elems)
import System.IO (isEOF)

type Point = (Int,Int)
type Paper = Array Point Int

main = main' initPaper
    where
    main' paper = do
        quit <- isEOF
        if quit then do
            print (length $ filter (==0) $ elems paper)
            print (maximum $ elems paper)
        else do
            line <- getLine
            let
                [x,y,inkSize] = map read $ split ',' line
            main' (dropInk paper (x,y) inkSize)

split :: Char -> String -> [String]
split ch s = case rest of
    "" -> [word]
    _:rest' -> word : split ch rest'
    where
    (word,rest) = break (==ch) s

(<+>) :: Point -> (Int,Int) -> Point
(x,y) <+> (dx,dy) = (x+dx,y+dy)

initPaper :: Paper
initPaper = listArray ((0,0),(9,9)) [0,0..]

inBounds :: Paper -> Point -> Bool
inBounds paper (x,y) = x>=minX && x<=maxX && y>=minY && y<=maxY
    where
    ((minX,minY),(maxX,maxY)) = bounds paper

dropInk :: Paper -> Point -> Int -> Paper
dropInk paper point inkSize = accum (+) paper (zip inkPoints [1,1..])
    where
    inkPoints = filter (inBounds paper) $ map (point <+>) inkShifts
    inkShifts = case inkSize of
        1 -> [(0,0),(1,0),(-1,0),(0,1),(0,-1)] 
        2 -> [(0,0),(1,0),(-1,0),(0,1),(0,-1),(1,1),(1,-1),(-1,1),(-1,-1)]
        3 -> [(0,0),(1,0),(-1,0),(0,1),(0,-1),(1,1),(1,-1),(-1,1),(-1,-1),
                (2,0),(-2,0),(0,2),(0,-2)]