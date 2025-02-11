arrowJoin :: (r -> r -> a) -> r -> a
arrowJoin f x = f x x
