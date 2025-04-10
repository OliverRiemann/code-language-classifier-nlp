import Data.Char
import Data.List
data PatTree = P { bodies :: [[Int]],
                   pieces :: [Int],
                   wastePiece :: [Int]} deriving Show

main = do
    pieces <- fmap (map (sort.map digitToInt).lines) getContents
    mapM_ (printResult.solve) pieces

printResult :: [Int] -> IO ()
printResult xs = if null xs then putStrLn "0"
                            else putStrLn.unwords.map show  $ xs
solve :: [Int] -> [Int]
solve ps = sort.nub.concat.map searchLastPiece.concat.map (foldl (>>=) [toPatTree (sort ps)]) $ patterns

toPatTree :: [Int] -> PatTree
toPatTree ints = P [] ints ps
    where ps = map snd.filter (\(a,b) -> a == 4) $ zip (map length.group $ ints) (nub ints)
addPattern :: PatTree -> [Int] -> PatTree
addPattern pattree pat = P (pat:bodies pattree) (pieces pattree \\ pat) (wastePiece pattree)

getOrder :: PatTree -> [PatTree]
getOrder pats = map (addPattern pats).searchOrder.pieces $ pats 
searchOrder xs = [ [x,y,z] | x <- xs', y <- xs' \\ [x], z <- xs' \\ [x,y], [x,y,z] == [x..x+2]]
    where xs' = nub xs

getTriple :: PatTree -> [PatTree]
getTriple pats = map (addPattern pats).searchTriple.pieces $ pats 
searchTriple xs = nub $ [[x,y,z] | x <- xs, y <- xs \\ [x], z <- xs \\ [x,y], x == y && y == z]

getHead :: PatTree -> [PatTree]
getHead pats = map (addPattern pats).searchHead.pieces $ pats 
searchHead xs = nub $ [[x,y] | x <- xs, y <- xs \\ [x], x == y]

patterns = [[a,b,c,d] | a <- [getTriple,getOrder], b <- [getTriple,getOrder], c <- [getTriple, getOrder], d <- [getTriple,getOrder]] ++ [[getHead,a,b,c] | a <- [getTriple,getOrder], b <- [getTriple,getOrder],c <- [getTriple, getOrder]]

searchLastPiece :: PatTree -> [Int] 
searchLastPiece pat = case length (pieces pat) of
                        1 -> lastHead pat
                        otherwise -> lastPiece pat

lastHead :: PatTree -> [Int] 
lastHead pat = if any (== (head.pieces $ pat)) (wastePiece pat) then []
                                                                else [head.pieces $ pat]

lastPiece :: PatTree -> [Int]
lastPiece pat = filter (\x -> 1 <= x && x <= 9).filter (not.flip elem (wastePiece pat)) $ n
    where n  
            | pieces pat == [i,i] = [i]
            | pieces pat == [i,i+1] = [i-1,i+2]
            | pieces pat == [i,i+2] = [i+1]
            | otherwise = []
          i = head.pieces $ pat
          j = i+1