import Data.List

splitBy :: Char -> String -> [String]
splitBy _ [] = []
splitBy a x =
  let s = takeWhile (/= a) x
      x'= dropWhile (/= a) x
  in
    if x' == []
    then [s]
    else s:(splitBy a $ drop 1 x')

four_card (c1:c2:c3:c4:c5:_) =
  ( c1==c2 && c2==c3 && c3==c4 ) ||
  ( c2==c3 && c3==c4 && c4==c5 )

full_house (c1:c2:c3:c4:c5:_) =
  ( ( c1==c2 ) && ( c3==c4 && c4==c5 ) ) ||
  ( ( c1==c2 && c2==c3 ) && ( c4==c5 ) )

straight c@(c1:c2:c3:c4:c5:_) =
  let r1 = take 5 [c1..]
      r2 = [1,10,11,12,13]
  in
    r1 == c || r2 == c

three_card c@(c1:c2:c3:c4:c5:_) =
  ( c1==c2 && c2==c3 ) ||
  ( c2==c3 && c3==c4 ) ||
  ( c3==c4 && c4==c5 )

two_pair c@(c1:c2:c3:c4:c5:_) =
  ( ( c1==c2 ) && ( ( c3 == c4 ) || (c4 == c5) ) ) ||
  ( ( c2==c3 ) && ( c4 == c5 ) )

one_pair c@(c1:c2:c3:c4:c5:_) =
  ( c1==c2 ) ||
  ( c2==c3 ) ||
  ( c3==c4 ) ||
  ( c4==c5 )

ans' x
  | four_card  x = "four card"
  | full_house x = "full house"
  | straight   x = "straight"
  | three_card x = "three card"
  | two_pair   x = "two pair"
  | one_pair   x = "one pair"
  | otherwise    = "null"

ans x = ans' $ sort x

main = do
  c <- getContents
  let i = map (map read) $ map (splitBy ',') $ lines c :: [[Int]]
      o = map ans i
  mapM_ putStrLn o
      