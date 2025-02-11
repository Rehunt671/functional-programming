listAp :: [a -> b] -> [a] -> [b]
listAp fs xs = [f x | f <- fs, x <- xs]
