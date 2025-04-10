import Data.Array.IO
import Data.Char
import System.IO
import Control.Monad
import Control.Applicative

{-
 - list から 1, 2 個選んで残りも一緒に返す
 - 2個選ぶときは順序付きのペアだとする (x,y) と (y,x) を一般に区別する
 - > one [1..6]
 - [(1,[2,3,4,5,6]),(2,[3,4,5,6,1]),(3,[4,5,6,2,1]),(4,[5,6,3,2,1]),(5,[6,4,3,2,1]),(6,[5,4,3,2,1])]
 - > two [1..6]
 - [(1,2,[3,4,5,6]),(1,3,[4,5,6,2]),(1,4,[5,6,3,2]),(1,5,[6,4,3,2]),(1,6,[5,4,3,2]),(2,3,[4,5,6,1]),(2,4,[5,6,1,3]),(2,5,[6,1,4,3]),(2,6,[1,5,4,3]),(2,1,[6,5,4,3]),(3,4,[5,6,2,1]),(3,5,[6,2,1,4]),(3,6,[2,1,5,4]),(3,2,[1,6,5,4]),(3,1,[2,6,5,4]),(4,5,[6,3,2,1]),(4,6,[3,2,1,5]),(4,3,[2,1,6,5]),(4,2,[1,3,6,5]),(4,1,[2,3,6,5]),(5,6,[4,3,2,1]),(5,4,[3,2,1,6]),(5,3,[2,1,4,6]),(5,2,[1,3,4,6]),(5,1,[2,3,4,6]),(6,5,[4,3,2,1]),(6,4,[3,2,1,5]),(6,3,[2,1,4,5]),(6,2,[1,3,4,5]),(6,1,[2,3,4,5])]
-}

one :: [a] -> [(a, [a])]
one xs = sub xs []
  where
    sub [] _ = []
    sub (x:xs) ac = (x, xs++ac) : (sub xs (x:ac))

two :: [a] -> [(a, a, [a])]
two [] = []
two [a] = []
two xs = do
  (x, rest) <- one xs
  do
    (y, rest) <- one rest
    return (x, y, rest)

data Expr = Val Int | Add Expr Expr | Sub Expr Expr | Mul Expr Expr
type Number = (Expr, Int)

eval :: Number -> Int
eval = snd

{-
 - n 個の Number に一回演算を適用して出来る (n-1) 個の Number を返す
 -}
apply :: [Number] -> [[Number]]
apply xs = concat $ do
  ((e, x), (f, y), rest) <- two xs
  return [
    (Add e f, x + y) : rest,
    (Sub e f, x - y) : rest,
    (Mul e f, x * y) : rest
    ]

{-
 - (bfs n xs) は xs に何度か apply を適用して
 - 評価結果が n になる Number を返す
 -}
bfs :: Int -> [[Number]] -> [Number]
bfs n [] = []
bfs n ([x] : rest) =
  (if (eval x) == n then [x] else []) ++ (bfs n rest)
bfs n (xs : rest) = bfs n (rest ++ (apply xs))

instance Show Expr where
  show (Val n) = show n
  show (Add e f) = "(" ++ show e ++ " + " ++ show f ++ ")"
  show (Sub e f) = "(" ++ show e ++ " - " ++ show f ++ ")"
  show (Mul e f) = "(" ++ show e ++ " * " ++ show f ++ ")"

toVal :: Int -> Number
toVal n = (Val n, n)

solve a b c d = do
  let anss = bfs 10 [[toVal a, toVal b, toVal c, toVal d]]
  if null anss
    then print 0
    else print $ fst $ head $ anss

main = do
  [a,b,c,d] <- (map read . words)<$>getLine :: IO [Int]
  if (minimum [a,b,c,d]) == 0
    then return ()
    else solve a b c d >> main