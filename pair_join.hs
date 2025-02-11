pairJoin :: (r, (r, a)) -> (r, a)
pairJoin (x, (y, a)) = (x, a)
