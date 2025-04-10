import Control.Monad
import Control.Applicative
import Control.Monad.State

type Weight = Int
type Counters = [Weight]
type WeightState = (Weight, Counters)

solve :: State WeightState Weight
solve = do
  (weight, counters) <- get
  if weight == 0
    then return weight
    else do
      case weight of
        weight | weight >= 2^9 -> put (weight - 2^9, 2^9 : counters)
               | weight >= 2^8 -> put (weight - 2^8, 2^8 : counters)
               | weight >= 2^7 -> put (weight - 2^7, 2^7 : counters)
               | weight >= 2^6 -> put (weight - 2^6, 2^6 : counters)
               | weight >= 2^5 -> put (weight - 2^5, 2^5 : counters)
               | weight >= 2^4 -> put (weight - 2^4, 2^4 : counters)
               | weight >= 2^3 -> put (weight - 2^3, 2^3 : counters)
               | weight >= 2^2 -> put (weight - 2^2, 2^2 : counters)
               | weight >= 2^1 -> put (weight - 2^1, 2^1 : counters)
               | weight >= 2^0 -> put (weight - 2^0, 2^0 : counters)
      solve

main = do
  contents <- (map (snd . (\x -> execState solve (x, [])) . (read :: String -> Int))) . lines <$> getContents
  putStr $ unlines $ map (unwords . (map show)) contents