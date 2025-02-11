-- return a≫=f≡fa
Left Identity: return a >>= f ≡ f a
return a >>= f
-- return for Either is Right
Right a >>= f
-- definition of (>>=) for Right
f a

Right Identity: m >>= return ≡ m
-- Case 1: m = Right x
Right x >>= return
-- definition of (>>=)
return x
-- return for Either is Right
Right x

-- Case 2: m = Left e
Left e >>= return
-- definition of (>>=)
Left e

--Associativity: (m >>= f) >>= g ≡ m >>= (\x -> f x >>= g)
-- Case 1
(Left e >>= f) >>= g
-- definition of (>>=)
Left e >>= g
-- definition of (>>=)
Left e

Left e >>= (\x -> f x >>= g)
-- definition of (>>=)
Left e

-- Case 2
(Right x >>= f) >>= g
-- definition of (>>=)
f x >>= g

Right x >>= (\x -> f x >>= g)
-- definition of (>>=)
(\x -> f x >>= g) x
-- applying function
f x >>= g

  
