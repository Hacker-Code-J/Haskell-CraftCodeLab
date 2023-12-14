-- Define a data type for a binary tree
data Tree a = Empty | Node a (Tree a) (Tree a) deriving (Show, Eq)

-- Insert an element into a binary search tree
insert :: (Ord a) => a -> Tree a -> Tree a
insert x Empty = Node x Empty Empty
insert x (Node y left right)
    | x == y = Node y left right
    | x < y  = Node y (insert x left) right
    | x > y  = Node y left (insert x right)

-- Convert a list to a binary search tree
listToTree :: (Ord a) => [a] -> Tree a
listToTree = foldr insert Empty

-- Map a function over a binary tree
treeMap :: (a -> b) -> Tree a -> Tree b
treeMap _ Empty = Empty
treeMap f (Node x left right) = Node (f x) (treeMap f left) (treeMap f right)

-- Example usage
main :: IO ()
main = do
    let nums = [7, 2, 9, 1]
    let tree = listToTree nums
    print tree
    print $ treeMap (*2) tree
