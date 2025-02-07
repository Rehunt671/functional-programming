contains1 :: Ord a => a -> [a] -> Bool
contains1 = any . (<)

contains2 :: Ord a => [a] -> a -> Bool
