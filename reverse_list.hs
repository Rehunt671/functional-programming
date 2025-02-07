join :: ([a], [a]) -> [a]
join ([], ys) = ys
join (x:xs, ys) = x : join (xs, ys)

rev :: [a] -> [a]
rev [] = []
rev (x:xs) = join (rev xs, [x])

-- type of rev = rev :: [a] -> [a]