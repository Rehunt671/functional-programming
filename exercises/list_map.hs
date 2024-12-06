import Data.Char

list_map :: (a -> b) -> [a] -> [b]
list_map _ [] = []  
list_map func xs = map func xs



-- type of list_map = list_map :: (a -> b) -> [a] -> [b]


list_map' :: (a -> b) -> [a] -> [b]
list_map' f xs = list_map_aux f xs []
  where
    list_map_aux :: (a -> b) -> [a] -> [b] -> [b]
    list_map_aux _ [] res = reverse res  
    list_map_aux f (x:xs) res = list_map_aux f xs (f x : res)  

-- เป็น tail recursion เนื่องจาก list_map_aux เรียกเป็นตอนสุดท้าย (หลังจากคำนวน (f x : res) ) เสร็จ


-- Test cases

-- list_map (*2) [1, 2, 3, 4, 5]
-- [2,4,6,8,10]

-- list_map toUpper "functional"
--"FUNCTIONAL"

-- list_map sum [[1, 2], [3, 4, 5], []]
-- [3,12,0]