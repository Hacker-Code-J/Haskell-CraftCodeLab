-- Define a custom fold function (left fold)
customFold :: (b -> a -> b) -> b -> [a] -> b
customFold _ acc []     = acc
customFold f acc (x:xs) = customFold f (f acc x) xs

-- Example usage of customFold to find the sum of a list
sumList :: [Int] -> Int
sumList = customFold (+) 0

main :: IO ()
main = do
  let myList = [1, 2, 3, 4, 5]
  print $ sumList myList