import Control.Applicative

dayCount [] = return ()
dayCount (x:xs) = do
  let day = (head xs) + case x of 0 -> 0
                                  1 -> 0
                                  2 -> 31
                                  3 -> 60
                                  4 -> 91
                                  5 -> 121
                                  6 -> 152
                                  7 -> 182
                                  8 -> 213
                                  9 -> 244
                                  10 -> 274
                                  11 -> 305
                                  12 -> 335
  if day == 0
    then return ()
    else case mod day 7 of 0 -> putStrLn "Wednesday"
                           1 -> putStrLn "Thursday"
                           2 -> putStrLn "Friday"
                           3 -> putStrLn "Saturday"
                           4 -> putStrLn "Sunday"
                           5 -> putStrLn "Monday"
                           6 -> putStrLn "Tuesday"

main = do
  input <- fmap (fmap (read :: String -> Int) . words) . lines <$> getContents
  mapM_ dayCount input