import Data.Array.IO
import Data.List.Split

main = do
    inks <- fmap (map (map read.splitOn ",").lines)getContents
    f <- newArray ((0,0),(9,9)) 0 :: IO (IOArray (Int,Int) Int)
    field <- dropInks f inks
    inkDepth <- getElems field
    print $ length.filter (== 0) $ inkDepth
    print $ maximum inkDepth

dropInks :: IOArray (Int,Int) Int -> [[Int]] -> IO (IOArray (Int,Int) Int)
dropInks field [] = return field
dropInks field (x:xs) = do
    field' <- dropInk field x
    dropInks field' xs

dropInk :: IOArray (Int,Int) Int -> [Int] -> IO (IOArray (Int,Int) Int)
dropInk f [x,y,size] = mapM_ (flip (modifyField f) (+1)) region >> return f
    where region = getRegion [x,y,size]
getRegion [x,y,n] = case n of
                 1 -> [(i,j) | i <- [x-1..x+1], j <- [y-1..y+1], abs (i-x) + abs (j-y) <= 1]
                 2 -> [(i,j) | i <- [x-1..x+1], j <- [y-1..y+1]]
                 3 -> [(i,j) | i <- [x-2..x+2], j <- [y-2..y+2], abs (i-x) + abs (j-y) <= 2]

modifyArray a i f = writeArray a i =<< fmap f (readArray a i)

modifyField :: IOArray (Int,Int) Int -> (Int,Int) -> (Int->Int) -> IO ()
modifyField field ix func = do
    bound <- getBounds field
    if ix `elem` range bound then modifyArray field ix func
                             else return ()

printField :: IOArray (Int,Int) Int -> IO ()
printField f = do
    es <- mapM (\i -> mapM (readArray f) [(x,y) | x <- [i], y <- [0..9]]) [0..9]
    mapM_ putStrLn $ map (unwords.map show) $ es