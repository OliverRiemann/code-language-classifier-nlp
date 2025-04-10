import Data.List

parse :: String -> [Int]
parse xs = case read ("(" ++ xs ++ ")") of
    (c1,c2,c3,c4,c5) -> [c1,c2,c3,c4,c5]

(<|>) :: Maybe a -> Maybe a -> Maybe a
Nothing <|> x = x
x       <|> _ = x

conditional :: a -> a -> Bool -> a
conditional x y b = if b then x else y

onePair :: [Int] -> Maybe String
onePair = conditional (Just "one pair") Nothing . any ((== 2) . length) . group

twoPair :: [Int] -> Maybe String
twoPair [c1,c2,c3,c4,c5] = conditional (Just "two pair") Nothing $ (c1 == c2 && c3 == c4) || (c1 == c2 && c4 == c5) || (c2 == c3 && c4 == c5)
twoPair _ = undefined

threeCard :: [Int] -> Maybe String
threeCard = conditional (Just "three card") Nothing . any ((== 3) . length) . group

straight :: [Int] -> Maybe String
straight (x:xs) = conditional (Just "straight") Nothing $ impl x xs
    where
        impl :: Int -> [Int] -> Bool
        impl _ [] = True
        impl 1 [10,11,12,13] = True
        impl y (z:zs)
            | succ y == z = impl z zs
            | otherwise   = False
straight _ = undefined

fullHouse :: [Int] -> Maybe String
fullHouse = conditional (Just "full house") Nothing . all ((\ x -> x == 2 || x == 3) . length) . group

fourCard :: [Int] -> Maybe String
fourCard = conditional (Just "four card") Nothing . any ((== 4) . length) . group

apply :: [(a -> b)] -> a -> [b]
apply fs x = map (\ f -> f x) fs

score :: [Int] -> Maybe String
score = foldr (<|>) Nothing . apply [fourCard , fullHouse , straight , threeCard , twoPair , onePair] . sort

solve :: [Int] -> IO ()
solve = putStrLn . maybe "null" id . score
    
main :: IO ()
main = getContents
    >>= mapM_ solve . map parse . lines