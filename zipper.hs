zipper :: ([a], [b]) -> [(a, b)]
zipper ([], _) = []
zipper (_, []) = []
zipper ((x:xs), (y:ys)) = (x, y) : zipper (xs, ys)

-- type of zipper = zipper :: ([a], [b]) -> [(a, b)]