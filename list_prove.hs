return a >>= f
-- Definition of return for lists

--Left Identity
[a] >>= f
-- Definition of (>>=) for lists
[y | x <- [a], y <- f x]
-- Since x is only a, this simplifies to
[y | y <- f a]
-- Which is just f a
--Right Identity
xs≫=return≡xs

xs >>= return
-- Definition of return for lists
xs >>= (\x -> [x])
-- Definition of (>>=) for lists
[y | x <- xs, y <- [x]]
-- Expanding the list comprehension
[y | x <- xs, y <- [x]] = [x | x <- xs]
-- Which is just xs

-- Associativity (xs≫=f)≫=g≡xs≫=(\x→fx≫=g)
--Left hand
(xs >>= f) >>= g
-- Expanding the first (>>=)
[ y | x <- xs, y <- f x ] >>= g
-- Expanding the second (>>=)
[ z | y <- [y | x <- xs, y <- f x], z <- g y]
-- Flattening the nested list comprehension
[ z | x <- xs, y <- f x, z <- g y ]

--Right hand
xs >>= (\x -> f x >>= g)
-- Expanding (>>=) inside the lambda
xs >>= (\x -> [ z | y <- f x, z <- g y ])
-- Expanding the outer (>>=)
[ z | x <- xs, z <- [z | y <- f x, z <- g y]]
-- Flattening the nested list comprehension
[ z | x <- xs, y <- f x, z <- g y ]
