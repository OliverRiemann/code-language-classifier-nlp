import Control.Applicative

import Data.List
    (elemIndex, intercalate, nub, sort)
    
import Data.Maybe
    (fromJust)
    
type Data = (Int, Int)

type Problem = ([Data], [Int])

type Result = [Int]

pull :: Int -> [Data] -> [Int] -> Maybe Int

pull q ds ss
    = do
        s <- lookup q ds
        i <- elemIndex s ss
        Just $ i + 1
        
solve :: Problem -> Result

solve (ds, qs)
    = [fromJust $ pull q ds ss | q <- qs] where
        ss = reverse $ sort $ nub $ snd $ unzip ds
        
split :: [String] -> String -> String -> [String]

split list token ""
    = list ++ [token]
    
split list token (x:xs)
    = if x == ','
        then split (list ++ [token]) "" xs
        else split list (token ++ [x]) xs
        
dinput :: [Data] -> IO [Data]

dinput list
    = do
        [p, s] <- map read <$> split [] "" <$> getLine
        if p /= 0 || s /= 0
            then dinput $ list ++ [(p, s)]
            else return list
            
qinput :: IO [Int]

qinput
    = map read <$> lines <$> getContents
    
main :: IO ()

main
    = do
        ds <- dinput []
        qs <- qinput
        putStrLn $ intercalate "\n" $ map show $ solve (ds, qs)