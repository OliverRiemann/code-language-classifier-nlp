import Data.List
import Data.List.Split

plus :: Int -> [Int] -> [Int] -> [Int] -> [Int]
plus (-1) _ _ zs = zs
plus n xs ys zs
  | elem n xs = plus (n-1) xs ys (((ys !! n) + 1):zs)
  | otherwise = plus (n-1) xs ys ((ys !! n):zs)

small :: Int -> Int -> [[Int]] -> [[Int]]
small x y xs = (take (y-1) xs) ++ (a:b:c:(drop (y+2) xs))
  where a = plus 13 [x] (xs !! (y-1)) []
        b = plus 13 [x-1,x,x+1] (xs !! y) []
        c = plus 13 [x] (xs !! (y+1)) []

regular :: Int -> Int -> [[Int]] -> [[Int]]
regular x y xs = (take (y-1) xs) ++ (a:b:c:(drop (y+2) xs))
  where a = plus 13 [x-1,x,x+1] (xs !! (y-1)) []
        b = plus 13 [x-1,x,x+1] (xs !! y) []
	c = plus 13 [x-1,x,x+1] (xs !! (y+1)) []

large :: Int -> Int -> [[Int]] -> [[Int]]
large x y xs = (take (y-2) xs) ++ (a:b:c:d:e:(drop (y+3) xs))
  where a = plus 13 [x] (xs !! (y-2)) []
	b = plus 13 [x-1,x,x+1] (xs !! (y-1)) []
	c = plus 13 [x-2,x-1,x,x+1,x+2] (xs !! y) []
	d = plus 13 [x-1,x,x+1] (xs !! (y+1)) []
	e = plus 13 [x] (xs !! (y+2)) []

solve :: [[Int]] -> [[Int]] -> [[Int]]
solve m [] = m
solve m ([x,y,z]:xs)
  | z == 3 = solve (small x y m) xs
  | z == 4 = solve (regular x y m) xs
  | z == 5 = solve (large x y m) xs

mkMap :: [[Int]]
mkMap = replicate 14 $ replicate 14 0

countZero :: [[Int]] ->	Int
countZero [] = 0
countZero (x:xs) = (length $ elemIndices 0 x) + countZero xs

mold :: [[Int]] -> [[Int]]
mold xs = mold' $ take 10 $ drop 2 xs
  where mold' [] = []
        mold' (x:xs) = (take 10 $ drop 2 x) : mold' xs

printAns :: [[Int]] -> IO ()
printAns xs = do
  print $ countZero xs
  print $ maximum $ map maximum xs

main = getContents >>= printAns . mold . solve mkMap . map (map ((+) 2 . read) . splitOn ",") . lines
