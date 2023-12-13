module DLPDecoder where

-- Naive brute-force DLP solver
dlpDecoder :: Integer -> Integer -> Integer -> Maybe Integer
dlpDecoder g h p = dlpDecoder' g h p 1

dlpDecoder' :: Integer -> Integer -> Integer -> Integer -> Maybe Integer
dlpDecoder' g h p x
  | gExp == h  = Just x
  | x == p - 1 = Nothing
  | otherwise  = dlpDecoder' g h p (x + 1)
  where gExp = powMod g x p

-- Modular exponentiation
powMod :: Integer -> Integer -> Integer -> Integer
powMod base exp modulo = powMod' base exp modulo 1

powMod' :: Integer -> Integer -> Integer -> Integer -> Integer
powMod' base 0 modulo result = result
powMod' base exp modulo result = powMod' base (exp - 1) modulo ((result * base) `mod` modulo)