import Control.Monad.State
import Data.List.Split

type Dist = Double
type Angle = Int

main = do
    moveList <- getList []
    let (x,y) = evalState (moves moveList) ((0,0),90)
    print $ truncate x
    print $ truncate y

getList lst = do
    line <- getLine
    let [d,a] = splitOn "," line
        d' = read d :: Dist
        a' = read a :: Angle
    if d == "0" && a == "0" then return lst
                            else getList (lst ++ [(d',a')])


moves :: [(Dist,Angle)] -> State ((Double,Double),Angle) (Double,Double)
moves []         = move 0 0
moves ((d,a):ms) = move d a >>= \x -> moves ms
move :: Dist -> Angle -> State ((Double,Double),Angle) (Double,Double)
move d nextA = do
    (point,ang) <- get
    let newpoint = pursue d ang point
    put (newpoint,(ang - nextA) `rem` 360)
    return newpoint

pursue :: Dist -> Angle -> (Double,Double) -> (Double,Double)
pursue d ang (x,y) = (x',y')
    where
        x' = x + d * cos (fromIntegral ang*pi/180)
        y' = y + d * sin (fromIntegral ang*pi/180)