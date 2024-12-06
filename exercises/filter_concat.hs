filter_concat :: ([a] -> Bool) -> [[a]] -> [a]
filter_concat _ [] = [] 
filter_concat predicate (x:xs)
    | predicate x = x ++ filter_concat predicate xs  
    | otherwise   = filter_concat predicate xs      


-- non recursive version of filter_concat
filter_concat' :: ([a] -> Bool) -> [[a]] -> [a]
filter_concat' predicate lists = concat (filter predicate lists)


--type of filter concat = filter_concat :: ([a] -> Bool) -> [[a]] -> [a]



