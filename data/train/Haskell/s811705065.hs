emptyList :: [Int]
emptyList = replicate 9 0

add :: Int -> Int -> [Int] -> [Int]
add 1 x (a:d) = ((a+x):d)
add i x (a:d) = (a : add (i-1) x d)

get :: Int -> [Int] -> Int
get 1 (a:d) = a
get i (a:d) = get (i-1) d

readNums :: [Char] -> [Int]
readNums [] = emptyList
readNums (c:s) = add (read [c]) 1 $ readNums s

deletePung :: [Int] -> [Int]
deletePung s = add 1 (-3) s

deleteChow :: [Int] -> [Int]
deleteChow s = add 3 (-1) $ add 2 (-1) $ add 1 (-1) s

judge :: [Int] -> Bool
judge [] = True
judge (x:(y:(z:r)))
    | x>=3 && y>=1 && z>=1 = or [judge $ deletePung s, judge $ deleteChow s]
    | x>=1 && y>=1 && z>=1 = judge $ deleteChow s
    | x>=3 = judge $ deletePung s
    | x==0 = judge $ tail s
    | otherwise = False
    where s = (x:(y:(z:r)))
judge (x:s) 
    | x==0 = judge s
    | x>=3 = judge $ deletePung (x:s)
judge _ = False

checkAny :: [Int] -> Bool
checkAny [] = False
checkAny s = any (\i -> (get i s)>=2 && judge (add i (-2) s)) [1..9]

result :: [Int] -> [Int]
result s = filter (\i -> (get i s)<=3 && checkAny (add i 1 s)) [1..9]

resultStr str = if null s then "0" else unwords $ map show s
    where s = result $ readNums str

main = getContents >>= mapM putStrLn . map resultStr . lines
    