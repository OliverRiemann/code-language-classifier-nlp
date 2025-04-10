import Data.List (permutations)

data ExprTree = Node Char ExprTree ExprTree
              | Leaf Int

main = do
    ns <- (map read . words) `fmap` getLine
    if all (==0) ns then return () else do
        putStrLn (solve ns)
        main

solve :: [Int] -> String
solve ns = toString' $ maybeHead $ filter equals10 $
            concatMap exprTrees $ permutations ns
    where
    toString' Nothing = "0"
    toString' (Just t) = toString t

    maybeHead [] = Nothing
    maybeHead (x:xs) = Just x

    equals10 t = evaluate t == 10

exprTrees :: [Int] -> [ExprTree]
exprTrees [n] = [Leaf n]
exprTrees ns = concatMap exprTrees' [1..(length ns - 1)]
    where exprTrees' p = [Node op left right|
                            let (nsLeft,nsRight) = splitAt p ns,
                            op <- ['+','-','*'],
                            left <- exprTrees nsLeft,
                            right <- exprTrees nsRight]

evaluate :: ExprTree -> Int
evaluate (Leaf value) = value
evaluate (Node '+' left right) = (evaluate left) + (evaluate right)
evaluate (Node '-' left right) = (evaluate left) - (evaluate right)
evaluate (Node '*' left right) = (evaluate left) * (evaluate right)

toString :: ExprTree -> String
toString (Leaf value) = show value
toString (Node op left right) =
    "(" ++ (toString left) ++ [' ',op,' '] ++ (toString right) ++ ")"