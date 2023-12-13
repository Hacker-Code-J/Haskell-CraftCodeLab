-- Define a custom filter function
customFilter :: (a -> Bool) -> [a] -> [a]
customFilter _ []     = []
customFilter p (x:xs) | p x       = x : customFilter p xs
                      | otherwise = customFilter p xs

-- Example usage of customFilter
evenNumbers :: [Int] -> [Int]
evenNumbers = customFilter even

main :: IO ()
main = do
  let myList = [1, 2, 3, 4, 5]
  print $ evenNumbers myList
