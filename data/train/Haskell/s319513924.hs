main :: IO()
main = getContents >>= mapM_ (print . solve . read) . lines

solve :: Int -> Int
solve n | n < 100     = length $ takeWhile (<= n) primes
        | n < 1000    = (25 +)     . f $ [101, 103..n]
        | n < 10000   = (168 +)    . f $ [1001, 1003..n]
        | n < 100000  = (1229 +)   . f $ [10001, 10003..n]
        | n < 200000  = (9592 +)   . f $ [100001, 100003..n]
        | n < 300000  = (17984 +)  . f $ [200001, 200003..n]
        | n < 400000  = (25997 +)  . f $ [300001, 300003..n]
        | n < 500000  = (33860 +)  . f $ [400001, 400003..n]
        | n < 600000  = (41538 +)  . f $ [500001, 500003..n]
        | n < 700000  = (49098 +)  . f $ [600001, 600003..n]
        | n < 800000  = (56543 +)  . f $ [700001, 700003..n]
        | n < 900000  = (63951 +)  . f $ [800001, 800003..n]
        | n >= 999983 && n < 1000000 = 78498
        | n < 1000000 = (71724 +)  . f $ [900001, 900003..n]
    where f = length . (filter isPrime)

primes :: [Int]
primes = (2 :) . (3 :) . (5 :) . (7 :) $ filter isPrime [11, 13..] 

isPrime :: Int -> Bool
isPrime 2 = True
isPrime n
    | n < 2            = False
    | (n `mod` 2) == 0 = False
    | otherwise        = testDiv 3 n
    where testDiv :: Int -> Int -> Bool
          testDiv i n
              | i * i > n      = True
              | n `mod` i == 0 = False
              | otherwise      = testDiv (i + 2) n
