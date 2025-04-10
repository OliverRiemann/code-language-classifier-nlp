import Text.Printf
import Control.Monad
import Data.Char
import Data.List
import Debug.Trace

isXXX :: [Int]->(Int,Int,Int)->Bool
isXXX dat (a,b,c) = (dat!!a)==(dat!!b) && (dat!!a)==(dat!!c)

isXYZ :: [Int]->(Int,Int,Int)->Bool
isXYZ dat (a,b,c) = ((dat!!a)+1)==(dat!!b) && ((dat!!a)+2)==(dat!!c)

--has XXX or XYZ pattern
check'' :: [Int]->Bool
check'' []  = True
check'' dat = 
--    trace ("        check'' "++show dat) $
    or $ map hasXXXorXYZ $ comb
    where 
        hasXXXorXYZ (a,b,c)
            | (isXXX dat (a,b,c))||(isXYZ dat (a,b,c))  = check'' (dat' a b c)
            | otherwise                     = False
        comb = filter (\(a,b,c)->(a<b)&&(b<c)) [(a,b,c)|a<-nums,b<-nums,c<-nums]
        nums = [0..((length dat)-1)]
        dat' a b c = concat $ map (\i->if i/=a && i/=b && i/=c then [dat!!i] else []) [0..(length dat)-1]

--has XX pattern
check' :: [Int]->Bool
check' dat = 
--    trace ("    check' "++show dat) $
    or $ map hasXX [0..((length dat)-1-1)] 
    where
        hasXX n
            | dat!!n==dat!!(n+1)  = check'' ((take n dat)++(drop (n+2) dat))
            | otherwise           = False
            
--not more than 4
check :: [Int]->Int->Bool
check dat i =
--    trace ("check "++show dat++" "++show i) $
    if maxnums>4 then False else check' dat'
    where 
        dat' = sort (dat++[i])
        nums = map (\i->length i) $ map (\i->filter (==i) dat') [1..9]
        maxnums = last $ sort $ nums

solve :: [Int]->IO ()
solve dat = do
    let output = map (check dat) [1..9]
    let output' = concat $ map (\i->if output!!(i-1) then [i] else []) [1..9]
    let output'' = if null output' then [0] else output'
    let str = foldr (++) "" $ (map (\x->(show x)++" ") (init output'')) ++ [show $ last output'']
    putStrLn(str)

main :: IO ()
main = do
    s<-getContents :: IO String 
    mapM_ solve $ map (\x->map (\y->digitToInt(y)) x) $ lines $ s