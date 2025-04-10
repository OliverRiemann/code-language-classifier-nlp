import Data.List (nub, intersect)
import Data.IntMap (insert, keys, (!), fromList)
 
main = interact $ unlines . casenum . map (show' . bombs_chain) . read' . tail . lines
 where
  read' = foldr (\(_:str) acc -> let (b,[x,y]) = splitAt 8 str in ((read x, read y), concat b) : acc) [] . groupAt 11
  show' = init . unlines . groupAt 8
  casenum = zipWith (++) (map (\n -> "Data " ++ show n ++ ":\n") [1..])
 
bombs_chain ((bx,by), board) = foldr (\p acc -> replace acc p '0') board bombed
 where
  pos = (by-1)*8 + bx-1
  bombed = make_shortcuts pos (blast_graph board) ! pos
  blast_graph = fromList . add_blast . coordinates
  add_blast cs = map (\c -> (c, filter (in_range c) cs)) cs
  coordinates board = [x | x<-[0..63], is_installed x board]
  is_installed ix board = board !! ix == '1'
  in_range ix bx
   | elem ix $ filter (\x -> div x 8 == div bx 8) [bx-3,bx-2,bx-1,bx,bx+1,bx+2,bx+3] = True
   | elem ix [bx-24,bx-16,bx-8,bx,bx+8,bx+16,bx+24] = True
   | otherwise = False

make_shortcuts v im = untilFix (make_shortcut v) im
make_shortcut v im = insert v new im
 where new = nub $ (im!v) ++ concatMap (im !) (intersect (keys im) (im!v))
 
untilFix f x = if f x == x then x else untilFix f (f x)
replace xs i r = foldr (\x acc -> if (i+1) + length acc == length xs then r:acc else x:acc) [] xs
 
groupAt n [] = []
groupAt n xs = take n xs : groupAt n (drop n xs)