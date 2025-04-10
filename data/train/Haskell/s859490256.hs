import Control.Monad (replicateM,forM_)
import Control.Monad.ST (ST)
import Data.List.Split (splitOn)
import Data.Array (Array,assocs)
import qualified Data.Array.ST as STArr
 
type Weight = Int
type Price = Int
 
main = main' 1
    where
    main' cn = do
        mw <- read `fmap` getLine
        if mw == 0 then return () else do
            n <- read `fmap` getLine
            wps <- (map ((\[p,w]->(w,p)) . map read . splitOn ","))
                `fmap` replicateM n getLine
 
            let
               (aw,ap) = solve mw wps
 
            putStrLn ("Case " ++ (show cn) ++ ":")
            print ap
            print aw
             
            main' (cn+1)
 
solve :: Weight -> [(Weight,Price)] -> (Weight,Price)
solve mw wps = head $ filter (\(w,p) -> p == mp) wmps
    where
    wmps = assocs (maxPrices mw wps)
    mp = maximum $ map snd wmps

maxPrices :: Weight -> [(Weight,Price)] -> Array Weight Price
maxPrices mw wps = STArr.runSTArray $ do
    mpArr <- STArr.newArray (0,mw) 0
    forM_ wps (update mpArr)
    return mpArr

    where
    update mpArr (w,p) = do
        (_, mw) <- STArr.getBounds mpArr
        forM_ [mw-w,mw-w-1..0] update'

        where
        update' w0 = do
            p0 <- STArr.readArray mpArr w0
            p' <- STArr.readArray mpArr (w0+w)
            STArr.writeArray mpArr (w0+w) (max p' (p0+p))