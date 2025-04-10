-- A Point in a Triangle
main = getContents >>= putStr . solve
--
solve :: String -> String
solve = unlines . map (isIn . toTuples . map read . words) . lines


cross :: (Float, Float) -> (Float, Float) -> Float
cross a b = (fst a) * (snd b) - (snd a) * (fst b)

toTuples :: [Float] -> [(Float, Float)]
toTuples [] = []
toTuples (x1:x2:xs) = (x1,x2) : toTuples xs

sub :: (Float, Float) -> (Float, Float) -> (Float, Float)
sub a b = (fst a - fst b, snd a - snd b)

--         C(x3,y3)
--        / \
--       /   \
--      /  P  \
--     /(xp,yp)\
--    A---------B
-- (x1,y1)   (x2,y2)
--
-- AB = b - a = (abx, aby) = (x2-x1, y2-y1)
-- BC = c - b = (bcx, bcy) = (x3-x2, y3-y2)
-- CA = a - c = (cax, cay) = (x1-x3, y1-y3)
-- BP = p - b = (bpx, bpy) = (xp-x2, yp-y2)
-- CP = p - c = (cpx, cpy) = (xp-x3, yp-y3)
-- AP = p - a = (apx, apy) = (xp-x1, yp-y1)
isIn :: [(Float, Float)] -> String
isIn [a,b,c,p]
  | counterClockWise || clockWise = "YES"
  | otherwise = "NO"
    where
      counterClockWise= cross (b `sub` a) (p `sub` b) > 0 && cross (c `sub` b) (p `sub` c) > 0 && cross (a `sub` c) (p `sub` a) > 0
      clockWise = cross (b `sub` a) (p `sub` b) < 0 && cross (c `sub` b) (p `sub` c) < 0 && cross (a `sub` c) (p `sub` a) < 0