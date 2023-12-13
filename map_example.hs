-- Define a custom map function
customMap :: (a -> b) -> [a] -> [b]
customMap _ []     = []
customMap f (x:xs) = f x : customMap f xs

-- Example usage of customMap
doubleList :: [Int] -> [Int]
doubleList = customMap (*2)

main :: IO ()
main = do
  let myList = [1, 2, 3, 4, 5]
  print $ doubleList myList