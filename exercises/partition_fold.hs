partition :: (a -> Bool) -> [a] -> ([a], [a])
partition p = foldl (\(yes, no) x -> if p x then (x:yes, no) else (yes, x:no)) ([], [])
