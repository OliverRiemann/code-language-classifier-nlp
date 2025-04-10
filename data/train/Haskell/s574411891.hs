import Data.List
import Text.Printf

xyToIndx n x y = x + y * n

setValue n x y v sq = (take i sq) ++ [v] ++ (drop (i+1) sq)
    where i = xyToIndx n x y

isFilled n x y sq = (sq!!(xyToIndx n x y))/=0

findPos :: Int->Int->Int->[Int]->(Int,Int)
findPos n x y sq
    | x<0               = findPos n (n-1) y sq
    | x>=n              = findPos n 0 y sq
    | y>=n              = findPos n x 0 sq
    | isFilled n x y sq = findPos n (x-1) (y+1) sq
    | otherwise         = (x,y)

buildSquare :: Int->Int->Int->Int->[Int]->[Int]
buildSquare n x y v sq
    | v==(n*n)  = sq
    | otherwise = buildSquare n x' y' v' $ setValue n x' y' v' sq
        where (x',y') = findPos n (x+1) (y+1) sq
              v' = v + 1

initSquare :: Int->[Int]
initSquare n = buildSquare n x y 1 sq
    where x = (n-1) `div` 2
          y = (n-1) `div` 2 + 1
          sq = setValue n x y 1 $ take (n*n) $ repeat 0

printSquare :: Int->[Int]->IO ()
printSquare n [] = return ()
printSquare n sq = do
    let sq' = take n sq
    let sq'' = drop n sq
    mapM_ (printf "%4d") sq'
    printf "\n"
    printSquare n sq''

solve :: Int -> IO ()
solve n = do
    printSquare n (initSquare n)

main = do
    str <- getContents 
    mapM_ solve $ takeWhile (/=0) $map (\x->read x::Int) $ lines $ str