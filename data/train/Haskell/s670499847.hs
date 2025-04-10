import Data.Char
import Data.Maybe
import Control.Applicative

orda :: Int
orda = ord 'a'
numOfAlp :: Int
numOfAlp = 26

charDiff :: Char -> Char -> Int
charDiff c0 c1 = let d = ord c0 - ord c1 in if d < 0 then d+numOfAlp else d

shiftChar :: Int -> Char -> Char
shiftChar n = chr . (+ orda) . (`mod` numOfAlp) . (+n) . subtract orda . ord

estimateShift :: String -> Int
estimateShift str =
        let _words = map (filter isAlpha) .  words $ str
            theCands = filter ((==3) . length) _words
            thisCands = filter ((==4) . length) _words
            theEst = estWith "the" theCands
            thisEst = estWith "this"  thisCands
            thatEst = estWith "that" thisCands
            in
                head $ catMaybes [theEst,thisEst,thatEst]

estWith :: String -> [String] -> Maybe Int
estWith word source = let
    shape = wordShape word
    in
        case filter ((== shape) . wordShape) source of
            [] -> Nothing
            (x:_) -> Just (ord (head x) - ord (head word))

decode :: Int -> String -> String
decode n = map (\c -> if isAlpha c then f c else c) where f = shiftChar n

wordShape :: String -> [Int]
wordShape [] = []
wordShape [_] = []
wordShape (x:xs) = map (charDiff x) xs

main = do
    str <- lines <$> getContents
    mapM_ (\l -> do
                let n = estimateShift l
                putStrLn . decode (-n) $ l
                ) str