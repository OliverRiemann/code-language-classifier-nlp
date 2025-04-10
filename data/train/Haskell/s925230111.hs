import           Control.Applicative
import           Control.Monad
import           Data.List           hiding (union)
import           Text.Printf

---------------------------------------------------------------------------
primesTME :: [Int]
primesTME = 2 : ([3,5..] `minus` foldt [[p*p,p*p+2*p..] | p <- primes_])
   where
     primes_ = 3 : ([5,7..] `minus` foldt [[p*p,p*p+2*p..] | p <- primes_])
     foldt ((x:xs):t)    = x : union xs (foldt (pairs t))
     pairs ((x:xs):ys:t) = (x : union xs ys) : pairs t               -- (* Treefold Merge Eratosthenes *)
----------------------------------------------------------------------------
primesTMWE :: [Int]
primesTMWE = 2:3:5:7: gaps 11 wheel (fold3t $ roll 11 wheel primes_)
  where
   primes_ = 11: gaps 13 (tail wheel) (fold3t $ roll 11 wheel primes_)     -- separate feed
   fold3t ((x:xs): ~(ys:zs:t)) = x : union xs (union ys zs)
                                      `union` fold3t (pairs t)              -- fold3t: 5% ~ 10% speedup
   pairs ((x:xs):ys:t)         = (x : union xs ys) : pairs t
   wheel = 2:4:2:4:6:2:6:4:2:4:6:6:2:6:4:2:6:4:6:8:4:2:4:2:
           4:8:6:4:6:2:4:6:2:6:6:4:2:4:6:2:6:4:2:4:2:10:2:10:wheel
   gaps k ws@(w:t) cs@ ~(c:u) | k==c  = gaps (k+w) t u              -- (*  better fold, w/ Wheel!   *)
                              | True  = k : gaps (k+w) t cs
   roll k ws@(w:t) ps@ ~(p:u) | k==p  = scanl (\c d->c+p*d) (p*p) ws
                                          : roll (k+w) t u
                              | True  = roll (k+w) t ps
----------------------------------------------------------------------------
minus :: [Int] -> [Int] -> [Int]
minus xs@(x:xt) ys@(y:yt) = case compare x y of
  LT -> x : minus xt ys
  EQ ->     minus xt yt
  GT ->     minus xs yt
minus a         b         = a

union :: [Int] -> [Int] -> [Int]
union xs@(x:xt) ys@(y:yt) = case compare x y of
  LT -> x : union xt ys
  EQ -> x : union xt yt
  GT -> y : union xs yt
union a         []        = a
union []        b         = b


main :: IO ()
main = mapM_ (print . process . read) . lines =<< getContents
  where
    process n = length $ takeWhile (<=n) primesTMWE
