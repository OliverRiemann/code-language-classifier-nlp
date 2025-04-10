import Data.Array (Array,listArray,(!),elems,(//),accum)
import Data.Char (digitToInt)
import Data.List (sort,group)
import System.IO (isEOF)

main = do
    quit <- isEOF
    if quit then return () else do
        input >>= return . solve >>= output
        main

input :: IO [Int]
input = do
    line <- getLine
    return (map digitToInt line)

output :: [Int] -> IO ()
output [] = putStrLn "0"
output ns = putStrLn $ unwords $ map show ns

solve :: [Int] -> [Int]
solve ns = filter test' [1..9]
    where
    test' n = test (n:ns)

test :: [Int] -> Bool
test ns = not $ null $
    return (counts ns) >>= maxUnder 4 >>= matchPair >>= matchThree >>=
    matchThree >>= matchThree >>= matchThree

type Counts = Array Int Int

counts :: [Int] -> Counts
counts ns = listArray (1,9) [0,0..] //
            (map (\e->(head e, length e)) $ group $ sort ns)

maxUnder :: Int -> Counts -> [Counts]
maxUnder n cs
    | (maximum $ elems cs) <= n = [cs]
    | otherwise = []

matchPair :: Counts -> [Counts]
matchPair cs = concatMap ($ cs) (map match' [1..9])
    where
    match' n cs
        | cs!n >= 2 = [accum (-) cs [(n,2)]]
        | otherwise = []

matchThree :: Counts -> [Counts]
matchThree cs = concatMap ($ cs) [matchTriple, matchSeries]

matchTriple :: Counts -> [Counts]
matchTriple cs = concatMap ($ cs) (map match' [1..9])
    where
    match' n cs
        | cs!n >= 3 = [accum (-) cs [(n,3)]]
        | otherwise = []

matchSeries :: Counts -> [Counts]
matchSeries cs = concatMap ($ cs) (map match' [1..7])
    where
    match' n cs
        | cs!n >= 1 && cs!(n+1) >= 1 && cs!(n+2) >= 1
            = [accum (-) cs [(n,1),(n+1,1),(n+2,1)]]
        | otherwise = []