import Data.List
import Data.Maybe

-- Check if an element exists in a list
containsFive = 5 `elem` [1, 2, 3, 4, 5]

-- Find the index of an element in a list (returns Maybe Int)
index = elemIndex "banana" ["apple", "banana", "cherry", "date"]