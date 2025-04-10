import System.IO                                                                                                                                       
import Control.Monad                                                                                                                                   
main = do                                                                                                                                              
     end <- isEOF                                                                                                                                      
     when (not end) $ do                                                                                                                               
          rs <- getLine                                                                                                                                
          print $ length . show . sum . map (read::String->Int) $ words rs
          main