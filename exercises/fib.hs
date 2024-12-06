fib :: (Integral a, Integral b) => a -> b
fib n
  | n < 0     = error "Input cannot be negative"
  | n == 0    = 0
  | n == 1    = 1
  | otherwise = fib (n - 1) + fib (n - 2)

-- type of fib = fib :: (Integral a, Integral b) => a -> b

-- how long does your fib take to compute fib n?

--ตอบ O(2^n) เนื่องจาก function call แต่ละรอบของ function fib จะ spawn function call 2 ครั้ง จาก fib (n - 1) + fib (n - 2) โดยเกิดแบบนี้ไปเรื่อยๆจนถึง base case 
-- โดยเนื่องจาก worst case คือ fib(n-1) ที่ฟังชั่นนี้จะถูกเรียกไปเรื่อยๆ n รอบ เกิดเป็น tree ของ function call ที่มีความสูง n และจำนวนการเรียกฟังก์ชันที่แต่ละระดับจะเพิ่มขึ้นเป็นสองเท่าไปเรื่อยๆ
-- ดังนั้นจะได้ว่าจะมีfunction call ประมาณ 2^n ครั้ง ดังนั้น time complexity fib = O(2^n)

--are you satisfied with the running time
--ตอบ ไม่พอใจเลย
--if not, what would you like to do to improve the efficiency?
--ตอบ ใช้ optimization technique ที่เรียกว่า memoization โดยจำ fib(n) ที่เคยคำนวนไปแล้วเวลาถูกคำนวนอีกก็เอาค่ามาใช้ได้เลย อาจจะ implement โดยใช้ map<int , long long int> ก็ได้
