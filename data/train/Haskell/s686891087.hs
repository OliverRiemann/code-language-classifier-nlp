import Text.Printf
import Debug.Trace

ip::[Double]->[Double]->Double
ip a b = sum $ zipWith (*) a b

norm::[Double]->Double
norm a = (sum $ map (**2.0) a)**0.5

pos::(Double,[Double], [Double])->(Double,[Double], [Double])
pos (theta2, p2, p1) = 
--    trace ("pos  "++show (theta3', p3', p2')) $
--    trace ("cos  "++show ((ip p2 p1)/((norm p2)*(norm p1)))) $
--    trace ("ip   "++show (ip p2 p1)) $
--    trace ("norm "++show (norm p2, norm p1)) $
    (theta3', p3', p2')
    where 
        theta3' = theta2+acos((ip p2 p1)/((norm p2)*(norm p1)))
        p3' = [p2!!0+cos(theta3'), p2!!1+sin(theta3')]
        p2' = p2

theta1 = 0.0
theta2 = pi/2.0
p1 = [1.0, 0.0]
p2 = [1.0, 1.0]

pos'::Int -> [Double]
pos' 1 = p1
pos' 2 = p2
pos' n = p3' where (theta3', p3', p2') = last $ take (n-1) $ iterate pos (theta2,p2,p1)

solve::Int-> IO ()
solve n = do
    mapM_ (printf "%.2f\n") $ pos' n

main::IO ()
main=do
    str<-getContents::IO String
    mapM_ solve $ takeWhile (/=(-1)) $ map (\x->read x::Int) . lines $ str