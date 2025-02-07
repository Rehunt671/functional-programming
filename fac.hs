fac :: Integral p => p -> p
fac n
  | n == 0    = 1
  | n > 0     = n * fac (n-1)
  | otherwise = error "negative number"
