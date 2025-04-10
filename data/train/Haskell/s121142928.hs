import Control.Monad
import Control.Applicative
import Data.List
import Data.Char
import Data.Maybe

main = interact $ unlines . map (show_rp . listToMaybe . expressions . filter isDigit) . init . lines

expressions ns = filter (\rp -> eval_rp rp == 10) $ concat $ (map exps op_combs) <*> num_combs
 where
  exps [op1,op2,op3] [n1,n2,n3,n4] =
   [[n1,n2,n3,n4,op1,op2,op3],
    [n1,n2,n3,op1,op2,n4,op3],
    [n1,n2,n3,op1,n4,op2,op3],
    [n1,n2,op1,n3,n4,op2,op3],
    [n1,n2,op1,n3,op2,n4,op3]]  
  op_combs = replicateM 3 "+-*"
  num_combs = permutations ns

eval_rp = eval_rp' []
 where
  eval_rp' acc [] = head acc
  eval_rp' acc (x:xs)
   | elem x ['1'..'9'] = eval_rp' (read [x] : acc) xs
   | x == '+' = eval_rp' (head (tail acc) + (head acc) : (tail (tail acc))) xs
   | x == '-' = eval_rp' (head (tail acc) - (head acc) : (tail (tail acc))) xs
   | x == '*' = eval_rp' (head (tail acc) * (head acc) : (tail (tail acc))) xs

show_rp = show_rp' []
 where
  show_rp' _ Nothing = "0"
  show_rp' acc (Just []) = head acc
  show_rp' acc (Just (c:cs))
   | elem c ['1'..'9'] = show_rp' ([c] : acc) (Just cs)
   | otherwise = show_rp' (("(" ++ head (tail acc) ++ [c] ++ head acc ++ ")") : (tail (tail acc))) (Just cs)
 