-- Identity Law
-- We need to show 
pure id <*> v = v
-- Left : 
= (\f g x -> f x (g x)) (const id) v x
= (const id x) (v x)
= id (v x)
= v x
--Right :
v x

-- Homomorphism Law
-- We need to show that:
pure f <*> pure x = pure (f x)
-- Left :
= (\f g x -> f x (g x)) (const f) (const x) r
= (const f r) ((const x) r)
= f (x)
-- Right :
= (const (f x)) r
= f x

-- Interchange Law
-- We need to show that:
u <*> pure y = pure ($ y) <*> u
-- Left :
= (\f g x -> f x (g x)) u (const y) r
= u r ((const y) r)
= u r y
-- Right :
= (\f g x -> f x (g x)) (const ($ y)) u r
= (const ($ y) r) (u r)
= ($ y) (u r)
= u r y

--Composition Law
pure (.) <*> u <*> v <*> w = u <*> (v <*> w)
-- Left :
= (\f g x -> f x (g x)) (const (.)) u r <*> v <*> w
= ((const (.) r) (u r)) <*> v <*> w
= ((.) (u r)) <*> v <*> w
= (\f g x -> f x (g x)) ((.) (u r)) v r <*> w
= (((u r) . (v r)) <*> w) r
= (\f g x -> f x (g x)) ((u r) . (v r)) w r
= ((u r) . (v r)) r (w r)
= (u r) ((v r) (w r))
--Right :
= (\f g x -> f x (g x)) u (\f g x -> f x (g x)) v w r
= u r ((\f g x -> f x (g x)) v w r)
= u r (v r (w r))
