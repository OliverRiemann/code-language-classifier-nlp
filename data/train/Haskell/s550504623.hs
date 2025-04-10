import Data.Text as T
import Data.Text.Encoding as E
import Data.ByteString (ByteString)

dummyInput :: String
dummyInput = "1819\n2003\n876\n2840\n"

rdrop :: Int -> [a] -> [a]
rdrop x y = Prelude.reverse (Prelude.drop x (Prelude.reverse y))

deleteReturnCode :: [Char] -> [Char]
deleteReturnCode x = rdrop 1 x

convertList :: Text -> [Int]
convertList x =
  let charcter = T.pack "\n"
  in Prelude.map convertInt (Prelude.map T.unpack (T.splitOn charcter x))

convertInt :: String -> Int
convertInt x = read x :: Int

sortHeight :: (Ord a) => [a] -> [a]
sortHeight [] = []
sortHeight [x] = [x]
sortHeight (x:xs) =
  let largeList = [a | a <- xs, a > x];
      smallList = [a | a <- xs, a <= x]
  in sortHeight smallList ++ [x] ++ sortHeight largeList

showTopThree :: (Ord a) => [a] -> [a]
showTopThree [] = []
showTopThree x = (Prelude.take 3 (Prelude.reverse x))

main :: IO ()
main = do
  inputData <- getContents
  mapM_ print (showTopThree (sortHeight (convertList (T.pack (deleteReturnCode inputData)))))

