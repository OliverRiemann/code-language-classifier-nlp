import Control.Applicative
import Control.Monad
import Control.Monad.ST
import qualified Data.Vector.Unboxed as V
import qualified Data.Vector.Unboxed.Mutable as VM

-- haskell can be this iterative!
sieve :: Int -> V.Vector Bool
sieve upto = runST $ do
    s <- VM.replicate (upto+1) True
    VM.write s 0 False
    VM.write s 1 False
    forM_ [2..(ceiling.sqrt.fromIntegral $ upto)] $ \i -> do
        isP <- VM.read s i
        when isP $ forM_ [i*i, i*i+i..upto] (\n -> VM.write s n False)
    V.unsafeFreeze s

primes :: Int -> [Int]
primes = V.toList . V.map fst . V.filter snd . V.imap (,) . sieve

findRange :: Ord a => [a] -> a -> (a,a)
findRange (x:p@(y:_)) a = if x < a && not (y < a)
                              then (x, head . dropWhile (<= a) $ p)
                              else findRange p a

main = do
    let
        ps = primes 50100
        f = findRange ps
    getContents >>=
        mapM_ ((\(p0,p1) -> putStrLn . unwords . map show $ [p0,p1])
                . f . read) . lines