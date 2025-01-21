-- is this an appropriate definition of a functor for COp?
-- การใช้ fmap id กับฟังก์ชันควรจะไม่เปลี่ยนแปลงค่าของ functor แต่จาก fmap id (CVal c v) = CVal (c + 1) (id v) = CVal (c + 1) v
-- จะเห็นได้ว่า c เพิ่มขึ้นโดยที่ id ยังไม่ได้ทำไรเลย ซึ่งขัดแย้งกับกฎของ functor (identity law)

-- what if f = id?  what should we say about the number of transformations?
-- จะเห็นได้ว่าตัวนับ c เพิ่มขึ้น แม้ว่าจะไม่มี "การเปลี่ยนแปลง" จริง ๆ เกิดขึ้น 
-- นี่ทำให้การนับนี้หมายถึง "จำนวนครั้งที่ fmap ถูกเรียกใช้" แทนที่จะหมายถึง "จำนวนการเปลี่ยนแปลงที่แท้จริง"

--แนวทางการแก้ไข
-- ถ้าอยากให้ COp เป็น Functor ที่ถูกต้องตามกฎ functor ควรหลีกเลี่ยงการเพิ่มค่าของ c ใน fmap เมื่อไม่มีการเปลี่ยนแปลงเกิดขึ้น
-- instance Functor COp where
  -- fmap f (CVal c v) 
  --   | f == id   = CVal c v
  --   | otherwise = CVal (c + 1) (f v)



-- define a functor for (->) r:
import Prelude hiding (Functor, fmap)

class Functor f where
  fmap :: (a -> b) -> f a -> f b

instance Functor ((->) r) where
  fmap f g = \x -> f (g x)

-- ghci> let f = (+1)  -- f :: Int -> Int
-- ghci> let g = (*2)  -- g :: Int -> Int
-- ghci> let h = fmap f g  -- h :: Int -> Int
-- ghci> h 3  -- Result: 7
