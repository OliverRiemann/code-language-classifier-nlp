{-# LANGUAGE BangPatterns #-}
import Control.Monad
import Control.Applicative

addFixed :: [Int] -> [Int] -> [Int]
addFixed = iter 0 where
    iter s [] []
        | s == 0 = []
        | p == 0 = [q]
        | otherwise = [q,p]
        where (p,q) = s `divMod` 10
    iter s xs [] = iter s xs [0]
    iter s [] ys = iter s [0] ys
    iter !s (x:xs) (y:ys) = let
        (surp,n) = (x+y+s) `divMod` 10
        in n: iter surp  xs ys

f :: String -> String -> String
f n m = let
    n' = map (read . return) . reverse $ n
    m' = map (read . return) . reverse $ m
    in concatMap show . reverse $ addFixed n' m'

g :: String -> String -> String
g n m = let
    n' = read n :: Integer
    m' = read m :: Integer
    in show (n'+m')

main = do
    n <- readLn
    replicateM_ n $ do
        x <- reverse . map (read . return) <$> getLine
        y <- reverse . map (read . return) <$> getLine
        let s = concatMap show . reverse $ addFixed x y
        putStrLn $ if length s > 80
                        then "overflow"
                        else s