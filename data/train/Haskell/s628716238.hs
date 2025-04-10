import Text.Printf
import Control.Monad

len :: Int
len = 8

grid :: Int -> Int -> [Bool] -> Bool
grid x y dat = (dat!!((x-1)+(y-1)*len))

getfalse :: Int -> Int -> [Bool] -> [Bool]
getfalse x y dat = map edit [0..((length dat)-1)]
    where edit i = if i==((x-1)+(y-1)*len) then False 
                   else (dat!!i)

explode :: Int -> Int -> [Bool] -> [Bool]
explode x y dat
    | (x<1 || y<1 || x>len || y>len)  = dat --out of grid
    | grid x y dat                    =     --has bomb
        (explode (x+1) y) $ (explode (x+2) y) $  (explode (x+3) y) $ 
        (explode (x-1) y) $ (explode (x-2) y) $  (explode (x-3) y) $ 
        (explode x (y+1)) $ (explode x (y+2)) $  (explode x (y+3)) $
        (explode x (y-1)) $ (explode x (y-2)) $  (explode x (y-3)) $
        getfalse x y dat
    | otherwise                       = dat --no bomb

printres :: Int -> [Bool] -> IO ()
printres i res = do
    printf "Data %d:\n" i
    let s = map (\x->if x then '1' else '0') res
    let s' = map (\i -> drop (i*len) $ take ((i+1)*len) s) [0..(len-1)]
    mapM_ putStrLn s'

solve :: Int -> IO ()
solve i = do
    dummy<-getLine
    str<-replicateM len getLine 
    x<-readLn::IO Int
    y<-readLn::IO Int
    let dat = map (\x->(x=='1')) $ foldr (++) "" str
    printres i $ explode x y dat

main :: IO ()
main = do
    n_data<-readLn::IO Int
    mapM_ solve [1..n_data]