
--Left Identity
(return a >>= f) r
-- Expanding return for ((->) r), which is \_ -> a
((\_ -> a) >>= f) r
-- Expanding (>>=) for ((->) r)
(\r -> f ((\_ -> a) r) r) r
-- Evaluating (\_ -> a) r, which is just a
(\r -> f a r) r
-- Beta reduction
f a r

--Right Identity
f≫=return≡f
(f >>= return) r
-- Expanding (>>=) for ((->) r)
(\r -> return (f r) r) r
-- Expanding return for ((->) r), which is \_ -> f r
(\r -> (\_ -> f r) r) r
-- Beta reduction
(\r -> f r) r
-- Beta reduction
f r

-- Associativity
--Left
((f >>= g) >>= h) r
-- Expanding first (>>=)
((\r -> g (f r) r) >>= h) r
-- Expanding second (>>=)
(\r -> h (g (f r) r) r) r
-- Beta reduction
h (g (f r) r) r

--Right
(f >>= (\x -> g x >>= h)) r
-- Expanding (>>=)
(\r -> (\x -> g x >>= h) (f r) r) r
-- Beta reduction with x = f r
(\r -> (g (f r) >>= h) r) r
-- Expanding (>>=) inside
(\r -> (\r' -> h (g (f r) r') r') r) r
-- Beta reduction with r' = r
h (g (f r) r) r
