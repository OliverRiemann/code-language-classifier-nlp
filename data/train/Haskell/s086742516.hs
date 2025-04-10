import Control.Monad

inGrid :: (Int,Int)->Bool
inGrid (x,y)
    | (0<=y&&y<9)&&(even y)&&(0<=x&&x<4) = True
    | (0<=y&&y<9)&&(odd y) &&(0<=x&&x<5) = True
    | otherwise                          = False

isWall grid (x,y)
    | (inGrid (x,y))&&(((grid!!y)!!x)=='1') = True
    | otherwise                             = False

solve :: [[Char]]->(Int,Int)->[Char]->[Char]
solve grid (i,j) (x:xs)
    | ((i,j)==(0,0)&&(x=='L'))||
       (i,j)==(0,1)&&(x=='U')            = (x:xs)
    --
    | (x=='R')&&(isWall grid (i+1,j-1))  = solve grid (i+1,j-1) ('U':x:xs)
    | (x=='R')&&(isWall grid (i+1,j))    = solve grid (i+1,j)   ('R':x:xs)
    | (x=='R')&&(isWall grid (i+1,j+1))  = solve grid (i+1,j+1) ('D':x:xs)
    | (x=='R')                           = solve grid (i,j)     ('L':x:xs)
    --
    | (x=='L')&&(isWall grid (i,j+1))    = solve grid (i,j+1)   ('D':x:xs)
    | (x=='L')&&(isWall grid (i-1,j))    = solve grid (i-1,j)   ('L':x:xs)
    | (x=='L')&&(isWall grid (i,j-1))    = solve grid (i,j-1)   ('U':x:xs)
    | (x=='L')                           = solve grid (i,j)     ('R':x:xs)
    --
    | (x=='D')&&(isWall grid (i,j+1))    = solve grid (i,j+1)   ('R':x:xs)
    | (x=='D')&&(isWall grid (i,j+2))    = solve grid (i,j+2)   ('D':x:xs)
    | (x=='D')&&(isWall grid (i-1,j+1))  = solve grid (i-1,j+1) ('L':x:xs)
    | (x=='D')                           = solve grid (i,j)     ('U':x:xs)
    --
    | (x=='U')&&(isWall grid (i-1,j-1))  = solve grid (i-1,j-1)  ('L':x:xs)
    | (x=='U')&&(isWall grid (i,j-2))    = solve grid (i,j-2)   ('U':x:xs)
    | (x=='U')&&(isWall grid (i,j-1))    = solve grid (i,j-1)   ('R':x:xs)
    | (x=='U')                           = solve grid (i,j)     ('D':x:xs)


main = do
    grid <- replicateM 9 getLine
    putStrLn $ reverse $ solve grid (0,0) ['R']