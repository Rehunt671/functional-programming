zipper_tail :: [a] -> [b] -> [(a, b)]
zipper_tail a b = zipper_tail_aux a b []
  where
    zipper_tail_aux [] _ res = reverse res 
    zipper_tail_aux _ [] res = reverse res  
    zipper_tail_aux (x:xs) (y:ys) res = zipper_tail_aux xs ys ((x, y) : res)  