partition :: (a -> Bool) -> [a] -> ([a], [a])
partition _ [] = ([], [])
partition p (x:xs)
  | p x       = (x:l, r)
  | otherwise = (l, x:r)
  where (l, r) = partition p xs

  -- type of partition  = partition :: (a -> Bool) -> [a] -> ([a], [a])

-- partition จะรับ predicate และ list 1 list 
-- โดย partition จะแบ่ง list ออกเป็น 2 list 
-- list แรกสำหรับ element ที่ตรงตามเงื่อนไขของ predicate
-- list ที่สองสำหรับ element ที่ไม่่ตรงตามเงื่อนไขของ predicate

filter :: (a -> Bool) -> [a] -> [a]
filter p xs = fst (partition p xs)
