import Text.Printf

ans :: (Double,Double) -> (Double,Double) -> (Double,Double) -> [Double]
ans (x1,y1) (x2,y2) (x3,y3) =
  -- (x1-xp)^2 + (y1-yp)^2 = a
  -- (x2-xp)^2 + (y2-yp)^2 = a
  -- (x3-xp)^2 + (y3-yp)^2 = a

  -- x1^2 - 2*x1*xp + xp^2 + y1^2 - 2*y1*yp + yp^2 = a
  -- x2^2 - 2*x2*xp + xp^2 + y2^2 - 2*y2*yp + yp^2 = a
  -- x3^2 - 2*x3*xp + xp^2 + y3^2 - 2*y3*yp + yp^2 = a

  -- x1^2-x2^2 - 2*(x1-x2)*xp + y1^2-y2^2 - 2*(y1-y2)*yp = 0
  -- x1^2-x3^2 - 2*(x1-x3)*xp + y1^2-y3^2 - 2*(y1-y3)*yp = 0

  -- A2 - B2 * xp + C2 - D2 * yp = 0
  -- A3 - B3 * xp + C3 - D3 * yp = 0

  -- A2*D3 - B2*D3*xp + C2*D3 - A3*D2 + B3*D2*xp - C3*D2 = 0
  -- xp = (A2*D3 + C2*D3 - A3*D2 - C3*D2) / (B2*D3-B3*D2)
  -- yp = (A2 + C2 - B2*xp) / D2

  let a2 = x1^2 - x2^2
      b2 = 2*(x1-x2)
      c2 = y1^2 - y2^2
      d2 = 2*(y1-y2)
      a3 = x1^2 - x3^2
      b3 = 2*(x1-x3)
      c3 = y1^2 - y3^2
      d3 = 2*(y1-y3)

      xp = (a2*d3 + c2*d3 - a3*d2 - c3*d2) / (b2*d3-b3*d2)
      yp = if d2 /= 0
           then (a2+c2-b2*xp) / d2
           else (a3+c3-b3*xp) / d3
      r  = sqrt ( (x1-xp)^2 + (y1-yp)^2 )
  in
    [xp,yp,r]

main = do
  c <- getContents
  let i = map (map read) $ map words $ drop 1 $ lines c :: [[Double]]
      o = map (\(x1:y1:x2:y2:x3:y3:_) -> ans (x1,y1) (x2,y2) (x3,y3)) i
  mapM_ (\x -> printf "%.3f %.3f %.3f\n" (x!!0) (x!!1) (x!!2) ) o