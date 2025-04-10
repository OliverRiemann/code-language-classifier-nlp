combi :: Int -> Int -> Int
combi n s
    | s <= 45   = (combis !! (n - 1)) s
    | otherwise = 0
    where
        combi1 :: Int -> Int
        combi1 s1 = if elem s1 [0 .. 9] then 1 else 0
        combi2 s2 = sum [1 | k1 <- [0 .. 9], k2 <- [k1 + 1 .. 9], k1 + k2 == s2]
        combi3 s3 = sum [1 | k1 <- [0 .. 9], k2 <- [k1 + 1 .. 9], k3 <- [k2 + 1 .. 9], k1 + k2 + k3 == s3]
        combi4 s4 = sum [1 | k1 <- [0 .. 9], k2 <- [k1 + 1 .. 9], k3 <- [k2 + 1 .. 9],
            k4 <- [k3 + 1 .. 9], k1 + k2 + k3 + k4 == s4]
        combi5 s5 = sum [1 | k1 <- [0 .. 9], k2 <- [k1 + 1 .. 9], k3 <- [k2 + 1 .. 9],
            k4 <- [k3 + 1 .. 9], k5 <- [k4 + 1 .. 9],  k1 + k2 + k3 + k4 + k5 == s5]
        combi6 s6 = combi4 (45 - s6)
        combi7 s7 = combi3 (45 - s7)
        combi8 s8 = combi2 (45 - s8)
        combi9 s9 = combi1 (45 - s9)
        combis = [combi1, combi2, combi3, combi4, combi5, combi6, combi7, combi8, combi9]

main :: IO ()
main = interact $ unlines . map show . map (\[n, s] -> combi n s) . map (map read) . map words . takeWhile (/= "0 0") . lines