import Control.Monad
import Data.List
import Data.Char
import Debug.Trace

abc :: [Char]
abc = map chr $ map (+(ord 'a')) [0..25]

coprime :: Int->Bool
coprime alpha = ((alpha`mod`2)/=0) && ((alpha`mod`13)/=0) && ((alpha`mod`26)/=0)

oneToOne :: Int->Int->Bool
oneToOne alpha beta = 26==(length $ nub $ map (affine alpha beta) abc)

correctAffine :: Int->Int->Bool
correctAffine alpha beta = (coprime alpha) && (oneToOne alpha beta)

affine :: Int->Int->Char->Char
affine alpha beta c = chr $ (alpha*((ord c)-(ord 'a'))+beta)`mod`26 + (ord 'a')

affineR :: Int->Int->Char->Char
affineR alpha beta c = head $ filter (\x->(affine alpha beta x)==c) abc

affineWord :: Int->Int->String->String
affineWord alpha beta word = map (affine alpha beta) word

affineWordR :: Int->Int->String->String
affineWordR alpha beta word = map (affineR alpha beta) word

wordsToStr :: [String]->String
wordsToStr [] = []
wordsToStr (x:xs) = if null xs then x else x++" "++(wordsToStr xs)

solve' :: [String]->[(Int,Int)]->String
solve' lwords ((a,b):xs)
    | (correctAffine a b)&&
      ((elem this lwords)||(elem that lwords)) = wordsToStr $ map (affineWordR a b) lwords
    | otherwise                                = solve' lwords xs
        where this = affineWord a b "this"
              that = affineWord a b "that"

solve str = do
    let lwords = words str
    putStrLn (solve' lwords $ foldr (++) [] $ [[(a,x)|a<-[1..(x-1)]]++[(x,b)|b<-[1..(x-1)]]++[(x,x)]|x<-[1..]])

main = do
    n <- readLn :: IO Int
    ss <- replicateM n getLine
    mapM_ solve ss