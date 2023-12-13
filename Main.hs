module Main where

import DLPDecoder (dlpDecoder)

main :: IO ()
main = do
    let g = 2     -- Example generator
    let h = 5     -- Example h value
    let p = 11    -- Example prime modulus
    case dlpDecoder g h p of
        Just x  -> putStrLn $ "Solution: x = " ++ show x
        Nothing -> putStrLn "No solution found."