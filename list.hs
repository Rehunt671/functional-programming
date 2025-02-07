sumOfSquaresOfEvens :: [Int] -> Int
sumOfSquaresOfEvens xs = sum (map (^2) (filter even xs))
