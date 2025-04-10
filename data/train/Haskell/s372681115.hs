import Data.List

main = interact $ unlines . map (show . enclose_pins . map read') . parse' . lines
 where
  parse' = splitBy (notElem ',') . takeWhile (/= "0")
  read' str = let [x,y] = map read (splitOn ',' str) in (x,y)

enclose_pins pins = length pins - length sides
 where sides = [(p1,p2)| p1<-pins, p2<-pins, p1<p2, are_counterparts p1 p2 (pins\\[p1,p2])]

are_counterparts (x1,y1) (x2,y2) xys =
 alleq $ filter (/= EQ) $ map (\(x,y) -> compare y (x * slope (x1,y1) (x2,y2) + intercept_y)) xys
  where
   alleq xs = and $ zipWith (==) xs (tail xs)
   intercept_y = snd $ intercept (x1,y1) (x2,y2)
  
slope (x1,y1) (x2,y2)
 | x2 == x1  = (y2-y1) / 1e-9
 | otherwise = (y2-y1) / (x2-x1)

intercept (x1,y1) (x2,y2) = (axis_x, axis_y)
 where
  axis_x = x1 - y1 / slope (x1,y1) (x2,y2)
  axis_y = y1 - x1 * slope (x1,y1) (x2,y2)

splitOn c xs
 | null xs = []
 | head xs == c = splitOn c (tail xs)
 | otherwise = (takeWhile (/= c)) xs : splitOn c (dropWhile (/= c) xs)

splitBy p xs
 | null xs = []
 | p (head xs) = splitBy p (tail xs)
 | otherwise = (takeWhile (not.p) xs : splitBy p (dropWhile (not.p) xs))