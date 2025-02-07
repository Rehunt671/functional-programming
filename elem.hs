
elem :: Eq a => a -> [a] -> Bool
elem _ [] = False
elem x (y:ys)
  | x == y    = True
  | otherwise = elem x ys

-- type of elem = elem :: Eq a => a -> [a] -> Bool


-- use fold
elem :: Eq a => a -> [a] -> Bool
elem x = foldr (\y acc -> (x == y) || acc) False
