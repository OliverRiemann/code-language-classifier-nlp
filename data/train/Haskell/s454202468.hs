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

-- a*x + b*y + c = 0 と d*x + e*y + f = 0の交点
cpl [a,b,c,d,e,f] =
  let x = (b*f - c*e) / (a*e - b*d) -- aex + bey + ce = 0, bdx + bey + bf = 0
      y = (a*f - c*d) / (b*d - a*e) -- adx + bdy + cd = 0, adx + aey + af = 0
  in
    if (a*e == b*d) || (b*d == a*e)
    then Nothing
    else Just (x,y)

-- 2点 (xa,ya) (xb,yb)を通る直線 ax+by+c=0
ln [xa,ya,xb,yb] =
  let a =  ya - yb
      b = -xa + xb
      c = (-ya+yb)*xa + (xa-xb)*ya
  in
    [a,b,c]
  
cp4 [xa,ya,xb,yb,xc,yc,xd,yd] =
  let lab = ln [xa,ya,xb,yb]
      lcd = ln [xc,yc,xd,yd]
  in
    cpl (lab ++ lcd)

ans [xa,ya,xb,yb,xc,yc,xd,yd] =
  let cross = cp4 [xa,ya,xc,yc,xb,yb,xd,yd] 
      [xo,xp] = sort [xa,xc]
      [xq,xr] = sort [xb,xd]
      [yo,yp] = sort [ya,yc]
      [yq,yr] = sort [yb,yd]
  in
    case cross of
      Nothing      -> "NO"
      Just (xx,yx) -> if (xo <= xx ) && (xx <= xp) && (xq <= xx) && (xx <= xr) &&
                         (yo <= yx ) && (yx <= yp) && (yq <= yx) && (yx <= yr)
                      then "YES"
                      else "NO"

main = do
  c <- getContents
  let i = map (map read) $ map (splitBy ',') $ lines c :: [[Float]]
      o = map ans i
  mapM_ putStrLn o


