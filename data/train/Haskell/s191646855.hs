import Data.List.Split (splitOn)
import System.IO (isEOF)

newtype Point = Point (Double,Double)
newtype Vector = Vector (Double,Double)
data Direction = Leftward | Rightward deriving Eq

main = do
    quit <- isEOF
    if quit then return () else do
        input >>= return . test >>= output
        main

input :: IO [Point]
input = do
    line <- getLine
    let
        [x1,y1,x2,y2,x3,y3,x4,y4] = map read $ splitOn "," line
    return [Point (x1,y1), Point (x2,y2), Point (x3,y3), Point (x4,y4)]

output :: Bool -> IO ()
output b = putStrLn (if b then "YES" else "NO")

test :: [Point] -> Bool
test ps = ds `seq` (all (==Leftward) ds || all (==Rightward) ds)
    where
    ds = take (length ps) ds'
    ds' = directions vs'
    vs' = vectors ps'
    ps' = cycle ps

-- infinite points to infinite vectors
vectors :: [Point] -> [Vector]
vectors (p0:p1:ps) = vector p0 p1 : vectors (p1:ps)

vector :: Point -> Point -> Vector
vector (Point (ox,oy)) (Point (px,py)) = Vector (px-ox,py-oy)

-- infinite vectors to infinite directions
directions :: [Vector] -> [Direction]
directions (v0:v1:vs) = direction v0 v1 : directions (v1:vs)

direction :: Vector -> Vector -> Direction
direction (Vector (a,b)) (Vector (c,d))
    | a*d - b*c > 0.0 = Leftward
    | a*d - b*c < 0.0 = Rightward