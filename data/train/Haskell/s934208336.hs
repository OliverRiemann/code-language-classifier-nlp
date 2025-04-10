import System.IO (isEOF)

data Orientation = Horizontal | Vertical deriving Eq
data Direction = North | South | East | West
type Wall = (Int,Int,Orientation)

main = input >>= return . solve >>= output

input :: IO [String]
input = do
    quit <- isEOF
    if quit then return [] else do
        line <- getLine
        fmap (line:) input

output :: [Direction] -> IO ()
output = putStrLn . map toLetter
    where
    toLetter North = 'U'
    toLetter South = 'D'
    toLetter East  = 'R'
    toLetter West  = 'L'

solve :: [String] -> [Direction]
solve ls = ws `seq` trace ws (1,0) East [East]
    where
    ws = walls ls

    trace _  (0,0) _ ds = reverse ds
    trace ws pos   d ds = trace ws npos nd (nd:ds)
        where
        nd = nextDirection ws pos d
        npos = nextPosition pos nd

walls :: [String] -> [Wall]
walls = concat . zipWith bindLine [(y,o)|y<-[0..],o<-[Horizontal,Vertical]]
    where
    bindLine (y,o) cs = bindLine' 0 y o cs

    bindLine' x y o ""       =           []
    bindLine' x y o ('1':cs) = (x,y,o) : bindLine' (x+1) y o cs
    bindLine' x y o (_:cs)   =           bindLine' (x+1) y o cs

wallExists :: [Wall] -> (Int,Int) -> Direction -> Bool
wallExists ws (x,y) North = (x,y-1,Vertical) `elem` ws
wallExists ws (x,y) South = (x,y,Vertical) `elem` ws
wallExists ws (x,y) East  = (x,y,Horizontal) `elem` ws
wallExists ws (x,y) West  = (x-1,y,Horizontal) `elem` ws

turnsOrder :: Direction -> [Direction]
turnsOrder North = [West,North,East,South]
turnsOrder South = [East,South,West,North]
turnsOrder East  = [North,East,South,West]
turnsOrder West  = [South,West,North,East]

nextDirection :: [Wall] -> (Int,Int) -> Direction -> Direction
nextDirection ws (x,y) d = head $ filter (wallExists ws (x,y)) (turnsOrder d)

nextPosition :: (Int,Int) -> Direction -> (Int,Int)
nextPosition (x,y) North = (x,y-1)
nextPosition (x,y) South = (x,y+1)
nextPosition (x,y) East  = (x+1,y)
nextPosition (x,y) West  = (x-1,y)