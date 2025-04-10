import Data.List

commaToSpace :: String->String
commaToSpace "" = ""
commaToSpace (x:xs) = if x==',' then ' ':(commaToSpace xs) else x:(commaToSpace xs)

readCard :: String->[Int]
readCard str = map (\x->read x::Int) $ words $ commaToSpace str

--
fourcard :: [Int]->Bool
fourcard card = or $ map (\i->(length $ filter (==i) card)>=4) $ nub card

fullhouse :: [Int]->Bool
fullhouse card = ((c!!0)==(c!!1)&&(c!!1)==(c!!2)&&(c!!3)==(c!!4)) ||
                 ((c!!0)==(c!!1)&&(c!!2)==(c!!3)&&(c!!3)==(c!!4)) 
    where c = sort card

straight :: [Int]->Bool
straight card
    | h==1        = c==[1,2,3,4,5] || c==[1,10,11,12,13]
    | otherwise   = c==[h,h+1,h+2,h+3,h+4]
    where c = sort card
          h = head c

threecard :: [Int]->Bool
threecard card = or $ map (\i->(length $ filter (==i) card)>=3) $ nub card

twopair :: [Int]->Bool
twopair card = 2==(length $ filter (\i->(length $ filter (==i) card)==2) $ nub card)

onepair :: [Int]->Bool
onepair card = or $ map (\i->(length $ filter (==i) card)>=2) $ nub card
--

solve :: [Int]->IO ()
solve card = do
    if fourcard card then putStrLn "four card"
    else if fullhouse card then putStrLn "full house"
    else if straight card then putStrLn "straight"
    else if threecard card then putStrLn "three card"
    else if twopair card then putStrLn "two pair"
    else if onepair card then putStrLn "one pair"
    else putStrLn "null"

main = do
    ss <- getContents
    mapM_ solve $ map readCard $ lines ss