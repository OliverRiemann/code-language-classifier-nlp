import Control.Applicative
import Control.Monad
import qualified Data.Array.Unboxed as A
import Data.Array.Unboxed ((!), (//))
import Data.List (foldl', unfoldr)
import qualified Data.ByteString.Char8 as BC
import qualified Data.ByteString.Lazy.Char8 as BLC

type Field = A.Array Loc Bool
type Loc = (Int, Int)
size :: Int
size = 8

bombArea :: Loc -> [Loc]
bombArea (x,y) = [
        (xi, y) | xi <- [max 0 (x-3) .. min (x+3) (size-1)], xi /= x
        ] ++ [(x, yi) | yi <- [max 0 (y-3) .. min (y+3) (size-1)]]

bomb :: Field -> Loc -> Field
bomb f l = let
    chain = filter (f !) . bombArea $ l
    burnt = f // zip chain (repeat False)
    in
        foldl' bomb burnt chain

readField :: [String] -> Field
readField = A.listArray ((0,0), (size-1,size-1))
    . map (toEnum . read . return) . concat
    
showField :: Field -> BLC.ByteString
showField = BLC.unlines . map BLC.concat
    . (takeWhile (not . null) . unfoldr (Just. splitAt size))
    . map (BLC.pack . show . (fromEnum :: Bool -> Int)) . A.elems

main = do
    n <- readLn
    answers <- replicateM n (do {_ <- getLine; solve})
    forM_ (zip answers [1..]) $ \(a,i) -> do
        putStrLn $ "Data " ++ show i ++ ":"
        BLC.putStr a

solve :: IO BLC.ByteString
solve = do
    field <- readField <$> replicateM size getLine
    y <- readLn
    x <- readLn
    return . showField . bomb field $ (x-1,y-1)