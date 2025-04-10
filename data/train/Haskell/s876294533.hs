data Tree a = Leaf a | Branch Char (Tree a) (Tree a) deriving Show

showTree :: Show a => Tree a -> String
showTree (Leaf x) = show x
showTree (Branch o t1 t2) = "(" ++ showTree t1 ++ " " ++ [o] ++ " " ++ showTree t2 ++ ")"

make :: [Tree Int] -> [Tree Int] -> [Tree Int]
make ts1 ts2 = concatMap (\ [t1,t2] -> [Branch '+' t1 t2 , Branch '-' t1 t2 , Branch '-' t2 t1 , Branch '*' t1 t2]) $ sequence [ts1 , ts2]

makeAllTree :: [Int] -> [Tree Int]
makeAllTree xs = abcd
    where
        abcd = concat $ [make abc d , make abd c , make acd b , make bcd a , make ab cd , make ac bd , make ad bc]
        abc = concat $ [make ab c , make ac b , make bc a]
        abd = concat $ [make ab d , make ad b , make bd a]
        acd = concat $ [make ac d , make ad c , make cd a]
        bcd = concat $ [make bc d , make bd c , make cd b]
        ab = make a b
        ac = make a c
        ad = make a d
        bc = make b c
        bd = make b d
        cd = make c d
        [a,b,c,d] = sequence [map Leaf xs]

calc :: Tree Int -> Int
calc (Leaf x) = x
calc (Branch '+' x y) = calc x + calc y
calc (Branch '-' x y) = calc x - calc y
calc (Branch '*' x y) = calc x * calc y
calc _ = error "cannot calc"

solve :: [Int] -> IO ()
solve = putStrLn . maybe "0" showTree . foldr (\ x y -> case x of Nothing -> y ; z -> z) Nothing . map (\ t -> if calc t == 10 then Just t else Nothing) . makeAllTree

main :: IO ()
main = getContents
    >>= return . takeWhile (/= [0,0,0,0]) . map (map read) . map words . lines
    >>= mapM_ solve