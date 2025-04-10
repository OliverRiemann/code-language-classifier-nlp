import Control.Monad
import Data.Char
import Data.Maybe

main = do
    n <- readLn
    replicateM n $ plus2num

plus2num = do
    [n1,n2] <- replicateM 2 getLine
    putStrLn $ fromMaybe "overflow" $ plusMaybe n1 n2

checkOverFlow :: String -> Maybe String
checkOverFlow str = if length str > 80 then Nothing else Just str

plusMaybe :: String -> String -> Maybe String
plusMaybe n1 n2 = do
    a <- checkOverFlow n1
    b <- checkOverFlow n2
    checkOverFlow $ plus a b

plus :: String -> String -> String
plus n1 n2 = reverse $ plus' 0 (reverse n1) (reverse n2)

plus' :: Int -> String -> String -> String
plus' carry [] []     = if carry == 0 then [] else intToDigit carry:[]
plus' carry (y:ys) [] = n : plus' (digitToInt c) [] ys
    where
        num = digitToInt y + carry
        [c,n] = if num < 10 then '0':show num else show num
plus' carry [] (y:ys) = n : plus' (digitToInt c) [] ys
    where
        num = digitToInt y + carry
        [c,n] = if num < 10 then '0':show num else show num
plus' carry (x:xs) (y:ys) = n:plus' (digitToInt c) xs ys
    where
        num = digitToInt x + digitToInt y + carry
        [c,n] = if num < 10 then '0':show num else show num