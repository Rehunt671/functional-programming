facs :: [Integer]
facs = 1 : zipWith (*) [1..] facs