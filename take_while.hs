take_while :: (a -> Bool) -> [a] -> [a]
take_while _ [] = []  
take_while predicate (x:xs)
    | predicate x = x : take_while predicate xs  
    | otherwise   = []                       

--type of take while = take_while :: (a -> Bool) -> [a] -> [a]
