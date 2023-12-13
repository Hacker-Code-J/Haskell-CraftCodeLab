-- Generate a list of squares for numbers from 1 to 5
squares = [x^2 | x <- [1..5]]

-- Filter and transform a list
evenSquares = [x^2 | x <- [1..10], even x]

-- Cartesian product of two lists
cartesianProduct = [(x, y) | x <- [1, 2, 3], y <- ['a', 'b']]

-- List comprehension with a condition
positiveNumbers = [x | x <- [-5..5], x > 0]