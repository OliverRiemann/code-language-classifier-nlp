import Control.Applicative

type Dict = [Content]
type Content = (String, Int)

main = do
  word <- words <$> getLine
  let longest = searchMax $ addWordLens word []
      modeWord = searchMax $ addWords word []
  putStr $ fst modeWord
  putStr " "
  putStrLn $ fst longest

addWord :: String -> Dict  -> Dict
addWord word dict = case lookup word dict of
                         Nothing -> (word, 1) : dict
                         Just n -> (word, n+1) : dict

addWords :: [String] -> Dict -> Dict
addWords words dict = foldl (flip addWord) dict words
addWordLen :: String -> Dict -> Dict
addWordLen word dict = case lookup word dict of
                            Nothing -> (word, length word) : dict
                            Just n  -> dict

addWordLens :: [String] -> Dict -> Dict
addWordLens words dict = foldl (flip addWordLen) dict words

searchMax :: Dict -> Content
searchMax = foldl maxNum ("a",minBound)

maxNum :: Content -> Content -> Content
maxNum (a,na) (b,nb)
  | na >= nb = (a,na)
  | na <  nb = (b,nb)