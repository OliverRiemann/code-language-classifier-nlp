import qualified Data.IntMap.Lazy as M
import Data.IntMap.Lazy ((!))
import Data.Char
import Data.List

type Atlas = M.IntMap Bool
type Coordinate = Int
size = 12

main = interact $ unlines . map (show . num_of_island) . read' . lines
 where
  read' [] = []
  read' xs = read_atlas (concat (take size xs)) : read' (drop (size+1) xs)

num_of_island :: Atlas -> Int
num_of_island a = num_to_fix paint_island a

paint_island :: Atlas -> Atlas
paint_island a
 | or (M.elems a) = foldr (\i a' -> M.adjust not i a') a (contiguous_from start a)
 | otherwise = a
    where start = head $ M.keys $ M.filter id a

num_to_fix :: Eq a => (a -> a) -> a -> Int
num_to_fix f x = if f x == x then 0 else 1 + num_to_fix f (f x)

read_atlas :: String -> Atlas
read_atlas = M.fromList . zip [0..] . map to_boolean
 where to_boolean d = case d of {'0'->False; '1'->True}

contiguous_from :: Coordinate -> Atlas -> [Coordinate]
contiguous_from i a = M.keys $ M.filterWithKey (\i' _ -> are_contiguous i i' a) a

are_contiguous :: Coordinate -> Coordinate -> Atlas -> Bool
are_contiguous c1 c2 a = if a!c1 /= a!c2 then False else investigate c1 []
 where
  investigate c trace
   | c == c2 = True
   | a!c /= a!c2 = False
   | otherwise = or $ map (flip investigate (c:trace)) (neighbors c \\ trace) 

neighbors :: Coordinate -> [Coordinate]
neighbors c = filter (not . is_outside) [pred c, succ c, c-size, c+size]
 where
  is_outside c' = is_westout c' || is_eastout c' || is_northout c' || is_southout c'
   where
    is_westout c' = div c size == succ (div c' size) && c == succ c'
    is_eastout c' = div c size == pred (div c' size) && c == pred c'
    is_northout c' = c' < 0
    is_southout c' = c' >= size*size
  