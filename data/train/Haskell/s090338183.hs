import Control.Applicative ((<$>), (<*>))
import Control.Monad
import Data.List

main :: IO ()
main = do
  xs <- getl $ wrds toInt
  unless (all (==0) xs) $ do
    putStrLn $ solve xs
    main

data Expr = N Int | Op Char Expr Expr

f1 :: [Char] -> [Int] -> Expr
f1 [o1,o2,o3] [n1,n2,n3,n4] = Op o2 (Op o1 (N n1) (N n2)) (Op o3 (N n3) (N n4))

f2 :: [Char] -> [Int] -> Expr
f2 [o1,o2,o3] [n1,n2,n3,n4] = Op o3 (Op o2 (Op o1 (N n1) (N n2)) (N n3)) (N n4)

f3 :: [Char] -> [Int] -> Expr
f3 [o1,o2,o3] [n1,n2,n3,n4] = Op o3 (Op o1 (N n1) (Op o2 (N n2) (N n3))) (N n4)

f4 :: [Char] -> [Int] -> Expr
f4 [o1,o2,o3] [n1,n2,n3,n4] = Op o1 (N n1) (Op o3 (Op o2 (N n2) (N n3)) (N n4))

f5 :: [Char] -> [Int] -> Expr
f5 [o1,o2,o3] [n1,n2,n3,n4] = Op o1 (N n1) (Op o2 (N n2) (Op o3 (N n3) (N n4)))

calc :: Expr -> Int
calc (N x) = x
calc (Op '+' l r) = calc l + calc r
calc (Op '*' l r) = calc l * calc r
calc (Op '-' l r) = calc l - calc r

instance Show Expr where
  show (N x) = show x
  show (Op o l r) = "("++ show l ++ [' ',o,' '] ++ show r ++ ")"

solve :: [Int] -> String
solve xs
  | null ls = "0"
  | otherwise = show . head $ ls
  where
    ls = filter ((== 10) . calc) [f [o1,o2,o3] ns | ns <- permutations xs, o1 <- "*+-", o2 <- "*+-", o3 <- "*+-", f <- [f1,f2,f3,f4,f5]]

toInt :: String -> Int
toInt s = read s

wrds :: (String -> a) -> String -> [a]
wrds f = map f . words

getl :: (String -> a) -> IO a
getl f = f <$> getLine