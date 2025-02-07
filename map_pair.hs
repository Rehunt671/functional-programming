mapPair :: (a -> b) -> (c -> d) -> (a, c) -> (b, d)
mapPair f g (x, y) = (f x, g y)