import Control.Monad.State
import Control.Monad.Reader
import Data.Array.IArray
import Data.Array.IO

data Direction = R | L | U | D  deriving (Eq, Show)
type Field = Array (Int, Int) [Direction]
type IOField = IOArray (Int, Int) [Direction]
type Walk a = StateT Direction (StateT (Int, Int) (ReaderT Field IO)) a

main = do
  field <- getField
  flip runReaderT field $ flip evalStateT (0,0) $ evalStateT walkStep R

modifyArray arr ix f = do
  e <- readArray arr ix
  writeArray arr ix (f e)

getField :: IO Field
getField = do
  field <- newArray ((0,0), (4,4)) []
  e <- getAssocs field
  input <- replicateM 9 getLine
  forM_ [0..3] $ \i -> do
    let i' = i*2
    horizonFill i (input !! i') field
    verticalFill i (input !! (i'+1)) field
  horizonFill 4 (input !! 8) field
  freeze field

horizonFill :: Int -> String -> IOField -> IO ()
horizonFill i flags field = do
  forM_ [0..3] $ \j -> do
    if flags !! j == '1'
       then modifyArray field (i,j) (R :) >> modifyArray field (i, j+1) (L:)
       else return ()

verticalFill :: Int -> String -> IOField -> IO ()
verticalFill i flags field = forM_ [0..4] $ \j -> do
  if flags !! j == '1'
     then modifyArray field (i,j) (D:) >> modifyArray field (i+1 ,j) (U:)
     else return ()

walkStep :: Walk ()
walkStep = do
  direction <- getDirection
  walkTo direction
  goal <- isGoalNow
  if goal then endStep
          else walkStep

getDirection :: Walk Direction
getDirection = do
  pos <- lift $ get
  field <- lift $ ask
  dir <- get
  return $ gd dir pos field

gd :: Direction -> (Int, Int) -> Field -> Direction
gd d (x,y) field = gd' priorityList walls
  where walls = field ! (x,y)
        priorityList = case d of
                            L -> [D, L, U, R]
                            R -> [U, R, D, L]
                            U -> [L, U, R, D]
                            D -> [R, D, L, U]

gd' :: [Direction] -> [Direction] -> Direction
gd' [] nextDs = error "invalid field"
gd' (d:ds) nextDs
  | d `elem` nextDs = d
  | otherwise = gd' ds nextDs


walkTo :: Direction -> Walk ()
walkTo d = printdir d >> (lift $ modify nextpos) >> put d
  where nextpos
            | d == L = \(x,y) -> (x,y-1)
            | d == R = \(x,y) -> (x,y+1)
            | d == U = \(x,y) -> (x-1,y)
            | d == D = \(x,y) -> (x+1,y)

printdir :: Direction -> Walk ()
printdir d = lift . lift . lift $ putStr.show $ d

isGoalNow :: Walk Bool
isGoalNow = do
  (x,y) <- lift get
  return $ x == 0 && y == 0

endStep :: Walk ()
endStep = lift.lift.lift $ putStrLn ""

