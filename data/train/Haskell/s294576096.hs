-- Generates the sequence of prime numbers.
-- Based on http://qiita.com/little_Haskeller/items/614a3ae20a517c19bb1f
primes :: Integral a => [a]
primes = map fromIntegral primes'
    where
        primes' = [2, 3, 5] ++ sieve2 5 7 (drop 2 primes')
        sieve2 m s (p : ps) = [n | n <- ns, gcd m n == 1] ++ sieve2 (m * p) (p * p) ps
            where ns = [x + y | x <- [s, s + 6 .. p * p - 2], y <- [0, 4]]

--  Judges whether the given integer is a prime number or not.
--  Based on https://wiki.haskell.org/Testing_primality
isPrime :: Integral a => a -> Bool
isPrime n = n > 1 && foldr (\p r -> p * p > n || ((mod n p) /= 0 && r)) True primes

smallerPrime :: Integral a => a -> a
smallerPrime n = maximum $ takeWhile (< n) primes

largerPrime :: Integral a => a -> a
largerPrime n
    | odd n  = head [p | k <- [2, 4 ..], let p = n + k, isPrime p]
    | even n = head [p | k <- [1, 3 ..], let p = n + k, isPrime p]

main :: IO ()
main = putStr . unlines . map unwords . map (map show) .
    map (\n -> [smallerPrime n, largerPrime n]) . map read . lines =<< getContents